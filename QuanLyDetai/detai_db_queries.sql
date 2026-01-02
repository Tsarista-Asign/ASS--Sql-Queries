-- Câu 21: Tính lương trung bình theo từng khoa
SELECT k.TENKHOA, AVG(g.LUONG) AS LUONG_TB
FROM giaovien g
JOIN bomon b ON g.MABM = b.MABM
JOIN khoa k ON b.MAKHOA = k.MAKHOA
GROUP BY k.TENKHOA;

-- Câu 22: Tìm các giáo viên thuộc bộ môn “Hệ thống thông tin”
SELECT g.*
FROM giaovien g
JOIN bomon b ON g.MABM = b.MABM
WHERE b.TENBM = 'Hệ thống thông tin';

-- Câu 23: Liệt kê các giáo viên tham gia trên 2 công việc
SELECT g.*
FROM giaovien g
JOIN (
    SELECT MAGV
    FROM thamgiadt
    GROUP BY MAGV
    HAVING COUNT(DISTINCT CONCAT(MADT, '-', STT)) > 2
) t ON g.MAGV = t.MAGV;


-- Câu 24: Tìm các giáo viên chưa chủ nhiệm đề tài nào
SELECT g.*
FROM giaovien g
WHERE g.MAGV NOT IN (
  SELECT DISTINCT GVCNDT FROM detai WHERE GVCNDT IS NOT NULL
);

-- Câu 25: Tìm giáo viên làm quản lý chuyên môn cho người khác
SELECT DISTINCT g1.*
FROM giaovien g1
JOIN giaovien g2 ON g1.MAGV = g2.GVQLCM
WHERE g1.MAGV != g2.MAGV;

-- Câu 26: Tính tổng phụ cấp của mỗi giáo viên
SELECT g.*, SUM(t.PHUCAP) AS TONG_PHUCAP
FROM giaovien g
JOIN thamgiadt t ON g.MAGV = t.MAGV
GROUP BY g.MAGV;


-- Câu 27: Tìm các đề tài có thời gian thực hiện dài nhất
SELECT *
FROM detai
WHERE DATEDIFF(NGAYKT, NGAYBD) = (
  SELECT MAX(DATEDIFF(NGAYKT, NGAYBD)) FROM detai
);

-- Câu 28: Hiển thị danh sách tất cả các đề tài có kinh phí lớn hơn 100
SELECT *
FROM detai
WHERE KINHPHI > 100;

-- Câu 29: Tìm các giáo viên có phụ cấp trung bình cao nhất trong bảng THAMGIADT
SELECT g.*, t.AVG_PHUCAP
FROM giaovien g
JOIN (
    SELECT MAGV, AVG(PHUCAP) AS AVG_PHUCAP
    FROM thamgiadt
    GROUP BY MAGV
) t ON g.MAGV = t.MAGV
WHERE t.AVG_PHUCAP = (
    SELECT MAX(AVG_PHUCAP)
    FROM (
        SELECT MAGV, AVG(PHUCAP) AS AVG_PHUCAP
        FROM thamgiadt
        GROUP BY MAGV
    ) AS temp
);

-- Câu 30: Liệt kê tên khoa, tên bộ môn và số lượng giáo viên trong từng bộ môn
SELECT k.TENKHOA, b.TENBM, COUNT(g.MAGV) AS SO_GV
FROM giaovien g
JOIN bomon b ON g.MABM = b.MABM
JOIN khoa k ON b.MAKHOA = k.MAKHOA
GROUP BY k.TENKHOA, b.TENBM;
