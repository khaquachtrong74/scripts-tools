#!/bin/bash

# bài 3

# find [thư mục_bắt_đầu] [tùy chọn] [điều kiện]
# iname teen file gần đúng (không phân biệt chữ hoa, chữ thường)
# -name "*substring*substring": chuỗi con trong tên 
# -size +100M: file lớn hơn 100mb

read -p "Nhap ten file can tim" nameFile
if [ -z "$nameFile" ]
then    
    echo "Ten file khong duoc de trong"
fi
if [ $# -eq 0 ]
then
    echo "Vui long cung cap ten thu muc de kiem tra"
fi

echo "Tim kiem file '$nameFile'... "
# 2>dev>null: chuyển luồng lỗi vào thiết bị rỗng
# Mọi dữ liệu được gửi vào đấy đều bị loại bỏ
result=$(find $HOME -type f -name "nameFile" 2>dev>null)
if [ -z "$result" ]
then
    echo "FIle '$nameFile' khogn tim thay"
else
    echo "Da tim thay '$nameFile' file tai: $result "
fi