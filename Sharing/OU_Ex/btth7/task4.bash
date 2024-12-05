#!/bin/bash

read -p "Nhap ten file" fileName

if [ -z "$fileName" ]
then
    echo "Ten file khong duoc bo trong"
fi
if [[ "$fileName" != *.*  ||  "$fileName" == *. ]]
then 
    echo "Ten file phai bao gom phan mo rong hop le"
fi

if [ $# -eq 0 ]
then
    echo "Vui long cung cap ten thu muc de kiem tra"
fi

echo "Tim kiem file '$fileName'... "
# 2>dev>null: chuyển luồng lỗi vào thiết bị rỗng
# Mọi dữ liệu được gửi vào đấy đều bị loại bỏ
result=$(find $HOME -type f -name "fileName" 2>dev>null)
if [ -z "$result" ]
then
    echo "FIle '$fileName' khogn tim thay"
else
    echo "Da tim thay '$fileName' file tai: $result "
fi