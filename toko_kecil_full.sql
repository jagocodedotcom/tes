-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 24, 2026 at 10:45 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_kecil_full`
--

-- --------------------------------------------------------

--
-- Table structure for table `backup_database`
--

CREATE TABLE `backup_database` (
  `id` int(11) NOT NULL,
  `nama_backup` varchar(255) NOT NULL,
  `ukuran` varchar(50) DEFAULT NULL,
  `lokasi` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `biaya_operasional`
--

CREATE TABLE `biaya_operasional` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `jenis_biaya` varchar(100) NOT NULL,
  `kategori_biaya` enum('fixed','variable','one_time') DEFAULT 'fixed',
  `deskripsi` text DEFAULT NULL,
  `nominal` decimal(15,2) NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time DEFAULT NULL,
  `bukti` varchar(255) DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'approved',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `biaya_operasional`
--

INSERT INTO `biaya_operasional` (`id`, `user_id`, `jenis_biaya`, `kategori_biaya`, `deskripsi`, `nominal`, `tanggal`, `jam`, `bukti`, `status`, `created_at`) VALUES
(1, 1, 'Sewa Toko', 'fixed', 'Sewa ruko periode Januari 2026', 5000000.00, '2026-01-01', NULL, NULL, 'approved', '2026-07-24 07:06:06'),
(2, 1, 'Listrik', 'variable', 'Tagihan listrik Desember 2025', 500000.00, '2026-01-05', NULL, NULL, 'approved', '2026-07-24 07:06:06'),
(3, 1, 'Gaji Karyawan', 'fixed', 'Gaji kasir bulan Januari 2026', 3000000.00, '2026-01-25', NULL, NULL, 'approved', '2026-07-24 07:06:06'),
(4, 1, 'Internet', 'variable', 'Tagihan internet bulan Januari', 350000.00, '2026-01-25', NULL, NULL, 'approved', '2026-07-24 07:06:06'),
(5, 1, 'Air', 'variable', 'Tagihan PDAM bulan Januari', 150000.00, '2026-01-25', NULL, NULL, 'approved', '2026-07-24 07:06:06');

-- --------------------------------------------------------

--
-- Table structure for table `kasir_shift`
--

CREATE TABLE `kasir_shift` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shift_start` datetime NOT NULL,
  `shift_end` datetime DEFAULT NULL,
  `awal_kas` decimal(15,2) DEFAULT 0.00,
  `akhir_kas` decimal(15,2) DEFAULT 0.00,
  `total_penjualan` decimal(15,2) DEFAULT 0.00,
  `total_transaksi` int(11) DEFAULT 0,
  `selisih` decimal(15,2) DEFAULT 0.00,
  `status` enum('open','closed') DEFAULT 'open',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kasir_shift`
--

INSERT INTO `kasir_shift` (`id`, `user_id`, `shift_start`, `shift_end`, `awal_kas`, `akhir_kas`, `total_penjualan`, `total_transaksi`, `selisih`, `status`, `created_at`) VALUES
(1, 1, '2026-07-24 15:10:26', '2026-07-24 15:10:38', 0.00, 0.00, 0.00, 0, 0.00, 'closed', '2026-07-24 08:10:26');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama_kategori`, `deskripsi`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'Makanan', 'Produk makanan ringan dan berat', 'fas fa-utensils', '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(2, 'Minuman', 'Produk minuman kemasan', 'fas fa-glass-cheers', '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(3, 'Perlengkapan Rumah', 'Perlengkapan rumah tangga', 'fas fa-home', '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(4, 'Kesehatan', 'Produk kesehatan dan kebersihan', 'fas fa-heartbeat', '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(5, 'Elektronik', 'Aksesoris dan perangkat elektronik', 'fas fa-microchip', '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(6, 'Pakaian', 'Produk pakaian dan aksesoris', 'fas fa-tshirt', '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(7, 'Alat Tulis', 'Perlengkapan sekolah dan kantor', 'fas fa-pen', '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(8, 'Olahraga', 'Perlengkapan olahraga', 'fas fa-running', '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(9, 'Otomotif', 'Aksesoris kendaraan', 'fas fa-car', '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(10, 'Mainan', 'Mainan anak-anak dan edukasi', 'fas fa-gamepad', '2026-07-24 07:06:06', '2026-07-24 07:06:06');

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE `keranjang` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `produk_id` int(11) DEFAULT NULL,
  `jumlah` int(11) NOT NULL,
  `harga_jual` decimal(15,2) NOT NULL,
  `diskon_item` decimal(15,2) DEFAULT 0.00,
  `subtotal` decimal(15,2) NOT NULL,
  `session_id` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `konfigurasi_toko`
--

CREATE TABLE `konfigurasi_toko` (
  `id` int(11) NOT NULL,
  `nama_toko` varchar(100) NOT NULL,
  `alamat_toko` text DEFAULT NULL,
  `no_telp` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `footer` text DEFAULT NULL,
  `pajak_percent` decimal(5,2) DEFAULT 11.00,
  `diskon_maksimal` decimal(5,2) DEFAULT 50.00,
  `currency` varchar(10) DEFAULT 'Rp',
  `timezone` varchar(50) DEFAULT 'Asia/Jakarta',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `konfigurasi_toko`
--

INSERT INTO `konfigurasi_toko` (`id`, `nama_toko`, `alamat_toko`, `no_telp`, `email`, `logo`, `footer`, `pajak_percent`, `diskon_maksimal`, `currency`, `timezone`, `created_at`, `updated_at`) VALUES
(1, 'Toko Kecil', 'Jl. Toko No. 1, Jakarta', '021-555-0000', 'info@tokokecil.com', NULL, '© 2026 Toko Kecil - All Rights Reserved', 11.00, 50.00, 'Rp', 'Asia/Jakarta', '2026-07-24 07:06:06', '2026-07-24 07:06:06');

-- --------------------------------------------------------

--
-- Table structure for table `log_aktivitas`
--

CREATE TABLE `log_aktivitas` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `aktivitas` varchar(255) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `log_aktivitas`
--

INSERT INTO `log_aktivitas` (`id`, `user_id`, `aktivitas`, `module`, `action`, `detail`, `ip_address`, `user_agent`, `created_at`) VALUES
(1, 1, 'Pembelian', 'pembelian', 'insert', 'PO: PO-20260105-0001, Total: 140000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(2, 1, 'Pembelian', 'pembelian', 'insert', 'PO: PO-20260105-0002, Total: 160000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(3, 1, 'Pembelian', 'pembelian', 'insert', 'PO: PO-20260110-0003, Total: 240000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(4, 1, 'Pembelian', 'pembelian', 'insert', 'PO: PO-20260115-0004, Total: 300000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(5, 1, 'Pembelian', 'pembelian', 'insert', 'PO: PO-20260120-0005, Total: 500000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(6, 1, 'Pembelian', 'pembelian', 'insert', 'PO: PO-20260205-0006, Total: 112000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(7, 1, 'Pembelian', 'pembelian', 'insert', 'PO: PO-20260210-0007, Total: 210000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(8, 1, 'Pembelian', 'pembelian', 'insert', 'PO: PO-20260215-0008, Total: 225000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(9, 1, 'Pembelian', 'pembelian', 'insert', 'PO: PO-20260220-0009, Total: 220000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(10, 1, 'Pembelian', 'pembelian', 'insert', 'PO: PO-20260305-0010, Total: 125000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(11, 1, 'Pembelian', 'pembelian', 'insert', 'PO: PO-20260310-0011, Total: 192500.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(12, 1, 'Pembelian', 'pembelian', 'insert', 'PO: PO-20260315-0012, Total: 240000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(13, 1, 'Pembelian', 'pembelian', 'insert', 'PO: PO-20260320-0013, Total: 120000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(14, 1, 'Pembelian', 'pembelian', 'insert', 'PO: PO-20260405-0014, Total: 300000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(15, 1, 'Pembelian', 'pembelian', 'insert', 'PO: PO-20260410-0015, Total: 165000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(16, 1, 'Pembelian', 'pembelian', 'insert', 'PO: PO-20260415-0016, Total: 195000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(17, 1, 'Pembelian', 'pembelian', 'insert', 'PO: PO-20260505-0017, Total: 280000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(18, 1, 'Pembelian', 'pembelian', 'insert', 'PO: PO-20260510-0018, Total: 137500.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(19, 1, 'Pembelian', 'pembelian', 'insert', 'PO: PO-20260515-0019, Total: 225000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(20, 1, 'Pembelian', 'pembelian', 'insert', 'PO: PO-20260605-0020, Total: 240000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(21, 1, 'Pembelian', 'pembelian', 'insert', 'PO: PO-20260610-0021, Total: 122500.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(22, 1, 'Pembelian', 'pembelian', 'insert', 'PO: PO-20260615-0022, Total: 240000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(23, 1, 'Pembelian', 'pembelian', 'insert', 'PO: PO-20260705-0023, Total: 240000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(24, 1, 'Pembelian', 'pembelian', 'insert', 'PO: PO-20260710-0024, Total: 105000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(25, 1, 'Pembelian', 'pembelian', 'insert', 'PO: PO-20260715-0025, Total: 150000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(26, 2, 'Penjualan', 'penjualan', 'insert', 'Invoice: INV-20260101-1001, Total: 17500.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(27, 2, 'Penjualan', 'penjualan', 'insert', 'Invoice: INV-20260101-1002, Total: 15000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(28, 2, 'Penjualan', 'penjualan', 'insert', 'Invoice: INV-20260102-1003, Total: 20000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(29, 2, 'Penjualan', 'penjualan', 'insert', 'Invoice: INV-20260102-1004, Total: 15000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(30, 2, 'Penjualan', 'penjualan', 'insert', 'Invoice: INV-20260103-1005, Total: 65000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(31, 2, 'Penjualan', 'penjualan', 'insert', 'Invoice: INV-20260103-1006, Total: 36000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(32, 2, 'Penjualan', 'penjualan', 'insert', 'Invoice: INV-20260104-1007, Total: 17500.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(33, 2, 'Penjualan', 'penjualan', 'insert', 'Invoice: INV-20260104-1008, Total: 33000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(34, 2, 'Penjualan', 'penjualan', 'insert', 'Invoice: INV-20260105-1009, Total: 28000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(35, 2, 'Penjualan', 'penjualan', 'insert', 'Invoice: INV-20260105-1010, Total: 60000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(36, 2, 'Penjualan', 'penjualan', 'insert', 'Invoice: INV-20260201-2001, Total: 32000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(37, 2, 'Penjualan', 'penjualan', 'insert', 'Invoice: INV-20260201-2002, Total: 13500.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(38, 2, 'Penjualan', 'penjualan', 'insert', 'Invoice: INV-20260202-2003, Total: 26000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(39, 2, 'Penjualan', 'penjualan', 'insert', 'Invoice: INV-20260202-2004, Total: 24000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(40, 2, 'Penjualan', 'penjualan', 'insert', 'Invoice: INV-20260203-2005, Total: 135000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(41, 2, 'Penjualan', 'penjualan', 'insert', 'Invoice: INV-20260301-3001, Total: 17500.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(42, 2, 'Penjualan', 'penjualan', 'insert', 'Invoice: INV-20260301-3002, Total: 15000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(43, 2, 'Penjualan', 'penjualan', 'insert', 'Invoice: INV-20260302-3003, Total: 40000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(44, 2, 'Penjualan', 'penjualan', 'insert', 'Invoice: INV-20260401-4001, Total: 19200.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(45, 2, 'Penjualan', 'penjualan', 'insert', 'Invoice: INV-20260401-4002, Total: 21000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(46, 2, 'Penjualan', 'penjualan', 'insert', 'Invoice: INV-20260501-5001, Total: 36000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(47, 2, 'Penjualan', 'penjualan', 'insert', 'Invoice: INV-20260501-5002, Total: 21000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(48, 2, 'Penjualan', 'penjualan', 'insert', 'Invoice: INV-20260601-6001, Total: 40000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(49, 2, 'Penjualan', 'penjualan', 'insert', 'Invoice: INV-20260601-6002, Total: 13500.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(50, 2, 'Penjualan', 'penjualan', 'insert', 'Invoice: INV-20260701-7001, Total: 18000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(51, 2, 'Penjualan', 'penjualan', 'insert', 'Invoice: INV-20260701-7002, Total: 26000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(52, 2, 'Penjualan', 'penjualan', 'insert', 'Invoice: INV-20260702-7003, Total: 18000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(53, 2, 'Penjualan', 'penjualan', 'insert', 'Invoice: INV-20260702-7004, Total: 130000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(54, 2, 'Penjualan', 'penjualan', 'insert', 'Invoice: INV-20260703-7005, Total: 35000.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(55, 2, 'Penjualan', 'penjualan', 'insert', 'Invoice: INV-20260703-7006, Total: 10500.00', '127.0.0.1', NULL, '2026-07-24 07:06:06'),
(56, 1, 'Login', 'auth', 'login', 'User admin login ke sistem', NULL, NULL, '2026-07-24 07:06:06'),
(57, 1, 'Tambah Kategori', 'kategori', 'create', 'Menambah kategori Makanan', NULL, NULL, '2026-07-24 07:06:06'),
(58, 1, 'Tambah Supplier', 'supplier', 'create', 'Menambah supplier PT Indofood', NULL, NULL, '2026-07-24 07:06:06'),
(59, 1, 'Tambah Produk', 'produk', 'create', 'Menambah produk Indomie Goreng', NULL, NULL, '2026-07-24 07:06:06'),
(60, 2, 'Login', 'auth', 'login', 'User kasir1 login ke sistem', NULL, NULL, '2026-07-24 07:06:06'),
(61, 2, 'Penjualan', 'penjualan', 'create', 'Invoice: INV-20260101-1001', NULL, NULL, '2026-07-24 07:06:06'),
(62, 2, 'Penjualan', 'penjualan', 'create', 'Invoice: INV-20260101-1002', NULL, NULL, '2026-07-24 07:06:06'),
(63, 1, 'Pembelian', 'pembelian', 'create', 'PO: PO-20260105-0001', NULL, NULL, '2026-07-24 07:06:06'),
(64, 2, 'Logout', 'auth', 'logout', 'User kasir1 logout', NULL, NULL, '2026-07-24 07:06:06'),
(65, 1, 'Penjualan', 'penjualan', 'insert', 'Invoice: INV-20260724-4004, Total: 9000.00', '127.0.0.1', NULL, '2026-07-24 07:39:10'),
(66, 1, 'Penjualan', NULL, NULL, 'Invoice: INV-20260724-4004, Produk ID: 12, Jumlah: 1', '::1', NULL, '2026-07-24 07:39:10'),
(67, 1, 'Retur Penjualan', NULL, NULL, 'Retur ID: 0', '::1', NULL, '2026-07-24 07:55:42'),
(68, 1, 'Backup Database', NULL, NULL, 'File: backup_2026-07-24_15-03-02.sql', '::1', NULL, '2026-07-24 08:03:02'),
(69, 1, 'Buka Shift', NULL, NULL, 'Awal Kas: 0', '::1', NULL, '2026-07-24 08:10:26'),
(70, 1, 'Tutup Shift', NULL, NULL, 'Akhir Kas: 0, Selisih: 0', '::1', NULL, '2026-07-24 08:10:38'),
(71, 1, 'Logout', NULL, NULL, 'User logout', '::1', NULL, '2026-07-24 08:10:54'),
(72, 1, 'Login', NULL, NULL, 'User login berhasil', '::1', NULL, '2026-07-24 08:10:55');

-- --------------------------------------------------------

--
-- Table structure for table `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `judul` varchar(100) NOT NULL,
  `pesan` text DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` int(11) NOT NULL,
  `kode_pelanggan` varchar(20) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `alamat` text DEFAULT NULL,
  `no_telp` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT 'L',
  `tanggal_lahir` date DEFAULT NULL,
  `poin` int(11) DEFAULT 0,
  `total_belanja` decimal(15,2) DEFAULT 0.00,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `kode_pelanggan`, `nama_pelanggan`, `alamat`, `no_telp`, `email`, `jenis_kelamin`, `tanggal_lahir`, `poin`, `total_belanja`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'CUST-001', 'Budi Santoso', 'Jl. Mawar No. 1, Jakarta', '081234567895', 'budi@email.com', 'L', '1990-01-15', 0, 0.00, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(2, 'CUST-002', 'Siti Rahayu', 'Jl. Melati No. 2, Bandung', '081234567896', 'siti@email.com', 'P', '1995-06-20', 0, 0.00, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(3, 'CUST-003', 'Agus Wijaya', 'Jl. Anggrek No. 3, Surabaya', '081234567897', 'agus@email.com', 'L', '1988-12-10', 0, 0.00, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(4, 'CUST-004', 'Dewi Lestari', 'Jl. Kenanga No. 4, Yogyakarta', '081234567898', 'dewi@email.com', 'P', '1992-03-25', 0, 0.00, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id` int(11) NOT NULL,
  `no_po` varchar(50) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `produk_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `jumlah` int(11) NOT NULL,
  `harga_beli_saat` decimal(15,2) NOT NULL,
  `total_harga` decimal(15,2) NOT NULL,
  `diskon` decimal(15,2) DEFAULT 0.00,
  `total_bayar` decimal(15,2) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `jam_pembelian` time DEFAULT NULL,
  `status` enum('selesai','pending','batal','draft') DEFAULT 'selesai',
  `catatan` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id`, `no_po`, `user_id`, `produk_id`, `supplier_id`, `jumlah`, `harga_beli_saat`, `total_harga`, `diskon`, `total_bayar`, `tanggal_pembelian`, `jam_pembelian`, `status`, `catatan`, `created_at`) VALUES
(1, 'PO-20260105-0001', 1, 1, 1, 50, 2800.00, 140000.00, 0.00, 140000.00, '2026-01-05', NULL, 'selesai', NULL, '2026-07-24 07:06:06'),
(2, 'PO-20260105-0002', 1, 11, 2, 40, 4000.00, 160000.00, 0.00, 160000.00, '2026-01-05', NULL, 'selesai', NULL, '2026-07-24 07:06:06'),
(3, 'PO-20260110-0003', 1, 21, 4, 30, 8000.00, 240000.00, 0.00, 240000.00, '2026-01-10', NULL, 'selesai', NULL, '2026-07-24 07:06:06'),
(4, 'PO-20260115-0004', 1, 31, 3, 25, 12000.00, 300000.00, 0.00, 300000.00, '2026-01-15', NULL, 'selesai', NULL, '2026-07-24 07:06:06'),
(5, 'PO-20260120-0005', 1, 41, 5, 20, 25000.00, 500000.00, 0.00, 500000.00, '2026-01-20', NULL, 'selesai', NULL, '2026-07-24 07:06:06'),
(6, 'PO-20260205-0006', 1, 2, 1, 40, 2800.00, 112000.00, 0.00, 112000.00, '2026-02-05', NULL, 'selesai', NULL, '2026-07-24 07:06:06'),
(7, 'PO-20260210-0007', 1, 12, 2, 30, 7000.00, 210000.00, 0.00, 210000.00, '2026-02-10', NULL, 'selesai', NULL, '2026-07-24 07:06:06'),
(8, 'PO-20260215-0008', 1, 22, 4, 25, 9000.00, 225000.00, 0.00, 225000.00, '2026-02-15', NULL, 'selesai', NULL, '2026-07-24 07:06:06'),
(9, 'PO-20260220-0009', 1, 32, 4, 20, 11000.00, 220000.00, 0.00, 220000.00, '2026-02-20', NULL, 'selesai', NULL, '2026-07-24 07:06:06'),
(10, 'PO-20260305-0010', 1, 3, 1, 50, 2500.00, 125000.00, 0.00, 125000.00, '2026-03-05', NULL, 'selesai', NULL, '2026-07-24 07:06:06'),
(11, 'PO-20260310-0011', 1, 13, 2, 35, 5500.00, 192500.00, 0.00, 192500.00, '2026-03-10', NULL, 'selesai', NULL, '2026-07-24 07:06:06'),
(12, 'PO-20260315-0012', 1, 23, 4, 20, 12000.00, 240000.00, 0.00, 240000.00, '2026-03-15', NULL, 'selesai', NULL, '2026-07-24 07:06:06'),
(13, 'PO-20260320-0013', 1, 33, 4, 15, 8000.00, 120000.00, 0.00, 120000.00, '2026-03-20', NULL, 'selesai', NULL, '2026-07-24 07:06:06'),
(14, 'PO-20260405-0014', 1, 4, 1, 25, 12000.00, 300000.00, 0.00, 300000.00, '2026-04-05', NULL, 'selesai', NULL, '2026-07-24 07:06:06'),
(15, 'PO-20260410-0015', 1, 14, 2, 30, 5500.00, 165000.00, 0.00, 165000.00, '2026-04-10', NULL, 'selesai', NULL, '2026-07-24 07:06:06'),
(16, 'PO-20260415-0016', 1, 24, 4, 15, 13000.00, 195000.00, 0.00, 195000.00, '2026-04-15', NULL, 'selesai', NULL, '2026-07-24 07:06:06'),
(17, 'PO-20260505-0017', 1, 5, 1, 20, 14000.00, 280000.00, 0.00, 280000.00, '2026-05-05', NULL, 'selesai', NULL, '2026-07-24 07:06:06'),
(18, 'PO-20260510-0018', 1, 15, 2, 25, 5500.00, 137500.00, 0.00, 137500.00, '2026-05-10', NULL, 'selesai', NULL, '2026-07-24 07:06:06'),
(19, 'PO-20260515-0019', 1, 25, 4, 15, 15000.00, 225000.00, 0.00, 225000.00, '2026-05-15', NULL, 'selesai', NULL, '2026-07-24 07:06:06'),
(20, 'PO-20260605-0020', 1, 6, 1, 30, 8000.00, 240000.00, 0.00, 240000.00, '2026-06-05', NULL, 'selesai', NULL, '2026-07-24 07:06:06'),
(21, 'PO-20260610-0021', 1, 16, 2, 35, 3500.00, 122500.00, 0.00, 122500.00, '2026-06-10', NULL, 'selesai', NULL, '2026-07-24 07:06:06'),
(22, 'PO-20260615-0022', 1, 26, 4, 20, 12000.00, 240000.00, 0.00, 240000.00, '2026-06-15', NULL, 'selesai', NULL, '2026-07-24 07:06:06'),
(23, 'PO-20260705-0023', 1, 7, 1, 40, 6000.00, 240000.00, 0.00, 240000.00, '2026-07-05', NULL, 'selesai', NULL, '2026-07-24 07:06:06'),
(24, 'PO-20260710-0024', 1, 17, 2, 30, 3500.00, 105000.00, 0.00, 105000.00, '2026-07-10', NULL, 'selesai', NULL, '2026-07-24 07:06:06'),
(25, 'PO-20260715-0025', 1, 27, 4, 15, 10000.00, 150000.00, 0.00, 150000.00, '2026-07-15', NULL, 'selesai', NULL, '2026-07-24 07:06:06');

--
-- Triggers `pembelian`
--
DELIMITER $$
CREATE TRIGGER `log_pembelian_insert` AFTER INSERT ON `pembelian` FOR EACH ROW BEGIN
    INSERT INTO log_aktivitas (user_id, aktivitas, module, action, detail, ip_address)
    VALUES (NEW.user_id, 'Pembelian', 'pembelian', 'insert', CONCAT('PO: ', NEW.no_po, ', Total: ', NEW.total_bayar), '127.0.0.1');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_stok_pembelian` AFTER INSERT ON `pembelian` FOR EACH ROW BEGIN
    IF NEW.status = 'selesai' THEN
        UPDATE produk SET stok = stok + NEW.jumlah WHERE id = NEW.produk_id;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(11) NOT NULL,
  `no_invoice` varchar(50) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `produk_id` int(11) DEFAULT NULL,
  `jumlah` int(11) NOT NULL,
  `harga_jual_saat` decimal(15,2) NOT NULL,
  `total_penjualan` decimal(15,2) NOT NULL,
  `diskon` decimal(15,2) DEFAULT 0.00,
  `pajak` decimal(15,2) DEFAULT 0.00,
  `total_bayar` decimal(15,2) NOT NULL,
  `tunai` decimal(15,2) DEFAULT 0.00,
  `kembalian` decimal(15,2) DEFAULT 0.00,
  `tanggal_penjualan` date NOT NULL,
  `jam_penjualan` time DEFAULT NULL,
  `pelanggan` varchar(100) DEFAULT NULL,
  `pelanggan_id` int(11) DEFAULT NULL,
  `metode_pembayaran` enum('tunai','transfer','qris','credit_card','debit') DEFAULT 'tunai',
  `status` enum('selesai','pending','batal','draft') DEFAULT 'selesai',
  `catatan` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id`, `no_invoice`, `user_id`, `produk_id`, `jumlah`, `harga_jual_saat`, `total_penjualan`, `diskon`, `pajak`, `total_bayar`, `tunai`, `kembalian`, `tanggal_penjualan`, `jam_penjualan`, `pelanggan`, `pelanggan_id`, `metode_pembayaran`, `status`, `catatan`, `created_at`) VALUES
(1, 'INV-20260101-1001', 2, 1, 5, 3500.00, 17500.00, 0.00, 0.00, 17500.00, 20000.00, 2500.00, '2026-01-01', NULL, 'Budi Santoso', NULL, 'tunai', 'selesai', NULL, '2026-07-24 07:06:06'),
(2, 'INV-20260101-1002', 2, 11, 3, 5000.00, 15000.00, 0.00, 0.00, 15000.00, 15000.00, 0.00, '2026-01-01', NULL, 'Siti Rahayu', NULL, 'transfer', 'selesai', NULL, '2026-07-24 07:06:06'),
(3, 'INV-20260102-1003', 2, 21, 2, 10000.00, 20000.00, 0.00, 0.00, 20000.00, 20000.00, 0.00, '2026-01-02', NULL, 'Ahmad Fauzi', NULL, 'tunai', 'selesai', NULL, '2026-07-24 07:06:06'),
(4, 'INV-20260102-1004', 2, 31, 1, 15000.00, 15000.00, 0.00, 0.00, 15000.00, 15000.00, 0.00, '2026-01-02', NULL, 'Dewi Lestari', NULL, 'qris', 'batal', NULL, '2026-07-24 07:06:06'),
(5, 'INV-20260103-1005', 2, 41, 2, 35000.00, 70000.00, 5000.00, 0.00, 65000.00, 65000.00, 0.00, '2026-01-03', NULL, 'Rudi Hartono', NULL, 'tunai', 'selesai', NULL, '2026-07-24 07:06:06'),
(6, 'INV-20260103-1006', 2, 12, 4, 9000.00, 36000.00, 0.00, 0.00, 36000.00, 36000.00, 0.00, '2026-01-03', NULL, 'Ani Wijaya', NULL, 'transfer', 'selesai', NULL, '2026-07-24 07:06:06'),
(7, 'INV-20260104-1007', 2, 2, 5, 3500.00, 17500.00, 0.00, 0.00, 17500.00, 20000.00, 2500.00, '2026-01-04', NULL, 'Slamet Riyadi', NULL, 'tunai', 'selesai', NULL, '2026-07-24 07:06:06'),
(8, 'INV-20260104-1008', 2, 22, 3, 11000.00, 33000.00, 0.00, 0.00, 33000.00, 33000.00, 0.00, '2026-01-04', NULL, 'Rina Sari', NULL, 'qris', 'selesai', NULL, '2026-07-24 07:06:06'),
(9, 'INV-20260105-1009', 2, 32, 2, 14000.00, 28000.00, 0.00, 0.00, 28000.00, 28000.00, 0.00, '2026-01-05', NULL, 'Hendra Gunawan', NULL, 'tunai', 'selesai', NULL, '2026-07-24 07:06:06'),
(10, 'INV-20260105-1010', 2, 42, 3, 20000.00, 60000.00, 0.00, 0.00, 60000.00, 60000.00, 0.00, '2026-01-05', NULL, 'Lisa Anggraini', NULL, 'transfer', 'selesai', NULL, '2026-07-24 07:06:06'),
(11, 'INV-20260201-2001', 2, 7, 4, 8000.00, 32000.00, 0.00, 0.00, 32000.00, 32000.00, 0.00, '2026-02-01', NULL, 'Yusuf Maulana', NULL, 'tunai', 'selesai', NULL, '2026-07-24 07:06:06'),
(12, 'INV-20260201-2002', 2, 17, 3, 4500.00, 13500.00, 0.00, 0.00, 13500.00, 13500.00, 0.00, '2026-02-01', NULL, 'Nadia Putri', NULL, 'transfer', 'selesai', NULL, '2026-07-24 07:06:06'),
(13, 'INV-20260202-2003', 2, 27, 2, 13000.00, 26000.00, 0.00, 0.00, 26000.00, 26000.00, 0.00, '2026-02-02', NULL, 'Gilang Ramadhan', NULL, 'tunai', 'selesai', NULL, '2026-07-24 07:06:06'),
(14, 'INV-20260202-2004', 2, 37, 4, 6000.00, 24000.00, 0.00, 0.00, 24000.00, 24000.00, 0.00, '2026-02-02', NULL, 'Putri Ayu', NULL, 'qris', 'selesai', NULL, '2026-07-24 07:06:06'),
(15, 'INV-20260203-2005', 2, 47, 2, 70000.00, 140000.00, 5000.00, 0.00, 135000.00, 135000.00, 0.00, '2026-02-03', NULL, 'Irfan Hakim', NULL, 'tunai', 'selesai', NULL, '2026-07-24 07:06:06'),
(16, 'INV-20260301-3001', 2, 1, 5, 3500.00, 17500.00, 0.00, 0.00, 17500.00, 17500.00, 0.00, '2026-03-01', NULL, 'Mega Sari', NULL, 'tunai', 'selesai', NULL, '2026-07-24 07:06:06'),
(17, 'INV-20260301-3002', 2, 11, 3, 5000.00, 15000.00, 0.00, 0.00, 15000.00, 15000.00, 0.00, '2026-03-01', NULL, 'Umar Bakri', NULL, 'transfer', 'selesai', NULL, '2026-07-24 07:06:06'),
(18, 'INV-20260302-3003', 2, 21, 4, 10000.00, 40000.00, 0.00, 0.00, 40000.00, 40000.00, 0.00, '2026-03-02', NULL, 'Nur Hidayah', NULL, 'tunai', 'selesai', NULL, '2026-07-24 07:06:06'),
(19, 'INV-20260401-4001', 2, 3, 6, 3200.00, 19200.00, 0.00, 0.00, 19200.00, 19200.00, 0.00, '2026-04-01', NULL, 'Retno Wulandari', NULL, 'tunai', 'selesai', NULL, '2026-07-24 07:06:06'),
(20, 'INV-20260401-4002', 2, 13, 3, 7000.00, 21000.00, 0.00, 0.00, 21000.00, 21000.00, 0.00, '2026-04-01', NULL, 'Didik Setyawan', NULL, 'transfer', 'selesai', NULL, '2026-07-24 07:06:06'),
(21, 'INV-20260501-5001', 2, 5, 2, 18000.00, 36000.00, 0.00, 0.00, 36000.00, 36000.00, 0.00, '2026-05-01', NULL, 'Dina Mariana', NULL, 'tunai', 'selesai', NULL, '2026-07-24 07:06:06'),
(22, 'INV-20260501-5002', 2, 15, 3, 7000.00, 21000.00, 0.00, 0.00, 21000.00, 21000.00, 0.00, '2026-05-01', NULL, 'Herman Taufik', NULL, 'transfer', 'selesai', NULL, '2026-07-24 07:06:06'),
(23, 'INV-20260601-6001', 2, 7, 5, 8000.00, 40000.00, 0.00, 0.00, 40000.00, 40000.00, 0.00, '2026-06-01', NULL, 'Gita Rahayu', NULL, 'tunai', 'selesai', NULL, '2026-07-24 07:06:06'),
(24, 'INV-20260601-6002', 2, 16, 3, 4500.00, 13500.00, 0.00, 0.00, 13500.00, 13500.00, 0.00, '2026-06-01', NULL, 'Fahri Rizki', NULL, 'transfer', 'selesai', NULL, '2026-07-24 07:06:06'),
(25, 'INV-20260701-7001', 2, 17, 4, 4500.00, 18000.00, 0.00, 0.00, 18000.00, 18000.00, 0.00, '2026-07-01', NULL, 'Tia Safitri', NULL, 'tunai', 'selesai', NULL, '2026-07-24 07:06:06'),
(26, 'INV-20260701-7002', 2, 27, 2, 13000.00, 26000.00, 0.00, 0.00, 26000.00, 26000.00, 0.00, '2026-07-01', NULL, 'Danu Prasetyo', NULL, 'transfer', 'selesai', NULL, '2026-07-24 07:06:06'),
(27, 'INV-20260702-7003', 2, 37, 3, 6000.00, 18000.00, 0.00, 0.00, 18000.00, 18000.00, 0.00, '2026-07-02', NULL, 'Cici Amelia', NULL, 'tunai', 'selesai', NULL, '2026-07-24 07:06:06'),
(28, 'INV-20260702-7004', 2, 47, 2, 70000.00, 140000.00, 10000.00, 0.00, 130000.00, 130000.00, 0.00, '2026-07-02', NULL, 'Ade Firmansyah', NULL, 'qris', 'selesai', NULL, '2026-07-24 07:06:06'),
(29, 'INV-20260703-7005', 2, 9, 5, 7000.00, 35000.00, 0.00, 0.00, 35000.00, 35000.00, 0.00, '2026-07-03', NULL, 'Yoga Pratama', NULL, 'tunai', 'selesai', NULL, '2026-07-24 07:06:06'),
(30, 'INV-20260703-7006', 2, 18, 3, 3500.00, 10500.00, 0.00, 0.00, 10500.00, 10500.00, 0.00, '2026-07-03', NULL, 'Neni Safira', NULL, 'transfer', 'selesai', NULL, '2026-07-24 07:06:06'),
(31, 'INV-20260724-4004', 1, 12, 1, 9000.00, 9000.00, 0.00, 0.00, 9000.00, 0.00, 0.00, '2026-07-24', NULL, 'tes', NULL, 'tunai', 'selesai', NULL, '2026-07-24 07:39:10');

--
-- Triggers `penjualan`
--
DELIMITER $$
CREATE TRIGGER `log_penjualan_insert` AFTER INSERT ON `penjualan` FOR EACH ROW BEGIN
    INSERT INTO log_aktivitas (user_id, aktivitas, module, action, detail, ip_address)
    VALUES (NEW.user_id, 'Penjualan', 'penjualan', 'insert', CONCAT('Invoice: ', NEW.no_invoice, ', Total: ', NEW.total_bayar), '127.0.0.1');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_stok_penjualan` AFTER INSERT ON `penjualan` FOR EACH ROW BEGIN
    IF NEW.status = 'selesai' THEN
        UPDATE produk SET stok = stok - NEW.jumlah WHERE id = NEW.produk_id;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `kode_produk` varchar(50) NOT NULL,
  `barcode` varchar(50) DEFAULT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `harga_beli` decimal(15,2) NOT NULL,
  `harga_jual` decimal(15,2) NOT NULL,
  `harga_jual_2` decimal(15,2) DEFAULT NULL,
  `harga_jual_3` decimal(15,2) DEFAULT NULL,
  `stok` int(11) DEFAULT 0,
  `stok_minimal` int(11) DEFAULT 5,
  `stok_maksimal` int(11) DEFAULT 100,
  `satuan` varchar(20) DEFAULT NULL,
  `berat` decimal(10,2) DEFAULT 0.00,
  `deskripsi` text DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `kode_produk`, `barcode`, `nama_produk`, `kategori_id`, `supplier_id`, `harga_beli`, `harga_jual`, `harga_jual_2`, `harga_jual_3`, `stok`, `stok_minimal`, `stok_maksimal`, `satuan`, `berat`, `deskripsi`, `gambar`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'PRD-20260724-0001', NULL, 'Indomie Goreng Original', 1, 1, 2800.00, 3500.00, NULL, NULL, 160, 15, 100, 'Pcs', 0.00, 'Indomie goreng rasa original 80gr', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(2, 'PRD-20260724-0002', NULL, 'Indomie Kuah Ayam', 1, 1, 2800.00, 3500.00, NULL, NULL, 135, 15, 100, 'Pcs', 0.00, 'Indomie kuah rasa ayam spesial 80gr', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(3, 'PRD-20260724-0003', NULL, 'Mie Sedap Goreng', 1, 1, 2500.00, 3200.00, NULL, NULL, 154, 15, 100, 'Pcs', 0.00, 'Mie sedap goreng original 80gr', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(4, 'PRD-20260724-0004', NULL, 'Roti Tawar Sari Roti', 1, 1, 12000.00, 15000.00, NULL, NULL, 70, 5, 100, 'Bungkus', 0.00, 'Roti tawar putih 400gr', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(5, 'PRD-20260724-0005', NULL, 'Roti Gandum Sari Roti', 1, 1, 14000.00, 18000.00, NULL, NULL, 53, 5, 100, 'Bungkus', 0.00, 'Roti gandum sehat 350gr', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(6, 'PRD-20260724-0006', NULL, 'Biskuit Regal', 1, 1, 8000.00, 10000.00, NULL, NULL, 90, 8, 100, 'Pcs', 0.00, 'Biskuit gandum regal 200gr', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(7, 'PRD-20260724-0007', NULL, 'Biskuit Marie', 1, 1, 6000.00, 8000.00, NULL, NULL, 101, 10, 100, 'Pcs', 0.00, 'Biskuit marie manis 150gr', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(8, 'PRD-20260724-0008', NULL, 'Cokelat Silverqueen', 1, 1, 15000.00, 20000.00, NULL, NULL, 40, 5, 100, 'Pcs', 0.00, 'Cokelat silverqueen 80gr', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(9, 'PRD-20260724-0009', NULL, 'Permen Kopiko', 1, 1, 5000.00, 7000.00, NULL, NULL, 75, 10, 100, 'Pcs', 0.00, 'Permen kopiko coffee candy 50gr', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(10, 'PRD-20260724-0010', NULL, 'Keripik Kentang', 1, 1, 8000.00, 10000.00, NULL, NULL, 55, 8, 100, 'Pcs', 0.00, 'Keripik kentang original 100gr', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(11, 'PRD-20260724-0011', NULL, 'Aqua 600ml', 2, 2, 4000.00, 5000.00, NULL, NULL, 124, 15, 100, 'Botol', 0.00, 'Air mineral aqua 600ml', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(12, 'PRD-20260724-0012', NULL, 'Aqua 1500ml', 2, 2, 7000.00, 9000.00, NULL, NULL, 85, 10, 100, 'Botol', 0.00, 'Air mineral aqua 1500ml', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:39:10'),
(13, 'PRD-20260724-0013', NULL, 'Coca Cola 330ml', 2, 2, 5500.00, 7000.00, NULL, NULL, 107, 10, 100, 'Kaleng', 0.00, 'Coca cola kaleng 330ml', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(14, 'PRD-20260724-0014', NULL, 'Sprite 330ml', 2, 2, 5500.00, 7000.00, NULL, NULL, 100, 10, 100, 'Kaleng', 0.00, 'Sprite kaleng 330ml', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(15, 'PRD-20260724-0015', NULL, 'Fanta 330ml', 2, 2, 5500.00, 7000.00, NULL, NULL, 87, 10, 100, 'Kaleng', 0.00, 'Fanta stroberi kaleng 330ml', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(16, 'PRD-20260724-0016', NULL, 'Teh Botol Sosro 350ml', 2, 2, 3500.00, 4500.00, NULL, NULL, 117, 12, 100, 'Botol', 0.00, 'Teh botol sosro 350ml', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(17, 'PRD-20260724-0017', NULL, 'Teh Pucuk 350ml', 2, 2, 3500.00, 4500.00, NULL, NULL, 103, 12, 100, 'Botol', 0.00, 'Teh pucuk harum 350ml', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(18, 'PRD-20260724-0018', NULL, 'Nutrisari Jeruk', 2, 2, 2500.00, 3500.00, NULL, NULL, 87, 15, 100, 'Pcs', 0.00, 'Minuman serbuk nutrisari jeruk 4 sachet', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(19, 'PRD-20260724-0019', NULL, 'Milo 200ml', 2, 2, 6000.00, 8000.00, NULL, NULL, 50, 8, 100, 'Pcs', 0.00, 'Minuman cokelat milo 200ml', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(20, 'PRD-20260724-0020', NULL, 'Bear Brand 330ml', 2, 2, 8000.00, 10000.00, NULL, NULL, 40, 5, 100, 'Kaleng', 0.00, 'Susu bear brand kaleng 330ml', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(21, 'PRD-20260724-0021', NULL, 'Sabun Mandi Lifebuoy', 3, 4, 8000.00, 10000.00, NULL, NULL, 84, 10, 100, 'Pcs', 0.00, 'Sabun mandi lifebuoy 80gr', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(22, 'PRD-20260724-0022', NULL, 'Sabun Mandi Lux', 3, 4, 9000.00, 11000.00, NULL, NULL, 77, 10, 100, 'Pcs', 0.00, 'Sabun mandi lux 80gr', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(23, 'PRD-20260724-0023', NULL, 'Shampoo Sunsilk', 3, 4, 12000.00, 15000.00, NULL, NULL, 65, 8, 100, 'Pcs', 0.00, 'Shampoo sunsilk 100ml', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(24, 'PRD-20260724-0024', NULL, 'Shampoo Pantene', 3, 4, 13000.00, 16000.00, NULL, NULL, 55, 8, 100, 'Pcs', 0.00, 'Shampoo pantene 100ml', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(25, 'PRD-20260724-0025', NULL, 'Deterjen Rinso', 3, 4, 15000.00, 19000.00, NULL, NULL, 50, 5, 100, 'Pcs', 0.00, 'Deterjen rinso 500gr', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(26, 'PRD-20260724-0026', NULL, 'Deterjen Daia', 3, 4, 12000.00, 15000.00, NULL, NULL, 60, 5, 100, 'Pcs', 0.00, 'Deterjen daia 500gr', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(27, 'PRD-20260724-0027', NULL, 'Pewangi Lantai', 3, 4, 10000.00, 13000.00, NULL, NULL, 41, 5, 100, 'Pcs', 0.00, 'Pewangi lantai 500ml', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(28, 'PRD-20260724-0028', NULL, 'Sabun Cuci Piring', 3, 4, 7000.00, 9000.00, NULL, NULL, 50, 8, 100, 'Pcs', 0.00, 'Sabun cuci piring 200ml', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(29, 'PRD-20260724-0029', NULL, 'Spons Cuci', 3, 4, 3000.00, 5000.00, NULL, NULL, 70, 10, 100, 'Pcs', 0.00, 'Spons cuci piring 2in1', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(30, 'PRD-20260724-0030', NULL, 'Lap Pel', 3, 4, 15000.00, 20000.00, NULL, NULL, 25, 5, 100, 'Pcs', 0.00, 'Lap pel lantai magic', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(31, 'PRD-20260724-0031', NULL, 'Pasta Gigi Pepsodent', 4, 4, 12000.00, 15000.00, NULL, NULL, 80, 8, 100, 'Pcs', 0.00, 'Pasta gigi pepsodent 100gr', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:55:42'),
(32, 'PRD-20260724-0032', NULL, 'Pasta Gigi Close Up', 4, 4, 11000.00, 14000.00, NULL, NULL, 68, 8, 100, 'Pcs', 0.00, 'Pasta gigi close up 100gr', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(33, 'PRD-20260724-0033', NULL, 'Sikat Gigi Jordan', 4, 4, 8000.00, 10000.00, NULL, NULL, 60, 5, 100, 'Pcs', 0.00, 'Sikat gigi jordan soft', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(34, 'PRD-20260724-0034', NULL, 'Sikat Gigi Pepsodent', 4, 4, 7000.00, 9000.00, NULL, NULL, 50, 5, 100, 'Pcs', 0.00, 'Sikat gigi pepsodent', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(35, 'PRD-20260724-0035', NULL, 'Paracetamol 500mg', 4, 3, 5000.00, 7000.00, NULL, NULL, 80, 15, 100, 'Pcs', 0.00, 'Paracetamol 500mg 10 tablet', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(36, 'PRD-20260724-0036', NULL, 'Antangin Sirup', 4, 3, 3000.00, 5000.00, NULL, NULL, 90, 15, 100, 'Pcs', 0.00, 'Antangin sirup 100ml', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(37, 'PRD-20260724-0037', NULL, 'Komix Batuk', 4, 3, 4000.00, 6000.00, NULL, NULL, 78, 10, 100, 'Pcs', 0.00, 'Komix batuk 100ml', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(38, 'PRD-20260724-0038', NULL, 'Betadine Antiseptik', 4, 3, 15000.00, 20000.00, NULL, NULL, 40, 5, 100, 'Pcs', 0.00, 'Betadine antiseptik 50ml', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(39, 'PRD-20260724-0039', NULL, 'Plester Luka', 4, 3, 5000.00, 7000.00, NULL, NULL, 60, 10, 100, 'Pcs', 0.00, 'Plester luka waterproof', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(40, 'PRD-20260724-0040', NULL, 'Kassa Steril', 4, 3, 8000.00, 10000.00, NULL, NULL, 50, 8, 100, 'Pcs', 0.00, 'Kassa steril 10x10cm', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(41, 'PRD-20260724-0041', NULL, 'Charger HP 2A', 5, 5, 25000.00, 35000.00, NULL, NULL, 48, 5, 100, 'Pcs', 0.00, 'Charger hp 2A USB', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(42, 'PRD-20260724-0042', NULL, 'Kabel USB Type-C', 5, 5, 15000.00, 20000.00, NULL, NULL, 37, 5, 100, 'Pcs', 0.00, 'Kabel USB Type-C 1m', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(43, 'PRD-20260724-0043', NULL, 'Kabel USB Micro', 5, 5, 10000.00, 15000.00, NULL, NULL, 45, 5, 100, 'Pcs', 0.00, 'Kabel USB Micro 1m', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(44, 'PRD-20260724-0044', NULL, 'Powerbank 10000mAh', 5, 5, 80000.00, 100000.00, NULL, NULL, 20, 3, 100, 'Pcs', 0.00, 'Powerbank 10000mAh fast charging', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(45, 'PRD-20260724-0045', NULL, 'Headset Bluetooth TWS', 5, 5, 120000.00, 150000.00, NULL, NULL, 15, 3, 100, 'Pcs', 0.00, 'Headset bluetooth TWS', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(46, 'PRD-20260724-0046', NULL, 'Earphone Kabel In-Ear', 5, 5, 30000.00, 45000.00, NULL, NULL, 35, 5, 100, 'Pcs', 0.00, 'Earphone kabel in-ear', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(47, 'PRD-20260724-0047', NULL, 'Kartu SD 32GB', 5, 5, 50000.00, 70000.00, NULL, NULL, 21, 3, 100, 'Pcs', 0.00, 'Kartu SD 32GB class 10', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(48, 'PRD-20260724-0048', NULL, 'Flashdisk 16GB USB 3.0', 5, 5, 45000.00, 60000.00, NULL, NULL, 30, 3, 100, 'Pcs', 0.00, 'Flashdisk 16GB USB 3.0', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(49, 'PRD-20260724-0049', NULL, 'Mouse Wireless 2.4GHz', 5, 5, 55000.00, 75000.00, NULL, NULL, 25, 3, 100, 'Pcs', 0.00, 'Mouse wireless 2.4GHz', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(50, 'PRD-20260724-0050', NULL, 'Keyboard USB Full Size', 5, 5, 80000.00, 100000.00, NULL, NULL, 20, 3, 100, 'Pcs', 0.00, 'Keyboard USB full size', NULL, 1, '2026-07-24 07:06:06', '2026-07-24 07:06:06');

-- --------------------------------------------------------

--
-- Table structure for table `retur_pembelian`
--

CREATE TABLE `retur_pembelian` (
  `id` int(11) NOT NULL,
  `pembelian_id` int(11) DEFAULT NULL,
  `produk_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `jumlah` int(11) NOT NULL,
  `harga_retur` decimal(15,2) NOT NULL,
  `total_retur` decimal(15,2) NOT NULL,
  `alasan` text DEFAULT NULL,
  `tanggal_retur` date NOT NULL,
  `jam_retur` time DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `retur_pembelian`
--
DELIMITER $$
CREATE TRIGGER `update_stok_retur_pembelian` AFTER INSERT ON `retur_pembelian` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' THEN
        UPDATE produk SET stok = stok - NEW.jumlah WHERE id = NEW.produk_id;
        -- Update status pembelian menjadi batal
        UPDATE pembelian SET status = 'batal' WHERE id = NEW.pembelian_id;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `retur_penjualan`
--

CREATE TABLE `retur_penjualan` (
  `id` int(11) NOT NULL,
  `penjualan_id` int(11) DEFAULT NULL,
  `produk_id` int(11) DEFAULT NULL,
  `jumlah` int(11) NOT NULL,
  `harga_retur` decimal(15,2) NOT NULL,
  `total_retur` decimal(15,2) NOT NULL,
  `alasan` text DEFAULT NULL,
  `tanggal_retur` date NOT NULL,
  `jam_retur` time DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `retur_penjualan`
--

INSERT INTO `retur_penjualan` (`id`, `penjualan_id`, `produk_id`, `jumlah`, `harga_retur`, `total_retur`, `alasan`, `tanggal_retur`, `jam_retur`, `user_id`, `status`, `created_at`) VALUES
(1, 4, 31, 1, 15000.00, 15000.00, 'rusak', '2026-07-24', NULL, 1, 'approved', '2026-07-24 07:55:42');

--
-- Triggers `retur_penjualan`
--
DELIMITER $$
CREATE TRIGGER `update_stok_retur_penjualan` AFTER INSERT ON `retur_penjualan` FOR EACH ROW BEGIN
    IF NEW.status = 'approved' THEN
        UPDATE produk SET stok = stok + NEW.jumlah WHERE id = NEW.produk_id;
        -- Update status penjualan menjadi batal
        UPDATE penjualan SET status = 'batal' WHERE id = NEW.penjualan_id;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `kode_supplier` varchar(20) NOT NULL,
  `nama_supplier` varchar(100) NOT NULL,
  `alamat` text DEFAULT NULL,
  `no_telp` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `kontak_person` varchar(100) DEFAULT NULL,
  `no_rekening` varchar(50) DEFAULT NULL,
  `bank` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `kode_supplier`, `nama_supplier`, `alamat`, `no_telp`, `email`, `kontak_person`, `no_rekening`, `bank`, `created_at`, `updated_at`) VALUES
(1, 'SUP-20260724-0001', 'PT Indofood Sukses Makmur', 'Jl. Industri No. 1, Jakarta', '021-555-0001', 'info@indofood.co.id', 'Budi Santoso', '1234567890', 'BCA', '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(2, 'SUP-20260724-0002', 'PT Aqua Danone', 'Jl. Air No. 2, Bekasi', '021-555-0002', 'info@aqua.co.id', 'Siti Rahayu', '9876543210', 'Mandiri', '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(3, 'SUP-20260724-0003', 'PT Sinar Abadi', 'Jl. Raya No. 3, Bandung', '022-555-0003', 'info@sinarabadi.co.id', 'Agus Wijaya', '1122334455', 'BNI', '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(4, 'SUP-20260724-0004', 'PT Unilever Indonesia', 'Jl. Sudirman No. 4, Jakarta', '021-555-0004', 'info@unilever.co.id', 'Dewi Lestari', '5544332211', 'BCA', '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(5, 'SUP-20260724-0005', 'PT Samsung Indonesia', 'Jl. Gatot Subroto No. 5, Jakarta', '021-555-0005', 'info@samsung.co.id', 'Rudi Hartono', '9988776655', 'Mandiri', '2026-07-24 07:06:06', '2026-07-24 07:06:06');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `role` enum('admin','kasir','manager','owner') DEFAULT 'kasir',
  `no_telp` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `last_login` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `nama_lengkap`, `role`, `no_telp`, `alamat`, `email`, `foto`, `is_active`, `last_login`, `created_at`, `updated_at`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', 'Administrator', 'admin', '081234567890', 'Jl. Admin No. 1, Jakarta', 'admin@toko.com', NULL, 1, NULL, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(2, 'kasir1', 'de28f8f7998f23ab4194b51a6029416f', 'Kasir Toko', 'kasir', '081234567891', 'Jl. Kasir No. 2, Jakarta', 'kasir1@toko.com', NULL, 1, NULL, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(3, 'manager', '0795151defba7a4b5dfa89170de46277', 'Manager Toko', 'manager', '081234567892', 'Jl. Manager No. 3, Jakarta', 'manager@toko.com', NULL, 1, NULL, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(4, 'kasir2', '312a32e0fe0075cd06df2319df41cf49', 'Kasir 2', 'kasir', '081234567893', 'Jl. Kasir No. 4, Jakarta', 'kasir2@toko.com', NULL, 1, NULL, '2026-07-24 07:06:06', '2026-07-24 07:06:06'),
(5, 'owner', '5be057accb25758101fa5eadbbd79503', 'Pemilik Toko', 'owner', '081234567894', 'Jl. Owner No. 5, Jakarta', 'owner@toko.com', NULL, 1, NULL, '2026-07-24 07:06:06', '2026-07-24 07:06:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `backup_database`
--
ALTER TABLE `backup_database`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `biaya_operasional`
--
ALTER TABLE `biaya_operasional`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `kasir_shift`
--
ALTER TABLE `kasir_shift`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama_kategori` (`nama_kategori`);

--
-- Indexes for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `produk_id` (`produk_id`);

--
-- Indexes for table `konfigurasi_toko`
--
ALTER TABLE `konfigurasi_toko`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_pelanggan` (`kode_pelanggan`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no_po` (`no_po`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `produk_id` (`produk_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no_invoice` (`no_invoice`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `produk_id` (`produk_id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_produk` (`kode_produk`),
  ADD KEY `kategori_id` (`kategori_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `idx_barcode` (`barcode`),
  ADD KEY `idx_kode_produk` (`kode_produk`),
  ADD KEY `idx_nama_produk` (`nama_produk`);

--
-- Indexes for table `retur_pembelian`
--
ALTER TABLE `retur_pembelian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pembelian_id` (`pembelian_id`),
  ADD KEY `produk_id` (`produk_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `retur_penjualan`
--
ALTER TABLE `retur_penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penjualan_id` (`penjualan_id`),
  ADD KEY `produk_id` (`produk_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_supplier` (`kode_supplier`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `backup_database`
--
ALTER TABLE `backup_database`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `biaya_operasional`
--
ALTER TABLE `biaya_operasional`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kasir_shift`
--
ALTER TABLE `kasir_shift`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `konfigurasi_toko`
--
ALTER TABLE `konfigurasi_toko`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `retur_pembelian`
--
ALTER TABLE `retur_pembelian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `retur_penjualan`
--
ALTER TABLE `retur_penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `backup_database`
--
ALTER TABLE `backup_database`
  ADD CONSTRAINT `backup_database_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `biaya_operasional`
--
ALTER TABLE `biaya_operasional`
  ADD CONSTRAINT `biaya_operasional_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `kasir_shift`
--
ALTER TABLE `kasir_shift`
  ADD CONSTRAINT `kasir_shift_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD CONSTRAINT `keranjang_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `keranjang_ibfk_2` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  ADD CONSTRAINT `log_aktivitas_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD CONSTRAINT `notifikasi_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pembelian_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `penjualan_ibfk_2` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `produk_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `retur_pembelian`
--
ALTER TABLE `retur_pembelian`
  ADD CONSTRAINT `retur_pembelian_ibfk_1` FOREIGN KEY (`pembelian_id`) REFERENCES `pembelian` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `retur_pembelian_ibfk_2` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `retur_pembelian_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `retur_pembelian_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `retur_penjualan`
--
ALTER TABLE `retur_penjualan`
  ADD CONSTRAINT `retur_penjualan_ibfk_1` FOREIGN KEY (`penjualan_id`) REFERENCES `penjualan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `retur_penjualan_ibfk_2` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `retur_penjualan_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
