-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2021 at 08:09 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_jamur`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_humidity`
--

CREATE TABLE `tb_humidity` (
  `id_kelembapan` int(11) NOT NULL,
  `id_jamur` int(100) NOT NULL,
  `waktu` datetime NOT NULL,
  `kelembapan` varchar(255) NOT NULL,
  `kelembapan_before` varchar(255) NOT NULL,
  `aksi` varchar(255) NOT NULL,
  `waktu_aksi` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_humidity`
--

INSERT INTO `tb_humidity` (`id_kelembapan`, `id_jamur`, `waktu`, `kelembapan`, `kelembapan_before`, `aksi`, `waktu_aksi`) VALUES
(6, 2, '2021-11-21 14:04:13', '32', '', '', '0000-00-00 00:00:00'),
(7, 1, '2021-11-21 14:06:50', '16', '', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tb_setpoint`
--

CREATE TABLE `tb_setpoint` (
  `id_jamur` int(11) NOT NULL,
  `nama_jamur` varchar(255) NOT NULL,
  `suhu` varchar(255) NOT NULL,
  `kelembapan` varchar(255) NOT NULL,
  `waktu_input` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_setpoint`
--

INSERT INTO `tb_setpoint` (`id_jamur`, `nama_jamur`, `suhu`, `kelembapan`, `waktu_input`) VALUES
(1, 'tiram', '24', '16', '2021-11-21 07:20:01'),
(2, 'kancing', '24', '20', '2021-11-21 07:20:01');

-- --------------------------------------------------------

--
-- Table structure for table `tb_suhu`
--

CREATE TABLE `tb_suhu` (
  `id_suhu` int(5) NOT NULL,
  `id_jamur` varchar(3) NOT NULL,
  `waktu` datetime NOT NULL,
  `suhu` varchar(255) NOT NULL,
  `suhu_setelah` varchar(3) NOT NULL,
  `aksi` varchar(255) NOT NULL,
  `waktu_aksi` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_suhu`
--

INSERT INTO `tb_suhu` (`id_suhu`, `id_jamur`, `waktu`, `suhu`, `suhu_setelah`, `aksi`, `waktu_aksi`) VALUES
(7, '1', '2021-11-21 14:02:29', '32', '', '', '0000-00-00 00:00:00'),
(8, '2', '2021-11-21 14:08:43', '27', '', '', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_humidity`
--
ALTER TABLE `tb_humidity`
  ADD PRIMARY KEY (`id_kelembapan`);

--
-- Indexes for table `tb_setpoint`
--
ALTER TABLE `tb_setpoint`
  ADD PRIMARY KEY (`id_jamur`);

--
-- Indexes for table `tb_suhu`
--
ALTER TABLE `tb_suhu`
  ADD PRIMARY KEY (`id_suhu`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_humidity`
--
ALTER TABLE `tb_humidity`
  MODIFY `id_kelembapan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_setpoint`
--
ALTER TABLE `tb_setpoint`
  MODIFY `id_jamur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_suhu`
--
ALTER TABLE `tb_suhu`
  MODIFY `id_suhu` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
