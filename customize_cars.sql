-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3336
-- Generation Time: אוקטובר 03, 2021 בזמן 08:28 PM
-- גרסת שרת: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `customize_cars`
--

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `cars_models`
--

CREATE TABLE `cars_models` (
  `chassis_num` varchar(17) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `model_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finish_level` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Intercity_fuel_consumption` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `urban_fuel_consumption` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manufactuer_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- הוצאת מידע עבור טבלה `cars_models`
--

INSERT INTO `cars_models` (`chassis_num`, `price`, `model_name`, `year`, `finish_level`, `Intercity_fuel_consumption`, `urban_fuel_consumption`, `manufactuer_name`) VALUES
('92012362101010101', 95000, 'טיוטה קורולה', '2021', 'גבוה', '1:20', '1:20', 'טיוטה'),
('92093202101010101', 70000, 'מאזדה 3', '2020', 'נמוך', '1:10', '1:8', 'mazda'),
('92093202101088101', 120000, 'סובארו פורסטר', '2021', 'גבוה', '1:16', '1:18', 'סובארו');

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `car_manufactuer`
--

CREATE TABLE `car_manufactuer` (
  `manufactuer_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- הוצאת מידע עבור טבלה `car_manufactuer`
--

INSERT INTO `car_manufactuer` (`manufactuer_name`) VALUES
('mazda'),
('טיוטה'),
('סובארו');

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `customers`
--

CREATE TABLE `customers` (
  `id` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_budget` int(11) NOT NULL,
  `living_area` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position_in_work` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- הוצאת מידע עבור טבלה `customers`
--

INSERT INTO `customers` (`id`, `age`, `status`, `max_budget`, `living_area`, `position_in_work`) VALUES
('201799912', '35', 'רווק', 110000, 'center', 'CTO'),
('201899912', '28', 'נשוי+ שני ילדים', 100000, 'צפון', 'מנהל מחלקת מכירות'),
('205991102', '20', 'סטודנט רווק ללא ילדים', 50000, 'דרום', 'פקיד מכירות'),
('6717617', '30', 'רווק', 23000, 'צפון', 'Shift Manager'),
('81782718', '28', 'רווק', 172000, 'דרום', 'CISO'),
('90910219', '54', 'married', 240000, 'north', 'CEO');

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `customers_and_cars_model`
--

CREATE TABLE `customers_and_cars_model` (
  `customer_id` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chassis_num` varchar(17) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- הוצאת מידע עבור טבלה `customers_and_cars_model`
--

INSERT INTO `customers_and_cars_model` (`customer_id`, `chassis_num`) VALUES
('201799912', '92093202101088101'),
('201899912', '92012362101010101'),
('205991102', '92093202101010101');

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `customers_in_licensed_garages`
--

CREATE TABLE `customers_in_licensed_garages` (
  `customer_id` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `licensed_garages_number` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- הוצאת מידע עבור טבלה `customers_in_licensed_garages`
--

INSERT INTO `customers_in_licensed_garages` (`customer_id`, `licensed_garages_number`) VALUES
('201799912', '544'),
('201799912', '580'),
('201899912', '590');

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `licensed_garages`
--

CREATE TABLE `licensed_garages` (
  `garage_number` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `license_from` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activity_area` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `garage_activity_time` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `garage_name‏` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `garage_address` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- הוצאת מידע עבור טבלה `licensed_garages`
--

INSERT INTO `licensed_garages` (`garage_number`, `license_from`, `activity_area`, `garage_activity_time`, `garage_name‏`, `garage_address`) VALUES
('544', 'mazda', 'מרכז', '8:00 - 18:00', 'מוסך מורשה אבי נעימי', 'פתח תקווה , זבוטינסקי 70'),
('580', 'סובארו ', 'מרכז', '9:00 - 20:00', 'מוסך מורשה ניר דוידי', 'תל אביב , המסגר 17'),
('590', 'טיוטה', 'צפון', '7:00 - 17:00', 'מוסך מורשה יובל משיח', 'חיפה , אבי יעקב 19');

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `licensed_garages_of_several_car_manufacturers`
--

CREATE TABLE `licensed_garages_of_several_car_manufacturers` (
  `manufacturer_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `garage_number` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- הוצאת מידע עבור טבלה `licensed_garages_of_several_car_manufacturers`
--

INSERT INTO `licensed_garages_of_several_car_manufacturers` (`manufacturer_name`, `garage_number`) VALUES
('טיוטה', '590'),
('מאזדה', '544'),
('סובארו', '580');

--
-- Indexes for dumped tables
--

--
-- אינדקסים לטבלה `cars_models`
--
ALTER TABLE `cars_models`
  ADD PRIMARY KEY (`chassis_num`,`manufactuer_name`);

--
-- אינדקסים לטבלה `car_manufactuer`
--
ALTER TABLE `car_manufactuer`
  ADD PRIMARY KEY (`manufactuer_name`);

--
-- אינדקסים לטבלה `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- אינדקסים לטבלה `customers_and_cars_model`
--
ALTER TABLE `customers_and_cars_model`
  ADD PRIMARY KEY (`customer_id`,`chassis_num`);

--
-- אינדקסים לטבלה `customers_in_licensed_garages`
--
ALTER TABLE `customers_in_licensed_garages`
  ADD PRIMARY KEY (`customer_id`,`licensed_garages_number`);

--
-- אינדקסים לטבלה `licensed_garages`
--
ALTER TABLE `licensed_garages`
  ADD PRIMARY KEY (`garage_number`);

--
-- אינדקסים לטבלה `licensed_garages_of_several_car_manufacturers`
--
ALTER TABLE `licensed_garages_of_several_car_manufacturers`
  ADD PRIMARY KEY (`manufacturer_name`,`garage_number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
