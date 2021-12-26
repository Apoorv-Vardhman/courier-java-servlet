-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 26, 2021 at 11:47 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `courier`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `a_id` char(8) NOT NULL,
  `a_name` varchar(25) NOT NULL,
  `a_state` varchar(25) NOT NULL,
  `a_district` varchar(25) NOT NULL,
  `a_city` varchar(25) NOT NULL,
  `a_address` varchar(100) NOT NULL,
  `a_pin` varchar(6) NOT NULL,
  `a_email` varchar(50) NOT NULL,
  `a_mob` char(10) NOT NULL,
  `a_gender` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`a_id`, `a_name`, `a_state`, `a_district`, `a_city`, `a_address`, `a_pin`, `a_email`, `a_mob`, `a_gender`) VALUES
('a1', '123213', 'Bihar', 'Bihar', 'Bihar', 'Ara', 'sadfsa', 'shriyashekhar1947@gmail.com', 'asdfsadfsa', 'female'),
('a10', 'avi', 'Bihar', 'Bihar', 'Bihar', 'avi', 'hkjhdk', 'qw', '12', 'female'),
('a11', 'avi', 'Bihar', 'Bihar', 'Bihar', 'avi', 'hkjhdk', 'lk', 'lk', 'female'),
('a12', 'avi', 'Bihar', 'Bihar', 'Bihar', 'avi', 'hkjhdk', 'lkhs', 'lllllllll', 'female'),
('a13', 'avi', 'Bihar', 'Bihar', 'Bihar', 'avi', 'hkjhdk', 'qwlk', 'kckd', 'female'),
('a14', 'avi', 'Bihar', 'Bihar', 'Bihar', 'avi', 'hkjhdk', 'lkkjk', ',nmbj', 'female'),
('a15', 'avi', 'Bihar', 'Bihar', 'Bihar', 'avi', 'hkjhdk', 'lmn', 'oj', 'female'),
('a16', 'avi', 'Bihar', 'Bihar', 'Bihar', 'avi', 'hkjhdk', 'sd', 'qw', 'female'),
('a17', 'avi', 'Bihar', 'Bihar', 'Bihar', 'avi', 'hkjhdk', 'lkpop', 'nb', 'female'),
('a18', 'shri', 'Bihar', 'Bihar', 'Bihar', 'buxar', 'aaa', 'as', 'aa', 'female'),
('a19', 'qwe', 'Bihar', 'Bihar', 'Bihar', 'as', 'as', 'asaa', 'as', 'female'),
('a2', 'shri', 'Bihar', 'Bihar', 'Bihar', 'Patna', '800001', 'shriyarts1947@gmail.com', '7779935197', 'Female'),
('a20', 'q', 'Bihar', 'Bihar', 'Bihar', 'q', '111111', 'q', 'q', 'female'),
('a21', 'q', 'Bihar', 'Bihar', 'Bihar', 'q', '111111', 'qa', 'qa', 'female'),
('a22', 'p', 'Bihar', 'Bihar', 'Bihar', 'p', '000000', 'plkh', 'po', 'female'),
('a23', 'q', 'Bihar', 'Bihar', 'Bihar', 'q', '999999', 'pq', 'lk', 'female'),
('a24', 'q', 'Bihar', 'Bihar', 'Bihar', 'q', '777777', 'qwe', 'xs', 'female'),
('a25', 'q', 'Bihar', 'Bihar', 'Bihar', 'q', '111111', 'q@gmail.com', '9888888888', 'female'),
('a26', 'Er Xi', 'Madhya Pradesh', 'Madhya Pradesh', 'Madhya Pradesh', 'Sasaram', '444444', 'erxi@gmail.com', '4444444444', 'female'),
('a3', 'Xiao Nai', 'Madhya Pradesh', 'Madhya Pradesh', 'Madhya Pradesh', 'Madhya', '222222', 'shriyait3@gmail.com', '2222222222', 'female'),
('a4', 'Aryan', 'Uttar Pradesh', 'Bihar', 'Bihar', 'Agra', '802301', 'aryanshekhar18@gmail.com', '7779935197', 'male'),
('a5', 'Natasha', 'Bihar', 'Bihar', 'Bihar', 'Ara', '802323', 'aryanshekharit@gmail.com', '7779935197', 'male'),
('a6', 'it', 'Bihar', 'Bihar', 'Bihar', 'araria', '123456', 'it@gmail.com', '1234567890', 'female'),
('a7', 'avi', 'Bihar', 'Bihar', 'Bihar', 'avi', 'hkjhdk', 'lllllll', 'lllllllll', 'female'),
('a8', 'avi', 'Bihar', 'Bihar', 'Bihar', 'avi', 'hkjhdk', 'llllll', 'lllllllll', 'female'),
('a9', 'avi', 'Bihar', 'Bihar', 'Bihar', 'avi', 'hkjhdk', 'po', 'po', 'female');

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `b_id` char(3) NOT NULL,
  `b_name` varchar(25) NOT NULL,
  `b_state` varchar(25) NOT NULL,
  `b_district` varchar(25) NOT NULL,
  `b_city` varchar(25) NOT NULL,
  `b_address` varchar(100) NOT NULL,
  `b_pin` varchar(6) NOT NULL,
  `b_email` varchar(50) NOT NULL,
  `b_mob` char(10) NOT NULL,
  `b_isactive` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`b_id`, `b_name`, `b_state`, `b_district`, `b_city`, `b_address`, `b_pin`, `b_email`, `b_mob`, `b_isactive`) VALUES
