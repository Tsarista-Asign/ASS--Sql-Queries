-- Bài 1
USE northwind;


-- 1) Danh sách các products có từ ‘Boxes’ trong cột QuantityPerUnit. (1 điểm)
SELECT ProductID, ProductName, QuantityPerUnit
FROM products
WHERE QuantityPerUnit LIKE '%Boxes%';


-- 2) Danh sách các products có UnitPrice lớn hớn 10 và nhỏ hơn 15. (1 điểm)
SELECT ProductID, ProductName, UnitPrice
FROM products
WHERE UnitPrice > 10 AND UnitPrice < 15
ORDER BY UnitPrice, ProductName;


-- 3) Danh sách các orders có OrderDate được lập trong tháng 10 năm 1997. (1 điểm)
SELECT OrderID, CustomerID, EmployeeID, OrderDate
FROM orders
WHERE OrderDate >= '1997-10-01' 
  AND OrderDate <  '1997-11-01'
ORDER BY OrderDate, OrderID;


-- 4) Danh sách các products ứng với tiền tồn vốn. Thông tin bao gồm ProductId, ProductName, UnitPrice, UnitsInStock, TotalAccount. Trong đó TotalAccount= UnitsInStock * UnitPrice. (1 điểm)
SELECT 
    ProductID, 
    ProductName, 
    UnitPrice, 
    UnitsInStock,
    ROUND(UnitsInStock * UnitPrice, 2) AS TotalAccount
FROM products
ORDER BY TotalAccount DESC, ProductName;


-- 5) Danh sách các customers có city là Paris. (1 điểm)
SELECT CustomerID, CompanyName, City, Country
FROM customers
WHERE City = 'Paris'
ORDER BY CompanyName;


-- 6) Danh sách 10 customers có city bắt đầu ‘M’. (1 điểm)
SELECT CustomerID, CompanyName, City, Country
FROM customers
WHERE City LIKE 'M%'
ORDER BY City, CompanyName
LIMIT 10;


-- 7) Danh sách 3 employees có tuổi lớn nhất. Thông tin bao gồm EmployeeID, EmployeeName, Age. Trong đó, EmployeeName được ghép từ LastName và FirstName; Age là năm hiện hành từ cho năm sinh. (2 điểm)
SELECT 
    EmployeeID,
    CONCAT(LastName, ' ', FirstName) AS EmployeeName,
    (YEAR(CURDATE()) - YEAR(BirthDate)) AS Age
FROM employees
ORDER BY Age DESC, BirthDate ASC, EmployeeID ASC
LIMIT 3;


-- 8) Danh sách các orders ứng với tổng tiền của từng hóa đơn có Shipcity là ‘Madrid’. Thông tin bao gồm OrdersId, OrderDate, TotalAccount. Trong đó TotalAccount là Sum của Quantity * UnitPrice, kết nhóm theo OrderId. (2 điểm)
SELECT 
    o.OrderID,
    o.OrderDate,
    ROUND(SUM(od.Quantity * od.UnitPrice), 2) AS TotalAccount
FROM orders AS o
JOIN order_details AS od 
  ON o.OrderID = od.OrderID
WHERE o.ShipCity = 'Madrid'
GROUP BY o.OrderID, o.OrderDate
ORDER BY o.OrderDate, o.OrderID;



--  Bài 2
USE northwind;


-- 1) Danh sách các customers. 
-- Thông tin bao gồm CustomerID, CompanyName, City, Phone.
SELECT CustomerID, CompanyName, City, Phone
FROM customers;


-- 2) Danh sách các products. 
-- Thông tin bao gồm ProductId, ProductName, UnitPrice.
SELECT ProductID, ProductName, UnitPrice
FROM products;


-- 3) Danh sách các employees. 
-- Thông tin bao gồm EmployeeId, EmployeeName, Phone, Age. 
-- EmployeeName = LastName + FirstName; 
-- Age = năm hiện hành - năm sinh.
SELECT 
  EmployeeID,
  CONCAT(LastName, ' ', FirstName) AS EmployeeName,
  HomePhone AS Phone,
  TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) AS Age
FROM employees;


-- 4) Cho xem danh sách employees có năm sinh <=1960.
SELECT 
  EmployeeID,
  CONCAT(LastName, ' ', FirstName) AS EmployeeName,
  BirthDate
FROM employees
WHERE YEAR(BirthDate) <= 1960;


-- 5) Danh sách các products có từ ‘Boxes’ trong cột QuantityPerUnit.
SELECT ProductID, ProductName, QuantityPerUnit
FROM products
WHERE QuantityPerUnit LIKE '%Boxes%';


-- 6) Danh sách các products có UnitPrice lớn hơn 10 và nhỏ hơn 15.
SELECT ProductID, ProductName, UnitPrice
FROM products
WHERE UnitPrice > 10 AND UnitPrice < 15;


