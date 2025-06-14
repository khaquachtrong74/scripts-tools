#!/bin/bash
let i=0 # define counting variable
W=() # define working array
while read -r line; do # process file by file
    let i=$i+1
    W+=($i "$line")
done < <( ls -1 ./Audio )
while true; do
    FILE=$(dialog --title "List file of directory /home" --menu "Choose one" 24 80 17 "${W[@]}" 3>&2 2>&1 1>&3)
    RESULT=$?
    clear

    if [ $RESULT -eq 0 ]; then
        mpg123 ./Audio/"${W[$((FILE * 2 -1))]}"
    else
        break  
    fi
done

# need mpg123 dialog packages
