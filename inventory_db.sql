-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Agu 2026 pada 17.29
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bom`
--

CREATE TABLE `bom` (
  `BOMID` bigint(20) NOT NULL,
  `ProductID` bigint(20) NOT NULL,
  `MaterialID` bigint(20) NOT NULL,
  `QtyRequired` decimal(15,2) NOT NULL,
  `UOM` varchar(10) DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `bom`
--

INSERT INTO `bom` (`BOMID`, `ProductID`, `MaterialID`, `QtyRequired`, `UOM`, `CreatedAt`) VALUES
(1, 1, 1, 1.50, 'KG', '2026-07-22 08:38:07'),
(2, 1, 4, 0.10, 'KG', '2026-07-22 08:38:07'),
(3, 3, 2, 2.00, 'KG', '2026-07-22 08:38:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

CREATE TABLE `customers` (
  `CustomerID` bigint(20) NOT NULL,
  `CustomerCode` varchar(20) NOT NULL,
  `CustomerName` varchar(150) NOT NULL,
  `Address` text DEFAULT NULL,
  `Phone` varchar(30) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `TaxID` varchar(50) DEFAULT NULL,
  `PaymentTerms` varchar(50) DEFAULT NULL,
  `Status` tinyint(4) DEFAULT 1,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `customers`
--

INSERT INTO `customers` (`CustomerID`, `CustomerCode`, `CustomerName`, `Address`, `Phone`, `Email`, `TaxID`, `PaymentTerms`, `Status`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 'CUST-001', 'PT Indah Plastik', 'Jl. Plastik No. 5, Tangerang', '021-7771001', 'info@indahplastik.co.id', NULL, NULL, 1, '2026-07-22 07:54:29', '2026-07-22 07:54:29'),
(2, 'CUST-002', 'CV Karya Abadi', 'Jl. Jend. Sudirman No. 20, Jakarta', '021-7772002', 'sales@karyaabadi.co.id', NULL, NULL, 1, '2026-07-22 07:54:29', '2026-07-22 07:54:29'),
(3, 'CUST-003', 'PT Sejahtera Bersama', 'Jl. Ahmad Yani No. 15, Surabaya', '031-7773003', 'contact@sejahtera.co.id', NULL, NULL, 1, '2026-07-22 07:54:29', '2026-07-22 07:54:29'),
(4, 'CUST-004', 'CV Cipta Mandiri', 'Jl. Gatot Subroto No. 8, Bandung', '022-7774004', 'info@ciptamandiri.co.id', NULL, NULL, 1, '2026-07-22 07:54:29', '2026-07-22 07:54:29'),
(5, 'CUST-005', 'PT Global Plastindo', 'Jl. Industri No. 30, Semarang', '024-7775005', 'sales@globalplastindo.co.id', NULL, NULL, 1, '2026-07-22 07:54:29', '2026-07-22 07:54:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer_pos`
--