-- 7) Danh sách các orders có OrderDate được lập trong tháng 9 năm 1996.
SELECT OrderID, CustomerID, EmployeeID, OrderDate
FROM orders
WHERE OrderDate >= '1996-09-01' AND OrderDate < '1996-10-01';


-- 8) Danh sách các products ứng với tiền tồn vốn. 
-- Thông tin bao gồm ProductId, ProductName, UnitPrice, UnitsInStock, TotalAccount. 
-- TotalAccount= UnitsInStock * UnitPrice.
SELECT 
  ProductID, ProductName, UnitPrice, UnitsInStock,
  (UnitsInStock * UnitPrice) AS TotalAccount
FROM products;


-- 9) Danh sách các customers có city là Paris.
SELECT CustomerID, CompanyName, City, Country, Phone
FROM customers
WHERE City = 'Paris';


-- 10) Danh sách 5 customers có city bắt đầu ‘M’.
SELECT CustomerID, CompanyName, City, Phone
FROM customers
WHERE City LIKE 'M%'
ORDER BY CompanyName
LIMIT 5;


-- 11) Danh sách 2 employees có tuổi lớn nhất. 
-- Thông tin bao gồm EmployeeID, EmployeeName, Age.
SELECT 
  EmployeeID,
  CONCAT(LastName, ' ', FirstName) AS EmployeeName,
  TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) AS Age
FROM employees
ORDER BY Age DESC, EmployeeID
LIMIT 2;


-- 12) Danh sách các products đã từng có khách hàng đặt hàng 
-- (tức là ProductId có trong Order Details). 
-- Thông tin bao gồm ProductId, ProductName, UnitPrice.
SELECT DISTINCT 
  p.ProductID, p.ProductName, p.UnitPrice
FROM products p
JOIN order_details od ON od.ProductID = p.ProductID
ORDER BY p.ProductID;


-- 13) Danh sách các orders ứng với tổng tiền của từng hóa đơn. 
-- Thông tin bao gồm OrdersId, OrderDate, TotalAccount. 
-- TotalAccount = Sum(Quantity * UnitPrice), nhóm theo OrderId.
SELECT 
  o.OrderID,
  o.OrderDate,
  SUM(od.Quantity * od.UnitPrice) AS TotalAccount
FROM orders o
JOIN order_details od ON od.OrderID = o.OrderID
GROUP BY o.OrderID, o.OrderDate
ORDER BY o.OrderID;


-- 14) Danh sách các orders ứng với tổng tiền của từng hóa đơn 
-- có Shipcity là ‘Madrid’. 
-- Thông tin bao gồm OrdersId, OrderDate, TotalAccount.
SELECT 
  o.OrderID,
  o.OrderDate,
  SUM(od.Quantity * od.UnitPrice) AS TotalAccount
FROM orders o
JOIN order_details od ON od.OrderID = o.OrderID
WHERE o.ShipCity = 'Madrid'
GROUP BY o.OrderID, o.OrderDate
ORDER BY o.OrderID;


-- 15) Danh sách các products có tổng số lượng lập hóa đơn lớn nhất.
SELECT 
  p.ProductID, p.ProductName,
  SUM(od.Quantity) AS TotalQuantity
FROM products p
JOIN order_details od ON od.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
HAVING SUM(od.Quantity) = (
  SELECT MAX(t.total_qty)
  FROM (
    SELECT SUM(Quantity) AS total_qty
    FROM order_details
    GROUP BY ProductID
  ) AS t
);


-- 16) Cho biết mỗi customers đã lập bao nhiêu lượt hóa đơn. 
-- Thông tin gồm CustomerID, CompanyName, CountOfOrder.
SELECT 
  c.CustomerID,
  c.CompanyName,
  COUNT(o.OrderID) AS CountOfOrder
FROM customers c
LEFT JOIN orders o ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.CompanyName
ORDER BY CountOfOrder DESC, c.CompanyName;


-- 17) Cho biết mỗi Employee đã lập được bao nhiêu hóa đơn, ứng với tổng tiền.
SELECT 
  e.EmployeeID,
  CONCAT(e.LastName, ' ', e.FirstName) AS EmployeeName,
  COUNT(DISTINCT o.OrderID) AS CountOfOrder,
  COALESCE(SUM(od.Quantity * od.UnitPrice), 0) AS TotalAccount
FROM employees e
LEFT JOIN orders o ON o.EmployeeID = e.EmployeeID
LEFT JOIN order_details od ON od.OrderID = o.OrderID
GROUP BY e.EmployeeID, EmployeeName
ORDER BY CountOfOrder DESC, e.EmployeeID;


-- 18) Cho biết những Customers chưa từng lập hóa đơn.
SELECT 
  c.CustomerID, c.CompanyName, c.City, c.Country
FROM customers c
LEFT JOIN orders o ON o.CustomerID = c.CustomerID
WHERE o.OrderID IS NULL
ORDER BY c.CompanyName;
