-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 06, 2024 at 09:53 AM
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
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `address` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_credentials`
--

INSERT INTO `customer_credentials` (`customer_id`, `username`, `firstname`, `lastname`, `birthdate`, `gender`, `address`, `email`, `password`) VALUES
(8, 'abc', 'abc', '133', '2024-08-07', 'Male', '1', '133@gg.com', '$2y$10$cDbgUsIbyHGZbVg0bOdM6ucsPK6IHgKU0DeLGY6rUj.nWW.IOEVIi'),
(9, 'ab', 'ab', 'ab', '2024-08-27', 'Male', 'af', 'gg@gmail.com', '$2y$10$Qiu.k4Tm7fKXpXSkA2xkXuaF1Ptwas6jjZqVuFk148U7Qul8fMsyK'),
(12, 'abdef', 'bab', 'ba', '2011-02-07', 'Male', 'asa', 'asas@gmail.com', '$2y$10$eI0lVWniHZ.osYwczOAAWuCKhAEORjBSlE2.yV4/V7YEGOFub4UVW');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_brand` varchar(10) NOT NULL,
  `body_config` varchar(20) NOT NULL,
  `product_name` varchar(25) NOT NULL,
  `product_price` varchar(7) NOT NULL,
  `product_info` text NOT NULL,
  `product_quantity` int(5) NOT NULL,
  `product_img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_brand`, `body_config`, `product_name`, `product_price`, `product_info`, `product_quantity`, `product_img`) VALUES
(6, 'Suzuki', 'Hatchbacks', 'Celerio', '754', 'Engine Type: 1.0L K10C DualJet Petrol Engine\r\nDisplacement: 998 cc\r\nPower Output: 66 hp @ 5,500 rpm\r\nTorque: 89 Nm @ 3,500 rpm\r\nTransmission: 5-speed manual or 5-speed AGS (Auto Gear Shift)\r\nFuel Type: Petrol\r\nFuel Efficiency: Approx. 25 km/l (claimed)\r\nLength: 3,695 mm\r\nWidth: 1,655 mm\r\nHeight: 1,555 mm\r\nWheelbase: 2,435 mm\r\nGround Clearance: 170 mm\r\nKerb Weight: Around 825-855 kg (depending on variant)\r\nSeating Capacity: 5\r\nInfotainment System: 7-inch touchscreen with Apple CarPlay and Android Auto (depending on variant)\r\nAir Conditioning: Manual or Automatic Climate Control (depending on variant)\r\nUpholstery: Fabric\r\nAirbags: Dual front airbags (standard)\r\nABS with EBD: Standard\r\nParking Sensors: Rear parking sensors (standard)\r\nISOFIX Child Seat Anchors: Standard\r\nHill Hold Assist: Available in AGS variant\r\nWheel Size: 14-inch steel or alloy wheels (depending on variant)\r\nTires: 165/70 R14\r\nKeyless Entry: Available in higher variants\r\nSteering Wheel: Tilt-adjustable with mounted controls (depending on variant)\r\nBoot Space: 313 liters', 11, 'SuzukiCelerio.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD UNIQUE KEY `username` (`username`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer_credentials`
--
ALTER TABLE `customer_credentials`
  MODIFY `customer_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
