-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 08, 2024 at 09:09 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jenather_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_address`
--

CREATE TABLE `customer_address` (
  `customer_id` int(5) NOT NULL,
  `postal` int(11) NOT NULL,
  `address` text NOT NULL,
  `city` text NOT NULL,
  `region` text NOT NULL,
  `country` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_address`
--

INSERT INTO `customer_address` (`customer_id`, `postal`, `address`, `city`, `region`, `country`) VALUES
(12, 3015, 'cacarot street', 'Namek', 'Central Vegeta', 'Philippines');

-- --------------------------------------------------------

--
-- Table structure for table `customer_credentials`
--

CREATE TABLE `customer_credentials` (
  `customer_id` int(5) NOT NULL,
  `username` varchar(20) NOT NULL,
  `firstname` char(30) NOT NULL,
  `lastname` char(30) NOT NULL,
  `birthdate` date NOT NULL,
  `gender` set('Male','Female') NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_quantity` int(5) NOT NULL,
  `body_config` varchar(20) NOT NULL,
  `product_brand` varchar(10) NOT NULL,
  `product_name` varchar(25) NOT NULL,
  `product_price` decimal(10,2) DEFAULT NULL,
  `product_img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_quantity`, `body_config`, `product_brand`, `product_name`, `product_price`, `product_img`) VALUES
(11, 20, 'Hatchbacks', 'Suzuki', 'Celerio', 754000.00, 'SuzukiCelerio.png'),
(12, 10, 'Hatchbacks', 'Suzuki', 'Swift', 989000.00, 'SuzukiSwift.png'),
(13, 10, 'SUVs', 'Suzuki', 'Jimny', 819000.00, 'suzuku jimny.png');

-- --------------------------------------------------------

--
-- Table structure for table `products_description`
--

CREATE TABLE `products_description` (
  `product_id` int(5) NOT NULL,
  `engine_performances` text NOT NULL,
  `dimensions` text NOT NULL,
  `interior_comfort` text NOT NULL,
  `safety` text NOT NULL,
  `wheel` text NOT NULL,
  `features` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_description`
--

INSERT INTO `products_description` (`product_id`, `engine_performances`, `dimensions`, `interior_comfort`, `safety`, `wheel`, `features`) VALUES
(11, 'Engine Type: 1.0L K10C DualJet Petrol Engine\r\nDisplacement: 998 cc\r\nPower Output: 66 hp @ 5,500 rpm\r\nTorque: 89 Nm @ 3,500 rpm\r\nTransmission: 5-speed manual or 5-speed AGS (Auto Gear Shift)\r\nFuel Type: Petrol\r\nFuel Efficiency: Approx. 25 km/l (claimed)', 'Length: 3,695 mm\r\nWidth: 1,655 mm\r\nHeight: 1,555 mm\r\nWheelbase: 2,435 mm\r\nGround Clearance: 170 mm\r\nKerb Weight: Around 825-855 kg (depending on variant)', 'Seating Capacity: 5\r\nInfotainment System: 7-inch touchscreen with Apple CarPlay and Android Auto (depending on variant)\r\nAir Conditioning: Manual or Automatic Climate Control (depending on variant)\r\nUpholstery: Fabric', 'Airbags: Dual front airbags (standard)\r\nABS with EBD: Standard\r\nParking Sensors: Rear parking sensors (standard)\r\nISOFIX Child Seat Anchors: Standard\r\nHill Hold Assist: Available in AGS variant', 'Wheel Size: 14-inch steel or alloy wheels (depending on variant)\r\nTires: 165/70 R14', 'Keyless Entry: Available in higher variants\r\nSteering Wheel: Tilt-adjustable with mounted controls (depending on variant)\r\nBoot Space: 313 liters'),
(12, 'Engine Type: 1.2L K12M DualJet Petrol Engine\r\nDisplacement: 1,197 cc\r\nPower Output: 82 hp @ 6,000 rpm\r\nTorque: 113 Nm @ 4,400 rpm\r\nTransmission: 5-speed manual or 5-speed AMT (Automated Manual Transmission)\r\nFuel Type: Petrol\r\nFuel Efficiency: Approx. 23-24 km/l (claimed)', 'Length: 3,845 mm\r\nWidth: 1,735 mm\r\nHeight: 1,530 mm\r\nWheelbase: 2,450 mm\r\nGround Clearance: 163 mm\r\nKerb Weight: Around 875-905 kg (depending on variant)', 'Seating Capacity: 5\r\nInfotainment System: 7-inch touchscreen with Apple CarPlay and Android Auto (depending on variant)\r\nAir Conditioning: Manual or Automatic Climate Control (depending on variant)\r\nUpholstery: Fabric\r\nSteering Wheel: Tilt-adjustable with mounted controls', 'Airbags: Dual front airbags (standard)\r\nABS with EBD: Standard\r\nParking Sensors: Rear parking sensors (standard)\r\nISOFIX Child Seat Anchors: Standard\r\nESP (Electronic Stability Program): Available in higher variants\r\nHill Hold Assist: Available in AMT variant', 'Wheel Size: 15-inch steel or alloy wheels (depending on variant)\r\nTires: 185/65 R15', 'Keyless Entry: Available in higher variants\r\nPush-Button Start: Available in higher variants\r\nCruise Control: Available in higher variants\r\nBoot Space: 268 liters'),
(13, 'Engine Type: 1.5L K15B Petrol Engine\r\nDisplacement: 1,462 cc\r\nPower Output: 101 hp @ 6,000 rpm\r\nTorque: 130 Nm @ 4,000 rpm\r\nTransmission: 5-speed manual or 4-speed automatic\r\nDrive System: 4x4 with low-range transfer gear (ALLGRIP PRO)\r\nFuel Type: Petrol\r\nFuel Efficiency: Approx. 14-16 km/l (claimed)', 'Length: 3,645 mm (3-door) / 3,985 mm (5-door)\r\nWidth: 1,645 mm\r\nHeight: 1,720 mm\r\nWheelbase: 2,250 mm (3-door) / 2,590 mm (5-door)\r\nGround Clearance: 210 mm\r\nKerb Weight: Around 1,090-1,135 kg (depending on variant)', 'Seating Capacity: 4 (3-door variant) or 5 (5-door variant)\r\nInfotainment System: 7-inch or 9-inch touchscreen with Apple CarPlay and Android Auto (depending on variant)\r\nAir Conditioning: Manual or Automatic Climate Control (depending on variant)\r\nUpholstery: Fabric\r\nSteering Wheel: Tilt-adjustable with mounted controls', 'Airbags: Dual front airbags (standard)\r\nABS with EBD: Standard\r\nElectronic Stability Program (ESP): Standard\r\nHill Hold Control: Available in higher variants\r\nHill Descent Control: Available in higher variants\r\nISOFIX Child Seat Anchors: Standard', 'Wheel Size: 15-inch steel or alloy wheels (depending on variant)\r\nTires: 195/80 R15\r\nSpare Wheel: Rear-mounted full-size spare wheel', 'Keyless Entry: Available in higher variants\r\nPush-Button Start: Available in higher variants\r\nHeadlights: LED with auto function (depending on variant)\r\nBoot Space: 85 liters (expandable with rear seats folded)');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `customer_credentials`
--
ALTER TABLE `customer_credentials`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `products_description`
--
ALTER TABLE `products_description`
  ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer_address`
--
ALTER TABLE `customer_address`
  MODIFY `customer_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `customer_credentials`
--
ALTER TABLE `customer_credentials`
  MODIFY `customer_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `products_description`
--
ALTER TABLE `products_description`
  MODIFY `product_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
