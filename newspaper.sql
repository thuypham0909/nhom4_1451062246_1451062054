-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2017 at 10:51 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newspaper`
--

-- --------------------------------------------------------

--
-- Table structure for table `loaitin`
--

CREATE TABLE `loaitin` (
  `idloaitin` int(11) NOT NULL,
  `tenloaitin` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `idtheloai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quangcao`
--

CREATE TABLE `quangcao` (
  `idquangcao` int(11) NOT NULL,
  `tenquangcao` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `hinhanh` longblob NOT NULL,
  `idvitri` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `theloai`
--

CREATE TABLE `theloai` (
  `idtheloai` int(11) NOT NULL,
  `ten_tloai` varchar(300) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tintuc`
--

CREATE TABLE `tintuc` (
  `idtintuc` int(11) NOT NULL,
  `tieude` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tomtat` text COLLATE utf8_unicode_ci NOT NULL,
  `noidung` text COLLATE utf8_unicode_ci NOT NULL,
  `hinhanh` longblob NOT NULL,
  `tinlienquan` tinyint(4) NOT NULL,
  `tgiandang` date NOT NULL,
  `idloaitin` int(11) NOT NULL,
  `idweb` int(11) NOT NULL,
  `idtheloai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `iduser` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vitri`
--

CREATE TABLE `vitri` (
  `idvitri` int(11) NOT NULL,
  `tenvitri` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `weblienket`
--

CREATE TABLE `weblienket` (
  `idweb` int(11) NOT NULL,
  `tenweb` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `linkweb` varchar(225) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `loaitin`
--
ALTER TABLE `loaitin`
  ADD PRIMARY KEY (`idloaitin`),
  ADD KEY `idtheloai` (`idtheloai`);

--
-- Indexes for table `quangcao`
--
ALTER TABLE `quangcao`
  ADD PRIMARY KEY (`idquangcao`),
  ADD KEY `idvitri` (`idvitri`);

--
-- Indexes for table `theloai`
--
ALTER TABLE `theloai`
  ADD PRIMARY KEY (`idtheloai`);

--
-- Indexes for table `tintuc`
--
ALTER TABLE `tintuc`
  ADD PRIMARY KEY (`idtintuc`),
  ADD KEY `idloaitin` (`idloaitin`),
  ADD KEY `idweb` (`idweb`),
  ADD KEY `idtheloai` (`idtheloai`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`);

--
-- Indexes for table `vitri`
--
ALTER TABLE `vitri`
  ADD PRIMARY KEY (`idvitri`);

--
-- Indexes for table `weblienket`
--
ALTER TABLE `weblienket`
  ADD PRIMARY KEY (`idweb`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `loaitin`
--
ALTER TABLE `loaitin`
  MODIFY `idloaitin` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `quangcao`
--
ALTER TABLE `quangcao`
  MODIFY `idquangcao` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `theloai`
--
ALTER TABLE `theloai`
  MODIFY `idtheloai` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tintuc`
--
ALTER TABLE `tintuc`
  MODIFY `idtintuc` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vitri`
--
ALTER TABLE `vitri`
  MODIFY `idvitri` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `weblienket`
--
ALTER TABLE `weblienket`
  MODIFY `idweb` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `loaitin`
--
ALTER TABLE `loaitin`
  ADD CONSTRAINT `loaitin_ibfk_1` FOREIGN KEY (`idloaitin`) REFERENCES `baiviet` (`idloaitin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `theloai`
--
ALTER TABLE `theloai`
  ADD CONSTRAINT `theloai_ibfk_1` FOREIGN KEY (`idtheloai`) REFERENCES `loaitin` (`idtheloai`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tintuc`
--
ALTER TABLE `tintuc`
  ADD CONSTRAINT `tintuc_ibfk_1` FOREIGN KEY (`idtintuc`) REFERENCES `ykienbd` (`idtintuc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vitri`
--
ALTER TABLE `vitri`
  ADD CONSTRAINT `vitri_ibfk_1` FOREIGN KEY (`idvitri`) REFERENCES `quangcao` (`idvitri`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `weblienket`
--
ALTER TABLE `weblienket`
  ADD CONSTRAINT `weblienket_ibfk_1` FOREIGN KEY (`idweb`) REFERENCES `tintuc` (`idweb`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
