# Viết chương trình tính tổng các số từ 0 - n (n nhập từ bàn phím)
n = int(input("Nhập số bạn muốn tính từ đây"))
ans=0
for i in range(1, n+1):
    ans += i
print("Kết quả là " , ans)
