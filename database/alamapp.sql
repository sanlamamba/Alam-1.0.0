-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 05 fév. 2023 à 15:01
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `alamapp`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
('1e6ad2ce-497d-4dbc-9325-0209a5ad541d', 'Design', 'design', '2022-08-16 06:41:35', '2022-08-16 06:41:35'),
('3b0eebe9-c3a9-4250-be93-40b58ee1d40c', 'Health & Fitness', 'health-fitness', '2022-08-16 06:42:28', '2022-08-16 06:42:28'),
('6387f943-49ac-48c9-b270-afda93feb165', 'Lifestyle', 'lifestyle', '2022-08-16 06:41:59', '2022-08-16 06:41:59'),
('6fe00827-7c90-48e9-bf3e-7e2591f97ec8', 'Office Productivity', 'office-productivity', '2022-08-16 06:40:53', '2022-08-16 06:40:53'),
('7049c68c-584e-4934-807f-2bf17f3fabfe', 'Photography & Video', 'photography-video', '2022-08-16 06:42:13', '2022-08-16 06:42:13'),
('763283f5-3076-4b06-acba-e33d1f2a0db7', 'Development', 'development', '2022-08-16 06:39:49', '2022-08-16 06:39:49'),
('8955ae82-ba74-4435-8ff5-e52f76594ece', 'Personal Development', 'personal-development', '2022-08-16 06:41:23', '2022-08-16 06:41:23'),
('92f8ccf1-384e-4c27-b429-a1bce510a1cc', 'Music', 'music-383', '2022-08-23 06:15:16', '2022-09-04 05:05:20'),
('9757989d-24a0-42b7-ab56-11673f671800', 'Marketing', 'marketing', '2022-08-16 06:41:46', '2022-08-16 06:41:46'),
('9ae93b15-0ec2-4b42-ab02-337d0e91eaa0', 'Teaching & Academics', 'teaching-academics', '2022-08-16 06:42:55', '2022-08-16 06:42:55'),
('aca10dcc-c359-4b8d-acaf-d016898d65fa', 'Finance & Accounting', 'finance-accounting', '2022-08-16 06:40:16', '2022-08-16 06:40:16'),
('c54a81fe-9947-4ede-80f7-5b924bb1fa20', 'Business', 'business', '2022-08-16 06:40:03', '2022-08-16 06:40:03'),
('e532600c-8db4-41bd-8eb4-36b5cf67fc49', 'IT & Software', 'it-software', '2022-08-16 06:40:39', '2022-08-16 06:40:39');

-- --------------------------------------------------------

--
-- Structure de la table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
CREATE TABLE IF NOT EXISTS `coupons` (
  `id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `exp_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `deleted_at` datetime DEFAULT NULL,
  `active_for_full_site` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `discount`, `exp_date`, `status`, `deleted_at`, `active_for_full_site`, `created_at`, `updated_at`) VALUES
('9ca65199-89a3-450f-8661-3478318ec696', 'DFFD54', 50, NULL, 1, NULL, 1, '2022-09-26 06:09:49', '2022-09-26 08:42:55');

-- --------------------------------------------------------

