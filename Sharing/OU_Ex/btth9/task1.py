#!/usr/bin/env python3

# cách 1:
# with open('name_file.csv', 'r') as f:
# print(f.read())

# cách 2:
# f = open('name_file.csv', 'r')
# print(f.read())

# 'r' Mở file để đọc
# 'w' Mở file để ghi (ghi đè)
# 'a' Mở file để thêm dữ liệu (chèn)
# 'r+' Mở file vừa đọc vừa ghi
# 'x' Tạo file mới

import pandas as pd
import csv
sinh_vien = pd.DataFrame({"MSSV":[234,234,876],
                          "HoTen":["Lê Văn Tám","Nguyên Bình","Nguyễn Thị Bé"],
                          "NamSinh":[2000,2003,2001],
                          "Khoa":["CNTT","CNTT","Kế Toán"],
                          "Quequan":["HCM","DN","Long An"]
                          }, )
# data = [
#     ("234", "Nguyễn Bình", 2000, "CNTT", "HCM", "Long An"),
#     ("234", "Lê Văn Tâm", 2003, "CNTT", "DN", "Long An"),
#     ("876", "Nguyễn Thị Bé", 2001, "Kế toán", "Kế toán", "Long An")
#]

#sinh_vien = pd.DataFrame(data, columns=["MSSV", "HoTen", "NamSinh", "Khoa", "DN", "Quequan"])
sinh_vien.to_csv("sinhvien.csv", index=False, encoding="utf-8")

# Đọc
with open("sinhvien.csv") as f:
    reader = csv.reader(f)
    for col in reader:
        print(col)
# Lưu vào file csv
with open("sinhvien_new.csv","w") as f:
    new_file = csv.writer(f)
    new_file.writerow(['An', '25', 'IT Manager', 'HCM'])
    new_file.writerow(['Thanh','30','Developer','HCM'])
# nếu file csv chưa tồn tại thì nó tự tạo file

header = ['HoTen', 'Diachi', 'Thanhpho', 'Sdt'] 
data = [ 
     ['Tran Hung', '123 Nguyen Van Troi','HCM','12498654'], 
     ['Nguyen Tai', '55/32/1 Nguyen Du', 'HCM', '765438'], 
     ['Phan Thanh', '98 Ly Thai To','HCM','99876543'], 
     ['Nguyen Sang', '32/1 CMT8','DN','977653'], 
     ['Le luu', '32/9 Dong Nai','HCM', '98765'] 
] 
 
with open('countries.csv', 'w', encoding='UTF8', newline='') as f: 
    writer = csv.writer(f) 
    writer.writerow(header)  #Lưu dữ liệu của tiêu đề 
    writer.writerows(data) #Lưu dữ liệu
    
# Tạo file csv từ file txt
txt_file = open('sinhvien.txt' , 'r')
noidung = csv.reader(txt_file, delimiter=',')
# tạo file csv mới
csv_file = open('sinhvien_new_2.csv','w',newline="")
file_csv_moi = csv.writer(csv_file)

#Lưu nội dung vào file csv
file_csv_moi.writerows(noidung)
#đóng file và csv đã mở
# file_csv_moi.close()
csv_file.close()

data_nhansu = [
    ['MANV', 'HoTen', 'NamSinh', 'DiaDiem'],  # Dòng tiêu đề
    ['NV01', 'Nguyen Van Tam', '2000', 'HCM'],
    ['NV02', 'Dao Thi Tuyen', '2001', 'HN'],
    ['NV03', 'Le Thanh Trung', '2004', 'Da Nang']
]

with open('nhansu.txt', 'w', newline='') as f:
    file_txt_new = csv.writer(f, delimiter='\t')# cách nhau 1 tab
    file_txt_new.writerow(data)
    
with open('nhansu.txt', 'r') as f:
    # Iterator
    content = csv.reader(f, delimiter='\t')
    with open('nhansu.csv', 'w', newline='') as f_txt:
        f_txt_new = csv.writer(f_txt, delimiter='\t')
        f_txt_new.writerow(content)
        
with open('nhansu.csv', 'r') as file_csv:
    reader = csv.reader(file_csv, delimiter='\t')
    # đọc dòng đầu tiên của iterator của csv.reader
    header = next(reader)
    print("\t".join(header))

with open('nhansu.txt', 'r') as txt_file:
    reader = csv.reader(txt_file,delimiter='\t')  
    next(reader)  
    
    for row in reader:  
        print("\t".join(row))