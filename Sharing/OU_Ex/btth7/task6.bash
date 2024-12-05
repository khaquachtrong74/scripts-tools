#!/bin/bash

read -p "Nhap so luong file" soLuongFile
read -p "Nhap ten file" tenFile

for i in $(seq 1 $soLuongFile)
do
    touch "$tenFile$i.txt"
done