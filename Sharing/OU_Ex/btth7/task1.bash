#!/bin/bash

# Kiểm tra xem đối số có được truyền vào không
if [ $# -eq 0 ];
then 
    echo "Lỗi: Vui lòng cung cấp tên thư mục để kiểm tra"
    exit 1
fi
directory="$1"
# Kiểm tra thư mục có tồn tại không
if [ -d "$directory" ]
then
    echo "Thu muc '$directory' da ton tai"
    exit 0
else
    echo "Thu muc '$directory' khong ton tai"
    exit 1
fi