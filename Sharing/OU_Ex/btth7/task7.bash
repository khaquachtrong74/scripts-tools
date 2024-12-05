#!/bin/bash

read -p "Nhap thu muc: " thuMuc
read -p "Nhap loai tap tin can xoa: " loaiTapTin

file=$(find "/$HOME/$thuMuc" -type f -name "*.$loaiTapTin" 2>dev >null)
if [ -z "$file" ]; then
    echo "Khong co file $loaiTapTin"
    exit 0
fi

#POSIX

for f in ./$HOME/$thuMuc; do
    case $f in
    *."$loaiTapTin") rm "$f" ;;
    esac
    # hay ta có thể dùng [[ ]] để so sánh pattern mà [] không làm được
    if [[ $f == *.$loaiTapTin && -f "$f" ]]; then
        rm "$f"
    fi

done
