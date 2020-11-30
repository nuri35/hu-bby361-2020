-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 30 Kas 2020, 13:17:56
-- Sunucu sürümü: 10.4.14-MariaDB
-- PHP Sürümü: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `NurettınSen_02`
--
CREATE DATABASE IF NOT EXISTS `NurettınSen_02` DEFAULT CHARACTER SET utf8 COLLATE utf8_turkish_ci;
USE `NurettınSen_02`;

-- --------------------------------------------------------

--
-- Görünüm yapısı durumu `genellıste`
-- (Asıl görünüm için aşağıya bakın)
--
CREATE TABLE `genellıste` (
`eserAdı` varchar(100)
,`yeadı` varchar(50)
,`basTar` year(4)
,`yekaytar` timestamp
,`yaAdı` varchar(30)
,`yaDogYıl` year(4)
);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kıtap`
--

CREATE TABLE `kıtap` (
  `kıtapNo` smallint(11) NOT NULL,
  `ISBN` char(13) COLLATE utf8_turkish_ci NOT NULL,
  `BasTar` year(4) NOT NULL,
  `EserAdı` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `kıtapkaytar` timestamp NOT NULL DEFAULT current_timestamp(),
  `yeno` smallint(6) NOT NULL,
  `yaNo` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kıtap`
--

INSERT INTO `kıtap` (`kıtapNo`, `ISBN`, `BasTar`, `EserAdı`, `kıtapkaytar`, `yeno`, `yaNo`) VALUES
(1, '1234567891111', 2020, 'Göl çiçekleri', '2020-10-31 17:12:50', 2, 3),
(2, '9789750714719', 2020, ' Kırmızı bisiklet', '2020-10-31 17:12:50', 2, 3),
(3, '0123456789115', 2002, 'Planning for cycling : principles, practice, and solutions for urban planners', '2020-10-31 17:17:56', 1, 2),
(4, '2313211323217', 2000, 'hanimelli', '2020-10-31 17:19:44', 3, 4),
(5, '9781585673346', 2002, 'Atatürk', '2020-11-03 18:54:02', 4, 1),
(6, '7781595673346', 2005, 'Otopsi : roman', '2020-11-03 18:54:02', 1, 4),
(7, '1232467891111', 1995, 'Roman', '2020-11-03 18:59:32', 2, 4),
(8, '9789750714721', 2005, 'Roman religion', '2020-11-03 18:59:32', 3, 4),
(9, '2353211323218', 2020, 'Roman Signer', '2020-11-03 19:03:52', 3, 2),
(10, '2134355465742', 1999, 'Bilirbilmezler  roman', '2020-11-03 19:03:52', 4, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yayınevı`
--

CREATE TABLE `yayınevı` (
  `yeno` smallint(11) NOT NULL,
  `yekaytar` timestamp NOT NULL DEFAULT current_timestamp(),
  `yeadı` varchar(50) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `yayınevı`
--

INSERT INTO `yayınevı` (`yeno`, `yekaytar`, `yeadı`) VALUES
(1, '2020-10-31 17:28:05', 'kitap yayınevi'),
(2, '2020-10-31 17:28:05', 'bılım yayınevı'),
(3, '2020-10-31 17:31:24', 'doğa yayınevi'),
(4, '2020-10-31 17:31:24', 'doluşum yayınevi');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yazar`
--

CREATE TABLE `yazar` (
  `yaNo` smallint(11) NOT NULL,
  `yaAdı` varchar(30) COLLATE utf8_turkish_ci NOT NULL,
  `yaDogYıl` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `yazar`
--

INSERT INTO `yazar` (`yaNo`, `yaAdı`, `yaDogYıl`) VALUES
(1, 'Kemel otoman', 1975),
(2, 'doşuş atasoy', 1995),
(3, 'Adalettin odacık', 2001),
(4, 'Nurettin Şen', 2005);

-- --------------------------------------------------------

--
-- Görünüm yapısı `genellıste`
--
DROP TABLE IF EXISTS `genellıste`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `genellıste`  AS  select `kıtap`.`EserAdı` AS `eserAdı`,`yayınevı`.`yeadı` AS `yeadı`,`kıtap`.`BasTar` AS `basTar`,`yayınevı`.`yekaytar` AS `yekaytar`,`yazar`.`yaAdı` AS `yaAdı`,`yazar`.`yaDogYıl` AS `yaDogYıl` from ((`kıtap` join `yayınevı`) join `yazar`) where `kıtap`.`yeno` = `yayınevı`.`yeno` and `yazar`.`yaNo` = `kıtap`.`yaNo` ;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `kıtap`
--
ALTER TABLE `kıtap`
  ADD PRIMARY KEY (`kıtapNo`),
  ADD UNIQUE KEY `ISBN` (`ISBN`);

--
-- Tablo için indeksler `yayınevı`
--
ALTER TABLE `yayınevı`
  ADD PRIMARY KEY (`yeno`),
  ADD UNIQUE KEY `yeadı` (`yeadı`);

--
-- Tablo için indeksler `yazar`
--
ALTER TABLE `yazar`
  ADD PRIMARY KEY (`yaNo`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `kıtap`
--
ALTER TABLE `kıtap`
  MODIFY `kıtapNo` smallint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Tablo için AUTO_INCREMENT değeri `yayınevı`
--
ALTER TABLE `yayınevı`
  MODIFY `yeno` smallint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `yazar`
--
ALTER TABLE `yazar`
  MODIFY `yaNo` smallint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
