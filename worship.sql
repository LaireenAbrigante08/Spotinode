-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2024 at 05:00 PM
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
-- Database: `worship`
--

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE `songs` (
  `id` int(11) NOT NULL,
  `song_name` varchar(255) NOT NULL,
  `artist_name` varchar(255) NOT NULL,
  `song_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`id`, `song_name`, `artist_name`, `song_path`) VALUES
(1, 'Tribes', 'Victory Worship', '/uploads/song-1727355454313.mp3'),
(2, 'El Shaddai ', 'Olchestra Version', '/uploads/song-1727358250863.mp3'),
(3, 'Praise', 'Elevation', '/uploads/song-1727358294184.mp3'),
(4, 'What A Beautiful Name', 'Hillsong Worship', '/uploads/song-1727358381157.mp3'),
(5, 'Oceans', 'Hillsong United', '/uploads/song-1727358429976.mp3'),
(6, '10,000 Reasons', 'Lifeway Worship', '/uploads/song-1727358479512.mp3'),
(7, 'Way Maker', 'Lifeway Worship', '/uploads/song-1727359274550.mp3'),
(8, 'Here I Am', 'Lifeway Worship', '/uploads/song-1727360927520.mp4'),
(9, 'Still', 'Hillsong Worship', '/uploads/song-1727361303466.mp4'),
(10, 'I Surrender', 'Hillsong United', '/uploads/song-1727361345871.mp4'),
(11, 'Goodness of God', 'Cece Winans', '/uploads/song-1727361426779.mp4');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `songs`
--
ALTER TABLE `songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
