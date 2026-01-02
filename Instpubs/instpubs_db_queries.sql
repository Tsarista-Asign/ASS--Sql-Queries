USE pubs;

-- Bài 1: Liệt kê các tác giả có ít nhất hai đầu sách xuất bản
SELECT a.au_id, a.au_fname, a.au_lname, COUNT(ta.title_id) AS so_sach
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
GROUP BY a.au_id, a.au_fname, a.au_lname
HAVING COUNT(ta.title_id) >= 2;

-- Bài 2: Liệt kê các cuốn sách trong bảng titles có royalty thấp hơn 10% giá trị trung bình của royalty trong bảng roysched
SELECT t.title_id, t.title, t.royalty
FROM titles t
WHERE t.royalty < (
    SELECT AVG(r.royalty) * 0.9
    FROM roysched r
);

-- Bài 3: Liệt kê danh sách các cuốn sách và tác giả của nó (title_id, title, au_id, fname, lname), hiển thị theo thứ tự giảm dần của au_id
SELECT t.title_id, t.title, a.au_id, a.au_fname, a.au_lname
FROM titles t
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
ORDER BY a.au_id DESC;

-- Bài 4: Hiển thị danh sách các nhân viên (employee) thuộc nhà xuất bản "Scootney Books" với emp_id, fname, hire_date
SELECT e.emp_id, e.fname, e.hire_date
FROM employee e
JOIN publishers p ON e.pub_id = p.pub_id
WHERE p.pub_name = 'Scootney Books';

-- Bài 5: Tính toán và hiển thị doanh số bán ra của từng store (cửa hàng), hiển thị theo thứ tự giảm dần của store_name
SELECT s.stor_name, SUM(sa.qty) AS tong_doanhso
FROM stores s
JOIN sales sa ON s.stor_id = sa.stor_id
GROUP BY s.stor_name
ORDER BY s.stor_name DESC;

-- Bài 6: Hiển thị danh sách các cuốn sách có giá > 17 và có sales < 1000 trong California (CA)
SELECT t.title_id, t.title, t.price, SUM(sa.qty) AS tong_ban
FROM titles t
JOIN sales sa ON t.title_id = sa.title_id
JOIN stores s ON sa.stor_id = s.stor_id
WHERE t.price > 17 AND s.state = 'CA'
GROUP BY t.title_id, t.title, t.price
HAVING SUM(sa.qty) < 1000;

-- Bài 7: Tính toán và hiển thị doanh số bán ra của từng title (đầu sách), hiển thị theo thứ tự tăng dần của doanh số
SELECT t.title_id, t.title, SUM(sa.qty) AS tong_doanhso
FROM titles t
JOIN sales sa ON t.title_id = sa.title_id
GROUP BY t.title_id, t.title
ORDER BY tong_doanhso ASC;

-- Bài 8: Liệt kê title đi đôi với store có doanh số bán ra > 95% doanh số trung bình của title đó trong tất cả các store
SELECT t.title_id, t.title, s.stor_name, SUM(sa.qty) AS doanhso
FROM titles t
JOIN sales sa ON t.title_id = sa.title_id
JOIN stores s ON sa.stor_id = s.stor_id
GROUP BY t.title_id, t.title, s.stor_name
HAVING SUM(sa.qty) > 0.95 * (
    SELECT AVG(sub.qty_sum)
    FROM (
        SELECT SUM(sa2.qty) AS qty_sum
        FROM sales sa2
        WHERE sa2.title_id = t.title_id
        GROUP BY sa2.stor_id
    ) sub
);
