-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 10, 2024 at 01:49 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grocery`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` int NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`aid`, `name`, `email`, `password`) VALUES
(1, 'himani', 'himaniaasoda1999@gmail.com', 8814),
(2, 'cynthia', 'cynthianahle123@gmail.com', 1234);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cid`, `name`, `parent_id`) VALUES
(1, 'self care', 0),
(3, 'clothes', 0),
(4, 'Shoes', 0),
(5, 'man perfume', 1),
(6, 'makeup', 1),
(7, 'woman perfume', 1),
(8, 'body spray', 1);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE IF NOT EXISTS `feedback` (
  `fid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `mobile` varchar(12) DEFAULT NULL,
  `msg` text,
  `uid` int DEFAULT NULL,
  PRIMARY KEY (`fid`),
  KEY `feedback_ibfk_1` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`fid`, `name`, `mobile`, `msg`, `uid`) VALUES
(1, 'Barak Obama', '9876543210', 'I am very impressed with this amazing website.', NULL),
(2, 'Name*', 'Mobile', 'Message...', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ord`
--

DROP TABLE IF EXISTS `ord`;
CREATE TABLE IF NOT EXISTS `ord` (
  `oid` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `total` int DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`oid`),
  KEY `user_id` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ord`
--

INSERT INTO `ord` (`oid`, `uid`, `total`, `date`) VALUES
(4, 9, 750, '2024-07-13 12:54:58'),
(5, 6, 222, '2024-08-10 15:46:15'),
(6, 6, 222, '2024-08-10 15:47:58'),
(7, 6, 222, '2024-08-10 16:08:50');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `oid` int NOT NULL,
  `pid` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `subtotal` int NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `order_id` (`oid`),
  KEY `product_id` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`item_id`, `oid`, `pid`, `quantity`, `amount`, `subtotal`) VALUES
(9, 5, 32, 1, 12, 12),
(10, 5, 33, 1, 10, 10),
(11, 5, 38, 1, 130, 130),
(12, 5, 121, 1, 70, 70),
(13, 6, 32, 1, 12, 12),
(14, 6, 33, 1, 10, 10),
(15, 6, 38, 1, 130, 130),
(16, 6, 121, 1, 70, 70),
(17, 7, 32, 1, 12, 12),
(18, 7, 33, 1, 10, 10),
(19, 7, 38, 1, 130, 130),
(20, 7, 121, 1, 70, 70);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `payid` int NOT NULL AUTO_INCREMENT,
  `oid` int DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `total_amount` int DEFAULT NULL,
  `payment_type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`payid`),
  KEY `uid` (`uid`),
  KEY `oid` (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payid`, `oid`, `uid`, `total_amount`, `payment_type`) VALUES
