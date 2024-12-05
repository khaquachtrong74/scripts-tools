#!/bin/bash
# bài 8-9

read -p "Moi ban nhap folder: " path

if [ ! -f "$path" ]; then
	echo "File khong ton tai."
	exit 1
fi

cat /$HOME/$path