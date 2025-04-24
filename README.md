# Cau lenh-Select
Bài tập số 6 của sinh viên:K225480106032 - Nguyễn Trung Kiên - Môn hệ quản trị cơ sở dữ liệu
# Bài tập 6: Hệ quản trị CSDL
# Yêu cầu bài tập: 
Cho file sv_tnut.sql (1.6MB)
1. Hãy nêu các bước để import được dữ liệu trong sv_tnut.sql vào sql server của em
2. dữ liệu đầu vào là tên của sv; sđt; ngày, tháng, năm sinh của sinh viên (của sv đang làm bài tập này)
3. nhập sql để tìm xem có những sv nào trùng hoàn toàn ngày/tháng/năm với em?
4. nhập sql để tìm xem có những sv nào trùng ngày và tháng sinh với em?
5. nhập sql để tìm xem có những sv nào trùng tháng và năm sinh với em?
6. nhập sql để tìm xem có những sv nào trùng tên với em?
7. nhập sql để tìm xem có những sv nào trùng họ và tên đệm với em.
8. nhập sql để tìm xem có những sv nào có sđt sai khác chỉ 1 số so với sđt của em.
9. BẢNG SV CÓ HƠN 9000 ROWS, HÃY LIỆT KÊ TẤT CẢ CÁC SV NGÀNH KMT, SẮP XẾP THEO TÊN VÀ HỌ ĐỆM, KIỂU TIẾNG  VIỆT, GIẢI THÍCH.
10. HÃY NHẬP SQL ĐỂ LIỆT KÊ CÁC SV NỮ NGÀNH KMT CÓ TRONG BẢNG SV (TRÌNH BÀY QUÁ TRÌNH SUY NGHĨ VÀ GIẢI NHỮNG VỨNG MẮC)

# DEADLINE: 23H59:59 NGÀY 25/4/2025

