#!/bin/bash

# Đây là script giúp chạy các file audio
# Dùng dialog để tạo giao diện trên terminal 
# Nhằm giúp cho user tương tác tốt hơn

# Tất nhiên bạn cũng cần phải cài dialog về
input=$(dialog --title "CHOICE YOUR AUDIO WANT TO PLAY!" --fselect $HOME/Audio/ 20 100 3>&1 1>&2 2>&3)

clear
if [ -f "$input" ]; then
	mpg123 "$input"
	dialog --title "RUNNING AUDIO $input" 40 40
else
	echo "File doesn't exit!"
fi 
