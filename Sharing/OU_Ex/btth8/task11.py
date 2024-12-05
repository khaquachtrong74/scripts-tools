#!/usr/bin/env python3
chuoi1 = "Tri tue nhan tao ngay nay co the thay the con nguoi trong mot so cong viec nhat dinh."
chuoi2 = "con nguoi ngay nay"

tach_tu=chuoi2.split()
chuoi_moi=""
for word in chuoi1.split():
    if word not in tach_tu:
        chuoi_moi+= word + " "
print(chuoi_moi)