# bài làm 
# 1 Hãy nêu các bước để import được dữ liệu trong sv_tnut.sql vào sever của em 
bước 1 : mở sql sever 
bước 2 : click chuột trái vào database chọn new database 
bước 3 : đặt tên database qlsv rồi ấn OK !!!
![image](https://github.com/user-attachments/assets/4c14005e-6a6e-4230-9af9-5c217f961531)
bước 4: tải file sv_tnut.sql 
![image](https://github.com/user-attachments/assets/4a367ce2-8f82-4d8b-b4a4-f6ba1268e308)

bước 5 : mở file sv_tnut.sql đổi use thành use[qlsv]
![image](https://github.com/user-attachments/assets/4b54c146-216b-4e23-b93f-53e1d8b61757)

bước 6 : file chạy thành công và có table là db SV
![image](https://github.com/user-attachments/assets/b9b6535b-4656-4798-bd0c-ce780a82b591)

# 2 dữ liệu đầu vào là tên của sv; sđt; ngày, tháng, năm sinh của sinh viên (của sv đang làm bài tập này)
bước 1 : click chuột trái vào database chọn new query
![image](https://github.com/user-attachments/assets/48c5ba6f-9548-4fd4-a155-89d768e9f911)
bước 2 : kiểm tra xem có dữ liệu của bảng sv_tnut.sql chưa
select : lấy dữ liệu từ trong bảng cơ sở dữ liệu 
* : nghĩa là tất cả các cột
from sv : chỉ định là lấy tất cả dữ liệu trong bảng sinh viên
![image](https://github.com/user-attachments/assets/29ef2faf-1757-4c99-b66f-265645963832)

bước 3 : vì cột msv trong bảng sv để not null lên ko thể select ra bảng 
![image](https://github.com/user-attachments/assets/5595ad6a-8874-41f9-ad1d-6deead3dc3b2)

lên em đã sử dung msv để lấy dữ liệu đầu vào 
![image](https://github.com/user-attachments/assets/9f8a58f6-3a26-417c-83bb-06d34bffae4c)

# 3 nhập sql để tìm xem có những sv nào trùng hoàn toàn ngày/tháng/năm với em?
SELECT *   -- lấy dữ liệu trong bảng cs dữ liệu
FROM sv    -- chỉ định là lấy tất cả dữ liệu trong bảng sv
WHERE ns = '2004-11-25'; -- lọc dữ liệu trong trọt ngày sinh = 25-11-2004
![image](https://github.com/user-attachments/assets/f8715b63-b5ed-4661-9298-639d88a4199a)

# 4 nhập sql để tìm xem có những sv nào trùng ngày và tháng sinh với em?
SELECT * -- lấy dữ liệu trong bảng cs dữ liệu
FROM sv  --chỉ định là lấy tất cả dữ liệu trong bảng sv
WHERE DAY(ns) = 25 AND MONTH(ns) = 11; -- trích ra ngày từ cột DAY(ns) và MONTH(ns)
![image](https://github.com/user-attachments/assets/feba0ffb-76f0-4a69-89b0-d18fa23c7daa)

# 5 nhập sql để tìm xem có những sv nào trùng tháng và năm sinh với em?
SELECT *    -- lấy dữ liệu trong bảng cs dữ liệu
FROM sv     --chỉ định là lấy tất cả dữ liệu trong bảng sv
WHERE MONTH(ns) = 11 AND YEAR(ns) = 2004; -- -- trích ra ngày từ cột MONTH(ns) và YEAR(ns)
![image](https://github.com/user-attachments/assets/0a39b32c-4e44-4709-9800-35c77d0396b2)

# 6  nhập sql để tìm xem có những sv nào trùng tên với em?
SELECT *  -- lấy dữ liệu trong bảng cs dữ liệu
FROM sv   --chỉ định là lấy tất cả dữ liệu trong bảng sv
WHERE ten = N'Kiên'; --trích ra ngày từ cột tên
![image](https://github.com/user-attachments/assets/c14f6164-3da3-4935-a4f4-0f2f2d2517c0)

# 7 nhập sql để tìm xem có những sv nào trùng họ và tên đệm với em.
SELECT *  -- lấy dữ liệu trong bảng cs dữ liệu
FROM sv    --chỉ định là lấy tất cả dữ liệu trong bảng sv
WHERE hodem = N'Nguyễn Trung';--trích ra từ cột họ đệm
![image](https://github.com/user-attachments/assets/136a3907-d740-43e2-af9d-3034f7b81787)

# 8  nhập sql để tìm xem có những sv nào có sđt sai khác chỉ 1 số so với sđt của em.
SELECT *
FROM sv
WHERE 
(
    -- Đếm số vị trí có ký tự khác với '0968793414'
    (CASE WHEN SUBSTRING(sdt, 1, 1) <> SUBSTRING('0968793414', 1, 1) THEN 1 ELSE 0 END) +  --Dùng SUBSTRING() để so từng ký tự.
    
    (CASE WHEN SUBSTRING(sdt, 2, 1) <> SUBSTRING('0968793414', 2, 1) THEN 1 ELSE 0 END) +  --Dùng CASE WHEN ... THEN 1 ELSE 0 để đếm số ký tự khác.
    
    (CASE WHEN SUBSTRING(sdt, 3, 1) <> SUBSTRING('0968793414', 3, 1) THEN 1 ELSE 0 END) +  --nếu bằng 1 → chỉ sai đúng 1 số → giữ lại.
    
    (CASE WHEN SUBSTRING(sdt, 4, 1) <> SUBSTRING('0968793414', 4, 1) THEN 1 ELSE 0 END) +
    
    (CASE WHEN SUBSTRING(sdt, 5, 1) <> SUBSTRING('0968793414', 5, 1) THEN 1 ELSE 0 END) +
    
    (CASE WHEN SUBSTRING(sdt, 6, 1) <> SUBSTRING('0968793414', 6, 1) THEN 1 ELSE 0 END) +
    
    (CASE WHEN SUBSTRING(sdt, 7, 1) <> SUBSTRING('0968793414', 7, 1) THEN 1 ELSE 0 END) +
    
    (CASE WHEN SUBSTRING(sdt, 8, 1) <> SUBSTRING('0968793414', 8, 1) THEN 1 ELSE 0 END) +
    
    (CASE WHEN SUBSTRING(sdt, 9, 1) <> SUBSTRING('0968793414', 9, 1) THEN 1 ELSE 0 END) +
    
    (CASE WHEN SUBSTRING(sdt, 10, 1) <> SUBSTRING('0968793414', 10, 1) THEN 1 ELSE 0 END)
    
) = 1

AND LEN(sdt) = 10;  -- đảm bảo số điện thoại có đúng 10 chữ số

![image](https://github.com/user-attachments/assets/476192ba-4644-4862-820e-7dba09be6d4e)

9. BẢNG SV CÓ HƠN 9000 ROWS, HÃY LIỆT KÊ TẤT CẢ CÁC SV NGÀNH KMT, SẮP XẾP THEO TÊN VÀ HỌ ĐỆM, KIỂU TIẾNG  VIỆT, GIẢI THÍCH.
-- sinh viên KMT
SELECT *
FROM sv
WHERE lop LIKE '%KMT%' --WHERE lop LIKE 'KMT%' Lọc các sinh viên học lớp thuộc ngành KMT.Giả sử ngành KMT có tiền tố lớp là KMT, như KMT01, KMT23CN, v.v.

ORDER BY  --ORDER BY ten, hodem COLLATE Vietnamese_CI_AS Sắp xếp theo tên trước, rồi đến họ đệm.

    ten COLLATE Vietnamese_CI_AS, --COLLATE Vietnamese_CI_AS dùng để so sánh theo chuẩn tiếng Việt:CI = Case Insensitive (không phân biệt hoa thường) AS = Accent Sensitive (phân biệt dấu tiếng Việt, ví dụ: a khác á).
    
    hodem COLLATE Vietnamese_CI_AS;
    
![image](https://github.com/user-attachments/assets/39f8ec3e-decd-4547-bee5-5ae99ed3c2e5)

-- sinh viên k58ktp.k01
SELECT *
FROM sv
WHERE lop LIKE '%KMT%' --WHERE lop LIKE 'K58KTP.K01%' Lọc các sinh viên học lớp thuộc ngành KMT.Giả sử ngành k58ktp  có tiền tố lớp là k58.ktp k01 ...

ORDER BY  --ORDER BY ten, hodem COLLATE Vietnamese_CI_AS Sắp xếp theo tên trước, rồi đến họ đệm.

    ten COLLATE Vietnamese_CI_AS, --COLLATE Vietnamese_CI_AS dùng để so sánh theo chuẩn tiếng Việt:CI = Case Insensitive (không phân biệt hoa thường) AS = Accent Sensitive (phân biệt dấu tiếng Việt, ví dụ: a khác á).
    
    hodem COLLATE Vietnamese_CI_AS;
    
![image](https://github.com/user-attachments/assets/89794b4a-1282-4823-8f64-700bb65c040f)

# 10 HÃY NHẬP SQL ĐỂ LIỆT KÊ CÁC SV NỮ NGÀNH KMT CÓ TRONG BẢNG SV (TRÌNH BÀY QUÁ TRÌNH SUY NGHĨ VÀ GIẢI NHỮNG VỨNG MẮC)

Bảng sv không có cột giới tính, nên không thể lọc trực tiếp sinh viên nữ !!!.

Em đã suy luận giới tính nữ từ họ đệm (cột hodem) !!!.

Đồng thời, cần lọc ngành KMT từ cột lop vì thông tin ngành chưa được chuẩn hóa rõ ràng.

📌 Hướng suy luận sinh viên nữ từ họ đệm
 Thường gặp các họ đệm nữ như:
"Thị", "Ngọc", "Diệu", "Thu", "Hồng", "Thanh", "Mai", "Bích", "Tuyết", "Lan",...

Những từ này thường là tên đệm truyền thống của nữ (đặc biệt là "Thị").

![image](https://github.com/user-attachments/assets/80726098-eaa9-46ab-b4b7-e280df1d8337)

# Liệt kê các sinh viên nữ lớp K58KTP.K01
![image](https://github.com/user-attachments/assets/1096f7fa-1773-44d1-a886-59758a574dc4)


📌 vấn đề không có cột giới tính 
dựa vào họ đệm để suy luận ==> không chính xác 100%




