(4, 4, 9, 750, 'COD'),
(5, 5, 6, 222, 'COD'),
(6, 6, 6, 222, 'COD'),
(7, 7, 6, 222, 'COD');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `weight` varchar(20) DEFAULT NULL,
  `pic` varchar(100) DEFAULT NULL,
  `cid` int DEFAULT NULL,
  `descrp` varchar(200) NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `cid` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pid`, `name`, `price`, `discount`, `weight`, `pic`, `cid`, `descrp`) VALUES
(32, 'foundation', 12, 0, '0.3', 'images/1721045472-1721044586-3600531453404_Fit_Me_Foundation_245.webp', 6, 'Maybelline Fit Me Foundation provides all day flawless coverage and improves skin over time. With 15 shades'),
(33, 'lipstick', 10, 2, '0.1', 'images/1721046247-makeup1.jpg', 6, ' Lipstick hydrates and moisturizes your lips, while simultaneously creating full lips without clumps, flakes or cracks.'),
(36, 'Casual Canvas Shoes', 90, 10, '1 lb', 'images/1721058300-shoes2.webp', 4, 'Stylish and versatile canvas shoes, ideal for casual outings. Comes with a sturdy rubber sole and available in various colors.'),
(37, 'High Heel Sandals', 150, 25, '2 lbs', 'images/1721058500-shoes3.jpg', 4, 'Elegant high heel sandals with a sleek design. Perfect for special occasions and nights out. Features an adjustable strap for a secure fit.'),
(38, 'Basketball Shoes', 130, 15, '1.3 lbs', 'images/1721059235-shoes3.jfif', 4, 'High-performance basketball shoes with superior grip and ankle support. Designed to enhance your game on the court.'),
(40, 'Rain Boots', 90, 0, '1.5 lbs', 'images/1721059619-shoes6.jpg', 4, 'Stylish and functional waterproof rain boots. Ideal for rainy days with a non-slip sole and comfortable lining.'),
(41, 'concealer', 15, 0, '0.1', 'images/1721060951-1721058947-1721058787-s2525459-main-zoom.webp', 6, 'Concealer makeup for flawless, natural coverage. These oil-free concealers match skin tones to deliver a more even complexion.'),
(83, 'Nightfall Noir', 85, 12, '70ml', 'images/1722191648-1721073375-perfume5.webp', 5, ' A seductive and mysterious scent with dark notes of blackcurrant and leather, suited for evening events.'),
(84, 'Forest Whisper', 65, 8, '85ml', 'images/1722191782-1721073163-perfume4.webp', 5, 'A fresh and earthy fragrance with undertones of pine and cedarwood, capturing the essence of a forest walk.'),
(88, 'Aqua Surge', 70, 10, '100ml', 'images/1722192556-aqua3.webp', 5, 'A refreshing and invigorating fragrance with aquatic notes and a hint of citrus, perfect for a cool and clean scent.'),
(91, 'Aqua Essence', 75, 10, '100ml', 'images/1722193130-perrrrr.jfif', 5, 'A refreshing aquatic fragrance with notes of sea breeze and citrus, perfect for the modern man who loves adventure.'),
(92, 'Mystic Oud', 95, 15, '75ml', 'images/1722193956-okkk.jpg', 5, 'A deep, woody scent with rich notes of oud and amber, designed for those who appreciate luxury and sophistication.'),
(93, 'Urban Legend', 60, 5, '90ml', 'images/1722194298-perfumess222.jpg', 5, 'An energetic and vibrant fragrance with hints of spicy pepper and fresh green notes, ideal for city dwellers.'),
(94, 'Volumizing Mascara', 22, 8, '10ml', 'images/1722194473-Mascara.webp', 6, 'A volumizing mascara that adds dramatic length and fullness to your lashes without clumping.'),
(97, 'Classic Sneakers', 65, 10, '800g', 'images/1722195915-kurt-blk (1)__58073.jpg', 4, 'Timeless and versatile sneakers with a comfortable fit and durable sole, perfect for everyday wear.'),
(98, 'Hiking Boots', 150, 20, '1.5kg', 'images/1722196035-brent-blk (1)__97561.jpg', 4, 'Durable hiking boots with waterproof material and rugged soles, perfect for outdoor adventures.'),
(99, 'Mystic Woods', 90, 12, '50ml', 'images/1722196516-ppppp (1).jpg', 7, 'A rich and earthy fragrance with undertones of sandalwood and cedar, ideal for an evening out.'),
(100, 'Sweet Peony', 65, 10, '50ml', 'images/1722196844-sssss.jfif', 7, 'A soft and sweet scent with notes of peony and vanilla, perfect for a romantic date.'),
(101, 'Gourmand Delight', 85, 15, '50ml', 'images/1722197051-iii (1).jpg', 7, 'A delectable fragrance with notes of caramel, vanilla, and a hint of almond.'),
(104, 'Golden Jasmine', 85, 12, '50ml', 'images/1722197814-best.webp', 7, ' A radiant blend of jasmine and amber, offering a bright and uplifting scent for any time of day.'),
(106, 'Cherry Blossom', 78, 15, '60ml', 'images/1722198182-cherry.jpg', 7, 'A delicate and elegant fragrance with notes of cherry blossom and a hint of sweet almond.'),
(107, 'Citrus Fresh', 18, 10, '150ml', 'images/1722198369-1ce.webp', 8, 'An invigorating body spray with a blend of zesty citrus notes, perfect for a refreshing start to your day.'),
(108, 'Wild Flower', 20, 15, '180ml', 'images/1722198471-im.jfif', 8, 'A vibrant blend of wildflowers and fruity notes that creates a light, uplifting scent for everyday wear.'),
(109, 'Cool Mint', 19, 8, '150ml', 'images/1722198553-sprig.jpg', 8, 'A refreshing burst of mint combined with cool citrus notes, ideal for a refreshing lift any time of day.'),
(110, 'Lavender Fields', 23, 10, '150ml', 'images/1722198846-2226.jpg', 8, 'A soothing body spray with calming lavender notes, perfect for relaxation and stress relief.'),
(111, 'Vanilla Dream', 21, 10, '150ml', 'images/1722199013-immms.jpg', 8, 'A sweet and comforting body spray with rich vanilla notes, perfect for a warm and cozy feeling.'),
(112, 'Herbal Calm', 27, 10, '180ml', 'images/1722199106-ss.jfif', 8, 'A calming blend of fresh herbs and light florals, perfect for a relaxing daily spritz.'),
(113, 'Leather Jacket', 120, 20, '1kg', 'images/1722199336-ggg.jpg', 3, 'A classic leather jacket with a modern fit, providing both style and warmth.'),
(114, 'Formal Blazer', 100, 15, ' 700g', 'images/1722199430-blazer.jfif', 3, 'A tailored blazer that adds a touch of sophistication to any outfit, ideal for professional settings'),
(115, 'Cotton Polo Shirt', 35, 10, '250g', 'images/1722199510-shirt.jfif', 3, ' A comfortable and breathable polo shirt, perfect for casual and sporty looks.'),
(116, 'Denim Jacket', 90, 18, '800g', 'images/1722199611-aaa8.jpg', 3, 'A versatile denim jacket with a classic design, suitable for layering in all seasons. 10. Athletic Shorts'),
(117, 'Cargo Pants', 55, 10, '500g', 'images/1722199690-cargo.jfif', 3, ' Durable cargo pants with multiple pockets, offering a practical and stylish option for outdoor activities.'),
(118, 'Puffer Jacket', 120, 25, '1.2kg', 'images/1722199822-ssssssssss.jfif', 3, 'A warm and lightweight puffer jacket with a water-resistant exterior, perfect for winter.'),
(119, 'Blush', 24, 15, '6g', 'images/1722793624-blush.jpg', 6, ' A finely milled blush that adds a natural flush of color to the cheeks with a silky, blendable formula.'),
(120, 'Eyeliner', 15, 5, '1.2g', 'images/1722793822-eyeliner3.jpg', 6, 'A waterproof, long-lasting eyeliner pencil that glides on smoothly and stays put all day.'),
(121, 'Velvet Rose', 70, 10, '50ml', 'images/1722795021-rose.jfif', 7, 'A luxurious fragrance combining deep rose and musk notes, offering a sophisticated allure.');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `mobile` bigint NOT NULL,
  `address1` varchar(50) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(10) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `name`, `mobile`, `address1`, `gender`, `username`, `password`) VALUES
(6, 'cyn', 3400405, 'beirut', '', 'hsen', '12345a'),
(7, 'karim', 71368467, 'beriut', '', 'karimzaynoun', '123456'),
(8, 'waelarakji', 3500609, 'beirut', '', 'warakji', '123456789'),
(9, 'lara', 71356382, 'beirut', '', 'lara1', '1234abc');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ord`
--
ALTER TABLE `ord`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_id` FOREIGN KEY (`oid`) REFERENCES `ord` (`oid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`oid`) REFERENCES `ord` (`oid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
