#!/bin/bash

read -p "NHap path" path
# if [ -z "$path" ]
# then
#     echo "Path khong duoc de trong"
# fi

while [ -z "$path" ]
do 
    echo "Path khong duoc de trong"
    read -p "Nhap path lai" path
done

if [ -x "$path" ]
then
    #read -p "Ban co muon cap quyen cho $path" ans
    #or
    echo "Ban co muon cap quyen cho $path:"
    IFS= read -r ans
    if [ "$ans" == "Y" ] || [ "$ans" == 'y' ]
    then
        chmod +x "$path"
    fi
fi