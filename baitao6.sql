-- kiểm tra xem có dữ liệu của sv_tnut.sql chưa 
select * from sv 
go 
-- dữ liệu đầu vào tên , ngày sinh ,sdt.
SELECT * FROM sv WHERE masv = 'K225480106032'; 

-- nhập sql để tìm ra sinh viên trùng hoàn toàn với ngày tháng năm sinh của em . 
SELECT *   -- lấy dữ liệu trong bảng cs dữ liệu
FROM sv    -- chỉ định là lấy tất cả dữ liệu trong bảng sv
WHERE ns = '2004-11-25'; -- lọc dữ liệu trong cột ngày sinh = 25-11-2004

--  nhập sql để tìm xem có những sv nào trùng ngày và tháng sinh với em?
SELECT * -- lấy dữ liệu trong bảng cs dữ liệu
FROM sv  --chỉ định là lấy tất cả dữ liệu trong bảng sv
WHERE DAY(ns) = 25 AND MONTH(ns) = 11; -- trích ra ngày từ cột DAY(ns) và MONTH(ns)


-- nhập sql để tìm xem có những sv nào trùng tháng và năm sinh với em?
SELECT *    -- lấy dữ liệu trong bảng cs dữ liệu
FROM sv     --chỉ định là lấy tất cả dữ liệu trong bảng sv
WHERE MONTH(ns) = 11 AND YEAR(ns) = 2004;  -- trích ra ngày từ cột MONTH(ns) và YEAR(ns)

--nhập sql để tìm xem có những sv nào trùng tên với em?
SELECT *  -- lấy dữ liệu trong bảng cs dữ liệu
FROM sv   --chỉ định là lấy tất cả dữ liệu trong bảng sv
WHERE ten = N'Kiên'; --trích ra từ cột tên


--nhập sql để tìm xem có những sv nào trùng họ và tên đệm với em.
SELECT *  -- lấy dữ liệu trong bảng cs dữ liệu
FROM sv    --chỉ định là lấy tất cả dữ liệu trong bảng sv
WHERE hodem = N'Nguyễn Trung';--trích ra từ cột họ đệm
-- nhập sql để tìm xem có những sv nào có sđt sai khác chỉ 1 số so với sđt của em.

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

-- sinh viên KMT
SELECT *
FROM sv
WHERE lop LIKE '%KMT%' --WHERE lop LIKE 'KMT%' Lọc các sinh viên học lớp thuộc ngành KMT.Giả sử ngành KMT có tiền tố lớp là KMT, như KMT01, KMT23CN, v.v.
ORDER BY  --ORDER BY ten, hodem COLLATE Vietnamese_CI_AS Sắp xếp theo tên trước, rồi đến họ đệm.
    ten COLLATE Vietnamese_CI_AS, --COLLATE Vietnamese_CI_AS dùng để so sánh theo chuẩn tiếng Việt:CI = Case Insensitive (không phân biệt hoa thường) AS = Accent Sensitive (phân biệt dấu tiếng Việt, ví dụ: a khác á).
    hodem COLLATE Vietnamese_CI_AS;

-- sinh viên lớp k58ktp
	SELECT *
FROM sv
WHERE lop LIKE '%K58KTP.K01%'
ORDER BY 
    ten COLLATE Vietnamese_CI_AS, 
    hodem COLLATE Vietnamese_CI_AS;

--  HÃY NHẬP SQL ĐỂ LIỆT KÊ CÁC SV NỮ NGÀNH KMT CÓ TRONG BẢNG SV (TRÌNH BÀY QUÁ TRÌNH SUY NGHĨ VÀ GIẢI NHỮNG VỨNG MẮC)

	SELECT *
FROM sv
WHERE lop LIKE '%KMT%'  -- lọc ngành KMT
  AND (
    hodem LIKE N'%Thị%' OR
    hodem LIKE N'%Ngọc%' OR
    hodem LIKE N'%Diệu%' OR
    hodem LIKE N'%Hồng%' OR
    hodem LIKE N'%Tuyết%' OR
    hodem LIKE N'%Mai%' OR
    hodem LIKE N'%Bích%' OR
    hodem LIKE N'%Thanh%' OR
    hodem LIKE N'%Lan%' OR
    hodem LIKE N'%Thu%'
  )
ORDER BY ten COLLATE Vietnamese_CI_AS, hodem COLLATE Vietnamese_CI_AS;

--  HÃY NHẬP SQL ĐỂ LIỆT KÊ CÁC SV NỮ NGÀNH K58KTP.K01 CÓ TRONG BẢNG SV 
FROM sv
WHERE lop LIKE '%K58KTP.K01%'  -- lọc ngành K58KTP.K01
  AND (
    hodem LIKE N'%Thị%' OR
    hodem LIKE N'%Ngọc%' OR
    hodem LIKE N'%Diệu%' OR
    hodem LIKE N'%Hồng%' OR
    hodem LIKE N'%Tuyết%' OR
    hodem LIKE N'%Mai%' OR
    hodem LIKE N'%Bích%' OR
    hodem LIKE N'%Thanh%' OR
    hodem LIKE N'%Lan%' OR
    hodem LIKE N'%Thu%'
  )
ORDER BY ten COLLATE Vietnamese_CI_AS, hodem COLLATE Vietnamese_CI_AS;
