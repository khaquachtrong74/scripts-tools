#!/usr/bin/env python3
import random
n=random.randint(10, 100)
arr=[ n+( (i+1)*3) for i in range(0,9)]
print(arr)