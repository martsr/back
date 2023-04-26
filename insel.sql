-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 23, 2023 at 10:01 PM
-- Server version: 5.7.39
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `insel`
--

-- --------------------------------------------------------

--
-- Table structure for table `exhibitions`
--

CREATE TABLE `exhibitions` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `subtitle` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exhibitions`
--

INSERT INTO `exhibitions` (`id`, `title`, `subtitle`, `description`) VALUES
(1, 'Philip Guston Now', 'March 2 – August 27, 2023', 'Philip Guston Now charts the 50-year career of one of America’s most influential modern artists through more than 150 paintings and drawings. Guston’s story is one of epic change—of artistic styles, from muralism to abstract expressionism to figuration, of degrees of political and social involvement, and of levels of personal confession in his work. Renowned in his time and in ours, Guston’s work continues to resonate, attract, and provoke, raising crucial questions about the relationship of art to beauty and brutality, freedom and doubt, politics and the imagination.'),
(2, 'This Is Britain: Photographs from the 1970s and 1980s', 'January 29 – June 11, 2023 ', 'Britain experienced profound changes in the 1970s and 1980s, when it was racked by deindustrialization, urban uprisings, the controversial policies of Prime Minister Margaret Thatcher, and the Troubles in Northern Ireland. Photography became a central form of creative expression during this period, supported and disseminated through new schools, galleries, artists’ collectives, magazines, and government funding.\r\n\r\nThis Is Britain brings together the work of a generation of photographers who were commenting on the deep unrest of these pivotal decades. Vanley Burke, Pogus Caesar, Anna Fox, Paul Graham, Sunil Gupta, Chris Killip, Sirkka-Liisa Konttinen, Martin Parr, and others pictured communities, traditions, and landscapes affected by Britain’s shifting social and economic realities. Together, they photographed a nation redefining what it meant to be British and, ultimately, modern.'),
(4, 'Test2', 'Test2', 'Test2');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id_message` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `answer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id_message`, `name`, `email`, `message`, `answer`) VALUES
(1, 'test1', 'test1', 'test1', ''),
(2, 'test2', 'test2', 'test2', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user`, `password`) VALUES
(1, 'martina', 'a32afbe54e4fbab0c8c44c01f5b90792'),
(2, 'test', '098f6bcd4621d373cade4e832627b4f6');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `exhibitions`
--
ALTER TABLE `exhibitions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id_message`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `exhibitions`
--
ALTER TABLE `exhibitions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id_message` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
