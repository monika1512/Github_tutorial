-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 12, 2019 at 10:05 AM
-- Server version: 5.7.25-0ubuntu0.18.04.2
-- PHP Version: 7.0.33-6+ubuntu18.04.1+deb.sury.org+3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ci_oracle`
--

-- --------------------------------------------------------

--
-- Table structure for table `activerecurringcharges`
--

CREATE TABLE `activerecurringcharges` (
  `id` int(11) NOT NULL,
  `store` int(11) NOT NULL,
  `charge_id` bigint(64) NOT NULL,
  `name` varchar(128) NOT NULL,
  `api_client_id` varchar(64) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` varchar(128) NOT NULL,
  `return_url` varchar(512) NOT NULL,
  `billing_on` varchar(64) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `test` int(11) NOT NULL,
  `activated_on` date NOT NULL,
  `trial_ends_on` date NOT NULL,
  `cancelled_on` varchar(64) DEFAULT NULL,
  `trial_days` varchar(64) NOT NULL,
  `decorated_return_url` varchar(512) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cronsync`
--

CREATE TABLE `cronsync` (
  `id` int(11) NOT NULL,
  `store` int(11) NOT NULL,
  `taskname` varchar(255) NOT NULL,
  `tasksyncno` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cronsync`
--

INSERT INTO `cronsync` (`id`, `store`, `taskname`, `tasksyncno`) VALUES
(1, 1, 'order', 202),
(2, 1, 'customer', 0),
(3, 2, 'order', 0),
(4, 2, 'customer', 0),
(5, 3, 'order', 0),
(6, 3, 'customer', 0),
(7, 4, 'order', 0),
(8, 4, 'customer', 0);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `store` int(11) NOT NULL,
  `email` varchar(512) NOT NULL,
  `shopifyid` varchar(512) NOT NULL,
  `shopifyaddressid` varchar(512) NOT NULL,
  `filename` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customersyncerror`
--

CREATE TABLE `customersyncerror` (
  `id` int(11) NOT NULL,
  `store` int(11) NOT NULL,
  `csvorderid` varchar(255) NOT NULL,
  `email` varchar(512) NOT NULL,
  `csvrowid` bigint(20) NOT NULL,
  `error` text NOT NULL,
  `filename` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `address1` text,
  `address2` text,
  `city` varchar(100) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `zipcode` varchar(28) DEFAULT NULL,
  `phone` varchar(28) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `province_code` varchar(10) DEFAULT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `country_name` varchar(100) DEFAULT NULL,
  `defaultaddress` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer_data`
--

