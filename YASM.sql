-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 27, 2023 at 03:54 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `YASM`
--

-- --------------------------------------------------------

--
-- Table structure for table `Blogs`
--

CREATE TABLE `Blogs` (
  `id` varchar(36) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Choices`
--

CREATE TABLE `Choices` (
  `id` varchar(36) NOT NULL,
  `pollId` varchar(36) NOT NULL,
  `content` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Choices`
--

INSERT INTO `Choices` (`id`, `pollId`, `content`) VALUES
('5a10a894-3584-466f-bbe1-90f2c8b06e75', '4b15a9df-6985-4d6e-9e5e-503b3602a499', 'Orange'),
('789ad141-3557-4ec2-bafc-8a7ea1045604', '4b15a9df-6985-4d6e-9e5e-503b3602a499', 'Red'),
('d27c29e4-f3b6-414b-bf34-eebe20688e2e', '4b15a9df-6985-4d6e-9e5e-503b3602a499', 'Blue'),
('f1f746c9-daec-43b4-8f3b-59ff50d574df', '4b15a9df-6985-4d6e-9e5e-503b3602a499', 'Green');

-- --------------------------------------------------------

--
-- Table structure for table `CommentReactions`
--

CREATE TABLE `CommentReactions` (
  `id` varchar(36) NOT NULL,
  `commentId` varchar(36) NOT NULL,
  `userId` varchar(36) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Comments`
--

CREATE TABLE `Comments` (
  `id` varchar(36) NOT NULL,
  `userId` varchar(36) NOT NULL,
  `postId` varchar(36) NOT NULL,
  `content` text NOT NULL,
  `commentedAt` datetime NOT NULL DEFAULT current_timestamp(),
  `score` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Comments`
--

INSERT INTO `Comments` (`id`, `userId`, `postId`, `content`, `commentedAt`, `score`) VALUES
('ba249441-a8ae-47df-9159-ff2b472439df', 'f3e78a2c-8e6b-4bdf-80d9-aff7f39cbbaf', '4b15a9df-6985-4d6e-9e5e-503b3602a499', 'hI', '2023-02-27 09:38:14', 0);

-- --------------------------------------------------------

--
-- Table structure for table `FriendRequest`
--

CREATE TABLE `FriendRequest` (
  `id` varchar(36) NOT NULL,
  `fromId` varchar(36) NOT NULL,
  `toId` varchar(36) NOT NULL,
  `status` varchar(255) NOT NULL,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `FriendRequest`
--

INSERT INTO `FriendRequest` (`id`, `fromId`, `toId`, `status`, `datetime`) VALUES
('6084e594-7ba0-4b7b-a05b-474436f73e7a', '15df80d6-ce33-46a4-92a2-f0d23e1925e9', 'f3e78a2c-8e6b-4bdf-80d9-aff7f39cbbaf', 'WAITING', '2023-02-27 09:36:17');

-- --------------------------------------------------------

--
-- Table structure for table `Notification`
--

CREATE TABLE `Notification` (
  `NId` varchar(36) NOT NULL,
  `receiverId` varchar(36) NOT NULL,
  `fromId` varchar(36) NOT NULL,
  `type` varchar(50) NOT NULL,
  `postId` varchar(36) DEFAULT NULL,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Notification`
--

INSERT INTO `Notification` (`NId`, `receiverId`, `fromId`, `type`, `postId`, `datetime`) VALUES
('429f7f32-845d-46fe-a19d-904ffbf96ae1', '15df80d6-ce33-46a4-92a2-f0d23e1925e9', 'f3e78a2c-8e6b-4bdf-80d9-aff7f39cbbaf', 'COMMENTED_POST', '4b15a9df-6985-4d6e-9e5e-503b3602a499', '2023-02-27 09:38:14'),
('e74f572c-baf9-4239-8e66-a23394f69dc6', 'f3e78a2c-8e6b-4bdf-80d9-aff7f39cbbaf', '15df80d6-ce33-46a4-92a2-f0d23e1925e9', 'SENT_REQUEST', NULL, '2023-02-27 09:36:17');

-- --------------------------------------------------------

--
-- Table structure for table `Polls`
--

CREATE TABLE `Polls` (
  `id` varchar(36) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Polls`
--

INSERT INTO `Polls` (`id`, `title`) VALUES
('4b15a9df-6985-4d6e-9e5e-503b3602a499', 'choose Your Favourite color	');

-- --------------------------------------------------------

--
-- Table structure for table `Posts`
--

CREATE TABLE `Posts` (
  `id` varchar(36) NOT NULL,
  `userId` varchar(36) NOT NULL,
  `postedAt` datetime NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Posts`
--

INSERT INTO `Posts` (`id`, `userId`, `postedAt`, `type`) VALUES
('43e72b4c-08c0-405c-b209-ecf5776acd71', '15df80d6-ce33-46a4-92a2-f0d23e1925e9', '2023-02-27 09:29:01', 'STORY'),
('4b15a9df-6985-4d6e-9e5e-503b3602a499', '15df80d6-ce33-46a4-92a2-f0d23e1925e9', '2023-02-27 09:29:50', 'POLL');

-- --------------------------------------------------------

--
-- Table structure for table `Reactions`
--

CREATE TABLE `Reactions` (
  `id` varchar(36) NOT NULL,
  `postId` varchar(36) NOT NULL,
  `userId` varchar(36) NOT NULL,
  `datetime` datetime NOT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Stories`
--

CREATE TABLE `Stories` (
  `id` varchar(36) NOT NULL,
  `photoUrl` varchar(255) NOT NULL,
  `caption` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Stories`
--

INSERT INTO `Stories` (`id`, `photoUrl`, `caption`) VALUES
('43e72b4c-08c0-405c-b209-ecf5776acd71', '1677479341227.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `id` varchar(36) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `securityQuestion` varchar(100) NOT NULL,
  `securityAnswer` varchar(100) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `profileUrl` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`id`, `firstName`, `lastName`, `email`, `password`, `securityQuestion`, `securityAnswer`, `gender`, `profileUrl`) VALUES
('15df80d6-ce33-46a4-92a2-f0d23e1925e9', 'Ephrem', 'Getachew', 'ephywaanofii@gmail.com', '1234567', 'What is your favorite color?', 'blue', NULL, '15df80d6-ce33-46a4-92a2-f0d23e1925e9--1677479804036.jpg'),
('f3e78a2c-8e6b-4bdf-80d9-aff7f39cbbaf', 'Naol', 'Chala', 'naolchala6@gmail.com', '111111', 'What is your hometown?', 'Addis Alem', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Votes`
--

CREATE TABLE `Votes` (
  `id` varchar(36) NOT NULL,
  `pollId` varchar(36) NOT NULL,
  `userId` varchar(36) NOT NULL,
  `choiceId` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Votes`
--

INSERT INTO `Votes` (`id`, `pollId`, `userId`, `choiceId`) VALUES
('a8627c2a-c6e9-4a7f-9b31-71bdafa8a74f', '4b15a9df-6985-4d6e-9e5e-503b3602a499', '15df80d6-ce33-46a4-92a2-f0d23e1925e9', 'd27c29e4-f3b6-414b-bf34-eebe20688e2e');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Blogs`
--
ALTER TABLE `Blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Choices`
--
ALTER TABLE `Choices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poll_choice` (`pollId`);

--
-- Indexes for table `CommentReactions`
--
ALTER TABLE `CommentReactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commentreaction_user` (`userId`),
  ADD KEY `comment_reaction_comment` (`commentId`);

--
-- Indexes for table `Comments`
--
ALTER TABLE `Comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_post` (`postId`),
  ADD KEY `user_comment` (`userId`);

--
-- Indexes for table `FriendRequest`
--
ALTER TABLE `FriendRequest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender` (`fromId`),
  ADD KEY `receiver` (`toId`);

--
-- Indexes for table `Notification`
--
ALTER TABLE `Notification`
  ADD PRIMARY KEY (`NId`),
  ADD KEY `from_notification` (`fromId`),
  ADD KEY `to_notification` (`receiverId`);

--
-- Indexes for table `Polls`
--
ALTER TABLE `Polls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Posts`
--
ALTER TABLE `Posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_added` (`userId`);

--
-- Indexes for table `Reactions`
--
ALTER TABLE `Reactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `like_post` (`postId`),
  ADD KEY `like_user` (`userId`);

--
-- Indexes for table `Stories`
--
ALTER TABLE `Stories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `Votes`
--
ALTER TABLE `Votes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poll_vote` (`pollId`),
  ADD KEY `vote_user` (`userId`),
  ADD KEY `vote_choice` (`choiceId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Blogs`
--
ALTER TABLE `Blogs`
  ADD CONSTRAINT `post_blog` FOREIGN KEY (`id`) REFERENCES `Posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Choices`
--
ALTER TABLE `Choices`
  ADD CONSTRAINT `poll_choice` FOREIGN KEY (`pollId`) REFERENCES `Polls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `CommentReactions`
--
ALTER TABLE `CommentReactions`
  ADD CONSTRAINT `comment_reaction_comment` FOREIGN KEY (`commentId`) REFERENCES `Comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `commentreaction_user` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Comments`
--
ALTER TABLE `Comments`
  ADD CONSTRAINT `comment_post` FOREIGN KEY (`postId`) REFERENCES `Posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_comment` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `FriendRequest`
--
ALTER TABLE `FriendRequest`
  ADD CONSTRAINT `receiver` FOREIGN KEY (`toId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sender` FOREIGN KEY (`fromId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Notification`
--
ALTER TABLE `Notification`
  ADD CONSTRAINT `from_notification` FOREIGN KEY (`fromId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `to_notification` FOREIGN KEY (`receiverId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Polls`
--
ALTER TABLE `Polls`
  ADD CONSTRAINT `post_poll` FOREIGN KEY (`id`) REFERENCES `Posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Posts`
--
ALTER TABLE `Posts`
  ADD CONSTRAINT `post_added` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Reactions`
--
ALTER TABLE `Reactions`
  ADD CONSTRAINT `like_post` FOREIGN KEY (`postId`) REFERENCES `Posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `like_user` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Stories`
--
ALTER TABLE `Stories`
  ADD CONSTRAINT `post_story` FOREIGN KEY (`id`) REFERENCES `Posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Votes`
--
ALTER TABLE `Votes`
  ADD CONSTRAINT `poll_vote` FOREIGN KEY (`pollId`) REFERENCES `Polls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vote_choice` FOREIGN KEY (`choiceId`) REFERENCES `Choices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vote_user` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
