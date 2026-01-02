LOCK TABLES `bomon` WRITE;
/*!40000 ALTER TABLE `bomon` DISABLE KEYS */;
INSERT INTO `bomon` VALUES ('CNTT','Công nghệ tri thức','B15','0838126126',NULL,'CNTT',NULL),('HHC','Hóa hữu cơ','B44','838222222',NULL,'HH',NULL),('HL','Hóa lý','B42','0838878787',NULL,'HH',NULL),('HPT','Hóa phân tích','B43','0838777777','007','HH','2007-10-15'),('HTTT','Hệ thống thông tin','B13','0838125125','002','CNTT','2004-09-20'),('MMT','Mạng máy tính','B16','0838676767','001','CNTT','2005-05-15'),('SH','Sinh hóa','B33','0838898989',NULL,'SH',NULL),('VLĐT','Vật lý điện tử','B23','0838234234',NULL,'VL',NULL),('VLUD','Vật lý ứng dụng','B24','0838454545','005','VL','2006-02-18'),('VS','Vi sinh','B32','0838909090','004','SH','2007-01-01');
/*!40000 ALTER TABLE `bomon` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `chude` WRITE;
/*!40000 ALTER TABLE `chude` DISABLE KEYS */;
INSERT INTO `chude` VALUES ('NCPT','Nghiên cứu phát triển'),('QLGD','Quản lý giáo dục'),('UDCN','Ứng dụng công nghệ');
/*!40000 ALTER TABLE `chude` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `congviec` WRITE;
/*!40000 ALTER TABLE `congviec` DISABLE KEYS */;
INSERT INTO `congviec` VALUES ('001',1,'Khởi tạo và Lập kế hoạch','2007-10-20','2008-12-20'),('001',2,'Xác định yêu cầu','2008-12-21','2008-03-21'),('001',3,'Phân tích hệ thống','2008-03-22','2008-05-22'),('001',4,'Thiết kế hệ thống','2008-05-23','2008-06-23'),('001',5,'Cài đặt thử nghiệm','2008-06-24','2008-10-20'),('002',1,'Khởi tạo và Lập kế hoạch','2009-05-10','2009-07-10'),('002',2,'Xác định yêu cầu','2009-07-11','2009-10-11'),('002',3,'Phân tích hệ thống','2009-10-12','2009-12-20'),('002',4,'Thiết kế hệ thống','2009-12-21','2010-03-22'),('002',5,'Cài đặt thử nghiệm','2010-03-23','2010-05-10'),('006',1,'Lấy mẫu','2006-10-20','2007-02-20'),('006',2,'Nuôi cấy','2007-02-21','2008-08-21');
/*!40000 ALTER TABLE `congviec` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `detai` WRITE;
/*!40000 ALTER TABLE `detai` DISABLE KEYS */;
INSERT INTO `detai` VALUES ('001','HTTT quản lý các trường ĐH','ĐHQG',20.0,'2007-10-20','2008-10-20','QLGD','002'),('002','HTTT quản lý giáo vụ cho một Khoa','Trường',20.0,'2000-10-12','2001-10-12','QLGD','002'),('003','Nghiên cứu chế tạo sợi Nanô Platin','ĐHQG',300.0,'2008-05-15','2010-05-15','NCPT','005'),('004','Tạo vật liệu sinh học bằng màng ối người','Nhà nước',100.0,'2007-01-01','2009-12-31','NCPT','004'),('005','Ứng dụng hóa học xanh','Trường',200.0,'2003-10-10','2004-12-10','UDCN','007'),('006','Nghiên cứu tế bào gốc','Nhà nước',4000.0,'2006-10-20','2009-10-20','NCPT','004'),('007','HTTT quản lý thư viện ở các trường ĐH','Trường',20.0,'2009-05-10','2010-05-10','QLGD','001');
/*!40000 ALTER TABLE `detai` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `giaovien` WRITE;
/*!40000 ALTER TABLE `giaovien` DISABLE KEYS */;
INSERT INTO `giaovien` VALUES ('001','Nguyễn Hoài An',2000.0,'Nam','1973-02-15','25/3 Lạc Long Quân, Q.10, TP HCM',NULL,'MMT'),('002','Trần Trà Hương',2500.0,'Nữ','1960-06-20','125 Trần Hưng Đạo, Q.1, TP HCM',NULL,'HTTT'),('003','Nguyễn Ngọc Ánh',2200.0,'Nữ','1975-05-11','12/21 Võ Văn Ngân Thủ Đức, TP HCM','002','HTTT'),('004','Trương Nam Sơn',2300.0,'Nam','1959-06-20','215 Lý Thường Kiệt, TP Biên Hòa',NULL,'VS'),('005','Lý Hoàng Hà',2500.0,'Nam','1954-10-23','22/5 Nguyễn Xí, Q. Bình Thạnh, TP HCM',NULL,'VLĐT'),('006','Trần Bạch Tuyết',1500.0,'Nữ','1980-05-20','127 Hùng Vương, TP Mỹ Tho','004','VS'),('007','Nguyễn An Trung',2100.0,'Nam','1976-06-05','234 3/2, TP Biên Hòa',NULL,'HPT'),('008','Trần Trung Hiếu',1800.0,'Nam','1977-08-06','22/11 Lý Thường Kiệt, TP Mỹ Tho','007','HPT'),('009','Trần Hoàng Nam',2000.0,'Nam','1975-11-22','234 Trần Não, An Phú, TP HCM','001','MMT'),('010','Phạm Nam Thanh',1500.0,'Nam','1980-12-12','221 Hùng Vương, Q.5, TP HCM','007','HPT');
/*!40000 ALTER TABLE `giaovien` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `gv_dt` WRITE;
/*!40000 ALTER TABLE `gv_dt` DISABLE KEYS */;
INSERT INTO `gv_dt` VALUES ('001','0838912112'),('001','0903123123'),('002','0913454545'),('003','0838121212'),('003','0903656565'),('003','0937125125'),('006','0937888888'),('008','0653717171'),('008','0913232323');
/*!40000 ALTER TABLE `gv_dt` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `khoa` WRITE;
/*!40000 ALTER TABLE `khoa` DISABLE KEYS */;
INSERT INTO `khoa` VALUES ('CNTT','Công nghệ thông tin',1995,'B11','0838123456','002','2005-02-20'),('HH','Hóa học',1980,'B41','0838456456','007','2001-10-15'),('SH','Sinh học',1980,'B31','0838454545','004','2000-10-11'),('VL','Vật lý',1976,'B21','0838223223','005','2003-09-18');
/*!40000 ALTER TABLE `khoa` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `nguoithan` WRITE;
/*!40000 ALTER TABLE `nguoithan` DISABLE KEYS */;
INSERT INTO `nguoithan` VALUES ('001','Hùng','1990-01-14','Nam'),('001','Thủy','1994-12-08','Nữ'),('003','Hà','1998-09-03','Nữ'),('003','Thu','1998-09-03','Nữ'),('007','Mai','2003-03-26','Nữ'),('007','Vy','2000-02-14','Nữ'),('008','Nam','1991-05-06','Nam'),('009','An','1996-08-19','Nam'),('010','Nguyệt','2006-01-14','Nữ');
/*!40000 ALTER TABLE `nguoithan` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `thamgiadt` WRITE;
/*!40000 ALTER TABLE `thamgiadt` DISABLE KEYS */;
INSERT INTO `thamgiadt` VALUES ('001','002',1,0.0,NULL),('001','002',2,2.0,NULL),('002','001',4,2.0,'Đạt'),('003','001',1,1.0,'Đạt'),('003','001',2,0.0,'Đạt'),('003','001',4,1.0,'Đạt'),('003','002',2,0.0,NULL),('004','006',1,0.0,'Đạt'),('004','006',2,1.0,'Đạt'),('006','006',2,1.5,'Đạt'),('009','002',3,0.5,NULL),('009','002',4,1.5,NULL);
/*!40000 ALTER TABLE `thamgiadt` ENABLE KEYS */;
UNLOCK TABLES;