CREATE TABLE `customer_pos` (
  `CustomerPOID` bigint(20) NOT NULL,
  `CustomerID` bigint(20) NOT NULL,
  `PONumber` varchar(30) NOT NULL,
  `PODate` date NOT NULL,
  `DeliveryDate` date DEFAULT NULL,
  `Status` enum('Open','Production','Partial','Completed','Cancelled') DEFAULT 'Open',
  `SalesPIC` varchar(50) DEFAULT NULL,
  `Notes` text DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `customer_pos`
--

INSERT INTO `customer_pos` (`CustomerPOID`, `CustomerID`, `PONumber`, `PODate`, `DeliveryDate`, `Status`, `SalesPIC`, `Notes`, `CreatedAt`, `UpdatedAt`) VALUES
(5, 4, 'SO-202607-0001', '2026-07-22', '2026-07-23', 'Production', 'a', 'a', '2026-07-22 13:20:07', '2026-07-22 13:20:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer_po_details`
--

CREATE TABLE `customer_po_details` (
  `CustomerPODetailID` bigint(20) NOT NULL,
  `CustomerPOID` bigint(20) NOT NULL,
  `ProductID` bigint(20) NOT NULL,
  `QtyOrder` decimal(15,2) NOT NULL,
  `Unit` varchar(10) DEFAULT 'PCS',
  `UnitPrice` decimal(15,2) DEFAULT 0.00,
  `Total` decimal(15,2) DEFAULT 0.00,
  `QtyProduced` decimal(15,2) DEFAULT 0.00,
  `QtyRemaining` decimal(15,2) DEFAULT 0.00,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `customer_po_details`
--

INSERT INTO `customer_po_details` (`CustomerPODetailID`, `CustomerPOID`, `ProductID`, `QtyOrder`, `Unit`, `UnitPrice`, `Total`, `QtyProduced`, `QtyRemaining`, `CreatedAt`) VALUES
(7, 5, 3, 1.00, 'PCS', 120000.00, 120000.00, 0.00, 1.00, '2026-07-22 13:20:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `fg_receipts`
--

CREATE TABLE `fg_receipts` (
  `FGReceiptID` bigint(20) NOT NULL,
  `FGNumber` varchar(30) NOT NULL,
  `CustomerPOID` bigint(20) DEFAULT NULL,
  `ProductionResultID` bigint(20) DEFAULT NULL,
  `QCID` bigint(20) DEFAULT NULL,
  `DockID` bigint(20) DEFAULT NULL,
  `ReceiptDate` date NOT NULL,
  `QtyAccepted` decimal(15,2) DEFAULT 0.00,
  `QtyRejected` decimal(15,2) DEFAULT 0.00,
  `Status` enum('Stored','Reserved','Delivered','Partial') DEFAULT 'Stored',
  `AdminFG` varchar(50) DEFAULT NULL,
  `Notes` text DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `fg_receipts`
--

INSERT INTO `fg_receipts` (`FGReceiptID`, `FGNumber`, `CustomerPOID`, `ProductionResultID`, `QCID`, `DockID`, `ReceiptDate`, `QtyAccepted`, `QtyRejected`, `Status`, `AdminFG`, `Notes`, `CreatedAt`, `UpdatedAt`) VALUES
(2, 'FG-202607-0001', 5, 5, 1, 1, '2026-07-22', 1.00, 0.00, 'Reserved', 'agus', 'tes', '2026-07-22 14:19:25', '2026-07-22 14:20:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `fg_receipt_details`
--

CREATE TABLE `fg_receipt_details` (
  `FGDetailID` bigint(20) NOT NULL,
  `FGReceiptID` bigint(20) NOT NULL,
  `ProductID` bigint(20) NOT NULL,
  `CustomerPODetailID` bigint(20) DEFAULT NULL,
  `BatchNo` varchar(50) DEFAULT NULL,
  `PalletNo` varchar(50) DEFAULT NULL,
  `Qty` decimal(15,2) NOT NULL,
  `BinLocation` varchar(50) DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `fg_receipt_details`
--

INSERT INTO `fg_receipt_details` (`FGDetailID`, `FGReceiptID`, `ProductID`, `CustomerPODetailID`, `BatchNo`, `PalletNo`, `Qty`, `BinLocation`, `CreatedAt`) VALUES
(2, 2, 3, 7, 'BATCH-20260722-2', 'PALLET-2', 1.00, 'FG-RACK-2', '2026-07-22 14:20:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `inventory_transactions`
--

CREATE TABLE `inventory_transactions` (
  `TransactionID` bigint(20) NOT NULL,
  `TransactionDate` datetime DEFAULT current_timestamp(),
  `TransactionType` enum('PO_Receive','PO_Return','Transfer_Out','Transfer_In','FG_Produce','FG_Deliver','FG_Return','Adjustment_Add','Adjustment_Sub','QC_Reject') NOT NULL,
  `ReferenceID` bigint(20) DEFAULT NULL,
  `ReferenceType` varchar(50) DEFAULT NULL,
  `MaterialID` bigint(20) DEFAULT NULL,
  `ProductID` bigint(20) DEFAULT NULL,
  `WarehouseID` bigint(20) NOT NULL,
  `QtyIn` decimal(15,2) DEFAULT 0.00,
  `QtyOut` decimal(15,2) DEFAULT 0.00,
  `StockBefore` decimal(15,2) NOT NULL,
  `StockAfter` decimal(15,2) NOT NULL,
  `BatchNo` varchar(50) DEFAULT NULL,
  `CreatedBy` varchar(50) DEFAULT NULL,
  `Notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `inventory_transactions`
--

INSERT INTO `inventory_transactions` (`TransactionID`, `TransactionDate`, `TransactionType`, `ReferenceID`, `ReferenceType`, `MaterialID`, `ProductID`, `WarehouseID`, `QtyIn`, `QtyOut`, `StockBefore`, `StockAfter`, `BatchNo`, `CreatedBy`, `Notes`) VALUES
(1, '2026-07-22 15:02:46', 'PO_Receive', 1, 'material_receipt_details', 7, NULL, 4, 1.00, 0.00, 0.00, 1.00, NULL, 'SYSTEM', NULL),
(2, '2026-07-22 15:05:31', 'PO_Receive', 2, 'material_receipt_details', 7, NULL, 4, 1.00, 0.00, 2.00, 3.00, NULL, 'SYSTEM', NULL),
(3, '2026-07-22 15:05:55', 'PO_Receive', 3, 'material_receipt_details', 7, NULL, 4, 1.00, 0.00, 4.00, 5.00, NULL, 'SYSTEM', NULL),
(4, '2026-07-22 20:54:11', 'FG_Produce', 5, 'qc_inspections', NULL, 3, 1, 1.00, 0.00, 0.00, 1.00, NULL, 'RINA', NULL),
(5, '2026-07-22 21:19:25', 'FG_Produce', 2, 'fg_receipts', NULL, 3, 1, 1.00, 0.00, 2.00, 3.00, NULL, 'agus', NULL),
(6, '2026-07-22 21:20:43', 'FG_Produce', 2, 'fg_receipts', NULL, 3, 1, 1.00, 0.00, 2.00, 3.00, NULL, 'agus', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `loading_docks`
--

CREATE TABLE `loading_docks` (
  `DockID` bigint(20) NOT NULL,
  `DockCode` varchar(20) NOT NULL,
  `DockName` varchar(100) NOT NULL,
  `WarehouseID` bigint(20) DEFAULT NULL,
  `Capacity` decimal(15,2) DEFAULT 0.00,
  `CurrentQty` decimal(15,2) DEFAULT 0.00,
  `RemainingQty` decimal(15,2) DEFAULT 0.00,
  `StatusColor` varchar(20) DEFAULT 'GREEN',
  `IsActive` tinyint(1) DEFAULT 1,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `loading_docks`
--

INSERT INTO `loading_docks` (`DockID`, `DockCode`, `DockName`, `WarehouseID`, `Capacity`, `CurrentQty`, `RemainingQty`, `StatusColor`, `IsActive`, `CreatedAt`) VALUES
(1, 'DOCK-001', 'Dock A - Material In', 1, 5000.00, 0.00, 0.00, 'GREEN', 1, '2026-07-22 07:54:29'),
(2, 'DOCK-002', 'Dock B - Material In', 1, 3000.00, 0.00, 0.00, 'GREEN', 1, '2026-07-22 07:54:29'),
(3, 'DOCK-003', 'Dock C - FG Out', 3, 2000.00, 0.00, 0.00, 'GREEN', 1, '2026-07-22 07:54:29'),
(4, 'DOCK-004', 'Dock D - FG Out', 3, 2000.00, 0.00, 0.00, 'GREEN', 1, '2026-07-22 07:54:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `materials`
--

CREATE TABLE `materials` (
  `MaterialID` bigint(20) NOT NULL,
  `MaterialCode` varchar(30) NOT NULL,
  `MaterialName` varchar(150) NOT NULL,
  `Specification` text DEFAULT NULL,
  `UOM` varchar(10) DEFAULT 'PCS',
  `Category` varchar(50) DEFAULT NULL,
  `MinStock` decimal(15,2) DEFAULT 0.00,
  `MaxStock` decimal(15,2) DEFAULT 0.00,
  `Active` tinyint(1) DEFAULT 1,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `materials`
--

INSERT INTO `materials` (`MaterialID`, `MaterialCode`, `MaterialName`, `Specification`, `UOM`, `Category`, `MinStock`, `MaxStock`, `Active`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 'MTR-001', 'PVC Resin', 'Grade A, 25kg/bag', 'KG', 'Chemical', 1000.00, 5000.00, 1, '2026-07-22 07:54:29', '2026-07-22 07:54:29'),
(2, 'MTR-002', 'HDPE Granule', 'Natural color, MFI 2.0', 'KG', 'Plastic', 500.00, 3000.00, 1, '2026-07-22 07:54:29', '2026-07-22 07:54:29'),
(3, 'MTR-003', 'LLDPE Granule', 'Butene base, MFI 1.0', 'KG', 'Plastic', 500.00, 3000.00, 1, '2026-07-22 07:54:29', '2026-07-22 07:54:29'),
(4, 'MTR-004', 'Masterbatch White', 'Titanium dioxide 50%', 'KG', 'Additive', 100.00, 1000.00, 1, '2026-07-22 07:54:29', '2026-07-22 07:54:29'),
(5, 'MTR-005', 'Masterbatch Black', 'Carbon black 40%', 'KG', 'Additive', 100.00, 500.00, 1, '2026-07-22 07:54:29', '2026-07-22 07:54:29'),
(6, 'MTR-006', 'Calcium Carbonate', '1000 mesh, coated', 'KG', 'Filler', 500.00, 2000.00, 1, '2026-07-22 07:54:29', '2026-07-22 07:54:29'),
(7, 'MTR-007', 'Anti UV Additive', 'HALS type', 'KG', 'Additive', 50.00, 200.00, 1, '2026-07-22 07:54:29', '2026-07-22 07:54:29'),
(8, 'MTR-008', 'Plasticizer DOP', 'Di-Octyl Phthalate', 'KG', 'Chemical', 200.00, 800.00, 1, '2026-07-22 07:54:29', '2026-07-22 07:54:29'),
(9, 'MTR-009', 'Pigment Red', 'Organic red pigment', 'KG', 'Additive', 50.00, 200.00, 1, '2026-07-22 07:54:29', '2026-07-22 07:54:29'),
(10, 'MTR-010', 'Pigment Blue', 'Phthalocyanine blue', 'KG', 'Additive', 50.00, 200.00, 1, '2026-07-22 07:54:29', '2026-07-22 07:54:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `material_receipts`
--

CREATE TABLE `material_receipts` (
  `ReceiptID` bigint(20) NOT NULL,
  `ReceiptNumber` varchar(30) NOT NULL,
  `ReceiptDate` date NOT NULL,
  `POID` bigint(20) DEFAULT NULL,
  `SupplierID` bigint(20) NOT NULL,
  `WarehouseID` bigint(20) DEFAULT NULL,
  `SuratJalan` varchar(50) DEFAULT NULL,
  `ReceivedBy` varchar(50) DEFAULT NULL,
  `Status` enum('Draft','Completed','Cancelled') DEFAULT 'Draft',
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `material_receipts`
--

INSERT INTO `material_receipts` (`ReceiptID`, `ReceiptNumber`, `ReceiptDate`, `POID`, `SupplierID`, `WarehouseID`, `SuratJalan`, `ReceivedBy`, `Status`, `CreatedAt`, `UpdatedAt`) VALUES
(2, 'GRN-202607-0001', '2026-07-22', 1, 5, 4, 'SJ-001-2026', '1', 'Completed', '2026-07-22 08:05:31', '2026-07-22 08:05:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `material_receipt_details`
--

CREATE TABLE `material_receipt_details` (
  `ReceiptDetailID` bigint(20) NOT NULL,
  `ReceiptID` bigint(20) NOT NULL,
  `PODetailID` bigint(20) DEFAULT NULL,
  `MaterialID` bigint(20) NOT NULL,
  `WarehouseID` bigint(20) DEFAULT NULL,
  `QtyReceived` decimal(15,2) NOT NULL,
  `QtyReject` decimal(15,2) DEFAULT 0.00,
  `QtyAccepted` decimal(15,2) GENERATED ALWAYS AS (`QtyReceived` - `QtyReject`) STORED,
  `RackLocation` varchar(50) DEFAULT NULL,
  `BatchNo` varchar(50) DEFAULT NULL,
  `ExpiryDate` date DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `material_receipt_details`
--

INSERT INTO `material_receipt_details` (`ReceiptDetailID`, `ReceiptID`, `PODetailID`, `MaterialID`, `WarehouseID`, `QtyReceived`, `QtyReject`, `RackLocation`, `BatchNo`, `ExpiryDate`, `CreatedAt`) VALUES
(3, 2, 1, 7, 4, 1.00, 0.00, '', NULL, NULL, '2026-07-22 08:05:55');

--
-- Trigger `material_receipt_details`
--
DELIMITER $$
CREATE TRIGGER `trg_update_material_stock_after_receipt` AFTER INSERT ON `material_receipt_details` FOR EACH ROW BEGIN
    DECLARE v_warehouse_id BIGINT;
    
    SELECT WarehouseID INTO v_warehouse_id 
    FROM material_receipts 
    WHERE ReceiptID = NEW.ReceiptID;
    
    INSERT INTO material_stock (MaterialID, WarehouseID, QtyOnHand, QtyReserved)
    VALUES (NEW.MaterialID, v_warehouse_id, NEW.QtyAccepted, 0)
    ON DUPLICATE KEY UPDATE
    QtyOnHand = QtyOnHand + NEW.QtyAccepted;
    
    INSERT INTO inventory_transactions (
        TransactionDate, TransactionType, ReferenceID, ReferenceType,
        MaterialID, WarehouseID, QtyIn, StockBefore, StockAfter, CreatedBy
    )
    SELECT 
        NOW(), 'PO_Receive', NEW.ReceiptDetailID, 'material_receipt_details',
        NEW.MaterialID, v_warehouse_id, NEW.QtyAccepted,
        COALESCE((SELECT QtyOnHand FROM material_stock WHERE MaterialID = NEW.MaterialID AND WarehouseID = v_warehouse_id), 0) - NEW.QtyAccepted,
        COALESCE((SELECT QtyOnHand FROM material_stock WHERE MaterialID = NEW.MaterialID AND WarehouseID = v_warehouse_id), 0),
        'SYSTEM'
    FROM DUAL;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `material_stock`
--

CREATE TABLE `material_stock` (
  `StockID` bigint(20) NOT NULL,
  `MaterialID` bigint(20) NOT NULL,
  `WarehouseID` bigint(20) NOT NULL,
  `QtyOnHand` decimal(15,2) DEFAULT 0.00,
  `QtyReserved` decimal(15,2) DEFAULT 0.00,
  `QtyAvailable` decimal(15,2) GENERATED ALWAYS AS (`QtyOnHand` - `QtyReserved`) STORED,
  `LastUpdated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `material_stock`
--

INSERT INTO `material_stock` (`StockID`, `MaterialID`, `WarehouseID`, `QtyOnHand`, `QtyReserved`, `LastUpdated`) VALUES
(1, 1, 1, 1500.00, 0.00, '2026-07-22 07:54:29'),
(2, 2, 1, 800.00, 0.00, '2026-07-22 07:54:29'),
(3, 3, 1, 400.00, 0.00, '2026-07-22 07:54:29'),
(4, 4, 1, 150.00, 0.00, '2026-07-22 07:54:29'),
(5, 5, 1, 80.00, 0.00, '2026-07-22 07:54:29'),
(6, 6, 1, 600.00, 0.00, '2026-07-22 07:54:29'),
(7, 7, 1, 30.00, 0.00, '2026-07-22 07:54:29'),
(8, 8, 1, 250.00, 0.00, '2026-07-22 07:54:29'),
(9, 7, 4, 5.00, 2.00, '2026-07-22 13:31:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `material_transfers`
--

CREATE TABLE `material_transfers` (
  `TransferID` bigint(20) NOT NULL,
  `TransferNumber` varchar(30) NOT NULL,
  `TransferDate` date NOT NULL,
  `ProductionOrderID` bigint(20) DEFAULT NULL,
  `from_warehouse_id` bigint(20) NOT NULL,
  `ToDepartment` varchar(50) DEFAULT NULL,
  `Status` enum('Draft','Issued','Received','Cancelled') DEFAULT 'Draft',
  `IssuedBy` varchar(50) DEFAULT NULL,
  `ReceivedBy` varchar(50) DEFAULT NULL,
  `Notes` text DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `material_transfers`
--

INSERT INTO `material_transfers` (`TransferID`, `TransferNumber`, `TransferDate`, `ProductionOrderID`, `from_warehouse_id`, `ToDepartment`, `Status`, `IssuedBy`, `ReceivedBy`, `Notes`, `CreatedAt`, `UpdatedAt`) VALUES
(2, 'TR-202607-0001', '2026-07-22', 7, 4, 'Produksi', 'Issued', 'a', NULL, NULL, '2026-07-22 13:31:31', '2026-07-22 13:31:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `production_orders`
--

CREATE TABLE `production_orders` (
  `ProductionOrderID` bigint(20) NOT NULL,
  `WONumber` varchar(30) NOT NULL,
  `CustomerPOID` bigint(20) DEFAULT NULL,
  `ProductID` bigint(20) NOT NULL,
  `QtyTarget` decimal(15,2) NOT NULL,
  `DueDate` date DEFAULT NULL,
  `Status` enum('Open','Running','Partial','Completed','Cancelled') DEFAULT 'Open',
  `Priority` enum('Low','Medium','High','Urgent') DEFAULT 'Medium',
  `CreatedBy` varchar(50) DEFAULT NULL,
  `StartedAt` datetime DEFAULT NULL,
  `CompletedAt` datetime DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `production_orders`
--

INSERT INTO `production_orders` (`ProductionOrderID`, `WONumber`, `CustomerPOID`, `ProductID`, `QtyTarget`, `DueDate`, `Status`, `Priority`, `CreatedBy`, `StartedAt`, `CompletedAt`, `CreatedAt`, `UpdatedAt`) VALUES
(7, 'WO-202607-0001', 5, 3, 1.00, '2026-07-29', 'Completed', 'Low', 'production1', NULL, '2026-07-22 20:51:30', '2026-07-22 13:20:16', '2026-07-22 13:51:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `production_results`
--

CREATE TABLE `production_results` (
  `ProductionResultID` bigint(20) NOT NULL,
  `ProductionOrderID` bigint(20) NOT NULL,
  `TransferID` bigint(20) DEFAULT NULL,
  `ProductionDate` date NOT NULL,
  `Shift` enum('Shift 1','Shift 2','Shift 3') DEFAULT 'Shift 1',
  `QtyTarget` decimal(15,2) NOT NULL,
  `QtyProduced` decimal(15,2) DEFAULT 0.00,
  `QtyReject` decimal(15,2) DEFAULT 0.00,
  `QtyRepair` decimal(15,2) DEFAULT 0.00,
  `QtyGood` decimal(15,2) GENERATED ALWAYS AS (`QtyProduced` - `QtyReject`) STORED,
  `Operator` varchar(50) DEFAULT NULL,
  `MachineNo` varchar(30) DEFAULT NULL,
  `StartTime` datetime DEFAULT NULL,
  `EndTime` datetime DEFAULT NULL,
  `Notes` text DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `production_results`
--

INSERT INTO `production_results` (`ProductionResultID`, `ProductionOrderID`, `TransferID`, `ProductionDate`, `Shift`, `QtyTarget`, `QtyProduced`, `QtyReject`, `QtyRepair`, `Operator`, `MachineNo`, `StartTime`, `EndTime`, `Notes`, `CreatedAt`, `UpdatedAt`) VALUES
(5, 7, 2, '2026-07-22', 'Shift 1', 1.00, 1.00, 0.00, 0.00, 'AJI', 'M-001', NULL, NULL, '', '2026-07-22 13:51:30', '2026-07-22 13:51:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `ProductID` bigint(20) NOT NULL,
  `ProductCode` varchar(30) NOT NULL,
  `ProductName` varchar(150) NOT NULL,
  `Description` text DEFAULT NULL,
  `UOM` varchar(10) DEFAULT 'PCS',
  `Category` varchar(50) DEFAULT NULL,
  `UnitPrice` decimal(15,2) DEFAULT 0.00,
  `Active` tinyint(1) DEFAULT 1,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`ProductID`, `ProductCode`, `ProductName`, `Description`, `UOM`, `Category`, `UnitPrice`, `Active`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 'FG-001', 'Plastic Sheet Clear', 'Transparent PVC sheet 1mm x 1m x 2m', 'PCS', 'Plastic Sheet', 75000.00, 1, '2026-07-22 07:54:29', '2026-07-22 07:54:29'),
(2, 'FG-002', 'Plastic Sheet White', 'White PVC sheet 2mm x 1m x 2m', 'PCS', 'Plastic Sheet', 95000.00, 1, '2026-07-22 07:54:29', '2026-07-22 07:54:29'),
(3, 'FG-003', 'HDPE Pipe 1/2\"', 'HDPE pipe, 1/2 inch, 6m lengthh', 'PCS', 'Pipe', 120000.00, 1, '2026-07-22 07:54:29', '2026-08-03 13:03:06'),
(4, 'FG-004', 'HDPE Pipe 3/4\"', 'HDPE pipe, 3/4 inch, 6m length', 'PCS', 'Pipe', 150000.00, 1, '2026-07-22 07:54:29', '2026-07-22 07:54:29'),
(5, 'FG-005', 'Plastic Pallet', 'Heavy duty plastic pallet 1200x1000mm', 'PCS', 'Pallet', 350000.00, 1, '2026-07-22 07:54:29', '2026-07-22 07:54:29'),
(6, 'FG-006', 'Plastic Box Container', 'Storage box 600x400x300mm', 'PCS', 'Container', 180000.00, 1, '2026-07-22 07:54:29', '2026-07-22 07:54:29'),
(7, 'FG-007', 'LDPE Film Roll', 'LDPE film 0.05mm x 1m x 100m', 'ROLL', 'Film', 250000.00, 1, '2026-07-22 07:54:29', '2026-07-22 07:54:29'),
(8, 'FG-008', 'PVC Profile', 'U-shape profile 20x20mm, 3m', 'PCS', 'Profile', 85000.00, 1, '2026-07-22 07:54:29', '2026-07-22 07:54:29'),
(9, 'tes', 'tes', 'adw', 'PCS', 'tes', 1.00, 1, '2026-08-03 13:15:25', '2026-08-03 13:15:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `POID` bigint(20) NOT NULL,
  `PONumber` varchar(30) NOT NULL,
  `PODate` date NOT NULL,
  `SupplierID` bigint(20) NOT NULL,
  `Status` enum('Draft','Submitted','Approved','Partial','Completed','Cancelled') DEFAULT 'Draft',
  `CreatedBy` varchar(50) DEFAULT NULL,
  `Notes` text DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `purchase_orders`
--

INSERT INTO `purchase_orders` (`POID`, `PONumber`, `PODate`, `SupplierID`, `Status`, `CreatedBy`, `Notes`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 'PO-202607-0001', '2026-07-22', 5, 'Approved', 'purchasing1', 'sdasd', '2026-07-22 07:54:58', '2026-07-22 08:23:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `purchase_order_details`
--

CREATE TABLE `purchase_order_details` (
  `PODetailID` bigint(20) NOT NULL,
  `POID` bigint(20) NOT NULL,
  `MaterialID` bigint(20) NOT NULL,
  `QtyOrder` decimal(15,2) NOT NULL,
  `Price` decimal(15,2) DEFAULT 0.00,
  `Total` decimal(15,2) DEFAULT 0.00,
  `QtyReceived` decimal(15,2) DEFAULT 0.00,
  `QtyRemaining` decimal(15,2) DEFAULT 0.00,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `purchase_order_details`
--

INSERT INTO `purchase_order_details` (`PODetailID`, `POID`, `MaterialID`, `QtyOrder`, `Price`, `Total`, `QtyReceived`, `QtyRemaining`, `CreatedAt`) VALUES
(1, 1, 7, 1.00, 1000.00, 1000.00, 0.00, 1.00, '2026-07-22 07:54:58');

--
-- Trigger `purchase_order_details`
--
DELIMITER $$
CREATE TRIGGER `trg_update_po_status` AFTER UPDATE ON `purchase_order_details` FOR EACH ROW BEGIN
    DECLARE total_qty DECIMAL(15,2);
    DECLARE total_received DECIMAL(15,2);
    
    SELECT SUM(QtyOrder), SUM(QtyReceived) 
    INTO total_qty, total_received
    FROM purchase_order_details 
    WHERE POID = NEW.POID;
    
    IF total_received >= total_qty THEN
        UPDATE purchase_orders 
        SET Status = 'Completed' 
        WHERE POID = NEW.POID AND Status != 'Cancelled';
    ELSEIF total_received > 0 AND total_received < total_qty THEN
        UPDATE purchase_orders 
        SET Status = 'Partial' 
        WHERE POID = NEW.POID AND Status IN ('Approved', 'Submitted');
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `qc_inspections`
--

CREATE TABLE `qc_inspections` (
  `QCID` bigint(20) NOT NULL,
  `ProductionResultID` bigint(20) NOT NULL,
  `InspectionDate` date NOT NULL,
  `QtyChecked` decimal(15,2) NOT NULL,
  `QtyPASS` decimal(15,2) DEFAULT 0.00,
  `QtyNG` decimal(15,2) DEFAULT 0.00,
  `NGReason` text DEFAULT NULL,
  `StatusQC` enum('Pending','Inspected','Rework','Rejected') DEFAULT 'Pending',
  `Rework` tinyint(1) DEFAULT 0,
  `FinalStatus` enum('Accepted','Rejected','Rework') DEFAULT NULL,
  `Inspector` varchar(50) DEFAULT NULL,
  `Notes` text DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `qc_inspections`
--

INSERT INTO `qc_inspections` (`QCID`, `ProductionResultID`, `InspectionDate`, `QtyChecked`, `QtyPASS`, `QtyNG`, `NGReason`, `StatusQC`, `Rework`, `FinalStatus`, `Inspector`, `Notes`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 5, '2026-07-22', 1.00, 1.00, 0.00, '', 'Inspected', 0, 'Accepted', 'RINA', 'ok', '2026-07-22 13:54:11', '2026-07-22 13:56:22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `stock_fg`
--

CREATE TABLE `stock_fg` (
  `StockFGID` bigint(20) NOT NULL,
  `ProductID` bigint(20) NOT NULL,
  `WarehouseID` bigint(20) NOT NULL,
  `DockID` bigint(20) DEFAULT NULL,
  `QtyOnHand` decimal(15,2) DEFAULT 0.00,
  `QtyReserved` decimal(15,2) DEFAULT 0.00,
  `QtyAvailable` decimal(15,2) GENERATED ALWAYS AS (`QtyOnHand` - `QtyReserved`) STORED,
  `BatchNo` varchar(50) DEFAULT NULL,
  `PalletNo` varchar(50) DEFAULT NULL,
  `BinLocation` varchar(50) DEFAULT NULL,
  `LastUpdated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `stock_fg`
--

INSERT INTO `stock_fg` (`StockFGID`, `ProductID`, `WarehouseID`, `DockID`, `QtyOnHand`, `QtyReserved`, `BatchNo`, `PalletNo`, `BinLocation`, `LastUpdated`) VALUES
(1, 3, 1, NULL, 3.00, 0.00, 'BATCH-20260722-5', NULL, NULL, '2026-07-22 14:19:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `suppliers`
--

CREATE TABLE `suppliers` (
  `SupplierID` bigint(20) NOT NULL,
  `SupplierCode` varchar(20) NOT NULL,
  `SupplierName` varchar(150) NOT NULL,
  `Address` text DEFAULT NULL,
  `Phone` varchar(30) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Status` tinyint(4) DEFAULT 1,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `suppliers`
--

INSERT INTO `suppliers` (`SupplierID`, `SupplierCode`, `SupplierName`, `Address`, `Phone`, `Email`, `Status`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 'SUP-001', 'PT Bahan Baku Jaya', 'Jl. Industri Raya No. 10, Jakarta', '021-5551001', 'info@bahanbaku.co.id', 1, '2026-07-22 07:54:29', '2026-07-22 07:54:29'),
(2, 'SUP-002', 'CV Material Sentosa', 'Jl. Raya Bandung No. 45, Bandung', '022-5552002', 'sales@material.co.id', 1, '2026-07-22 07:54:29', '2026-07-22 07:54:29'),
(3, 'SUP-003', 'PT Kimia Nusantara', 'Jl. Kimia Raya No. 8, Surabaya', '031-5553003', 'contact@kimia.co.id', 1, '2026-07-22 07:54:29', '2026-07-22 07:54:29'),
(4, 'SUP-004', 'UD Plastik Mandiri', 'Jl. Plastik No. 12, Semarang', '024-5554004', 'plastik@mandiri.co.id', 1, '2026-07-22 07:54:29', '2026-07-22 07:54:29'),
(5, 'SUP-005', 'CV Elektrik Pratama', 'Jl. Elektronik No. 20, Tangerang', '021-5555005', 'sales@elektrik.co.id', 1, '2026-07-22 07:54:29', '2026-07-22 07:54:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transfer_details`
--

CREATE TABLE `transfer_details` (
  `TransferDetailID` bigint(20) NOT NULL,
  `TransferID` bigint(20) NOT NULL,
  `MaterialID` bigint(20) NOT NULL,
  `QtyTransfer` decimal(15,2) NOT NULL,
  `QtyReceived` decimal(15,2) DEFAULT 0.00,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transfer_details`
--

INSERT INTO `transfer_details` (`TransferDetailID`, `TransferID`, `MaterialID`, `QtyTransfer`, `QtyReceived`, `CreatedAt`) VALUES
(3, 2, 7, 1.00, 0.00, '2026-07-22 13:31:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `UserID` bigint(20) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `PasswordHash` varchar(255) NOT NULL,
  `FullName` varchar(100) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Role` enum('Admin','Purchasing','Production','Warehouse','QC','Supervisor','Manager') NOT NULL,
  `Department` varchar(50) DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT 1,
  `LastLogin` datetime DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`UserID`, `Username`, `PasswordHash`, `FullName`, `Email`, `Role`, `Department`, `IsActive`, `LastLogin`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', 'Administrator', 'admin@company.com', 'Admin', 'IT', 1, NULL, '2026-07-22 07:54:29', '2026-07-22 07:54:29'),
(2, 'purchasing1', '3da2199042df603a5083be50304936c7', 'Budi Purchasing', 'budi@company.com', 'Purchasing', 'Purchasing', 1, NULL, '2026-07-22 07:54:29', '2026-07-22 07:54:29'),
(3, 'production1', 'a220a758ba49c02182c149281844037f', 'Siti Production', 'siti@company.com', 'Production', 'Production', 1, NULL, '2026-07-22 07:54:29', '2026-07-22 07:54:29'),
(4, 'warehouse1', '26f18d144dd76ca21743597d776be92e', 'Agus Warehouse', 'agus@company.com', 'Warehouse', 'Warehouse', 1, NULL, '2026-07-22 07:54:29', '2026-07-22 07:54:29'),
(5, 'qc1', 'b1c6481c185f741d1c3fc218d6cedc7e', 'Rina QC', 'rina@company.com', 'QC', 'Quality Control', 1, NULL, '2026-07-22 07:54:29', '2026-07-22 07:54:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `warehouses`
--

CREATE TABLE `warehouses` (
  `WarehouseID` bigint(20) NOT NULL,
  `WarehouseCode` varchar(20) NOT NULL,
  `WarehouseName` varchar(100) NOT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `WarehouseType` enum('Material','FG','Mixed') DEFAULT 'Mixed',
  `IsActive` tinyint(1) DEFAULT 1,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `warehouses`
--

INSERT INTO `warehouses` (`WarehouseID`, `WarehouseCode`, `WarehouseName`, `Location`, `WarehouseType`, `IsActive`, `CreatedAt`) VALUES
(1, 'WH-001', 'Gudang Material Utama', 'Jl. Industri Raya No. 5, Jakarta', 'Material', 1, '2026-07-22 07:54:29'),
(2, 'WH-002', 'Gudang Material Cadangan', 'Jl. Raya Bandung KM 10, Bandung', 'Material', 1, '2026-07-22 07:54:29'),
(3, 'WH-003', 'Gudang FG Pusat', 'Jl. Gatot Subroto No. 15, Jakarta', 'FG', 1, '2026-07-22 07:54:29'),
(4, 'WH-004', 'Gudang FG Cabang', 'Jl. Ahmad Yani No. 25, Surabaya', 'FG', 1, '2026-07-22 07:54:29');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bom`
--
ALTER TABLE `bom`
  ADD PRIMARY KEY (`BOMID`),
  ADD UNIQUE KEY `uk_bom` (`ProductID`,`MaterialID`),
  ADD KEY `MaterialID` (`MaterialID`);

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`),
  ADD UNIQUE KEY `CustomerCode` (`CustomerCode`);

--
-- Indeks untuk tabel `customer_pos`
--
ALTER TABLE `customer_pos`
  ADD PRIMARY KEY (`CustomerPOID`),
  ADD UNIQUE KEY `PONumber` (`PONumber`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indeks untuk tabel `customer_po_details`
--
ALTER TABLE `customer_po_details`
  ADD PRIMARY KEY (`CustomerPODetailID`),
  ADD KEY `CustomerPOID` (`CustomerPOID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indeks untuk tabel `fg_receipts`
--
ALTER TABLE `fg_receipts`
  ADD PRIMARY KEY (`FGReceiptID`),
  ADD UNIQUE KEY `FGNumber` (`FGNumber`),
  ADD KEY `CustomerPOID` (`CustomerPOID`),
  ADD KEY `ProductionResultID` (`ProductionResultID`),
  ADD KEY `QCID` (`QCID`),
  ADD KEY `DockID` (`DockID`);

--
-- Indeks untuk tabel `fg_receipt_details`
--
ALTER TABLE `fg_receipt_details`
  ADD PRIMARY KEY (`FGDetailID`),
  ADD KEY `FGReceiptID` (`FGReceiptID`),
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `CustomerPODetailID` (`CustomerPODetailID`);

--
-- Indeks untuk tabel `inventory_transactions`
--
ALTER TABLE `inventory_transactions`
  ADD PRIMARY KEY (`TransactionID`),
  ADD KEY `MaterialID` (`MaterialID`),
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `WarehouseID` (`WarehouseID`);

--
-- Indeks untuk tabel `loading_docks`
--
ALTER TABLE `loading_docks`
  ADD PRIMARY KEY (`DockID`),
  ADD UNIQUE KEY `DockCode` (`DockCode`),
  ADD KEY `WarehouseID` (`WarehouseID`);

--
-- Indeks untuk tabel `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`MaterialID`),
  ADD UNIQUE KEY `MaterialCode` (`MaterialCode`);

--
-- Indeks untuk tabel `material_receipts`
--
ALTER TABLE `material_receipts`
  ADD PRIMARY KEY (`ReceiptID`),
  ADD UNIQUE KEY `ReceiptNumber` (`ReceiptNumber`),
  ADD KEY `POID` (`POID`),
  ADD KEY `SupplierID` (`SupplierID`),
  ADD KEY `WarehouseID` (`WarehouseID`);

--
-- Indeks untuk tabel `material_receipt_details`
--
ALTER TABLE `material_receipt_details`
  ADD PRIMARY KEY (`ReceiptDetailID`),
  ADD KEY `ReceiptID` (`ReceiptID`),
  ADD KEY `PODetailID` (`PODetailID`),
  ADD KEY `MaterialID` (`MaterialID`),
  ADD KEY `WarehouseID` (`WarehouseID`);

--
-- Indeks untuk tabel `material_stock`
--
ALTER TABLE `material_stock`
  ADD PRIMARY KEY (`StockID`),
  ADD UNIQUE KEY `uk_material_warehouse` (`MaterialID`,`WarehouseID`),
  ADD KEY `WarehouseID` (`WarehouseID`);

--
-- Indeks untuk tabel `material_transfers`
--
ALTER TABLE `material_transfers`
  ADD PRIMARY KEY (`TransferID`),
  ADD UNIQUE KEY `TransferNumber` (`TransferNumber`),
  ADD KEY `ProductionOrderID` (`ProductionOrderID`),
  ADD KEY `FromWarehouseID` (`from_warehouse_id`);

--
-- Indeks untuk tabel `production_orders`
--
ALTER TABLE `production_orders`
  ADD PRIMARY KEY (`ProductionOrderID`),
  ADD UNIQUE KEY `WONumber` (`WONumber`),
  ADD KEY `CustomerPOID` (`CustomerPOID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indeks untuk tabel `production_results`
--
ALTER TABLE `production_results`
  ADD PRIMARY KEY (`ProductionResultID`),
  ADD KEY `ProductionOrderID` (`ProductionOrderID`),
  ADD KEY `TransferID` (`TransferID`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`),
  ADD UNIQUE KEY `ProductCode` (`ProductCode`);

--
-- Indeks untuk tabel `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`POID`),
  ADD UNIQUE KEY `PONumber` (`PONumber`),
  ADD KEY `SupplierID` (`SupplierID`);

--
-- Indeks untuk tabel `purchase_order_details`
--
ALTER TABLE `purchase_order_details`
  ADD PRIMARY KEY (`PODetailID`),
  ADD KEY `POID` (`POID`),
  ADD KEY `MaterialID` (`MaterialID`);

--
-- Indeks untuk tabel `qc_inspections`
--
ALTER TABLE `qc_inspections`
  ADD PRIMARY KEY (`QCID`),
  ADD KEY `ProductionResultID` (`ProductionResultID`);

--
-- Indeks untuk tabel `stock_fg`
--
ALTER TABLE `stock_fg`
  ADD PRIMARY KEY (`StockFGID`),
  ADD UNIQUE KEY `uk_product_warehouse_batch` (`ProductID`,`WarehouseID`,`BatchNo`),
  ADD KEY `WarehouseID` (`WarehouseID`),
  ADD KEY `DockID` (`DockID`);

--
-- Indeks untuk tabel `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`SupplierID`),
  ADD UNIQUE KEY `SupplierCode` (`SupplierCode`);

--
-- Indeks untuk tabel `transfer_details`
--
ALTER TABLE `transfer_details`
  ADD PRIMARY KEY (`TransferDetailID`),
  ADD KEY `TransferID` (`TransferID`),
  ADD KEY `MaterialID` (`MaterialID`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- Indeks untuk tabel `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`WarehouseID`),
  ADD UNIQUE KEY `WarehouseCode` (`WarehouseCode`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bom`
--
ALTER TABLE `bom`
  MODIFY `BOMID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `customers`
--
ALTER TABLE `customers`
  MODIFY `CustomerID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `customer_pos`
--
ALTER TABLE `customer_pos`
  MODIFY `CustomerPOID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `customer_po_details`
--
ALTER TABLE `customer_po_details`
  MODIFY `CustomerPODetailID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `fg_receipts`
--
ALTER TABLE `fg_receipts`
  MODIFY `FGReceiptID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `fg_receipt_details`
--
ALTER TABLE `fg_receipt_details`
  MODIFY `FGDetailID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `inventory_transactions`
--
ALTER TABLE `inventory_transactions`
  MODIFY `TransactionID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `loading_docks`
--
ALTER TABLE `loading_docks`
  MODIFY `DockID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `materials`
--
ALTER TABLE `materials`
  MODIFY `MaterialID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `material_receipts`
--
ALTER TABLE `material_receipts`
  MODIFY `ReceiptID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `material_receipt_details`
--
ALTER TABLE `material_receipt_details`
  MODIFY `ReceiptDetailID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `material_stock`
--
ALTER TABLE `material_stock`
  MODIFY `StockID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `material_transfers`
--
ALTER TABLE `material_transfers`
  MODIFY `TransferID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `production_orders`
--
ALTER TABLE `production_orders`
  MODIFY `ProductionOrderID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `production_results`
--
ALTER TABLE `production_results`
  MODIFY `ProductionResultID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `POID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `purchase_order_details`
--
ALTER TABLE `purchase_order_details`
  MODIFY `PODetailID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `qc_inspections`
--
ALTER TABLE `qc_inspections`
  MODIFY `QCID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `stock_fg`
--
ALTER TABLE `stock_fg`
  MODIFY `StockFGID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `SupplierID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `transfer_details`
--
ALTER TABLE `transfer_details`
  MODIFY `TransferDetailID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `UserID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `WarehouseID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `bom`
--
ALTER TABLE `bom`
  ADD CONSTRAINT `bom_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`),
  ADD CONSTRAINT `bom_ibfk_2` FOREIGN KEY (`MaterialID`) REFERENCES `materials` (`MaterialID`);

--
-- Ketidakleluasaan untuk tabel `customer_pos`
--
ALTER TABLE `customer_pos`
  ADD CONSTRAINT `customer_pos_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`);

--
-- Ketidakleluasaan untuk tabel `customer_po_details`
--
ALTER TABLE `customer_po_details`
  ADD CONSTRAINT `customer_po_details_ibfk_1` FOREIGN KEY (`CustomerPOID`) REFERENCES `customer_pos` (`CustomerPOID`) ON DELETE CASCADE,
  ADD CONSTRAINT `customer_po_details_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`);

--
-- Ketidakleluasaan untuk tabel `fg_receipts`
--
ALTER TABLE `fg_receipts`
  ADD CONSTRAINT `fg_receipts_ibfk_1` FOREIGN KEY (`CustomerPOID`) REFERENCES `customer_pos` (`CustomerPOID`),
  ADD CONSTRAINT `fg_receipts_ibfk_2` FOREIGN KEY (`ProductionResultID`) REFERENCES `production_results` (`ProductionResultID`),
  ADD CONSTRAINT `fg_receipts_ibfk_3` FOREIGN KEY (`QCID`) REFERENCES `qc_inspections` (`QCID`),
  ADD CONSTRAINT `fg_receipts_ibfk_4` FOREIGN KEY (`DockID`) REFERENCES `loading_docks` (`DockID`);

--
-- Ketidakleluasaan untuk tabel `fg_receipt_details`
--
ALTER TABLE `fg_receipt_details`
  ADD CONSTRAINT `fg_receipt_details_ibfk_1` FOREIGN KEY (`FGReceiptID`) REFERENCES `fg_receipts` (`FGReceiptID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fg_receipt_details_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`),
  ADD CONSTRAINT `fg_receipt_details_ibfk_3` FOREIGN KEY (`CustomerPODetailID`) REFERENCES `customer_po_details` (`CustomerPODetailID`);

--
-- Ketidakleluasaan untuk tabel `inventory_transactions`
--
ALTER TABLE `inventory_transactions`
  ADD CONSTRAINT `inventory_transactions_ibfk_1` FOREIGN KEY (`MaterialID`) REFERENCES `materials` (`MaterialID`),
  ADD CONSTRAINT `inventory_transactions_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`),
  ADD CONSTRAINT `inventory_transactions_ibfk_3` FOREIGN KEY (`WarehouseID`) REFERENCES `warehouses` (`WarehouseID`);

--
-- Ketidakleluasaan untuk tabel `loading_docks`
--
ALTER TABLE `loading_docks`
  ADD CONSTRAINT `loading_docks_ibfk_1` FOREIGN KEY (`WarehouseID`) REFERENCES `warehouses` (`WarehouseID`);

--
-- Ketidakleluasaan untuk tabel `material_receipts`
--
ALTER TABLE `material_receipts`
  ADD CONSTRAINT `material_receipts_ibfk_1` FOREIGN KEY (`POID`) REFERENCES `purchase_orders` (`POID`),
  ADD CONSTRAINT `material_receipts_ibfk_2` FOREIGN KEY (`SupplierID`) REFERENCES `suppliers` (`SupplierID`),
  ADD CONSTRAINT `material_receipts_ibfk_3` FOREIGN KEY (`WarehouseID`) REFERENCES `warehouses` (`WarehouseID`);

--
-- Ketidakleluasaan untuk tabel `material_receipt_details`
--
ALTER TABLE `material_receipt_details`
  ADD CONSTRAINT `material_receipt_details_ibfk_1` FOREIGN KEY (`ReceiptID`) REFERENCES `material_receipts` (`ReceiptID`) ON DELETE CASCADE,
  ADD CONSTRAINT `material_receipt_details_ibfk_2` FOREIGN KEY (`PODetailID`) REFERENCES `purchase_order_details` (`PODetailID`),
  ADD CONSTRAINT `material_receipt_details_ibfk_3` FOREIGN KEY (`MaterialID`) REFERENCES `materials` (`MaterialID`),
  ADD CONSTRAINT `material_receipt_details_ibfk_4` FOREIGN KEY (`WarehouseID`) REFERENCES `warehouses` (`WarehouseID`);

--
-- Ketidakleluasaan untuk tabel `material_stock`
--
ALTER TABLE `material_stock`
  ADD CONSTRAINT `material_stock_ibfk_1` FOREIGN KEY (`MaterialID`) REFERENCES `materials` (`MaterialID`),
  ADD CONSTRAINT `material_stock_ibfk_2` FOREIGN KEY (`WarehouseID`) REFERENCES `warehouses` (`WarehouseID`);

--
-- Ketidakleluasaan untuk tabel `material_transfers`
--
ALTER TABLE `material_transfers`
  ADD CONSTRAINT `material_transfers_ibfk_1` FOREIGN KEY (`ProductionOrderID`) REFERENCES `production_orders` (`ProductionOrderID`),
  ADD CONSTRAINT `material_transfers_ibfk_2` FOREIGN KEY (`from_warehouse_id`) REFERENCES `warehouses` (`WarehouseID`);

--
-- Ketidakleluasaan untuk tabel `production_orders`
--
ALTER TABLE `production_orders`
  ADD CONSTRAINT `production_orders_ibfk_1` FOREIGN KEY (`CustomerPOID`) REFERENCES `customer_pos` (`CustomerPOID`),
  ADD CONSTRAINT `production_orders_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`);

--
-- Ketidakleluasaan untuk tabel `production_results`
--
ALTER TABLE `production_results`
  ADD CONSTRAINT `production_results_ibfk_1` FOREIGN KEY (`ProductionOrderID`) REFERENCES `production_orders` (`ProductionOrderID`),
  ADD CONSTRAINT `production_results_ibfk_2` FOREIGN KEY (`TransferID`) REFERENCES `material_transfers` (`TransferID`);

--
-- Ketidakleluasaan untuk tabel `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD CONSTRAINT `purchase_orders_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `suppliers` (`SupplierID`);

--
-- Ketidakleluasaan untuk tabel `purchase_order_details`
--
ALTER TABLE `purchase_order_details`
  ADD CONSTRAINT `purchase_order_details_ibfk_1` FOREIGN KEY (`POID`) REFERENCES `purchase_orders` (`POID`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_order_details_ibfk_2` FOREIGN KEY (`MaterialID`) REFERENCES `materials` (`MaterialID`);

--
-- Ketidakleluasaan untuk tabel `qc_inspections`
--
ALTER TABLE `qc_inspections`
  ADD CONSTRAINT `qc_inspections_ibfk_1` FOREIGN KEY (`ProductionResultID`) REFERENCES `production_results` (`ProductionResultID`);

--
-- Ketidakleluasaan untuk tabel `stock_fg`
--
ALTER TABLE `stock_fg`
  ADD CONSTRAINT `stock_fg_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`),
  ADD CONSTRAINT `stock_fg_ibfk_2` FOREIGN KEY (`WarehouseID`) REFERENCES `warehouses` (`WarehouseID`),
  ADD CONSTRAINT `stock_fg_ibfk_3` FOREIGN KEY (`DockID`) REFERENCES `loading_docks` (`DockID`);

--
-- Ketidakleluasaan untuk tabel `transfer_details`
--
ALTER TABLE `transfer_details`
  ADD CONSTRAINT `transfer_details_ibfk_1` FOREIGN KEY (`TransferID`) REFERENCES `material_transfers` (`TransferID`) ON DELETE CASCADE,
  ADD CONSTRAINT `transfer_details_ibfk_2` FOREIGN KEY (`MaterialID`) REFERENCES `materials` (`MaterialID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