CREATE TABLE `customer_data` (
  `id` bigint(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address1` text,
  `address2` text,
  `city` varchar(100) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `zipcode` varchar(28) DEFAULT NULL,
  `country_name` varchar(100) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `custo_bdate` varchar(255) DEFAULT NULL,
  `custo_title` varchar(255) DEFAULT NULL,
  `custo_gender` varchar(255) DEFAULT NULL,
  `custo_skintype` varchar(255) DEFAULT NULL,
  `custo_area_concern` varchar(255) DEFAULT NULL,
  `custo_issue_concern` varchar(255) DEFAULT NULL,
  `accepts_marketing` varchar(10) DEFAULT NULL,
  `orders_count` int(11) NOT NULL,
  `state` varchar(50) NOT NULL,
  `total_spent` double NOT NULL,
  `last_order_id` bigint(20) DEFAULT NULL,
  `note` text,
  `verified_email` varchar(50) NOT NULL,
  `multipass_identifier` varchar(255) DEFAULT NULL,
  `tax_exempt` varchar(10) NOT NULL,
  `tags` text NOT NULL,
  `last_order_name` varchar(15) DEFAULT NULL,
  `currency` varchar(10) NOT NULL,
  `address_id` bigint(20) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `province_code` varchar(10) DEFAULT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `defaultaddress` tinyint(4) DEFAULT NULL,
  `syncpage` int(11) NOT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_data`
--

INSERT INTO `customer_data` (`id`, `email`, `phone`, `address1`, `address2`, `city`, `province`, `zipcode`, `country_name`, `company`, `first_name`, `last_name`, `custo_bdate`, `custo_title`, `custo_gender`, `custo_skintype`, `custo_area_concern`, `custo_issue_concern`, `accepts_marketing`, `orders_count`, `state`, `total_spent`, `last_order_id`, `note`, `verified_email`, `multipass_identifier`, `tax_exempt`, `tags`, `last_order_name`, `currency`, `address_id`, `country`, `name`, `province_code`, `country_code`, `defaultaddress`, `syncpage`, `created_at`, `updated_at`) VALUES
(1389628686395, 'tc4250willpenn@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Thomas', 'Combs', '', '', '', '', '', NULL, '0', 0, 'enabled', 0, NULL, NULL, '0', NULL, '0', 'newsletter', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-04-02T22:46:31-07:00', '2019-04-02T23:02:59-07:00'),
(1389367951419, 'liangliangchen7@gmail.com', NULL, '2677 South Woodland Boulevard', '', 'DeLand', 'Florida', '32720', 'United States', NULL, 'Tiffany', 'Chen', '', '', '', '', '', NULL, '0', 1, 'disabled', 71.88, 1042655248443, NULL, '1', NULL, '0', '', '#IHF163788', 'USD', 1522866454587, 'United States', 'Wendy  Hong', 'FL', 'US', 1, 1, '2019-04-02T19:22:58-07:00', '2019-04-02T19:25:36-07:00'),
(1389350322235, 'pahampton@outlook.com', NULL, '220 old clinton rd ', '514', 'Gray', 'Georgia', '31032', 'United States', NULL, 'Peggy', 'Hampton', '', '', '', '', '', NULL, '1', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1522852069435, 'United States', 'Peggy Hampton', 'GA', 'US', 1, 1, '2019-04-02T19:11:37-07:00', '2019-04-02T19:11:37-07:00'),
(1389186220091, 'muratyercel@gmail.com', NULL, '1725 Wicomico Court', '', 'Virginia Beach', 'Virginia', '23464', 'United States', NULL, 'Murat', 'Yercel', '', '', '', '', '', NULL, '1', 1, 'disabled', 374.64, 1042525356091, NULL, '1', NULL, '0', '', '#IHF163786', 'USD', 1522711560251, 'United States', 'Murat Yercel', 'VA', 'US', 1, 1, '2019-04-02T17:33:49-07:00', '2019-04-02T17:35:44-07:00'),
(1389181206587, 'georgejanieingram@gmail.com', NULL, '128 Meadow Ln', '', 'Abilene', 'Texas', '79602', 'United States', '', 'George', 'Ingram', '', '', '', '', '', NULL, '1', 1, 'disabled', 48.41, 1042522767419, NULL, '1', NULL, '0', '', '#IHF163785', 'USD', 1522708414523, 'United States', 'George Ingram', 'TX', 'US', 1, 1, '2019-04-02T17:31:22-07:00', '2019-04-02T17:33:00-07:00'),
(1388997050427, 'robertmcqueen1172@yahoo.com', NULL, '63 Dale Ave', '', 'Hempstead', 'New York', '11550', 'United States', '', 'Robert', 'Mcqueen', '', '', '', '', '', NULL, '0', 1, 'disabled', 149.82, 1042413125691, NULL, '1', NULL, '0', '', '#IHF163783', 'USD', 1522582913083, 'United States', 'Robert Mcqueen', 'NY', 'US', 1, 1, '2019-04-02T16:01:18-07:00', '2019-04-02T16:03:10-07:00'),
(1388992626747, 'mariaberry97@gmail.com', NULL, '28 Estrella Vista Dr', '', 'Tijeras', 'New Mexico', '87059', 'United States', NULL, 'MARIA', 'BERRY', '', '', '', '', '', NULL, '0', 1, 'disabled', 60, 1042410045499, NULL, '1', NULL, '0', '', '#IHF163782', 'USD', 1522579374139, 'United States', 'MARIA BERRY', 'NM', 'US', 1, 1, '2019-04-02T15:58:51-07:00', '2019-04-02T16:01:07-07:00'),
(1388938526779, 'marino1stphilly@gmail.com', NULL, '25 Wood St', '2F', 'Garfield', 'New Jersey', '07026', 'United States', '', 'Jeanne', 'Marino', '', '', '', '', '', NULL, '1', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1522535497787, 'United States', 'Jeanne Marino', 'NJ', 'US', 1, 1, '2019-04-02T15:26:54-07:00', '2019-04-02T15:29:06-07:00'),
(1388922830907, 'clintonjulian311@gmail.com', NULL, '87 Smith St.', '3', 'Fall River', 'Massachusetts', '02721', 'United States', NULL, 'Julian', 'Clinton', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1522522390587, 'United States', 'Julian Clinton', 'MA', 'US', 1, 1, '2019-04-02T15:17:42-07:00', '2019-04-02T15:17:42-07:00'),
(1388876398651, 'yueamyliu@gmail.com', NULL, '6510 Clawson St', '', 'Houston', 'Texas', '77055', 'United States', NULL, 'yue', 'liu', '', '', '', '', '', NULL, '0', 1, 'disabled', 60, 1042324717627, NULL, '1', NULL, '0', '', '#IHF163780', 'USD', 1522485067835, 'United States', 'yue liu', 'TX', 'US', 1, 1, '2019-04-02T14:51:43-07:00', '2019-04-02T14:53:13-07:00'),
(1388821872699, 'geimer.colon@sbcglobal.net', NULL, '12214 Old Stillwater', '', 'San Antonio', 'Texas', '78254', 'United States', NULL, 'Geimer', 'Colon', '', '', '', '', '', NULL, '0', 1, 'disabled', 34.91, 1042283266107, NULL, '1', NULL, '0', '', '#IHF163779', 'USD', 1522439028795, 'United States', 'Geimer Colon', 'TX', 'US', 1, 1, '2019-04-02T14:21:04-07:00', '2019-04-02T14:21:53-07:00'),
(1388753977403, 'tazhielyn@gmail.com', NULL, '412 Main Ave N', '', 'Roseau', 'Minnesota', '56751-1825', 'United States', NULL, 'Heather', 'Dahl', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1522390597691, 'United States', 'Heather Dahl', 'MN', 'US', 1, 1, '2019-04-02T13:53:58-07:00', '2019-04-02T13:53:58-07:00'),
(1388671041595, 'gpaysnoe@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Gregory', 'Paysnoe', '', '', '', '', '', NULL, '0', 0, 'enabled', 0, NULL, NULL, '0', NULL, '0', '', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-04-02T13:17:57-07:00', '2019-04-02T13:17:57-07:00'),
(1388601475131, 'ivkovic@shaw.ca', NULL, '18388 Chaparral St. SE', '', 'Calgary', 'Alberta', 'T2X3K9', 'Canada', NULL, 'Vesna', 'Ivkovic', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1522264145979, 'Canada', 'Vesna Ivkovic', 'AB', 'CA', 1, 1, '2019-04-02T12:41:39-07:00', '2019-04-02T12:41:39-07:00'),
(1388513755195, 'bwisssbaum@cox.net', NULL, '301 W. G. Street, #322', '#322', 'San Diego', 'California', '92101', 'United States', NULL, 'Becky', 'Wissbaum', '', '', '', '', '', NULL, '1', 1, 'disabled', 79.99, 1042062737467, NULL, '1', NULL, '0', '', '#IHF163774', 'USD', 1522192547899, 'United States', 'Becky Wissbaum', 'CA', 'US', 0, 1, '2019-04-02T11:58:11-07:00', '2019-04-02T12:00:30-07:00'),
(1388475383867, 'clevr4@gmail.com', NULL, '8727 Mallard Circle', '', 'North Ridgeville', 'Ohio', '44039', 'United States', NULL, 'carol', 'wittkopf', '', '', '', '', '', NULL, '0', 1, 'disabled', 42.92, 1042039308347, NULL, '1', NULL, '0', '', '#IHF163773', 'USD', 1522159288379, 'United States', 'carol wittkopf', 'OH', 'US', 1, 1, '2019-04-02T11:39:16-07:00', '2019-04-02T11:45:13-07:00'),
(1388367740987, 'leebshun@gmail.com', NULL, '3051 Crape Myrtle Circle, Chino Hills, CA, USA', '', 'Chino Hills', 'California', '91709-4236', 'United States', NULL, 'Sandy', 'Keays', '', '', '', '', '', NULL, '0', 1, 'disabled', 42.92, 1041955749947, NULL, '1', NULL, '0', '', '#IHF163772', 'USD', 1522070782011, 'United States', 'Sandy Keays', 'CA', 'US', 1, 1, '2019-04-02T10:45:46-07:00', '2019-04-02T10:46:40-07:00'),
(1388358500411, 'nell.capers@yahoo.com', NULL, '20 Audubon Drive', '', 'Asheville', 'North Carolina', '28804', 'United States', NULL, 'Nell', 'Capers', '', '', '', '', '', NULL, '0', 1, 'disabled', 44.9, 1041945133115, NULL, '1', NULL, '0', '', '#IHF163770', 'USD', 1522063573051, 'United States', 'Nell Capers', 'NC', 'US', 1, 1, '2019-04-02T10:41:52-07:00', '2019-04-02T10:42:25-07:00'),
(1388346376251, 'bvbireta@gmail.com', NULL, '42210 Tennessee Ave', '', '', 'California', '92211', 'United States', '', 'Vytautas S', 'Bireta', '', '', '', '', '', NULL, '0', 1, 'disabled', 232.23, 1041952669755, NULL, '1', NULL, '0', '', '#IHF163771', 'USD', 1522055118907, 'United States', 'Raymond R Simanazicius', 'CA', 'US', 0, 1, '2019-04-02T10:36:47-07:00', '2019-04-02T10:45:24-07:00'),
(1388327010363, 'lindafreeman667@yahoo.com', NULL, '8877 LAKES AT 610 DR ', 'APT 149  ', 'HOUSTON', 'Texas', '77054', 'United States', '', 'Linda', 'Freeman', '', '', '', '', '', NULL, '0', 1, 'disabled', 43.91, 1041920393275, NULL, '1', NULL, '0', '', '#IHF163769', 'USD', 1522040897595, 'United States', 'Linda Freeman', 'TX', 'US', 1, 1, '2019-04-02T10:28:15-07:00', '2019-04-02T10:30:23-07:00'),
(1388273270843, 'bfa@longlane.com', NULL, '61 S Beach Rd', '', 'Hobe Sound', 'Florida', '33455', 'United States', '', 'Elisabeth', 'Allen', '', '', '', '', '', NULL, '0', 1, 'disabled', 202.27, 1041869307963, NULL, '1', NULL, '0', '', '#IHF163767', 'USD', 1522001477691, 'United States', 'Elisabeth Allen', 'FL', 'US', 1, 1, '2019-04-02T10:06:26-07:00', '2019-04-02T10:09:23-07:00'),
(1388198068283, 'sboyer14@HOTMAIL.COM', NULL, '4519 eastland ave', '', 'louisville', 'Ohio', '44641', 'United States', NULL, 'sherry', 'boyer', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1521951047739, 'United States', 'sherry boyer', 'OH', 'US', 1, 1, '2019-04-02T09:38:14-07:00', '2019-04-02T09:38:14-07:00'),
(1388191383611, 'anthonysorianom@gmail.com', NULL, ' 420 The Parkway', 'BLDG F FLR 1', 'Greer', 'South Carolina', '29650', 'United States', '', 'Anthony', 'Soriano', '', '', '', '', '', NULL, '1', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1521946099771, 'United States', 'Anthony Soriano', 'SC', 'US', 1, 1, '2019-04-02T09:35:03-07:00', '2019-04-02T09:35:03-07:00'),
(1388140789819, 'eppdawg@gmail.com', NULL, '232 Manhattan LN', '', 'Hamilton', 'Montana', '59840', 'United States', NULL, 'Randy', 'Eppinger', '', '', '', '', '', NULL, '0', 1, 'disabled', 39.43, 1041750065211, NULL, '1', NULL, '0', '', '#IHF163765', 'USD', 1521911562299, 'United States', 'Randy Eppinger', 'MT', 'US', 1, 1, '2019-04-02T09:15:04-07:00', '2019-04-02T09:17:12-07:00'),
(1388121063483, '7152129930@noemail.com', NULL, '259 Lincoln Dr', '', 'Athens', 'Wisconsin', '54411', 'United States', '', 'Greg', 'Ollhoff', '', '', '', '', '', NULL, '0', 1, 'disabled', 48.41, 1041730863163, NULL, '1', NULL, '0', '', '#IHF163764', 'USD', 1521896685627, 'United States', 'Greg Ollhoff', 'WI', 'US', 1, 1, '2019-04-02T09:06:37-07:00', '2019-04-02T09:08:34-07:00'),
(1388021678139, 'marilyspena30@gmail.com', NULL, '52-28 73rd Street', 'Fl 2', 'Queens', 'New York', '11378', 'United States', NULL, 'Marilys', 'Huarachi', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1521813979195, 'United States', 'Marilys Huarachi', 'NY', 'US', 1, 1, '2019-04-02T08:16:09-07:00', '2019-04-02T08:16:09-07:00'),
(1387890409531, 'shaunagh_b@yahoo.com', NULL, '20955 89th Street', '', 'Bend', 'Oregon', '97703', 'United States', NULL, 'Shaunagh', 'Bedford', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1521685823547, 'United States', 'Shaunagh Bedford', 'OR', 'US', 1, 1, '2019-04-02T06:59:14-07:00', '2019-04-02T06:59:14-07:00'),
(1387841060923, 'analuciavz@gmail.com', NULL, '24527 Cliff Line', '', 'San Antonio', 'Texas', '78257', 'United States', NULL, 'Ana', 'Villasenor', '', '', '', '', '', NULL, '0', 1, 'disabled', 149.75, 1041344856123, NULL, '1', NULL, '0', '', '#IHF163756', 'USD', 1521638998075, 'United States', 'Ana Villasenor', 'TX', 'US', 1, 1, '2019-04-02T06:30:38-07:00', '2019-04-02T06:31:58-07:00'),
(1387838636091, 'charliemacaluso1@gmail.com', NULL, '534 San Juan Drive', '', 'Toms River', 'New Jersey', '08753', 'United States', NULL, 'Charlie', 'Macaluso', '', '', '', '', '', NULL, '0', 1, 'disabled', 42.92, 1041341022267, NULL, '1', NULL, '0', '', '#IHF163755', 'USD', 1521636671547, 'United States', 'Charlie Macaluso', 'NJ', 'US', 1, 1, '2019-04-02T06:29:19-07:00', '2019-04-02T06:30:30-07:00'),
(1387822547003, 'KEITHSLS1@HOTMAIL.COM', NULL, '633 KISTLER RD', '', 'ELLIOTTSBURG', 'Pennsylvania', '17024', 'United States', NULL, 'keith', 'schlegel', '', '', '', '', '', NULL, '0', 1, 'disabled', 52.9, 1041324146747, NULL, '1', NULL, '0', '', '#IHF163754', 'USD', 1521621139515, 'United States', 'keith schlegel', 'PA', 'US', 1, 1, '2019-04-02T06:19:47-07:00', '2019-04-02T06:23:03-07:00'),
(1387703763003, 'ar.sosa7@gmail.com', NULL, '7909 Tennyson St. NE', '', 'Albuquerque', 'New Mexico', '87122', 'United States', '', 'Anthony', 'Sosa', '', '', '', '', '', NULL, '1', 1, 'disabled', 48.41, 1041149329467, NULL, '1', NULL, '0', '', '#IHF163753', 'USD', 1521509597243, 'United States', 'Anthony Sosa', 'NM', 'US', 1, 1, '2019-04-02T05:04:07-07:00', '2019-04-02T05:08:14-07:00'),
(1387564269627, 'pmrsinc@yahoo.com', NULL, '1169 Carlyon Rd', '', 'East Cleveland', 'Ohio', '44112', 'United States', '', 'Anthony', 'Thomas', '', '', '', '', '', NULL, '0', 1, 'enabled', 183.52, 1041438146619, NULL, '0', NULL, '0', '', '#IHF163759', 'USD', 1521701683259, 'United States', 'Anthony Thomas', 'OH', 'US', 1, 1, '2019-04-02T03:15:36-07:00', '2019-04-02T07:08:26-07:00'),
(1387559682107, 'shantinaterry@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, '1', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', 'newsletter', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-04-02T03:12:14-07:00', '2019-04-02T03:12:14-07:00'),
(1387382276155, 'lawrence_101@bigpond.com', NULL, '24 The Southern Parkway', '', 'Forster', 'New South Wales', '2428', 'Australia', NULL, 'Lawrence', 'Sinclair', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1521222942779, 'Australia', 'Lawrence Sinclair', 'NSW', 'AU', 1, 1, '2019-04-01T23:58:13-07:00', '2019-04-01T23:58:13-07:00'),
(1387362844731, 'wrijulie@gmail.com', NULL, '39 Moruben Road', 'Unit 1', 'Mosman', 'New South Wales', '2088', 'Australia', NULL, 'Julie', 'Wright', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1521204199483, 'Australia', 'Julie Wright', 'NSW', 'AU', 1, 1, '2019-04-01T23:35:52-07:00', '2019-04-01T23:35:52-07:00'),
(1387337351227, 'julieagraves1@gmail.com', NULL, '61 meadowstone dr', '', 'troy', 'Missouri', '63379', 'United States', NULL, 'Julie', 'Graves', '', '', '', '', '', NULL, '0', 1, 'disabled', 52.9, 1040561995835, NULL, '1', NULL, '0', '', '#IHF163750', 'USD', 1521180016699, 'United States', 'Julie Graves', 'MO', 'US', 1, 1, '2019-04-01T23:07:43-07:00', '2019-04-01T23:09:36-07:00'),
(1387004624955, 'alyeancar03@gmail.com', NULL, '311 North Marian Street', '', 'La Habra', 'California', '90631', 'United States', NULL, 'Marcela', 'Ramirez', '', '', '', '', '', NULL, '1', 1, 'disabled', 47.9, 1040301981755, NULL, '1', NULL, '0', '', '#IHF163749', 'USD', 1520859873339, 'United States', 'Marcela Ramirez', 'CA', 'US', 1, 1, '2019-04-01T20:18:58-07:00', '2019-04-01T20:24:30-07:00'),
(1386994368571, 'Verena@theserviceadvisors.com', NULL, '931 Ednuel St', '', 'Arcadia', 'California', '91006', 'United States', NULL, 'Verena', 'Somer', '', '', '', '', '', NULL, '0', 1, 'disabled', 78.4, 1040288022587, NULL, '1', NULL, '0', '', '#IHF163748', 'USD', 1520850370619, 'United States', 'Verena Somer', 'CA', 'US', 1, 1, '2019-04-01T20:11:41-07:00', '2019-04-01T20:13:51-07:00'),
(1386932142139, 'jackie@thefurnituredoctors.com', NULL, '15267 North Hwy 41', '', 'Rathdrum', 'Idaho', '83858', 'United States', '', 'Jackie', 'Malinauskas', '', '', '', '', '', NULL, '1', 1, 'disabled', 149.82, 1040226811963, NULL, '1', NULL, '0', '', '#IHF163747', 'USD', 1520787423291, 'United States', 'Jackie Malinauskas', 'ID', 'US', 1, 1, '2019-04-01T19:26:08-07:00', '2019-04-01T19:27:46-07:00'),
(1386843603003, 'rocksa43@yahoo.com', NULL, '26431 Bubbling Brook', '', 'San Antonio', 'Texas', '78260', 'United States', NULL, 'Shelia', 'Lloyd', '', '', '', '', '', NULL, '0', 1, 'disabled', 64, 1040139976763, NULL, '1', NULL, '0', '', '#IHF163745', 'USD', 1520695410747, 'United States', 'Shelia Lloyd', 'TX', 'US', 1, 1, '2019-04-01T18:19:40-07:00', '2019-04-01T18:23:54-07:00'),
(1386835083323, 'cathyevebeckman@gmail.com', NULL, '6902 Premier Drive', '', 'Charlotte', 'North Carolina', '28277', 'United States', NULL, 'Cathy', 'Beckman', '', '', '', '', '', NULL, '0', 1, 'enabled', 72, 1040137093179, NULL, '0', NULL, '0', '', '#IHF163744', 'USD', 1520697573435, 'United States', 'Cathy Beckman', 'NC', 'US', 1, 1, '2019-04-01T18:13:35-07:00', '2019-04-01T18:21:26-07:00'),
(1386802708539, 'jdalgleish1@gmail.com', NULL, '1968 Fox Trail Lane', '', 'Madison', 'Indiana', '47250', 'United States', NULL, 'John', 'Dalgleish', '', '', '', '', '', NULL, '0', 1, 'disabled', 60, 1040097214523, NULL, '1', NULL, '0', '', '#IHF163743', 'USD', 1520653991995, 'United States', 'John Dalgleish', 'IN', 'US', 1, 1, '2019-04-01T17:49:33-07:00', '2019-04-01T17:54:27-07:00'),
(1386738679867, 'lynnlander@hotmail.com', NULL, '505 East Palmer Circle', '', 'Aberdeen', 'South Dakota', '57401', 'United States', NULL, 'Lynn', 'Lander', '', '', '', '', '', NULL, '0', 1, 'disabled', 37.9, 1040034201659, NULL, '1', NULL, '0', '', '#IHF163742', 'USD', 1520590225467, 'United States', 'Lynn Lander', 'SD', 'US', 1, 1, '2019-04-01T17:04:03-07:00', '2019-04-01T17:06:18-07:00'),
(1386730389563, 'alfredolop_gar@yahoo.com', NULL, '24412 Neptune Ave', '', 'Carson', 'California', '90745', 'United States', NULL, 'Alfredo', 'Garcia', '', '', '', '', '', NULL, '0', 1, 'disabled', 64, 1040029777979, NULL, '1', NULL, '0', '', '#IHF163741', 'USD', 1520582492219, 'United States', 'Alfredo Garcia', 'CA', 'US', 1, 1, '2019-04-01T16:59:10-07:00', '2019-04-01T17:03:14-07:00'),
(1386643554363, '8585313980@noemail.com', NULL, '3592 McIntire Cir', '', 'Oceanside', 'California', '92056', 'United States', '', 'Chet', 'Adkins', '', '', '', '', '', NULL, '0', 1, 'disabled', 52.9, 1039958835259, NULL, '1', NULL, '1', '', '#IHF163740', 'USD', 1520509190203, 'United States', 'Chet Adkins', 'CA', 'US', 1, 1, '2019-04-01T16:03:36-07:00', '2019-04-01T16:06:13-07:00'),
(1386557079611, 'markgreathouse@yandex.com', NULL, '156 Fister Ct', '', 'Augusta', 'Georgia', '30909', 'United States', '', 'Mark', 'Greathouse', '', '', '', '', '', NULL, '0', 1, 'disabled', 43.82, 1039894708283, NULL, '1', NULL, '0', '', '#IHF163739', 'USD', 1520438018107, 'United States', 'Mark Greathouse', 'GA', 'US', 1, 1, '2019-04-01T15:16:46-07:00', '2019-04-01T15:18:52-07:00'),
(1386412474427, 'gerymeyer66@gmail.com', NULL, '4926 23rd Street', '', 'Port Arthur', 'Texas', '77642', 'United States', NULL, 'Gery', 'Meyer', '', '', '', '', '', NULL, '0', 1, 'disabled', 69.94, 1039708323899, NULL, '1', NULL, '0', '', '#IHF163738', 'USD', 1520287350843, 'United States', 'Gery Meyer', 'TX', 'US', 1, 1, '2019-04-01T13:51:14-07:00', '2019-04-01T13:57:50-07:00'),
(1386404347963, 'hoffman.dan.86@gmail.com', NULL, '3 Mill Road', 'Suite 202', 'Wilmington', 'Delaware', '19806', 'United States', NULL, 'Daniel', 'Hoffman', '', '', '', '', '', NULL, '0', 1, 'disabled', 42.92, 1039687155771, NULL, '1', NULL, '0', '', '#IHF163737', 'USD', 1520279027771, 'United States', 'Daniel Hoffman', 'DE', 'US', 1, 1, '2019-04-01T13:46:55-07:00', '2019-04-01T13:49:35-07:00'),
(1386355130427, 'tnmj850@gmail.com', NULL, '3534 Shawn Street', '', 'Punta Gorda', 'Florida', '33980', 'United States', NULL, 'Marcia', 'Jackson', '', '', '', '', '', NULL, '0', 1, 'disabled', 101.83, 1039625453627, NULL, '1', NULL, '0', '', '#IHF163736', 'USD', 1520229154875, 'United States', 'Marcia Jackson', 'FL', 'US', 1, 1, '2019-04-01T13:21:16-07:00', '2019-04-01T13:23:39-07:00'),
(1386270425147, 'ilonashorb@yahoo.com', NULL, '7465 E Tuckey Ln', '', 'Scottsdale', 'Arizona', '85250-4640', 'United States', NULL, 'ilona', 'shorb', '', '', '', '', '', NULL, '1', 1, 'disabled', 151.2, 1039503360059, NULL, '1', NULL, '0', '', '#IHF163733', 'USD', 1520137863227, 'United States', 'ilona shorb', 'AZ', 'US', 1, 1, '2019-04-01T12:36:31-07:00', '2019-04-01T12:37:19-07:00'),
(1386259546171, 'PACK885@HOTMAIL.COM', NULL, '108 FREDERICK CT', '', 'PITTSBURGH', 'Pennsylvania', '15227', 'United States', NULL, 'JEANNE', 'PACK', '', '', '', '', '', NULL, '0', 1, 'disabled', 64, 1039528034363, NULL, '1', NULL, '0', '', '#IHF163734', 'USD', 1520126459963, 'United States', 'JEANNE PACK', 'PA', 'US', 1, 1, '2019-04-01T12:31:00-07:00', '2019-04-01T12:47:14-07:00'),
(1386236280891, 'lizdeane@comcast.net', NULL, '804 Pine Village Ln', '', 'Naples', 'Florida', '34108', 'United States', '', 'Elizabeth', 'Deane', '', '', '', '', '', NULL, '0', 1, 'disabled', 43.82, 1039464071227, NULL, '1', NULL, '0', '', '#IHF163732', 'USD', 1520101425211, 'United States', 'Elizabeth  Deane', 'FL', 'US', 1, 1, '2019-04-01T12:18:27-07:00', '2019-04-01T12:21:51-07:00'),
(1386116448315, 'maudiemo1004@gmail.com', NULL, '7974 Sailboat Key Blvd S', '#305', 'South Pasadena', 'Florida', '33707', 'United States', NULL, 'Maude', 'Dougherty', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1519984312379, 'United States', 'Maude Dougherty', 'FL', 'US', 1, 1, '2019-04-01T11:18:11-07:00', '2019-04-01T11:18:11-07:00'),
(1386058809403, 'alamarlerma@gmail.com', NULL, '7922 S 67th Drive', '', 'Laveen', 'Arizona', '85339', 'United States', NULL, 'Alamar', 'Lerma', '', '', '', '', '', NULL, '0', 1, 'disabled', 47.9, 1042984370235, NULL, '1', NULL, '0', '', '#IHF163791', 'USD', 1519933095995, 'United States', 'Alamar Lerma', 'AZ', 'US', 1, 1, '2019-04-01T10:48:25-07:00', '2019-04-02T23:40:09-07:00'),
(1385918693435, 'obiepollet@gmail.com', NULL, '210 Rue Beaumont', '', 'Thibodaux', 'Louisiana', '70301', 'United States', NULL, 'Oscar', 'Pollet', '', '', '', '', '', NULL, '1', 1, 'disabled', 83.98, 1039159001147, NULL, '1', NULL, '0', '', '#IHF163730', 'USD', 1519822766139, 'United States', 'Oscar Pollet', 'LA', 'US', 1, 1, '2019-04-01T09:47:11-07:00', '2019-04-01T09:49:41-07:00'),
(1385838542907, 'mwk1127@frontier.com', NULL, 'p o box 122', '', 'Carbondale', 'Illinois', '62903', 'United States', NULL, 'Kevin', 'Kozlowski', '', '', '', '', '', NULL, '0', 1, 'enabled', 60, 1039095857211, NULL, '0', NULL, '0', '', '#IHF163729', 'USD', 1519754805307, 'United States', 'Kevin Kozlowski', 'IL', 'US', 1, 1, '2019-04-01T08:59:47-07:00', '2019-04-01T09:05:16-07:00'),
(1385787523131, 'tammyhyde@bellsouth.net', NULL, '100 Erwin Hill Road Southeast', '', 'Calhoun', 'Georgia', '30701', 'United States', NULL, 'richard', 'hyde', '', '', '', '', '', NULL, '0', 1, 'disabled', 42.45, 1039045886011, NULL, '1', NULL, '0', '', '#IHF163727', 'USD', 1519691792443, 'United States', 'richard hyde', 'GA', 'US', 1, 1, '2019-04-01T08:27:44-07:00', '2019-04-01T08:29:02-07:00'),
(1385785294907, 'ibelieveinlam@yahoo.com', NULL, '9 Maul Avenue', 'C', 'Felton', 'Pennsylvania', '17322', 'United States', NULL, 'Rebekah', 'Marshall', '', '', '', '', '', NULL, '0', 1, 'disabled', 97.77, 1039092908091, NULL, '1', NULL, '0', '', '#IHF163728', 'USD', 1519689334843, 'United States', 'Rebekah Marshall', 'PA', 'US', 1, 1, '2019-04-01T08:26:18-07:00', '2019-04-01T09:03:12-07:00'),
(1385730637883, 'sabadoob21@aol.com', NULL, '63 West Walnut Street', '', 'Farmingdale', 'New York', '11735', 'United States', NULL, 'James', 'Sabatelli', '', '', '', '', '', NULL, '0', 1, 'disabled', 39.43, 1038981398587, NULL, '1', NULL, '0', '', '#IHF163724', 'USD', 1519631302715, 'United States', 'James  Sabatelli ', 'NY', 'US', 1, 1, '2019-04-01T07:49:14-07:00', '2019-04-01T07:51:52-07:00'),
(1385730441275, 'cpchristinepetty@gmail.com', NULL, '1537 LAND RD  ', '', 'COLUMBUS ', 'Mississippi', '39705', 'United States', '', 'Christine', 'Petty', '', '', '', '', '', NULL, '1', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1519631106107, 'United States', 'Christine Petty', 'MS', 'US', 1, 1, '2019-04-01T07:48:57-07:00', '2019-04-01T07:49:59-07:00'),
(1385676570683, 'sandrahageman2379@yahoo.com', NULL, '2575 Bridle Trails Lane', '', 'Santa Maria', 'California', '93454', 'United States', NULL, 'Sandra', 'Hageman', '', '', '', '', '', NULL, '0', 1, 'disabled', 64, 1038924218427, NULL, '1', NULL, '0', '', '#IHF163722', 'USD', 1519573991483, 'United States', 'Sandra Hageman', 'CA', 'US', 1, 1, '2019-04-01T07:11:56-07:00', '2019-04-01T07:14:01-07:00'),
(1385545236539, 'dbdabomb@live.com', NULL, '115 Prosperity Ct ', '', 'Prosperity ', 'South Carolina', '29127', 'United States', NULL, 'Deanna', 'Bailey', '', '', '', '', '', NULL, '0', 1, 'disabled', 71.95, 1038747959355, NULL, '1', NULL, '0', '', '#IHF163719', 'USD', 1519435546683, 'United States', 'Deanna Bailey', 'SC', 'US', 1, 1, '2019-04-01T05:28:19-07:00', '2019-04-01T05:29:47-07:00'),
(1385461481531, 'ehmtysolo@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, '1', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', 'newsletter', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-04-01T04:10:39-07:00', '2019-04-01T04:10:39-07:00'),
(1385423241275, 'terribyrs@gmail.com', NULL, '341 Sand Bay Drive Southwest', '', 'Atlanta', 'Georgia', '30331', 'United States', NULL, 'Terri', 'Byers', '', '', '', '', '', NULL, '0', 1, 'disabled', 43.82, 1038558298171, NULL, '1', NULL, '0', '', '#IHF163717', 'USD', 1519316172859, 'United States', 'Terri Byers', 'GA', 'US', 1, 1, '2019-04-01T03:37:46-07:00', '2019-04-01T03:44:11-07:00'),
(1385387950139, 'headnsouth@gmail.com', NULL, '5625 Silk Oak Way', '', 'Sugar Hill', 'Georgia', '30518', 'United States', NULL, 'Pete', 'Weber', '', '', '', '', '', NULL, '1', 1, 'disabled', 39, 1038559150139, NULL, '1', NULL, '0', '', '#IHF163718', 'USD', 1519285403707, 'United States', 'Pete Weber', 'GA', 'US', 1, 1, '2019-04-01T03:01:55-07:00', '2019-04-01T03:44:38-07:00'),
(1385323561019, 'apple.rene.michelle@gmail.com', NULL, '742 Hickory Oak Holw', '', 'AUGUSTA', 'Georgia', '30907', 'United States', NULL, 'Michelle', 'Lang', '', '', '', '', '', NULL, '0', 1, 'disabled', 79.94, 1038377844795, NULL, '1', NULL, '0', '', '#IHF163716', 'USD', 1519223668795, 'United States', 'Michelle Lang', 'GA', 'US', 1, 1, '2019-04-01T01:47:14-07:00', '2019-04-01T01:51:39-07:00'),
(1385177645115, 'fmergele@stic.net', NULL, '2026 Oak Vista Street', '', 'San Antonio', 'Texas', '78232', 'United States', NULL, 'Fred', 'Mergele Jr', '', '', '', '', '', NULL, '0', 1, 'disabled', 119.85, 1038094794811, NULL, '1', NULL, '0', '', '#IHF163715', 'USD', 1519073984571, 'United States', 'Fred Mergele Jr', 'TX', 'US', 1, 1, '2019-03-31T22:47:22-07:00', '2019-03-31T22:49:50-07:00'),
(1385046868027, 'oldsaltdon@gmail.com', NULL, '26934 Stanley Drive', '', 'Beloit', 'Ohio', '44609', 'United States', NULL, 'Don', 'Novak', '', '', '', '', '', NULL, '0', 1, 'disabled', 95.88, 1037950353467, NULL, '1', NULL, '0', '', '#IHF163714', 'USD', 1518941634619, 'United States', 'Don Novak', 'OH', 'US', 1, 1, '2019-03-31T20:25:15-07:00', '2019-03-31T20:26:00-07:00'),
(1385010364475, 'dusanzrnic@sbcglobal.net', NULL, '204 Pine Tree Ln', '', 'Norman', 'Oklahoma', '73072', 'United States', NULL, 'Dusan', 'Zrnic', '', '', '', '', '', NULL, '0', 1, 'disabled', 43.91, 1037923254331, NULL, '1', NULL, '0', '', '#IHF163713', 'USD', 1518905327675, 'United States', 'Dusan Zrnic', 'OK', 'US', 1, 1, '2019-03-31T19:55:24-07:00', '2019-03-31T19:57:36-07:00'),
(1384975138875, 'gammytogabe@gmail.com', NULL, '6690 US Highway 61 S', '', 'Woodville', 'Mississippi', '39669', 'United States', NULL, 'Charlotte', 'Legendre', '', '', '', '', '', NULL, '0', 1, 'enabled', 131.14, 1037897793595, NULL, '0', NULL, '0', '', '#IHF163712', 'USD', 1518876622907, 'United States', 'Charlotte Legendre', 'MS', 'US', 1, 1, '2019-03-31T19:27:03-07:00', '2019-03-31T19:33:49-07:00'),
(1384900165691, 'tanyaholubchuk@gmail.com', NULL, '183 Madison Avenue', 'Suite 616', 'New York', 'New York', '10016', 'United States', NULL, 'Tetyana', 'Kravchuk', '', '', '', '', '', NULL, '0', 1, 'enabled', 71.91, 1037853327419, NULL, '1', NULL, '0', 'facebook, oxi_social_login', '#IHF163711', 'USD', 1518821539899, 'United States', 'Tetyana Kravchuk', 'NY', 'US', 1, 1, '2019-03-31T18:30:48-07:00', '2019-03-31T18:51:56-07:00'),
(1384808480827, 'bob_martin@lord.com', NULL, '5102 Dixson Drive', '', 'Erie', 'Pennsylvania', '16509', 'United States', NULL, 'Robert', 'Martin', '', '', '', '', '', NULL, '0', 1, 'disabled', 47.9, 1037694042171, NULL, '1', NULL, '0', '', '#IHF163708', 'USD', 1518692040763, 'United States', 'Robert Martin', 'PA', 'US', 1, 1, '2019-03-31T17:26:37-07:00', '2019-03-31T17:27:54-07:00'),
(1384747237435, 'laurenpecora3@gmail.com', NULL, '2-19 147th Place. Whitestone, NY. 11357', '', 'Whitestone ', 'New York', '11357', 'United States', NULL, 'Lauren', 'Pecora', '', '', '', '', '', NULL, '0', 1, 'disabled', 72, 1037607272507, NULL, '1', NULL, '0', '', '#IHF163707', 'USD', 1518622146619, 'United States', 'Lauren Pecora', 'NY', 'US', 1, 1, '2019-03-31T16:54:54-07:00', '2019-03-31T16:57:08-07:00'),
(1384634974267, 'lstreet08@yahoo.com', NULL, '13331 North Macarthur Boulevard', '111', 'Oklahoma City', 'Oklahoma', '73142', 'United States', NULL, 'Logan', 'Street', '', '', '', '', '', NULL, '0', 1, 'disabled', 69.94, 1037437829179, NULL, '1', NULL, '0', '', '#IHF163705', 'USD', 1518513193019, 'United States', 'Logan Street', 'OK', 'US', 1, 1, '2019-03-31T15:38:06-07:00', '2019-03-31T15:39:20-07:00'),
(1384626880571, 'nathanbutler01@gmail.com', NULL, '106 Laib Ln', '7', 'Sneads Ferry', 'North Carolina', '28460', 'United States', NULL, 'Nathaniel', 'Butler', '', '', '', '', '', NULL, '0', 1, 'disabled', 34.91, 1037424984123, NULL, '1', NULL, '0', '', '#IHF163704', 'USD', 1518504640571, 'United States', 'Nathaniel Butler', 'NC', 'US', 1, 1, '2019-03-31T15:32:43-07:00', '2019-03-31T15:33:05-07:00'),
(1384609087547, 'ejdearing@gmail.com', NULL, '629 Peacehaven Road', '', 'Kannapolis', 'North Carolina', '28083', 'United States', NULL, 'Jane', 'Dearing', '', '', '', '', '', NULL, '0', 1, 'disabled', 60, 1037413711931, NULL, '1', NULL, '0', '', '#IHF163703', 'USD', 1518486487099, 'United States', 'Jane Dearing', 'NC', 'US', 1, 1, '2019-03-31T15:21:05-07:00', '2019-03-31T15:28:01-07:00'),
(1384590671931, 'grumpy_62@msn.com', NULL, '6187 S Foxhunt Dr', '', 'Tucson', 'Arizona', '85746', 'United States', NULL, 'Alice', 'Davis', '', '', '', '', '', NULL, '0', 1, 'disabled', 37.9, 1037377994811, NULL, '1', NULL, '0', '', '#IHF163702', 'USD', 1518467612731, 'United States', 'Alice Davis', 'AZ', 'US', 1, 1, '2019-03-31T15:09:15-07:00', '2019-03-31T15:12:59-07:00'),
(1384471855163, 'labod1066@yahoo.com', NULL, '88 Van Buren Circle', '', 'Davison', 'Michigan', '48423', 'United States', NULL, 'Renee', 'Smith', '', '', '', '', '', NULL, '0', 1, 'disabled', 50.82, 1037222379579, NULL, '1', NULL, '0', '', '#IHF163701', 'USD', 1518353055803, 'United States', 'Renee Smith', 'MI', 'US', 1, 1, '2019-03-31T13:59:19-07:00', '2019-03-31T14:05:52-07:00'),
(1384463728699, 'agjjg06@frontiernet.net', NULL, '231 Ketchumville Rd', '', 'Berkshire', 'New York', '13736', 'United States', '', 'Adam', 'Gwardyak', '', '', '', '', '', NULL, '0', 1, 'disabled', 48.41, 1037200883771, NULL, '1', NULL, '0', '', '#IHF163700', 'USD', 1518345289787, 'United States', 'Adam Gwardyak', 'NY', 'US', 1, 1, '2019-03-31T13:55:24-07:00', '2019-03-31T13:57:05-07:00'),
(1384439775291, 'dmelton126@yahoo.com', NULL, '4426 E Sherwood St', '', 'Springfield', 'Missouri', '65802', 'United States', '', 'Darrell', 'Melton', '', '', '', '', '', NULL, '0', 1, 'disabled', 95.88, 1037169426491, NULL, '1', NULL, '0', '', '#IHF163699', 'USD', 1518321696827, 'United States', 'Darrell Melton', 'MO', 'US', 1, 1, '2019-03-31T13:41:43-07:00', '2019-03-31T13:43:45-07:00'),
(1384397897787, 'cassidy3141@gmail.com', NULL, '13316 cayman ln', '', 'oklahoma city', 'Oklahoma', '73170', 'United States', NULL, 'Cassidy', 'Fitzpatrick', '', '', '', '', '', NULL, '0', 1, 'disabled', 37.9, 1037111656507, NULL, '1', NULL, '0', '', '#IHF163698', 'USD', 1518278574139, 'United States', 'Cassidy Fitzpatrick', 'OK', 'US', 1, 1, '2019-03-31T13:17:07-07:00', '2019-03-31T13:19:38-07:00'),
(1384223735867, 'asmith7974@aol.com', NULL, '10812 heritage hills', '', 'las vegas', 'Nevada', '89134', 'United States', NULL, 'arthur', 'smith', '', '', '', '', '', NULL, '0', 1, 'disabled', 37.94, 1036871794747, NULL, '1', NULL, '0', '', '#IHF163697', 'USD', 1518104084539, 'United States', 'arthur smith', 'NV', 'US', 1, 1, '2019-03-31T11:37:07-07:00', '2019-03-31T11:40:09-07:00'),
(1384116387899, 'davies@hal-pc.org', NULL, '11519 Aucuba Ln.', '', 'Houston', 'Texas', '77095', 'United States', NULL, 'Helen', 'Davies', '', '', '', '', '', NULL, '0', 1, 'disabled', 64, 1036720144443, NULL, '1', NULL, '0', '', '#IHF163695', 'USD', 1517998178363, 'United States', 'Helen Davies', 'TX', 'US', 1, 1, '2019-03-31T10:36:26-07:00', '2019-03-31T10:37:15-07:00'),
(1384087715899, 'BETSYBROWN3@GMAIL.COM', NULL, '39 Crescent Park Drive', 'None', 'PIKE ROAD', 'Alabama', '36064', 'United States', NULL, 'BETSY', 'BROWN', '', '', '', '', '', NULL, '0', 1, 'disabled', 47.9, 1036684460091, NULL, '1', NULL, '0', '', '#IHF163694', 'USD', 1517971669051, 'United States', 'BETSY BROWN', 'AL', 'US', 1, 1, '2019-03-31T10:20:18-07:00', '2019-03-31T10:22:11-07:00'),
(1384079589435, 'jdemmerich@yahoo.com', NULL, '566 Oak Street', '', 'Elk Grove Village', 'Illinois', '60007-4210', 'United States', NULL, 'JD', 'Emmerich', '', '', '', '', '', NULL, '0', 1, 'disabled', 34.91, 1036671352891, NULL, '1', NULL, '0', '', '#IHF163692', 'USD', 1517963477051, 'United States', 'JD Emmerich', 'IL', 'US', 1, 1, '2019-03-31T10:15:40-07:00', '2019-03-31T10:16:04-07:00'),
(1384079458363, 'mckenzie7717@gmail.com', NULL, '2022 State Route 1276', '', 'Mayfield', 'Kentucky', '42066-9030', 'United States', NULL, 'mckenzie', 'nash', '', '', '', '', '', NULL, '1', 1, 'disabled', 64, 1036672073787, NULL, '1', NULL, '0', 'newsletter', '#IHF163693', 'USD', 1517963313211, 'United States', 'mckenzie nash', 'KY', 'US', 1, 1, '2019-03-31T10:15:33-07:00', '2019-03-31T10:17:28-07:00'),
(1384059764795, 'marols269@outlook.com', NULL, 'pobox 263', '', 'heber city', 'Utah', '84032', 'United States', NULL, 'mark', 'olsen', '', '', '', '', '', NULL, '0', 1, 'disabled', 72, 1036651855931, NULL, '1', NULL, '0', '', '#IHF163691', 'USD', 1517943390267, 'United States', 'mark olsen', 'UT', 'US', 1, 1, '2019-03-31T10:03:49-07:00', '2019-03-31T10:07:18-07:00'),
(1383944192059, 'auvalenzona@aol.com', NULL, '1924 E Lainie St', '', 'West Covina', 'California', '91792', 'United States', NULL, 'Aurora', 'Valenzona', '', '', '', '', '', NULL, '0', 1, 'disabled', 52.9, 1036498993211, NULL, '1', NULL, '0', '', '#IHF163690', 'USD', 1517827686459, 'United States', 'Aurora Valenzona', 'CA', 'US', 1, 1, '2019-03-31T08:55:10-07:00', '2019-03-31T09:01:53-07:00'),
(1383842807867, 'rabderf@aol.com', NULL, '27 Colonnade Terrace', '', 'Hilton', 'New York', '14468', 'United States', NULL, 'Fred', 'Barricelli', '', '', '', '', '', NULL, '0', 1, 'disabled', 47.9, 1036377194555, NULL, '1', NULL, '0', '', '#IHF163688', 'USD', 1517732724795, 'United States', 'Fred Barricelli', 'NY', 'US', 1, 1, '2019-03-31T07:54:37-07:00', '2019-03-31T07:57:59-07:00'),
(1383825178683, 'jlee444@cfl.rr.com', NULL, '5621 South Cherokee Terrace', '', 'Inverness', 'Florida', '34452', 'United States', NULL, 'Judy', 'Klopstad', '', '', '', '', '', NULL, '0', 1, 'disabled', 64, 1036364644411, NULL, '1', NULL, '0', '', '#IHF163687', 'USD', 1517716209723, 'United States', 'Judy Klopstad', 'FL', 'US', 1, 1, '2019-03-31T07:42:44-07:00', '2019-03-31T07:47:32-07:00'),
(1383754661947, 'diane.peters@sympatico.ca', NULL, '77 MELVILLE AVE', '', 'TORONTO', 'Ontario', 'M6G1Y3', 'Canada', NULL, 'Diane', 'Peters', '', '', '', '', '', NULL, '0', 1, 'disabled', 89.89, 1036298420283, NULL, '1', NULL, '0', '', '#IHF163684', 'USD', 1517645004859, 'Canada', 'Diane Peters', 'ON', 'CA', 1, 1, '2019-03-31T06:48:51-07:00', '2019-03-31T06:49:53-07:00'),
(1383751680059, 'deltaros@att.net', NULL, '601 N W Jefferson Street ', '', 'Lake City, ', 'Florida', '32055', 'United States', NULL, 'Roslyn', 'McBride-Edwards', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1517641760827, 'United States', 'Roslyn  McBride-Edwards ', 'FL', 'US', 1, 1, '2019-03-31T06:46:19-07:00', '2019-03-31T06:46:19-07:00'),
(1383653736507, 'robert.carter@sympatico.ca', NULL, '1483 Fairmount Boulevard', '', 'Peterborough', 'Ontario', 'K9J 6S7', 'Canada', NULL, 'Robert', 'Carter', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1517543555131, 'Canada', 'Robert Carter', 'ON', 'CA', 1, 1, '2019-03-31T05:19:15-07:00', '2019-03-31T05:19:15-07:00'),
(1382821199931, 'jmbrooks@embarqmail.com', NULL, '6970 Old Siler City Rd', '', 'Ramseur', 'North Carolina', '27316', 'United States', NULL, 'James', 'Brooks', '', '', '', '', '', NULL, '0', 1, 'disabled', 64, 1035731009595, NULL, '1', NULL, '0', '', '#IHF163683', 'USD', 1517227147323, 'United States', 'James Brooks', 'NC', 'US', 1, 1, '2019-03-30T23:29:37-07:00', '2019-03-30T23:30:19-07:00'),
(1382697500731, 'servmpi@sympatico.ca', NULL, '2001 Rue Prospect', '', 'Sherbrooke', 'Quebec', 'J1J 4C9', 'Canada', NULL, 'Marcel', 'Prevereau', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1517102202939, 'Canada', 'Marcel Prevereau', 'QC', 'CA', 1, 1, '2019-03-30T20:41:14-07:00', '2019-03-30T20:41:14-07:00'),
(1382678528059, 'stefan.peter@fidelitylife.com', NULL, '919 Dighton Lane', '', 'Schaumburg', 'Illinois', '60173', 'United States', NULL, 'Stefan', 'Peter', '', '', '', '', '', NULL, '0', 1, 'disabled', 158.79, 1035614421051, NULL, '1', NULL, '0', '', '#IHF163680', 'USD', 1517082902587, 'United States', 'Stefan Peter', 'IL', 'US', 1, 1, '2019-03-30T20:21:48-07:00', '2019-03-30T20:23:34-07:00'),
(1382621478971, 'panasai@yahoo.com.au', NULL, '46 Harold Street', '', 'Macquarie Fields', 'New South Wales', '2564', 'Australia', NULL, 'Tai', 'Strickland', '', '', '', '', '', NULL, '1', 1, 'enabled', 209.75, 1035610587195, NULL, '1', NULL, '0', '', '#IHF163679', 'USD', 1517080117307, 'Australia', 'Tutai Strickland', 'NSW', 'AU', 1, 1, '2019-03-30T19:28:09-07:00', '2019-03-30T20:18:47-07:00'),
(1382611812411, 'cault05@gmail.com', NULL, '7421 Laurel Ridge Ln', '', 'North Little Rock', 'Arkansas', '72113', 'United States', NULL, 'Caleb', 'Ault', '', '', '', '', '', NULL, '0', 1, 'disabled', 42.92, 1035557797947, NULL, '1', NULL, '0', '', '#IHF163678', 'USD', 1517017989179, 'United States', 'Caleb Ault', 'AR', 'US', 1, 1, '2019-03-30T19:18:37-07:00', '2019-03-30T19:19:28-07:00'),
(1382535069755, 'nmahase@ur.com', NULL, '13352 Coleraine Drive', '', 'Caledon', 'Ontario', 'L7E 3B3', 'Canada', NULL, 'Narindra', 'Mahase', '', '', '', '', '', NULL, '0', 1, 'disabled', 93.7, 1035512381499, NULL, '1', NULL, '0', '', '#IHF163676', 'USD', 1516939706427, 'Canada', 'Narindra Mahase ', 'ON', 'CA', 1, 1, '2019-03-30T18:11:58-07:00', '2019-03-30T18:31:11-07:00'),
(1382399017019, 'Axleypal@gmail.com', NULL, '644 Willscott Mt. Drive', '', 'Murphy', 'North Carolina', '28906', 'United States', NULL, 'Elizabeth', 'Roberts', '', '', '', '', '', NULL, '0', 1, 'disabled', 95.7, 1035382620219, NULL, '1', NULL, '0', '', '#IHF163673', 'USD', 1516807684155, 'United States', 'Elizabeth Roberts', 'NC', 'US', 1, 1, '2019-03-30T16:20:51-07:00', '2019-03-30T16:25:54-07:00'),
(1382379847739, 'tarzancrs@yahoo.com', NULL, '39761 214th St', '', 'Huron', 'South Dakota', '57350-7528', 'United States', NULL, 'GARY', 'L O\'RILEY', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1516787564603, 'United States', 'GARY L O\'RILEY', 'SD', 'US', 1, 1, '2019-03-30T16:13:04-07:00', '2019-03-30T16:13:05-07:00'),
(1381838946363, 'jmnoah7@outlook.com', NULL, '7 Primrose Lane', '', 'Greenbrier', 'Arkansas', '72058', 'United States', NULL, 'Juanita', 'Noah', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1516627591227, 'United States', 'Juanita Noah', 'AR', 'US', 1, 1, '2019-03-30T15:18:07-07:00', '2019-03-30T15:18:07-07:00'),
(1380426678331, 's_eberhardt22@hotmail.com', NULL, '2515 Fenton Parkway', '# 305', 'San Diego', 'California', '92108', 'United States', NULL, 'Stephanie', 'Eberhardt', '', '', '', '', '', NULL, '0', 1, 'disabled', 72, 1034935238715, NULL, '1', NULL, '0', '', '#IHF163671', 'USD', 1516031475771, 'United States', 'Stephanie Eberhardt', 'CA', 'US', 1, 1, '2019-03-30T13:05:27-07:00', '2019-03-30T13:06:33-07:00'),
(1380351770683, 'meofner@hotmail.com', NULL, '615 NE Jackson School Rd.', '', 'Hillsboro', 'Oregon', '97124', 'United States', NULL, 'Marie', 'Ofner', '', '', '', '', '', NULL, '0', 1, 'disabled', 64, 1034909843515, NULL, '1', NULL, '0', '', '#IHF163670', 'USD', 1516011651131, 'United States', 'Marie Ofner', 'OR', 'US', 1, 1, '2019-03-30T12:52:58-07:00', '2019-03-30T12:54:57-07:00'),
(1380043685947, 'tamiwilcox60@gmail.com', NULL, '718 Cypress Street', '', 'Pocatello', 'Idaho', '83201', 'United States', NULL, 'Tami', 'Wilcox', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1515773526075, 'United States', 'Tami Wilcox', 'ID', 'US', 1, 1, '2019-03-30T12:26:50-07:00', '2019-03-30T12:26:50-07:00'),
(1380026810427, '7194690302@noemail.com', NULL, '63 Jachim Ave', '', 'Junta', 'Colorado', '81050', 'United States', '', 'Eldon', 'Stoker', '', '', '', '', '', NULL, '0', 1, 'disabled', 48.41, 1034829365307, NULL, '1', NULL, '0', '', '#IHF163669', 'USD', 1515757240379, 'United States', 'Eldon Stoker', 'CO', 'US', 1, 1, '2019-03-30T12:18:33-07:00', '2019-03-30T12:19:52-07:00'),
(1380000628795, 'vaclav_kuba.634@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'owningInfange', 'owningInfange', '', '', '', '', '', NULL, '0', 0, 'enabled', 0, NULL, NULL, '0', NULL, '0', '', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-03-30T12:00:37-07:00', '2019-03-30T12:00:38-07:00'),
(1379993878587, 'dansk39@outlook.com', NULL, '40220 Via Tonada', '', 'Murrieta', 'California', '92562', 'United States', '', 'Petra', 'Schafer', '', '', '', '', '', NULL, '0', 1, 'disabled', 149.82, 1034792566843, NULL, '1', NULL, '0', '', '#IHF163668', 'USD', 1515724832827, 'United States', 'Petra Schafer', 'CA', 'US', 1, 1, '2019-03-30T11:55:46-07:00', '2019-03-30T11:58:47-07:00'),
(1379949346875, 'manewham@cox.net', NULL, '3025 SE Downing Dr', '', 'Topeka', 'Kansas', '66605', 'United States', NULL, 'Mary Ann', 'Newham', '', '', '', '', '', NULL, '0', 1, 'disabled', 64, 1034748624955, NULL, '1', NULL, '0', '', '#IHF163665', 'USD', 1515681153083, 'United States', 'Mary Ann Newham', 'KS', 'US', 1, 1, '2019-03-30T11:25:10-07:00', '2019-03-30T11:28:40-07:00'),
(1379790291003, 'romnn56@yahoo.com', NULL, ' 385 Ocean Blvd', 'APT 4P', 'Long Branch', 'New Jersey', '07740', 'United States', '', 'Natalia', 'Berezina', '', '', '', '', '', NULL, '0', 1, 'disabled', 42.8, 1034587373627, NULL, '1', NULL, '0', '', '#IHF163661', 'USD', 1515549065275, 'United States', 'Natalia Berezina', 'NJ', 'US', 1, 1, '2019-03-30T09:48:49-07:00', '2019-03-30T09:51:28-07:00'),
(1379784065083, 'rbriley@sbcglobal.net', NULL, '345 Circle Drive', '', 'Moberly', 'Missouri', '65270', 'United States', NULL, 'Rebecca', 'Riley', '', '', '', '', '', NULL, '0', 1, 'disabled', 78.4, 1034581114939, NULL, '1', NULL, '0', '', '#IHF163660', 'USD', 1515543494715, 'United States', 'Rebecca Riley', 'MO', 'US', 1, 1, '2019-03-30T09:45:12-07:00', '2019-03-30T09:47:17-07:00'),
(1379765354555, 'ronald.autrey@yahoo.com', NULL, '5831 Chalyce Lane', '', 'Charlotte', 'North Carolina', '28270', 'United States', NULL, 'Ronald', 'Autrey', '', '', '', '', '', NULL, '0', 1, 'enabled', 37.94, 1034580295739, NULL, '0', NULL, '0', '', '#IHF163659', 'USD', 1515545886779, 'United States', 'Ronald Autrey', 'NC', 'US', 1, 1, '2019-03-30T09:33:11-07:00', '2019-03-30T09:46:50-07:00'),
(1379719643195, 'lyndaann@gmail.com', NULL, '1085 Dona Beatriz Cir', '', 'El Paso', 'Texas', '79932', 'United States', NULL, 'Ann', 'Dallas lister', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1515484151867, 'United States', 'Ann Dallas lister', 'TX', 'US', 1, 1, '2019-03-30T09:04:55-07:00', '2019-03-30T09:04:55-07:00'),
(1379714826299, 'caszoopath@aol.com', NULL, '2121 N Union Rd', '', 'Stillwater', 'Oklahoma', '74075', 'United States', NULL, 'Chris', 'Schiller', '', '', '', '', '', NULL, '0', 1, 'disabled', 63.9, 1034486808635, NULL, '1', NULL, '0', '', '#IHF163658', 'USD', 1515479859259, 'United States', 'Chris Schiller', 'OK', 'US', 1, 1, '2019-03-30T09:02:06-07:00', '2019-03-30T09:04:07-07:00'),
(1379506585659, 'salmannabbasi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, '1', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', 'newsletter', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-03-30T08:46:12-07:00', '2019-03-30T08:46:12-07:00'),
(1379133358139, 'marianneanderson0@icloud.com', NULL, '228 W Russell St', '', 'Barrington', 'Illinois', '60010', 'United States', NULL, 'Marianne', 'Anderson', '', '', '', '', '', NULL, '0', 1, 'disabled', 60, 1034385031227, NULL, '1', NULL, '0', '', '#IHF163657', 'USD', 1515272798267, 'United States', 'Marianne Anderson', 'IL', 'US', 1, 1, '2019-03-30T08:18:08-07:00', '2019-03-30T08:19:51-07:00'),
(1378780414011, 'mikebart@sympatico.ca', NULL, '2250 Upper Middle Road', 'Unit 5', 'Burlington', 'Ontario', 'L7P 2Z9', 'Canada', NULL, 'Michael', 'Bartlett', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1515044208699, 'Canada', 'Michael Bartlett', 'ON', 'CA', 1, 1, '2019-03-30T07:46:36-07:00', '2019-03-30T07:46:36-07:00'),
(1378374385723, 'tomsweeney51@gmail.com', NULL, '481 Pina Ln', '', 'Vista', 'California', '92083', 'United States', NULL, 'Thomas', 'Sweeney', '', '', '', '', '', NULL, '0', 1, 'disabled', 37.94, 1034264444987, NULL, '1', NULL, '0', '', '#IHF163655', 'USD', 1514867359803, 'United States', 'Thomas Sweeney', 'CA', 'US', 1, 1, '2019-03-30T07:13:11-07:00', '2019-03-30T07:25:24-07:00'),
(1378229911611, 'smerandi@aol.com', NULL, '700 Village Drive', '', 'Fairmont', 'West Virginia', '26554', 'United States', NULL, 'Samuel', 'Merandi', '', '', '', '', '', NULL, '0', 1, 'disabled', 134.75, 1034225942587, NULL, '1', NULL, '0', '', '#IHF163653', 'USD', 1514837999675, 'United States', 'Samuel Merandi', 'WV', 'US', 1, 1, '2019-03-30T07:02:20-07:00', '2019-03-30T07:06:01-07:00'),
(1378078687291, 'vannettetaylor@gmail.com', NULL, '1037 dawes road', '', 'Frostproof', 'Florida', '33843', 'United States', NULL, 'Vannette', 'Taylor', '', '', '', '', '', NULL, '1', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1514790649915, 'United States', 'Vannette Taylor', 'FL', 'US', 1, 1, '2019-03-30T06:47:07-07:00', '2019-03-30T06:47:07-07:00'),
(1377938866235, 'banjodan214@gmail.com', NULL, '158 Trout Brook Rd.', '', 'Cotuit', 'Massachusetts', '02635', 'United States', NULL, 'Daniel', 'St Pierre', '', '', '', '', '', NULL, '0', 1, 'disabled', 43.91, 1033987227707, NULL, '1', NULL, '0', '', '#IHF163651', 'USD', 1514657775675, 'United States', 'Daniel St Pierre', 'MA', 'US', 1, 1, '2019-03-30T04:55:29-07:00', '2019-03-30T04:59:08-07:00'),
(1377911341115, 'ljdmccauley@gmail.com', NULL, '1010 Westchester Court', '', 'Van Wert', 'Ohio', '45891', 'United States', NULL, 'Joyce', 'McCauley', '', '', '', '', '', NULL, '0', 1, 'disabled', 37.9, 1033938632763, NULL, '1', NULL, '0', '', '#IHF163650', 'USD', 1514630742075, 'United States', 'Joyce McCauley', 'OH', 'US', 1, 1, '2019-03-30T04:30:06-07:00', '2019-03-30T04:32:02-07:00'),
(1377887223867, 'muletrain1975@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LANE', 'HAMMOND', '', '', '', '', '', NULL, '0', 0, 'enabled', 0, NULL, NULL, '0', NULL, '0', '', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-03-30T04:06:05-07:00', '2019-03-30T04:06:06-07:00'),
(1377757462587, 'ajbsuelivvy@gmail.com', NULL, '155 Langton Road', 'Norton', 'Malton', NULL, 'YO17 9AF', 'United Kingdom', NULL, 'Alan', 'Bourton', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1514480173115, 'United Kingdom', 'Alan Bourton', NULL, 'GB', 1, 1, '2019-03-30T01:28:00-07:00', '2019-03-30T01:28:00-07:00'),
(1377728364603, 'kyle.woods.design@gmail.com', NULL, '72 Surfside Drive', '', 'Catherine Hill Bay', 'New South Wales', '2281', 'Australia', NULL, 'Kyle', 'Woods', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1514454745147, 'Australia', 'Kyle Woods', 'NSW', 'AU', 1, 1, '2019-03-30T00:48:42-07:00', '2019-03-30T00:48:42-07:00'),
(1377637236795, 'linglosil7@gmail.com', NULL, '2732 North 125th Circle', '', 'Omaha', 'Nebraska', '68164', 'United States', NULL, 'Linda', 'Blackford', '', '', '', '', '', NULL, '1', 1, 'disabled', 43.82, 1033548955707, NULL, '1', NULL, '0', '', '#IHF163648', 'USD', 1514378199099, 'United States', 'Linda Blackford', 'NE', 'US', 1, 1, '2019-03-29T22:46:57-07:00', '2019-03-29T22:49:22-07:00'),
(1377626161211, 'stan.sharbing@gmail.com', NULL, '2/1 Grills Place', '', 'Armidale', 'New South Wales', '2350', 'Australia', NULL, 'Stanley', 'Bingham', '', '', '', '', '', NULL, '0', 1, 'disabled', 173.79, 1033542467643, NULL, '1', NULL, '0', '', '#IHF163647', 'USD', 1514369450043, 'Australia', 'Stanley Bingham', 'NSW', 'AU', 1, 1, '2019-03-29T22:32:04-07:00', '2019-03-29T22:37:31-07:00'),
(1377520812091, 'turnerpositive@gmail.com', NULL, '1308 Oak Haven Way', '', 'Antioch', 'California', '94531', 'United States', NULL, 'Sheila', 'Turner', '', '', '', '', '', NULL, '1', 1, 'disabled', 52.91, 1033465561147, NULL, '1', NULL, '0', '', '#IHF163646', 'USD', 1514279796795, 'United States', 'Sheila Turner', 'CA', 'US', 1, 1, '2019-03-29T20:32:40-07:00', '2019-03-29T20:35:24-07:00'),
(1377494695995, 'Xayyaraj.tony@yahoo.com', NULL, '2340 N. MacArthur blvd apt 2011', '2011', 'Irving', 'Texas', '75062', 'United States', NULL, 'Tony', 'xayyaraj', '', '', '', '', '', NULL, '1', 1, 'disabled', 43.82, 1033442885691, NULL, '1', NULL, '0', '', '#IHF163645', 'USD', 1514256236603, 'United States', 'Tony xayyaraj', 'TX', 'US', 1, 1, '2019-03-29T20:09:26-07:00', '2019-03-29T20:11:00-07:00');
INSERT INTO `customer_data` (`id`, `email`, `phone`, `address1`, `address2`, `city`, `province`, `zipcode`, `country_name`, `company`, `first_name`, `last_name`, `custo_bdate`, `custo_title`, `custo_gender`, `custo_skintype`, `custo_area_concern`, `custo_issue_concern`, `accepts_marketing`, `orders_count`, `state`, `total_spent`, `last_order_id`, `note`, `verified_email`, `multipass_identifier`, `tax_exempt`, `tags`, `last_order_name`, `currency`, `address_id`, `country`, `name`, `province_code`, `country_code`, `defaultaddress`, `syncpage`, `created_at`, `updated_at`) VALUES
(1377427947579, 'juanlk@bellsouth.net', NULL, '6966 Corsica Dr.', '', 'Germantown', 'Tennessee', '38138', 'United States', NULL, 'Juan', 'Kindelan', '', '', '', '', '', NULL, '0', 1, 'enabled', 34.18, 1033401204795, NULL, '1', NULL, '0', '', '#IHF163644', 'USD', 1514202333243, 'United States', 'Juan Kindelan', 'TN', 'US', 1, 1, '2019-03-29T19:16:04-07:00', '2019-03-29T19:24:04-07:00'),
(1377283637307, 'graemeshandley@gmail.com', NULL, '13/25 Commerce Drive', '', 'Robina', 'Queensland', '4226', 'Australia', NULL, 'Graeme', 'Shandley', '', '', '', '', '', NULL, '0', 1, 'disabled', 209.75, 1033276325947, NULL, '1', NULL, '0', '', '#IHF163643', 'USD', 1514074112059, 'Australia', 'Graeme Shandley', 'QLD', 'AU', 1, 1, '2019-03-29T17:17:05-07:00', '2019-03-29T17:21:28-07:00'),
(1377276952635, 'justinschenck11@gmail.com', NULL, '256 Turnage State Line Rd', '', 'Tylertown', 'Mississippi', '39667', 'United States', NULL, 'Justin', 'Schenck', '', '', '', '', '', NULL, '1', 1, 'enabled', 71.73, 1033271935035, NULL, '1', NULL, '0', 'facebook, oxi_social_login', '#IHF163642', 'USD', 1514067886139, 'United States', 'Justin Schenck', 'MS', 'US', 1, 1, '2019-03-29T17:12:24-07:00', '2019-03-29T17:17:09-07:00'),
(1377220100155, 'smnielson271@gmail.com', NULL, '2675 N US HIGHWAY 31  ', '', 'SCOTTVILLE ', 'Michigan', '49454', 'United States', '', 'Steve', 'Nielson', '', '', '', '', '', NULL, '0', 1, 'disabled', 168.57, 1033213673531, NULL, '1', NULL, '0', '', '#IHF163641', 'USD', 1514019618875, 'United States', 'Steve Nielson', 'MI', 'US', 1, 1, '2019-03-29T16:32:13-07:00', '2019-03-29T16:33:42-07:00'),
(1377147387963, 'drthompsonsr@gmail.com', NULL, '1600 WILIKINA DR  ', 'B409', 'WAHIAWA ', 'Hawaii', '96786', 'United States', '', 'William', 'Thompson', '', '', '', '', '', NULL, '0', 1, 'disabled', 52.9, 1033168748603, NULL, '1', NULL, '0', '', '#IHF163639', 'USD', 1513951887419, 'United States', 'William Thompson', 'HI', 'US', 1, 1, '2019-03-29T15:40:11-07:00', '2019-03-29T16:06:27-07:00'),
(1377094991931, 'beckyruppert@hotmail.com', NULL, '1204 Pleasant Lane', '', 'Spencer', 'Iowa', '51301', 'United States', NULL, 'Rebecca', 'Ruppert', '', '', '', '', '', NULL, '0', 1, 'disabled', 34.91, 1033170321467, NULL, '1', NULL, '0', '', '#IHF163640', 'USD', 1513897951291, 'United States', 'Rebecca Ruppert', 'IA', 'US', 1, 1, '2019-03-29T15:01:24-07:00', '2019-03-29T16:07:28-07:00'),
(1377087324219, 'salisburykitchens@yahoo.com', NULL, '70 Burton Road', '', 'Salisbury', 'Connecticut', '06068', 'United States', NULL, 'Steve', 'De Prodocini', '', '', '', '', '', NULL, '0', 1, 'disabled', 52.9, 1033050226747, NULL, '1', NULL, '0', '', '#IHF163635', 'USD', 1513890119739, 'United States', 'Steve De Prodocini ', 'CT', 'US', 1, 1, '2019-03-29T14:55:39-07:00', '2019-03-29T14:58:49-07:00'),
(1377010090043, 'courtney.holmes@live.com', NULL, '2719 W Gum St.', '', 'Rogers', 'Arkansas', '72758', 'United States', NULL, 'Courtney', 'Holmes', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1513814032443, 'United States', 'Courtney Holmes', 'AR', 'US', 1, 1, '2019-03-29T14:02:26-07:00', '2019-03-29T14:02:26-07:00'),
(1376993935419, 'cooperbarn@gmail.com', NULL, '32719 Sea Island Drive', '', 'Dana Point', 'California', '92629', 'United States', NULL, 'barbara', 'cooper', '', '', '', '', '', NULL, '0', 1, 'disabled', 64, 1032928886843, NULL, '1', NULL, '0', '', '#IHF163631', 'USD', 1513796304955, 'United States', 'barbara cooper', 'CA', 'US', 1, 1, '2019-03-29T13:50:51-07:00', '2019-03-29T13:51:28-07:00'),
(1376992198715, 'joewtwentytoo@gmail.com', NULL, '510 West Roosevelt Avenue', '#20', 'Whitney', 'Texas', '76692', 'United States', NULL, 'joe', 'walter', '', '', '', '', '', NULL, '1', 1, 'disabled', 34.91, 1032931999803, NULL, '1', NULL, '0', '', '#IHF163632', 'USD', 1513794437179, 'United States', 'joe  walter', 'TX', 'US', 1, 1, '2019-03-29T13:49:37-07:00', '2019-03-29T13:52:52-07:00'),
(1376886652987, 'sethcohen347@hotmail.com', NULL, '347 North New River Drive East', '504', 'Fort Lauderdale', 'Florida', '33301', 'United States', NULL, 'Seth', 'Cohen', '', '', '', '', '', NULL, '0', 1, 'disabled', 0, 1032800108603, NULL, '1', NULL, '0', '', '#IHF163630', 'USD', 1513686794299, 'United States', 'Seth Cohen', 'FL', 'US', 1, 1, '2019-03-29T12:39:46-07:00', '2019-04-01T02:52:20-07:00'),
(1376828653627, 'maybeyesno12@yahoo.com', NULL, '11 Harts Lane', 'Suite C', 'East Brunswick', 'New Jersey', '08816', 'United States', NULL, 'Zully', 'Escobar', '', '', '', '', '', NULL, '0', 1, 'disabled', 34.91, 1032730509371, NULL, '1', NULL, '0', '', '#IHF163628', 'USD', 1513628008507, 'United States', 'Zully  Escobar ', 'NJ', 'US', 1, 1, '2019-03-29T11:57:48-07:00', '2019-03-29T11:59:13-07:00'),
(1376825638971, 'msybeyesno12@yahoo.com', NULL, '11 Harts Lane', 'Suite C', 'East Brunswick', 'New Jersey', '08816', 'United States', NULL, 'Zully', 'Escobar', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1513625321531, 'United States', 'Zully  Escobar ', 'NJ', 'US', 1, 1, '2019-03-29T11:55:54-07:00', '2019-03-29T11:55:54-07:00'),
(1376824328251, 'Zullyescobar@comcast.net', NULL, '11 Harts Lane', 'Suite C', 'East Brunswick', 'New Jersey', '08816', 'United States', NULL, 'Zully', 'Escobar', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1513623814203, 'United States', 'Zully  Escobar ', 'NJ', 'US', 1, 1, '2019-03-29T11:54:35-07:00', '2019-03-29T11:54:35-07:00'),
(1376753811515, 'mmackey@mackeyandkirkner.com', NULL, '13 St. Albans Circle', 'Suite 1', 'Newtown Square', 'Pennsylvania', '19073', 'United States', NULL, 'Marilyn', 'Mackey', '', '', '', '', '', NULL, '0', 1, 'disabled', 64, 1032643412027, NULL, '1', NULL, '0', '', '#IHF163627', 'USD', 1513555394619, 'United States', 'Marilyn Mackey', 'PA', 'US', 1, 1, '2019-03-29T11:05:08-07:00', '2019-03-29T11:09:56-07:00'),
(1376727498811, 'dovidschmidt@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, '1', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', 'newsletter', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-03-29T10:48:33-07:00', '2019-03-29T10:48:33-07:00'),
(1376718061627, 'barbrajean43@hotmail.com', NULL, '202 E. Third St', '', 'Waunakee', 'Wisconsin', '53597', 'United States', NULL, 'Barbara', 'Van Alstine', '', '', '', '', '', NULL, '1', 1, 'disabled', 64, 1032604516411, NULL, '1', NULL, '0', '', '#IHF163626', 'USD', 1513521709115, 'United States', 'Barbara Van Alstine', 'WI', 'US', 1, 1, '2019-03-29T10:42:19-07:00', '2019-03-29T10:46:23-07:00'),
(1376717930555, 'richard@summersedgellc.com', NULL, '275 S 500 E  ', '', 'FLORA ', 'Indiana', '46929', 'United States', '', 'Debbie', 'Raney', '', '', '', '', '', NULL, '0', 1, 'disabled', 88, 1032600846395, NULL, '1', NULL, '0', '', '#IHF163625', 'USD', 1513521545275, 'United States', 'Debbie Raney', 'IN', 'US', 1, 1, '2019-03-29T10:42:13-07:00', '2019-03-29T10:43:59-07:00'),
(1376681099323, 'xueyufeng1993@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, '1', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', 'newsletter', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-03-29T10:22:34-07:00', '2019-03-29T10:22:34-07:00'),
(1376647053371, 'robert.Kruzic@gmail.com', NULL, '6149 S Walnut Ave', '', 'Fresno', 'California', '93706', 'United States', '', 'Robert', 'Kruzic', '', '', '', '', '', NULL, '1', 1, 'disabled', 95.88, 1032548220987, NULL, '1', NULL, '0', '', '#IHF163624', 'USD', 1513460006971, 'United States', 'Robert Kruzic', 'CA', 'US', 1, 1, '2019-03-29T10:06:58-07:00', '2019-03-29T10:08:23-07:00'),
(1376494714939, 'dattaway@windstream.net', NULL, '11 Clay Avenue', '', 'Texarkana', 'Texas', '75503', 'United States', NULL, 'Dolores', 'Attaway', '', '', '', '', '', NULL, '0', 1, 'disabled', 63.9, 1032407842875, NULL, '1', NULL, '0', '', '#IHF163622', 'USD', 1513343582267, 'United States', 'Dolores Attaway', 'TX', 'US', 1, 1, '2019-03-29T08:53:08-07:00', '2019-03-29T08:54:41-07:00'),
(1376373243963, 'mrlee206@yahoo.com', NULL, '2911 Bluegrass Court', '', 'Missouri City', 'Texas', '77459', 'United States', NULL, 'LELAND', 'WIGINGTON', '', '', '', '', '', NULL, '0', 1, 'enabled', 94.44, 1032321826875, NULL, '0', NULL, '0', '', '#IHF163621', 'USD', 1513266479163, 'United States', 'LELAND WIGINGTON', 'TX', 'US', 1, 1, '2019-03-29T07:44:48-07:00', '2019-03-29T07:58:14-07:00'),
(1376267534395, 'forlauranadal@gmail.com', NULL, 'P.O. Box 5412', '', 'Sugarloaf', 'California', '92386', 'United States', NULL, 'Laura', 'Nadal', '', '', '', '', '', NULL, '0', 1, 'disabled', 47.9, 1032213495867, NULL, '1', NULL, '0', '', '#IHF163620', 'USD', 1513148383291, 'United States', 'Laura Nadal', 'CA', 'US', 1, 1, '2019-03-29T06:42:58-07:00', '2019-03-29T07:04:03-07:00'),
(1376182108219, 'ajaykumaresh1980360@gmail.com', NULL, 'allen street 2', 'allen street 2', 'New York', 'New York', '10004', 'United States', NULL, 'emma', 'rose', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1513071116347, 'United States', 'emma rose', 'NY', 'US', 1, 1, '2019-03-29T05:45:03-07:00', '2019-03-29T05:46:04-07:00'),
(1376179978299, 'flameferret992@gmail.com', NULL, 'allen street 2', 'allen street 2', 'New York', 'New York', '10004', 'United States', NULL, 'emma', 'rose', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1513069379643, 'United States', 'emma rose', 'NY', 'US', 1, 1, '2019-03-29T05:44:05-07:00', '2019-03-29T05:44:05-07:00'),
(1376109461563, 'jodibanks68@gmail.com', NULL, '39 West State Street', 'Apt C', 'Doylestown', 'Pennsylvania', '18901', 'United States', NULL, 'Jodi', 'Banks', '', '', '', '', '', NULL, '0', 1, 'disabled', 64, 1031976386619, NULL, '1', NULL, '0', '', '#IHF163615', 'USD', 1513004499003, 'United States', 'Jodi Banks', 'PA', 'US', 1, 1, '2019-03-29T04:45:30-07:00', '2019-03-29T04:47:14-07:00'),
(1376106577979, 'dtm2356@mac.com', NULL, '100 LINCOLN AVE', '', 'PINE BEACH', 'New Jersey', '08741', 'United States', NULL, 'Diane', 'Muirhead', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1513001517115, 'United States', 'Diane Muirhead', 'NJ', 'US', 1, 1, '2019-03-29T04:43:12-07:00', '2019-03-29T04:43:12-07:00'),
(1375798034491, 'saurovich@gmail.com', NULL, '1 Suffolk Court', '', 'Oceanside', 'New York', '11572', 'United States', NULL, 'Sarah', 'Urovich', '', '', '', '', '', NULL, '0', 1, 'disabled', 44.9, 1031514783803, NULL, '1', NULL, '0', '', '#IHF163613', 'USD', 1512729018427, 'United States', 'Sarah  Urovich ', 'NY', 'US', 1, 1, '2019-03-28T23:41:06-07:00', '2019-03-28T23:49:47-07:00'),
(1375765102651, 'telove1960@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Teresa', 'Love', '', '', '', '', '', NULL, '0', 0, 'enabled', 0, NULL, NULL, '0', NULL, '0', '', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-03-28T22:57:31-07:00', '2019-03-28T22:57:32-07:00'),
(1375533400123, '8455911268@noemail.com', NULL, '60 Lakeside Dr', '', 'New Windsor', 'New York', '12553', 'United States', '', 'Edward', 'Hanley', '', '', '', '', '', NULL, '0', 1, 'disabled', 43.91, 1031277903931, NULL, '1', NULL, '0', '', '#IHF163611', 'USD', 1512469200955, 'United States', 'Edward Hanley', 'NY', 'US', 1, 1, '2019-03-28T18:47:47-07:00', '2019-03-28T18:50:44-07:00'),
(1375418417211, 'jlbiz7@yahoo.com', NULL, '14466 WIRT STREET', '', 'OMAHA', 'Nebraska', '68116', 'United States', NULL, 'Jim', 'Bisignano', '', '', '', '', '', NULL, '0', 1, 'disabled', 64, 1031187398715, NULL, '1', NULL, '0', '', '#IHF163608', 'USD', 1512366768187, 'United States', 'Jim Bisignano', 'NE', 'US', 1, 1, '2019-03-28T17:23:59-07:00', '2019-03-28T17:24:27-07:00'),
(1375391547451, 'merrittharrell@hotmail.com', NULL, '9 Petigru Drive', '', 'Beaufort', 'South Carolina', '29902', 'United States', NULL, 'merritt', 'harrell', '', '', '', '', '', NULL, '0', 1, 'disabled', 64, 1031163609147, NULL, '1', NULL, '0', '', '#IHF163607', 'USD', 1512342192187, 'United States', 'merritt harrell', 'SC', 'US', 1, 1, '2019-03-28T17:03:11-07:00', '2019-03-28T17:03:43-07:00'),
(1375308709947, 'jansica3@msn.com', NULL, '6346 South Point Drive', '', 'Charlotte', 'North Carolina', '28277', 'United States', NULL, 'Nancy', 'Kennelly Sandifer', '', '', '', '', '', NULL, '0', 1, 'enabled', 47.8, 1031085719611, NULL, '1', NULL, '0', 'facebook, oxi_social_login', '#IHF163604', 'USD', 1512260894779, 'United States', 'Nancy Kennelly Sandifer', 'NC', 'US', 1, 1, '2019-03-28T15:53:01-07:00', '2019-03-28T15:55:02-07:00'),
(1375228526651, 'Scouteron@gmail.com', NULL, '30 Hunter Road', '', 'Delmar', 'New York', '12054', 'United States', NULL, 'Ron', 'Wilday', '', '', '', '', '', NULL, '0', 1, 'disabled', 37.9, 1031010844731, NULL, '1', NULL, '0', '', '#IHF163603', 'USD', 1512179400763, 'United States', 'Ron Wilday', 'NY', 'US', 1, 1, '2019-03-28T14:52:37-07:00', '2019-03-28T14:53:45-07:00'),
(1375128223803, 'rnjalbain@aol.com', NULL, '1341 n willowick', '', 'Eagle', 'Idaho', '83616', 'United States', NULL, 'Richard', 'Albain', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1512100757563, 'United States', 'Richard   Albain', 'ID', 'US', 1, 1, '2019-03-28T14:00:13-07:00', '2019-03-28T14:00:13-07:00'),
(1375056166971, 'antunbegovac@gmail.com', NULL, '2432 21st Street', 'D1', 'Queens', 'New York', '11102', 'United States', NULL, 'Antun', 'Begovac', '', '', '', '', '', NULL, '0', 1, 'disabled', 149.82, 1030890160187, NULL, '1', NULL, '0', '', '#IHF163599', 'USD', 1512052162619, 'United States', 'Antun Begovac', 'NY', 'US', 1, 1, '2019-03-28T13:28:16-07:00', '2019-03-28T13:30:33-07:00'),
(1375033524283, 'stassin@cablelock-la.com', NULL, '1136 SENA DR  ', '', 'METAIRIE', 'Louisiana', '70005', 'United States', '', 'Steve', 'Tassin', '', '', '', '', '', NULL, '0', 1, 'disabled', 52.9, 1030865748027, NULL, '1', NULL, '0', '', '#IHF163598', 'USD', 1512036106299, 'United States', 'Steve Tassin', 'LA', 'US', 1, 1, '2019-03-28T13:19:08-07:00', '2019-03-28T13:20:33-07:00'),
(1375005900859, 'andymason04@yahoo.com', NULL, '1058 Mayfield Dr. ', '', 'Glendale Heights', 'Illinois', '60139', 'United States', NULL, 'Andy', 'Mason', '', '', '', '', '', NULL, '0', 1, 'enabled', 34.91, 1030930989115, NULL, '0', NULL, '0', '', '#IHF163601', 'USD', 1512096563259, 'United States', 'Andy Mason', 'IL', 'US', 1, 1, '2019-03-28T13:04:10-07:00', '2019-03-28T13:57:18-07:00'),
(1374992564283, 'larrykarron@myfairpoint.net', NULL, '4 KELLY COVE LN.', '', 'NORTHPORT', 'Maine', '04849', 'United States', NULL, 'SUSAN', 'KARRON', '', '', '', '', '', NULL, '0', 1, 'disabled', 47.8, 1030812762171, NULL, '1', NULL, '0', '', '#IHF163596', 'USD', 1511996981307, 'United States', 'SUSAN KARRON', 'ME', 'US', 1, 1, '2019-03-28T12:56:03-07:00', '2019-03-28T12:58:12-07:00'),
(1374666883131, 'cleanza@atnt.net', NULL, '315 STRATFORD DR  ', '', 'BROADVIEW HEIGHTS ', 'Ohio', '44147', 'United States', '', 'Charles', 'Leanza', '', '', '', '', '', NULL, '0', 1, 'disabled', 72, 1030440812603, NULL, '1', NULL, '0', '', '#IHF163593', 'USD', 1511715012667, 'United States', 'Charles Leanza', 'OH', 'US', 1, 1, '2019-03-28T10:02:08-07:00', '2019-03-28T10:04:10-07:00'),
(1374643945531, 'rebeccalouise56@icloud.com', NULL, '521 Grand Street', '', 'Winona', 'Minnesota', '55987', 'United States', NULL, 'Rebecca', 'Kujak', '', '', '', '', '', NULL, '1', 1, 'disabled', 127.99, 1030414008379, NULL, '1', NULL, '0', '', '#IHF163592', 'USD', 1511696924731, 'United States', 'Rebecca  Kujak ', 'MN', 'US', 1, 1, '2019-03-28T09:50:34-07:00', '2019-03-28T09:52:31-07:00'),
(1374617993275, 'kybotelers@gmail.com', NULL, '167 Long Needle Rd', '', 'Brandenburg', 'Kentucky', '40108', 'United States', '', 'Othel', 'Boteler', '', '', '', '', '', NULL, '0', 1, 'disabled', 95.88, 1030388777019, NULL, '1', NULL, '0', '', '#IHF163591', 'USD', 1511675658299, 'United States', 'Othel Boteler', 'KY', 'US', 1, 1, '2019-03-28T09:37:03-07:00', '2019-03-28T09:38:23-07:00'),
(1374582505531, 'ayavila11@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, '1', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', 'newsletter', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-03-28T09:22:03-07:00', '2019-03-28T09:22:03-07:00'),
(1374517755963, 'ccroca145@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, '1', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', 'newsletter', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-03-28T08:49:42-07:00', '2019-03-28T08:49:42-07:00'),
(1374460215355, 'jthig@earthlink.net', NULL, '4450 Sears Road', '', 'Pegram', 'Tennessee', '37143', 'United States', NULL, 'Billie Jean', 'Thigpen', '', '', '', '', '', NULL, '0', 1, 'disabled', 46, 1030240731195, NULL, '1', NULL, '0', '', '#IHF163588', 'USD', 1511556382779, 'United States', 'Billie Jean Thigpen', 'TN', 'US', 1, 1, '2019-03-28T08:19:42-07:00', '2019-03-28T08:24:13-07:00'),
(1374415650875, 'Massageisgood4you@gmail.com', NULL, 'PO Box 609', '', 'Molalla', 'Oregon', '97038', 'United States', NULL, 'Angela', 'Hill', '', '', '', '', '', NULL, '0', 1, 'disabled', 34.91, 1030181847099, NULL, '1', NULL, '0', '', '#IHF163587', 'USD', 1511515160635, 'United States', 'Angela Hill', 'OR', 'US', 1, 1, '2019-03-28T07:52:01-07:00', '2019-03-28T07:54:33-07:00'),
(1374367023163, 'sonya.flora@yahoo.com', NULL, '1005 Cookham Arch', '', 'Chesapeake', 'Virginia', '23322', 'United States', NULL, 'sonya', 'flora', '', '', '', '', '', NULL, '0', 1, 'disabled', 61.95, 1030129844283, NULL, '1', NULL, '0', '', '#IHF163586', 'USD', 1511465812027, 'United States', 'sonya flora', 'VA', 'US', 1, 1, '2019-03-28T07:19:37-07:00', '2019-03-28T07:21:45-07:00'),
(1374341529659, 'jimulveling@hotmail.com', NULL, ' 511 W Anthony St', '', 'Carroll', 'Iowa', '51401', 'United States', '', 'James', 'Ulveling', '', '', '', '', '', NULL, '1', 1, 'disabled', 95.88, 1030088523835, NULL, '1', NULL, '0', '', '#IHF163585', 'USD', 1511440941115, 'United States', 'James Ulveling', 'IA', 'US', 1, 1, '2019-03-28T07:00:42-07:00', '2019-03-28T07:02:16-07:00'),
(1374208458811, 'janeylowther@yahoo.com', NULL, '45 Varner Lane', '', 'Buckhannon', 'West Virginia', '26201', 'United States', NULL, 'Janey', 'Lowther', '', '', '', '', '', NULL, '0', 2, 'disabled', 91.91, 1029946671163, NULL, '1', NULL, '0', '', '#IHF163580', 'USD', 1511300530235, 'United States', 'Janey Lowther', 'WV', 'US', 0, 1, '2019-03-28T05:08:41-07:00', '2019-03-28T05:44:08-07:00'),
(1374075682875, 'paulharvell@msn.com', NULL, '7713 Raytown RD., #23', '', 'Raytown', 'Missouri', '64138', 'United States', NULL, 'Paul', 'Harvell', '', '', '', '', '', NULL, '0', 1, 'disabled', 39.43, 1029669814331, NULL, '1', NULL, '0', '', '#IHF163578', 'USD', 1511164215355, 'United States', 'Paul Harvell', 'MO', 'US', 1, 1, '2019-03-28T02:51:44-07:00', '2019-03-28T02:54:34-07:00'),
(1374043766843, 'staff02.gsm@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Staff', 'GSM', '', '', '', '', '', NULL, '0', 0, 'enabled', 0, NULL, NULL, '1', NULL, '0', 'google, oxi_social_login', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-03-28T02:08:25-07:00', '2019-03-28T02:08:26-07:00'),
(1373870391355, 'phylliswc49@gmail.com', NULL, '535 Buckthorn Way', '', 'Louisville', 'Colorado', '80027', 'United States', NULL, 'Phyllis', 'Cook', '', '', '', '', '', NULL, '0', 1, 'disabled', 78.4, 1029417828411, NULL, '1', NULL, '0', '', '#IHF163577', 'USD', 1510956761147, 'United States', 'Phyllis Cook', 'CO', 'US', 1, 1, '2019-03-27T22:35:45-07:00', '2019-03-27T22:40:36-07:00'),
(1373610508347, 'bnauty1230@aol.com', NULL, '28 Duke Street', '', 'Deer Park', 'New York', '11729', 'United States', NULL, 'Ta-Wanya', 'Williams', '', '', '', '', '', NULL, '0', 1, 'disabled', 43.91, 1029195399227, NULL, '1', NULL, '0', '', '#IHF163571', 'USD', 1510693765179, 'United States', 'Ta-Wanya Williams', 'NY', 'US', 1, 1, '2019-03-27T18:38:28-07:00', '2019-03-27T18:40:38-07:00'),
(1373599432763, 'dwfarrimond@aol.com', NULL, '5320 mercia court', '', 'Winston salem', 'North Carolina', '27106', 'United States', NULL, 'Denny', 'Farrimond', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1510681739323, 'United States', 'Denny Farrimond', 'NC', 'US', 1, 1, '2019-03-27T18:28:57-07:00', '2019-03-27T18:28:57-07:00'),
(1373532880955, 'vbdesigns@protonmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, '1', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', 'newsletter', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-03-27T17:33:36-07:00', '2019-03-27T17:33:36-07:00'),
(1373476225083, 'lhill1265@gmail.com', NULL, '1265 Danbury Road Northwest', '', 'North Canton', 'Ohio', '44720', 'United States', NULL, 'Lynn', 'Hill', '', '', '', '', '', NULL, '0', 1, 'disabled', 64, 1029083562043, NULL, '1', NULL, '0', '', '#IHF163568', 'USD', 1510559383611, 'United States', 'Lynn Hill', 'OH', 'US', 1, 1, '2019-03-27T16:51:08-07:00', '2019-03-27T16:53:38-07:00'),
(1373454434363, 'tsutton0515@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Thomas', 'Sutton', '', '', '', '', '', NULL, '0', 0, 'enabled', 0, NULL, NULL, '0', NULL, '0', '', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-03-27T16:32:04-07:00', '2019-03-27T16:32:04-07:00'),
(1373426384955, 'rickw@malonewheeler.com', NULL, '1880 East Creek Drive', '', 'DRIPPING SPRINGS', 'Texas', '78620', 'United States', NULL, 'Rick', 'Wheeler', '', '', '', '', '', NULL, '0', 1, 'disabled', 41.91, 1029035098171, NULL, '1', NULL, '0', '', '#IHF163567', 'USD', 1510506725435, 'United States', 'Rick Wheeler', 'TX', 'US', 1, 1, '2019-03-27T16:07:23-07:00', '2019-03-27T16:09:48-07:00'),
(1373342892091, 'peter.cosmiccowboy@gmail.com', NULL, '10465 LINDBROOK DR  ', '', 'LOS ANGELES CA', 'California', '90024', 'United States', '', 'Peter', 'Bort', '', '', '', '', '', NULL, '1', 1, 'disabled', 143.84, 1028957700155, NULL, '1', NULL, '0', '', '#IHF163565', 'USD', 1510419595323, 'United States', 'Peter Bort', 'CA', 'US', 1, 1, '2019-03-27T15:02:41-07:00', '2019-03-27T15:04:37-07:00'),
(1373318152251, 'amberdearmond0508@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Amber', 'DeArmond', '', '', '', '', '', NULL, '0', 0, 'enabled', 0, NULL, NULL, '1', NULL, '0', 'google, oxi_social_login', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-03-27T14:46:23-07:00', '2019-03-27T14:46:24-07:00'),
(1373285810235, 'wendychambers65@hotmail.com', NULL, '752729 Southgate S.R. 75', '', 'R.R.1 Proton Station', 'Ontario', 'N0C1L0', 'Canada', NULL, 'Wendy', 'Chambers', '', '', '', '', '', NULL, '0', 1, 'disabled', 99.98, 1029101256763, NULL, '1', NULL, '0', '', '#IHF163569', 'USD', 1510364086331, 'Canada', 'Wendy Chambers', 'ON', 'CA', 1, 1, '2019-03-27T14:24:53-07:00', '2019-03-27T17:10:27-07:00'),
(1373174235195, '5963-xv@noemail.com', NULL, '11268 N FRIAR DR  ', '', 'HAYDEN ', 'Idaho', '83835', 'United States', '', 'Henry', 'Camphaus', '', '', '', '', '', NULL, '0', 1, 'disabled', 143.84, 1028802248763, NULL, '1', NULL, '0', '', '#IHF163561', 'USD', 1510250184763, 'United States', 'Henry Camphaus', 'ID', 'US', 1, 1, '2019-03-27T13:07:08-07:00', '2019-03-27T13:08:27-07:00'),
(1373168140347, 'hstudersandman@gmail.com', NULL, '52440 DEL GATO DR  ', '', 'LA QUINTA ', 'California', '92253', 'United States', '', 'Herbert', 'Studer', '', '', '', '', '', NULL, '0', 1, 'enabled', 47.9, 1028814143547, NULL, '0', NULL, '0', '', '#IHF163562', 'USD', 1510264700987, 'United States', 'Herbert Studer', 'CA', 'US', 1, 1, '2019-03-27T13:02:31-07:00', '2019-03-27T13:17:05-07:00'),
(1373132390459, '50-46cetr3@noemail.com', NULL, '3455 BROXTON MILL WAY  ', '', 'SNELLVILLE ', 'Georgia', '30039', 'United States', '', 'Gail', 'Christ', '', '', '', '', '', NULL, '0', 1, 'disabled', 43.91, 1028762992699, NULL, '1', NULL, '0', '', '#IHF163560', 'USD', 1510206144571, 'United States', 'Gail Christ', 'GA', 'US', 1, 1, '2019-03-27T12:37:39-07:00', '2019-03-27T12:39:11-07:00'),
(1373103161403, 'cowdog7721@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Darrell', 'Simmons', '', '', '', '', '', NULL, '0', 0, 'enabled', 0, NULL, NULL, '0', NULL, '0', '', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-03-27T12:17:25-07:00', '2019-03-27T12:17:26-07:00'),
(1372904063035, 'ldibileosr@yahoo.com', NULL, '1990 CULPEPPER WAY  ', '', 'THE VILLAGES', 'Florida', '32162', 'United States', '', 'Luis', 'Dibileo', '', '', '', '', '', NULL, '0', 1, 'disabled', 39.43, 1028519395387, NULL, '1', NULL, '0', '', '#IHF163554', 'USD', 1509966774331, 'United States', 'Luis Dibileo', 'FL', 'US', 1, 1, '2019-03-27T10:05:06-07:00', '2019-03-27T10:07:24-07:00'),
(1372899770427, NULL, NULL, '', '', '', 'Alabama', '', 'United States', '', 'mark', '', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1509962612795, 'United States', 'mark', 'AL', 'US', 1, 1, '2019-03-27T10:02:07-07:00', '2019-03-27T10:02:07-07:00'),
(1372778889275, 'dbrinser@comcast.net', NULL, '526 ELM ST  ', '', 'HARRISBURG ', 'Pennsylvania', '17112', 'United States', '', 'Debra', 'Brinser', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1509840257083, 'United States', 'Debra  Brinser', 'PA', 'US', 1, 1, '2019-03-27T08:36:59-07:00', '2019-03-27T08:36:59-07:00'),
(1372753494075, 'aadams@keymobility.com', NULL, '7638 Wildcat Rd', '', 'Huber Heights', 'Ohio', '45424', 'United States', NULL, 'Angela', 'Adams', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1509813157947, 'United States', 'Angela Adams', 'OH', 'US', 1, 1, '2019-03-27T08:18:32-07:00', '2019-03-27T08:18:32-07:00'),
(1372662497339, 'nsschafran@gmail.com', NULL, '87 Nassau st', '', 'New York', 'New York', '10038', 'United States', NULL, 'Neil', 'Schafran', '', '', '', '', '', NULL, '0', 1, 'disabled', 142.94, 1028281466939, NULL, '1', NULL, '0', '', '#IHF163549', 'USD', 1509719048251, 'United States', 'Neil Schafran', 'NY', 'US', 1, 1, '2019-03-27T07:14:12-07:00', '2019-03-27T07:16:05-07:00'),
(1372579954747, 'billydickinson@ymail.com', NULL, '10520 Potter Tract', '', 'Grand Bay', 'Alabama', '36541', 'United States', NULL, 'JOANIE', 'DICKINSON', '', '', '', '', '', NULL, '0', 1, 'disabled', 47.9, 1028205183035, NULL, '1', NULL, '0', '', '#IHF163546', 'USD', 1509630246971, 'United States', 'JOANIE DICKINSON', 'AL', 'US', 1, 1, '2019-03-27T06:06:31-07:00', '2019-03-27T06:07:52-07:00'),
(1372563669051, 'bryndah_2002@yahoo.com', NULL, '1713 E 84TH ST', '', 'CLEVELAND', 'Ohio', '44103-3415', 'United States', NULL, 'Brynda', 'Allen', '', '', '', '', '', NULL, '1', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1509612585019, 'United States', 'Brynda Allen', 'OH', 'US', 1, 1, '2019-03-27T05:52:23-07:00', '2019-03-27T05:52:23-07:00'),
(1372480307259, 'merril.thibodeaux@gmail.com', NULL, '112 Hillside Apt 7', '', 'Lafayette', 'Louisiana', '70503', 'United States', NULL, 'Merril', 'Thibodeaux', '', '', '', '', '', NULL, '0', 1, 'disabled', 39.43, 1028096426043, NULL, '1', NULL, '0', '', '#IHF163544', 'USD', 1509526962235, 'United States', 'Merril Thibodeaux', 'LA', 'US', 1, 1, '2019-03-27T04:34:24-07:00', '2019-03-27T04:41:06-07:00'),
(1372463398971, 'popppy111@hotmail.com', NULL, '112 crockett st. ', '', 'Hallettsville', 'Texas', '77964', 'United States', NULL, 'Craig', 'Grahmann', '', '', '', '', '', NULL, '0', 1, 'disabled', 83.98, 1028066869307, NULL, '1', NULL, '0', '', '#IHF163543', 'USD', 1509509562427, 'United States', 'Craig Grahmann', 'TX', 'US', 1, 1, '2019-03-27T04:17:16-07:00', '2019-03-27T04:19:24-07:00'),
(1372232384571, 'dporray@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, '1', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', 'newsletter', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-03-26T23:28:18-07:00', '2019-03-26T23:28:18-07:00'),
(1372110979131, 'kathleentornquist@yahoo.com', NULL, '717 9th St SW', '', 'Willmar', 'Minnesota', '56201', 'United States', '', 'Kathy', 'Tornquist', '', '', '', '', '', NULL, '0', 1, 'disabled', 95.88, 1027542188091, NULL, '1', NULL, '0', '', '#IHF163542', 'USD', 1509131780155, 'United States', 'Kathy Tornquist', 'MN', 'US', 1, 1, '2019-03-26T20:56:03-07:00', '2019-03-26T21:02:53-07:00'),
(1371970601019, 'san33jon@gmail.com', NULL, '6413 Prosperity Commons Drive', '', 'Charlotte', 'North Carolina', '28269', 'United States', NULL, 'Sandra', 'Hampton', '', '', '', '', '', NULL, '0', 1, 'disabled', 43.91, 1027420520507, NULL, '1', NULL, '0', '', '#IHF163540', 'USD', 1508988387387, 'United States', 'Sandra Hampton', 'NC', 'US', 1, 1, '2019-03-26T19:00:11-07:00', '2019-03-26T19:02:03-07:00'),
(1371950841915, 'beckenhauerj@yahoo.com', NULL, '727 Eastridge Drive', '', 'Lincoln', 'Nebraska', '68510', 'United States', NULL, 'Jon', 'Beckenhauer', '', '', '', '', '', NULL, '0', 1, 'disabled', 119.62, 1027403284539, NULL, '1', NULL, '0', '', '#IHF163539', 'USD', 1508968792123, 'United States', 'Jon Beckenhauer', 'NE', 'US', 1, 1, '2019-03-26T18:44:08-07:00', '2019-03-26T18:45:06-07:00'),
(1371890417723, 'elizabethlblades@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, '1', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', 'newsletter', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-03-26T17:55:28-07:00', '2019-03-26T17:55:28-07:00'),
(1371885600827, 'rickyboy@hawaiiantel.net', NULL, 'P o box 443', '', 'Hanamaulu', 'Hawaii', '96715', 'United States', NULL, 'Ricky', 'Rego', '', '', '', '', '', NULL, '0', 1, 'disabled', 101.83, 1027347841083, NULL, '1', NULL, '0', '', '#IHF163538', 'USD', 1508901879867, 'United States', 'Ricky Rego', 'HI', 'US', 1, 1, '2019-03-26T17:51:28-07:00', '2019-03-26T17:52:28-07:00'),
(1371864301627, 'ktsaway@yahoo.com', NULL, '24353 E Delany Rd', '', 'Florence', 'Arizona', '85132', 'United States', NULL, 'Kathryn', 'Winter', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1508881137723, 'United States', 'Kathryn Winter', 'AZ', 'US', 1, 1, '2019-03-26T17:35:18-07:00', '2019-03-26T17:35:18-07:00'),
(1371846967355, 'jhm2obx@gmail.com', NULL, '689 Camera Road', '', 'Waverly', 'Virginia', '23890', 'United States', NULL, 'Janet', 'Monahan', '', '', '', '', '', NULL, '0', 1, 'disabled', 72, 1027317268539, NULL, '1', NULL, '0', '', '#IHF163537', 'USD', 1508865114171, 'United States', 'Janet Monahan', 'VA', 'US', 1, 1, '2019-03-26T17:21:17-07:00', '2019-03-26T17:23:38-07:00'),
(1371675918395, '9142615558@noemail.com', NULL, '515 N La Brea Ave', 'Unit 501', 'Los Angeles', 'California', '90036', 'United States', '', 'Sandra', 'Poliskin', '', '', '', '', '', NULL, '0', 1, 'disabled', 43.91, 1027209396283, NULL, '1', NULL, '0', '', '#IHF163533', 'USD', 1508746723387, 'United States', 'Sandra Poliskin', 'CA', 'US', 1, 1, '2019-03-26T15:44:35-07:00', '2019-03-26T15:46:30-07:00'),
(1371591442491, 'angelmariaxo@hotmail.com', NULL, '455 driver ave', '', 'brick', 'New Jersey', '08723', 'United States', NULL, 'maria', 'l santos', '', '', '', '', '', NULL, '0', 1, 'disabled', 107.88, 1027130425403, NULL, '1', NULL, '0', '', '#IHF163532', 'USD', 1508661624891, 'United States', 'maria l santos', 'NJ', 'US', 1, 1, '2019-03-26T14:44:30-07:00', '2019-03-26T14:45:11-07:00'),
(1371520729147, 'dbottagaro@gmail.com', NULL, '13593 Via Varra rd.', '1324', 'Broomfield', 'Colorado', '80020', 'United States', NULL, 'david', 'bottagaro', '', '', '', '', '', NULL, '0', 1, 'enabled', 76.46, 1027067707451, NULL, '0', NULL, '0', '', '#IHF163531', 'USD', 1508594843707, 'United States', 'david bottagaro', 'CO', 'US', 1, 1, '2019-03-26T13:54:56-07:00', '2019-03-26T13:59:43-07:00'),
(1371452178491, 'Markconni2@aol.com', NULL, '18509 Lithia Towne Road', '', 'LITHIA', 'Florida', '33547', 'United States', NULL, 'Connie', 'Laurie', '', '', '', '', '', NULL, '0', 1, 'disabled', 133.45, 1027001876539, NULL, '1', NULL, '0', '', '#IHF163527', 'USD', 1508520296507, 'United States', 'Connie Laurie', 'FL', 'US', 1, 1, '2019-03-26T13:09:56-07:00', '2019-03-26T13:11:50-07:00'),
(1371451818043, 'irenetang@tx.rr.com', NULL, '6616 SHADY CREEK CIR  ', '', 'PLANO ', 'Texas', '75024', 'United States', '', 'Irene', 'Tang', '', '', '', '', '', NULL, '0', 1, 'disabled', 119.96, 1026999418939, NULL, '1', NULL, '0', '', '#IHF163526', 'USD', 1508519968827, 'United States', 'Irene Tang', 'TX', 'US', 1, 1, '2019-03-26T13:09:42-07:00', '2019-03-26T13:10:18-07:00'),
(1371292860475, 'jimlas75@gmail.com', NULL, '3406 Farley Road #108', '', 'Almont', 'Michigan', '48003', 'United States', NULL, 'Carl', 'Hemak', '', '', '', '', '', NULL, '0', 1, 'disabled', 65.46, 1026836267067, NULL, '1', NULL, '0', '', '#IHF163521', 'USD', 1508369137723, 'United States', 'Carl Hemak', 'MI', 'US', 1, 1, '2019-03-26T11:34:47-07:00', '2019-03-26T11:36:22-07:00'),
(1371266678843, 'amyschuck@hotmail.com', NULL, '2187 Overlook Drive ', '', 'Bloomington', 'Minnesota', '55431', 'United States', NULL, 'Amy', 'Schuck', '', '', '', '', '', NULL, '0', 1, 'disabled', 39, 1026812969019, NULL, '1', NULL, '0', '', '#IHF163520', 'USD', 1508341874747, 'United States', 'Amy Schuck', 'MN', 'US', 1, 1, '2019-03-26T11:17:59-07:00', '2019-03-26T11:19:26-07:00'),
(1371217985595, 'woodside63@ymail.com', NULL, '2260 Wintercreek Way SE', '', 'Salem', 'Oregon', '97306', 'United States', '', 'Nancy', 'Woodside', '', '', '', '', '', NULL, '1', 1, 'disabled', 95.7, 1026762866747, NULL, '1', NULL, '0', '', '#IHF163518', 'USD', 1508289413179, 'United States', 'Nancy Woodside', 'OR', 'US', 1, 1, '2019-03-26T10:46:48-07:00', '2019-03-26T10:49:19-07:00'),
(1371205369915, 'mathclus53@yahoo.com', NULL, 'S580 Jenny Ln', '', 'Marshfield', 'Wisconsin', '54449', 'United States', '', 'Paul', 'Larson', '', '', '', '', '', NULL, '0', 1, 'disabled', 48.41, 1026743500859, NULL, '1', NULL, '0', '', '#IHF163517', 'USD', 1508275879995, 'United States', 'Paul Larson', 'WI', 'US', 1, 1, '2019-03-26T10:38:34-07:00', '2019-03-26T10:40:45-07:00'),
(1371120369723, 'testing@aol.com', NULL, '14123 Emiline St.', '', 'OMaha', 'Nebraska', '68138', 'United States', NULL, 'aaron', 'test', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1508188454971, 'United States', 'aaron test', 'NE', 'US', 1, 1, '2019-03-26T09:48:06-07:00', '2019-03-26T09:48:06-07:00'),
(1371062108219, 'klsy_marshall@yahoo.com', NULL, '20 A Capri Ct', '', 'Bluffton', 'Indiana', '46714', 'United States', NULL, 'Kelsey', 'Marshall', '', '', '', '', '', NULL, '0', 1, 'enabled', 43.82, 1026584313915, NULL, '1', NULL, '0', 'facebook, oxi_social_login', '#IHF163510', 'USD', 1508127473723, 'United States', 'Kelsey Marshall', 'IN', 'US', 1, 1, '2019-03-26T09:06:01-07:00', '2019-03-26T09:08:13-07:00'),
(1371008041019, 'caffeybg@skybest.com', NULL, '369 Spencer Branch Rd', '', 'Lansing', 'North Carolina', '28643', 'United States', NULL, 'Billy', 'Caffey', '', '', '', '', '', NULL, '0', 1, 'disabled', 146.09, 1026532933691, NULL, '1', NULL, '0', '', '#IHF163508', 'USD', 1508068130875, 'United States', 'Billy Caffey', 'NC', 'US', 1, 1, '2019-03-26T08:30:29-07:00', '2019-03-26T08:33:00-07:00'),
(1371001094203, 'gigiwark@gmail.com', NULL, '4502 Mountwood Street', '', 'Houston', 'Texas', '77018', 'United States', NULL, 'Gigi', 'Wark', '', '', '', '', '', NULL, '0', 1, 'disabled', 34.91, 1026523955259, NULL, '1', NULL, '0', '', '#IHF163506', 'USD', 1508060790843, 'United States', 'Gigi Wark', 'TX', 'US', 1, 1, '2019-03-26T08:25:38-07:00', '2019-03-26T08:26:56-07:00'),
(1370977435707, 'whittlebrook@comcast.net', NULL, '11 Merrill Rd ', '', 'Goffstown', 'New Hampshire', '03045', 'United States', NULL, 'Pat', 'MacDonald', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1508035887163, 'United States', 'Pat MacDonald', 'NH', 'US', 1, 1, '2019-03-26T08:08:27-07:00', '2019-03-26T08:08:27-07:00'),
(1370935459899, 'weenifdra@aol.com', NULL, '83 Rahway Lane', '', 'Rochester', 'New York', '14606', 'United States', NULL, 'Brooke', 'Morris', '', '', '', '', '', NULL, '0', 1, 'disabled', 42.45, 1026464710715, NULL, '1', NULL, '0', '', '#IHF163503', 'USD', 1507988439099, 'United States', 'Brooke Morris', 'NY', 'US', 1, 1, '2019-03-26T07:40:22-07:00', '2019-03-26T07:41:09-07:00'),
(1370926841915, 'kwiltkrazy40@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Paulette', 'Hannenberg', '', '', '', '', '', NULL, '0', 0, 'enabled', 0, NULL, NULL, '0', NULL, '0', '', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-03-26T07:35:35-07:00', '2019-03-26T07:35:36-07:00'),
(1370901086267, 'jim_dickard@yahoo.com', NULL, '17912 Villamoura Drive', '', 'Poway', 'California', '92064', 'United States', NULL, 'Robert', 'Dickard', '', '', '', '', '', NULL, '0', 1, 'disabled', 47.8, 1026430795835, NULL, '1', NULL, '0', '', '#IHF163500', 'USD', 1507956850747, 'United States', 'Robert Dickard', 'CA', 'US', 1, 1, '2019-03-26T07:20:11-07:00', '2019-03-26T07:22:03-07:00'),
(1370757005371, 'jcrdguez@gmail.com', NULL, '2201 S Lakeline Blvd apt 12106', '', 'Cedar Park', 'Texas', '78613-3655', 'United States', NULL, 'Jose', 'Rodriguez', '', '', '', '', '', NULL, '1', 1, 'disabled', 42.45, 1026301919291, NULL, '1', NULL, '0', '', '#IHF163497', 'USD', 1507812081723, 'United States', 'Jose Rodriguez', 'TX', 'US', 1, 1, '2019-03-26T05:27:28-07:00', '2019-03-26T05:27:58-07:00'),
(1370754940987, 'edjumper@live.com', NULL, '6297 wynfield Drive', '', 'Flowery Branch', 'Georgia', '30542', 'United States', NULL, 'Ed', 'Jumper', '', '', '', '', '', NULL, '0', 1, 'disabled', 61.43, 1026305130555, NULL, '1', NULL, '0', '', '#IHF163499', 'USD', 1507809787963, 'United States', 'Ed Jumper', 'GA', 'US', 1, 1, '2019-03-26T05:25:32-07:00', '2019-03-26T05:31:18-07:00'),
(1370753400891, 'dortizlittle23@gmail.com', NULL, '7641 133rd Square', '', 'Sebastian', 'Florida', '32958', 'United States', NULL, 'Michael', 'Cammarata', '', '', '', '', '', NULL, '0', 1, 'disabled', 64.92, 1026304081979, NULL, '1', NULL, '0', '', '#IHF163498', 'USD', 1507808280635, 'United States', 'Michael Cammarata ', 'FL', 'US', 1, 1, '2019-03-26T05:24:13-07:00', '2019-03-26T05:30:19-07:00'),
(1370705100859, 'dlapier@sympatico.ca', NULL, '12318 County Road 18', '', 'Williamsburg', 'Ontario', 'K0C 2H0', 'Canada', '', 'David', 'Lapier', '', '', '', '', '', NULL, '0', 1, 'disabled', 151.36, 1026244378683, NULL, '1', NULL, '0', '', '#IHF163496', 'USD', 1507758342203, 'Canada', 'David Lapier', 'ON', 'CA', 1, 1, '2019-03-26T04:42:04-07:00', '2019-03-26T04:43:45-07:00'),
(1370683113531, 'alwaz381@yahoo.com', NULL, '37122 Sandy Ln', '', 'Lady Lake', 'Florida', '32159-4901', 'United States', NULL, 'Robin', 'Watts', '', '', '', '', '', NULL, '0', 1, 'disabled', 64, 1026207449147, NULL, '1', NULL, '0', '', '#IHF163495', 'USD', 1507736289339, 'United States', 'Robin Watts', 'FL', 'US', 1, 1, '2019-03-26T04:20:35-07:00', '2019-03-26T04:21:14-07:00'),
(1370355007547, 'genamapes@hotmail.com', NULL, '18500 Spring Crest Dr', '', 'Minnetonka', 'Minnesota', '55345', 'United States', NULL, 'Gena', 'Haley', '', '', '', '', '', NULL, '0', 1, 'disabled', 64, 1025778679867, NULL, '1', NULL, '0', '', '#IHF163492', 'USD', 1507410280507, 'United States', 'Gena Haley', 'MN', 'US', 1, 1, '2019-03-25T21:34:06-07:00', '2019-03-25T21:34:48-07:00'),
(1370140115003, 'nasandstr@gmail.com', NULL, '150 W. Kingsbury Rd.', '', 'Kelso', 'Washington', '98626', 'United States', NULL, 'Nils', 'Sandstrom', '', '', '', '', '', NULL, '1', 1, 'disabled', 94.48, 1025619296315, NULL, '1', NULL, '0', '', '#IHF163490', 'USD', 1507081814075, 'United States', 'Nils Sandstrom', 'WA', 'US', 1, 1, '2019-03-25T18:29:38-07:00', '2019-03-25T18:34:21-07:00'),
(1370056884283, 'lafosner@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Laurie', 'Fosner', '', '', '', '', '', NULL, '0', 0, 'enabled', 0, NULL, NULL, '0', NULL, '0', '', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-03-25T17:34:35-07:00', '2019-03-25T17:34:36-07:00'),
(1370021462075, 'cfweidenbach@gmail.com', NULL, '46828 SE 154th Ct', '', 'North Bend', 'Washington', '98045', 'United States', '', 'Chuck', 'Weidenbach', '', '', '', '', '', NULL, '0', 1, 'disabled', 48.41, 1025527119931, NULL, '1', NULL, '0', '', '#IHF163486', 'USD', 1506965454907, 'United States', 'Chuck Weidenbach', 'WA', 'US', 1, 1, '2019-03-25T17:12:00-07:00', '2019-03-25T17:14:22-07:00'),
(1369931153467, 'suzannejbrady@yahoo.com', NULL, '199 bowery', '2B', 'New york', 'New York', '10002', 'United States', NULL, 'Suzanne', 'Brady', '', '', '', '', '', NULL, '0', 1, 'disabled', 34.91, 1025457160251, NULL, '1', NULL, '0', '', '#IHF163483', 'USD', 1506871246907, 'United States', 'Suzanne  Brady', 'NY', 'US', 1, 1, '2019-03-25T16:13:49-07:00', '2019-03-25T16:16:21-07:00'),
(1369912442939, 'racheliza3@gmail.com', NULL, '6401 6th Ave North', '', 'St Petersburg', 'Florida', '33710', 'United States', NULL, 'Rachel', 'Ansert', '', '', '', '', '', NULL, '0', 1, 'disabled', 79.99, 1025512276027, NULL, '1', NULL, '0', '', '#IHF163485', 'USD', 1506853814331, 'United States', 'Rachel Ansert', 'FL', 'US', 1, 1, '2019-03-25T16:03:17-07:00', '2019-03-25T17:02:08-07:00'),
(1369815973947, 'nspangler49@yahoo.com', NULL, '4203 Caddie Drive East', 'Apt 103', 'Bradenton', 'Florida', '34203', 'United States', NULL, 'Nancy', 'Spangler', '', '', '', '', '', NULL, '0', 1, 'disabled', 63.95, 1025374978107, NULL, '1', NULL, '0', '', '#IHF163481', 'USD', 1506768453691, 'United States', 'Nancy Spangler', 'FL', 'US', 1, 1, '2019-03-25T15:13:43-07:00', '2019-03-25T15:15:36-07:00'),
(1369760038971, 'julie.tregeagle@icloud.com', NULL, '4754', 'Idlewild Road', 'Salt Lake City', 'Utah', '84124', 'United States', NULL, 'Julie', 'Tregeagle', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1506722054203, 'United States', 'Julie Tregeagle', 'UT', 'US', 1, 1, '2019-03-25T14:49:01-07:00', '2019-03-25T14:49:02-07:00'),
(1369737592891, 'k-ellen@swbell.net', NULL, '962 E Dogwood Ln', '', 'Fayetteville', 'Arkansas', '72701', 'United States', NULL, 'Kay Ellen', 'Wilkerson', '', '', '', '', '', NULL, '0', 1, 'disabled', 39.43, 1025343553595, NULL, '1', NULL, '0', '', '#IHF163479', 'USD', 1506701410363, 'United States', 'Kay Ellen Wilkerson', 'AR', 'US', 1, 1, '2019-03-25T14:37:54-07:00', '2019-03-25T14:55:04-07:00'),
(1369675366459, 'discotmarie@gmail.com', NULL, '840 church road', '', 'harleysville', 'Pennsylvania', '19438', 'United States', NULL, 'tina', 'disco', '', '', '', '', '', NULL, '0', 1, 'enabled', 64, 1025273233467, NULL, '0', NULL, '0', '', '#IHF163477', 'USD', 1506645770299, 'United States', 'tina disco', 'PA', 'US', 1, 1, '2019-03-25T14:06:57-07:00', '2019-03-25T14:08:23-07:00'),
(1369667502139, 'margh@etex.net', NULL, '2845 Zinnia Road', '', 'Diana', 'Texas', '75640', 'United States', NULL, 'Margarette', 'Higgins', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1506635055163, 'United States', 'Margarette Higgins', 'TX', 'US', 1, 1, '2019-03-25T14:02:41-07:00', '2019-03-25T14:02:41-07:00'),
(1369652232251, 'rosezelinsky@aol.com', NULL, '611 E Scott St', '', 'olyphant', 'Pennsylvania', '18447-1964', 'United States', NULL, 'rose', 'zelinsky', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1506619916347, 'United States', 'rose zelinsky', 'PA', 'US', 1, 1, '2019-03-25T13:54:54-07:00', '2019-03-25T13:54:54-07:00'),
(1369451724859, 'richardrobinson034@gmail.com', NULL, '9683 CR 671', 'BOX 159', 'BUSHNELL ', 'Florida', '33513', 'United States', '', 'Richard', 'Robinson', '', '', '', '', '', NULL, '1', 1, 'disabled', 52.9, 1025112408123, NULL, '1', NULL, '0', '', '#IHF163472', 'USD', 1506434547771, 'United States', 'Richard Robinson', 'FL', 'US', 1, 1, '2019-03-25T12:37:59-07:00', '2019-03-25T12:40:01-07:00'),
(1369275269179, 'russell_greg@comcast.net', NULL, '3333 228th Street Southeast', 'Unit 100', 'Bothell', 'Washington', '98021', 'United States', NULL, 'Lois', 'Baasch', '', '', '', '', '', NULL, '0', 1, 'disabled', 79.7, 1024964165691, NULL, '1', NULL, '0', '', '#IHF163470', 'USD', 1506262679611, 'United States', 'Lois Baasch', 'WA', 'US', 1, 1, '2019-03-25T11:50:47-07:00', '2019-03-25T11:53:00-07:00'),
(1369222217787, 'bwskier@gmail.com', NULL, 'Po Box 1429', '', 'fairplay', 'Colorado', '80440', 'United States', NULL, 'robert', 'White', '', '', '', '', '', NULL, '0', 1, 'disabled', 103.5, 1024892993595, NULL, '1', NULL, '0', '', '#IHF163467', 'USD', 1506209857595, 'United States', 'robert White', 'CO', 'US', 1, 1, '2019-03-25T11:20:51-07:00', '2019-03-25T11:21:37-07:00'),
(1369209503803, 'floydtalmadge@gmail.com', NULL, '629 Nelson Pl', '', 'Wesgtbury', 'New York', '11590', 'United States', '', 'Floyd', 'Ewing', '', '', '', '', '', NULL, '0', 1, 'disabled', 48.41, 1024888602683, NULL, '1', NULL, '0', '', '#IHF163466', 'USD', 1506185674811, 'United States', 'Floyd Ewing', 'NY', 'US', 0, 1, '2019-03-25T11:12:57-07:00', '2019-03-25T11:19:19-07:00'),
(1369178800187, 'j-michels2012@hotmail.com', NULL, '30W400 Army Trail Rd', '', 'Wayne', 'Illinois', '60184', 'United States', '', 'James', 'Michels', '', '', '', '', '', NULL, '1', 1, 'disabled', 79.9, 1024844988475, NULL, '1', NULL, '0', '', '#IHF163464', 'USD', 1506150875195, 'United States', 'James Michels', 'IL', 'US', 1, 1, '2019-03-25T10:54:43-07:00', '2019-03-25T10:56:17-07:00'),
(1369168969787, 'murphymlydia@aol.com', NULL, '201 School Street', '', 'Somerville', 'Massachusetts', '02145', 'United States', NULL, 'Marianne', 'Murphy', '', '', '', '', '', NULL, '0', 1, 'disabled', 64, 1024831586363, NULL, '1', NULL, '0', '', '#IHF163463', 'USD', 1506140487739, 'United States', 'Marianne Murphy', 'MA', 'US', 1, 2, '2019-03-25T10:48:28-07:00', '2019-03-25T10:49:48-07:00'),
(1369096290363, 'katie@ktbresources.com', NULL, '5612 Sunnybrook Circle', '', 'Minnetrista', 'Minnesota', '55364-1272', 'United States', NULL, 'Katie', 'Birthler', '', '', '', '', '', NULL, '0', 1, 'disabled', 64, 1024766869563, NULL, '1', NULL, '0', '', '#IHF163460', 'USD', 1506074427451, 'United States', 'Katie Birthler', 'MN', 'US', 1, 2, '2019-03-25T10:19:30-07:00', '2019-03-25T10:20:43-07:00'),
(1368934776891, 'jhmattsson@comcast.net', NULL, '387 Kelly Ln', '', 'Pisjah Forest', 'North Carolina', '28768', 'United States', '', 'Joanne', 'Mattsson', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1505836761147, 'United States', 'Joanne Mattsson', 'NC', 'US', 1, 2, '2019-03-25T09:31:03-07:00', '2019-03-25T09:31:03-07:00'),
(1368926683195, 'candy1mannumrouno@gmail.com', NULL, '11616 James Grant Dr', '', 'El Paso', 'Texas', '79936', 'United States', NULL, 'Robert', 'Candelarai', '', '', '', '', '', NULL, '0', 1, 'disabled', 199.75, 1024686424123, NULL, '1', NULL, '0', '', '#IHF163458', 'USD', 1505828995131, 'United States', 'Robert Candelarai', 'TX', 'US', 1, 2, '2019-03-25T09:28:59-07:00', '2019-03-25T09:30:25-07:00'),
(1368906268731, 'itsadeal@hotmail.com', NULL, '119 Oakcrest Drive', '', 'Keswick', 'Ontario', 'L4P 3J2', 'Canada', NULL, 'Vern', 'Strom', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1505809629243, 'Canada', 'Vern Strom', 'ON', 'CA', 1, 2, '2019-03-25T09:23:25-07:00', '2019-03-25T09:23:25-07:00'),
(1368840962107, 'SEVENKNOLLS@YAHOO.COM', NULL, '12 Beech Street', '', 'Newton', 'Massachusetts', '02458', 'United States', NULL, 'JOHANNA', 'DILORENZO', '', '', '', '', '', NULL, '0', 1, 'enabled', 39, 1024648871995, NULL, '0', NULL, '0', '', '#IHF163455', 'USD', 1505752088635, 'United States', 'JOHANNA DILORENZO', 'MA', 'US', 1, 2, '2019-03-25T09:00:27-07:00', '2019-03-25T09:04:16-07:00'),
(1368729485371, 'jimmij137@att.net', NULL, '346 Brittingham Drive', '', 'Maryville', 'Tennessee', '37801', 'United States', NULL, 'James', 'Snyder', '', '', '', '', '', NULL, '0', 1, 'disabled', 42.45, 1024522780731, NULL, '1', NULL, '0', '', '#IHF163451', 'USD', 1505638547515, 'United States', 'James Snyder', 'TN', 'US', 1, 2, '2019-03-25T07:51:52-07:00', '2019-03-25T07:53:23-07:00'),
(1368612175931, 'zig959@comcast.net', NULL, '3971 Club Drive Northeast', '', 'Atlanta', 'Georgia', '30319', 'United States', NULL, 'Leigh', 'Connolly', '', '', '', '', '', NULL, '0', 1, 'disabled', 74.99, 1024387776571, NULL, '1', NULL, '0', '', '#IHF163449', 'USD', 1505534214203, 'United States', 'Leigh Connolly', 'GA', 'US', 1, 2, '2019-03-25T06:46:12-07:00', '2019-03-25T06:48:20-07:00'),
(1368603394107, 'jh1972@optimum.net', NULL, '53 Brook Rd', '', 'Upper Saddle River', 'New Jersey', '07458', 'United States', '', 'Jeff', 'Hartman', '', '', '', '', '', NULL, '0', 1, 'disabled', 95.88, 1024377225275, NULL, '1', NULL, '0', '', '#IHF163448', 'USD', 1505525563451, 'United States', 'Jeff  Hartman', 'NJ', 'US', 1, 2, '2019-03-25T06:41:08-07:00', '2019-03-25T06:43:28-07:00');
INSERT INTO `customer_data` (`id`, `email`, `phone`, `address1`, `address2`, `city`, `province`, `zipcode`, `country_name`, `company`, `first_name`, `last_name`, `custo_bdate`, `custo_title`, `custo_gender`, `custo_skintype`, `custo_area_concern`, `custo_issue_concern`, `accepts_marketing`, `orders_count`, `state`, `total_spent`, `last_order_id`, `note`, `verified_email`, `multipass_identifier`, `tax_exempt`, `tags`, `last_order_name`, `currency`, `address_id`, `country`, `name`, `province_code`, `country_code`, `defaultaddress`, `syncpage`, `created_at`, `updated_at`) VALUES
(1368583536699, 'scampensa87@yahoo.com', NULL, '34408 Beach Park Ave', '', 'Eastlake', 'Ohio', '44095', 'United States', NULL, 'Shannon', 'Campensa', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1505507803195, 'United States', 'Shannon Campensa', 'OH', 'US', 1, 2, '2019-03-25T06:28:36-07:00', '2019-03-25T06:28:36-07:00'),
(1368569937979, 'nkohta@hawaii.rr.com', NULL, '1016 Hind Iuka Dr Apt A', '', 'Honolulu', 'Hawaii', '96821', 'United States', NULL, 'Norman K', 'Ohta', '', '', '', '', '', NULL, '0', 1, 'disabled', 69.94, 1024333185083, NULL, '1', NULL, '0', '', '#IHF163447', 'USD', 1505495056443, 'United States', 'Norman K Ohta', 'HI', 'US', 1, 2, '2019-03-25T06:19:25-07:00', '2019-03-25T06:20:18-07:00'),
(1368556175419, 'bethchatoney@gmail.com', NULL, '7041 Hirams Road', '', 'Panama City', 'Florida', '32409', 'United States', '', 'Beth', 'Chatoney', '', '', '', '', '', NULL, '0', 1, 'disabled', 190.4, 1024319782971, NULL, '1', NULL, '0', '', '#IHF163446', 'USD', 1505482539067, 'United States', 'Beth  Chatoney', 'FL', 'US', 1, 2, '2019-03-25T06:11:15-07:00', '2019-03-25T06:12:46-07:00'),
(1368474386491, 'billmontjohn@bellsouth.net', NULL, '2004 9th Ave. North', '', 'Jacksonville Beach', 'Florida', '32250', 'United States', '', 'William', 'Johnson', '', '', '', '', '', NULL, '0', 1, 'disabled', 95.88, 1024214237243, NULL, '1', NULL, '0', '', '#IHF163444', 'USD', 1505404158011, 'United States', 'William Johnson', 'FL', 'US', 1, 2, '2019-03-25T05:08:13-07:00', '2019-03-25T05:09:37-07:00'),
(1368390336571, 'kswilliams1961@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kristy', 'Williams', '', '', '', '', '', NULL, '0', 0, 'enabled', 0, NULL, NULL, '1', NULL, '0', 'google, oxi_social_login', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 2, '2019-03-25T03:58:47-07:00', '2019-03-25T03:58:47-07:00'),
(1368151326779, 'snownymph@mac.com', NULL, '1934 Meridian Boulevard POB100 PMB179', '', 'Mammoth Lakes', 'California', '93546', 'United States', NULL, 'Corinne', 'Newton', '', '', '', '', '', NULL, '1', 0, 'enabled', 0, NULL, NULL, '1', NULL, '0', 'facebook, oxi_social_login', NULL, 'USD', 1505119928379, 'United States', 'Corinne Newton', 'CA', 'US', 1, 2, '2019-03-24T23:41:21-07:00', '2019-03-24T23:43:26-07:00'),
(1368087330875, 'bwoods1108@gmail.com', NULL, '2167 Empire Court', 'Apt G', 'St. Louis', 'Missouri', '63136', 'United States', NULL, 'Jamaica', 'Woods', '', '', '', '', '', NULL, '1', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1505072054331, 'United States', 'Jamaica  Woods ', 'MO', 'US', 1, 2, '2019-03-24T22:27:34-07:00', '2019-03-24T22:27:34-07:00'),
(1368037851195, 'timmy8109@gmail.com', NULL, '2037 Evans Road', '', 'Wichita Falls', 'Texas', '76305', 'United States', NULL, 'Craig', 'Townsend', '', '', '', '', '', NULL, '0', 1, 'disabled', 64, 1023640469563, NULL, '1', NULL, '0', '', '#IHF163440', 'USD', 1505032273979, 'United States', 'Craig Townsend', 'TX', 'US', 1, 2, '2019-03-24T21:36:23-07:00', '2019-03-24T21:37:58-07:00'),
(1368017010747, 'isaacgway@gmail.com', NULL, '2602 Water Avenue', '', 'Selma', 'Alabama', '36703', 'United States', NULL, 'Isaac', 'Galloway', '', '', '', '', '', NULL, '0', 1, 'disabled', 52.9, 1023627362363, NULL, '1', NULL, '0', '', '#IHF163439', 'USD', 1505015496763, 'United States', 'Isaac Galloway', 'AL', 'US', 1, 2, '2019-03-24T21:17:00-07:00', '2019-03-24T21:17:50-07:00'),
(1368001839163, 'hadeng56@gmail.com', NULL, '7451 Warner Avenue', 'E-322', 'Huntington Beach', 'California', '92647', 'United States', NULL, 'Demi', 'Nguyen', '', '', '', '', '', NULL, '1', 1, 'enabled', 64, 1023620317243, NULL, '1', NULL, '0', '', '#IHF163437', 'USD', 1505003470907, 'United States', 'Demi Nguyen', 'CA', 'US', 1, 2, '2019-03-24T21:04:17-07:00', '2019-03-30T18:01:19-07:00'),
(1367964352571, 'lweddel@yahoo.com', NULL, '788. Upton ct ', '', 'San.  Jose', 'California', '95136', 'United States', NULL, 'Laurence', 'Weddel', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1504972734523, 'United States', 'Laurence Weddel', 'CA', 'US', 1, 2, '2019-03-24T20:34:11-07:00', '2019-03-24T20:34:11-07:00'),
(1367932043323, 'jcskowens@surewest.net', NULL, '7005 Regan Court', '', 'Citrus Heights', 'California', '95621', 'United States', NULL, 'john', 'owens', '', '', '', '', '', NULL, '0', 1, 'disabled', 59.9, 1023577653307, NULL, '1', NULL, '0', '', '#IHF163435', 'USD', 1504946454587, 'United States', 'john owens', 'CA', 'US', 1, 2, '2019-03-24T20:10:46-07:00', '2019-03-24T20:14:49-07:00'),
(1367876272187, 'missterryjoseph@gmail.com', NULL, '1316 Deslonde Street', '', 'New Orleans', 'Louisiana', '70117', 'United States', NULL, 'Terry', 'Joseph', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1504902545467, 'United States', 'Terry  Joseph ', 'LA', 'US', 1, 2, '2019-03-24T19:32:42-07:00', '2019-03-24T19:32:42-07:00'),
(1367848615995, 'mbheuer@ocsnet.net', NULL, '20337 Road 172', '', 'Strathmore', 'California', '93267', 'United States', NULL, 'Beth', 'Heuer', '', '', '', '', '', NULL, '0', 1, 'disabled', 67.85, 1023524601915, NULL, '1', NULL, '0', '', '#IHF163432', 'USD', 1504877150267, 'United States', 'Beth  Heuer', 'CA', 'US', 1, 2, '2019-03-24T19:14:36-07:00', '2019-03-24T19:16:43-07:00'),
(1367780917307, 'Cvonruff@live.com', NULL, '9507 Demsey Mill', '', 'SUGAR LAND', 'Texas', '77498', 'United States', NULL, 'Cristina', 'Vonruff', '', '', '', '', '', NULL, '0', 1, 'disabled', 41.91, 1023480201275, NULL, '1', NULL, '0', '', '#IHF163431', 'USD', 1504819773499, 'United States', 'Cristina Vonruff', 'TX', 'US', 1, 2, '2019-03-24T18:31:04-07:00', '2019-03-24T18:32:57-07:00'),
(1367742742587, 'rebeccaschneider2@hotmail.com', NULL, '45 Warfield Street', '', 'Montclair', 'New Jersey', '07043', 'United States', NULL, 'rebecca', 'schneider', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1504789004347, 'United States', 'rebecca schneider', 'NJ', 'US', 1, 2, '2019-03-24T18:08:03-07:00', '2019-03-24T18:08:03-07:00'),
(1367700013115, 'lorealvrz79@aol.com', NULL, '763 E Spencer Ave', '', 'Tipton', 'California', '93272', 'United States', NULL, 'LORENA', 'ALVAREZ', '', '', '', '', '', NULL, '0', 1, 'disabled', 63.9, 1023459852347, NULL, '1', NULL, '0', '', '#IHF163430', 'USD', 1504751452219, 'United States', 'LORENA ALVAREZ', 'CA', 'US', 1, 2, '2019-03-24T17:41:10-07:00', '2019-03-24T18:14:16-07:00'),
(1367696900155, 'edwin.winter@ymail.com', NULL, '10167 Point Pleasant Rd', '', 'Millwood', 'West Virginia', '25262', 'United States', '', 'Edwin', 'Winter', '', '', '', '', '', NULL, '1', 1, 'disabled', 55.41, 1023418892347, NULL, '1', NULL, '0', '', '#IHF163428', 'USD', 1504748929083, 'United States', 'Edwin Winter', 'WV', 'US', 1, 2, '2019-03-24T17:39:18-07:00', '2019-03-24T17:41:17-07:00'),
(1367616520251, 'monmin@paulbunyan.net', NULL, '1083 Tyler Avenue Southeast', '', 'Bemidji', 'Minnesota', '56601', 'United States', NULL, 'shirley', 'buus', '', '', '', '', '', NULL, '0', 1, 'disabled', 43.91, 1023360303163, NULL, '1', NULL, '0', '', '#IHF163427', 'USD', 1504680050747, 'United States', 'shirley buus', 'MN', 'US', 1, 2, '2019-03-24T16:46:27-07:00', '2019-03-24T16:48:50-07:00'),
(1367612325947, 'olivia.clachar@gmail.com', NULL, '158 Glenway Street', '', 'Boston', 'Massachusetts', '02121', 'United States', NULL, 'Olivia', 'Clachar', '', '', '', '', '', NULL, '0', 1, 'disabled', 39.43, 1023357517883, NULL, '1', NULL, '0', '', '#IHF163426', 'USD', 1504676446267, 'United States', 'Olivia Clachar', 'MA', 'US', 1, 2, '2019-03-24T16:43:57-07:00', '2019-03-24T16:46:22-07:00'),
(1367457005627, 'Linda_M-G@hotmail.com', NULL, '31838 12th Place Southwest', '', 'Federal Way', 'Washington', '98023', 'United States', NULL, 'Linda M', 'Griffith', '', '', '', '', '', NULL, '0', 1, 'disabled', 34.91, 1023242403899, NULL, '1', NULL, '0', '', '#IHF163423', 'USD', 1504541671483, 'United States', 'Linda M Griffith', 'WA', 'US', 1, 2, '2019-03-24T15:06:20-07:00', '2019-03-24T15:11:13-07:00'),
(1367407460411, 'stevec077@msn.com', NULL, '503 Palisade Mountain Drive', '', 'Windsor', 'Colorado', '80550', 'United States', NULL, 'Steven', 'Clark', '', '', '', '', '', NULL, '0', 1, 'disabled', 81, 1023208259643, NULL, '1', NULL, '0', '', '#IHF163422', 'USD', 1504502349883, 'United States', 'Steven Clark', 'CO', 'US', 1, 2, '2019-03-24T14:40:14-07:00', '2019-03-24T14:46:58-07:00'),
(1367397498939, 'restes_66@yahoo.com', NULL, '7447 Branch Road', '', 'Medina', 'Ohio', '44256', 'United States', NULL, 'Robin', 'Estes', '', '', '', '', '', NULL, '1', 1, 'disabled', 64, 1023196692539, NULL, '1', NULL, '0', '', '#IHF163421', 'USD', 1504495140923, 'United States', 'Robin Estes', 'OH', 'US', 1, 2, '2019-03-24T14:34:48-07:00', '2019-03-24T14:37:15-07:00'),
(1367392485435, 'glgolf@beyondbb.com', NULL, '2351 Hamilton Rd', '', 'Alamogordo', 'New Mexico', '88310', 'United States', NULL, 'Grant', 'Dalpes', '', '', '', '', '', NULL, '0', 1, 'disabled', 47.9, 1023191777339, NULL, '1', NULL, '0', '', '#IHF163420', 'USD', 1504491831355, 'United States', 'Grant Dalpes', 'NM', 'US', 1, 2, '2019-03-24T14:32:26-07:00', '2019-03-24T14:33:09-07:00'),
(1367363911739, 'dmi5495819@aol.com', NULL, '3251 Rose St ', '', 'Bozeman', 'Montana', '59718', 'United States', '', 'Daryla', 'Miller', '', '', '', '', '', NULL, '0', 1, 'disabled', 66.91, 1023176572987, NULL, '1', NULL, '0', '', '#IHF163419', 'USD', 1504470532155, 'United States', 'Daryla Miller', 'MT', 'US', 1, 2, '2019-03-24T14:18:34-07:00', '2019-03-24T14:21:55-07:00'),
(1367050911803, 'johnp12345@hotmail.com', NULL, '1614-0 Union Valley Rd, # 145', 'PMB #145', 'West Milford', 'New Jersey', '07480', 'United States', NULL, 'John', 'Parkin', '', '', '', '', '', NULL, '1', 1, 'disabled', 39, 1022913577019, NULL, '1', NULL, '0', '', '#IHF163418', 'USD', 1504246431803, 'United States', 'John Parkin', 'NJ', 'US', 1, 2, '2019-03-24T12:05:26-07:00', '2019-03-24T12:07:30-07:00'),
(1367049142331, 'chiefsteward2149@yahoo.com', NULL, '1614-0 Union Valley Rd, # 145', 'PMB #145', 'West Milford', 'New Jersey', '07480', 'United States', NULL, 'John', 'Parkin', '', '', '', '', '', NULL, '1', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1504244957243, 'United States', 'John Parkin', 'NJ', 'US', 1, 2, '2019-03-24T12:04:35-07:00', '2019-03-24T12:04:35-07:00'),
(1366901686331, 'jinnyh406@gmail.com', NULL, '317 Southwest Higgins Avenue', '', 'Missoula', 'Montana', '59803', 'United States', NULL, 'Jinny', 'Hunter', '', '', '', '', '', NULL, '1', 1, 'disabled', 119.62, 1022826676283, NULL, '1', NULL, '0', '', '#IHF163414', 'USD', 1504158449723, 'United States', 'Jinny Hunter ', 'MT', 'US', 1, 2, '2019-03-24T11:09:10-07:00', '2019-03-24T11:15:11-07:00'),
(1366772645947, 'sheriwillan@gmail.com', NULL, '275 Jasmine Street', '', 'Denver', 'Colorado', '80220', 'United States', NULL, 'Sheri', 'Willan', '', '', '', '', '', NULL, '0', 1, 'disabled', 127.99, 1022734827579, NULL, '1', NULL, '0', '', '#IHF163411', 'USD', 1504063291451, 'United States', 'Sheri Willan', 'CO', 'US', 1, 2, '2019-03-24T10:05:55-07:00', '2019-03-24T10:06:35-07:00'),
(1366702915643, 'bdoyal2011@gmail.com', NULL, '406 Elm Lake Drive', '', 'Huffman', 'Texas', '77336', 'United States', NULL, 'brittany', 'Doyal', '', '', '', '', '', NULL, '0', 1, 'disabled', 37.9, 1022695866427, NULL, '1', NULL, '0', '', '#IHF163409', 'USD', 1504017416251, 'United States', 'Brittany Doyal', 'TX', 'US', 1, 2, '2019-03-24T09:34:50-07:00', '2019-03-24T09:35:46-07:00'),
(1366667296827, 'soniamariegulino@gmail.com', NULL, ' 2901 Hodle Ave', '', 'Easton', 'Pennsylvania', '18045', 'United States', '', 'Sonia', 'Gulino', '', '', '', '', '', NULL, '1', 1, 'disabled', 118.18, 1022675976251, NULL, '1', NULL, '0', '', '#IHF163407', 'USD', 1503995658299, 'United States', 'Sonia Gulino', 'PA', 'US', 1, 2, '2019-03-24T09:18:53-07:00', '2019-03-24T09:20:21-07:00'),
(1366541566011, 'mpenn47@outlook.com', NULL, 'PO Box 5246', '', 'Waco', 'Texas', '76708', 'United States', NULL, 'Mary', 'Penn', '', '', '', '', '', NULL, '1', 1, 'disabled', 34.91, 1022606475323, NULL, '1', NULL, '0', '', '#IHF163406', 'USD', 1503916818491, 'United States', 'Mary Penn', 'TX', 'US', 1, 2, '2019-03-24T08:23:58-07:00', '2019-03-24T08:26:10-07:00'),
(1366465216571, 'ayresj@zapecs.com', NULL, '252 Yank Court', '', 'Lakewood', 'Colorado', '80228', 'United States', NULL, 'Jeannette', 'Ayres', '', '', '', '', '', NULL, '0', 1, 'disabled', 34.91, 1022562402363, NULL, '1', NULL, '0', '', '#IHF163405', 'USD', 1503868289083, 'United States', 'Jeannette Ayres', 'CO', 'US', 1, 2, '2019-03-24T07:48:42-07:00', '2019-03-24T07:50:48-07:00'),
(1366464135227, 'nelagarcia00@gmail.com', NULL, '6811 Dusty Lane', '', 'Conroe', 'Texas', '77306', 'United States', NULL, 'Nela', 'Garcia', '', '', '', '', '', NULL, '0', 1, 'disabled', 43.82, 1022560043067, NULL, '1', NULL, '0', '', '#IHF163404', 'USD', 1503867535419, 'United States', 'Nela Garcia', 'TX', 'US', 1, 2, '2019-03-24T07:48:08-07:00', '2019-03-24T07:49:13-07:00'),
(1366426910779, 'cstagaard@yahoo.com', NULL, '547 Board Ave', '', 'Mantoloking', 'New Jersey', '08738', 'United States', NULL, 'Constance', 'Stagaard', '', '', '', '', '', NULL, '0', 1, 'disabled', 64, 1022540218427, NULL, '1', NULL, '0', '', '#IHF163403', 'USD', 1503844565051, 'United States', 'Constance Stagaard', 'NJ', 'US', 1, 2, '2019-03-24T07:30:26-07:00', '2019-03-24T07:31:01-07:00'),
(1366417113147, 'kandgwhite6@hotmail.com', NULL, '651 Tremont Street', '', 'Duxbury', 'Massachusetts', '02332', 'United States', NULL, 'Karen', 'White', '', '', '', '', '', NULL, '0', 1, 'disabled', 64, 1022536941627, NULL, '1', NULL, '0', '', '#IHF163402', 'USD', 1503839027259, 'United States', 'Karen White', 'MA', 'US', 1, 2, '2019-03-24T07:26:06-07:00', '2019-03-24T07:28:01-07:00'),
(1366086975547, 'jrdego@hotmail.com', NULL, '299 East Riverbend Drive', '', 'Sunrise', 'Florida', '33326', 'United States', NULL, 'Jorge', 'de Goicoechea', '', '', '', '', '', NULL, '0', 1, 'disabled', 42.92, 1022340857915, NULL, '1', NULL, '0', '', '#IHF163398', 'USD', 1503625936955, 'United States', 'Jorge de Goicoechea', 'FL', 'US', 1, 2, '2019-03-24T04:01:59-07:00', '2019-03-24T04:02:23-07:00'),
(1365764407355, 'terrellove@yahoo.com', NULL, '509 Powers Ave', '', 'TALLASSEE', 'Alabama', '36078', 'United States', NULL, 'Terrel', 'Brown', '', '', '', '', '', NULL, '1', 1, 'disabled', 34.91, 1022010097723, NULL, '1', NULL, '0', '', '#IHF163396', 'USD', 1503432507451, 'United States', 'Terrel Brown', 'AL', 'US', 0, 2, '2019-03-23T23:51:21-07:00', '2019-03-23T23:54:33-07:00'),
(1365732687931, 'benaroch@telus.net', NULL, '27882 quinton avenue', '', 'abbotsford', 'British Columbia', 'V4X 1J7', 'Canada', NULL, 'benaroch,', 'diane', '', '', '', '', '', NULL, '0', 1, 'disabled', 109.98, 1021966450747, NULL, '1', NULL, '0', '', '#IHF163395', 'USD', 1503409733691, 'Canada', 'benaroch, diane', 'BC', 'CA', 1, 2, '2019-03-23T23:22:21-07:00', '2019-03-23T23:22:49-07:00'),
(1365680750651, 'cindyleetingey@gmail.com', NULL, '1208 W 1775 N', '', 'Lehi', 'Utah', '84043', 'United States', NULL, 'Cindy', 'Tingey', '', '', '', '', '', NULL, '0', 1, 'disabled', 91.41, 1021924900923, NULL, '1', NULL, '0', '', '#IHF163393', 'USD', 1503370510395, 'United States', 'Cindy Tingey', 'UT', 'US', 1, 2, '2019-03-23T22:23:46-07:00', '2019-03-23T22:25:43-07:00'),
(1365563146299, 'drosenfeldt12@gmail.com', NULL, '8349 90TH ST S', '', 'SABIN', 'Minnesota', '56580-9517', 'United States', NULL, 'David', 'Rosenfeldt', '', '', '', '', '', NULL, '1', 1, 'disabled', 179.8, 1021849894971, NULL, '1', NULL, '0', '', '#IHF163392', 'USD', 1503277940795, 'United States', 'David Rosenfeldt', 'MN', 'US', 1, 2, '2019-03-23T20:27:34-07:00', '2019-03-23T20:31:21-07:00'),
(1365335605307, 'AHP2006@Webstar1.net', NULL, '9030 W. Sahara Ave #423', '', 'Las Vegas', 'Nevada', '89117', 'United States', NULL, 'Arthur', 'Posa', '', '', '', '', '', NULL, '0', 1, 'disabled', 39, 1021669048379, NULL, '1', NULL, '0', '', '#IHF163390', 'USD', 1503063572539, 'United States', 'Arthur Posa', 'NV', 'US', 1, 2, '2019-03-23T17:14:06-07:00', '2019-03-23T17:16:42-07:00'),
(1365296971835, 'jamesepperson@hotmail.com', NULL, 'PO Box 648', '', 'Rocksprings', 'Texas', '78880', 'United States', NULL, 'James', 'Epperson', '', '', '', '', '', NULL, '0', 1, 'disabled', 34.95, 1021635821627, NULL, '1', NULL, '0', '', '#IHF163389', 'USD', 1503028314171, 'United States', 'James Epperson', 'TX', 'US', 1, 2, '2019-03-23T16:43:15-07:00', '2019-03-23T16:45:06-07:00'),
(1365279965243, 'americaintegritypaintworks@yahoo.com', NULL, '1350 n olive st', '', 'Cherryvale', 'Kansas', '67335', 'United States', NULL, 'Brad', 'Bowman', '', '', '', '', '', NULL, '0', 1, 'disabled', 39.43, 1021621338171, NULL, '1', NULL, '0', '', '#IHF163388', 'USD', 1503012028475, 'United States', 'Brad Bowman', 'KS', 'US', 1, 2, '2019-03-23T16:29:58-07:00', '2019-03-23T16:31:45-07:00'),
(1365251883067, 'Dave70700@msn.com', NULL, '1689 Wildflowet Drive', '', 'Brighton', 'Colorado', '80601', 'United States', NULL, 'David', 'Acosta', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1502985420859, 'United States', 'David Acosta', 'CO', 'US', 1, 2, '2019-03-23T16:07:54-07:00', '2019-03-23T16:07:54-07:00'),
(1365165211707, 'RFR1025@yahoo.com', NULL, '398 jessica court', '', 'brodheadsville', 'Pennsylvania', '18322', 'United States', NULL, 'Rachel', 'Roskamp', '', '', '', '', '', NULL, '0', 1, 'disabled', 42.45, 1021522804795, NULL, '1', NULL, '0', '', '#IHF163387', 'USD', 1502906908731, 'United States', 'Rachel Roskamp', 'PA', 'US', 1, 2, '2019-03-23T15:09:04-07:00', '2019-03-23T15:09:26-07:00'),
(1365144600635, 'info@tortas2die4.com', NULL, '121 E Baseline Rd', '', 'Claremont', 'California', '91711', 'United States', NULL, 'Ezequiel', 'Casas', '', '', '', '', '', NULL, '0', 1, 'disabled', 52.9, 1021504585787, NULL, '1', NULL, '0', '', '#IHF163386', 'USD', 1502888067131, 'United States', 'Ezequiel Casas', 'CA', 'US', 1, 2, '2019-03-23T14:54:52-07:00', '2019-03-23T14:55:34-07:00'),
(1365123366971, 'pdiestel@me.com', NULL, '10575 North Camelot Circle', '', 'Davie', 'Florida', '33328', 'United States', NULL, 'Peri', 'Diestel', '', '', '', '', '', NULL, '0', 1, 'disabled', 64, 1021495869499, NULL, '1', NULL, '0', '', '#IHF163385', 'USD', 1502869913659, 'United States', 'Peri Diestel', 'FL', 'US', 1, 2, '2019-03-23T14:40:57-07:00', '2019-03-23T14:49:05-07:00'),
(1365027979323, 'laurynpapaleo@yahoo.com', NULL, '4013 dogleg trail', '', 'medina', 'Ohio', '44256', 'United States', NULL, 'lauryn', 'papaleo', '', '', '', '', '', NULL, '0', 1, 'disabled', 42.92, 1021412769851, NULL, '1', NULL, '0', '', '#IHF163383', 'USD', 1502792089659, 'United States', 'lauryn papaleo', 'OH', 'US', 1, 2, '2019-03-23T13:45:30-07:00', '2019-03-23T13:45:59-07:00'),
(1365010645051, 'wileysg@gmail.com', NULL, '477178 East 820 Rd', '', 'stilwell', 'Oklahoma', '74960', 'United States', NULL, 'Steve', 'Grooms', '', '', '', '', '', NULL, '0', 1, 'invited', 34.91, 1021400154171, NULL, '1', NULL, '0', '', '#IHF163382', 'USD', 1502776426555, 'United States', 'Steve Grooms', 'OK', 'US', 1, 2, '2019-03-23T13:34:37-07:00', '2019-03-24T06:27:41-07:00'),
(1364999503931, 'Williams.jenniferp@gmail.com', NULL, '510 S Belnord Ave', '', 'Baltimore', 'Maryland', '21224-3801', 'United States', NULL, 'Jennifer', 'Williams', '', '', '', '', '', NULL, '0', 1, 'disabled', 109, 1021387374651, NULL, '1', NULL, '0', '', '#IHF163381', 'USD', 1502766596155, 'United States', 'Jennifer Williams', 'MD', 'US', 1, 2, '2019-03-23T13:27:29-07:00', '2019-03-23T13:27:51-07:00'),
(1364996522043, 'brianhollinger.1@hotmail.com', NULL, '8340 66th St NW', '', 'Stanley', 'North Dakota', '58784', 'United States', '', 'Brian', 'Hollinger', '', '', '', '', '', NULL, '0', 1, 'disabled', 95.88, 1021386588219, NULL, '1', NULL, '0', '', '#IHF163380', 'USD', 1502763745339, 'United States', 'Brian Hollinger', 'ND', 'US', 1, 2, '2019-03-23T13:25:45-07:00', '2019-03-23T13:27:23-07:00'),
(1364971585595, 'twelve_gauge99@hotmail.com', NULL, '614 Giant Oaks Mill Road', '', 'Wheelersburg', 'Ohio', '45694', 'United States', NULL, 'Pamela', 'Smith', '', '', '', '', '', NULL, '0', 1, 'disabled', 39, 1021365747771, NULL, '1', NULL, '0', '', '#IHF163379', 'USD', 1502742478907, 'United States', 'Pamela Smith', 'OH', 'US', 1, 2, '2019-03-23T13:09:28-07:00', '2019-03-23T13:12:07-07:00'),
(1364860469307, 'surplace217@aol.com', NULL, '217 Harding Avenue', '', 'Toms River', 'New Jersey', '08753', 'United States', NULL, 'Doris', 'Clarici', '', '', '', '', '', NULL, '0', 1, 'disabled', 47.9, 1021253222459, NULL, '1', NULL, '0', '', '#IHF163378', 'USD', 1502645649467, 'United States', 'Doris Clarici', 'NJ', 'US', 1, 2, '2019-03-23T12:01:39-07:00', '2019-03-23T12:04:38-07:00'),
(1364779106363, 'twolfe462@gmail.com', NULL, '207 Brownhome Rd', '', 'New Castle', 'Pennsylvania', '16101', 'United States', NULL, 'Tammy', 'Wolfe', '', '', '', '', '', NULL, '1', 1, 'disabled', 69, 1021170942011, NULL, '1', NULL, '0', '', '#IHF163377', 'USD', 1502576443451, 'United States', 'Tammy Wolfe', 'PA', 'US', 1, 2, '2019-03-23T11:14:25-07:00', '2019-03-23T11:18:11-07:00'),
(1364762591291, 'anna@sterba.net', NULL, '3814 Clear Ridge', '', 'Santa Rosa', 'California', '95404', 'United States', NULL, 'Anna', 'Peterka', '', '', '', '', '', NULL, '0', 1, 'disabled', 64, 1021151313979, NULL, '1', NULL, '0', '', '#IHF163376', 'USD', 1502564286523, 'United States', 'Anna Peterka', 'CA', 'US', 1, 2, '2019-03-23T11:06:06-07:00', '2019-03-23T11:07:00-07:00'),
(1364689420347, 'alissasanchez08@gmail.com', NULL, '2509 New York 9D', 'Unit 2', 'Wappingers Falls', 'New York', '12590', 'United States', NULL, 'Alissa', 'Sanchez', '', '', '', '', '', NULL, '0', 1, 'disabled', 37.9, 1021099966523, NULL, '1', NULL, '0', '', '#IHF163375', 'USD', 1502521688123, 'United States', 'Alissa Sanchez', 'NY', 'US', 1, 2, '2019-03-23T10:39:28-07:00', '2019-03-23T10:40:33-07:00'),
(1364602323003, 'pt2828@hotmail.com', NULL, '658 Buenos Tiempos Dr.', '', 'Camarillo', 'California', '93012', 'United States', NULL, 'Patrick', 'Russell', '', '', '', '', '', NULL, '0', 1, 'disabled', 47.9, 1021029777467, NULL, '1', NULL, '0', '', '#IHF163372', 'USD', 1502470864955, 'United States', 'Patrick Russell', 'CA', 'US', 1, 2, '2019-03-23T10:07:21-07:00', '2019-03-23T10:08:01-07:00'),
(1364602126395, 'luzestela@q.com', NULL, '6591 N Paseo De Gabriel', '', 'Tucson', 'Arizona', '85741', 'United States', NULL, 'david', 'cray', '', '', '', '', '', NULL, '0', 1, 'disabled', 60, 1021032497211, NULL, '1', NULL, '0', '', '#IHF163373', 'USD', 1502470701115, 'United States', 'david cray', 'AZ', 'US', 1, 2, '2019-03-23T10:07:17-07:00', '2019-03-23T10:09:11-07:00'),
(1364329168955, 'msstuard@yahoo.com', NULL, '427 fruit hill ave', '', 'north providence', 'Rhode Island', '02911', 'United States', NULL, 'Mark', 'Stuard', '', '', '', '', '', NULL, '0', 1, 'disabled', 72, 1020803809339, NULL, '1', NULL, '0', '', '#IHF163368', 'USD', 1502317805627, 'United States', 'Mark Stuard', 'RI', 'US', 1, 2, '2019-03-23T08:31:50-07:00', '2019-03-23T08:32:34-07:00'),
(1364242825275, 'sbolton@quiktrip.com', NULL, '11806 South 241st West Avenue', '', 'Sapulpa', 'Oklahoma', '74066', 'United States', NULL, 'Stacey', 'Bolton', '', '', '', '', '', NULL, '0', 1, 'disabled', 64, 1020698525755, NULL, '1', NULL, '0', '', '#IHF163367', 'USD', 1502240211003, 'United States', 'Stacey Bolton', 'OK', 'US', 1, 2, '2019-03-23T07:43:20-07:00', '2019-03-23T07:45:50-07:00'),
(1364224147515, 'carrie.mies@gmail.com', NULL, '3561 Helen Dr', '', 'Pleasanton', 'California', '94588', 'United States', NULL, 'Carrie', 'Mies', '', '', '', '', '', NULL, '0', 1, 'disabled', 39.43, 1020670902331, NULL, '1', NULL, '0', '', '#IHF163366', 'USD', 1502223401019, 'United States', 'Carrie Mies', 'CA', 'US', 1, 2, '2019-03-23T07:33:29-07:00', '2019-03-23T07:34:34-07:00'),
(1364192788539, 'rosa.disomma@vca.com', NULL, '1869 Sturbridge Drive', '', 'Lancaster', 'Pennsylvania', '17601', 'United States', NULL, 'Rosa', 'Disomma', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1502195613755, 'United States', 'Rosa Disomma', 'PA', 'US', 1, 2, '2019-03-23T07:14:29-07:00', '2019-03-23T07:14:29-07:00'),
(1364091797563, 'ericamagsam1983@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Esther', 'Akinremi', '', '', '', '', '', NULL, '0', 0, 'enabled', 0, NULL, NULL, '0', NULL, '0', '', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 2, '2019-03-23T06:13:50-07:00', '2019-03-23T06:13:50-07:00'),
(1363946537019, 'mashnoorbari@gmail.com', NULL, '30 Denton Avenue', '', 'Toronto', 'Ontario', 'M1L 4P2', 'Canada', NULL, 'Mashnoor', 'Bari', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1501988880443, 'Canada', 'Mashnoor Bari', 'ON', 'CA', 1, 2, '2019-03-23T04:29:31-07:00', '2019-03-23T04:29:31-07:00'),
(1363822116923, 'obkuncewicz@tpg.com.au', NULL, 'U2 34 Lewis St.,', '', 'Frankston', 'Victoria', '3199', 'Australia', NULL, 'Barbara', 'Kuncewicz', '', '', '', '', '', NULL, '1', 1, 'disabled', 93.85, 1020144517179, NULL, '1', NULL, '0', '', '#IHF163362', 'USD', 1501896605755, 'Australia', 'Barbara Kuncewicz', 'VIC', 'AU', 1, 2, '2019-03-23T02:50:23-07:00', '2019-03-23T02:58:54-07:00'),
(1363764314171, 'mohammed.mahfoudh@gmail.com', NULL, '182-21 150th Ave', 'DHA 7539', 'Springfield Gardens', 'New York', '11413', 'United States', NULL, 'Mohammed', 'Al-Mahfoudh', '', '', '', '', '', NULL, '0', 1, 'disabled', 72, 1020029108283, NULL, '1', NULL, '0', '', '#IHF163361', 'USD', 1501851779131, 'United States', 'Bayan  Al-Mahfoodh', 'NY', 'US', 1, 2, '2019-03-23T01:52:05-07:00', '2019-03-23T01:53:24-07:00'),
(1363429687355, 'k.rivera7393@gmail.com', NULL, '14004 Sunglow Road Northeast', '', 'Albuquerque', 'New Mexico', '87123', 'United States', NULL, 'Kelly', 'Rivera', '', '', '', '', '', NULL, '0', 1, 'enabled', 43.82, 1019712045115, NULL, '1', NULL, '0', 'google, oxi_social_login', '#IHF163360', 'USD', 1501536354363, 'United States', 'Kelly Rivera', 'NM', 'US', 1, 2, '2019-03-22T19:22:00-07:00', '2019-03-22T19:25:18-07:00'),
(1363412353083, 'shann1070@yahoo.com', NULL, '6516 West Hilton Avenue', '', 'Phoenix', 'Arizona', '85043', 'United States', NULL, 'Shannon', 'Jones', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1501514432571, 'United States', 'Shannon Jones', 'AZ', 'US', 1, 2, '2019-03-22T19:08:18-07:00', '2019-03-22T19:08:18-07:00'),
(1363402883131, 'sherriquiltsalot@gmail.com', NULL, '6034 Blazer Rd', '', 'Greensboro', 'North Carolina', '27407', 'United States', NULL, 'Sherri', 'Fields', '', '', '', '', '', NULL, '0', 1, 'disabled', 37.94, 1019685535803, NULL, '1', NULL, '0', '', '#IHF163359', 'USD', 1501504929851, 'United States', 'Sherri Fields', 'NC', 'US', 1, 2, '2019-03-22T19:01:09-07:00', '2019-03-22T19:01:39-07:00'),
(1363308838971, 'sacop1960@yahoo.com', NULL, '8707 Asheville highway', '', 'Knoxville', 'Tennessee', '37924', 'United States', NULL, 'Paquette,', 'Sheila', '', '', '', '', '', NULL, '0', 1, 'disabled', 267.17, 1019601846331, NULL, '1', NULL, '0', '', '#IHF163358', 'USD', 1501409083451, 'United States', 'Paquette, Sheila', 'TN', 'US', 1, 2, '2019-03-22T17:45:28-07:00', '2019-03-22T17:45:53-07:00'),
(1363272368187, 'carlajvogel@gmail.com', NULL, '2932 Taylor Ave', '', 'Ogden', 'Utah', '84403', 'United States', '', 'Carla', 'Vogel', '', '', '', '', '', NULL, '0', 1, 'disabled', 119.96, 1019573436475, NULL, '1', NULL, '0', '', '#IHF163357', 'USD', 1501375725627, 'United States', 'Carla  Vogel', 'UT', 'US', 1, 2, '2019-03-22T17:19:14-07:00', '2019-03-22T17:21:39-07:00'),
(1363180650555, 'catalinasalgado@yahoo.com', NULL, '7419 Thurow St.', '', 'Houston', 'Texas', '77087', 'United States', NULL, 'Catalina', 'Salgado', '', '', '', '', '', NULL, '0', 1, 'disabled', 48.41, 1019486994491, NULL, '1', NULL, '0', '', '#IHF163354', 'USD', 1501285449787, 'United States', 'Catalina Salgado', 'TX', 'US', 1, 2, '2019-03-22T16:10:10-07:00', '2019-03-22T16:10:55-07:00'),
(1363054985275, 'escues@sbcglobal.net', NULL, '2 BANYAN RD  ', '', 'STUART ', 'Florida', '34996', 'United States', '', 'William', 'Escue', '', '', '', '', '', NULL, '1', 1, 'disabled', 48.41, 1019372470331, NULL, '1', NULL, '0', '', '#IHF163350', 'USD', 1501167157307, 'United States', 'William Escue', 'FL', 'US', 1, 2, '2019-03-22T14:45:28-07:00', '2019-03-22T14:47:25-07:00'),
(1363034767419, 'jcbfluteplayer@sbcglobal.net', NULL, '2812 William Blvd', '', 'Seminole', 'Oklahoma', '74868', 'United States', NULL, 'Janet', 'Brackett', '', '', '', '', '', NULL, '0', 1, 'disabled', 43.91, 1019356315707, NULL, '1', NULL, '0', '', '#IHF163349', 'USD', 1501149593659, 'United States', 'Janet Brackett', 'OK', 'US', 1, 2, '2019-03-22T14:33:37-07:00', '2019-03-22T14:36:01-07:00'),
(1362950881339, 'cjseravo@cox.net', NULL, '156 oak park drive', 'no signature required', 'north providence', 'Rhode Island', '02904', 'United States', NULL, 'camille', 'seravo', '', '', '', '', '', NULL, '0', 1, 'disabled', 64, 1019296481339, NULL, '1', NULL, '0', '', '#IHF163347', 'USD', 1501078028347, 'United States', 'camille seravo', 'RI', 'US', 1, 2, '2019-03-22T13:48:00-07:00', '2019-03-22T13:56:14-07:00'),
(1362944458811, 'alfredoticzon3801@comcast.net', NULL, '4915 BUTLER DR  ', '', 'TROY ', 'Michigan', '48085', 'United States', '', 'Alfredo', 'Ticzon', '', '', '', '', '', NULL, '1', 1, 'disabled', 43.82, 1019281932347, NULL, '1', NULL, '0', '', '#IHF163346', 'USD', 1501072851003, 'United States', 'Alfredo Ticzon', 'MI', 'US', 1, 2, '2019-03-22T13:44:39-07:00', '2019-03-22T13:46:08-07:00'),
(1362920276027, 'pattie35768@yahoo.com', NULL, 'Po Box 1281', '', 'Scottsboro', 'Alabama', '35768', 'United States', NULL, 'Pattie', 'Pierce', '', '', '', '', '', NULL, '1', 1, 'disabled', 64, 1019265613883, NULL, '1', NULL, '0', '', '#IHF163345', 'USD', 1501053583419, 'United States', 'Pattie  Pierce ', 'AL', 'US', 1, 2, '2019-03-22T13:32:38-07:00', '2019-03-22T13:35:13-07:00'),
(1362908151867, '219762805@noemail.com', NULL, '3050 Edgewood St ', '', 'Portage', 'Indiana', '46368', 'United States', '', 'Alan', 'Mcgee', '', '', '', '', '', NULL, '0', 1, 'disabled', 95.88, 1019250245691, NULL, '1', NULL, '0', '', '#IHF163344', 'USD', 1501043884091, 'United States', 'Alan  Mcgee', 'IN', 'US', 1, 2, '2019-03-22T13:26:43-07:00', '2019-03-22T13:27:41-07:00'),
(1362904285243, 'cherylvender1967@gmail.com', NULL, '235 E FREEDOM AVE ', 'APT 106', 'BURNHAM ', 'Pennsylvania', '17009', 'United States', '', 'Cheryl', 'Vender', '', '', '', '', '', NULL, '1', 1, 'disabled', 52.9, 1019247296571, NULL, '1', NULL, '0', '', '#IHF163343', 'USD', 1501040345147, 'United States', 'Cheryl Vender', 'PA', 'US', 1, 2, '2019-03-22T13:24:38-07:00', '2019-03-22T13:25:54-07:00'),
(1362900975675, 'jemajor1@aol.com', NULL, '540 15th Avenue South', '', 'Naples', 'Florida', '34102', 'United States', NULL, 'Jill', 'Major', '', '', '', '', '', NULL, '0', 1, 'disabled', 34.91, 1019244085307, NULL, '1', NULL, '0', '', '#IHF163342', 'USD', 1501037396027, 'United States', 'Jill Major', 'FL', 'US', 1, 2, '2019-03-22T13:22:52-07:00', '2019-03-22T13:23:47-07:00'),
(1362896420923, 'elsass@roadrunner.com', NULL, '1080 Mansker Farms Blvd', '', 'Hendersonville', 'Tennessee', '37075', 'United States', NULL, 'Frederick', 'Elsass', '', '', '', '', '', NULL, '0', 1, 'disabled', 224.75, 1019242119227, NULL, '1', NULL, '0', '', '#IHF163341', 'USD', 1501033529403, 'United States', 'Frederick Elsass', 'TN', 'US', 1, 2, '2019-03-22T13:20:24-07:00', '2019-03-22T13:22:29-07:00'),
(1362891669563, 'mikemarkellos@yahoo.com', NULL, '29 CHISWICK DR  ', '', 'LINDENWOLD ', 'New Jersey', '08021', 'United States', '', 'Michael', 'Markellos', '', '', '', '', '', NULL, '1', 1, 'disabled', 47.8, 1019236843579, NULL, '1', NULL, '0', '', '#IHF163340', 'USD', 1501029892155, 'United States', 'Michael Markellos', 'NJ', 'US', 1, 2, '2019-03-22T13:17:41-07:00', '2019-03-22T13:19:07-07:00'),
(1362887147579, 'dmuhwezi42@gmail.com', NULL, '5723 East Mainsgate Road', '', 'Wichita', 'Kansas', '67220', 'United States', NULL, 'Daniel', 'Muhwezi', '', '', '', '', '', NULL, '0', 1, 'disabled', 37.9, 1019233206331, NULL, '1', NULL, '0', '', '#IHF163339', 'USD', 1501026517051, 'United States', 'Daniel Muhwezi', 'KS', 'US', 1, 2, '2019-03-22T13:15:22-07:00', '2019-03-22T13:16:26-07:00'),
(1362872107067, 'saddlesore13@gmail.com', NULL, '27484 Oregon Rd.', 'Lot 232', 'Perrysburg', 'Ohio', '43551', 'United States', NULL, 'Jon', 'Jungquist', '', '', '', '', '', NULL, '0', 1, 'disabled', 42.92, 1019223605307, NULL, '1', NULL, '0', '', '#IHF163338', 'USD', 1501014589499, 'United States', 'Jon Jungquist', 'OH', 'US', 1, 2, '2019-03-22T13:08:45-07:00', '2019-03-22T13:10:44-07:00'),
(1362579587131, 'kcpics4you@gmail.com', NULL, '2315 SW MORNINGSIDE DR ', '', 'BLUE SPRINGS ', 'Missouri', '64015', 'United States', '', 'Jeannie', 'Slinkard', '', '', '', '', '', NULL, '1', 1, 'disabled', 47.8, 1018900512827, NULL, '1', NULL, '0', '', '#IHF163336', 'USD', 1500748415035, 'United States', 'Jeannie Slinkard', 'MO', 'US', 1, 2, '2019-03-22T10:51:16-07:00', '2019-03-22T10:53:12-07:00'),
(1362510676027, 'cathpretsch@aol.com', NULL, ' 1096 Scenic Gulf Dr', 'UNIT 505', 'Miramar Beach', 'Florida', '32550', 'United States', '', 'Catherine', 'Pretsch', '', '', '', '', '', NULL, '0', 1, 'disabled', 43.91, 1018844610619, NULL, '1', NULL, '0', '', '#IHF163334', 'USD', 1500686614587, 'United States', 'Catherine Pretsch', 'FL', 'US', 1, 2, '2019-03-22T10:18:53-07:00', '2019-03-22T10:32:13-07:00'),
(1362433343547, 'marley3101@yahoo.com', NULL, '2350 freeport st', '', 'Wantagh', 'New York', '11793', 'United States', NULL, 'Shaun', 'Crispyn', '', '', '', '', '', NULL, '0', 1, 'disabled', 119.85, 1018764886075, NULL, '1', NULL, '0', '', '#IHF163331', 'USD', 1500612624443, 'United States', 'Shaun Crispyn', 'NY', 'US', 1, 2, '2019-03-22T09:49:22-07:00', '2019-03-22T09:53:06-07:00'),
(1362421841979, 'rpcarmy@comcast.net', NULL, '12 doris st', '', 'groveland', 'Massachusetts', '01834', 'United States', NULL, 'richard', 'cochran', '', '', '', '', '', NULL, '0', 1, 'disabled', 37.9, 1018749550651, NULL, '1', NULL, '0', '', '#IHF163329', 'USD', 1500603482171, 'United States', 'richard cochran', 'MA', 'US', 1, 2, '2019-03-22T09:43:23-07:00', '2019-03-22T09:43:53-07:00'),
(1362414796859, 'ikmat13@gmail.com', NULL, '', 'APT 1  ', 'PITTSBURGH PA ', 'Pennsylvania', '15201', 'United States', '5617 CELADINE ST ', 'Louis', 'Pisano', '', '', '', '', '', NULL, '1', 1, 'disabled', 198.52, 1018748502075, NULL, '1', NULL, '0', '', '#IHF163328', 'USD', 1500597747771, 'United States', 'Lucian  Pisano', 'PA', 'US', 0, 2, '2019-03-22T09:39:51-07:00', '2019-03-22T09:43:15-07:00'),
(1362411814971, 'mike-robert@live.com', NULL, '2191 Laurens Drive', '', 'Concord', 'North Carolina', '28027', 'United States', NULL, 'Michel', 'Robert', '', '', '', '', '', NULL, '0', 1, 'disabled', 49.92, 1018751057979, NULL, '1', NULL, '0', '', '#IHF163330', 'USD', 1500595060795, 'United States', 'Michel Robert', 'NC', 'US', 1, 2, '2019-03-22T09:38:05-07:00', '2019-03-22T09:44:53-07:00'),
(1362291490875, '9318140310@noemail.com', NULL, '1221 West Commerce St', '', 'Lewisburg', 'Tennessee', '37091', 'United States', '', 'Bobby', 'Harris', '', '', '', '', '', NULL, '0', 1, 'disabled', 55.41, 1028573855803, NULL, '1', NULL, '1', '', '#IHF163555', 'USD', 1500497051707, 'United States', 'Bobby Harris', 'TN', 'US', 1, 2, '2019-03-22T08:38:50-07:00', '2019-03-27T10:47:53-07:00'),
(1362154291259, 'ihuezz@hotmail.com', NULL, '4709 Park Mnr N', '1218', 'Shelby Twp.', 'Michigan', '48316', 'United States', NULL, 'Karl', 'Luther', '', '', '', '', '', NULL, '0', 1, 'disabled', 39.43, 1018533347387, NULL, '1', NULL, '0', '', '#IHF163326', 'USD', 1500370763835, 'United States', 'Karl Luther', 'MI', 'US', 1, 2, '2019-03-22T07:27:04-07:00', '2019-03-22T07:29:49-07:00'),
(1362131288123, 'd.woerner@yahoo.com', NULL, 'PO BOX 171', '', 'WILLIAMSTOWN', 'New York', '13493', 'United States', '', 'Dave', 'Woerner', '', '', '', '', '', NULL, '0', 1, 'disabled', 71.91, 1018508148795, NULL, '1', NULL, '0', '', '#IHF163324', 'USD', 1500352020539, 'United States', 'Dave Woerner', 'NY', 'US', 1, 2, '2019-03-22T07:15:40-07:00', '2019-03-22T07:18:23-07:00'),
(1362130272315, 'wolfordjerry@gmail.com', NULL, '5365 county road 96', '', 'McComb', 'Ohio', '45858', 'United States', NULL, 'Kathy', 'Wolford', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1500351103035, 'United States', 'Kathy Wolford', 'OH', 'US', 1, 2, '2019-03-22T07:15:06-07:00', '2019-03-22T07:15:06-07:00'),
(1362060017723, 'donnurdin1@hotmail.com', NULL, '906 91st St', '', 'Galveston', 'Texas', '77554', 'United States', NULL, 'Donald', 'Nurdin', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1500290285627, 'United States', 'Donald Nurdin', 'TX', 'US', 1, 2, '2019-03-22T06:37:21-07:00', '2019-03-22T06:37:21-07:00'),
(1362040127547, 'suezzyg@hotmail.com', NULL, '17333 Culps Bluff Avenue', '', 'Baton Rouge', 'Louisiana', '70817', 'United States', NULL, 'Susan', 'Guidry', '', '', '', '', '', NULL, '1', 1, 'disabled', 71.91, 1018514047035, NULL, '1', NULL, '0', '', '#IHF163325', 'USD', 1500273147963, 'United States', 'Susan Guidry', 'LA', 'US', 1, 2, '2019-03-22T06:26:52-07:00', '2019-03-22T07:20:49-07:00'),
(1361953882171, 'Kellyollis7@gmail.com', NULL, '716 W MAIN ST ', '', 'Geneva', 'Ohio', '44041', 'United States', NULL, 'KELLY', 'OLLIS', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1500202926139, 'United States', 'KELLY OLLIS', 'OH', 'US', 1, 2, '2019-03-22T05:37:07-07:00', '2019-03-22T05:37:07-07:00'),
(1361939759163, 'wuwei62@yahoo.com', NULL, '4165 Prince Charles Place', '', 'Duluth ', 'Georgia', '30022', 'United States', NULL, 'Marvin', 'Neal', '', '', '', '', '', NULL, '0', 1, 'disabled', 47.9, 1018310262843, NULL, '1', NULL, '0', '', '#IHF163322', 'USD', 1500191850555, 'United States', 'Marvin  Neal', 'GA', 'US', 1, 2, '2019-03-22T05:28:04-07:00', '2019-03-22T05:30:47-07:00'),
(1361909678139, 'shuckhart@comcast.net', NULL, '1739 Hill St.', '', 'White Oak', 'Pennsylvania', '15131', 'United States', NULL, 'Denise', 'Shuckhart', '', '', '', '', '', NULL, '0', 1, 'disabled', 83.99, 1018273660987, NULL, '1', NULL, '0', '', '#IHF163321', 'USD', 1500169601083, 'United States', 'Denise Shuckhart', 'PA', 'US', 1, 2, '2019-03-22T05:10:27-07:00', '2019-03-22T05:11:16-07:00'),
(1361875599419, 'bobcoppola@yahoo.com', NULL, 'buelstr 3', '', 'gersau', NULL, '6442', 'Switzerland', '', 'Robert', 'Coppola', '', '', '', '', '', NULL, '0', 1, 'enabled', 110.82, 1028271734843, NULL, '1', NULL, '0', '', '#IHF163548', 'USD', 1500151971899, 'Switzerland', 'Robert Coppola', NULL, 'CH', 0, 2, '2019-03-22T04:47:22-07:00', '2019-03-27T07:07:04-07:00'),
(1361715757115, 'ger84@aol.com', NULL, '22 Thomas Rd ', '', 'Glen gardner', 'New Jersey', '08826', 'United States', NULL, 'Gerry', 'Mazz', '', '', '', '', '', NULL, '1', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1500020932667, 'United States', 'Gerry Mazz', 'NJ', 'US', 1, 2, '2019-03-22T03:09:13-07:00', '2019-03-22T03:09:13-07:00'),
(1361495228475, 'montipmetajan@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Montip', 'Metajan', '', '', '', '', '', NULL, '0', 0, 'enabled', 0, NULL, NULL, '0', NULL, '0', '', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 2, '2019-03-21T22:44:51-07:00', '2019-03-21T22:44:51-07:00'),
(1361475928123, 'camjohnson2001@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, '1', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', 'newsletter', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 2, '2019-03-21T22:20:10-07:00', '2019-03-21T22:20:10-07:00'),
(1361475534907, 'Luda_vor@yahoo.com', NULL, '1402 West 244th Street', '', 'Harbor City', 'California', '90710', 'United States', NULL, 'Lyudmila', 'King', '', '', '', '', '', NULL, '0', 1, 'disabled', 37.94, 1017651724347, NULL, '1', NULL, '0', '', '#IHF163317', 'USD', 1499793588283, 'United States', 'Lyudmila King', 'CA', 'US', 1, 2, '2019-03-21T22:19:44-07:00', '2019-03-21T22:26:25-07:00'),
(1361364615227, 'jbnoll@gmail.com', NULL, '2020 Southeast Bush Street', '', 'Portland', 'Oregon', '97202', 'United States', NULL, 'Jb', 'Noll', '', '', '', '', '', NULL, '0', 1, 'disabled', 119.85, 1017588842555, NULL, '1', NULL, '0', '', '#IHF163315', 'USD', 1499685126203, 'United States', 'Jb Noll', 'OR', 'US', 1, 2, '2019-03-21T20:57:03-07:00', '2019-03-21T20:59:02-07:00'),
(1361216176187, 'maxrebel@comcast.net', NULL, '5311 Cliff Point Circle West', '', 'Colorado Springs', 'Colorado', '80919', 'United States', NULL, 'Richard', 'Woerner', '', '', '', '', '', NULL, '0', 1, 'enabled', 34.95, 1017476120635, NULL, '0', NULL, '0', '', '#IHF163314', 'USD', 1499546517563, 'United States', 'Richard Woerner', 'CO', 'US', 1, 2, '2019-03-21T18:41:21-07:00', '2019-03-21T18:46:07-07:00'),
(1361089953851, 'mattbaldwin7@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, '1', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', 'newsletter', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 2, '2019-03-21T17:18:20-07:00', '2019-03-21T17:18:20-07:00'),
(1360863690811, 'markgaither104@gmail.com', NULL, '4660 SHANNON CT', '', 'UNION CITY ', 'Georgia', '30291', 'United States', '', 'Mark', 'Gaither', '', '', '', '', '', NULL, '1', 1, 'disabled', 52.9, 1017057771579, NULL, '1', NULL, '0', '', '#IHF163310', 'USD', 1499267956795, 'United States', 'Mark Gaither', 'GA', 'US', 1, 2, '2019-03-21T15:05:13-07:00', '2019-03-21T15:07:04-07:00'),
(1360840261691, 'healthultimatum@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Said', '', '', '', '', '', '', NULL, '0', 0, 'enabled', 0, NULL, NULL, '0', NULL, '0', '', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 2, '2019-03-21T14:52:57-07:00', '2019-03-21T14:52:58-07:00'),
(1360798318651, 'artyom7319fyo@mail.ru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Jasonbek', 'Jasonbek', '', '', '', '', '', NULL, '0', 0, 'enabled', 0, NULL, NULL, '0', NULL, '0', 'newsletter', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 2, '2019-03-21T14:40:16-07:00', '2019-03-21T14:40:19-07:00'),
(1360709222459, 'hritzfam@verizon.net', NULL, '2353 Polk Valley Road', '', 'Hellertown', 'Pennsylvania', '18055', 'United States', NULL, 'david', 'hritz', '', '', '', '', '', NULL, '0', 1, 'disabled', 43.91, 1016927092795, NULL, '1', NULL, '0', '', '#IHF163309', 'USD', 1499140325435, 'United States', 'david hritz', 'PA', 'US', 1, 2, '2019-03-21T14:18:22-07:00', '2019-03-21T14:19:58-07:00'),
(1360654401595, 'lexustlt@aol.com', NULL, '235 Heather Croft', '', 'Egg Harbor Township', 'New Jersey', '08234', 'United States', NULL, 'Tracy', 'Johnson', '', '', '', '', '', NULL, '1', 1, 'disabled', 119.62, 1024133169211, NULL, '1', NULL, '0', '', '#IHF163443', 'USD', 1499092189243, 'United States', 'Tracy Johnson', 'NJ', 'US', 1, 2, '2019-03-21T14:05:02-07:00', '2019-03-25T04:29:29-07:00'),
(1360571629627, 'dazayev79@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, '1', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', 'newsletter', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 2, '2019-03-21T13:45:22-07:00', '2019-03-21T13:45:22-07:00'),
(1360568123451, 'sandra.espinoza1963@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, '1', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', 'newsletter', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 2, '2019-03-21T13:44:33-07:00', '2019-03-21T13:44:33-07:00'),
(1360551837755, 'anderson.darrell59@gmail.com', NULL, '1005 23rd Avenue Southwest', '', 'Rochester', 'Minnesota', '55902', 'United States', NULL, 'Darrell', 'Anderson', '', '', '', '', '', NULL, '0', 1, 'disabled', 42.92, 1016800018491, NULL, '1', NULL, '0', '', '#IHF163307', 'USD', 1499003650107, 'United States', 'Darrell  Anderson ', 'MN', 'US', 1, 2, '2019-03-21T13:40:24-07:00', '2019-03-21T13:43:15-07:00'),
(1360526835771, 'ellisbradley13@yahoo.co.uk', NULL, '32 FULMAR DRIVE', '', 'EAST GRINSTEAD', NULL, 'RH193XL', 'United Kingdom', NULL, 'ellis', 'bradley', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1498979532859, 'United Kingdom', 'ellis bradley', NULL, 'GB', 1, 2, '2019-03-21T13:33:47-07:00', '2019-03-21T13:33:47-07:00'),
(1360514940987, 'catalino.aleman@gmail.com', NULL, '400 commerce st', '', 'Alto', 'Texas', '75925', 'United States', NULL, 'Catalino', 'Aleman', '', '', '', '', '', NULL, '0', 1, 'disabled', 43.82, 1016761909307, NULL, '1', NULL, '0', '', '#IHF163306', 'USD', 1498968686651, 'United States', 'Catalino Aleman', 'TX', 'US', 1, 2, '2019-03-21T13:30:53-07:00', '2019-03-21T13:33:19-07:00'),
(1360497934395, 'koygarza@yahoo.com', NULL, '5414 Persimmon Pass', '', 'Richmond', 'Texas', '77407', 'United States', NULL, 'Koy', 'Garza', '', '', '', '', '', NULL, '1', 1, 'disabled', 64, 1016743231547, NULL, '1', NULL, '0', '', '#IHF163305', 'USD', 1498952466491, 'United States', 'Koy Garza', 'TX', 'US', 1, 2, '2019-03-21T13:26:29-07:00', '2019-03-21T13:28:09-07:00'),
(1360043278395, 'kimby987@comcast.net', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Kathleen', 'Schofield', '', '', '', '', '', NULL, '0', 0, 'enabled', 0, NULL, NULL, '0', NULL, '0', '', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 2, '2019-03-21T11:44:26-07:00', '2019-03-21T11:44:26-07:00'),
(1359946580027, 'lauriezydel@gmail.com', NULL, '39 east lincoln ave', '', 'atlantic highlands', 'New Jersey', '07716', 'United States', NULL, 'laurie', 'zydel', '', '', '', '', '', NULL, '1', 1, 'disabled', 64, 1016407064635, NULL, '1', NULL, '0', '', '#IHF163302', 'USD', 1498453442619, 'United States', 'laurie zydel', 'NJ', 'US', 1, 2, '2019-03-21T11:21:25-07:00', '2019-03-21T11:21:57-07:00'),
(1359789752379, 'arteyes325@aol.com', NULL, '3900 North Federal Highway', '', 'Fort Lauderdale', 'Florida', '33308', 'United States', NULL, 'Arielle', 'Merson', '', '', '', '', '', NULL, '0', 1, 'disabled', 60, 1016357748795, NULL, '1', NULL, '0', '', '#IHF163300', 'USD', 1498318602299, 'United States', 'Arielle Merson', 'FL', 'US', 1, 2, '2019-03-21T10:43:37-07:00', '2019-03-21T10:47:26-07:00'),
(1359750463547, 'mickb@uslink.net', NULL, 'PO Box 604', '', 'Crosslake ', 'Minnesota', '56442', 'United States', NULL, 'Lawrence', 'Bourassa', '', '', '', '', '', NULL, '0', 1, 'disabled', 52.9, 1016341102651, NULL, '1', NULL, '0', '', '#IHF163298', 'USD', 1498283769915, 'United States', 'Lawrence Bourassa', 'MN', 'US', 1, 2, '2019-03-21T10:33:56-07:00', '2019-03-21T10:34:51-07:00'),
(1359608807483, 'seidt110@comcast.net', NULL, '529 Weidman Ave', '', 'Sinking Spring', 'Pennsylvania', '19608', 'United States', NULL, 'Ellen', 'Seidt', '', '', '', '', '', NULL, '0', 1, 'disabled', 44.9, 1016291033147, NULL, '1', NULL, '0', '', '#IHF163297', 'USD', 1498164691003, 'United States', 'Ellen Seidt', 'PA', 'US', 1, 2, '2019-03-21T10:00:10-07:00', '2019-03-21T10:00:55-07:00'),
(1359174860859, 'jeffhecht1949@gmail.com', NULL, '593 HarvestView La.', '', 'Duncansville', 'Pennsylvania', '16635', 'United States', NULL, 'Jeffrey', 'Hecht', '', '', '', '', '', NULL, '0', 1, 'disabled', 89.99, 1016022827067, NULL, '1', NULL, '0', '', '#IHF163294', 'USD', 1497768263739, 'United States', 'Jeffrey Hecht', 'PA', 'US', 1, 2, '2019-03-21T08:11:22-07:00', '2019-03-21T08:14:36-07:00'),
(1358825750587, 'kbowden@sc.rr.com', NULL, '117 Heatherton Street', '--', 'West Columbia', 'South Carolina', '29170', 'United States', NULL, 'K', 'Bowden', '', '', '', '', '', NULL, '0', 1, 'disabled', 147.18, 1015790698555, NULL, '1', NULL, '0', '', '#IHF163291', 'USD', 1497466830907, 'United States', 'K Bowden', 'SC', 'US', 1, 2, '2019-03-21T06:11:58-07:00', '2019-03-21T06:12:26-07:00'),
(1358824243259, 'Freemos95@gmail.com', NULL, '39 Village Green', '', 'Margaret River', 'Western Australia', '6285', 'Australia', NULL, 'Matt', 'Freeman', '', '', '', '', '', NULL, '0', 1, 'disabled', 59.9, 1015789256763, NULL, '1', NULL, '0', '', '#IHF163290', 'USD', 1497465454651, 'Australia', 'Matt Freeman', 'WA', 'AU', 1, 2, '2019-03-21T06:10:40-07:00', '2019-03-21T06:11:23-07:00'),
(1358671413307, 'linda@maryegranger.com', NULL, '3717 Rush Road', '', 'Jarrettsville', 'Maryland', '21084', 'United States', NULL, 'Linda', 'Martin', '', '', '', '', '', NULL, '0', 1, 'disabled', 37.94, 1015566630971, NULL, '1', NULL, '0', '', '#IHF163289', 'USD', 1497308168251, 'United States', 'Linda Martin', 'MD', 'US', 1, 2, '2019-03-21T03:46:08-07:00', '2019-03-21T03:48:32-07:00'),
(1358641594427, 'jamesflor@gmail.com', NULL, '620 Lakeworth Drive', '', 'Gaithersburg', 'Maryland', '20878', 'United States', NULL, 'james', 'florez', '', '', '', '', '', NULL, '0', 1, 'disabled', 83.98, 1015478124603, NULL, '1', NULL, '0', '', '#IHF163288', 'USD', 1497279889467, 'United States', 'james florez', 'MD', 'US', 1, 2, '2019-03-21T03:14:12-07:00', '2019-03-21T03:15:25-07:00');
INSERT INTO `customer_data` (`id`, `email`, `phone`, `address1`, `address2`, `city`, `province`, `zipcode`, `country_name`, `company`, `first_name`, `last_name`, `custo_bdate`, `custo_title`, `custo_gender`, `custo_skintype`, `custo_area_concern`, `custo_issue_concern`, `accepts_marketing`, `orders_count`, `state`, `total_spent`, `last_order_id`, `note`, `verified_email`, `multipass_identifier`, `tax_exempt`, `tags`, `last_order_name`, `currency`, `address_id`, `country`, `name`, `province_code`, `country_code`, `defaultaddress`, `syncpage`, `created_at`, `updated_at`) VALUES
(1358596374587, 'wkeimig@gmail.com', NULL, '6144 MARLEN CIR SE', '', 'Prior Lake', 'Minnesota', '55372-2128', 'United States', NULL, 'Wendy', 'Keimig', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1497236406331, 'United States', 'Wendy Keimig', 'MN', 'US', 1, 2, '2019-03-21T02:16:31-07:00', '2019-03-21T02:16:31-07:00'),
(1358512881723, '7787jay@gmail.com', NULL, '20 Newport Street', 'Peregian Breeze Estate', 'Peregian Beach', 'Queensland', '4573', 'Australia', NULL, 'J', 'Elder', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1497135218747, 'Australia', 'J Elder', 'QLD', 'AU', 1, 2, '2019-03-21T00:40:11-07:00', '2019-03-21T00:40:11-07:00'),
(1358360412219, 'jgordoski@gmail.com', NULL, '349 Sheppard Road', '', 'Rogers', 'Arkansas', '72756-9623', 'United States', NULL, 'JOHN', 'GORDOSKI', '', '', '', '', '', NULL, '0', 1, 'disabled', 39.43, 1014788390971, NULL, '1', NULL, '0', '', '#IHF163287', 'USD', 1496974295099, 'United States', 'JOHN GORDOSKI', 'AR', 'US', 1, 2, '2019-03-20T21:59:51-07:00', '2019-03-20T22:01:44-07:00'),
(1358311129147, 'hardbaz@live.ca', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, '1', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', 'newsletter', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 2, '2019-03-20T21:15:19-07:00', '2019-03-20T21:16:41-07:00'),
(1358246641723, 'judithzipkin@gmail.com', NULL, '70 Beth Page Drive', '', 'MONROE TOWNSHIP', 'New Jersey', '08831-8835', 'United States', NULL, 'Judith', 'Zipkin', '', '', '', '', '', NULL, '0', 1, 'disabled', 64, 1014611640379, NULL, '1', NULL, '0', '', '#IHF163285', 'USD', 1496892932155, 'United States', 'Judith Zipkin', 'NJ', 'US', 1, 2, '2019-03-20T20:26:10-07:00', '2019-03-20T20:27:04-07:00'),
(1358203027515, 'jimmy196411@gmail.com', NULL, '134 Usery Rd', '', 'Searcy', 'Arkansas', '72143', 'United States', '', 'Jimmy', 'Chaloupka', '', '', '', '', '', NULL, '0', 2, 'disabled', 57.51, 1014580936763, NULL, '1', NULL, '0', '', '#IHF163284', 'USD', 1496860393531, 'United States', 'Jimmy Chaloupka', 'AR', 'US', 1, 2, '2019-03-20T19:55:00-07:00', '2019-03-20T20:19:02-07:00'),
(1358110949435, 'MTUNA@ME.COM', NULL, '17 Heritage Way', '', 'Rockaway', 'New Jersey', '07866', 'United States', NULL, 'MEHMET', 'TUNA', '', '', '', '', '', NULL, '0', 1, 'disabled', 82.8, 1014430793787, NULL, '1', NULL, '0', '', '#IHF163280', 'USD', 1496785780795, 'United States', 'MEHMET TUNA', 'NJ', 'US', 1, 2, '2019-03-20T18:55:50-07:00', '2019-03-20T18:57:46-07:00'),
(1357982302267, 'jksalemi@aol.com', NULL, '7836 Lascala Boulevard', '', 'Indianapolis', 'Indiana', '46237', 'United States', NULL, 'Janet', 'Salemi', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1496631738427, 'United States', 'Janet Salemi', 'IN', 'US', 1, 2, '2019-03-20T17:35:52-07:00', '2019-03-20T17:35:52-07:00'),
(1357975519291, 'wallaceprince43@gmail.com', NULL, '200 Tudor Circle', '', 'Brandon', 'Mississippi', '39042', 'United States', NULL, 'Melba', 'Prince', '', '', '', '', '', NULL, '0', 1, 'disabled', 119.62, 1014334390331, NULL, '1', NULL, '0', '', '#IHF163278', 'USD', 1496626561083, 'United States', 'Melba Prince', 'MS', 'US', 1, 2, '2019-03-20T17:31:22-07:00', '2019-03-20T17:33:49-07:00'),
(1357822787643, 'felipe85-@live.com', NULL, '427 yale dr', '', 'hampton', 'Virginia', '23666-3721', 'United States', NULL, 'Felipe', 'Colon', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1496510169147, 'United States', 'Felipe Colon', 'VA', 'US', 1, 2, '2019-03-20T15:54:29-07:00', '2019-03-20T15:54:29-07:00'),
(1357789888571, 'dmp@stny.rr.com', NULL, '740 Grant Street', '', 'Johnson City', 'New York', '13790', 'United States', NULL, 'Dan', 'Peworchik', '', '', '', '', '', NULL, '0', 1, 'disabled', 39.43, 1014215213115, NULL, '1', NULL, '0', '', '#IHF163275', 'USD', 1496489033787, 'United States', 'Dan Peworchik', 'NY', 'US', 1, 2, '2019-03-20T15:37:56-07:00', '2019-03-20T15:39:05-07:00'),
(1357746274363, 'ethal55@gmail.com', NULL, '8583 Big Creek Parkway', '', 'Strongsville', 'Ohio', '44149', 'United States', NULL, 'Albert', 'Etheart', '', '', '', '', '', NULL, '0', 1, 'disabled', 79.7, 1014203252795, NULL, '1', NULL, '0', '', '#IHF163274', 'USD', 1496458199099, 'United States', 'Albert Etheart ', 'OH', 'US', 1, 2, '2019-03-20T15:16:20-07:00', '2019-03-20T15:30:36-07:00'),
(1357442285627, 'djhun@centurytel.net', NULL, 'PO BOX 144  ', '', 'NEW LOTHROP ', 'Michigan', '48460', 'United States', '', 'Dennis', 'Huntoon', '', '', '', '', '', NULL, '1', 1, 'disabled', 57.51, 1014097182779, NULL, '1', NULL, '0', '', '#IHF163272', 'USD', 1496103387195, 'United States', 'Dennis Huntoon', 'MI', 'US', 1, 2, '2019-03-20T14:14:25-07:00', '2019-03-20T14:15:31-07:00'),
(1357378289723, 'paula.slipke@gmail.com', NULL, '2625 E Walnut court', '', 'WOODRIDGE', 'Illinois', '60517', 'United States', NULL, 'Paula', 'Slipke', '', '', '', '', '', NULL, '0', 1, 'invited', 39.43, 1014084239419, NULL, '1', NULL, '0', '', '#IHF163271', 'USD', 1496024776763, 'United States', 'Paula Slipke', 'IL', 'US', 1, 2, '2019-03-20T14:04:23-07:00', '2019-03-28T18:21:19-07:00'),
(1357317505083, 'chucklesdorsey@gmail.com', NULL, '13962 N. Bowcreek spgs', '', 'Tucson', 'Arizona', '85755', 'United States', NULL, 'John', 'Dorsey', '', '', '', '', '', NULL, '0', 1, 'disabled', 52.9, 1014073753659, NULL, '1', NULL, '0', '', '#IHF163270', 'USD', 1495954948155, 'United States', 'John Dorsey', 'AZ', 'US', 1, 2, '2019-03-20T13:55:39-07:00', '2019-03-20T13:58:17-07:00'),
(1356826607675, '6164573787@noemail.com', NULL, '3800 Kenowa Ave SW', '', 'Grandville', 'Michigan', '49418', 'United States', '', 'Don', 'Evert', '', '', '', '', '', NULL, '0', 1, 'disabled', 43.91, 1013958180923, NULL, '1', NULL, '0', '', '#IHF163269', 'USD', 1495347986491, 'United States', 'Don Evert', 'MI', 'US', 1, 2, '2019-03-20T12:39:59-07:00', '2019-03-20T12:41:22-07:00'),
(1356680167483, 'mr.schmidt2278@gmail.com', NULL, '5575 lower 182nd st', '', 'Farmington', 'Minnesota', '55024', 'United States', NULL, 'Mike', 'Schmidt', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1495075258427, 'United States', 'Mike Schmidt', 'MN', 'US', 1, 2, '2019-03-20T12:04:49-07:00', '2019-03-20T12:04:49-07:00'),
(1356672106555, 'shebizzle31@yahoo.com', NULL, '1779 Bristol Dr', '', 'Milford', 'Michigan', '48380', 'United States', NULL, 'Mindy', 'Ansel', '', '', '', '', '', NULL, '0', 1, 'disabled', 64, 1013886582843, NULL, '1', NULL, '0', '', '#IHF163266', 'USD', 1495039443003, 'United States', 'Mindy  Ansel', 'MI', 'US', 1, 2, '2019-03-20T11:59:55-07:00', '2019-03-20T12:00:39-07:00'),
(1356671352891, '1st.inplace@gmail.com', NULL, '#7-721 W 57th Ave', '', 'Vancouver', 'British Columbia', 'V6P 1S2', 'Canada', '', 'Bill', 'Barber', '', '', '', '', '', NULL, '1', 1, 'disabled', 164.84, 1013894611003, NULL, '1', NULL, '0', '', '#IHF163267', 'USD', 1495035707451, 'Canada', 'Bill Barber', 'BC', 'CA', 1, 2, '2019-03-20T11:59:22-07:00', '2019-03-20T12:04:16-07:00'),
(1356603555899, 'teamanderson79@gmail.com', NULL, '1582 Rebecca Lane', '', 'El Cajon', 'California', '92019', 'United States', NULL, 'lisa', 'anderson', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1494761078843, 'United States', 'lisa anderson', 'CA', 'US', 1, 2, '2019-03-20T11:20:42-07:00', '2019-03-20T11:20:42-07:00'),
(1356597493819, '9312128694@noemail.com', NULL, '39 Taylor Ln', '', 'Fayetteville', 'Tennessee', '37334', 'United States', '', 'Jeff', 'Mcgee', '', '', '', '', '', NULL, '0', 1, 'disabled', 55.41, 1013803712571, NULL, '1', NULL, '0', '', '#IHF163265', 'USD', 1494735650875, 'United States', 'Jeff Mcgee', 'TN', 'US', 1, 2, '2019-03-20T11:16:54-07:00', '2019-03-20T11:19:49-07:00'),
(1356586287163, 'melissafoster214@gmail.com', NULL, '125 Harvin St', '', 'Spartanberg', 'South Carolina', '29303', 'United States', '', 'Melissa', 'Foster', '', '', '', '', '', NULL, '1', 1, 'disabled', 149.52, 1013788409915, NULL, '1', NULL, '0', '', '#IHF163264', 'USD', 1494693347387, 'United States', 'Melissa Foster', 'SC', 'US', 1, 2, '2019-03-20T11:10:51-07:00', '2019-03-20T11:12:43-07:00'),
(1356502859835, 'Kylesalinas824@gmail.com', NULL, '4012 Tyne Dr', '', 'Durham', 'North Carolina', '27703-7109', 'United States', NULL, 'Kyle', 'Salinas', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1494382805051, 'United States', 'Kyle Salinas', 'NC', 'US', 1, 2, '2019-03-20T10:26:09-07:00', '2019-03-20T10:26:09-07:00'),
(1356498239547, 'rolandliddell@gmail.com', NULL, '', '', 'CORTE MADERA ', 'California', '94976', 'United States', 'PO BOX 584', 'Roland', 'Liddell', '', '', '', '', '', NULL, '1', 1, 'disabled', 80.91, 1013707472955, NULL, '1', NULL, '0', '', '#IHF163262', 'USD', 1494366126139, 'United States', 'Roland Liddell', 'CA', 'US', 1, 2, '2019-03-20T10:23:36-07:00', '2019-03-20T10:28:10-07:00'),
(1356460884027, 'craigs11us@yahoo.com', NULL, '5677 W STATE ROUTE 73', '', 'Wilmington', 'Ohio', '45177', 'United States', NULL, 'Craig', 'Satterthwaite', '', '', '', '', '', NULL, '0', 1, 'disabled', 63.9, 1013667201083, NULL, '1', NULL, '0', '', '#IHF163261', 'USD', 1494204121147, 'United States', 'Craig Satterthwaite', 'OH', 'US', 1, 2, '2019-03-20T09:59:25-07:00', '2019-03-20T10:00:23-07:00'),
(1356402851899, '9767665905@noemail.com', NULL, '93 Holten St', '', 'Danvers', 'Massachusetts', '01923', 'United States', '', 'Terry', 'Burnett', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1493974548539, 'United States', 'Terry  Burnett', 'MA', 'US', 1, 2, '2019-03-20T09:24:36-07:00', '2019-03-20T09:25:36-07:00'),
(1356379750459, 'vsmotrov@yahoo.com', NULL, '14205 Twig rd', '', 'Silver Spring', 'Maryland', '20905', 'United States', NULL, 'Vadim', 'Smotrov', '', '', '', '', '', NULL, '0', 1, 'disabled', 46.43, 1013578563643, NULL, '1', NULL, '0', '', '#IHF163259', 'USD', 1493888761915, 'United States', 'Vadim Smotrov', 'MD', 'US', 1, 2, '2019-03-20T09:11:24-07:00', '2019-03-20T09:14:22-07:00'),
(1356377325627, 'jbthorsell@nc.rr.com', NULL, '1205 Alderwood Court', '', 'Apex', 'North Carolina', '27502', 'United States', NULL, 'Jeff', 'Thorsell', '', '', '', '', '', NULL, '1', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1493877424187, 'United States', 'Jeff Thorsell', 'NC', 'US', 1, 2, '2019-03-20T09:09:39-07:00', '2019-03-20T09:09:39-07:00'),
(1356358746171, 'dftu@comcast.net', NULL, '7845 E Calle de la Escarpa', '', 'Tucson', 'Arizona', '85750', 'United States', NULL, 'David', 'Freeman', '', '', '', '', '', NULL, '0', 1, 'disabled', 127.99, 1013784838203, NULL, '1', NULL, '0', '', '#IHF163263', 'USD', 1493800714299, 'United States', 'David Freeman', 'AZ', 'US', 1, 2, '2019-03-20T08:57:46-07:00', '2019-03-20T11:10:57-07:00'),
(1356311101499, 'vmbmiranda@yahoo.com.br', NULL, '3001 McKnight East Drive', 'Apt. 409', 'Pittsburgh', 'Pennsylvania', '15237', 'United States', NULL, 'Vania', 'Miranda', '', '', '', '', '', NULL, '0', 1, 'enabled', 39.43, 1013507457083, NULL, '1', NULL, '0', 'facebook, oxi_social_login', '#IHF163257', 'USD', 1493623570491, 'United States', 'VANIA MIRANDA', 'PA', 'US', 1, 2, '2019-03-20T08:26:16-07:00', '2019-03-20T08:29:10-07:00'),
(1356290785339, 'rawl917@yahoo.com', NULL, '617 Bordentown Rd', '', 'Burlington', 'New Jersey', '08016', 'United States', '', 'Russell', 'Rawlings', '', '', '', '', '', NULL, '1', 1, 'disabled', 48.41, 1013489664059, NULL, '1', NULL, '0', '', '#IHF163255', 'USD', 1493529264187, 'United States', 'Russell Rawlings', 'NJ', 'US', 1, 2, '2019-03-20T08:13:44-07:00', '2019-03-20T08:15:20-07:00'),
(1356280528955, 'floutlaw2@yahoo.com', NULL, '864 Bulls Rd', '', 'Taylors', 'South Carolina', '29687', 'United States', NULL, 'Frank', 'Outlaw', '', '', '', '', '', NULL, '0', 1, 'disabled', 47.8, 1013490745403, NULL, '1', NULL, '0', '', '#IHF163256', 'USD', 1493487648827, 'United States', 'Frank Outlaw', 'SC', 'US', 1, 2, '2019-03-20T08:06:57-07:00', '2019-03-20T08:16:06-07:00'),
(1356278267963, 'patti.oneal59@icloud.com', NULL, '108 Oak Pond Pl', '', 'Franklinton', 'North Carolina', '27525-9581', 'United States', NULL, 'Patricia', 'O Neal', '', '', '', '', '', NULL, '0', 1, 'disabled', 43.91, 1013466857531, NULL, '1', NULL, '0', '', '#IHF163253', 'USD', 1493477916731, 'United States', 'Patricia O Neal', 'NC', 'US', 1, 2, '2019-03-20T08:05:27-07:00', '2019-03-20T08:05:59-07:00'),
(1356181307451, 'haysandee@comcast.net', NULL, '5106 damon dr', '', 'north chesterfield', 'Virginia', '23234', 'United States', NULL, 'Sandra', 'Hayes', '', '', '', '', '', NULL, '0', 1, 'disabled', 60, 1013346631739, NULL, '1', NULL, '0', '', '#IHF163252', 'USD', 1493063630907, 'United States', 'Sandra Hayes', 'VA', 'US', 1, 2, '2019-03-20T06:58:29-07:00', '2019-03-20T07:00:17-07:00'),
(1356166791227, 'I2B4@AOL.COM', NULL, '22 Danzar', '', 'Fort Pierce', 'Florida', '34951', 'United States', NULL, 'Irene', 'Kanzler', '', '', '', '', '', NULL, '0', 2, 'enabled', 188, 1027009773627, NULL, '1', NULL, '0', '', '#IHF163528', 'USD', 1492999405627, 'United States', 'Irene Kanzler', 'FL', 'US', 1, 2, '2019-03-20T06:48:04-07:00', '2019-03-26T13:17:35-07:00'),
(1356149325883, 'fitzdarby5388@aol.com', NULL, '3615 Franklin St. ', '', 'Wantagh', 'New York', '11793', 'United States', NULL, 'Rhonda', 'Darby', '', '', '', '', '', NULL, '0', 1, 'disabled', 47.9, 1013304918075, NULL, '1', NULL, '0', '', '#IHF163250', 'USD', 1492946780219, 'United States', 'Rhonda Darby', 'NY', 'US', 1, 2, '2019-03-20T06:35:10-07:00', '2019-03-20T06:36:52-07:00'),
(1356108202043, 'sarahschumann23@yahoo.com', NULL, '40 Parkwood Street', 'B-1', 'Albany', 'New York', '12208', 'United States', NULL, 'Sarah', 'Schumann', '', '', '', '', '', NULL, '0', 1, 'disabled', 93.85, 1013256028219, NULL, '1', NULL, '0', '', '#IHF163248', 'USD', 1492903460923, 'United States', 'Sarah  Schumann ', 'NY', 'US', 1, 2, '2019-03-20T06:02:26-07:00', '2019-03-20T06:05:05-07:00'),
(1356041912379, 'nis1969@gmail.com', NULL, '1456 Nevada Drive Unit B', '', 'Grand Forks AFB', 'North Dakota', '58204', 'United States', NULL, 'Anissa', 'Goehring', '', '', '', '', '', NULL, '1', 1, 'disabled', 39.43, 1013170274363, NULL, '1', NULL, '0', '', '#IHF163245', 'USD', 1492833534011, 'United States', 'Anissa Goehring', 'ND', 'US', 1, 2, '2019-03-20T05:05:59-07:00', '2019-03-20T05:06:33-07:00'),
(1355921850427, 'danahisle@rocketmail.com', NULL, '6429 North Clinton Street', '', 'Terre Haute', 'Indiana', '47805', 'United States', NULL, 'Dana', 'Hisle', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1492710129723, 'United States', 'Dana Hisle', 'IN', 'US', 1, 2, '2019-03-20T02:46:49-07:00', '2019-03-20T02:46:50-07:00'),
(1355657347131, 'marciakay8@hotmail.com', NULL, '4450 West Mason Road', '', 'Howell', 'Michigan', '48843', 'United States', NULL, 'marcia', 'churchill', '', '', '', '', '', NULL, '0', 1, 'disabled', 64, 1012598112315, NULL, '1', NULL, '0', '', '#IHF163240', 'USD', 1492451590203, 'United States', 'marcia churchill', 'MI', 'US', 1, 2, '2019-03-19T20:55:12-07:00', '2019-03-19T20:56:38-07:00'),
(1355645517883, 'donbowen1914@gmail.com', NULL, '354 Creedmoor Rd', '', 'Jacksonville', 'North Carolina', '28546', 'United States', '', 'Don', 'Bowen', '', '', '', '', '', NULL, '0', 1, 'disabled', 48.41, 1012589985851, NULL, '1', NULL, '0', '', '#IHF163238', 'USD', 1492441137211, 'United States', 'Don Bowen', 'NC', 'US', 1, 2, '2019-03-19T20:44:05-07:00', '2019-03-19T20:45:46-07:00'),
(1355544199227, 'hackergfd@gmail.com', NULL, '10250 E. Mountain View Rd', 'Apt 179', 'Scottsdale', 'Arizona', '85258', 'United States', NULL, 'Gary', 'Dowell', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1492334641211, 'United States', 'Gary Dowell', 'AZ', 'US', 1, 2, '2019-03-19T19:05:15-07:00', '2019-03-19T19:05:15-07:00'),
(1355531649083, 'carolhaecker@comcast.net', NULL, '5560 Tournament Drive', '', 'Haymarket', 'Virginia', '20169', 'United States', NULL, 'Carol', 'Haecker', '', '', '', '', '', NULL, '0', 1, 'disabled', 72, 1012497940539, NULL, '1', NULL, '0', '', '#IHF163232', 'USD', 1492322287675, 'United States', 'Carol Haecker', 'VA', 'US', 1, 2, '2019-03-19T18:54:41-07:00', '2019-03-19T18:57:40-07:00'),
(1355528798267, 'jcharpentier65@gmail.com', NULL, '612 Rusty Ct', '', 'ALTOONA', 'Wisconsin', '54720', 'United States', NULL, 'Jason', 'Charpentier', '', '', '', '', '', NULL, '0', 1, 'disabled', 34.91, 1012518912059, NULL, '1', NULL, '0', '', '#IHF163235', 'USD', 1492319174715, 'United States', 'Jason Charpentier', 'WI', 'US', 1, 2, '2019-03-19T18:52:14-07:00', '2019-03-19T19:20:04-07:00'),
(1355518902331, 'krutledge73@gmail.com', NULL, '2009 Travianna Court', '', 'Raleigh', 'North Carolina', '27609', 'United States', NULL, 'Kim', 'Rutledge', '', '', '', '', '', NULL, '0', 1, 'disabled', 33.45, 1012486209595, NULL, '1', NULL, '0', '', '#IHF163231', 'USD', 1492309147707, 'United States', 'Kim Rutledge', 'NC', 'US', 1, 2, '2019-03-19T18:43:35-07:00', '2019-03-19T18:44:05-07:00'),
(1355374166075, 'cty35799@centurytel.net', NULL, '8133 N Dannenburg', '', 'Miton', 'Wisconsin', '53563', 'United States', NULL, 'Janet', 'Sturm', '', '', '', '', '', NULL, '1', 1, 'disabled', 113.92, 1012442431547, NULL, '1', NULL, '0', '', '#IHF163230', 'USD', 1492171817019, 'United States', 'Janet Sturm', 'WI', 'US', 1, 2, '2019-03-19T17:10:03-07:00', '2019-03-19T18:00:11-07:00'),
(1355197055035, 'babeck3@gmail.com', NULL, '2312 39th Street', '', 'Des Moines', 'Iowa', '50310', 'United States', NULL, 'barbara', 'beckley', '', '', '', '', '', NULL, '0', 1, 'disabled', 64, 1012315619387, NULL, '1', NULL, '0', '', '#IHF163227', 'USD', 1492002406459, 'United States', 'barbara beckley', 'IA', 'US', 1, 2, '2019-03-19T16:05:41-07:00', '2019-03-19T16:09:51-07:00'),
(1355195088955, 'orly.dolatre@yahoo.com', NULL, '4522 QUEEN ANNE DR  ', '', 'UNION CITY', 'California', '94587', 'United States', '', 'Orlando', 'Dolatre', '', '', '', '', '', NULL, '1', 1, 'disabled', 48.41, 1012312309819, NULL, '1', NULL, '0', '', '#IHF163226', 'USD', 1492000243771, 'United States', 'Orlando Dolatre', 'CA', 'US', 1, 2, '2019-03-19T16:04:21-07:00', '2019-03-19T16:07:32-07:00'),
(1355068440635, 'kittymurwrig@yahoo.com', NULL, '2421 Rohrer Street Northwest', '', 'North Canton', 'Ohio', '44720', 'United States', NULL, 'Kathleen', 'Wright', '', '', '', '', '', NULL, '0', 1, 'disabled', 64, 1012254867515, NULL, '1', NULL, '0', '', '#IHF163225', 'USD', 1491827392571, 'United States', 'Kathleen  Wright ', 'OH', 'US', 1, 2, '2019-03-19T15:15:53-07:00', '2019-03-19T15:17:55-07:00'),
(1355052056635, 'nancychelin@gmail.com', NULL, '9550 E Thunderbird, Rd UNIT 117', '', 'Scottsdale', 'Arizona', '85260', 'United States', NULL, 'Nancy', 'Chelin', '', '', '', '', '', NULL, '0', 1, 'disabled', 34.91, 1012239335483, NULL, '1', NULL, '0', '', '#IHF163224', 'USD', 1491810877499, 'United States', 'Nancy Chelin', 'AZ', 'US', 1, 2, '2019-03-19T15:04:16-07:00', '2019-03-19T15:05:05-07:00'),
(1355046486075, '0596-x205@noemail.com', NULL, '14110 SW TEAL BLVD', 'APT D26', 'BEAVERTON', 'Oregon', '97008', 'United States', '', 'Arturo', 'Portillo', '', '', '', '', '', NULL, '1', 1, 'disabled', 52.9, 1012235567163, NULL, '1', NULL, '0', '', '#IHF163223', 'USD', 1491805143099, 'United States', 'Arturo Portillo', 'OR', 'US', 1, 2, '2019-03-19T15:00:22-07:00', '2019-03-19T15:02:04-07:00'),
(1355027906619, 'bobby.thurman@att.net', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bob', 'Thurman', '', '', '', '', '', NULL, '0', 0, 'enabled', 0, NULL, NULL, '1', NULL, '0', 'facebook, oxi_social_login', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 2, '2019-03-19T14:46:26-07:00', '2019-03-19T14:46:26-07:00'),
(1355013521467, 'autist@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Chris', 'Giles', '', '', '', '', '', NULL, '0', 0, 'enabled', 0, NULL, NULL, '1', NULL, '0', 'facebook, oxi_social_login', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 2, '2019-03-19T14:35:45-07:00', '2019-03-19T14:35:45-07:00'),
(1355008376891, 'Junesgirlflowersandcakes@yahoo.com', NULL, '16 gannet place Ruakaka ', '', 'Whangarei', 'Northland', '0118', 'New Zealand', NULL, 'Tracee', 'wortelboer', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1491764772923, 'New Zealand', 'Tracee wortelboer', 'NTL', 'NZ', 1, 2, '2019-03-19T14:32:14-07:00', '2019-03-19T14:32:14-07:00'),
(1355004280891, 'kjbjkt11@att.net', NULL, '28003 Barker Hollow Drive', '', 'Katy', 'Texas', '77494', 'United States', NULL, 'Alton', 'Barrett', '', '', '', '', '', NULL, '0', 1, 'disabled', 87.2, 1012196016187, NULL, '1', NULL, '0', '', '#IHF163222', 'USD', 1491760644155, 'United States', 'Alton Barrett', 'TX', 'US', 1, 2, '2019-03-19T14:29:23-07:00', '2019-03-19T14:31:08-07:00'),
(1354963812411, 'mcfry1g@gmail.com', NULL, '757 Gundare Road', '', 'Bullarah', 'New South Wales', '2400', 'Australia', NULL, 'Kim', 'Read', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1491718504507, 'Australia', 'Kim Read', 'NSW', 'AU', 1, 2, '2019-03-19T14:02:16-07:00', '2019-03-19T14:02:16-07:00'),
(1354960306235, 'nieceytee@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Dvora', 'Diggs', '', '', '', '', '', NULL, '0', 0, 'enabled', 0, NULL, NULL, '0', NULL, '0', '', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 2, '2019-03-19T13:59:37-07:00', '2019-03-19T14:00:08-07:00'),
(1354837688379, 'toconno@columbus.rr.com', NULL, '2606 Glenmawr Avenue', '', 'Columbus', 'Ohio', '43202', 'United States', NULL, 'Tim', 'O\'Connor', '', '', '', '', '', NULL, '0', 1, 'disabled', 42.92, 1011984171067, NULL, '1', NULL, '0', '', '#IHF163218', 'USD', 1491593723963, 'United States', 'Tim O\'Connor', 'OH', 'US', 1, 2, '2019-03-19T12:42:27-07:00', '2019-03-19T12:44:06-07:00'),
(1354701602875, 'rwbates79@hotmail.com', NULL, '90 Phillip Bates Drive', '', 'Ekron', 'Kentucky', '40117', 'United States', NULL, 'Robert', 'Bates', '', '', '', '', '', NULL, '0', 1, 'disabled', 75.58, 1011825901627, NULL, '1', NULL, '0', '', '#IHF163216', 'USD', 1491489521723, 'United States', 'Robert Bates', 'KY', 'US', 1, 2, '2019-03-19T11:35:34-07:00', '2019-03-19T11:38:38-07:00'),
(1354701078587, 'stamus1971@gmail.com', NULL, '5003 Barron Meadows Lane', '', 'Plant City', 'Florida', '33566', 'United States', NULL, 'Craig', 'Davis', '', '', '', '', '', NULL, '0', 1, 'disabled', 43.91, 1011822657595, NULL, '1', NULL, '0', '', '#IHF163215', 'USD', 1491489062971, 'United States', 'Craig Davis', 'FL', 'US', 1, 2, '2019-03-19T11:35:20-07:00', '2019-03-19T11:37:09-07:00'),
(1354651926587, 'snapline10@hotmai.com', NULL, '187 Crownover Road', '', 'Homer City', 'Pennsylvania', '15748', 'United States', NULL, 'Richard', 'Valentino', '', '', '', '', '', NULL, '1', 1, 'disabled', 43.91, 1011772883003, NULL, '1', NULL, '0', '', '#IHF163213', 'USD', 1491454591035, 'United States', 'Richard Valentino', 'PA', 'US', 1, 2, '2019-03-19T11:12:55-07:00', '2019-03-19T11:15:15-07:00'),
(1354616930363, 'rickyrod1959@hotmail.com', NULL, '9050 west warm springs rd #1064', '1064', 'las vegas', 'Nevada', '89148', 'United States', NULL, 'rick', 'rodriguez', '', '', '', '', '', NULL, '0', 1, 'disabled', 52.9, 1011735298107, NULL, '1', NULL, '0', '', '#IHF163211', 'USD', 1491429883963, 'United States', 'rick rodriguez', 'NV', 'US', 1, 2, '2019-03-19T10:57:29-07:00', '2019-03-19T10:58:58-07:00'),
(1354607525947, 'mvalentip@aol.com', NULL, '21 SEAGATE CT', '', 'STATEN ISLAND', 'New York', '10305', 'United States', '', 'Mary', 'Valenti', '', '', '', '', '', NULL, '1', 1, 'disabled', 149.52, 1011728678971, NULL, '1', NULL, '0', '', '#IHF163210', 'USD', 1491423494203, 'United States', 'Mary Valenti', 'NY', 'US', 1, 2, '2019-03-19T10:53:12-07:00', '2019-03-19T10:56:04-07:00'),
(1354444111931, 'nallred@bak.rr.com', NULL, '803 Concord Ct', '', 'Bakersfield', 'California', '93314', 'United States', NULL, 'Nancy', 'Allred', '', '', '', '', '', NULL, '0', 1, 'disabled', 80.87, 1011505430587, NULL, '1', NULL, '0', '', '#IHF163207', 'USD', 1490870599739, 'United States', 'Nancy Allred', 'CA', 'US', 1, 2, '2019-03-19T09:38:31-07:00', '2019-03-19T09:39:06-07:00'),
(1354415669307, 'cecchie@umich.edu', NULL, '3648 N Lakewood Ave Apt G', '', 'Chicago', 'Illinois', '60613-3784', 'United States', NULL, 'Erin', 'Cecchi', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1490848317499, 'United States', 'Erin Cecchi', 'IL', 'US', 1, 2, '2019-03-19T09:26:19-07:00', '2019-03-19T09:26:19-07:00'),
(1354388013115, '3306787812@noemail.com', NULL, '757 Fairchild Ave', '', 'Kent', 'Ohio', '44240', 'United States', '', 'Geraldine', 'Ricketson', '', '', '', '', '', NULL, '0', 1, 'disabled', 71.88, 1011439435835, NULL, '1', NULL, '0', '', '#IHF163206', 'USD', 1490827378747, 'United States', 'Geraldine  Ricketson', 'OH', 'US', 1, 2, '2019-03-19T09:12:42-07:00', '2019-03-19T09:15:03-07:00'),
(1354154442811, 'ctwendy@msn.com', NULL, '10338 SE 304th Pl', '', 'Auburn', 'Washington', '98092', 'United States', NULL, 'Wendy', 'Curtis', '', '', '', '', '', NULL, '0', 1, 'disabled', 37.9, 1011119325243, NULL, '1', NULL, '0', '', '#IHF163202', 'USD', 1490658295867, 'United States', 'Wendy Curtis', 'WA', 'US', 1, 2, '2019-03-19T07:20:28-07:00', '2019-03-19T07:21:40-07:00'),
(1354070458427, 'slope77793@aol.com', NULL, '103 Summit Place', '', 'Forest', 'Virginia', '24551', 'United States', NULL, 'Stephen', 'Mason', '', '', '', '', '', NULL, '1', 1, 'disabled', 43.82, 1011011354683, NULL, '1', NULL, '0', '', '#IHF163199', 'USD', 1490581389371, 'United States', 'Stephen Mason', 'VA', 'US', 1, 2, '2019-03-19T06:25:37-07:00', '2019-03-19T06:27:48-07:00'),
(1354037002299, 'titanfaninaz@hotmail.com', NULL, '7125 Bay Cove Trail', '', 'Nashville', 'Tennessee', '37221', 'United States', NULL, 'Vicki', 'Crowell', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1490556682299, 'United States', 'Vicki Crowell', 'TN', 'US', 1, 2, '2019-03-19T06:06:22-07:00', '2019-03-19T06:06:22-07:00'),
(1353964552251, 'wallimacdowell65@gmail.com', NULL, '1327 Winding Willow Drive', '', 'Trinity', 'Florida', '34655', 'United States', NULL, 'Waltraud', 'Macdowell', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1490504384571, 'United States', 'Waltraud Macdowell', 'FL', 'US', 1, 2, '2019-03-19T05:24:48-07:00', '2019-03-19T05:24:48-07:00'),
(1353702604859, 'tfish88@gmail.com', NULL, '11028 Jenkins Place', '', 'Cincinnati', 'Ohio', '45241', 'United States', NULL, 'Travis', 'Fisher', '', '', '', '', '', NULL, '0', 1, 'disabled', 42.92, 1010470027323, NULL, '1', NULL, '0', '', '#IHF163197', 'USD', 1490351128635, 'United States', 'Travis Fisher', 'OH', 'US', 1, 2, '2019-03-19T02:42:21-07:00', '2019-03-19T02:43:10-07:00'),
(1353338454075, 'coastvu@gmail.com', NULL, '4031 Calle Isabella', '', 'San Clemente', 'California', '92672', 'United States', NULL, 'SANDRA', 'WELCH', '', '', '', '', '', NULL, '1', 1, 'disabled', 74.9, 1009886396475, NULL, '1', NULL, '0', '', '#IHF163196', 'USD', 1490164219963, 'United States', 'SANDRA WELCH', 'CA', 'US', 0, 2, '2019-03-18T22:25:30-07:00', '2019-03-18T22:28:31-07:00'),
(1353315188795, 'pkrasney@gmail.com', NULL, '7273 Winterwood Lane', '', 'Highland', 'California', '92346', 'United States', NULL, 'Pris', 'Krasney', '', '', '', '', '', NULL, '0', 1, 'disabled', 64, 1009852907579, NULL, '1', NULL, '0', '', '#IHF163195', 'USD', 1490153046075, 'United States', 'Pris Krasney', 'CA', 'US', 1, 2, '2019-03-18T22:11:53-07:00', '2019-03-18T22:15:50-07:00'),
(1353251651643, 'ducnguyen110@gmx.com', NULL, '1522 REBECCA ST', '', 'SIOUX CITY', 'Iowa', '51103-2420', 'United States', NULL, 'Duc', 'Nguyen', '', '', '', '', '', NULL, '0', 1, 'disabled', 47.9, 1009768726587, NULL, '1', NULL, '0', '', '#IHF163194', 'USD', 1490120474683, 'United States', 'Duc Nguyen', 'IA', 'US', 1, 2, '2019-03-18T21:32:15-07:00', '2019-03-18T21:33:15-07:00'),
(1353140469819, 'basssylla16@gmail.com', NULL, '5767 Fresh Meadow Dr', '', 'Macungie', 'Pennsylvania', '18062', 'United States', '', 'Bassirou', 'Sylla', '', '', '', '', '', NULL, '0', 1, 'disabled', 48.41, 1009649909819, NULL, '1', NULL, '0', '', '#IHF163193', 'USD', 1490023317563, 'United States', 'Bassirou Sylla', 'PA', 'US', 1, 2, '2019-03-18T20:00:43-07:00', '2019-03-18T20:02:17-07:00'),
(1352852176955, 'jane.dennis4@bigpond.com', NULL, 'po box 66', '', 'port fairy', 'Victoria', '3284', 'Australia', NULL, 'jane', 'dennis', '', '', '', '', '', NULL, '0', 1, 'disabled', 93.95, 1035526963259, NULL, '1', NULL, '0', '', '#IHF163677', 'USD', 1489808261179, 'Australia', 'jane dennis', 'VIC', 'AU', 0, 2, '2019-03-18T17:16:49-07:00', '2019-03-30T18:47:19-07:00'),
(1352789688379, 'sunshinef431979@yahoo.com', NULL, '759 E Parkleigh', '', 'Seven Hills', 'Ohio', '44131', 'United States', NULL, 'Jennifer', 'Ferenczy', '', '', '', '', '', NULL, '0', 1, 'disabled', 64, 1009317609531, NULL, '1', NULL, '0', '', '#IHF163192', 'USD', 1489422647355, 'United States', 'Jennifer Ferenczy', 'OH', 'US', 1, 2, '2019-03-18T16:49:36-07:00', '2019-03-18T16:50:08-07:00'),
(1352763539515, 'ljnoll55@gmail.com', NULL, 'Home2 Suites (Guest) 229 S. Azusa Ave', 'Rm #436', 'Azusa', 'California', '91702', 'United States', NULL, 'Linda', 'Noll', '', '', '', '', '', NULL, '0', 1, 'invited', 64, 1009307516987, NULL, '1', NULL, '0', '', '#IHF163191', 'USD', 1489347346491, 'United States', 'Linda Noll', 'CA', 'US', 0, 2, '2019-03-18T16:41:43-07:00', '2019-03-20T16:01:59-07:00'),
(1352732508219, 'lalelander26@gmail.com', NULL, '736 Lakelands Avenue', '', 'Innisfil', 'Ontario', 'L9S 4E5', 'Canada', '', 'Martin', 'Cameron', '', '', '', '', '', NULL, '0', 1, 'disabled', 154.84, 1009270325307, NULL, '1', NULL, '0', '', '#IHF163190', 'USD', 1489328013371, 'Canada', 'Martin  Cameron', 'ON', 'CA', 0, 2, '2019-03-18T16:26:56-07:00', '2019-03-18T16:29:33-07:00'),
(1352709701691, 'pocomaxie@aol.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Gwendolyn', 'Staples', '', '', '', '', '', NULL, '0', 0, 'enabled', 0, NULL, NULL, '0', NULL, '0', '', NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 2, '2019-03-18T16:16:21-07:00', '2019-03-18T16:16:22-07:00'),
(1352671232059, 'luschwinden1@gmail.com', NULL, '9660 West Bay Harbor Drive', 'Apt 5B', 'Bay Harbor Islands', 'Florida', '33154', 'United States', NULL, 'Luciana', 'Schwinden', '', '', '', '', '', NULL, '1', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1489137729595, 'United States', 'Luciana  Schwinden ', 'FL', 'US', 1, 2, '2019-03-18T15:58:55-07:00', '2019-03-18T15:58:55-07:00'),
(1352435367995, 'flofan@aol.com', NULL, '27 FIELDSTONE DR APT 178', '', 'HARTSDALE', 'New York', '10530', 'United States', NULL, 'Florence', 'Fantauzzi', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1488540860475, 'United States', 'Florence Fantauzzi', 'NY', 'US', 1, 2, '2019-03-18T14:17:38-07:00', '2019-03-18T14:17:38-07:00'),
(1352213168187, 'joebagels@gmail.com', NULL, '89 HERBERT ST  ', '', 'BROOKLYN ', 'New York', '11222', 'United States', '', 'Joe', 'Dalto', '', '', '', '', '', NULL, '1', 1, 'disabled', 47.8, 1008724803643, NULL, '1', NULL, '0', '', '#IHF163186', 'USD', 1488361226299, 'United States', 'Joe Dalto', 'NY', 'US', 1, 2, '2019-03-18T12:22:32-07:00', '2019-03-18T12:23:54-07:00'),
(1352172929083, 'Ziljianjammer01@hotmail.com', NULL, '202 W OKLAHOMA ST  ', '', 'TUCSON ', 'Arizona', '85714', 'United States', '', 'Anthony', 'Jose', '', '', '', '', '', NULL, '0', 1, 'disabled', 52.9, 1008683974715, NULL, '1', NULL, '0', '', '#IHF163185', 'USD', 1488335503419, 'United States', 'Anthony Jose', 'AZ', 'US', 1, 2, '2019-03-18T12:05:26-07:00', '2019-03-18T12:08:15-07:00'),
(1352147370043, 'berryk65@gmail.com', NULL, '950 Cross Avenue', '', 'Madison', 'Indiana', '47250', 'United States', NULL, 'Kathy', 'Berry', '', '', '', '', '', NULL, '0', 1, 'disabled', 57.9, 1008657432635, NULL, '1', NULL, '0', '', '#IHF163184', 'USD', 1488318791739, 'United States', 'Kathy Berry ', 'IN', 'US', 1, 2, '2019-03-18T11:55:49-07:00', '2019-03-18T11:58:11-07:00'),
(1352120074299, '6262787250@noemail.com', NULL, '2533 W Ramona Rd', 'Apt A', 'Alhambra', 'California', '91803', 'United States', '', 'Felipe', 'Renteria', '', '', '', '', '', NULL, '0', 1, 'disabled', 43.91, 1008631578683, NULL, '1', NULL, '0', '', '#IHF163182', 'USD', 1488300343355, 'United States', 'Felipe Renteria', 'CA', 'US', 1, 2, '2019-03-18T11:44:57-07:00', '2019-03-18T11:47:46-07:00'),
(1352088059963, 'bisiwjohn123@gmail.com', NULL, '795 Garden Street', '# 5F', 'Bronx', 'New York', '10460', 'United States', '', 'John Bisiw', 'c/o Mr. Aidoo', '', '', '', '', '', NULL, '0', 1, 'disabled', 194.75, 1008605003835, NULL, '1', NULL, '0', '', '#IHF163181', 'USD', 1488277635131, 'United States', 'John  Bisiw', 'NY', 'US', 0, 2, '2019-03-18T11:31:31-07:00', '2019-03-18T11:40:02-07:00'),
(1352079540283, '1440fatboy@gmail.com', NULL, '3154 old baywood rd', '', 'Galax', 'Virginia', '24333', 'United States', NULL, 'John', 'Carico', '', '', '', '', '', NULL, '0', 1, 'disabled', 52.9, 1008571973691, NULL, '1', NULL, '0', '', '#IHF163180', 'USD', 1488272392251, 'United States', 'John Carico', 'VA', 'US', 1, 2, '2019-03-18T11:27:45-07:00', '2019-03-18T11:29:34-07:00'),
(1352051556411, 'kamranazarpay04@gmail.com', NULL, '100 cobblestone ct', '', 'Novato', 'California', '94945', 'United States', NULL, 'Kamran', 'Azarpay', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1488253648955, 'United States', 'Kamran Azarpay', 'CA', 'US', 1, 2, '2019-03-18T11:17:05-07:00', '2019-03-18T11:17:05-07:00'),
(1352037924923, 'vmorr65@gmail.com', NULL, '2187 Walnut trail', '', 'Bushkill', 'Pennsylvania', '18324', 'United States', NULL, 'Valerie', 'Morrell', '', '', '', '', '', NULL, '0', 1, 'disabled', 64.92, 1008520265787, NULL, '1', NULL, '0', '', '#IHF163177', 'USD', 1488245030971, 'United States', 'Valerie Morrell', 'PA', 'US', 1, 2, '2019-03-18T11:12:27-07:00', '2019-03-18T11:13:11-07:00'),
(1352032976955, 'dga@cox.net', NULL, '14416 W Powderhorn Dr', '', 'Surprise', 'Arizona', '85374', 'United States', '', 'David', 'Austin', '', '', '', '', '', NULL, '1', 1, 'disabled', 187.32, 1008521609275, NULL, '1', NULL, '0', '', '#IHF163178', 'USD', 1488241524795, 'United States', 'David Austin', 'AZ', 'US', 1, 2, '2019-03-18T11:10:43-07:00', '2019-03-18T11:13:38-07:00'),
(1352025342011, 'jlongshore8@yahoo.com', NULL, '308 Teal Drive', '', 'Maryville ', 'Tennessee', '37801', 'United States', NULL, 'John', 'Longshore', '', '', '', '', '', NULL, '0', 1, 'disabled', 50.82, 1008510894139, NULL, '1', NULL, '0', '', '#IHF163176', 'USD', 1488237297723, 'United States', 'John Longshore', 'TN', 'US', 1, 2, '2019-03-18T11:08:25-07:00', '2019-03-18T11:09:58-07:00'),
(1351903543355, 'philcaut@bellsouth.net', NULL, '310 Pine Isle Court', '', 'Alpharetta', 'Georgia', '30022', 'United States', NULL, 'Phil', 'Cauthen', '', '', '', '', '', NULL, '0', 1, 'disabled', 43.82, 1008423338043, NULL, '1', NULL, '0', '', '#IHF163171', 'USD', 1488160227387, 'United States', 'Phil Cauthen', 'GA', 'US', 1, 2, '2019-03-18T10:22:44-07:00', '2019-03-18T10:35:12-07:00'),
(1351849312315, 'jouni1980@hotmail.com', NULL, '63131 Alderton Street', '', 'Rego Park', 'New York', '11374', 'United States', NULL, 'Diana', 'Jouni', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1488122118203, 'United States', 'Diana Jouni', 'NY', 'US', 1, 2, '2019-03-18T09:59:33-07:00', '2019-03-18T09:59:33-07:00'),
(1351823884347, 'zaknermeen@gmail.com', NULL, 'Al salaam street', 'Adnoc distribution', 'Abu dhabi', 'Arizona', '73284', 'United States', NULL, 'Nermin', 'Zaqout', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1488103014459, 'United States', 'Nermin Zaqout', 'AZ', 'US', 1, 2, '2019-03-18T09:50:35-07:00', '2019-03-18T09:50:35-07:00'),
(1351773945915, 'tigerloveamy@yahoo.com', NULL, '101 Colyer Drive', '', 'Longwood', 'Florida', '32779', 'United States', NULL, 'Amy', 'Harner', '', '', '', '', '', NULL, '1', 1, 'disabled', 43.82, 1008257368123, NULL, '1', NULL, '0', '', '#IHF163168', 'USD', 1488063299643, 'United States', 'Amy Harner', 'FL', 'US', 1, 2, '2019-03-18T09:28:26-07:00', '2019-03-18T09:30:38-07:00'),
(1351765557307, 'kizzisimba@gmail.com', NULL, '1685 Maclean Drive', '', 'Timmins', 'Ontario', 'P4P 0B2', 'Canada', NULL, 'marie', 'gervais', '', '', '', '', '', NULL, '0', 1, 'disabled', 112.79, 1008246816827, NULL, '1', NULL, '0', '', '#IHF163167', 'USD', 1488054845499, 'Canada', 'marie gervais', 'ON', 'CA', 1, 2, '2019-03-18T09:23:18-07:00', '2019-03-18T09:24:33-07:00'),
(1351765295163, 'ginger7856@aol.com', NULL, '1008 Tennant Harbour', '', 'Pasadena', 'Maryland', '21122', 'United States', NULL, 'Virginia', 'Lusby', '', '', '', '', '', NULL, '0', 1, 'disabled', 39.43, 1008246095931, NULL, '1', NULL, '0', '', '#IHF163166', 'USD', 1488054616123, 'United States', 'Virginia Lusby', 'MD', 'US', 1, 2, '2019-03-18T09:23:08-07:00', '2019-03-18T09:24:12-07:00'),
(1351744847931, 'frederickgjackson@yahoo.com', NULL, '4615 N 40th St', '', 'Milwaukee', 'Wisconsin', '53209', 'United States', '', 'Frederick G', 'Jackson', '', '', '', '', '', NULL, '1', 1, 'disabled', 55.41, 1008226467899, NULL, '1', NULL, '0', '', '#IHF163165', 'USD', 1488032596027, 'United States', 'Frederick G Jackson', 'WI', 'US', 1, 2, '2019-03-18T09:10:06-07:00', '2019-03-18T09:12:25-07:00'),
(1351738523707, 'JZAPATACCD@YAHOO.COM', NULL, '30 Schriever Lane', '', 'New City', 'New York', '10956', 'United States', NULL, 'Juan', 'Zapata', '', '', '', '', '', NULL, '0', 1, 'disabled', 62.95, 1008220045371, NULL, '1', NULL, '0', '', '#IHF163164', 'USD', 1488025911355, 'United States', 'Juan Zapata', 'NY', 'US', 1, 2, '2019-03-18T09:06:28-07:00', '2019-03-18T09:07:41-07:00'),
(1351677542459, 'Jberger431@aol.com', NULL, '305 Wrightstown Sykesville Rd', '', 'Wrightstown', 'New Jersey', '08562', 'United States', NULL, 'Jacquie F', 'Berger', '', '', '', '', '', NULL, '0', 1, 'disabled', 34.95, 1008173875259, NULL, '1', NULL, '0', '', '#IHF163162', 'USD', 1487972237371, 'United States', 'Jacquie F Berger', 'NJ', 'US', 1, 2, '2019-03-18T08:34:21-07:00', '2019-03-18T08:41:43-07:00'),
(1351632945211, 'billyecole@att.net', NULL, 'N80 W15039 Appleton Ave', 'Apt 103', 'Menomonee Falls', 'Wisconsin', '53051', 'United States', '', 'Billy', 'Cole', '', '', '', '', '', NULL, '1', 1, 'disabled', 48.41, 1008108666939, NULL, '1', NULL, '0', '', '#IHF163161', 'USD', 1487939534907, 'United States', 'Billy Cole', 'WI', 'US', 1, 2, '2019-03-18T08:15:15-07:00', '2019-03-18T08:16:40-07:00'),
(1351616921659, 'sherryleavitt42@gmail.com', NULL, '1627 Southwind Drive', '', 'Brandon', 'Florida', '33510', 'United States', NULL, 'Sherry', 'Leavitt', '', '', '', '', '', NULL, '0', 1, 'disabled', 135.99, 1008095887419, NULL, '1', NULL, '0', '', '#IHF163160', 'USD', 1487927279675, 'United States', 'Sherry Leavitt', 'FL', 'US', 1, 2, '2019-03-18T08:08:30-07:00', '2019-03-18T08:11:11-07:00'),
(1351524417595, 'maddog49@charter.net', NULL, '3982 mellow lane', '', 'pinckney', 'Michigan', '48169', 'United States', NULL, 'Ronald', 'Mazurek', '', '', '', '', '', NULL, '0', 1, 'enabled', 37.94, 1019373518907, NULL, '1', NULL, '0', 'facebook, oxi_social_login', '#IHF163351', 'USD', 1487856074811, 'United States', 'Ronald Mazurek', 'MI', 'US', 1, 2, '2019-03-18T07:25:30-07:00', '2019-03-22T14:48:11-07:00'),
(1351504822331, 'mvpvsf@gmail.com', NULL, '1931 Cordova Road', '#607', 'Fort Lauderdale', 'Florida', '33316', 'United States', NULL, 'Martin', 'Hicks', '', '', '', '', '', NULL, '0', 1, 'disabled', 194.93, 1007959834683, NULL, '1', NULL, '0', '', '#IHF163158', 'USD', 1487842607163, 'United States', 'Martin Hicks', 'FL', 'US', 1, 2, '2019-03-18T07:16:43-07:00', '2019-03-18T07:17:30-07:00'),
(1351487324219, 'lilgirl868@msn.com', NULL, '1250 S Central Ave', '', 'Flagler Beach', 'Florida', '32136', 'United States', '', 'Edward', 'Couture', '', '', '', '', '', NULL, '1', 1, 'disabled', 80.91, 1007943745595, NULL, '1', NULL, '0', '', '#IHF163157', 'USD', 1487830351931, 'United States', 'Edward  Couture', 'FL', 'US', 1, 2, '2019-03-18T07:09:10-07:00', '2019-03-18T07:12:55-07:00'),
(1351460814907, 'in-transit@hotmail.com', NULL, '233 N. Poplar Street', '', 'Massapequa ', 'New York', '11758', 'United States', NULL, 'Richard', 'Morrison', '', '', '', '', '', NULL, '0', 0, 'disabled', 0, NULL, NULL, '1', NULL, '0', '', NULL, 'USD', 1487810887739, 'United States', 'Richard Morrison', 'NY', 'US', 1, 2, '2019-03-18T06:57:24-07:00', '2019-03-18T06:57:24-07:00'),
(1350759612475, 'valdesblu@gmail.com', NULL, '13141 N.W. 26 Court', '', 'Miami', 'Florida', '33167', 'United States', NULL, 'Carlos', 'Valdes', '', '', '', '', '', NULL, '1', 1, 'enabled', 103.98, 1042826002491, NULL, '0', NULL, '0', '', '#IHF163790', 'USD', 1523053789243, 'United States', 'Carlos Valdes', 'FL', 'US', 1, 2, '2019-03-17T23:35:33-07:00', '2019-04-02T22:06:55-07:00'),
(1350657572923, 'Stabiloanthony@gmail.com', NULL, '1248 North Ashbrooke Drive', '', 'West Chester', 'Pennsylvania', '19380-3725', 'United States', NULL, 'Anthony', 'Stabilo', '', '', '', '', '', NULL, '0', 1, 'disabled', 59.9, 1006713929787, NULL, '1', NULL, '0', '', '#IHF163155', 'USD', 1487303147579, 'United States', 'Anthony Stabilo', 'PA', 'US', 1, 2, '2019-03-17T21:58:22-07:00', '2019-03-17T22:00:06-07:00'),
(1350469451835, 'rodstern1968@gmail.com', NULL, 'PO Box 2224', '', 'Deer Park', 'Washington', '99006', 'United States', NULL, 'Rod', 'Stern', '', '', '', '', '', NULL, '0', 1, 'disabled', 52.9, 1006535835707, NULL, '1', NULL, '0', '', '#IHF163152', 'USD', 1487166898235, 'United States', 'Rod Stern', 'WA', 'US', 1, 2, '2019-03-17T19:48:29-07:00', '2019-03-17T19:52:29-07:00'),
(1350419087419, 'canadiansnowman1981@gmail.com', NULL, '7237 County Road 19', '', 'Foley', 'Alabama', '36535', 'United States', NULL, 'paul', 'myers', '', '', '', '', '', NULL, '0', 1, 'disabled', 52.9, 1006497792059, NULL, '1', NULL, '0', '', '#IHF163150', 'USD', 1487114600507, 'United States', 'paul myers', 'AL', 'US', 1, 2, '2019-03-17T19:11:01-07:00', '2019-03-17T19:15:05-07:00'),
(1350249316411, 'smith.clan@hotmail.com', NULL, '46 thirteeenth avenue', '', 'homehill', 'Queensland', '4806', 'Australia', NULL, 'Clancy', 'Smith', '', '', '', '', '', NULL, '0', 1, 'disabled', 74.9, 1006365507643, NULL, '1', NULL, '0', '', '#IHF163147', 'USD', 1486945878075, 'Australia', 'clancy smith', 'QLD', 'AU', 0, 2, '2019-03-17T17:11:16-07:00', '2019-03-17T17:14:21-07:00');

-- --------------------------------------------------------

--
-- Table structure for table `getorder_data`
--

CREATE TABLE `getorder_data` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `ship_country` varchar(255) DEFAULT NULL,
  `financial_status` varchar(255) NOT NULL,
  `line_item_name` varchar(512) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `total_price` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ord_financial_status` varchar(255) DEFAULT NULL,
  `paid_at` varchar(255) NOT NULL,
  `fulfillment_status` varchar(255) DEFAULT NULL,
  `fulfill_created_at` varchar(255) NOT NULL,
  `buyer_accepts_marketing` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `subtotal` varchar(255) NOT NULL,
  `shipping_title` varchar(255) NOT NULL,
  `total_tax` varchar(255) NOT NULL,
  `discount_code` varchar(255) NOT NULL,
  `shipping_method` varchar(255) NOT NULL,
  `ord_lineitem_name` varchar(255) DEFAULT NULL,
  `line_item_qty` varchar(255) NOT NULL,
  `line_item_price` varchar(255) NOT NULL,
  `line_item_compare_price` varchar(255) NOT NULL,
  `line_item_sku` varchar(255) DEFAULT NULL,
  `line_item_requires_shipping` varchar(255) NOT NULL,
  `line_item_taxable` varchar(255) NOT NULL,
  `line_item_fulfillment_status` varchar(255) DEFAULT NULL,
  `bill_name` varchar(255) NOT NULL,
  `bill_street` varchar(255) NOT NULL,
  `bill_add_one` varchar(255) NOT NULL,
  `bill_add_two` varchar(255) DEFAULT NULL,
  `bill_company` varchar(255) DEFAULT NULL,
  `bill_city` varchar(255) NOT NULL,
  `bill_zip` varchar(255) DEFAULT NULL,
  `bill_province` varchar(255) DEFAULT NULL,
  `bill_country` varchar(255) DEFAULT NULL,
  `bill_phone` varchar(255) DEFAULT NULL,
  `ship_name` varchar(255) NOT NULL,
  `ship_steet` varchar(255) NOT NULL,
  `ship_add_one` varchar(255) NOT NULL,
  `ship_add_two` varchar(255) DEFAULT NULL,
  `ship_company` varchar(255) DEFAULT NULL,
  `ship_city` varchar(255) NOT NULL,
  `ship_zip` varchar(255) DEFAULT NULL,
  `ship_province` varchar(255) DEFAULT NULL,
  `ship_phone` varchar(255) DEFAULT NULL,
  `notes` varchar(512) DEFAULT NULL,
  `note_attributes` varchar(255) NOT NULL,
  `cancelled_at` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) NOT NULL,
  `payment_reference` varchar(255) NOT NULL,
  `refunded_amount` varchar(255) NOT NULL,
  `line_item_vendor` varchar(255) DEFAULT NULL,
  `orderid` varchar(255) NOT NULL,
  `tags` varchar(512) NOT NULL,
  `risk_level` varchar(255) NOT NULL,
  `source` varchar(255) NOT NULL,
  `line_item_discount` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `customerid` varchar(255) DEFAULT NULL,
  `orderitemid` varchar(255) DEFAULT NULL,
  `syncpage` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `getorder_data1`
--

CREATE TABLE `getorder_data1` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `ship_country` varchar(255) DEFAULT NULL,
  `financial_status` varchar(255) NOT NULL,
  `line_item_name` varchar(512) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `total_price` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `paid_at` varchar(255) NOT NULL,
  `fulfillment_status` varchar(255) DEFAULT NULL,
  `fulfill_created_at` varchar(255) NOT NULL,
  `buyer_accepts_marketing` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `subtotal` varchar(255) NOT NULL,
  `shipping_title` varchar(255) NOT NULL,
  `total_tax` varchar(255) NOT NULL,
  `discount_code` varchar(255) NOT NULL,
  `shipping_method` varchar(255) NOT NULL,
  `line_item_qty` varchar(255) NOT NULL,
  `line_item_price` varchar(255) NOT NULL,
  `line_item_compare_price` varchar(255) NOT NULL,
  `line_item_sku` varchar(255) DEFAULT NULL,
  `line_item_requires_shipping` varchar(255) NOT NULL,
  `line_item_taxable` varchar(255) NOT NULL,
  `line_item_fulfillment_status` varchar(255) DEFAULT NULL,
  `bill_name` varchar(255) NOT NULL,
  `bill_street` varchar(255) NOT NULL,
  `bill_add_one` varchar(255) NOT NULL,
  `bill_add_two` varchar(255) DEFAULT NULL,
  `bill_company` varchar(255) DEFAULT NULL,
  `bill_city` varchar(255) NOT NULL,
  `bill_zip` varchar(255) DEFAULT NULL,
  `bill_province` varchar(255) DEFAULT NULL,
  `bill_country` varchar(255) DEFAULT NULL,
  `bill_phone` varchar(255) DEFAULT NULL,
  `ship_name` varchar(255) NOT NULL,
  `ship_steet` varchar(255) NOT NULL,
  `ship_add_one` varchar(255) NOT NULL,
  `ship_add_two` varchar(255) DEFAULT NULL,
  `ship_company` varchar(255) DEFAULT NULL,
  `ship_city` varchar(255) NOT NULL,
  `ship_zip` varchar(255) DEFAULT NULL,
  `ship_province` varchar(255) DEFAULT NULL,
  `ship_phone` varchar(255) DEFAULT NULL,
  `notes` varchar(512) DEFAULT NULL,
  `note_attributes` varchar(255) NOT NULL,
  `cancelled_at` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) NOT NULL,
  `payment_reference` varchar(255) NOT NULL,
  `refunded_amount` varchar(255) NOT NULL,
  `line_item_vendor` varchar(255) DEFAULT NULL,
  `orderid` varchar(255) NOT NULL,
  `tags` varchar(512) NOT NULL,
  `risk_level` varchar(255) NOT NULL,
  `source` varchar(255) NOT NULL,
  `line_item_discount` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `customerid` varchar(255) NOT NULL,
  `orderitemid` varchar(255) DEFAULT NULL,
  `syncpage` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `store` int(11) NOT NULL,
  `csvorderid` varchar(255) NOT NULL,
  `shopifyorderid` varchar(255) NOT NULL,
  `ordername` varchar(255) NOT NULL,
  `filename` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ordersyncerror`
--

CREATE TABLE `ordersyncerror` (
  `id` int(11) NOT NULL,
  `store` int(11) NOT NULL,
  `csvorderid` varchar(255) NOT NULL,
  `csvrowid` bigint(20) NOT NULL,
  `errornote` text NOT NULL,
  `filename` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordersyncerror`
--

INSERT INTO `ordersyncerror` (`id`, `store`, `csvorderid`, `csvrowid`, `errornote`, `filename`) VALUES
(1, 2, '129488', 486, 'Puerto Rico country not available in shopify', '2014/2014 Q1.csv'),
(2, 2, '130075', 1073, '9806220290 country not available in shopify', '2014/2014 Q1.csv'),
(3, 2, '130086', 1084, '7172735745 country not available in shopify', '2014/2014 Q1.csv'),
(4, 2, '130092', 1090, 'Puerto Rico country not available in shopify', '2014/2014 Q1.csv'),
(5, 2, '130432', 1430, 'Puerto Rico country not available in shopify', '2014/2014 Q1.csv'),
(6, 2, '130732', 1730, 'Puerto Rico country not available in shopify', '2014/2014 Q1.csv'),
(7, 2, '131066', 2064, '1098 N Panther Creek Rd.   country not available in shopify', '2014/2014 Q1.csv'),
(8, 2, '131093', 2091, '233 valley ridge green nw   country not available in shopify', '2014/2014 Q1.csv'),
(9, 2, '131205', 2203, '8521 Spalding Drive   country not available in shopify', '2014/2014 Q1.csv'),
(10, 2, '131251', 2249, 'Puerto Rico country not available in shopify', '2014/2014 Q1.csv'),
(11, 2, '131254', 2252, 'Puerto Rico country not available in shopify', '2014/2014 Q1.csv'),
(12, 2, '131316', 2314, 'Puerto Rico country not available in shopify', '2014/2014 Q1.csv'),
(13, 2, '131357', 2355, '3376527408 country not available in shopify', '2014/2014 Q1.csv'),
(14, 2, '131506', 2504, '8301 N. Co. Line w po box 182  country not available in shopify', '2014/2014 Q1.csv'),
(15, 2, '131634', 2632, '58 Boyd Street   country not available in shopify', '2014/2014 Q1.csv'),
(16, 2, '131663', 2661, '315/569-571 The Esplanade Urangan country not available in shopify', '2014/2014 Q1.csv'),
(17, 2, '131679', 2677, '5015549311 country not available in shopify', '2014/2014 Q1.csv'),
(18, 2, '131810', 2808, 'Puerto Rico country not available in shopify', '2014/2014 Q1.csv'),
(19, 2, '131880', 2878, '45 Rockwall Dr   country not available in shopify', '2014/2014 Q1.csv'),
(20, 2, '131938', 2936, '485  Goodwood  Road Colonel Light Gardens  country not available in shopify', '2014/2014 Q1.csv'),
(21, 2, '131954', 2952, 'Puerto Rico country not available in shopify', '2014/2014 Q1.csv'),
(22, 2, '131989', 2987, '7045323449 country not available in shopify', '2014/2014 Q1.csv'),
(23, 2, '132017', 3015, '5 KIppford Street Monifieth  country not available in shopify', '2014/2014 Q1.csv'),
(24, 2, '132018', 3016, '5 KIppford Street Monifieth  country not available in shopify', '2014/2014 Q1.csv'),
(25, 2, '132019', 3017, '5 KIppford Street Monifieth  country not available in shopify', '2014/2014 Q1.csv'),
(26, 2, '132271', 3269, 'Puerto Rico country not available in shopify', '2014/2014 Q1.csv'),
(27, 2, '132280', 3278, '45 E. Lupine Dr   country not available in shopify', '2014/2014 Q1.csv'),
(28, 2, '132329', 3327, 'Puerto Rico country not available in shopify', '2014/2014 Q1.csv'),
(29, 2, '132377', 3375, '5438 jim cairns blvd   country not available in shopify', '2014/2014 Q1.csv'),
(30, 2, '132476', 3474, 'Puerto Rico country not available in shopify', '2014/2014 Q1.csv'),
(31, 2, '132477', 3475, 'Puerto Rico country not available in shopify', '2014/2014 Q1.csv'),
(32, 2, '132704', 3702, '1525 Ravenswood Drive   country not available in shopify', '2014/2014 Q1.csv'),
(33, 2, '132748', 3746, '7169 Donniington Dr.   country not available in shopify', '2014/2014 Q1.csv'),
(34, 2, '132852', 3850, '17744 lemarsh st   country not available in shopify', '2014/2014 Q1.csv'),
(35, 2, '132855', 3853, '17744 lemarsh st   country not available in shopify', '2014/2014 Q1.csv'),
(36, 2, '132880', 3878, '5084 Lucydale Avenue   country not available in shopify', '2014/2014 Q1.csv'),
(37, 2, '132914', 3912, 'Guam country not available in shopify', '2014/2014 Q1.csv'),
(38, 2, '132915', 3913, 'Guam country not available in shopify', '2014/2014 Q1.csv'),
(39, 2, '132959', 3957, 'W1091 County Road CCC   country not available in shopify', '2014/2014 Q1.csv'),
(40, 2, '133048', 4046, '5113 64ave    country not available in shopify', '2014/2014 Q1.csv'),
(41, 2, '133157', 4155, '6638 E. Mockingbird Lane   country not available in shopify', '2014/2014 Q1.csv'),
(42, 2, '133282', 4280, '6002 Floyd   country not available in shopify', '2014/2014 Q1.csv'),
(43, 2, '133366', 4364, '8075 Bixel Rd   country not available in shopify', '2014/2014 Q1.csv'),
(44, 2, '133372', 4370, '2528 McGill Street   country not available in shopify', '2014/2014 Q1.csv'),
(45, 2, '133474', 4472, '248 fairmount ave   country not available in shopify', '2014/2014 Q1.csv'),
(46, 2, '133573', 4571, '6 Grace Street   country not available in shopify', '2014/2014 Q1.csv'),
(47, 2, '133582', 4580, '24840 E Bergamot Ct   country not available in shopify', '2014/2014 Q1.csv'),
(48, 2, '133634', 4632, '21 jennifer st rosewater  country not available in shopify', '2014/2014 Q1.csv'),
(49, 2, '133674', 4672, '206 Loizos Dr. NW   country not available in shopify', '2014/2014 Q1.csv'),
(50, 2, '133678', 4676, '325. Keystone dr   country not available in shopify', '2014/2014 Q1.csv'),
(51, 2, '133706', 4704, 'B2 Tivoli st   country not available in shopify', '2014/2014 Q1.csv'),
(52, 2, '133753', 4751, '66 chudleigh roadKingsteignton   country not available in shopify', '2014/2014 Q1.csv'),
(53, 2, '133787', 4785, 'Puerto Rico country not available in shopify', '2014/2014 Q1.csv'),
(54, 2, '133946', 4944, '6616 Murrieta Ct.   country not available in shopify', '2014/2014 Q1.csv'),
(55, 2, '134081', 5079, '9 hatton   country not available in shopify', '2014/2014 Q1.csv'),
(56, 2, '134162', 5160, 'P.O. Box 444   country not available in shopify', '2014/2014 Q1.csv'),
(57, 2, '134241', 5239, '1023 Gabriel st.    country not available in shopify', '2014/2014 Q1.csv'),
(58, 2, '134243', 5241, '1023 Gabriel st.    country not available in shopify', '2014/2014 Q1.csv'),
(59, 2, '134949', 424, 'Guam country not available in shopify', '2014/2014 Q2.csv'),
(60, 2, '135151', 626, 'Turks and Caicos Islands country not available in shopify', '2014/2014 Q2.csv'),
(61, 2, '135233', 708, 'Puerto Rico country not available in shopify', '2014/2014 Q2.csv'),
(62, 2, '135234', 709, 'Puerto Rico country not available in shopify', '2014/2014 Q2.csv'),
(63, 2, '135607', 1081, 'Puerto Rico country not available in shopify', '2014/2014 Q2.csv'),
(64, 2, '136579', 2052, 'Puerto Rico country not available in shopify', '2014/2014 Q2.csv'),
(65, 2, '136582', 2055, 'Puerto Rico country not available in shopify', '2014/2014 Q2.csv'),
(66, 2, '137697', 3169, 'Guam country not available in shopify', '2014/2014 Q2.csv'),
(67, 2, '139608', 5077, 'Puerto Rico country not available in shopify', '2014/2014 Q2.csv'),
(68, 2, '139693', 5162, 'Puerto Rico country not available in shopify', '2014/2014 Q2.csv'),
(69, 2, '143128', 8591, 'Virgin Islands (British) country not available in shopify', '2014/2014 Q2.csv'),
(70, 2, '143461', 8923, 'Puerto Rico country not available in shopify', '2014/2014 Q2.csv'),
(71, 2, '143462', 8924, 'Puerto Rico country not available in shopify', '2014/2014 Q2.csv'),
(72, 2, '144293', 9754, 'Puerto Rico country not available in shopify', '2014/2014 Q2.csv'),
(73, 2, '145456', 10912, 'Guam country not available in shopify', '2014/2014 Q2.csv'),
(74, 2, '145916', 99, 'Virgin Islands (British) country not available in shopify', '2014/2014 Q3.csv'),
(75, 2, '146581', 764, 'Guam country not available in shopify', '2014/2014 Q3.csv'),
(76, 2, '146790', 973, 'Puerto Rico country not available in shopify', '2014/2014 Q3.csv'),
(77, 2, '146964', 1147, 'Puerto Rico country not available in shopify', '2014/2014 Q3.csv'),
(78, 2, '149563', 3742, 'Puerto Rico country not available in shopify', '2014/2014 Q3.csv'),
(79, 2, '149769', 3948, 'Puerto Rico country not available in shopify', '2014/2014 Q3.csv'),
(80, 2, '151261', 5438, 'Puerto Rico country not available in shopify', '2014/2014 Q3.csv'),
(81, 2, '151622', 5799, 'Puerto Rico country not available in shopify', '2014/2014 Q3.csv'),
(82, 2, '152925', 7099, 'Puerto Rico country not available in shopify', '2014/2014 Q3.csv'),
(83, 2, '154624', 8798, 'Puerto Rico country not available in shopify', '2014/2014 Q3.csv'),
(84, 2, '154625', 8799, 'Puerto Rico country not available in shopify', '2014/2014 Q3.csv'),
(85, 2, '154762', 8936, 'Puerto Rico country not available in shopify', '2014/2014 Q3.csv'),
(86, 2, '155033', 9206, 'Puerto Rico country not available in shopify', '2014/2014 Q3.csv'),
(87, 2, '155561', 9732, 'Puerto Rico country not available in shopify', '2014/2014 Q3.csv'),
(88, 2, '155814', 9980, 'Puerto Rico country not available in shopify', '2014/2014 Q3.csv'),
(89, 2, '156521', 10687, 'Puerto Rico country not available in shopify', '2014/2014 Q3.csv'),
(90, 2, '157388', 11554, 'Virgin Islands (British) country not available in shopify', '2014/2014 Q3.csv'),
(91, 2, '158109', 12274, '158109 : ', '2014/2014 Q3.csv'),
(92, 2, '158493', 12658, 'Puerto Rico country not available in shopify', '2014/2014 Q3.csv'),
(93, 2, '158497', 12662, 'Puerto Rico country not available in shopify', '2014/2014 Q3.csv'),
(94, 2, '159426', 13591, 'Puerto Rico country not available in shopify', '2014/2014 Q3.csv'),
(95, 2, '159427', 13592, 'Puerto Rico country not available in shopify', '2014/2014 Q3.csv'),
(96, 2, '159686', 13851, 'Guam country not available in shopify', '2014/2014 Q3.csv'),
(97, 2, '160529', 14692, 'Puerto Rico country not available in shopify', '2014/2014 Q3.csv'),
(98, 2, '161435', 15598, 'Puerto Rico country not available in shopify', '2014/2014 Q3.csv'),
(99, 2, '161436', 15599, 'Puerto Rico country not available in shopify', '2014/2014 Q3.csv'),
(100, 2, '164024', 18187, 'Puerto Rico country not available in shopify', '2014/2014 Q3.csv'),
(101, 2, '164097', 18260, 'Puerto Rico country not available in shopify', '2014/2014 Q3.csv'),
(102, 2, '164376', 18539, 'Puerto Rico country not available in shopify', '2014/2014 Q3.csv'),
(103, 2, '165352', 19515, 'Puerto Rico country not available in shopify', '2014/2014 Q3.csv'),
(104, 2, '180745', 5, 'Puerto Rico country not available in shopify', '2014/2014 Q4.csv'),
(105, 2, '169752', 4333, 'Puerto Rico country not available in shopify', '2014/2014 Q4.csv'),
(106, 2, '169991', 4572, 'Puerto Rico country not available in shopify', '2014/2014 Q4.csv'),
(107, 2, '170977', 5558, 'Puerto Rico country not available in shopify', '2014/2014 Q4.csv'),
(108, 2, '172092', 6671, 'Guam country not available in shopify', '2014/2014 Q4.csv'),
(109, 2, '172104', 6683, 'Puerto Rico country not available in shopify', '2014/2014 Q4.csv'),
(110, 2, '172974', 7553, 'Puerto Rico country not available in shopify', '2014/2014 Q4.csv'),
(111, 2, '173493', 8072, 'Puerto Rico country not available in shopify', '2014/2014 Q4.csv'),
(112, 2, '173633', 8212, 'Puerto Rico country not available in shopify', '2014/2014 Q4.csv'),
(113, 2, '175244', 9823, 'Puerto Rico country not available in shopify', '2014/2014 Q4.csv'),
(114, 2, '175531', 10110, 'Puerto Rico country not available in shopify', '2014/2014 Q4.csv'),
(115, 2, '175971', 10550, 'Puerto Rico country not available in shopify', '2014/2014 Q4.csv'),
(116, 2, '176244', 10823, 'Puerto Rico country not available in shopify', '2014/2014 Q4.csv'),
(117, 2, '176650', 11229, 'Serbia and Montenegro country not available in shopify', '2014/2014 Q4.csv'),
(118, 2, '176653', 11232, 'Serbia and Montenegro country not available in shopify', '2014/2014 Q4.csv'),
(119, 2, '176809', 11388, 'Puerto Rico country not available in shopify', '2014/2014 Q4.csv'),
(120, 2, '178075', 12654, 'Puerto Rico country not available in shopify', '2014/2014 Q4.csv'),
(121, 2, '179117', 13695, 'Puerto Rico country not available in shopify', '2014/2014 Q4.csv'),
(122, 2, '179740', 14318, 'Puerto Rico country not available in shopify', '2014/2014 Q4.csv'),
(123, 2, '180225', 14802, 'Puerto Rico country not available in shopify', '2014/2014 Q4.csv'),
(124, 2, '180708', 15285, 'Puerto Rico country not available in shopify', '2014/2014 Q4.csv'),
(125, 2, '181506', 750, 'Puerto Rico country not available in shopify', '2015/Supplement 2015 Q1.csv'),
(126, 2, '182940', 2184, 'Puerto Rico country not available in shopify', '2015/Supplement 2015 Q1.csv'),
(127, 2, '183356', 2600, 'Puerto Rico country not available in shopify', '2015/Supplement 2015 Q1.csv'),
(128, 2, '184260', 3503, 'Puerto Rico country not available in shopify', '2015/Supplement 2015 Q1.csv'),
(129, 2, '184271', 3514, 'Guam country not available in shopify', '2015/Supplement 2015 Q1.csv'),
(130, 2, '184764', 4007, 'Puerto Rico country not available in shopify', '2015/Supplement 2015 Q1.csv'),
(131, 2, '185228', 4470, 'Puerto Rico country not available in shopify', '2015/Supplement 2015 Q1.csv'),
(132, 2, '185967', 5209, 'Puerto Rico country not available in shopify', '2015/Supplement 2015 Q1.csv'),
(133, 2, '186095', 5337, 'Puerto Rico country not available in shopify', '2015/Supplement 2015 Q1.csv'),
(134, 2, '186561', 5803, 'Puerto Rico country not available in shopify', '2015/Supplement 2015 Q1.csv'),
(135, 2, '188152', 7394, 'Puerto Rico country not available in shopify', '2015/Supplement 2015 Q1.csv'),
(136, 2, '188180', 7422, 'Puerto Rico country not available in shopify', '2015/Supplement 2015 Q1.csv'),
(137, 2, '188345', 7587, 'Puerto Rico country not available in shopify', '2015/Supplement 2015 Q1.csv');

-- --------------------------------------------------------

--
-- Table structure for table `recurringcharges`
--

CREATE TABLE `recurringcharges` (
  `id` int(20) NOT NULL,
  `store` int(11) NOT NULL,
  `charge_id` int(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `api_client_id` int(20) NOT NULL,
  `price` float(10,2) NOT NULL,
  `status` varchar(50) NOT NULL,
  `return_url` text NOT NULL,
  `billing_on` varchar(64) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `test` tinyint(1) NOT NULL,
  `activated_on` varchar(64) DEFAULT NULL,
  `trial_ends_on` varchar(64) DEFAULT NULL,
  `cancelled_on` varchar(64) DEFAULT NULL,
  `trial_days` varchar(64) NOT NULL,
  `decorated_return_url` text NOT NULL,
  `confirmation_url` text NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shop`
--

CREATE TABLE `shop` (
  `id` int(11) NOT NULL,
  `shop_url` varchar(512) NOT NULL,
  `token` varchar(512) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop`
--

INSERT INTO `shop` (`id`, `shop_url`, `token`, `status`, `created_at`) VALUES
(1, 'metizsoft1.myshopify.com', '2bd33441f554065eb124376e4c951d40', 1, '2018-12-03 09:17:28'),
(2, 'ihealthstore.myshopify.com', '2b8ea21b22d2b9d34f6f04f7ca3c0e69', 1, '2019-03-30 10:28:18');

-- --------------------------------------------------------

--
-- Table structure for table `synctemporder`
--

CREATE TABLE `synctemporder` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `financial_status` varchar(100) NOT NULL,
  `fulfillment_status` varchar(100) NOT NULL,
  `currency` varchar(100) NOT NULL,
  `buyer_accepts_marketing` varchar(100) NOT NULL,
  `cancel_reason` varchar(100) NOT NULL,
  `cancelled_at` varchar(100) NOT NULL,
  `closed_at` varchar(200) NOT NULL,
  `tags` varchar(500) NOT NULL,
  `note` varchar(500) NOT NULL,
  `phone` varchar(40) NOT NULL,
  `referring_site` varchar(200) NOT NULL,
  `processed_at` varchar(200) NOT NULL,
  `source_name` varchar(200) NOT NULL,
  `total_weight` varchar(200) NOT NULL,
  `total_tax` varchar(200) NOT NULL,
  `shipping_company` varchar(200) NOT NULL,
  `shipping_name` varchar(200) NOT NULL,
  `shipping_phone` varchar(220) NOT NULL,
  `shipping_first_name` varchar(200) NOT NULL,
  `shipping_last_name` varchar(200) NOT NULL,
  `shipping_address1` varchar(200) NOT NULL,
  `shipping_address2` varchar(200) NOT NULL,
  `shipping_city` varchar(200) NOT NULL,
  `shipping_province` varchar(200) NOT NULL,
  `shipping_province_code` varchar(200) NOT NULL,
  `shipping_zip` varchar(200) NOT NULL,
  `shipping_country` varchar(200) NOT NULL,
  `shipping_country_code` varchar(200) NOT NULL,
  `billing_company` varchar(200) NOT NULL,
  `billing_name` varchar(200) NOT NULL,
  `billing_phone` varchar(200) NOT NULL,
  `billing_first_name` varchar(200) NOT NULL,
  `billing_last_name` varchar(200) NOT NULL,
  `billing_address1` varchar(200) NOT NULL,
  `billing_address2` varchar(200) NOT NULL,
  `billing_city` varchar(200) NOT NULL,
  `billing_province` varchar(200) NOT NULL,
  `billing_province_code` varchar(200) NOT NULL,
  `billing_zip` varchar(200) NOT NULL,
  `billing_country` varchar(200) NOT NULL,
  `billing_country_code` varchar(200) NOT NULL,
  `lineitem_name` varchar(200) NOT NULL,
  `lineitem_variant_id` varchar(200) NOT NULL,
  `lineitem_quantity` varchar(200) NOT NULL,
  `lineitem_price` varchar(200) NOT NULL,
  `lineitem_variant_title` varchar(200) NOT NULL,
  `lineitem_compare_at_price` varchar(200) NOT NULL,
  `lineitem_sku` varchar(200) NOT NULL,
  `lineitem_requires_shipping` varchar(200) NOT NULL,
  `lineitem_taxable` varchar(200) NOT NULL,
  `lineitem_fulfillment_status` varchar(200) NOT NULL,
  `taxes_Included` varchar(200) NOT NULL,
  `tax_1_title` varchar(200) NOT NULL,
  `tax_1_price` varchar(200) NOT NULL,
  `tax_1_rate` varchar(200) NOT NULL,
  `tax_2_title` varchar(200) NOT NULL,
  `tax_2_price` varchar(200) NOT NULL,
  `tax_2_rate` varchar(200) NOT NULL,
  `tax_3_title` varchar(200) NOT NULL,
  `tax_3_price` varchar(200) NOT NULL,
  `tax_3_rate` varchar(200) NOT NULL,
  `transaction_amount` varchar(200) NOT NULL,
  `transaction_kind` varchar(200) NOT NULL,
  `transaction_status` varchar(200) NOT NULL,
  `transaction_processed_at` varchar(200) NOT NULL,
  `transaction_gateway` varchar(200) NOT NULL,
  `transaction_location_Id` varchar(200) NOT NULL,
  `transaction_source_name` varchar(200) NOT NULL,
  `shipping_line_code` varchar(200) NOT NULL,
  `shipping_line_price` varchar(200) NOT NULL,
  `shipping_line_source` varchar(200) NOT NULL,
  `shipping_line_title` varchar(200) NOT NULL,
  `shipping_line_carrier_identifier` varchar(200) NOT NULL,
  `shipping_line_requested_fulfillment_service_id` varchar(200) NOT NULL,
  `shipping_tax_1_title` varchar(200) NOT NULL,
  `shipping_tax_1_rate` varchar(220) NOT NULL,
  `shipping_tax_1_price` varchar(200) NOT NULL,
  `discount_code` varchar(200) NOT NULL,
  `discount_amount` varchar(200) NOT NULL,
  `discount_type` varchar(200) NOT NULL,
  `metafield_namespace` varchar(200) NOT NULL,
  `metafield_key` varchar(200) NOT NULL,
  `metafield_value` varchar(200) NOT NULL,
  `metafield_value_type` varchar(220) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activerecurringcharges`
--
ALTER TABLE `activerecurringcharges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cronsync`
--
ALTER TABLE `cronsync`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customersyncerror`
--
ALTER TABLE `customersyncerror`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_data`
--
ALTER TABLE `customer_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `getorder_data`
--
ALTER TABLE `getorder_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `getorder_data1`
--
ALTER TABLE `getorder_data1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordersyncerror`
--
ALTER TABLE `ordersyncerror`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recurringcharges`
--
ALTER TABLE `recurringcharges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `synctemporder`
--
ALTER TABLE `synctemporder`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activerecurringcharges`
--
ALTER TABLE `activerecurringcharges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cronsync`
--
ALTER TABLE `cronsync`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customersyncerror`
--
ALTER TABLE `customersyncerror`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `getorder_data`
--
ALTER TABLE `getorder_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `getorder_data1`
--
ALTER TABLE `getorder_data1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ordersyncerror`
--
ALTER TABLE `ordersyncerror`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;
--
-- AUTO_INCREMENT for table `recurringcharges`
--
ALTER TABLE `recurringcharges`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `shop`
--
ALTER TABLE `shop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `synctemporder`
--
ALTER TABLE `synctemporder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
