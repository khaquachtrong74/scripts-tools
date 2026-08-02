#!/bin/bash

set -uo pipefail

: "${KAGGLE_USER_NAME:?Please export KAGGLE_USER_NAME}"

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
BLUE="\033[0;34m"
RESET="\033[0m"

tmp=$(mktemp)
out=$(mktemp)

trap 'rm -f "$tmp" "$out"' EXIT


kaggle kernels list \
    --user="$KAGGLE_USER_NAME" \
    --csv > "$tmp"


get_col() {
    local name="$1"

    awk -F',' -v col="$name" '
    NR==1 {
        for(i=1;i<=NF;i++) {
            gsub(/"/,"",$i)
            if(tolower($i)==tolower(col)) {
                print i
                exit
            }
        }
    }
    ' "$tmp"
}


REF_COL=$(get_col "ref")

TIME_COL=$(get_col "lastRunTime")
[[ -z "$TIME_COL" ]] && TIME_COL=$(get_col "lastRun")
[[ -z "$TIME_COL" ]] && TIME_COL=$(get_col "lastUpdated")


TOTAL=$(( $(wc -l < "$tmp") - 1 ))

if (( TOTAL <= 0 )); then
    echo "No kernels found"
    exit 0
fi


format_time() {
    printf "%02d:%02d:%02d" \
        $(( $1 / 3600 )) \
        $(( ($1 % 3600) / 60 )) \
        $(( $1 % 60 ))
}


progress() {
    local current=$1
    local total=$2
    local start=$3

    local now elapsed percent filled empty
    now=$(date +%s)
    elapsed=$((now-start))

    if (( elapsed > 0 )); then
        speed=$(awk "BEGIN {printf \"%.2f\", $current/$elapsed}")
        eta=$(awk "BEGIN {printf \"%.0f\", ($total-$current)/($current/$elapsed)}")
    else
        speed="0.00"
        eta=0
    fi

    percent=$((current*100/total))

    filled=$((percent*40/100))
    empty=$((40-filled))

    printf "\rChecking kernels ["

    printf "%${filled}s" | tr ' ' '#'
    printf "%${empty}s" | tr ' ' '-'

    printf "] %3d%% (%d/%d) | %s it/s | ETA %s | Time %s" \
        "$percent" \
        "$current" \
        "$total" \
        "$speed" \
        "$(format_time "$eta")" \
        "$(format_time "$elapsed")"
}


start=$(date +%s)

count=0


while IFS= read -r line; do

    ref=$(awk -F',' -v c="$REF_COL" '
    {
        gsub(/"/,"",$c)
        print $c
    }' <<< "$line")


    last="-"

    if [[ -n "$TIME_COL" ]]; then
        last=$(awk -F',' -v c="$TIME_COL" '
        {
            gsub(/"/,"",$c)
            print $c
        }' <<< "$line")
    fi


    status=$(kaggle kernels status "$ref" 2>/dev/null \
        | awk -F'"' 'END{print $2}')

    [[ -z "$status" ]] && status="unknown"


    case "$status" in
        running) color=$BLUE ;;
        queued) color=$YELLOW ;;
        complete) color=$GREEN ;;
        error|failed) color=$RED ;;
        *) color=$RESET ;;
    esac


    printf "%s\t${color}%s${RESET}\t%s\n" \
        "$ref" \
        "$status" \
        "$last" >> "$out"


    count=$((count+1))

    progress "$count" "$TOTAL" "$start"


done < <(tail -n +2 "$tmp")


echo
echo


{
    printf "KERNEL\tSTATUS\tLAST RUN\n"
    cat "$out"
} | column -t -s $'\t'
