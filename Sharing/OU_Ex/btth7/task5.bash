#!/bin/bash
#Liet ke taat ca cac tap tin co trong thu muc

read -p "Nhap path cua thu muc muon doc" path
if [ ! -d "$path" ]; then
    echo "Thu muc khong ton tai"
    exit 1
fi
# find "$path" -type f or
# -v: sẽ hiện các dòng không khớp
# ^d: bắt đầu dòng "Ctrl -d" dùng để liệt kê tất cả các file
ls -l "$path" | grep -v '^d'

# dùng để liệt kê tất cả các thư mục
ls -l "$path" | grep -v '^-'

# Không nên dùng ls | grep thay vào đó dùng loop với điuề kiện

#Hợp lý
# Phuowng pháp xoá tất cả các tập tin trong thư mục hiện tại
# ngoại trừ các tập tin có đuôi .txt
shopt -s extglob # bật phần mở rộng glob
rm -- !(*.txt)   # xoá tất cả tập tin !0 .txt

#Phương pháp 3
#Posix
for f in ./*; do
    case $f in
    # bỏ qua các tập tin .txt
    *.txt) true ;;
    *) rm "$f" ;; #còn lại xoá
    esac
done
