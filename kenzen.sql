-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2026 at 10:59 AM
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
-- Database: `kenzen`
--

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `expense_number` varchar(50) NOT NULL,
  `expense_category` enum('pengajar','materi','platform','payment_gateway','operasional','sales','other') NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `expense_date` date NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `expense_number`, `expense_category`, `description`, `amount`, `expense_date`, `order_id`, `notes`, `created_by`, `created_at`) VALUES
(1, 'EXP-20250101-0001', 'pengajar', 'Biaya Pengajar Training Digital Marketing', 1500000.00, '2025-01-10', 1, NULL, 1, '2026-07-02 07:34:13'),
(2, 'EXP-20250101-0002', 'materi', 'Materi Training', 300000.00, '2025-01-10', 1, NULL, 1, '2026-07-02 07:34:13'),
(3, 'EXP-20250101-0003', 'platform', 'Platform Zoom Premium', 100000.00, '2025-01-10', 1, NULL, 1, '2026-07-02 07:34:13'),
(4, 'EXP-20250115-0001', 'pengajar', 'Biaya Pengajar Magang IT', 12000000.00, '2025-01-20', 2, NULL, 1, '2026-07-02 07:34:13'),
(5, 'EXP-20250115-0002', 'materi', 'Materi Magang', 2000000.00, '2025-01-20', 2, NULL, 1, '2026-07-02 07:34:13'),
(6, 'EXP-20250115-0003', 'platform', 'Platform LMS', 500000.00, '2025-01-20', 2, NULL, 1, '2026-07-02 07:34:13');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `invoice_number` varchar(50) NOT NULL,
  `order_id` int(11) NOT NULL,
  `invoice_date` date NOT NULL,
  `due_date` date NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) DEFAULT 0.00,
  `discount_amount` decimal(15,2) DEFAULT 0.00,
  `total_amount` decimal(15,2) NOT NULL,
  `status` enum('draft','sent','paid','overdue','cancelled') DEFAULT 'draft',
  `notes` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `journals`
--

