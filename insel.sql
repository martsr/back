-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 12, 2023 at 08:48 PM
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
  `description` text NOT NULL,
  `img_id` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exhibitions`
--

INSERT INTO `exhibitions` (`id`, `title`, `subtitle`, `description`, `img_id`) VALUES
(4, 'Exspiravit - Decorum', 'From May 15th to June 30th', 'Lorem ipsum dolor sit amet consectetur adipisicing elit.\r\n        //         Exercitationem minima corporis aperiam velit iste. Eligendi,\r\n        //         assumenda minima? Corporis quisquam aspernatur animi porro totam\r\n        //         magni! Saepe voluptates quidem consectetur! Enim, accusamus.', 'qcllszy4l4bxc7kcnotq'),
(5, 'Exspiravit - Decorum', 'From May 15th to June 30th', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. // Exercitationem minima corporis aperiam velit iste. Eligendi, // assumenda minima? Corporis quisquam aspernatur animi porro totam // magni! Saepe voluptates quidem consectetur! Enim, accusamus.', 'jf3fvyz8ch16rfovvkpb'),
(6, 'Cobalt Peak', 'July 22 to August 30', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. // Exercitationem minima corporis aperiam velit iste. Eligendi, // assumenda minima? Corporis quisquam aspernatur animi porro totam // magni! Saepe voluptates quidem consectetur! Enim, accusamus.', 'iaostfvxpmcqusbz2yed'),
(7, 'Thinking in Colour - Philip Guston', 'From February 6th to March 24th', 'Lorem ipsum dolor sit amet consectetur adipisicing elit.\\r\\n        //         Exercitationem minima corporis aperiam velit iste. Eligendi,\\r\\n        //         assumenda minima? Corporis quisquam aspernatur animi porro totam\\r\\n        //         magni! Saepe voluptates quidem consectetur! Enim, accusamus.', 'd1cyxtkspg4z04xyy46w');

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
(1, 'test1', 'test1', 'test1', 'respuesta 2');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id_message` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
