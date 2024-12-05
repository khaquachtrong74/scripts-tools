#!/user/bin/env python3

import random


n=int(input("Nhập số phần tử"))
lt=list()
for i in range(0, n):
    lt.append(int(random.randint(1,100)))
ans =0
for l in lt:
    ans+=l
if ans < 100 or ans > 999:
    print("Lỗi rồi nhá")
else:
    print(ans)
    