CREATE TABLE `journals` (
  `id` int(11) NOT NULL,
  `journal_number` varchar(50) NOT NULL,
  `journal_date` date NOT NULL,
  `reference_type` varchar(50) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `debit` decimal(15,2) DEFAULT 0.00,
  `credit` decimal(15,2) DEFAULT 0.00,
  `account_code` varchar(20) DEFAULT NULL,
  `account_name` varchar(100) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `payment_number` varchar(50) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `payment_method` enum('cash','bank_transfer','credit_card','e_wallet') NOT NULL,
  `status` enum('pending','confirmed','failed','refunded') DEFAULT 'pending',
  `notes` text DEFAULT NULL,
  `confirmed_by` int(11) DEFAULT NULL,
  `confirmed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profit_loss`
--

CREATE TABLE `profit_loss` (
  `id` int(11) NOT NULL,
  `report_number` varchar(50) NOT NULL,
  `report_date` date NOT NULL,
  `period_start` date NOT NULL,
  `period_end` date NOT NULL,
  `service_type` enum('kursus','magang','karyawan') NOT NULL,
  `gross_sales` decimal(15,2) DEFAULT 0.00,
  `marketing_komisi` decimal(15,2) DEFAULT 0.00,
  `komisi_percentage` decimal(5,2) DEFAULT 0.00,
  `cac` decimal(15,2) DEFAULT 0.00,
  `cac_percentage` decimal(5,2) DEFAULT 0.00,
  `pph21` decimal(15,2) DEFAULT 0.00,
  `total_biaya_akuisisi` decimal(15,2) DEFAULT 0.00,
  `sisa_setelah_marketing` decimal(15,2) DEFAULT 0.00,
  `biaya_pengajar` decimal(15,2) DEFAULT 0.00,
  `biaya_materi` decimal(15,2) DEFAULT 0.00,
  `biaya_platform` decimal(15,2) DEFAULT 0.00,
  `payment_gateway` decimal(15,2) DEFAULT 0.00,
  `biaya_operasional` decimal(15,2) DEFAULT 0.00,
  `biaya_sales_lain` decimal(15,2) DEFAULT 0.00,
  `total_biaya_operasional` decimal(15,2) DEFAULT 0.00,
  `laba_sebelum_pajak` decimal(15,2) DEFAULT 0.00,
  `pajak_perusahaan` decimal(15,2) DEFAULT 0.00,
  `laba_bersih` decimal(15,2) DEFAULT 0.00,
  `net_profit_margin` decimal(5,2) DEFAULT 0.00,
  `notes` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `profit_loss`
--

INSERT INTO `profit_loss` (`id`, `report_number`, `report_date`, `period_start`, `period_end`, `service_type`, `gross_sales`, `marketing_komisi`, `komisi_percentage`, `cac`, `cac_percentage`, `pph21`, `total_biaya_akuisisi`, `sisa_setelah_marketing`, `biaya_pengajar`, `biaya_materi`, `biaya_platform`, `payment_gateway`, `biaya_operasional`, `biaya_sales_lain`, `total_biaya_operasional`, `laba_sebelum_pajak`, `pajak_perusahaan`, `laba_bersih`, `net_profit_margin`, `notes`, `created_by`, `created_at`) VALUES
(1, 'PL-20250101-0001', '2025-01-01', '2025-01-01', '2025-01-31', 'kursus', 8000000.00, 250000.00, 3.57, 200000.00, 2.86, 5000.00, 455000.00, 6545000.00, 1500000.00, 300000.00, 100000.00, 70000.00, 500000.00, 200000.00, 2670000.00, 3875000.00, 300000.00, 3575000.00, 44.69, NULL, 1, '2026-07-02 07:34:13'),
(2, 'PL-20250115-0002', '2025-01-15', '2025-01-15', '2025-02-15', 'magang', 40000000.00, 1000000.00, 2.50, 300000.00, 0.75, 20000.00, 1320000.00, 38680000.00, 12000000.00, 2000000.00, 500000.00, 400000.00, 2000000.00, 1000000.00, 17900000.00, 20780000.00, 1500000.00, 19280000.00, 48.20, NULL, 1, '2026-07-02 07:34:13'),
(3, 'PL-20250201-0003', '2025-02-01', '2025-02-01', '2025-02-28', 'karyawan', 9000000.00, 300000.00, 3.33, 250000.00, 2.78, 6000.00, 556000.00, 8444000.00, 2500000.00, 500000.00, 150000.00, 100000.00, 800000.00, 300000.00, 4350000.00, 4094000.00, 400000.00, 3694000.00, 41.04, NULL, 1, '2026-07-02 07:34:13');

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `id` int(11) NOT NULL,
  `referral_code` varchar(50) NOT NULL,
  `sales_order_id` int(11) NOT NULL,
  `marketing_name` varchar(100) DEFAULT NULL,
  `commission_type` enum('cashback','voucher','discount','commission') NOT NULL,
  `commission_value` decimal(15,2) NOT NULL,
  `commission_percentage` decimal(5,2) DEFAULT NULL,
  `status` enum('pending','approved','paid','cancelled') DEFAULT 'pending',
  `notes` text DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_orders`
--

CREATE TABLE `sales_orders` (
  `id` int(11) NOT NULL,
  `order_number` varchar(50) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_email` varchar(100) DEFAULT NULL,
  `customer_phone` varchar(20) DEFAULT NULL,
  `service_type` enum('kursus','magang','karyawan') NOT NULL,
  `service_name` varchar(100) NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `price` decimal(15,2) NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `order_date` date NOT NULL,
  `status` enum('draft','confirmed','processing','completed','cancelled') DEFAULT 'draft',
  `notes` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales_orders`
--

INSERT INTO `sales_orders` (`id`, `order_number`, `customer_name`, `customer_email`, `customer_phone`, `service_type`, `service_name`, `quantity`, `price`, `total_amount`, `order_date`, `status`, `notes`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'SO-20250101-0001', 'PT Maju Jaya', 'info@majujaya.com', '081234567890', 'kursus', 'Training Digital Marketing', 5, 1600000.00, 8000000.00, '2025-01-01', 'completed', NULL, 1, '2026-07-02 07:34:13', '2026-07-02 07:34:13'),
(2, 'SO-20250115-0002', 'CV Kreatif Mandiri', 'info@kreatif.com', '081298765432', 'magang', 'Program Magang IT', 3, 13333333.00, 40000000.00, '2025-01-15', 'completed', NULL, 1, '2026-07-02 07:34:13', '2026-07-02 07:34:13'),
(3, 'SO-20250201-0003', 'PT Sinergi Group', 'info@sinergi.com', '081355577799', 'karyawan', 'Penempatan IT Staff', 2, 4500000.00, 9000000.00, '2025-02-01', 'completed', NULL, 1, '2026-07-02 07:34:13', '2026-07-02 07:34:13');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(11) NOT NULL,
  `tax_number` varchar(50) NOT NULL,
  `tax_type` enum('pph21','pph22','ppn','company_tax') NOT NULL,
  `sales_order_id` int(11) DEFAULT NULL,
  `tax_rate` decimal(5,2) NOT NULL,
  `taxable_amount` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) NOT NULL,
  `tax_date` date NOT NULL,
  `status` enum('draft','reported','paid','overdue') DEFAULT 'draft',
  `notes` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','editor','viewer') DEFAULT 'viewer',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama_lengkap`, `username`, `password`, `role`, `created_at`) VALUES
(1, 'testing', 'admin', 'admin123', 'admin', '2026-07-01 08:11:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `expense_number` (`expense_number`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoice_number` (`invoice_number`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `journals`
--
ALTER TABLE `journals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `journal_number` (`journal_number`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payment_number` (`payment_number`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `confirmed_by` (`confirmed_by`);

--
-- Indexes for table `profit_loss`
--
ALTER TABLE `profit_loss`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `report_number` (`report_number`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `referral_code` (`referral_code`),
  ADD KEY `sales_order_id` (`sales_order_id`),
  ADD KEY `approved_by` (`approved_by`);

--
-- Indexes for table `sales_orders`
--
ALTER TABLE `sales_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_number` (`order_number`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tax_number` (`tax_number`),
  ADD KEY `sales_order_id` (`sales_order_id`),
  ADD KEY `created_by` (`created_by`);

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
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `journals`
--
ALTER TABLE `journals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profit_loss`
--
ALTER TABLE `profit_loss`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_orders`
--
ALTER TABLE `sales_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `sales_orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `expenses_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `sales_orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `journals`
--
ALTER TABLE `journals`
  ADD CONSTRAINT `journals_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`confirmed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `profit_loss`
--
ALTER TABLE `profit_loss`
  ADD CONSTRAINT `profit_loss_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `referrals`
--
ALTER TABLE `referrals`
  ADD CONSTRAINT `referrals_ibfk_1` FOREIGN KEY (`sales_order_id`) REFERENCES `sales_orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `referrals_ibfk_2` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sales_orders`
--
ALTER TABLE `sales_orders`
  ADD CONSTRAINT `sales_orders_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `taxes`
--
ALTER TABLE `taxes`
  ADD CONSTRAINT `taxes_ibfk_1` FOREIGN KEY (`sales_order_id`) REFERENCES `sales_orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `taxes_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
