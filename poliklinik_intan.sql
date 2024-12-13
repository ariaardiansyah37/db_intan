-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 13, 2024 at 02:51 AM
-- Server version: 8.3.0
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bk_appointment`
--

-- --------------------------------------------------------

--
-- Table structure for table `daftar_poli`
--

DROP TABLE IF EXISTS `daftar_poli`;
CREATE TABLE IF NOT EXISTS `daftar_poli` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_pasien` int UNSIGNED NOT NULL,
  `id_jadwal` int UNSIGNED NOT NULL,
  `keluhan` text NOT NULL,
  `no_antrian` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_jadwal` (`id_jadwal`),
  KEY `fk_id_pasien` (`id_pasien`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_periksa`
--

DROP TABLE IF EXISTS `detail_periksa`;
CREATE TABLE IF NOT EXISTS `detail_periksa` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_periksa` int UNSIGNED NOT NULL,
  `id_obat` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_periksa` (`id_periksa`),
  KEY `fk_id_obat` (`id_obat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

DROP TABLE IF EXISTS `dokter`;
CREATE TABLE IF NOT EXISTS `dokter` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `id_poli` int UNSIGNED DEFAULT NULL,
  `id_user` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_poli` (`id_poli`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id`, `nama`, `alamat`, `no_hp`, `id_poli`, `id_user`) VALUES
(6, 'Gunawan', 'Pekalongan', '08997129812', 3, 7),
(8, 'Dimas', 'Semarang', '08587126378', 3, 9);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_periksa`
--

DROP TABLE IF EXISTS `jadwal_periksa`;
CREATE TABLE IF NOT EXISTS `jadwal_periksa` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_dokter` int UNSIGNED NOT NULL,
  `hari` varchar(10) NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `status` varchar(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_dokter` (`id_dokter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

DROP TABLE IF EXISTS `obat`;
CREATE TABLE IF NOT EXISTS `obat` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_obat` varchar(50) NOT NULL,
  `kemasan` varchar(35) NOT NULL,
  `harga` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id`, `nama_obat`, `kemasan`, `harga`) VALUES
(1, 'Adem Sari Sach', 'Box', 2000),
(4, 'Caplang Mkp 120 Ml', 'Botol', 23200),
(5, 'Diapet', 'Sachet', 16000),
(6, 'Paracetamol', 'Sachet', 13000);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

DROP TABLE IF EXISTS `pasien`;
CREATE TABLE IF NOT EXISTS `pasien` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_ktp` varchar(255) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `no_rm` varchar(25) NOT NULL,
  `id_user` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id`, `nama`, `alamat`, `no_ktp`, `no_hp`, `no_rm`, `id_user`) VALUES
(1, 'Suwayya', 'Brebes', '284972987', '0889879233', '202412-1', 10),
(2, 'Syahrul', 'Pontianak', '3329187991', '0889983298', '202412-2', 11),
(3, 'Pace', 'Papua', '3312897917', '08923897912', '202412-3', 12),
(4, 'Juan', 'Sukabumi', '213797192100', '081238713912', '202412-4', 13),
(6, 'Rozikin', 'Cirebon', '21237572157', '085212398712', '202412-6', 15),
(7, 'rudi', 'pamiritan', '98783521673', '085722316535', '202412-6', 16);

-- --------------------------------------------------------

--
-- Table structure for table `periksa`
--

DROP TABLE IF EXISTS `periksa`;
CREATE TABLE IF NOT EXISTS `periksa` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_daftar_poli` int UNSIGNED NOT NULL,
  `tgl_periksa` date NOT NULL,
  `catatan` text NOT NULL,
  `biaya_periksa` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_daftar_poli` (`id_daftar_poli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `poli`
--

DROP TABLE IF EXISTS `poli`;
CREATE TABLE IF NOT EXISTS `poli` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_poli` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `poli`
--

INSERT INTO `poli` (`id`, `nama_poli`, `keterangan`) VALUES
(3, 'Poli Umum', 'Poliklinik BK 2024 Poli Umum'),
(4, 'Poli Anak', 'Poliklinik BK 2024 Poli Anak');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES
(1, 'admin', '$2a$12$sTYi7XBjaG3GNY4JuQ.WQu/fe3UaheRwakhw8fA81bzchTZNEORMm', 'admin'),
(7, 'Gunawan', '$2y$10$oAUfsm5QHtRZlaE98OZNOuU52y00lGcfgWilDNcw6GHxbBYSwXidG', 'dokter'),
(9, 'Dimas', '$2y$10$yRgqHpJM8OYfQg3dnvBwrOJm1xJKWxq01OeSfZMB4A7eMmDJtqaSy', 'dokter'),
(10, 'Suwayya', '$2y$10$EyVn73MaTN16CoalOVdiqum2T/HAb8gamkv7Hd7JIpHiDiRkDGWXG', 'pasien'),
(11, 'Syahrul', '$2y$10$y4Hg8ZQINyrbTty.sFXJNODrpg9.dsWMIGU8TPDbDvZGpriDhSdt6', 'pasien'),
(12, 'Pace', '$2y$10$/awzYn9HSUNHwigWmmxT0ejbNSxqmQlNGXuEQwZziMkSOU.Sfh7aS', 'pasien'),
(13, 'Juan', '$2y$10$o8HqnVixo30I6YvpwHqlaOLkkytTD49JYo1UmIeS73GQQt8Clzdai', 'pasien'),
(15, 'Rozikin', '$2y$10$nmM.U/NuUMizN8IZTiFfVu7Qnnbht7nro4uYxI19CEUs4t8aUbxjy', 'pasien'),
(16, 'rudi', '$2y$10$A7Zyzvc6QpbWKP2BxSabbuRmrSlf67NxegvOsoq/Av8pWrJLXweXy', 'pasien');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  ADD CONSTRAINT `fk_id_jadwal` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal_periksa` (`id`),
  ADD CONSTRAINT `fk_id_pasien` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id`);

--
-- Constraints for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD CONSTRAINT `fk_id_obat` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id`),
  ADD CONSTRAINT `fk_id_periksa` FOREIGN KEY (`id_periksa`) REFERENCES `periksa` (`id`);

--
-- Constraints for table `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `fk_id_poli` FOREIGN KEY (`id_poli`) REFERENCES `poli` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD CONSTRAINT `fk_id_dokter` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id`);

--
-- Constraints for table `periksa`
--
ALTER TABLE `periksa`
  ADD CONSTRAINT `fk_id_daftar_poli` FOREIGN KEY (`id_daftar_poli`) REFERENCES `daftar_poli` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