('b1', 'Ara Branch', 'Bihar', 'Bihar', 'Bihar', 'Ara', 'a', 'a', 'a', 0),
('b2', 'Patna Branch', 'Bihar', 'Bihar', 'Bihar', 'Ara', '802301', 'shriyait3@gmail.com', '7779935197', 1),
('b3', 'Patna Branch', 'Uttar Pradesh', 'Uttar Pradesh', 'Uttar Pradesh', 'Patna', '897777', 'shriyaarts1947@gmail.com', '1111111111', 0),
('b4', 'buxar branch', 'Bihar', 'Bihar', 'Bihar', 'buxar', '222222', 'buxar@gmail.com', '2222222222', 1),
('b5', 'buxar branch', 'Bihar', 'Bihar', 'Bihar', 'buxar', '222222', 'buxar1@gmail.com', '2222222222', 1),
('b6', 'po', 'Bihar', 'Bihar', 'Bihar', 'po', '999999', 'q@gmail.com', '9888888888', 1),
('b7', 'qwerty', 'Bihar', 'Jharkhand', 'Madhya Pradesh', 'ara', '111111', 'p1@p.ab', '9666666666', 0);

-- --------------------------------------------------------

--
-- Table structure for table `branch_staff`
--

CREATE TABLE `branch_staff` (
  `bs_id` varchar(8) NOT NULL,
  `bs_name` varchar(25) NOT NULL,
  `bs_state` varchar(25) NOT NULL,
  `bs_district` varchar(25) NOT NULL,
  `bs_city` varchar(25) NOT NULL,
  `bs_pin` varchar(6) NOT NULL,
  `bs_address` varchar(100) NOT NULL,
  `bs_email` varchar(50) NOT NULL,
  `bs_mob` varchar(10) NOT NULL,
  `bs_gender` varchar(6) NOT NULL,
  `bs_dob` date NOT NULL,
  `bs_isactive` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `branch_staff`
--

INSERT INTO `branch_staff` (`bs_id`, `bs_name`, `bs_state`, `bs_district`, `bs_city`, `bs_pin`, `bs_address`, `bs_email`, `bs_mob`, `bs_gender`, `bs_dob`, `bs_isactive`) VALUES
('s1', 'shriya', 'Bihar', 'Bihar', 'Bihar', '800001', 'Patna', 'shriya@gmail.com', '1111111111', 'Female', '2021-09-18', 0),
('s2', 'shriya', 'Bihar', 'Bihar', 'Bihar', '800001', 'Patna', 'shriyait3@gmail.com', '1111111111', 'Female', '2021-09-23', 0),
('s3', 'Wei Wei', 'Uttar Pradesh', 'Uttar Pradesh', 'Uttar Pradesh', '111111', 'Agra', 'shriyaarts1947@gmail.com', '1111111111', 'Female', '2021-09-15', 1),
('s4', 'shriya', 'Bihar', 'Bihar', 'Bihar', '800001', 'Patna', 'shriyait@gmail.com', '1111111111', 'Female', '2021-09-22', 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `c_id` varchar(8) NOT NULL,
  `c_name` varchar(25) DEFAULT NULL,
  `c_state` varchar(25) DEFAULT NULL,
  `c_district` varchar(25) DEFAULT NULL,
  `c_city` varchar(25) DEFAULT NULL,
  `c_address` varchar(100) DEFAULT NULL,
  `c_pin` varchar(6) DEFAULT NULL,
  `c_email` varchar(50) DEFAULT NULL,
  `c_mob` varchar(10) DEFAULT NULL,
  `c_gender` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`c_id`, `c_name`, `c_state`, `c_district`, `c_city`, `c_address`, `c_pin`, `c_email`, `c_mob`, `c_gender`) VALUES
('c1', 'Ahn', 'Bihar', 'Bihar', 'Bihar', 'Ara', '802301', 'shriyait3@gmail.com', '7777777777', 'male'),
('c2', 'it', 'Bihar', 'Bihar', 'Bihar', 'araria', '123456', 'mimi@gmail.com', '1234567890', 'Female'),
('c3', 'pooja', 'Bihar', 'Bihar', 'Bihar', 'patna', '111111', 'poojasinha@gmail.com', '8232342343', 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `f_id` char(10) NOT NULL,
  `c_id` char(8) NOT NULL,
  `f_feedback` varchar(5000) NOT NULL,
  `f_rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`f_id`, `c_id`, `f_feedback`, `f_rating`) VALUES
('f1', 'c1', 'Very Good', 4),
('p2', 'c3', 'thank', 3);

-- --------------------------------------------------------

--
-- Table structure for table `parcel`
--

CREATE TABLE `parcel` (
  `p_id` varchar(25) NOT NULL,
  `p_consignment_no` varchar(25) NOT NULL,
  `c_id` varchar(25) DEFAULT NULL,
  `p_sender_address` varchar(100) NOT NULL,
  `r_id` varchar(10) DEFAULT NULL,
  `p_registered_date` date DEFAULT NULL,
  `p_approved_date` date DEFAULT NULL,
  `p_picked_date` date DEFAULT NULL,
  `p_instock_date` date DEFAULT NULL,
  `p_outfordelivery` date DEFAULT NULL,
  `p_date_to_reach` date DEFAULT NULL,
  `p_reached_date` date DEFAULT NULL,
  `p_transport_medium` varchar(25) DEFAULT NULL,
  `p_cost` int(11) NOT NULL,
  `p_transport_cost` int(11) NOT NULL,
  `p_parcel_cost` int(11) NOT NULL,
  `p_delivery_charges` int(11) DEFAULT NULL,
  `p_payment_mode` varchar(6) NOT NULL,
  `p_receipt_no` varchar(25) NOT NULL,
  `payment_details` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parcel`
--

INSERT INTO `parcel` (`p_id`, `p_consignment_no`, `c_id`, `p_sender_address`, `r_id`, `p_registered_date`, `p_approved_date`, `p_picked_date`, `p_instock_date`, `p_outfordelivery`, `p_date_to_reach`, `p_reached_date`, `p_transport_medium`, `p_cost`, `p_transport_cost`, `p_parcel_cost`, `p_delivery_charges`, `p_payment_mode`, `p_receipt_no`, `payment_details`) VALUES
('p1', 'pc1', 'c1', 'Shivganj Ara', 'r1', '2021-10-20', '2021-10-20', '2021-10-20', '2021-10-20', '2021-10-20', '2021-10-20', '2021-10-20', 'Mixed', 300, 100, 450, 50, 'Online', 'pr1', NULL),
('p2', 'pc2', 'c2', 'Pakri, Ara', 'r1', '2021-10-30', '2021-10-30', '2021-10-31', '2021-11-01', '2021-11-02', '2021-10-03', '2021-10-03', 'By Road', 100, 100, 300, 100, 'COD', 'pr2', NULL),
('p3', 'pc3', 'c3', 'patna', 'r2', '2021-12-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 0, 35, 5, 'cod', 'pr3', NULL),
('p4', 'pc4', 'c3', 'patna', 'r3', '2021-12-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 300, 0, 350, 50, 'cod', 'pr4', NULL),
('p5', 'pc5', 'c3', 'patna', 'r4', '2021-12-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 150, 0, 175, 25, 'online', 'pr5', 'pay_Ic4GQeWUtpc9YQ');

-- --------------------------------------------------------

--
-- Table structure for table `parcel_cancel`
--

CREATE TABLE `parcel_cancel` (
  `p_id` varchar(25) NOT NULL,
  `c_id` char(8) NOT NULL,
  `pc_reason` varchar(25) NOT NULL,
  `pc_isrefund` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parcel_cancel`
--

INSERT INTO `parcel_cancel` (`p_id`, `c_id`, `pc_reason`, `pc_isrefund`) VALUES
('p1', 'c1', 'Defected', 'Yes'),
('p4', 'c3', 'Demo', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `parcel_details`
--

CREATE TABLE `parcel_details` (
  `p_id` varchar(25) NOT NULL,
  `p_details` varchar(400) DEFAULT NULL,
  `p_no_of_item` int(11) NOT NULL,
  `p_status` varchar(30) NOT NULL,
  `p_location` varchar(100) NOT NULL,
  `b_id` char(3) DEFAULT NULL,
  `bs_id` char(8) DEFAULT NULL,
  `p_weight` int(11) NOT NULL,
  `p_length` int(11) NOT NULL,
  `p_width` int(11) NOT NULL,
  `p_height` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parcel_details`
--

INSERT INTO `parcel_details` (`p_id`, `p_details`, `p_no_of_item`, `p_status`, `p_location`, `b_id`, `bs_id`, `p_weight`, `p_length`, `p_width`, `p_height`) VALUES
('p1', 'Rakhee, sweets', 2, 'Reached', 'Near Ara', 'b1', 's1', 2, 10, 11, 10),
('p2', 'Sweets, Chocolates', 2, 'Out For Delivery', 'Near Shivganj', 'b1', 's1', 3, 11, 12, 13),
('p3', 'sdf', 2, 'placed', 'asdf', NULL, NULL, 1, 1, 1, 3),
('p4', 'Mango banana', 5, 'placed', 'Near city', NULL, NULL, 10, 5, 5, 5),
('p5', 'Mango banana', 4, 'placed', 'Near city', NULL, NULL, 5, 2, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `parcel_thing`
--

CREATE TABLE `parcel_thing` (
  `p_id` varchar(25) NOT NULL,
  `pt_name` varchar(50) DEFAULT NULL,
  `pt_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parcel_thing`
--

INSERT INTO `parcel_thing` (`p_id`, `pt_name`, `pt_no`) VALUES
('p1', 'Rakhee', 2),
('p1', 'sweets', 3),
('p2', 'Sweets', 4),
('p2', 'Rakhee', 10);

-- --------------------------------------------------------

--
-- Table structure for table `recipient`
--

CREATE TABLE `recipient` (
  `r_id` varchar(10) NOT NULL,
  `r_name` varchar(25) NOT NULL,
  `r_state` varchar(25) NOT NULL,
  `r_district` varchar(25) NOT NULL,
  `r_city` varchar(25) NOT NULL,
  `r_pin` varchar(6) NOT NULL,
  `r_address` varchar(100) NOT NULL,
  `r_phone` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recipient`
--

INSERT INTO `recipient` (`r_id`, `r_name`, `r_state`, `r_district`, `r_city`, `r_pin`, `r_address`, `r_phone`) VALUES
('r1', 'Min Miin', 'India', 'India', 'Ara', '802301', 'Shivganj Bichali Gali, Ara', '9876543210'),
('r2', 'Sneha', 'Bihar', 'Patna', 'Patna', '802111', 'Patna city', '9343434343'),
('r3', 'Sneha', 'Bihar', 'Patna', 'Patna', '803115', 'Patna City', '8723234234'),
('r4', 'Shruti', 'Jharkhand', 'Bokaro', 'Bokaro', '988324', 'Bokaro', '8632423423');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `u_id` char(8) NOT NULL,
  `u_password` varchar(15) NOT NULL,
  `u_role` varchar(9) NOT NULL,
  `u_email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`u_id`, `u_password`, `u_role`, `u_email`) VALUES
('a1', 'shriya', 'admin', 'shriyashekhar1947@gmail.com'),
('a10', 'q', 'admin', 'qw'),
('a11', 'q', 'admin', 'lk'),
('a12', 'a', 'admin', 'lkhs'),
('a13', 'ad', 'admin', 'qwlk'),
('a14', 'mn', 'admin', 'lkkjk'),
('a15', 'p', 'admin', 'lmn'),
('a16', 'z', 'admin', 'sd'),
('a17', 'mn', 'admin', 'lkpop'),
('a18', 'a', 'admin', 'as'),
('a19', 'as', 'admin', 'asaa'),
('a2', 'shriya', 'admin', 'shriyaarts1947@gmail.com'),
('a20', 'q', 'admin', 'q'),
('a21', 'q', 'admin', 'qa'),
('a22', 'k', 'admin', 'plkh'),
('a23', 'l', 'admin', 'pq'),
('a24', 'x', 'admin', 'qwe'),
('a25', 'we', 'admin', 'q@gmail.com'),
('a26', 'erxi', 'admin', 'erxi@gmail.com'),
('a3', 'xiao', 'admin', 'shriyait3@gmail.com'),
('a4', 'aryan', 'admin', 'aryanshekhar18@gmail.com'),
('a5', 'natasha', 'admin', 'aryanshekharit@gmail.com'),
('a6', 'it', 'admin', 'it@gmail.com'),
('a7', 'lllllll', 'admin', NULL),
('a8', 'p', 'admin', 'llllll'),
('a9', 'po', 'admin', 'po'),
('c1', 'shriya', 'customer', NULL),
('c2', 'it', 'customer', 'mimi@gmail.com'),
('c3', 'pooja', 'customer', 'poojasinha@gmail.com'),
('s1', 'shriya', 'staff', 'shriya@gmail.com'),
('s2', 'shriya', 'staff', 'shriyait3@gmail.com'),
('s3', 'wei', 'staff', 'shriyaarts1947@gmail.com'),
('s4', 'q', 'staff', 'shriyait@gmail.com'),
('shri', 'shri', 'admin', NULL),
('shriya', 'shriya', 'admin', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`a_id`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`b_id`);

--
-- Indexes for table `branch_staff`
--
ALTER TABLE `branch_staff`
  ADD PRIMARY KEY (`bs_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`f_id`);

--
-- Indexes for table `parcel`
--
ALTER TABLE `parcel`
  ADD PRIMARY KEY (`p_id`),
  ADD UNIQUE KEY `p_consignment_no` (`p_consignment_no`);

--
-- Indexes for table `parcel_cancel`
--
ALTER TABLE `parcel_cancel`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `parcel_details`
--
ALTER TABLE `parcel_details`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `recipient`
--
ALTER TABLE `recipient`
  ADD PRIMARY KEY (`r_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
