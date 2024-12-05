#!/usr/bin/env python3
chuoi=input("nHap chuoi vao day: ")
tach_tu = chuoi.split()
countWord=0
for word in tach_tu:
    if(len(word) >= 2):
            # if c.isalpha:
            #     continue
            # else:
            #     print("not")
            #     countWord-=1
            #     break
        countWord+=1

print(f"Su chu trong chuoi la{countWord}")
print(f"So ky tu trong chuoi la {len(chuoi)}")