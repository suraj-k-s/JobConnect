-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2024 at 06:47 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_jobconnect`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_name` varchar(50) NOT NULL,
  `admin_password` varchar(50) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_contact` varchar(50) NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_name`, `admin_password`, `admin_email`, `admin_contact`, `admin_id`) VALUES
('firi', '123', 'admin@gmail.com', '9446523558', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ads`
--

CREATE TABLE `tbl_ads` (
  `ads_id` int(50) NOT NULL,
  `ads_title` varchar(500) NOT NULL,
  `ads_mode` varchar(50) NOT NULL,
  `ads_details` varchar(500) NOT NULL,
  `ads_wage` varchar(300) NOT NULL,
  `ads_status` varchar(500) DEFAULT '0',
  `ads_date` varchar(50) NOT NULL,
  `shop_id` varchar(50) NOT NULL,
  `type_id` varchar(50) NOT NULL,
  `place_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_ads`
--

INSERT INTO `tbl_ads` (`ads_id`, `ads_title`, `ads_mode`, `ads_details`, `ads_wage`, `ads_status`, `ads_date`, `shop_id`, `type_id`, `place_id`) VALUES
(8, 'programmer', 'full time', ' gud', '10k', '2', '2024-03-15', '5', '1', 0),
(9, 'freelancer', 'full time', ' banuzy juib', '1200', '1', '2024-03-16', '5', '1', 0),
(10, 'Ad 1', 'Full', ' Job Ad', '400', '1', '2024-04-16', '6', '5', 0),
(11, 'JSP Developer', 'Full time', ' we want JSP developers with 2 years experience', '12000', '0', '2024-04-16', '7', '5', 0),
(12, 'Office staff', 'Full time', ' we require a Female Staff for office work', '8000', '0', '2024-04-16', '7', '5', 0),
(13, 'JSP Developer', 'Full time', ' asdfghjkl', '8000', '1', '2024-04-16', '13', '5', 2),
(14, 'Office staffs', 'Full time', ' rstststtttsttstts', '4567890', '1', '2024-04-16', '5', '1', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`category_id`, `category_name`) VALUES
(2, 'trghytrdy');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_complaint`
--

CREATE TABLE `tbl_complaint` (
  `complaint_id` int(20) NOT NULL,
  `complaint_title` varchar(500) NOT NULL,
  `complaint_details` varchar(50) NOT NULL,
  `complaint_reply` varchar(500) NOT NULL,
  `complaint_status` varchar(300) NOT NULL,
  `user_id` varchar(500) NOT NULL,
  `user_date` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_complainttype`
--

CREATE TABLE `tbl_complainttype` (
  `complaintType_id` int(11) NOT NULL,
  `complaintType_name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_complainttype`
--

INSERT INTO `tbl_complainttype` (`complaintType_id`, `complaintType_name`) VALUES
(3, 'no iisue');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_district`
--

CREATE TABLE `tbl_district` (
  `district_name` varchar(50) NOT NULL,
  `district_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_district`
--

INSERT INTO `tbl_district` (`district_name`, `district_id`) VALUES
('Ernkaulam', 2),
('Idukki', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feedback`
--

CREATE TABLE `tbl_feedback` (
  `feedback_id` int(50) NOT NULL,
  `feedback_content` varchar(500) NOT NULL,
  `feedback_date` varchar(500) NOT NULL,
  `user_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_place`
--

CREATE TABLE `tbl_place` (
  `place_name` varchar(50) NOT NULL,
  `district_id` int(11) NOT NULL,
  `place_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_place`
--

INSERT INTO `tbl_place` (`place_name`, `district_id`, `place_id`) VALUES
('muvattupuzha', 2, 2),
('Thodupuzha', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_request`
--

CREATE TABLE `tbl_request` (
  `request_id` int(11) NOT NULL,
  `request_date` varchar(50) NOT NULL,
  `ads_id` varchar(50) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `request_status` varchar(300) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_request`
--

INSERT INTO `tbl_request` (`request_id`, `request_date`, `ads_id`, `user_id`, `request_status`) VALUES
(2, '2024-03-16', '9', '5', '1'),
(3, '2024-04-16', '10', '12', '1'),
(4, '2024-04-16', '13', '5', '0'),
(5, '2024-04-16', '14', '5', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shop`
--

CREATE TABLE `tbl_shop` (
  `Shop_id` int(11) NOT NULL,
  `Shop_name` varchar(50) NOT NULL,
  `Shop_contact` varchar(50) NOT NULL,
  `Shop_address` varchar(500) NOT NULL,
  `Shop_photo` varchar(300) DEFAULT NULL,
  `Shop_proof` varchar(600) DEFAULT NULL,
  `Shop_email` varchar(50) NOT NULL,
  `Shop_password` varchar(50) NOT NULL,
  `Shop_status` varchar(50) DEFAULT '0',
  `place_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_shop`
--

INSERT INTO `tbl_shop` (`Shop_id`, `Shop_name`, `Shop_contact`, `Shop_address`, `Shop_photo`, `Shop_proof`, `Shop_email`, `Shop_password`, `Shop_status`, `place_id`) VALUES
(5, 'AY TECH', '99598506541', 'new addresss', 'ShopPhoto_1574.jpg', 'ShopProof_1125.jpg', 'shop@gmail.com', '123', '0', 2),
(6, 'ABC Shop', '9876543210', 'ABC Shop Muvattupuzha', 'ShopPhoto_1998.png', 'ShopProof_1785.png', 'abc@gmail.com', 'ABC@123', '0', 2),
(7, 'Progressive Software', '987645389', 'Ls Building muvattupuzha', 'ShopPhoto_1913.png', 'ShopProof_1301.png', 'progressive@gmail.com', '123', '0', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subcategory`
--

CREATE TABLE `tbl_subcategory` (
  `subcategory_name` varchar(50) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_type`
--

CREATE TABLE `tbl_type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_type`
--

INSERT INTO `tbl_type` (`type_id`, `type_name`) VALUES
(1, 'partime'),
(5, 'Full Time');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_contact` varchar(50) NOT NULL,
  `user_email` varchar(500) NOT NULL,
  `user_address` varchar(300) NOT NULL,
  `user_photo` varchar(500) DEFAULT NULL,
  `user_proof` varchar(500) DEFAULT NULL,
  `user_description` varchar(500) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `place_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_name`, `user_contact`, `user_email`, `user_address`, `user_photo`, `user_proof`, `user_description`, `user_password`, `place_id`) VALUES
(1, 'firos', '9995980631', '3423@gmail', 'weewewewdeeededee', NULL, NULL, 'fdsfds', '323d23d', 0),
(2, 'firos', '2332222', '3423@gmail', 'weewewewdeeededee', 'UserPhoto_1252.jpg', 'UserProof_1992.jpg', 'adfdffd', '222', 0),
(3, '12334', '3423@gmail', 'weewewewdeeededee', '2', 'UserPhoto_1001.jpg', 'UserProof_1493.jpg', '2', 'qweretrt', 0),
(4, '2', 'firos', '9448568556', 'qwerty', 'UserPhoto_1613.jpg', 'UserProof_1564.png', 'weewewewdeeededee', '3423@gmail', 0),
(5, 'Firos ', '876543209', 'user@gmail.com', 'ALA  Building', 'UserPhoto_2013.jpg', 'UserProof_1324.jpg', 'cddcdwfdec', '123', 2),
(6, 'progressive', '9995984622', 'rttretreg mvp', '12345', 'UserPhoto_1914.jpg', 'UserProof_1255.jpg', 'Save', 'progressive@gmail.com', 2),
(7, 'abc', '1234567890', 'qwertyuiop', '1234', 'UserPhoto_1128.jpg', 'UserProof_2102.jpg', 'Save', 'qwer@gmail.com', 2),
(8, 'Ayjk', '32e3', 'weewewewdeeededee', '322323', 'UserPhoto_1973.jpg', 'UserProof_1290.jpg', 'Save', '3423@gmail', 2),
(9, 'Suraj KS', '8281462910', 'suraj@gmail.com', 'Muvattupuzha', 'UserPhoto_1517.png', 'UserProof_1928.png', 'Somebody', 'Suraj123', 2),
(12, 'Navendu', '8281462222', 'surajks28101999@gmail.com', 'Muvattupuzha', 'UserPhoto_1341.png', 'UserProof_1347.png', 'Navendu', 'Navendu@123', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tbl_ads`
--
ALTER TABLE `tbl_ads`
  ADD PRIMARY KEY (`ads_id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tbl_complaint`
--
ALTER TABLE `tbl_complaint`
  ADD PRIMARY KEY (`complaint_id`);

--
-- Indexes for table `tbl_complainttype`
--
ALTER TABLE `tbl_complainttype`
  ADD PRIMARY KEY (`complaintType_id`);

--
-- Indexes for table `tbl_district`
--
ALTER TABLE `tbl_district`
  ADD PRIMARY KEY (`district_id`);

--
-- Indexes for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `tbl_place`
--
ALTER TABLE `tbl_place`
  ADD PRIMARY KEY (`place_id`);

--
-- Indexes for table `tbl_request`
--
ALTER TABLE `tbl_request`
  ADD PRIMARY KEY (`request_id`);

--
-- Indexes for table `tbl_shop`
--
ALTER TABLE `tbl_shop`
  ADD PRIMARY KEY (`Shop_id`);

--
-- Indexes for table `tbl_subcategory`
--
ALTER TABLE `tbl_subcategory`
  ADD PRIMARY KEY (`subcategory_id`);

--
-- Indexes for table `tbl_type`
--
ALTER TABLE `tbl_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_ads`
--
ALTER TABLE `tbl_ads`
  MODIFY `ads_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_complaint`
--
ALTER TABLE `tbl_complaint`
  MODIFY `complaint_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_complainttype`
--
ALTER TABLE `tbl_complainttype`
  MODIFY `complaintType_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_district`
--
ALTER TABLE `tbl_district`
  MODIFY `district_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  MODIFY `feedback_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_place`
--
ALTER TABLE `tbl_place`
  MODIFY `place_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_request`
--
ALTER TABLE `tbl_request`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_shop`
--
ALTER TABLE `tbl_shop`
  MODIFY `Shop_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_subcategory`
--
ALTER TABLE `tbl_subcategory`
  MODIFY `subcategory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_type`
--
ALTER TABLE `tbl_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