--
-- Structure de la table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `short_desc` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `overview` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `latest_price` float DEFAULT NULL,
  `before_price` float DEFAULT NULL,
  `lessons` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `duration` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `access_time` enum('Lifetime','Three Months','Six Months','1 Year') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'Lifetime',
  `requirements` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `what_you_will_learn` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `who_is_this_course_for` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `userId` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `catId` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `approved` tinyint(1) DEFAULT '0',
  `in_home_page` tinyint(1) DEFAULT '0',
  `in_home_page_set_at` datetime DEFAULT NULL,
  `is_class` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `userId` (`userId`),
  KEY `catId` (`catId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `courses`
--

INSERT INTO `courses` (`id`, `title`, `slug`, `short_desc`, `overview`, `latest_price`, `before_price`, `lessons`, `duration`, `image`, `access_time`, `requirements`, `what_you_will_learn`, `who_is_this_course_for`, `userId`, `catId`, `approved`, `in_home_page`, `in_home_page_set_at`, `is_class`, `created_at`, `updated_at`) VALUES
('130bcd58-0650-4efe-a401-dc949373c699', 'Linux Administration Bootcamp: Go from Beginner to Advanced', 'linux-administration-bootcamp-go-from-beginner-to-advanced', 'Hello. My name is Admin Cannon and I\'m the author of Linux for Beginners, the founder of the Linux Training Academy, and an instructor to thousands of satisfied students. I started my IT career in the late 1990\'s as a Unix and Linux Systems Engineer and I\'ll be sharing my real-world Linux experience with you throughout this course.', '<p>By the end of this course you will fully understand the most important and fundamental concepts of Linux server administration. More importantly, you will be able to put those concepts to use in practical real-world situations. You\'ll be able to configure, maintain, and support a variety of Linux systems. You can even use the skills you learned to become a Linux System Engineer or Linux System Administrator.</p><p><br></p><p><strong>Free Bonus&nbsp;- Video Demonstrations from my best-selling book, C<em>ommand Line Kung-Fu</em>.</strong></p><p>In this series of videos I\'ll be sharing with you some of my favorite Linux command line tricks. These tips will make your life easier at the command line, speed up your work flow, and make you feel like a certified Linux command line Ninja! If you want to see the pages of&nbsp;<em>Command Line Kung-Fu&nbsp;</em>come to life, then you have to watch these videos!</p>', 9.99, 84.99, '76', '9h total length', 'https://res.cloudinary.com/dev-empty/image/upload/v1661246066/r56386ipf0e55vcjtg3d.jpg', '1 Year', '<ul><li>A desire to learn.</li></ul>', '<ul><li>By the end of this course you will understand the fundamentals of the Linux operating system and be able to apply that knowledge in a practical and useful manner.</li></ul>', '<ul><li>People with limited time.</li><li>Anyone with a desire to learn about Linux.</li><li>People that have Linux experience, but would like to learn about the Linux command line interface.</li><li>Existing Linux users that want to become power users.</li><li>People that need Linux knowledge for a personal or business project like hosting a website on a Linux server.</li><li>Professionals that need to learn Linux to become more effective at work. Helpdesk staff, application support engineers, and application developers that are required to use the Linux operating system.</li><li>People thinking about a career as a Linux system administrator or engineer, but need the basics first.</li><li>Researchers, college professors, and college students that will be using Linux servers to conduct research or complete course work.</li></ul><p><br></p>', '89aeed13-5b6e-4e0d-84af-a24793a83cd7', 'e532600c-8db4-41bd-8eb4-36b5cf67fc49', 1, 1, NULL, 0, '2022-08-23 09:14:27', '2022-08-23 09:18:18'),
('142a183d-45f1-4447-9aad-64f736471988', 'AWS Certified Security Specialty 2022', 'aws-certified-security-specialty-2022', 'AWS Certified Security - Specialty certification is one of the widely recognized security certifications across the industry. With the number of security breaches increasing every year, there is a huge demand for individuals who understands the security side of things, specifically Cloud-based Infrastructures.', '<p>This course is specially designed for the aspirants who intend to give the AWS Certified Security Specialty 2022 certification as well for those who want to master the security side of AWS.</p><p>Throughout the course, we explore various Real World scenarios and look into why do website gets hacked, what could have been done to prevent it, and learn the best practices related to Security for your AWS environment.</p><p>Since this is a Specialty level certification, it is very important that the candidate has a prior hands-on experience in AWS, and this also acts as a pre-requisite to this certification. We do start our journey into the security side of things from scratch.</p><p>With tons of quizzes in order to prepare you for exams, Real-world scenarios, and great Support from our Instructor in-case of doubts, this course is all you need to master the Security side of AWS and gain the certification.</p><p>I look forward to seeing you join us in this exciting journey on&nbsp;AWS&nbsp;Security.</p>', 34.99, 100, '251', ' 28h 7m total length', 'https://res.cloudinary.com/dev-empty/image/upload/v1662283339/r1ysgphohxnzf1t5a4m0.jpg', 'Lifetime', '<ul><li>Basics of AWS</li><li>AWS Solutions Architect Associate or Equivalent Knowledge</li></ul>', '<ul><li>Will be prepared to give AWS Certified Security Specialty Exam</li><li>You will be able to Master the Security aspect of AWS</li><li>Gain deep insights about Enterprise-grade Security implementation.</li><li>Will be able to detect attacks and protect the AWS infrastructure from Hackers.</li></ul>', '<ul><li>Those interested in gaining the AWS Security Specialty Certification</li><li>Those who wants to gain deep security insights related to AWS</li></ul>', 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', 'e532600c-8db4-41bd-8eb4-36b5cf67fc49', 1, 1, NULL, 0, '2022-08-16 07:36:03', '2022-09-04 09:22:20'),
('308cdeb3-b61f-4fca-a139-9bb219282dd3', 'Complete workout : Complete Fitness Certification', 'complete-workout-complete-fitness-certification', 'Complete workout for Fitness, Weight loss, Weight gain, & Body Building ,Get Certification After completion!', '<p>Complete Workout&nbsp;For Weight Loss &amp; Muscle Building</p><p>In this course I will take you through the process of&nbsp;<strong>becoming a fitness expert step by step</strong>. You will learn everything you need to know about the fundamentals of good training programs and how to design your very own program for you or your clients.</p><p>I created this course for stay-at-home moms, college students, and anybody passionate about health and fitness who wants to create extra income or make a living doing what they love… fitness!</p><p><strong><em>Complete workout for Fitness, Weight loss, Weight gain, &amp; Body Building</em></strong></p><p>By the end of this course you will get Fitness Certification from Institute of Pakistan!</p><p>· Learn weight loss for real &amp; forever in A simple Manner</p><p>· How to lose weight very fast</p><p>· Improved fitness through exercise</p><p>· We will learn how we can contour our body shape</p>', 39.99, 50, '50', '3h 25m total length', 'https://res.cloudinary.com/dev-empty/image/upload/v1662268371/xbablxdvrkt03pfr4sfw.jpg', 'Lifetime', '<ul><li>Passion for fitness</li><li>Commitment to complete the course</li><li>Access To Gym and Gym Equipment</li><li>Comfortable clothes and shoes</li></ul>', '<ul><li>We will learn how to do correctly warm up</li><li>We will learn why warm up is important</li><li>Improved fitness through exercises</li><li>We will learn how we can contour our body shape</li></ul>', '<ul><li>This course are for those who want to live life with fitness</li><li>This course are for those who want to know about simple &amp; easy exercises</li><li>This course is for those who want to make a change in their lifestyle.</li><li>This course is for those who want to lose thigh or hip fat, belly fat, side or love handles</li></ul>', 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '3b0eebe9-c3a9-4250-be93-40b58ee1d40c', 1, 1, NULL, 0, '2022-08-24 06:16:08', '2022-09-04 05:12:51'),
('3118e959-37af-453b-889b-e3006446127a', 'The Complete Introduction To Accounting and Finance', 'the-complete-introduction-to-accounting-and-finance', 'I have been teaching on Udemy since 2011 (over 10 years) and have created 88 courses on Udemy with 100,000+ students!  I love teaching on online, and empowering students with knowledge in accounting, finance, entrepreneurship, Excel and other business topics. ', '<p><strong>Welcome Students,</strong></p><p><br></p><p>I have been teaching on Udemy since 2011 (over 10 years)&nbsp;and have created&nbsp;88&nbsp;courses on Udemy with 100,000+ students!&nbsp;I&nbsp;love teaching on online, and empowering students with knowledge in accounting, finance, entrepreneurship, Excel and other business topics.&nbsp;</p><p>In my day to day life, I work as a consulting CFO,&nbsp;Chief Financial Officer.&nbsp;Mainly I&nbsp;work with growth stage companies, helping them put in place all the best accounting practices, financial modelling, working with investors, and financial reporting and analysis.&nbsp;&nbsp;</p><p>I have worked as a CFO exclusively to growing companies for 10+&nbsp;years, bringing my past corporate experience, my passion for the entrepreneur community, and experience helping over 100+ startups succeed.</p><p><strong>Now let me take my knowledge and experience and teach you!</strong></p><p><strong>All courses come with lifetime access, friendly support if you get stuck&nbsp;and a&nbsp;30 day money-back&nbsp;guarantee&nbsp;so there\'s no risk to get started.</strong></p><p>See you in class.</p>', 17.99, 89.99, '79', '8h 37m total length', 'https://res.cloudinary.com/dev-empty/image/upload/v1660634620/dcqfowcf3z07sqgsud0e.jpg', 'Lifetime', '<ul><li>Desire to learn accounting &amp; finance</li><li><br></li><li>Access to Excel or other spreadsheet program</li><li><br></li><li>Passion to empower yourself with knowledge</li><li><br></li><li>Commitment to learning</li></ul><p><br></p>', '<ul><li>Learn From A Top Rated Instructor Who Has Been Teaching On Udemy Since 2013 and Taught Over 100,000 Students!</li><li><br></li><li>Understand Basic Accounting Concepts</li><li><br></li><li>Accounting Terminology</li><li><br></li><li>Accounting Fundamentals</li><li><br></li><li>The Audit Process</li><li><br></li><li>The Accounting Cycle</li><li><br></li><li>Debits and Credits</li><li><br></li><li>Accounts Receivable</li><li><br></li><li>Accounts Payable</li><li><br></li><li>Forecasting and Budgeting</li></ul><p><br></p>', '<ul><li>Startups</li><li>Small Business</li><li>Entrepreneurs</li><li>CEO\'s</li><li>CFO\'s</li><li>Accountants</li><li>Bookkeeper</li><li>And anyone else who wants to learn more about accounting and finance</li></ul><p><br></p>', '89aeed13-5b6e-4e0d-84af-a24793a83cd7', 'aca10dcc-c359-4b8d-acaf-d016898d65fa', 1, 0, NULL, 0, '2022-08-16 07:23:41', '2022-08-16 07:25:59'),
('410d35f5-2fa9-456a-8f8b-0599c1eb45e1', 'How to Run truly Productive Meetings – and add value', 'how-to-run-truly-productive-meetings-and-add-value', 'There don’t seem to be managers that can run good meetings – let alone great ones. ‘Pointless Meetings’ is the joint number one time-waster for business people, according to the Microsoft Office Productivity global survey.\n\nAs for interest and engagement - nearly three quarters of us try doing our own personal work during meetings. The true cost of meetings is often hidden. But not anymore. As well as showing you how to facilitate meetings, it gives great protocols for the whole team and for all types of meetings.', '<p>The principles have been tried and tested in classroom training courses in UK, Scandinavia, Iceland and North Africa, in a mix of global businesses.</p><p>The short summaries give you the basics, literally, in minutes. The 12 videos and accompanying book are structured in short, 5 minute sections - and you can keep improving from the greater detail whenever you want.</p><p>If you’re a first time manager, team leader, or business operator and you’re fed up with the time and cost wasted in meetings – click on the link and make meetings work FOR you.</p><p><br></p>', 9.99, 49.99, '15', '2h 20m total length', 'https://res.cloudinary.com/dev-empty/image/upload/v1661246498/gviacpl4bb55gp6r4dal.jpg', 'Lifetime', '<ul><li>Download and read the workbook</li></ul>', '<ul><li>By the end of the course you will be able to facilitate meetings that add unquestionable value</li><li>You’ll save your colleagues from frustration and give them back their time</li><li>You’ll save your organisation money</li></ul>', '<ul><li>Mangers who call or run meetings</li><li>Managers who attend meetings</li></ul><p><br></p>', '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '8955ae82-ba74-4435-8ff5-e52f76594ece', 1, 0, NULL, 0, '2022-08-23 09:21:38', '2022-08-23 09:27:27'),
('5335b72b-5ba5-4e55-9f04-bfb0e7f7d39f', 'Fitness-Yoga-Pilates Combined - Quick Home Workout Program', 'fitness-yoga-pilates-combined-quick-home-workout-program', '21 Days Home Workout based on Fitness, Yoga and Pilates principles for fat loss and backpain aid with your own weight', '<p>Let me ask you a few questions ;</p><ul><li>Are you happy with the&nbsp;<strong>extra pounds&nbsp;</strong>you\'re carrying around?</li><li>Are you happy with your&nbsp;<strong>well-being</strong>?</li><li>Do you wanna know what it feels like to wake up without<strong>&nbsp;back pain</strong>&nbsp;and be fully&nbsp;<strong>energized</strong>?</li><li>Have you ever thought about why you can\'t&nbsp;<strong>lose weight</strong>?</li><li>Maybe you\'ve asked yourself&nbsp;<strong>why</strong>&nbsp;I&nbsp;<strong>skip</strong>&nbsp;workouts after a while.</li></ul><p><strong>I`ve been there</strong>&nbsp;:)</p><p>What if I told you there\'s one thing, just one thing that can help you to change your current situation?</p><ul><li><strong>IF</strong>&nbsp;you can spend 25 minutes, 3 times a week,</li><li><strong>I F</strong>&nbsp;you want to see the difference in a short period of time and will motivate you,</li><li><strong>IF</strong>&nbsp;you can follow a dietary program that won\'t put you starving,</li></ul>', 99.99, 499, '21', '5h 35m total length', 'https://res.cloudinary.com/dev-empty/image/upload/v1662283170/znxfx4pp9olufntv6blc.jpg', 'Lifetime', '<ul><li>No experience needed , just you and your mat !</li></ul>', '<ul><li>Quick and Efficient Home Workout !</li><li>Feel Strong and Lose Fat With Bodyweight Exercises !</li><li>Improve Your Core Strength, Upper Body Strength and Your Legs and Booty !</li></ul>', '<ul><li>People claims themself as lazy and have limited time</li><li>People works 8 to 5 in office, on computer all the time</li></ul>', 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '3b0eebe9-c3a9-4250-be93-40b58ee1d40c', 1, 0, NULL, 0, '2022-08-24 06:12:19', '2022-09-04 09:19:30'),
('5c0ce34b-f2fa-4d79-8ec7-c2dbbad2a0bf', 'Live Acoustic Guitar and Electric Guitar Lessons', 'live-acoustic-guitar-and-electric-guitar-lessons', 'Eliminate All the Major Struggles When Getting Started With Playing Guitar. This course is the most \"Direct and To the Point\" course for ANY guitar player to watch and learn. Finding 2 Hours of Quality Guitar Lessons that can be accessed anywhere for FREE and at any time of the day is hard to come by these days. ', '<ul><li>Nearly 30 years of guitar experience both teaching and playing</li><li>Incredible $600 value for Free</li></ul>', 199, 245, '20', '2 Weeks', 'https://res.cloudinary.com/dev-empty/image/upload/v1664177479/cfn6ba4fmitb2psdrutv.jpg', 'Lifetime', '<ul><li>Nearly 30 years of guitar experience both teaching and playing</li><li>Incredible $600 value for Free</li></ul>', '<ul><li>Nearly 30 years of guitar experience both teaching and playing</li><li>Incredible $600 value for Free</li></ul>', '<ul><li>Nearly 30 years of guitar experience both teaching and playing</li><li>Incredible $600 value for Free</li></ul>', 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '92f8ccf1-384e-4c27-b429-a1bce510a1cc', 1, 0, NULL, 1, '2022-09-26 07:31:20', '2022-09-26 07:52:41'),
('72a7266e-ba51-42ea-bfc2-4ba9aaa262e2', 'Software Project Management For Start-ups And Solopreneurs', 'software-project-management-for-start-ups-and-solopreneurs', 'Software project management for start-ups, small businesses & entrepreneurs using Trello. Especially if hire freelancers.', '<p>If you are a solopreneur or a small business owner, learn project management fundamentals for small businesses, and complete your projects successfully, on time, and on budget.</p><ul><li>Learn business prioritization and decision-making</li><li>Learn to use Trello productivity and project management software</li><li>Hire the best freelancers and make sure they deliver successful projects</li><li>Master early team building</li></ul>', 9.99, 39.99, '38', '2h 6m total length', 'https://res.cloudinary.com/dev-empty/image/upload/v1662283224/hbwh7008ojteiqt1ohls.jpg', 'Lifetime', '<ul><li>You should be a solo entrepreneur who is hiring online freelancers and looking to improve your project management skills</li></ul>', '<ul><li>Have your products go more smoothly, on time and on budget</li><li>Understand different software project management methodologies so you can use the right one for your project</li></ul>', '<p><br></p>', 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '763283f5-3076-4b06-acba-e33d1f2a0db7', 1, 0, NULL, 0, '2022-08-24 05:56:16', '2022-09-04 09:20:24'),
('742d231f-2d5b-42b6-993e-1edeba676f45', 'Pianoforall - Incredible New Way To Learn Piano & Keyboard', 'pianoforall-incredible-new-way-to-learn-piano-keyboard', 'Learn Piano in WEEKS not years. Play-By-Ear & learn to Read Music. Pop, Blues, Jazz, Ballads, Improvisation, Classical', '<p><strong>Pianoforall is one of the most popular online piano courses with over 300,000 students worldwide</strong></p><p>Now ANYONE Can Learn Piano or Keyboard</p><p>Imagine being able to sit down at a piano and just PLAY - Ballads,&nbsp;Pop, Blues, Jazz, Ragtime, even amazing Classical pieces? Now you can...&nbsp;and you can do it in months not years without wasting money, time and&nbsp;effort on traditional Piano Lessons.&nbsp;</p><p><strong>An Incredible Set of&nbsp;Videos and ebooks (9 books, 600 pages)</strong></p>', 49.99, 145, '426', '38h 17m total length', 'https://res.cloudinary.com/dev-empty/image/upload/v1662282955/uheioegbcm7ghvmpiouh.jpg', 'Lifetime', '<ul><li>You don\'t need any prior knowledge or experience</li><li>Pianoforall works equally well on Piano or Keyboard</li><li>You only need to practice 20 minutes a day to make rapid progres</li></ul>', '<ul><li>Pianoforall will take complete beginners to an intermediate level in a very short space of time</li><li>You get to sound like a pro right from the start</li></ul>', '<ul><li>Suitable for all ages - from teens onwards (not for young kids)</li><li>Perfect for people who want to be able to just sit down at a piano and just amaze everyone.</li></ul>', 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '92f8ccf1-384e-4c27-b429-a1bce510a1cc', 1, 0, NULL, 0, '2022-08-24 06:19:47', '2022-09-04 09:15:55'),
('a06444c4-037f-4787-ba5f-9d28a8f1f4e1', 'Business Bootcamp: 7 Weeks to Start Your Own Business', 'business-bootcamp-7-weeks-to-start-your-own-business', 'I\'ll teach you the skills necessary to stand out from the crowd. Whether it’s a personal passion or a business pursuit, you can learn video, photography, art, design, marketing skills and more here.', '<p><strong><em>Learn creative&nbsp;skills, from&nbsp;absolute beginner&nbsp;to advanced mastery.&nbsp;</em></strong></p><p><br></p><p>Video School&nbsp;exists to help you succeed in life. Each course has been hand-tailored to teach a specific skill from photography and video to art, design and business.</p><p><strong><em>Whether you’re trying to learn a new skill&nbsp;from scratch, or want to refresh your memory on something you’ve learned in the past, you’ve come to the right place.</em></strong></p><p>Education makes the world a better place. Make your world better with new skills!</p><p>Our courses can be watched 24/7 wherever you are. Most are fully downloadable so you can take them with you. You can also view them on mobile devices with the Udemy mobile app.</p><p>All&nbsp;courses have a 30-day money-back guarantee so that you can check it out, make sure it’s the right course for you, and get a refund if it’s not!</p>', 16.99, 84.99, '52', '6h 33m total length', 'https://res.cloudinary.com/dev-empty/image/upload/v1660634163/icvgops1gqcosgv3dxde.jpg', 'Lifetime', '<ul><li>Students taking this class will be walked through the entire process of creating a business from scratch, so you do not need to do anything before this course begins. It will help you to already know some skills and ideas for a business that you would enjoy running.</li><li><br></li></ul><p><br></p>', '<ul><li>Start your own business with any skill or passion of yours</li><li><br></li><li>Choose your most profitable skill</li><li><br></li><li>Define your target audience &amp; compete with other businesses</li><li><br></li><li>Build your online presence with a website, portfolio, testimonials, and social media profiles</li><li><br></li><li>Find your first clients (and your next ones)</li><li><br></li><li>Manage a business (finances, taxes, expenses, etc.)</li></ul><p><br></p>', '<ul><li>You should take this course IF YOU ARE A COMPLETE BEGINNER, and have never created a business of your own</li><li>You should take this course if you want to be a successful freelancer doing something you love</li><li>You should take this course if you want to scale up your freelance business to an incorporated business</li><li>You should not take this course if you don\'t want to spend the next 7+ weeks working on your business</li></ul><p><br></p>', '89aeed13-5b6e-4e0d-84af-a24793a83cd7', 'c54a81fe-9947-4ede-80f7-5b924bb1fa20', 1, 1, '2022-08-16 07:17:56', 0, '2022-08-16 07:16:04', '2022-08-16 07:17:56'),
('a4417872-960c-4d9d-9b4c-b05bbc9c4c01', 'Agile Project Management', 'agile-project-management', 'Grow your business, get a raise, finish your IT project under budget with Agile! Learn from a successful executive.', '<p>Welcome to the only course on Udemy to feature a&nbsp;<strong><em>real Fortune 500 CIO&nbsp;</em></strong>and a&nbsp;<strong><em>Scrum trainer</em></strong>&nbsp;and when you are complete Udemy will issue you a certification of completion.</p><p>In this&nbsp;<strong><em>one of a kind course</em></strong>&nbsp;you will learn secrets of better Agile from a real executive with years of experience leading an enterprise IT team.&nbsp;These are the secrets executive normally don\'t share.&nbsp;</p><p>Have you ever been confused by Scrum or transformation efforts?&nbsp;Have you felt disconnected from your work and confused about what you doing?&nbsp;Most workers don\'t understand how their contribution influences a large project.&nbsp;</p>', 11.99, 99.99, '13', ' 1h 28m total length', 'https://res.cloudinary.com/dev-empty/image/upload/v1662283203/ck5gokacjjnorgvh9rnz.jpg', 'Lifetime', '<ul><li>A basic understanding of agile is useful but not required</li><li>A basic knowledge of Scrum is useful but not required</li><li>A basic knowledge of IT is useful but not required</li></ul>', '<ul><li>How to lead like a Fortune 500 Executive</li><li>How to lead an Agile team like a proven executive</li><li>IT leadership</li></ul>', '<ul><li>IT professionals</li><li>Tech entrepreneurs</li><li>Tech founders</li><li>Agile leaders</li></ul>', 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '6fe00827-7c90-48e9-bf3e-7e2591f97ec8', 1, 0, NULL, 0, '2022-08-24 06:07:41', '2022-09-04 09:20:04'),
('c3104df5-2d99-485c-81f8-725320fe82a6', 'AWS', 'aws', 'Amazon Web Services est une division du groupe américain de commerce électronique Amazon, spécialisée dans les services de cloud computing à la demande pour les entreprises et particuliers. En 2020, AWS a généré 45 milliards de dollars des 386 milliards de dollars du chiffre d\'affaires monde d\'Amazon, soit 11.5%.', '<p>Amazon Web Services est une division du groupe américain de commerce électronique Amazon, spécialisée dans les services de cloud computing à la demande pour les entreprises et particuliers. En 2020, AWS a généré 45 milliards de dollars des 386 milliards de dollars du chiffre d\'affaires monde d\'Amazon, soit 11.5%.</p>', 0, 0, '9', '10H', 'https://res.cloudinary.com/dtncca291/image/upload/v1675538646/index_hjqke1.jpg', 'Lifetime', '<p>-</p>', '<p>Amazon Web Services est une division du groupe américain de commerce électronique Amazon, spécialisée dans les services de cloud computing à la demande pour les entreprises et particuliers. En 2020, AWS a généré 45 milliards de dollars des 386 milliards de dollars du chiffre d\'affaires monde d\'Amazon, soit 11.5%.</p>', '<p>-</p>', 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', 'e532600c-8db4-41bd-8eb4-36b5cf67fc49', 1, 0, NULL, 1, '2023-02-04 19:24:06', '2023-02-04 19:26:47'),
('c5c6ee66-84df-46ee-b961-70a3ca173972', 'Learn Time Management, Get Organized & Get Everything Done', 'learn-time-management-get-organized-get-everything-done', 'Frustrated? Nothing gets done and more work piles up? Exhausted? Need to make time for yourself? Do you feel trapped by your hectic schedule? Are things still on your list at the end of the day or the week or even the month?', '<p>&nbsp;Learn to take control of your priorities, set the right goals, and plan your time to live your dreams</p><p>• Learn how to overcome procrastination</p><p>• Learn your personality type and how it affects the way you spend your time</p><p>• Learn how to take control of your schedule</p>', 9.99, 84.99, '5', '50m total length', 'https://res.cloudinary.com/dev-empty/image/upload/v1661246756/p63jr4iep9q2jeia6esv.jpg', 'Lifetime', '<ul><li>A busy schedule that doesn’t let you achieve what you want out of life</li></ul><p><br></p>', '<ul><li>By the end of the course you will know how to take control of your priorities, set the right goals, and plan your time to achieve your dreams</li><li>Learn how to overcome procrastination</li><li>Understand what you’ve put on your to-do list</li></ul>', '<ul><li>Business people who want to achieve their goals</li><li>Anyone who wants to take the stress out of their schedule</li></ul>', '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '8955ae82-ba74-4435-8ff5-e52f76594ece', 1, 0, NULL, 0, '2022-08-23 09:25:57', '2022-08-23 09:27:26'),
('cff02b2f-57c1-4680-b8b1-7ff69d9a2141', 'INtro React', 'intro-react', 'React est une bibliothèque JavaScript libre développée par Facebook depuis 2013. Le but principal de cette bibliothèque est de faciliter la création d\'application web monopage, via la création de composants dépendant d\'un état et générant une page HTML à chaque changement d\'état. ', '<p>React est une bibliothèque JavaScript libre développée par Facebook depuis 2013. Le but principal de cette bibliothèque est de faciliter la création d\'application web monopage, via la création de composants dépendant d\'un état et générant une page HTML à chaque changement d\'état. </p>', 0, 10000, '10', '10H', 'https://res.cloudinary.com/dtncca291/image/upload/v1675601274/index_ockplr.jpg', 'Lifetime', '<p>-		</p>', '<p>React est une bibliothèque JavaScript libre développée par Facebook depuis 2013. Le but principal de cette bibliothèque est de faciliter la création d\'application web monopage, via la création de composants dépendant d\'un état et générant une page HTML à chaque changement d\'état. </p>', '<p>-</p>', 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '9757989d-24a0-42b7-ab56-11673f671800', 1, 0, NULL, 0, '2023-02-05 12:47:54', '2023-02-05 12:50:36'),
('d92f38eb-e616-414c-be0c-54e79a6809c7', 'Node.js for Beginners - Become a Node js Developer', 'nodejs-for-beginners-become-a-node-js-developer', 'I don\'t know about you,but regular classes bore me, and that is why on this Node.js course we make it fun to learn LOTS of cool things. This course is meant for total beginners in the NodeJs world. ', '<p><strong>What is NODEjs or Node.js ?&nbsp;</strong></p><p>First of all let me just say that Node.js is the most popular technology right now, and it\'s REPO&nbsp;website is the biggest in the WORLD, now let\'s begin......</p><p>Some of us&nbsp;call it<strong>&nbsp;Node.js, NODE,</strong>&nbsp;or just&nbsp;<strong>NodeJs</strong>&nbsp;but they all mean the same thing. NodeJs is a runtime to use&nbsp;JavaScript on servers. A runtime acts like a middle-man and in this case NodeJs is helping us use Javascript to handle system processes, files and even databases. NodeJs is written in C++ which is a powerful high level programming&nbsp;language that does LOTS&nbsp;of cool things.</p><p><br></p><p><strong>My approach</strong></p><p>I\'m profesional but not boring</p><p>I\'m a regular person just like you - your mentor, teacher!</p><p>I joke sometimes, so that you won\'t fall asleep (I know how that is)</p><p>My teaching method&nbsp;are Unorthodox - look it up :)&nbsp;</p>', 16.99, 84.99, '26', '23h 10m total length', 'https://res.cloudinary.com/dev-empty/image/upload/v1660632448/qlhb9q20dvxs8lpajjsw.jpg', 'Lifetime', '<ul><li>Some Javascript is needed to learn NodeJs</li><li>Some HTML is needed for this course</li></ul>', '<ul><li>To build Amazing NodeJS applications like the CMS we build here using Express, MongoDB and more</li><li>To deploy Nodejs Apps on the Cloud</li><li>To create Login and Registration system using NodeJS</li><li>To use Mongoose (ODM) - very similar to ORM</li><li>To create custom events</li><li>To import and export data</li><li>To use the Express FrameWork</li><li>To handle HTTP requests</li><li>To deal with Files</li><li>To use WebSockets - (Chat application)</li><li>To use PassportJS a module to login to Facebook, Twitter, Google and more</li><li>To use Template Engines like Handlebars</li><li>And LOTS more.......</li></ul><p><br></p>', '<ul><li>If you are a TOTAL beginner for NodeJs you should take this course</li><li>If you are looking for a better career you should take this course</li><li>If you are looking to UP your salary as developer you should take this course</li><li>If you have tried to learn NodeJS before and it was too hard - I make this EASY!</li><li>If you are trying to get into the Angular World</li><li>If you want to become a great Web Developer with a lot of success</li><li>If you just need to make some serious income as a developer</li></ul>', '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '763283f5-3076-4b06-acba-e33d1f2a0db7', 1, 1, '2022-08-16 07:17:57', 0, '2022-08-16 06:47:29', '2022-08-16 07:17:57'),
('db24afee-e132-4be7-a7e7-0c411ccd41ca', 'SAP ABAP Programming For Beginners - Online Training', 'sap-abap-programming-for-beginners-online-training', 'SAP ABAP is the popular enterprise programming language developed by SAP and used by the biggest organisations in the world to run their business systems.\n\nIn this SAP ABAP video training course, Peter Moxon introduces you to the fundamental skills needed to understand SAP ABAP programming and start creating your own ABAP programs.', '<p>You will learn by watching the author actually perform the operation he is instructing on, as he explains step by step how to create and modify ABAP code. The training explains SAP ABAP from the ground up starting with the absolute basics to ensure you have a thorough grasp of the how best to program SAP enterprise systems. He slowly works you up through learning the key aspects of ABAP development introducing new concepts and language element included in SAP, and covers topics such building report interfaces and modularizing you programs with \'Includes\', \'Forms\' and \'Function Modules\'.</p><p>This training course not only gives you an a thorough insight into how the SAP programming language works but is delivered in such a way that everyone who takes the course will have absolutely no problem in understanding all the topics discussed.</p>', 16.99, 84.99, '133', '13h 18m total length', 'https://res.cloudinary.com/dev-empty/image/upload/v1662283275/fsc54pepqvlrtou2wjbs.jpg', 'Six Months', '<ul><li>User level understanding of how to navigate the SAP GUI</li></ul>', '<ul><li>Get your first job in SAP</li><li>Enhance your existing SAP Skill-set</li><li>Extensive, informative, and interesting video lecture</li><li>Help pass SAP ABAP Certification Exams</li><li>Instructor contact through the Udemy platform</li></ul>', '<ul><li>Everyone</li><li>Beginners through to season SAP Consultants</li><li>SAP Functional Consultants looking to learn ABAP skills</li><li>SAP Project Team members</li><li>College Students wanting to get ahead with their studies</li><li>SAP BASIS Consultants wanting to expand their knowledge</li><li>SAP BW Consultants - ABAP play a BIG part in this role</li></ul>', 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '6fe00827-7c90-48e9-bf3e-7e2591f97ec8', 1, 0, NULL, 0, '2022-08-16 09:07:47', '2022-09-04 09:21:16');

-- --------------------------------------------------------

--
-- Structure de la table `course_assets`
--

DROP TABLE IF EXISTS `course_assets`;
CREATE TABLE IF NOT EXISTS `course_assets` (
  `id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `lecture_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `lecture_file` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `courseId` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `courseId` (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `course_assets`
--

INSERT INTO `course_assets` (`id`, `lecture_name`, `lecture_file`, `courseId`, `created_at`, `updated_at`) VALUES
('289302a0-3a4d-485e-a23f-417340385169', 'How to image proccessing', 'https://res.cloudinary.com/dev-empty/raw/upload/v1660633994/rcsgks9kygvsefxzjdnr.php', 'd92f38eb-e616-414c-be0c-54e79a6809c7', '2022-08-16 07:13:15', '2022-08-16 07:13:15'),
('5dfb4a3f-d6c1-4c01-8aa0-455254fbf6d3', 'Certified Security', 'https://res.cloudinary.com/dev-empty/raw/upload/v1660635440/lggdrfp1jhvqrfv4uwew.pdf', '142a183d-45f1-4447-9aad-64f736471988', '2022-08-16 07:37:21', '2022-08-16 07:37:21'),
('5e4c6ee2-fed7-4938-bd85-7d532fe8af82', 'How to image proccessing', 'https://res.cloudinary.com/dev-empty/raw/upload/v1660641019/bznisqkn49wgxjmasoaf.jpeg', 'db24afee-e132-4be7-a7e7-0c411ccd41ca', '2022-08-16 09:10:19', '2022-08-16 09:10:19'),
('81a7a6c0-4dd4-43a6-afbe-f95ddd924473', 'How to image proccessing', 'https://res.cloudinary.com/dev-empty/raw/upload/v1661246283/bb9wygtppwejxmsijx6z.pdf', '130bcd58-0650-4efe-a401-dc949373c699', '2022-08-23 09:18:04', '2022-08-23 09:18:04'),
('98b2fa7e-105b-4e50-a6c7-5be307e5ff5d', 'Accounting and Finance', 'https://res.cloudinary.com/dev-empty/raw/upload/v1660634743/s8yj6ly5rudzk8fkwcow.sql', '3118e959-37af-453b-889b-e3006446127a', '2022-08-16 07:25:43', '2022-08-16 07:25:43'),
('99cebd1f-ec2c-49d4-b658-1820129f67b9', 'Business Idea', 'https://res.cloudinary.com/dev-empty/raw/upload/v1660634259/mvhsgqhumvg3gfrnkqhu.pdf', 'a06444c4-037f-4787-ba5f-9d28a8f1f4e1', '2022-08-16 07:17:39', '2022-08-16 07:17:39'),
('eea37624-36c6-494c-978f-c18a58e34b34', 'Exercice 1', 'https://res.cloudinary.com/dtncca291/raw/upload/v1675601380/r5a3td9dshi7jh1k9kx2.html', 'cff02b2f-57c1-4680-b8b1-7ff69d9a2141', '2023-02-05 12:49:39', '2023-02-05 12:49:39');

-- --------------------------------------------------------

--
-- Structure de la table `course_progresses`
--

DROP TABLE IF EXISTS `course_progresses`;
CREATE TABLE IF NOT EXISTS `course_progresses` (
  `id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `finished` tinyint(1) DEFAULT '1',
  `userId` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `courseId` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `videoId` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `courseId` (`courseId`),
  KEY `videoId` (`videoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `course_progresses`
--

INSERT INTO `course_progresses` (`id`, `finished`, `userId`, `courseId`, `videoId`, `created_at`, `updated_at`) VALUES
('23202b20-aa9d-479d-a859-5ab93ec62a83', 1, '8703b97d-6c88-4396-b0d6-dc53d5d48ead', '410d35f5-2fa9-456a-8f8b-0599c1eb45e1', '895fac47-e731-412c-a947-27fb489ef818', '2022-09-24 23:01:38', '2022-09-24 23:01:38'),
('350c9101-5fa3-49f1-a6b7-b6faa44cc3af', 1, '8703b97d-6c88-4396-b0d6-dc53d5d48ead', 'cff02b2f-57c1-4680-b8b1-7ff69d9a2141', '3d1aa44d-7bd2-4abb-b22e-c657a6c2d692', '2023-02-05 14:05:01', '2023-02-05 14:05:01'),
('5af12df1-c7de-4f1f-abb6-002cedddeaf7', 1, '4736d451-8308-4e70-a514-8d43c978ba8c', '130bcd58-0650-4efe-a401-dc949373c699', 'a7aad65e-568b-4e09-ac2f-6a23b5640c06', '2022-08-29 04:40:57', '2022-08-29 04:40:57'),
('64502d7d-f8dc-4d1c-9ea9-07227d4ca1e5', 1, '8703b97d-6c88-4396-b0d6-dc53d5d48ead', '410d35f5-2fa9-456a-8f8b-0599c1eb45e1', '6afbf2b0-d5f5-405f-be5c-66aff4375d24', '2022-09-24 23:01:37', '2022-09-24 23:01:37'),
('6c49e6c1-4ead-46ce-bee6-17aa6339899e', 1, '4736d451-8308-4e70-a514-8d43c978ba8c', '130bcd58-0650-4efe-a401-dc949373c699', 'bf3be034-ef30-47c0-afe3-75f2fa15e09c', '2022-08-29 04:41:04', '2022-08-29 04:41:04'),
('804e161a-1a9a-4e88-82cd-e46cf262db79', 1, '8703b97d-6c88-4396-b0d6-dc53d5d48ead', '5335b72b-5ba5-4e55-9f04-bfb0e7f7d39f', '728f13d3-9116-4b14-984c-0871342fa162', '2022-09-04 09:24:03', '2022-09-04 09:24:03'),
('aa9c575c-7e2e-45ac-9b55-a2fd723d5231', 1, '11f5882f-dfbc-49cd-9f22-875ef0300875', '742d231f-2d5b-42b6-993e-1edeba676f45', '9bd8d2a6-8c9f-482a-bb11-bdc83fcf6e3a', '2022-09-24 21:34:16', '2022-09-24 21:34:16'),
('accf8ee6-9a10-49e2-a88f-700babce740e', 1, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '142a183d-45f1-4447-9aad-64f736471988', '3a858fce-8795-4e9e-b8d4-7fe14e47863e', '2022-09-25 07:37:20', '2022-09-25 07:37:20'),
('e5bde9a0-e5c2-48ce-aadf-47adb754ff40', 1, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '142a183d-45f1-4447-9aad-64f736471988', 'bbe49bf9-86a0-41b9-9ec1-b4f7ef966e7c', '2022-09-25 07:37:24', '2022-09-25 07:37:24'),
('f58c8abe-b022-4bd4-a28d-483384d96d5c', 1, '4736d451-8308-4e70-a514-8d43c978ba8c', '130bcd58-0650-4efe-a401-dc949373c699', 'd0ebd79e-08f2-40db-89b2-703f886a7e9d', '2022-08-29 04:40:54', '2022-08-29 04:40:54');

-- --------------------------------------------------------

--
-- Structure de la table `enrolments`
--

DROP TABLE IF EXISTS `enrolments`;
CREATE TABLE IF NOT EXISTS `enrolments` (
  `id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `bought_price` float DEFAULT NULL,
  `payment_method` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `buyer_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `buyer_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `buyer_avatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `userId` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `courseId` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `status` enum('paid','unpaid') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `courseId` (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `enrolments`
--

INSERT INTO `enrolments` (`id`, `bought_price`, `payment_method`, `buyer_name`, `buyer_email`, `buyer_avatar`, `userId`, `courseId`, `status`, `created_at`, `updated_at`) VALUES
('0afcd611-c966-46bb-af34-98c1065d3846', 39.99, 'Card', 'Student', 'student@edmy.com', NULL, '8703b97d-6c88-4396-b0d6-dc53d5d48ead', '308cdeb3-b61f-4fca-a139-9bb219282dd3', 'paid', '2022-09-24 11:41:43', '2022-09-24 11:41:43'),
('13c84d5a-07bb-4f74-aaab-479cffb1c5a6', 9.99, 'Card', 'Student', 'student@edmy.com', NULL, '8703b97d-6c88-4396-b0d6-dc53d5d48ead', '410d35f5-2fa9-456a-8f8b-0599c1eb45e1', 'paid', '2022-09-23 18:46:04', '2022-09-23 18:46:04'),
('2603a2b7-3551-40dd-b6d3-94aee17b0fcd', 49.99, 'Card', 'Test', 'imtiazah.uk@gmail.com', NULL, '11f5882f-dfbc-49cd-9f22-875ef0300875', '742d231f-2d5b-42b6-993e-1edeba676f45', 'paid', '2022-09-24 21:33:50', '2022-09-24 21:33:50'),
('2a18c49e-6ab6-4d42-921a-576a8a2300d3', 16.99, 'Card', 'Shabbir', 'shabbirahmed149@gmail.com', 'https://res.cloudinary.com/dev-empty/image/upload/v1660631868/gnfwstr1tv80am1duqp7.png', '89aeed13-5b6e-4e0d-84af-a24793a83cd7', 'db24afee-e132-4be7-a7e7-0c411ccd41ca', 'paid', '2022-08-18 07:24:54', '2022-08-18 07:24:54'),
('36a14f9e-fa90-442c-ae8e-3848167cd5b6', 99.99, 'Card', 'Student', 'shabbir@envytheme.com', NULL, '8703b97d-6c88-4396-b0d6-dc53d5d48ead', '5335b72b-5ba5-4e55-9f04-bfb0e7f7d39f', 'paid', '2022-08-30 13:01:19', '2022-08-30 13:01:19'),
('762048bd-5f4b-4fc5-8827-8f39a6959f57', 34.99, 'Card', 'Shabbir', 'shabbirahmed149@gmail.com', 'https://res.cloudinary.com/dev-empty/image/upload/v1660631868/gnfwstr1tv80am1duqp7.png', '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '142a183d-45f1-4447-9aad-64f736471988', 'paid', '2022-08-18 07:37:04', '2022-08-18 07:37:04'),
('7dfe0304-82dd-4a58-a97f-7a0a0f10acba', 34.99, 'Card', 'Shabbir', 'shabbirahmed149@gmail.com', 'https://res.cloudinary.com/dev-empty/image/upload/v1660631868/gnfwstr1tv80am1duqp7.png', '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '142a183d-45f1-4447-9aad-64f736471988', 'paid', '2022-08-18 07:24:54', '2022-08-18 07:24:54'),
('9b1879b6-5004-4603-8e5c-0dac0e32c4be', 0, 'Card', 'Student', 'student@edmy.com', NULL, '8703b97d-6c88-4396-b0d6-dc53d5d48ead', 'cff02b2f-57c1-4680-b8b1-7ff69d9a2141', 'paid', '2023-02-05 12:51:35', '2023-02-05 12:51:35'),
('9fc35a33-b634-463b-8d2a-811139c1065d', 9.99, 'Card', 'Shabbir', 'sa@gmail.com', NULL, '4736d451-8308-4e70-a514-8d43c978ba8c', '130bcd58-0650-4efe-a401-dc949373c699', 'paid', '2022-08-29 04:31:51', '2022-08-29 04:31:51'),
('a88d2d19-9492-40ae-ae56-b2dc4b4dfdec', 49.99, 'Card', 'Student', 'student@edmy.com', NULL, '8703b97d-6c88-4396-b0d6-dc53d5d48ead', '742d231f-2d5b-42b6-993e-1edeba676f45', 'paid', '2022-09-24 23:00:55', '2022-09-24 23:00:55'),
('d9e892ec-b998-4a26-8b8a-5a8b2f45baa4', 0, 'Card', 'Student', 'student@edmy.com', NULL, '8703b97d-6c88-4396-b0d6-dc53d5d48ead', 'c3104df5-2d99-485c-81f8-725320fe82a6', 'paid', '2023-02-04 19:27:36', '2023-02-04 19:27:36'),
('f57ef6d1-22ba-49cc-8a14-b45261270e15', 49.99, 'Card', 'Student', 'student@edmy.com', NULL, '8703b97d-6c88-4396-b0d6-dc53d5d48ead', '742d231f-2d5b-42b6-993e-1edeba676f45', 'paid', '2022-09-23 20:46:23', '2022-09-23 20:46:23'),
('fa55ef51-4e58-4c6c-9eb3-253a3fb6295b', 11.99, 'Card', 'Admin', 'admin@edmy.com', 'https://res.cloudinary.com/dev-empty/image/upload/v1661245253/wqsnxv0pfdwl2abdakf5.jpg', '89aeed13-5b6e-4e0d-84af-a24793a83cd7', 'a4417872-960c-4d9d-9b4c-b05bbc9c4c01', 'paid', '2022-09-25 07:35:54', '2022-09-25 07:35:54');

-- --------------------------------------------------------

--
-- Structure de la table `favourites`
--

DROP TABLE IF EXISTS `favourites`;
CREATE TABLE IF NOT EXISTS `favourites` (
  `id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `userId` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `courseId` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `courseId` (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `favourites`
--

INSERT INTO `favourites` (`id`, `userId`, `courseId`, `created_at`, `updated_at`) VALUES
('0a444cbc-2ab1-45a2-b80f-3cac370ee881', '745ae3a3-7a60-4140-a71c-9b942c0035cc', '130bcd58-0650-4efe-a401-dc949373c699', '2022-09-22 17:06:18', '2022-09-22 17:06:18'),
('c8f9e6de-132c-4b64-8b46-3c1f1580bf29', '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '308cdeb3-b61f-4fca-a139-9bb219282dd3', '2022-09-25 07:34:17', '2022-09-25 07:34:17'),
('caf1cff2-1c46-47c4-84c0-aee7894ba49c', 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '410d35f5-2fa9-456a-8f8b-0599c1eb45e1', '2022-09-04 05:18:50', '2022-09-04 05:18:50'),
('cfc7fe41-dd86-4eb9-b549-ed0f549e9a98', '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '742d231f-2d5b-42b6-993e-1edeba676f45', '2022-09-25 07:34:20', '2022-09-25 07:34:20'),
('f7327e30-67fd-42c2-a9d2-3d2f4c3f98a0', '8703b97d-6c88-4396-b0d6-dc53d5d48ead', '308cdeb3-b61f-4fca-a139-9bb219282dd3', '2022-09-01 08:15:06', '2022-09-01 08:15:06');

-- --------------------------------------------------------

--
-- Structure de la table `instructor_earnings`
--

DROP TABLE IF EXISTS `instructor_earnings`;
CREATE TABLE IF NOT EXISTS `instructor_earnings` (
  `id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `earnings` float DEFAULT NULL,
  `userId` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `courseId` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `status` enum('due','paid','cancelled') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'due',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `courseId` (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `instructor_earnings`
--

INSERT INTO `instructor_earnings` (`id`, `earnings`, `userId`, `courseId`, `status`, `created_at`, `updated_at`) VALUES
('017cc784-bc84-4ff0-aac8-93b25979ef6c', 9.99, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '130bcd58-0650-4efe-a401-dc949373c699', 'due', '2022-08-29 04:31:51', '2022-08-29 04:31:51'),
('048c60da-c8f2-4f63-8475-7a9ab7e560c5', 49.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '742d231f-2d5b-42b6-993e-1edeba676f45', 'due', '2022-08-24 06:59:03', '2022-08-24 06:59:03'),
('32c0ba71-89bd-4eca-8c81-f3fc9084d6b6', 17.99, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '3118e959-37af-453b-889b-e3006446127a', 'due', '2022-08-22 15:53:28', '2022-08-22 15:53:28'),
('34e696d5-2a8f-4987-be31-77572478f387', 39.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '308cdeb3-b61f-4fca-a139-9bb219282dd3', 'due', '2022-09-24 11:41:43', '2022-09-24 11:41:43'),
('3b37455b-e8c9-48c7-9054-eedb74e72b7d', 11.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', 'a4417872-960c-4d9d-9b4c-b05bbc9c4c01', 'due', '2022-09-25 07:35:54', '2022-09-25 07:35:54'),
('43e5676b-f0d0-412f-9a48-154f2b7b393f', 49.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '742d231f-2d5b-42b6-993e-1edeba676f45', 'due', '2022-09-24 23:00:55', '2022-09-24 23:00:55'),
('46b8b851-eed0-44f6-9eff-fbef6da7a55b', 0, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', 'cff02b2f-57c1-4680-b8b1-7ff69d9a2141', 'due', '2023-02-05 12:51:36', '2023-02-05 12:51:36'),
('4fb7d7da-18b2-42c6-8b7f-7776c77fab7d', 16.99, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', 'a06444c4-037f-4787-ba5f-9d28a8f1f4e1', 'due', '2022-08-22 04:53:57', '2022-08-22 04:53:57'),
('52a0742e-a490-49ad-ab64-792579f26e46', 34.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '142a183d-45f1-4447-9aad-64f736471988', 'due', '2022-08-18 07:24:54', '2022-08-18 07:24:54'),
('6abdeb43-1e56-48ce-8e5a-6be61618c312', 34.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '142a183d-45f1-4447-9aad-64f736471988', 'due', '2022-08-23 07:38:40', '2022-08-23 07:38:40'),
('774dfeb7-34db-47da-b77a-09adb773cdb0', 16.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', 'db24afee-e132-4be7-a7e7-0c411ccd41ca', 'due', '2022-08-18 07:24:54', '2022-08-18 07:24:54'),
('83888d13-c67c-48f7-8405-885bbd692514', 34.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '142a183d-45f1-4447-9aad-64f736471988', 'due', '2022-08-22 05:46:13', '2022-08-22 05:46:13'),
('8f6ec23b-c470-4f4e-810b-4d582e3734ca', 49.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '742d231f-2d5b-42b6-993e-1edeba676f45', 'due', '2022-09-24 21:33:50', '2022-09-24 21:33:50'),
('94e497a7-714b-467a-9f7c-ba3c06e7106e', 0, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', 'c3104df5-2d99-485c-81f8-725320fe82a6', 'due', '2023-02-04 19:27:36', '2023-02-04 19:27:36'),
('97ffde2e-1692-4656-ac0b-230bc5c92a78', 34.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '142a183d-45f1-4447-9aad-64f736471988', 'due', '2022-08-22 05:53:04', '2022-08-22 05:53:04'),
('9d8fa8c7-c1a2-4f3d-9fd8-ee785a025e84', 9.99, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '410d35f5-2fa9-456a-8f8b-0599c1eb45e1', 'due', '2022-09-23 18:46:04', '2022-09-23 18:46:04'),
('af398513-a6f9-436b-835d-1d5223dd4247', 16.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', 'db24afee-e132-4be7-a7e7-0c411ccd41ca', 'due', '2022-08-22 15:45:32', '2022-08-22 15:45:32'),
('c31a7b2f-f851-42e9-9e1e-a9094078e310', 34.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '142a183d-45f1-4447-9aad-64f736471988', 'due', '2022-08-22 15:50:04', '2022-08-22 15:50:04'),
('c457f731-d9b2-4be1-a87f-fd065b6f43c4', 17.99, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '3118e959-37af-453b-889b-e3006446127a', 'due', '2022-08-23 04:06:33', '2022-08-23 04:06:33'),
('d57028e6-409c-47f6-a72a-897bf0adb500', 34.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '142a183d-45f1-4447-9aad-64f736471988', 'due', '2022-08-18 07:37:04', '2022-08-18 07:37:04'),
('e0b7297f-04b8-4b73-b07b-813b2a713ad0', 49.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '742d231f-2d5b-42b6-993e-1edeba676f45', 'due', '2022-09-23 20:46:23', '2022-09-23 20:46:23'),
('fee43f60-7f1d-4f1e-9ba5-9f72b55a3ca1', 99.99, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '5335b72b-5ba5-4e55-9f04-bfb0e7f7d39f', 'due', '2022-08-30 13:01:19', '2022-08-30 13:01:19');

-- --------------------------------------------------------

--
-- Structure de la table `partners`
--

DROP TABLE IF EXISTS `partners`;
CREATE TABLE IF NOT EXISTS `partners` (
  `id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `partner_image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `partners`
--

INSERT INTO `partners` (`id`, `name`, `partner_image`, `created_at`, `updated_at`) VALUES
('82111ca6-f1af-439b-9a1d-6e557f7efc36', 'Microsoft', 'https://res.cloudinary.com/dev-empty/image/upload/v1662220599/fw2vmnixtr8rwhb8jga8.png', '2022-09-03 15:56:40', '2022-09-03 15:56:40'),
('99fcfb9a-44e7-4e6d-b44a-ad8203b277e5', 'Microsoft', 'https://res.cloudinary.com/dev-empty/image/upload/v1662220609/foaoty9yj8ztpyn3rygg.png', '2022-09-03 15:56:49', '2022-09-03 15:56:49'),
('c0476de9-26ce-4867-bc4a-c25ef4664274', 'Microsoft', 'https://res.cloudinary.com/dev-empty/image/upload/v1662220586/cmejwacwcz2ejxhv8wna.png', '2022-09-03 15:56:27', '2022-09-03 15:56:27'),
('e325d7eb-aa0b-4d2c-83de-6e70b57153e3', 'Microsoft', 'https://res.cloudinary.com/dev-empty/image/upload/v1662220570/fdsav9xalgcj6mjqs1rn.png', '2022-09-03 15:56:10', '2022-09-03 15:56:10'),
('f70686e7-f4b1-41ef-b4e6-382726fd83c7', 'Microsoft', 'https://res.cloudinary.com/dev-empty/image/upload/v1662220578/sbwdmgrtzl0ttu3ntwt1.png', '2022-09-03 15:56:19', '2022-09-03 15:56:19'),
('f767e9b5-85f8-44d4-be27-dfa10f049cf3', 'Microsoft', 'https://res.cloudinary.com/dev-empty/image/upload/v1662220561/xfdt2sondensxindk4xf.png', '2022-09-03 15:56:01', '2022-09-03 15:56:01');

-- --------------------------------------------------------

--
-- Structure de la table `sequelizemeta`
--

DROP TABLE IF EXISTS `sequelizemeta`;
CREATE TABLE IF NOT EXISTS `sequelizemeta` (
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20220807061714-create-user.js'),
('20220809153209-create-category.js'),
('20220810055344-create-testimonial.js'),
('20220810071953-create-partner.js'),
('20220811031005-create-course.js'),
('20220814043222-create-video.js'),
('20220815063929-create-course-asset.js'),
('20220816105113-create-favourite.js'),
('20220817092028-create-enrolment.js'),
('20220817092044-create-instructor-earning.js'),
('20220821065623-create-course-progress.js'),
('20220822101406-create-subscription.js');

-- --------------------------------------------------------

--
-- Structure de la table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
CREATE TABLE IF NOT EXISTS `subscriptions` (
  `id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `email`, `active`, `created_at`, `updated_at`) VALUES
('6f4652e2-fa95-4361-bad4-5f8295110319', 'shabbirahmed149@gmail.com', 1, '2022-08-24 05:19:42', '2022-08-24 05:19:42');

-- --------------------------------------------------------

--
-- Structure de la table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
CREATE TABLE IF NOT EXISTS `testimonials` (
  `id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `designation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `testimonials`
--

INSERT INTO `testimonials` (`id`, `image_url`, `name`, `designation`, `description`, `created_at`, `updated_at`) VALUES
('6d240ff9-a486-4468-b8d8-7d2d29ed21a4', 'https://res.cloudinary.com/dev-empty/image/upload/v1661319916/ikdnht0voicfbwdpwmam.jpg', 'Jhon Smith', 'React Developer', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.', '2022-08-22 07:55:53', '2022-08-24 05:45:17'),
('9dfc677a-0ed2-4cc2-bfbb-690ee34885e1', 'https://res.cloudinary.com/dev-empty/image/upload/v1661319899/jesalmrfyvyjhnc4bn8w.jpg', 'Jason Stathum', 'Python Dev.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.', '2022-08-22 07:56:39', '2022-08-24 05:44:59'),
('ef09c8c4-b6b6-447c-8af1-12eb366acf52', 'https://res.cloudinary.com/dev-empty/image/upload/v1661155050/ulxxkiqnpzqvwcnbutyl.jpg', 'Stiven Smith', 'Captain Of AU.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.', '2022-08-22 07:57:30', '2022-08-22 07:57:30');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `designation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bio` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `profile_photo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reset_password_token` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `reset_password_send_at` datetime DEFAULT NULL,
  `reset_password_at` datetime DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `role` enum('student','admin','instructor') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'student',
  `email_confirmed` tinyint(1) DEFAULT '0',
  `email_confirmed_at` datetime DEFAULT NULL,
  `instructor_request` tinyint(1) DEFAULT '0',
  `instructor_request_confirmed` tinyint(1) DEFAULT '0',
  `instructor_request_confirmed_at` datetime DEFAULT NULL,
  `instructor_status` tinyint(1) DEFAULT NULL,
  `instructor_subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `instructor_description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `is_profile_public` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `gender`, `designation`, `bio`, `profile_photo`, `location`, `phone`, `reset_password_token`, `reset_password_send_at`, `reset_password_at`, `website`, `twitter`, `facebook`, `linkedin`, `youtube`, `role`, `email_confirmed`, `email_confirmed_at`, `instructor_request`, `instructor_request_confirmed`, `instructor_request_confirmed_at`, `instructor_status`, `instructor_subject`, `instructor_description`, `status`, `is_profile_public`, `created_at`, `updated_at`) VALUES
('11f5882f-dfbc-49cd-9f22-875ef0300875', 'Test', 'User', 'imtiazah.uk@gmail.com', '$2b$10$a2C/Tic5Jlt0Jx.qYInlYuwf76gR4fF7L3ynFPnOgl2Xekb5FD6pO', NULL, NULL, NULL, NULL, NULL, NULL, '04fe0867-28d4-4c4a-bcbd-f08bea3fb23a', '2022-09-24 21:33:10', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 0, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, 1, '2022-09-24 21:33:10', '2022-09-24 21:33:10'),
('4736d451-8308-4e70-a514-8d43c978ba8c', 'Shabbir', 'Ahmed', 'sa@gmail.com', '$2b$10$H.P.Kwe5LBsxXETcreHUhOfe4G4gHa.hz4KK/T6o6CeSyz0oZJtqS', NULL, NULL, NULL, NULL, NULL, NULL, '6cc3183a-5ca7-44c0-8c7e-e0b09430bc3e', '2022-08-29 04:20:35', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 0, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, 1, '2022-08-29 04:20:35', '2022-08-29 04:20:35'),
('47f9226e-6af3-47e0-8460-9e2ab0f5a300', 'dino', 'trochi', 'leotermine.au@gmail.com', '$2b$10$FeIuWj5qwdG1n8Z8v7eJjOFbfXs2tzFjsux.4jzL5JiPQRlDARf2y', NULL, NULL, NULL, NULL, NULL, NULL, '7632b9cb-58a0-4498-98b5-c482f668a68f', '2022-09-23 09:55:10', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 0, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, 1, '2022-09-23 09:55:10', '2022-09-23 09:55:10'),
('745ae3a3-7a60-4140-a71c-9b942c0035cc', 'Jean', 'EMANE', 'jpeedesign@gmail.com', '$2b$10$6KtPsm1NERQSsiYB1Tf3BebMwoag3DgOmrmgDAgMrCzmJmS7Fcot.', NULL, NULL, NULL, 'https://res.cloudinary.com/dev-empty/image/upload/v1663866284/iqtj9fyhm7gwfy1zxzaf.png', NULL, '690710240', 'ac1d4e13-a4ca-45e9-84bc-6be63b3053b0', '2022-09-22 16:59:15', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 1, '2022-09-22 17:02:13', 1, 0, NULL, NULL, 'Informatique', 'Web', 1, 1, '2022-09-22 16:59:15', '2022-09-22 17:04:45'),
('74746f21-b007-4df8-9d62-ee1bc046147a', 'Soh', 'Marrious', 'sediswilliam@gmail.com', '$2b$10$Adq1mtmCQYsBraxD2p8hyuzUsFNgKD6Z4lgpXnykHeIiKObsu9/d2', NULL, NULL, NULL, NULL, NULL, NULL, '6175aa3a-e346-43d4-8bb8-f4ebff747d7f', '2022-09-23 10:02:30', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 1, '2022-09-23 10:03:20', 0, 0, NULL, NULL, NULL, NULL, 1, 1, '2022-09-23 10:02:30', '2022-09-23 10:03:20'),
('748ddd80-57f6-44b4-b223-609ace8aca2c', 'Test', 'Test', 'tedraloydi@vusra.com', '$2b$10$4RBcLdqsAIQd0Oc9hsiMY.V5vZ3DyiGX4Iz6W1ZTUJu.N0b9AnaZK', NULL, NULL, NULL, NULL, NULL, NULL, 'ed6f53e2-3262-4d21-82b2-81cf8cb568f8', '2022-09-22 13:42:50', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 0, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, 1, '2022-09-22 13:42:50', '2022-09-22 13:42:50'),
('8703b97d-6c88-4396-b0d6-dc53d5d48ead', 'Student', 'Shabbir', 'student@edmy.com', '$2b$10$JYKno5O5SRweB57H6L2hqeh6vx/FVhOlr5E0SIjy9Bru5R2mpQe8S', NULL, NULL, NULL, NULL, NULL, '+8801646295918', 'd88bb13f-72c4-4287-aa5f-54345052a8e9', '2022-08-30 05:50:01', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 1, '2022-08-30 06:51:54', 1, 0, NULL, NULL, 'Register to Become an Intructor', 'Your email address will not be published. All fields are required.\n\n', 1, 1, '2022-08-30 05:50:01', '2022-08-30 06:57:33'),
('89aeed13-5b6e-4e0d-84af-a24793a83cd7', 'Admin', 'User', 'admin@edmy.com', '$2b$10$dlh6PVGVzG7pHebt8GxVFuwNNsWJvJWb5lZcyB.nAI3FqLMDXSZ.G', NULL, NULL, 'Admin started his career as a Unix and Linux System Engineer in 1999. Since that time he has utilized his Linux skills at companies such as Xerox, UPS, Hewlett-Packard, and Amazon.com. Additionally, he has acted as a technical consultant and independent contractor for small businesses and Fortune 500 companies.', 'https://res.cloudinary.com/dev-empty/image/upload/v1661245253/wqsnxv0pfdwl2abdakf5.jpg', NULL, NULL, 'e52de641-fc1b-419a-b82f-75905bdfac97', '2022-08-16 03:26:55', NULL, NULL, NULL, NULL, NULL, NULL, 'admin', 1, '2022-08-16 03:27:12', 0, 0, NULL, NULL, NULL, NULL, 1, 1, '2022-08-16 03:26:55', '2022-08-23 14:12:36'),
('8d034c5f-8523-4a8b-a8e6-0a4a1d23f861', 'Admin', 'User', 'shabbirahmed149@gmail.com', '$2b$10$XLhTGopumTDUWR8nHjzsR.zk8VinaNPG5frOibBzm5IDrW0F9sL1i', NULL, NULL, NULL, NULL, NULL, NULL, '6e78712f-ecf7-4eae-8d8f-836860223319', '2022-09-03 15:53:47', NULL, NULL, NULL, NULL, NULL, NULL, 'admin', 1, '2022-09-03 15:54:10', 0, 0, NULL, NULL, NULL, NULL, 1, 1, '2022-09-03 15:53:47', '2022-09-03 15:54:10'),
('b2e6c33f-fae4-4668-a442-fb890ede4ee2', 'abc', 'xyz', 'abc@abc.biz', '$2b$10$cHO0VlLk5MbLZJu7w4MJNOupFPt4cLxSDHY8QyI0tpzw50haQfUZa', NULL, NULL, NULL, NULL, NULL, NULL, 'd45e8c4e-eb5c-484c-bd86-3b87236242c5', '2022-09-24 23:07:27', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 0, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, 1, '2022-09-24 23:07:27', '2022-09-24 23:07:27'),
('c14c8721-7a84-4ac4-9b45-66600171ce63', 'Soh', 'Marrious', 'sohmarrious@gmail.com', '$2b$10$2I3/J9UiNSaEUaXs9FWoAOUez./7TDPg0043piqh5CgCZl2sN.Btm', NULL, NULL, NULL, NULL, NULL, NULL, 'dc938788-2682-40d8-b941-56ce6bced11c', '2022-09-23 09:37:32', NULL, NULL, NULL, NULL, NULL, NULL, 'student', 1, '2022-09-23 09:42:05', 0, 0, NULL, NULL, NULL, NULL, 1, 1, '2022-09-23 09:37:32', '2022-09-23 09:42:05'),
('ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', 'Instructor', 'User', 'teacher@edmy.com', '$2b$10$cQuqV3bPHw3EQFZXSBxxhOf5wYeAOhZ8ShRPZmmDra1M0J173Sxly', NULL, NULL, 'AP consultant and the #1 SAP instructor on Udemy.\n\nI hope you find my courses interesting and I really hope you enjoy them.', 'https://res.cloudinary.com/dev-empty/image/upload/v1661230727/rquq94qv4bpuvf7xnxyh.jpg', NULL, '+8801646295918', 'aed837d4-6237-4e9a-b7a3-22dfbb5ab9ad', '2022-08-16 05:25:46', NULL, NULL, NULL, NULL, NULL, NULL, 'instructor', 1, '2022-08-16 07:29:43', 1, 1, '2022-08-16 07:33:08', NULL, 'Register to Become an Intructor', 'Register to Become an Intructor', 1, 1, '2022-08-16 05:25:46', '2022-09-04 05:17:44');

-- --------------------------------------------------------

--
-- Structure de la table `videos`
--

DROP TABLE IF EXISTS `videos`;
CREATE TABLE IF NOT EXISTS `videos` (
  `id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `group_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `thumb` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `video` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `video_length` float DEFAULT NULL,
  `is_preview` tinyint(1) DEFAULT '0',
  `short_id` int NOT NULL DEFAULT '0',
  `assets_zip` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `userId` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `courseId` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `courseId` (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `videos`
--

INSERT INTO `videos` (`id`, `group_name`, `title`, `thumb`, `video`, `video_length`, `is_preview`, `short_id`, `assets_zip`, `userId`, `courseId`, `created_at`, `updated_at`) VALUES
('066c6c45-cb41-43d7-b7b8-3ed8aeb4477d', 'Introduction', 'Programming For Beginners', 'https://res.cloudinary.com/dev-empty/image/upload/v1660640937/wdyfkal8ixben5aalosn.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1660640934/jcjji9fsuiccbjiufkw3.mp4', 17.5, 1, 1, NULL, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', 'db24afee-e132-4be7-a7e7-0c411ccd41ca', '2022-08-16 09:08:57', '2022-08-16 09:08:57'),
('092b2d95-fbf9-428f-b690-5d6c74571edd', 'Introduction', 'Basic Programming', 'https://res.cloudinary.com/dev-empty/image/upload/v1660633890/snyxmtqc13ivp5uu8k7h.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1660633888/zey9eadfw6lnuo64zcbh.mp4', 13.723, 1, 1, NULL, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', 'd92f38eb-e616-414c-be0c-54e79a6809c7', '2022-08-16 07:11:30', '2022-08-16 07:11:30'),
('11aad455-945c-4ac1-9ff4-b56904afee4c', 'Project', 'Project Video', 'https://res.cloudinary.com/dev-empty/image/upload/v1660633959/wmp0xk23vaqmwfb7bvt3.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1660633957/sgkdeqyltqzizuatjigv.mp4', 15.182, 0, 2, NULL, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', 'd92f38eb-e616-414c-be0c-54e79a6809c7', '2022-08-16 07:12:40', '2022-08-16 07:12:40'),
('3a858fce-8795-4e9e-b8d4-7fe14e47863e', 'Introduction', 'Introduction', 'https://res.cloudinary.com/dev-empty/image/upload/v1660635409/r5tc5zabmmhagtr4w5wa.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1660635408/w2abrcwvisrbylga6hmb.mp4', 13.931, 1, 1, NULL, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '142a183d-45f1-4447-9aad-64f736471988', '2022-08-16 07:36:50', '2022-08-16 07:36:50'),
('3d1aa44d-7bd2-4abb-b22e-c657a6c2d692', 'Video 1', 'Intro', 'https://res.cloudinary.com/dtncca291/image/upload/v1675601351/index_nseaoi.jpg', 'https://res.cloudinary.com/dtncca291/video/upload/v1675601350/1_-_Course_Overview_tpytum.mp4', 61.9508, 1, 0, NULL, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', 'cff02b2f-57c1-4680-b8b1-7ff69d9a2141', '2023-02-05 12:49:11', '2023-02-05 12:49:11'),
('571fcdf8-a9b9-4b36-9a39-9bd67624703a', 'Introduction', 'Setting Priorities', 'https://res.cloudinary.com/dev-empty/image/upload/v1661246823/bgty9tt6hjzysv3watvf.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1661246821/gvwwerhv8bxzdusvvnad.mp4', 27.561, 0, 1, NULL, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', 'c5c6ee66-84df-46ee-b961-70a3ca173972', '2022-08-23 09:27:03', '2022-08-23 09:27:03'),
('6605e17d-3c26-4d01-9565-f59c9623f5e4', 'Introduction', 'Introduction', 'https://res.cloudinary.com/dev-empty/image/upload/v1660634707/d6rjplfgcmbnrjhaoeva.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1660634704/yhwecyta11b0puhwwkgo.mp4', 17.5, 0, 2, NULL, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '3118e959-37af-453b-889b-e3006446127a', '2022-08-16 07:25:08', '2022-08-16 07:25:08'),
('6afbf2b0-d5f5-405f-be5c-66aff4375d24', 'Introduction', 'Introduction, what you will learn and discover', 'https://res.cloudinary.com/dev-empty/image/upload/v1661246579/pzoul4zxymhwsvgpk1vc.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1661246576/s9rkqxyds8j1eqfq7rik.mp4', 3.737, 1, 1, NULL, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '410d35f5-2fa9-456a-8f8b-0599c1eb45e1', '2022-08-23 09:22:59', '2022-08-23 09:22:59'),
('728f13d3-9116-4b14-984c-0871342fa162', 'Diet Plan Example for Men', 'Diet Plan Example for Men', 'https://res.cloudinary.com/dev-empty/image/upload/v1661321596/krxhp6htpzxbi8rt1g3d.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1661321594/jhkj9brhuzwqqtnllo2v.mp4', 3.737, 1, 1, NULL, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '5335b72b-5ba5-4e55-9f04-bfb0e7f7d39f', '2022-08-24 06:13:17', '2022-08-24 06:13:17'),
('7e0cfbd8-1292-44b1-a93a-0834052422fc', 'Introduction', 'SAP ABAP', 'https://res.cloudinary.com/dev-empty/image/upload/v1660640995/knb0egtwurtagre0c2bn.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1660640994/my3ryeymr8dzhiacrbh8.mp4', 7.524, 0, 2, NULL, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', 'db24afee-e132-4be7-a7e7-0c411ccd41ca', '2022-08-16 09:09:56', '2022-08-16 09:09:56'),
('7ecba8e0-92d3-4d55-a874-a0bca9038418', 'Accounting and Finance', 'Accounting and Finance', 'https://res.cloudinary.com/dev-empty/image/upload/v1660634657/gdhfodxucmkdwqmmj6fe.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1660634655/fw0ku9yccybda9u9c6gy.mp4', 11.762, 1, 1, NULL, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '3118e959-37af-453b-889b-e3006446127a', '2022-08-16 07:24:17', '2022-08-16 07:24:17'),
('895fac47-e731-412c-a947-27fb489ef818', 'Introduction', 'Key 2 Ownership', 'https://res.cloudinary.com/dev-empty/image/upload/v1661246643/jolpp4lrgckmyyb9gsmd.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1661246641/nialxz7ppsdfozlrkdpk.mp4', 15.549, 0, 2, NULL, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '410d35f5-2fa9-456a-8f8b-0599c1eb45e1', '2022-08-23 09:24:03', '2022-08-23 09:24:03'),
('89ba4507-e450-473e-b82c-1bf86f927ff5', 'From assessment to action Agile leadership', 'From assessment to action Agile leadership', 'https://res.cloudinary.com/dev-empty/image/upload/v1661321328/g6pdnywxtkr4gi5aqsqo.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1661321326/nsrvkzi4dxz2tyqqihey.mp4', 15.549, 1, 1, NULL, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', 'a4417872-960c-4d9d-9b4c-b05bbc9c4c01', '2022-08-24 06:08:49', '2022-08-24 06:08:49'),
('8b2ce5c0-232a-4441-896b-d78fe64bc17f', 'Introduction', 'Basic business idea', 'https://res.cloudinary.com/dev-empty/image/upload/v1660634228/z9y1sljcm4akckkn1n1w.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1660634226/lnmkkzzprveknhdv4mz8.mp4', 17.5, 1, 1, NULL, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', 'a06444c4-037f-4787-ba5f-9d28a8f1f4e1', '2022-08-16 07:17:08', '2022-08-16 07:17:08'),
('9bd8d2a6-8c9f-482a-bb11-bdc83fcf6e3a', 'Before We Begin', 'Before We Begin', 'https://res.cloudinary.com/dev-empty/image/upload/v1661322036/ifsvlvrm0leoct92zhwo.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1661322032/jkoszozrilpyne8mn65i.mp4', 16.7033, 1, 1, NULL, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '742d231f-2d5b-42b6-993e-1edeba676f45', '2022-08-24 06:20:37', '2022-08-24 06:20:37'),
('a7aad65e-568b-4e09-ac2f-6a23b5640c06', 'Introduction', 'Installing VirtualBox on Intel-Based Macs', 'https://res.cloudinary.com/dev-empty/image/upload/v1661246261/aiuyy5fu09gzt4c4jtrj.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1661246259/uomy6a0qysnmgicbb6lv.mp4', 13.931, 0, 3, NULL, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '130bcd58-0650-4efe-a401-dc949373c699', '2022-08-23 09:17:42', '2022-08-23 09:17:42'),
('a8aec4be-707b-410d-a887-ad33d660d1ac', 'Introduction', 'Course introduction', 'https://res.cloudinary.com/dev-empty/image/upload/v1661320758/zlllw1oqwpzoc8cjfxtz.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1661320753/umpgo4hxrxpst5fddnik.mp4', 15.182, 1, 1, NULL, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '72a7266e-ba51-42ea-bfc2-4ba9aaa262e2', '2022-08-24 05:59:19', '2022-08-24 05:59:19'),
('bbe49bf9-86a0-41b9-9ec1-b4f7ef966e7c', 'Introduction 2', 'Introduction 2', 'https://res.cloudinary.com/dev-empty/image/upload/v1661317924/nkxupqaykiyns4q5pft9.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1661317921/ryn66wyo1uqcfjfsgbh5.mp4', 15.182, 0, 0, NULL, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '142a183d-45f1-4447-9aad-64f736471988', '2022-08-24 05:12:05', '2022-08-24 05:12:05'),
('bf3be034-ef30-47c0-afe3-75f2fa15e09c', 'Introduction', 'Introduction', 'https://res.cloudinary.com/dev-empty/image/upload/v1661246119/polfjt273mrfivldozwf.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1661246117/bbwy7trp6707pwcbzxow.mp4', 13.723, 1, 1, NULL, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '130bcd58-0650-4efe-a401-dc949373c699', '2022-08-23 09:15:19', '2022-08-23 09:15:19'),
('d0ebd79e-08f2-40db-89b2-703f886a7e9d', 'Introduction', 'Lenux Distributions', 'https://res.cloudinary.com/dev-empty/image/upload/v1661246202/s96gtx40hjsdvmmuz7tv.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1661246197/j0l1gvvlcwstb2pxjay6.mp4', 15.182, 0, 2, NULL, '89aeed13-5b6e-4e0d-84af-a24793a83cd7', '130bcd58-0650-4efe-a401-dc949373c699', '2022-08-23 09:16:42', '2022-08-23 09:16:42'),
('f2587d22-96e2-4349-ae57-60d907b2a500', 'Benefits of exercise', 'Benefits of exercise', 'https://res.cloudinary.com/dev-empty/image/upload/v1661321832/lrkg87blmrq17ywjxjpt.jpg', 'https://res.cloudinary.com/dev-empty/video/upload/v1661321830/y3xopkmxg7kvwtjhftt8.mp4', 8.171, 1, 1, NULL, 'ee2ddc7c-08ec-430b-afd0-4da0184bcc4c', '308cdeb3-b61f-4fca-a139-9bb219282dd3', '2022-08-24 06:17:12', '2022-08-24 06:17:12');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`catId`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `course_assets`
--
ALTER TABLE `course_assets`
  ADD CONSTRAINT `course_assets_ibfk_1` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `course_progresses`
--
ALTER TABLE `course_progresses`
  ADD CONSTRAINT `course_progresses_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_progresses_ibfk_2` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_progresses_ibfk_3` FOREIGN KEY (`videoId`) REFERENCES `videos` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `enrolments`
--
ALTER TABLE `enrolments`
  ADD CONSTRAINT `enrolments_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrolments_ibfk_2` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `favourites`
--
ALTER TABLE `favourites`
  ADD CONSTRAINT `favourites_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favourites_ibfk_2` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `instructor_earnings`
--
ALTER TABLE `instructor_earnings`
  ADD CONSTRAINT `instructor_earnings_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `instructor_earnings_ibfk_2` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `videos_ibfk_2` FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
