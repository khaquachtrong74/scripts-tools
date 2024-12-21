#!/bin/bash

path="/$HOME/Audio"
FILES=("$path"/*) # Array list of audio
SOCKET="/tmp/mpvsocket"
HISTORY=()
CURRENT_INDEX=0

start_mpv(){
	echo "Start mpv ..."
	mpv --idle --input-ipc-server="$SOCKET" --no-video &
	sleep 1
}
send_command(){
	local cmd=$1
	echo "$cmd" | socat - "$SOCKET"
}


play_next(){
	if [ $CURRENT_INDEX -lt ${#FILES[@]} ]
	then
		echo "PLAYING: ${FILES[$CURRENT_INDEX]}"
		send_command "loadfile \"${FILES[$CURRENT_INDEX]}\""
		#echo "GO: ${FILE[$CURRENT_INDEX]}"
		CURRENT_INDEX=$((CURRENT_INDEX+1))
	else
		echo "END AUDIO."
	fi
	
}

play_prev(){
	if [ $CURRENT_INDEX -gt 1 ] 
	then
		CURRENT_INDEX=$((CURRENT_INDEX-2))
		play_next
	else
		echo "YOU ARE IN FIRST AUDIO, CANNOT PLAY PREV"
	fi
}
start_mpv

while true
do
	echo "================================"
	echo "[n]->NEXT | [p]->prev | [q]->quit"
	read -n 1 -s action
	echo ""
	case $action in
		n) play_next ;;
		p) play_prev;;
		q) send_command "quit"; echo "END PROGRAM."; break;;
		*) echo "Invalid Choice, pls try again!"
	esac
done
