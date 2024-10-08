SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `jenather_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL,
  `password` varchar(75) NOT NULL -- Passwords are often hashed, so varchar(75) for bcrypt hash
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
-- Separated customer credentials and address for normalization
--

CREATE TABLE `customer` (
  `customer_id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `firstname` char(30) NOT NULL,
  `lastname` char(30) NOT NULL,
  `birthdate` date NOT NULL,
  `gender` set('Male','Female') NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Address Table
CREATE TABLE `customer_address` (
  `customer_id` int(5) NOT NULL,
  `street` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  PRIMARY KEY (`customer_id`),
  FOREIGN KEY (`customer_id`) REFERENCES `customer`(`customer_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Passwords Table
CREATE TABLE `customer_passwords` (
  `customer_id` int(5) NOT NULL,
  `password` varchar(75) NOT NULL,
  PRIMARY KEY (`customer_id`),
  FOREIGN KEY (`customer_id`) REFERENCES `customer`(`customer_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_brand` varchar(20) NOT NULL,
  `body_config` varchar(20) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_price` DECIMAL(10, 2) NOT NULL, -- Converted to decimal for numeric price handling
  `product_info` text NOT NULL,
  `product_quantity` int(5) NOT NULL,
  `product_img` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for `customer`, `customer_address`, `customer_passwords`
--

INSERT INTO `customer` (`customer_id`, `username`, `firstname`, `lastname`, `birthdate`, `gender`, `email`) VALUES
(8, 'abc', 'abc', '133', '2024-08-07', 'Male', '133@gg.com'),
(9, 'ab', 'ab', 'ab', '2024-08-27', 'Male', 'gg@gmail.com'),
(12, 'abdef', 'bab', 'ba', '2011-02-07', 'Male', 'asas@gmail.com');

INSERT INTO `customer_address` (`customer_id`, `street`, `city`, `state`, `zipcode`) VALUES
(8, '1', 'Unknown City', 'Unknown State', '12345'),
(9, 'af', 'Unknown City', 'Unknown State', '54321'),
(12, 'asa', 'Unknown City', 'Unknown State', '11111');

INSERT INTO `customer_passwords` (`customer_id`, `password`) VALUES
(8, '$2y$10$cDbgUsIbyHGZbVg0bOdM6ucsPK6IHgKU0DeLGY6rUj.nWW.IOEVIi'),
(9, '$2y$10$Qiu.k4Tm7fKXpXSkA2xkXuaF1Ptwas6jjZqVuFk148U7Qul8fMsyK'),
(12, '$2y$10$eI0lVWniHZ.osYwczOAAWuCKhAEORjBSlE2.yV4/V7YEGOFub4UVW');

--
-- Dumping data for `products`
--

INSERT INTO `products` (`product_id`, `product_brand`, `body_config`, `product_name`, `product_price`, `product_info`, `product_quantity`, `product_img`) VALUES
(6, 'Suzuki', 'Hatchbacks', 'Celerio', 754.00, 'Engine Type: 1.0L K10C DualJet Petrol Engine\r\nDisplacement: 998 cc...', 11, 'SuzukiCelerio.png');

COMMIT;
