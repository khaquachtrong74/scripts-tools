#!/user/bin/env python3

def compare(a, b):
    return a>b
numb=int(input("Nhập số lượng số "))
lt=list()
for i in range(0,numb):
    lt.append(int(input(f"So thu {i}: ")))
lt.sort()
print(lt[len(lt)-1])    