#!/bin/bash
function move(){
if [ $1 -eq 0 ]; then
	mv *.mp3 ./Audio
fi

}
if [ $# -lt 1 ];then
	echo "Usage: $0 <url_from_watch?v>"
	exit 1
fi

yt-dlp -x --audio-format mp3 --audio-quality 0 "$1"
move $?
if [ $? -ne 0 ]; then
	python3.8 -m yt_dlp -x --audio-format mp3 --audio-quality 0 "$1"
	move $?
fi

