-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Mar 27, 2022 at 04:29 PM
-- Server version: 5.7.34
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `oop_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `account_id` int(11) NOT NULL,
  `account_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `account_authorized_name_surname` varchar(100) NOT NULL,
  `account_company` varchar(100) NOT NULL,
  `account_email` varchar(50) NOT NULL,
  `account_phone` varchar(50) NOT NULL,
  `account_tax_office` varchar(50) NOT NULL,
  `account_tax_number` varchar(50) NOT NULL,
  `account_iban` varchar(50) NOT NULL,
  `account_adress` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_id`, `account_date`, `account_authorized_name_surname`, `account_company`, `account_email`, `account_phone`, `account_tax_office`, `account_tax_number`, `account_iban`, `account_adress`) VALUES
(5, '2019-05-18 21:21:58', 'Emrah Yüksel', 'NEGBİL BİLGİSAYAR YAZILIM VE EĞİTİM HİZMETLERİ', 'info@edukey.com.tr', '08508408076', 'Büyükçekmece', '00000000000', 'TR12345649879798798', 'Çatalca / İstanbul'),
(6, '2019-05-18 21:22:28', 'Ahmet Uzerl', 'MASKOM', 'ahmet@ahmet.com', '+1 (743) 995-5991', 'Enim Nam maiores deb', '723', 'Saepe amet voluptat', 'Non reprehenderit c'),
(7, '2019-05-18 22:59:46', 'Reynolds', 'Key Sweet Inc', 'fuvofi@mailinator.com', '+1 (251) 968-1363', 'Fugit culpa dolore ', '922', 'In ipsam ullamco cul', 'Occaecat incididunt '),
(8, '2022-03-27 17:52:02', 'deneme', 'deneme', 'deneme@gmail.com', '555555', 'daire', '1234555', '123123123123', 'asdasdasd');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admins_id` int(11) NOT NULL,
  `admins_namesurname` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `admins_file` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `admins_username` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `admins_pass` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `admins_status` enum('0','1') COLLATE utf8_turkish_ci NOT NULL,
  `admins_must` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admins_id`, `admins_namesurname`, `admins_file`, `admins_username`, `admins_pass`, `admins_status`, `admins_must`) VALUES
(9, 'Feyzullah Demir', '62407759cbd46.png', 'admin', '21232f297a57a5a743894a0e4a801fc3', '1', 0),
(10, 'Ahmet Şen', '5cd47475bf42a.png', 'ahmet', '81dc9bdb52d04dc20036dbd8313ed055', '1', 2),
(11, 'Elif Şengül', '5cd47485d626f.png', 'elif', 'e10adc3949ba59abbe56e057f20f883e', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `operation`
--

CREATE TABLE `operation` (
  `operation_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `operation_date` date NOT NULL,
  `operation_type` enum('Gelir','Gider') NOT NULL,
  `operation_price` float(9,2) NOT NULL,
  `operation_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `operation`
--

INSERT INTO `operation` (`operation_id`, `account_id`, `products_id`, `operation_date`, `operation_type`, `operation_price`, `operation_description`) VALUES
(8, 5, 1, '2019-05-19', 'Gelir', 500.00, '1.Taksit'),
(9, 5, 1, '2019-05-19', 'Gider', 300.00, 'Domain ve Sunucu Masrafı'),
(10, 5, 1, '2019-05-19', 'Gelir', 1000.00, ''),
(11, 5, 1, '2019-05-18', 'Gelir', 200.00, ''),
(12, 6, 3, '2022-03-16', 'Gelir', 656.00, ''),
(13, 6, 3, '2022-03-24', 'Gider', 444.00, ''),
(14, 8, 1, '2022-03-27', 'Gelir', 543.00, ''),
(15, 8, 3, '2022-03-27', 'Gider', 240.00, ''),
(16, 8, 4, '2022-03-27', 'Gelir', 150.00, '');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `products_id` int(11) NOT NULL,
  `products_title` varchar(255) NOT NULL,
  `products_content` text NOT NULL,
  `products_price` float(9,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`products_id`, `products_title`, `products_content`, `products_price`) VALUES
(1, 'Kurumsal İnternet Sitesi', '<p>Kurumsal İnternet Sitesi Detay</p>\r\n', 2500.00),
(3, 'PHP KURS', '', 250.00),
(4, 'web sitesi 1', '', 285.00);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sales_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `sales_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sales_id`, `account_id`, `products_id`, `sales_date`) VALUES
(3, 5, 1, '2019-05-18 22:01:01'),
(4, 6, 1, '2019-05-18 22:11:52'),
(5, 5, 3, '2019-05-19 13:19:16'),
(6, 6, 3, '2022-03-27 17:51:28'),
(7, 8, 3, '2022-03-27 17:52:22'),
(8, 8, 4, '2022-03-27 18:10:21');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `settings_id` int(11) NOT NULL,
  `settings_description` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `settings_key` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `settings_value` text COLLATE utf8_turkish_ci NOT NULL,
  `settings_type` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `settings_must` int(3) NOT NULL,
  `settings_delete` enum('0','1') COLLATE utf8_turkish_ci NOT NULL,
  `settings_status` enum('0','1') COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`settings_id`, `settings_description`, `settings_key`, `settings_value`, `settings_type`, `settings_must`, `settings_delete`, `settings_status`) VALUES
(1, 'Site Başlığı', 'title', ' Yazılım CMS Yönetim Paneli', 'text', 0, '0', '1'),
(2, 'Site Açıklama', 'description', 'CMS Açıklama Güncelleme', 'text', 1, '0', '1'),
(3, 'Site Logo', 'logo', '5cd5728b06b8b.png', 'file', 2, '0', '1'),
(4, 'Fav Icon', 'icon', '62407767817e2.png', 'file', 4, '0', '1'),
(5, 'Anahtar Kelimeler', 'keywords', 'yazilim, cms, ', 'text', 5, '0', '1'),
(6, 'Telefon Numarası', 'phone', '0850000000', 'text', 10, '0', '1'),
(7, 'Mail Adresi', 'email', 'feyzullahdemir179@gmail.com', 'text', 11, '0', '1'),
(9, 'İl', 'il', 'İstanbul', 'text', 12, '0', '1'),
(10, 'Açık Adres', 'adres', '<p>Buraya a&ccedil;ık adres detaylı gelecek. <strong>G&uuml;ncelleme</strong></p>\r\n', 'ckeditor', 13, '0', '1'),
(11, 'Facebook Hesabı', 'facebook', 'www.facebook.çom/', 'text', 14, '0', '1'),
(12, 'Çalışma Saatleri', 'work_hours', 'Hafta içi 09:00 - 17:00', 'text', 15, '0', '1'),
(17, 'Twitter Hesabı', 'twitter', 'www.twitter.çom', 'text', 16, '0', '1'),
(18, 'Site Sahibi', 'author', 'Feyzullah', 'text', 6, '0', '1'),
(19, 'Copyright', 'copyright', 'Copyright ©  2022', 'text', 7, '0', '1'),
(20, 'Slogan', 'slogan', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, expedita, saepe, vero rerum deleniti beatae veniam harum neque nemo praesentium cum alias asperiores commodi.', 'text', 8, '0', '1'),
(21, 'Slogan Linki', 'slogan_url', 'https://www.webydu.com', 'text', 9, '0', '1'),
(22, 'Site Logo Text', 'logo_text', ' YAZILIM', 'text', 3, '0', '1'),
(23, 'Anasayfa Reklam Alanı İçerik', 'home_01_content', '<h2><strong>Modern Business Features</strong></h2>\r\n\r\n<p>The Modern Business template by Start Bootstrap includes:</p>\r\n\r\n<ul>\r\n	<li><strong>Bootstrap v4</strong></li>\r\n	<li>jQuery</li>\r\n	<li>Font Awesome</li>\r\n	<li>Working contact form with validation</li>\r\n	<li>Unstyled page elements for easy customization</li>\r\n</ul>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis, omnis doloremque non cum id reprehenderit, quisquam totam aspernatur tempora minima unde aliquid ea culpa sunt. Reiciendis quia dolorum ducimus unde.</p>\r\n', 'ckeditor', 18, '0', '1'),
(24, 'Anasayfa Reklam Alanı Görsel', 'home_01_file', '5cd57210754dc.png', 'file', 17, '0', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admins_id`);

--
-- Indexes for table `operation`
--
ALTER TABLE `operation`
  ADD PRIMARY KEY (`operation_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`products_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sales_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`settings_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admins_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `operation`
--
ALTER TABLE `operation`
  MODIFY `operation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `products_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sales_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `settings_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
