#!/bin/bash

if [ $# -eq 0 ]
then 
    echo "Vui long cung cap ten file"
    exit 1
fi

fileName="$1"
if [ -f "$fileName" ]
then
    echo "$fileName da ton tai"
    if [ -r "$fileName" ]
    then
        echo "$fileName co quyen doc"
    fi
    if [ -w "$fileName" ]
    then 
        echo "$fileName co quyen ghi"
    fi
    if [ -x "$fileName" ]
    then 
        echo "$fileName co quyen thuc thi"
    fi

    #Hiện thị thông tin chi tiết về tập
    echo "Kích thước : $(du -h "$fileName" | cut -f1)"
    echo "Loại tập tin: $(file -b "$fileName")"
    exit 0
else 
    echo "$fileName chua ton tai"
    exit 1
fi