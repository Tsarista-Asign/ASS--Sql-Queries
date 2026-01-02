/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `bomon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bomon` (
  `MABM` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TENBM` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PHONG` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DIENTHOAI` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TRUONGBM` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MAKHOA` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NGAYNHANCHUC` date DEFAULT NULL,
  PRIMARY KEY (`MABM`),
  KEY `MAKHOA` (`MAKHOA`),
  KEY `FK_BOMON_TRUONGBM` (`TRUONGBM`),
  CONSTRAINT `bomon_ibfk_1` FOREIGN KEY (`MAKHOA`) REFERENCES `khoa` (`MAKHOA`),
  CONSTRAINT `FK_BOMON_TRUONGBM` FOREIGN KEY (`TRUONGBM`) REFERENCES `giaovien` (`MAGV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `chude`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chude` (
  `MACD` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TENCD` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`MACD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `congviec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `congviec` (
  `MADT` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SOTT` int NOT NULL,
  `TENCV` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NGAYBD` date DEFAULT NULL,
  `NGAYKT` date DEFAULT NULL,
  PRIMARY KEY (`MADT`,`SOTT`),
  CONSTRAINT `congviec_ibfk_1` FOREIGN KEY (`MADT`) REFERENCES `detai` (`MADT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `detai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detai` (
  `MADT` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TENDT` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CAPQL` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `KINHPHI` decimal(12,1) DEFAULT NULL,
  `NGAYBD` date DEFAULT NULL,
  `NGAYKT` date DEFAULT NULL,
  `MACD` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GVCNDT` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MADT`),
  KEY `MACD` (`MACD`),
  KEY `GVCNDT` (`GVCNDT`),
  CONSTRAINT `detai_ibfk_1` FOREIGN KEY (`MACD`) REFERENCES `chude` (`MACD`),
  CONSTRAINT `detai_ibfk_2` FOREIGN KEY (`GVCNDT`) REFERENCES `giaovien` (`MAGV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `giaovien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giaovien` (
  `MAGV` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `HOTEN` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LUONG` decimal(10,1) DEFAULT NULL,
  `PHAI` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NGSINH` date DEFAULT NULL,
  `DIACHI` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `GVQLCM` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MABM` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MAGV`),
  KEY `MABM` (`MABM`),
  KEY `FK_GIAOVIEN_GVQLCM` (`GVQLCM`),
  CONSTRAINT `FK_GIAOVIEN_GVQLCM` FOREIGN KEY (`GVQLCM`) REFERENCES `giaovien` (`MAGV`),
  CONSTRAINT `giaovien_ibfk_1` FOREIGN KEY (`MABM`) REFERENCES `bomon` (`MABM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `gv_dt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gv_dt` (
  `MAGV` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DIENTHOAI` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`MAGV`,`DIENTHOAI`),
  CONSTRAINT `gv_dt_ibfk_1` FOREIGN KEY (`MAGV`) REFERENCES `giaovien` (`MAGV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `khoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khoa` (
  `MAKHOA` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TENKHOA` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NAMTL` int DEFAULT NULL,
  `PHONG` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DIENTHOAI` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TRUONGKHOA` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NGAYNHANCHUC` date DEFAULT NULL,
  PRIMARY KEY (`MAKHOA`),
  KEY `FK_KHOA_TRUONGKHOA` (`TRUONGKHOA`),
  CONSTRAINT `FK_KHOA_TRUONGKHOA` FOREIGN KEY (`TRUONGKHOA`) REFERENCES `giaovien` (`MAGV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `nguoithan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nguoithan` (
  `MAGV` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TEN` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `NGSINH` date DEFAULT NULL,
  `PHAI` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`MAGV`,`TEN`),
  CONSTRAINT `nguoithan_ibfk_1` FOREIGN KEY (`MAGV`) REFERENCES `giaovien` (`MAGV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `thamgiadt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thamgiadt` (
  `MAGV` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MADT` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STT` int NOT NULL,
  `PHUCAP` decimal(5,1) DEFAULT NULL,
  `KETQUA` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`MAGV`,`MADT`,`STT`),
  KEY `MADT` (`MADT`,`STT`),
  CONSTRAINT `thamgiadt_ibfk_1` FOREIGN KEY (`MAGV`) REFERENCES `giaovien` (`MAGV`),
  CONSTRAINT `thamgiadt_ibfk_2` FOREIGN KEY (`MADT`, `STT`) REFERENCES `congviec` (`MADT`, `SOTT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;