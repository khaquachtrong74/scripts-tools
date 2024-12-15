#!/usr/bin/env python3
n=int(input("Nhap n ky tu de doc trong file"))
file = open("file.txt", "r")
print(file)
file1 = file.readlines()
# for i in file1:
#     print(i)
file1.append("Hohohoh")
print(file1)
print(file.readlines())
for i in file.readlines():
    print(i)