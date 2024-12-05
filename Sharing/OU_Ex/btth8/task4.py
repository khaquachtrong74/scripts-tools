#!/user/bin/env python3

# Chương trình tìm số lớn nhất từ 3 số được nhập

so1=int(input("Nhập số1  vào đây "))
so2=int(input("Nhập số2  vào đây "))
so3=int(input("Nhập số3  vào đây "))

if( so1 < so2 ):
    if(so2 > so3):
        print("So lon nhat la so ", so2)
    else:
        print("So lon nhat la so ", so3)
elif so1 > so3:
    print("So lon nhat la so ", so1)
else:
    print("so lon nhat la so ", so3)
    
# print(so1 > so2 ? (so2 > so3 ? so2 : so3) : so1 )





