-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 04, 2026 at 06:58 PM
-- Server version: 9.4.0
-- PHP Version: 8.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rest`
--

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `access_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_authorization_codes`
--

CREATE TABLE `oauth_authorization_codes` (
  `authorization_code` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `redirect_uri` varchar(2000) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(4000) DEFAULT NULL,
  `id_token` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `client_id` varchar(80) NOT NULL,
  `client_secret` varchar(80) DEFAULT NULL,
  `redirect_uri` varchar(2000) DEFAULT NULL,
  `grant_types` varchar(80) DEFAULT NULL,
  `scope` varchar(4000) DEFAULT NULL,
  `user_id` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`client_id`, `client_secret`, `redirect_uri`, `grant_types`, `scope`, `user_id`) VALUES
('testclient', 'testsecret', NULL, 'client_credentials', 'app', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_jwt`
--

CREATE TABLE `oauth_jwt` (
  `client_id` varchar(80) NOT NULL,
  `subject` varchar(80) DEFAULT NULL,
  `public_key` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `refresh_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_scopes`
--

CREATE TABLE `oauth_scopes` (
  `scope` varchar(80) NOT NULL,
  `is_default` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_users`
--

CREATE TABLE `oauth_users` (
  `username` varchar(80) NOT NULL,
  `password` varchar(80) DEFAULT NULL,
  `first_name` varchar(80) DEFAULT NULL,
  `last_name` varchar(80) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `email_verified` tinyint(1) DEFAULT NULL,
  `scope` varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `oauth_users`
--

INSERT INTO `oauth_users` (`username`, `password`, `first_name`, `last_name`, `email`, `email_verified`, `scope`) VALUES
('zakir200', '1234', 'Zakir', 'Islam', 'zakir@gmail.com', 1, 'app');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_access`
--

CREATE TABLE `tbl_access` (
  `id` int NOT NULL,
  `module_name` varchar(100) DEFAULT NULL,
  `function_name` varchar(100) DEFAULT NULL,
  `label_name` varchar(100) DEFAULT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `main_module_id` int DEFAULT NULL,
  `del_status` varchar(15) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_access`
--

INSERT INTO `tbl_access` (`id`, `module_name`, `function_name`, `label_name`, `parent_id`, `main_module_id`, `del_status`) VALUES
(1, 'dashboard', '', 'dashboard', 0, 1, 'Live'),
(2, '', 'view', 'view', 1, NULL, 'Live'),
(3, 'SaaS', '', 'Saas', 0, 2, 'Live'),
(4, '', 'view', 'view', 3, NULL, 'Live'),
(5, '', 'update', 'update', 3, NULL, 'Live'),
(6, 'Site Setting', '', 'site_setting', 0, 2, 'Live'),
(7, '', 'view', 'view', 6, NULL, 'Deleted'),
(8, '', 'update', 'update', 6, NULL, 'Live'),
(9, 'Email Setting', '', 'email_setting', 0, 2, 'Live'),
(10, '', 'view', 'view', 9, NULL, 'Live'),
(11, '', 'update', 'update', 9, NULL, 'Live'),
(12, 'Payment Setting', '', 'Payment_Setting', 0, 2, 'Live'),
(13, '', 'view', 'view', 12, NULL, 'Live'),
(14, '', 'update', 'update', 12, NULL, 'Live'),
(15, 'Companies', '', 'companies', 0, 2, 'Live'),
(16, '', 'add', 'add', 15, NULL, 'Live'),
(17, '', 'update', 'update', 15, NULL, 'Live'),
(18, '', 'view', 'view', 15, NULL, 'Live'),
(19, '', 'delete', 'delete', 15, NULL, 'Live'),
(20, '', 'show_outlets', 'show_outlets', 15, NULL, 'Live'),
(21, '', 'block_all_user', 'block_all_user', 15, NULL, 'Live'),
(22, 'Payment History', '', 'payment_history', 0, 2, 'Live'),
(23, '', 'add', 'add', 22, NULL, 'Live'),
(24, '', 'view', 'view', 22, NULL, 'Live'),
(25, '', 'delete', 'delete', 22, NULL, 'Live'),
(26, 'Pricing Plans', '', 'Pricing_Plans', 0, 2, 'Live'),
(27, '', 'add', 'add', 26, NULL, 'Live'),
(28, '', 'update', 'update', 26, NULL, 'Live'),
(29, '', 'view', 'view', 26, NULL, 'Live'),
(30, '', 'delete', 'delete', 26, NULL, 'Live'),
(31, 'Setting', '', 'setting', 0, 3, 'Live'),
(32, '', 'view', 'view', 31, NULL, 'Live'),
(33, '', 'update', 'update', 31, NULL, 'Live'),
(34, 'Printer Settings', '', 'Printer_Settings', 0, 3, 'Deleted'),
(35, 'Printers', '', 'Printers', 0, 3, 'Live'),
(36, '', 'add', 'add', 35, NULL, 'Live'),
(37, '', 'update', 'update', 35, NULL, 'Live'),
(38, '', 'view', 'view', 35, NULL, 'Live'),
(39, '', 'delete', 'delete', 35, NULL, 'Live'),
(49, 'White Label', '', 'whitelabel', 0, 3, 'Live'),
(50, '', 'view', 'view', 49, NULL, 'Deleted'),
(51, '', 'update', 'update', 49, NULL, 'Live'),
(52, 'Tax Setting', '', 'Tax_Setting', 0, 3, 'Live'),
(53, '', 'view', 'view', 52, NULL, 'Deleted'),
(54, '', 'update_tax', 'update', 52, NULL, 'Live'),
(55, 'Manage Multiple Currencies', '', 'MultipleCurrencies_btn', 0, 3, 'Live'),
(56, '', 'add', 'add', 55, NULL, 'Live'),
(57, '', 'update', 'update', 55, NULL, 'Live'),
(58, '', 'view', 'view', 55, NULL, 'Live'),
(59, '', 'delete', 'delete', 55, NULL, 'Live'),
(60, 'Software Update', '', 'software_update', 0, 3, 'Live'),
(61, '', 'update', 'update', 60, NULL, 'Live'),
(62, 'License Uninstall', '', 'Uninstall_License', 0, 3, 'Live'),
(63, '', 'uninstall', 'uninstall', 62, NULL, 'Live'),
(64, 'Self Order Setting', '', 'sos_Self_Order_Setting', 0, 3, 'Live'),
(65, '', 'view', 'view', 64, NULL, 'Deleted'),
(66, '', 'update', 'update', 64, NULL, 'Live'),
(67, 'Outlets', '', 'outlets', 0, 1, 'Live'),
(68, '', 'add', 'add', 67, NULL, 'Live'),
(69, '', 'update', 'update', 67, NULL, 'Live'),
(70, '', 'view', 'view', 67, NULL, 'Live'),
(71, '', 'delete', 'delete', 67, NULL, 'Live'),
(72, '', 'enter', 'enter', 67, NULL, 'Live'),
(73, 'pos', '', 'pos', 0, 4, 'Live'),
(74, '', 'pos_1', 'place_order', 73, NULL, 'Live'),
(75, '', 'pos_2', 'cancel_order', 73, NULL, 'Live'),
(76, '', 'pos_3', 'modify_order_', 73, NULL, 'Live'),
(77, '', 'pos_4', 'Provide_Discount', 73, NULL, 'Live'),
(78, '', 'pos_5', 'Modify_Service_Delivery_Charge', 73, NULL, 'Live'),
(79, '', 'pos_6', 'Enter_Tips', 73, NULL, 'Live'),
(80, '', 'pos_7', 'Delete_Item_From_Cart_When_Modifying_Order', 73, NULL, 'Live'),
(81, '', 'pos_8', 'add_customer', 73, NULL, 'Live'),
(82, '', 'pos_9', 'edit_customer', 73, NULL, 'Live'),
(83, '', 'pos_10', 'kot_tooltip', 73, NULL, 'Live'),
(84, '', 'pos_11', 'create_invoice', 73, NULL, 'Live'),
(85, '', 'pos_12', 'Print_Bill', 73, NULL, 'Live'),
(86, '', 'pos_13', 'print_last_invoice', 73, NULL, 'Live'),
(87, '', 'pos_14', 'Delete_Recent_Sales', 73, NULL, 'Live'),
(88, '', 'pos_15', 'Modify_Future_Sale', 73, NULL, 'Live'),
(89, '', 'pos_16', 'Set_as_Running_Order_in_Future_Sale', 73, NULL, 'Live'),
(90, '', 'pos_17', 'Accept_SelfOrder', 73, NULL, 'Live'),
(91, '', 'pos_18', 'DeclineSelfOrder', 73, NULL, 'Live'),
(92, '', 'pos_19', 'ModifySelfOrder', 73, NULL, 'Live'),
(93, '', 'pos_20', 'RemoveKitchenNotification', 73, NULL, 'Live'),
(94, '', 'pos_21', 'close_register', 73, NULL, 'Live'),
(95, '', 'pos_22', 'GotoDashboard', 73, NULL, 'Live'),
(96, '', 'pos_23', 'main_menu', 73, NULL, 'Live'),
(97, '', 'pos_24', 'direct_invoice', 73, NULL, 'Delted'),
(98, 'kitchens', '', 'kitchens', 0, 4, 'Live'),
(99, '', 'add', 'add', 98, NULL, 'Live'),
(100, '', 'update', 'update', 98, NULL, 'Live'),
(101, '', 'view', 'view', 98, NULL, 'Live'),
(102, '', 'delete', 'delete', 98, NULL, 'Live'),
(103, '', 'enter', 'enter', 98, NULL, 'Live'),
(104, 'waiter', '', 'waiter', 0, 4, 'Live'),
(105, '', 'view', 'view', 104, NULL, 'Live'),
(106, 'purchase', '', 'purchase', 0, 5, 'Live'),
(107, '', 'add', 'add', 106, NULL, 'Live'),
(108, '', 'update', 'update', 106, NULL, 'Live'),
(109, '', 'view', 'view', 106, NULL, 'Live'),
(110, '', 'delete', 'delete', 106, NULL, 'Live'),
(111, '', 'view_details', 'view_details', 106, NULL, 'Live'),
(112, 'transfer', '', 'transfer', 0, 1, 'Live'),
(113, '', 'add', 'add', 112, NULL, 'Live'),
(114, '', 'update', 'update', 112, NULL, 'Live'),
(115, '', 'view', 'view', 112, NULL, 'Live'),
(116, '', 'delete', 'delete', 112, NULL, 'Live'),
(117, '', 'view_details', 'view_details', 112, NULL, 'Live'),
(118, 'promotion', '', 'promotion', 0, 1, 'Live'),
(119, '', 'add', 'add', 118, NULL, 'Live'),
(120, '', 'update', 'update', 118, NULL, 'Live'),
(121, '', 'view', 'view', 118, NULL, 'Live'),
(122, '', 'delete', 'delete', 118, NULL, 'Live'),
(123, 'sale', '', 'sale', 0, 6, 'Live'),
(124, '', 'view', 'view', 123, NULL, 'Live'),
(125, '', 'refund', 'refund', 123, NULL, 'Live'),
(126, '', 'view_invoice', 'view_invoice', 123, NULL, 'Live'),
(127, '', 'change_date', 'change_date', 123, NULL, 'Deleted'),
(128, '', 'delete', 'delete', 123, NULL, 'Live'),
(129, 'inventory', '', 'inventory', 0, 1, 'Live'),
(130, '', 'view', 'view', 129, NULL, 'Live'),
(131, 'inventory_Adjustments', '', 'inventory_Adjustments', 0, 1, 'Live'),
(132, '', 'add', 'add', 131, NULL, 'Live'),
(133, '', 'update', 'update', 131, NULL, 'Live'),
(134, '', 'view', 'view', 131, NULL, 'Live'),
(135, '', 'delete', 'delete', 131, NULL, 'Live'),
(136, '', 'view_details', 'view_details', 131, NULL, 'Live'),
(137, 'waste', '', 'waste', 0, 1, 'Live'),
(138, '', 'add', 'add', 137, NULL, 'Live'),
(139, '', 'view', 'view', 137, NULL, 'Live'),
(140, '', 'delete', 'delete', 137, NULL, 'Live'),
(141, '', 'view_details', 'view_details', 137, NULL, 'Live'),
(142, 'expense', '', 'expense', 0, 7, 'Live'),
(143, '', 'add', 'add', 142, NULL, 'Live'),
(144, '', 'update', 'update', 142, NULL, 'Live'),
(145, '', 'view', 'view', 142, NULL, 'Live'),
(146, '', 'delete', 'delete', 142, NULL, 'Live'),
(147, 'supplier_due_payment', '', 'supplier_due_payment', 0, 1, 'Live'),
(148, '', 'add', 'add', 147, NULL, 'Live'),
(149, '', 'view', 'view', 147, NULL, 'Live'),
(150, '', 'delete', 'delete', 147, NULL, 'Live'),
(151, 'customer_due_receive', '', 'customer_due_receive', 0, 1, 'Live'),
(152, '', 'add', 'add', 151, NULL, 'Live'),
(153, '', 'view', 'view', 151, NULL, 'Live'),
(154, '', 'delete', 'delete', 151, NULL, 'Live'),
(155, 'attendance', '', 'attendance', 0, 1, 'Live'),
(156, '', 'add', 'add', 155, NULL, 'Live'),
(157, '', 'view', 'view', 155, NULL, 'Live'),
(158, '', 'delete', 'delete', 155, NULL, 'Live'),
(159, 'register_report', '', 'register_report', 0, 8, 'Live'),
(160, '', 'view', 'view', 159, NULL, 'Live'),
(161, 'daily_summary_report', '', 'daily_summary_report', 0, 8, 'Live'),
(162, '', 'view', 'view', 161, NULL, 'Live'),
(163, 'food_sales_report', '', 'food_sales_report', 0, 8, 'Live'),
(164, '', 'view', 'view', 163, NULL, 'Live'),
(165, 'daily_sale_report', '', 'daily_sale_report', 0, 8, 'Live'),
(166, '', 'view', 'view', 165, NULL, 'Live'),
(167, 'detailed_sale_report', '', 'detailed_sale_report', 0, 8, 'Live'),
(168, '', 'view', 'view', 167, NULL, 'Live'),
(169, 'consumption_report', '', 'consumption_report', 0, 8, 'Live'),
(170, '', 'view', 'view', 169, NULL, 'Live'),
(171, 'inventory_report', '', 'inventory_report', 0, 8, 'Live'),
(172, '', 'view', 'view', 171, NULL, 'Live'),
(173, 'Alert_Inventory', '', 'Alert_Inventory', 0, 8, 'Live'),
(174, '', 'view', 'view', 173, NULL, 'Live'),
(175, 'profit_loss_report', '', 'profit_loss_report', 0, 8, 'Live'),
(176, '', 'view', 'view', 175, NULL, 'Live'),
(177, 'daily_sale_report', '', 'daily_sale_report', 0, 8, 'Deleted'),
(178, '', 'view', 'view', 177, NULL, 'Deleted'),
(179, 'attendance_report', '', 'attendance_report', 0, 8, 'Live'),
(180, '', 'view', 'view', 179, NULL, 'Live'),
(181, 'supplier_ledger_report', '', 'supplier_ledger_report', 0, 8, 'Live'),
(182, '', 'view', 'view', 181, NULL, 'Live'),
(183, 'supplier_due_report', '', 'supplier_due_report', 0, 8, 'Live'),
(184, '', 'view', 'view', 183, NULL, 'Live'),
(185, 'customer_due_report', '', 'customer_due_report', 0, 8, 'Live'),
(186, '', 'view', 'view', 185, NULL, 'Live'),
(187, 'customer_ledger', '', 'customer_ledger', 0, 8, 'Live'),
(188, '', 'view', 'view', 187, NULL, 'Live'),
(189, 'purchase_report', '', 'purchase_report', 0, 8, 'Live'),
(190, '', 'view', 'view', 189, NULL, 'Live'),
(191, 'expense_report', '', 'expense_report', 0, 8, 'Live'),
(192, '', 'view', 'view', 191, NULL, 'Live'),
(193, 'waste_report', '', 'waste_report', 0, 8, 'Live'),
(194, '', 'view', 'view', 193, NULL, 'Live'),
(195, 'vat_report', '', 'vat_report', 0, 8, 'Live'),
(196, '', 'view', 'view', 195, NULL, 'Live'),
(197, 'foodMenuSaleByCategories', '', 'foodMenuSaleByCategories', 0, 8, 'Live'),
(198, '', 'view', 'view', 197, NULL, 'Live'),
(199, 'tips_report', '', 'tips_report', 0, 8, 'Live'),
(200, '', 'view', 'view', 199, NULL, 'Live'),
(201, 'auditLogReport', '', 'auditLogReport', 0, 8, 'Live'),
(202, '', 'view', 'view', 201, NULL, 'Live'),
(203, 'usage_loyalty_point_report', '', 'usage_loyalty_point_report', 0, 8, 'Live'),
(204, '', 'view', 'view', 203, NULL, 'Live'),
(205, 'loyalty_point_report', '', 'loyalty_point_report', 0, 8, 'Live'),
(206, '', 'view', 'view', 205, NULL, 'Live'),
(207, 'ingredient_category', '', 'ingredient_category', 0, 9, 'Live'),
(208, '', 'add', 'add', 207, NULL, 'Live'),
(209, '', 'update', 'update', 207, NULL, 'Live'),
(210, '', 'view', 'view', 207, NULL, 'Live'),
(211, '', 'delete', 'delete', 207, NULL, 'Live'),
(212, 'ingredient_units', '', 'ingredient_units', 0, 9, 'Live'),
(213, '', 'add', 'add', 212, NULL, 'Live'),
(214, '', 'update', 'update', 212, NULL, 'Live'),
(215, '', 'view', 'view', 212, NULL, 'Live'),
(216, '', 'delete', 'delete', 212, NULL, 'Live'),
(217, 'ingredients', '', 'ingredients', 0, 9, 'Live'),
(218, '', 'add', 'add', 217, NULL, 'Live'),
(219, '', 'update', 'update', 217, NULL, 'Live'),
(220, '', 'view', 'view', 217, NULL, 'Live'),
(221, '', 'delete', 'delete', 217, NULL, 'Live'),
(222, '', 'upload_ingredient', 'upload_ingredient', 217, NULL, 'Live'),
(223, 'modifiers', '', 'modifiers', 0, 9, 'Live'),
(224, '', 'add', 'add', 223, NULL, 'Live'),
(225, '', 'update', 'update', 223, NULL, 'Live'),
(226, '', 'view', 'view', 223, NULL, 'Live'),
(227, '', 'delete', 'delete', 223, NULL, 'Live'),
(228, '', 'view_details', 'view_details', 223, NULL, 'Live'),
(229, 'food_menu_category', '', 'food_menu_category', 0, 9, 'Live'),
(230, '', 'add', 'add', 229, NULL, 'Live'),
(231, '', 'update', 'update', 229, NULL, 'Live'),
(232, '', 'view', 'view', 229, NULL, 'Live'),
(233, '', 'delete', 'delete', 229, NULL, 'Live'),
(234, 'food_menus', '', 'food_menus', 0, 9, 'Live'),
(235, '', 'add', 'add', 234, NULL, 'Live'),
(236, '', 'update', 'update', 234, NULL, 'Live'),
(237, '', 'view', 'view', 234, NULL, 'Live'),
(238, '', 'delete', 'delete', 234, NULL, 'Live'),
(239, '', 'view_details', 'view_details', 234, NULL, 'Live'),
(240, '', 'assign_modifier', 'assign_modifier', 234, NULL, 'Live'),
(241, '', 'upload_food_menu', 'upload_food_menu', 234, NULL, 'Live'),
(242, '', 'upload_food_menu_ingredients', 'upload_food_menu_ingredients', 234, NULL, 'Live'),
(243, '', 'item_barcode', 'item_barcode', 234, NULL, 'Live'),
(244, 'suppliers', '', 'suppliers', 0, 5, 'Live'),
(245, '', 'add', 'add', 244, NULL, 'Live'),
(246, '', 'update', 'update', 244, NULL, 'Live'),
(247, '', 'view', 'view', 244, NULL, 'Live'),
(248, '', 'delete', 'delete', 244, NULL, 'Live'),
(249, 'customers', '', 'customers', 0, 6, 'Live'),
(250, '', 'add', 'add', 249, NULL, 'Live'),
(251, '', 'update', 'update', 249, NULL, 'Live'),
(252, '', 'view', 'view', 249, NULL, 'Live'),
(253, '', 'delete', 'delete', 249, NULL, 'Live'),
(254, '', 'upload_customer', 'upload_customer', 249, NULL, 'Live'),
(255, 'expense_items', '', 'expense_items', 0, 7, 'Live'),
(256, '', 'add', 'add', 255, NULL, 'Live'),
(257, '', 'update', 'update', 255, NULL, 'Live'),
(258, '', 'view', 'view', 255, NULL, 'Live'),
(259, '', 'delete', 'delete', 255, NULL, 'Live'),
(260, 'payment_methods', '', 'payment_methods', 0, 3, 'Live'),
(261, '', 'add', 'add', 260, NULL, 'Live'),
(262, '', 'update', 'update', 260, NULL, 'Live'),
(263, '', 'view', 'view', 260, NULL, 'Live'),
(264, '', 'delete', 'delete', 260, NULL, 'Live'),
(265, 'denominations', '', 'denominations', 0, 3, 'Live'),
(266, '', 'add', 'add', 265, NULL, 'Live'),
(267, '', 'update', 'update', 265, NULL, 'Live'),
(268, '', 'view', 'view', 265, NULL, 'Live'),
(269, '', 'delete', 'delete', 265, NULL, 'Live'),
(270, 'deliveryPartners', '', 'deliveryPartners', 0, 3, 'Live'),
(271, '', 'add', 'add', 270, NULL, 'Live'),
(272, '', 'update', 'update', 270, NULL, 'Live'),
(273, '', 'view', 'view', 270, NULL, 'Live'),
(274, '', 'delete', 'delete', 270, NULL, 'Live'),
(275, 'areas', '', 'areas', 0, 3, 'Live'),
(276, '', 'add', 'add', 275, NULL, 'Live'),
(277, '', 'update', 'update', 275, NULL, 'Live'),
(278, '', 'view', 'view', 275, NULL, 'Live'),
(279, '', 'delete', 'delete', 275, NULL, 'Live'),
(280, 'tables', '', 'tables', 0, 3, 'Live'),
(281, '', 'add', 'add', 280, NULL, 'Live'),
(282, '', 'update', 'update', 280, NULL, 'Live'),
(283, '', 'view', 'view', 280, NULL, 'Live'),
(284, '', 'delete', 'delete', 280, NULL, 'Live'),
(285, 'roles', '', 'roles', 0, 10, 'Live'),
(286, '', 'add', 'add', 285, NULL, 'Live'),
(287, '', 'update', 'update', 285, NULL, 'Live'),
(288, '', 'view', 'view', 285, NULL, 'Live'),
(289, '', 'delete', 'delete', 285, NULL, 'Live'),
(290, '', 'copy', 'copy', 285, NULL, 'Live'),
(291, 'users', '', 'users', 0, 10, 'Live'),
(292, '', 'add', 'add', 291, NULL, 'Live'),
(293, '', 'update', 'update', 291, NULL, 'Live'),
(294, '', 'view', 'view', 291, NULL, 'Live'),
(295, '', 'delete', 'delete', 291, NULL, 'Live'),
(296, '', 'activate', 'activate', 291, NULL, 'Live'),
(297, '', 'deactivate', 'deactivate', 291, NULL, 'Live'),
(298, 'change_profile', '', 'change_profile', 0, 10, 'Live'),
(299, '', 'update', 'update', 298, NULL, 'Live'),
(300, 'change_password', '', 'change_password', 0, 10, 'Live'),
(301, '', 'update', 'update', 300, NULL, 'Live'),
(302, 'SetSecurityQuestion', '', 'SetSecurityQuestion', 0, 10, 'Live'),
(303, '', 'update', 'update', 302, NULL, 'Live'),
(304, '', 'change_delivery_address', 'change_delivery_address', 123, NULL, 'Live'),
(305, '', 'exportDailySales', 'exportDailySales', 123, NULL, 'Live'),
(306, '', 'resetDailySales', 'resetDailySales', 123, NULL, 'Live'),
(307, 'transferReport', '', 'transferReport', 0, 8, 'Live'),
(308, '', 'view', 'view', 307, NULL, 'Live'),
(309, '', 'sorting', 'sorting', 260, NULL, 'Live'),
(310, 'check_in_check_out', '', 'check_in_check_out', 0, 1, 'Live'),
(311, '', 'check_in', 'check_in', 310, NULL, 'Live'),
(312, '', 'check_out', 'check_out', 310, NULL, 'Live'),
(313, '', 'view', 'view', 310, NULL, 'Live'),
(314, 'z_report', '', 'z_report', 0, 8, 'Live'),
(315, '', 'view', 'view', 314, NULL, 'Live'),
(316, 'plugins', '', 'plugins', 0, 1, 'Live'),
(317, '', 'view', 'view', 316, NULL, 'Live'),
(318, '', 'delete', 'delete', 316, NULL, 'Live'),
(319, '', 'activate', 'activate', 316, NULL, 'Live'),
(320, '', 'deactivate', 'deactivate', 316, NULL, 'Live'),
(321, 'send_sms', '', 'send_sms', 0, 1, 'Live'),
(322, '', 'view', 'view', 321, NULL, 'Live'),
(325, 'premade_food', '', 'premade_food', 0, 9, 'Live'),
(326, '', 'add', 'add', 325, NULL, 'Live'),
(327, '', 'update', 'update', 325, NULL, 'Live'),
(328, '', 'view', 'view', 325, NULL, 'Live'),
(329, '', 'delete', 'delete', 325, NULL, 'Live'),
(330, 'change_pin', '', 'change_pin', 0, 10, 'Live'),
(331, '', 'update', 'update', 330, NULL, 'Live'),
(332, 'productAnalysisReport', '', 'productAnalysisReport', 0, 8, 'Live'),
(333, '', 'view', 'view', 332, NULL, 'Live'),
(337, 'productionReport', '', 'productionReport', 0, 8, 'Live'),
(338, '', 'view', 'view', 337, NULL, 'Live'),
(339, '', 'sortingForPOS', 'ordering_for_pos', 229, NULL, 'Live'),
(340, 'production', '', 'production', 0, 5, 'Live'),
(341, '', 'add', 'add', 340, NULL, 'Live'),
(342, '', 'update', 'update', 340, NULL, 'Live'),
(343, '', 'view', 'view', 340, NULL, 'Live'),
(344, '', 'delete', 'delete', 340, NULL, 'Live'),
(345, '', 'view_details', 'view_details', 340, NULL, 'Live'),
(346, 'inventory_food_menu', '', 'inventory_food_menu', 0, 8, 'Live'),
(347, '', 'view', 'view', 346, NULL, 'Live'),
(350, 'reset_transactional_data', '', 'reset_transactional_data', 0, 3, 'Live'),
(351, '', 'reset', 'Reset', 350, NULL, 'Live'),
(352, '', 'pos_25', 'direct_invoice', 73, NULL, 'Live'),
(353, 'Counters', '', 'Counters', 0, 3, 'Live'),
(354, '', 'add', 'add', 353, NULL, 'Live'),
(355, '', 'update', 'update', 353, NULL, 'Live'),
(356, '', 'view', 'view', 353, NULL, 'Live'),
(357, '', 'delete', 'delete', 353, NULL, 'Live'),
(358, 'allsettingpermission', '', 'allsettingpermission', 0, 3, 'Live'),
(361, '', 'all_setting', 'all_setting', 358, NULL, 'Live'),
(362, 'kitchenPerformanceReport', '', 'kitchenPerformanceReport', 0, 8, 'Live'),
(363, '', 'view', 'view', 362, NULL, 'Live'),
(364, 'sos_Self_Order_Setting', '', 'sos_Self_Order_Setting', 0, 3, 'Live'),
(365, '', 'all_setting_sel_order', 'all_setting_sel_order', 364, NULL, 'Live'),
(366, 'online_order_setting', '', 'online_order_setting', 0, 3, 'Live'),
(367, '', 'all_setting_online_order', 'all_setting_online_order', 366, NULL, 'Live'),
(368, 'reservationSetting', '', 'reservationSetting', 0, 3, 'Live'),
(369, '', 'all_setting_reservation_order', 'all_setting_reservation_order', 368, NULL, 'Live'),
(370, 'serviceDeliveryChargeReport', '', 'serviceDeliveryChargeReport', 0, 8, 'Live'),
(371, '', 'view', 'view', 370, NULL, 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_areas`
--

CREATE TABLE `tbl_areas` (
  `id` int NOT NULL,
  `outlet_id` int NOT NULL DEFAULT '0',
  `area_name` varchar(250) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `tbl_border_color` varchar(20) DEFAULT NULL,
  `tbl_bg_color` varchar(20) DEFAULT NULL,
  `tbl_text_color` varchar(20) DEFAULT NULL,
  `ordered_border_color` varchar(20) DEFAULT NULL,
  `ordered_bg_color` varchar(20) DEFAULT NULL,
  `ordered_text_color` varchar(20) DEFAULT NULL,
  `box_border_color` varchar(20) DEFAULT NULL,
  `box_bg_color` varchar(20) DEFAULT NULL,
  `box_text_color` varchar(20) DEFAULT NULL,
  `table_design_content` text,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_areas`
--

INSERT INTO `tbl_areas` (`id`, `outlet_id`, `area_name`, `description`, `company_id`, `tbl_border_color`, `tbl_bg_color`, `tbl_text_color`, `ordered_border_color`, `ordered_bg_color`, `ordered_text_color`, `box_border_color`, `box_bg_color`, `box_text_color`, `table_design_content`, `del_status`) VALUES
(1, 1, 'Floor 1', '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '\n                                                <div id=\"canvas\" class=\"format-letter\">\n\n                                                <div style=\"left: 58px; top: 28px; z-index: 99999;\" class=\"drag element parent-container  text-element table_box default_box_style_default ui-draggable\">\n                                    <div class=\"div_rectangular img_bg_4\">\n                                        <div class=\"trigger_to_select_other get_table_details table_data_1\" data-name=\"Table 1\" data-id=\"1\" data-hidden_table_capacity=\"4\">Table 1</div>\n                                    </div>\n                                </div>\n                    </div>\n                                             ', 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_attendance`
--

CREATE TABLE `tbl_attendance` (
  `id` int NOT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `in_time` time DEFAULT NULL,
  `out_time` time DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live',
  `is_closed` int NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_attendance`
--

INSERT INTO `tbl_attendance` (`id`, `reference_no`, `employee_id`, `date`, `in_time`, `out_time`, `note`, `user_id`, `company_id`, `del_status`, `is_closed`) VALUES
(1, '000001', 1, '2026-02-02', '21:19:36', '21:24:00', NULL, 1, 1, 'Live', 2),
(2, '000002', 1, '2026-02-03', '00:21:32', '00:00:00', NULL, 1, 1, 'Live', 2),
(3, '000003', 1, '2026-02-04', '19:26:14', '00:00:00', NULL, 1, 1, 'Live', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_audit_logs`
--

CREATE TABLE `tbl_audit_logs` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `event_title` varchar(100) DEFAULT NULL,
  `date_time` varchar(50) DEFAULT NULL,
  `details` text,
  `date` varchar(20) DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live',
  `outlet_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_audit_logs`
--

INSERT INTO `tbl_audit_logs` (`id`, `user_id`, `event_title`, `date_time`, `details`, `date`, `del_status`, `outlet_id`) VALUES
(1, 1, 'Cancelled Sale', '2026-02-04 23:42:51', '<b>Reason: ww</b><br>Sale No: aRV260204-001, Sale Date: 2026/02/04, Customer: Walk-in Customer - , VAT: 0.00,Discount: 0.00, Total Payable: 1299.00<br><b>Items:</b><br>Combo Deals(1 X 1299.00)', '2026-02-04', 'Live', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_carts`
--

CREATE TABLE `tbl_carts` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `outlet_id` int NOT NULL,
  `company_id` int NOT NULL DEFAULT '0',
  `json_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_combo_food_menus`
--

CREATE TABLE `tbl_combo_food_menus` (
  `id` bigint NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `food_menu_id` int DEFAULT NULL,
  `added_food_menu_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_companies`
--

CREATE TABLE `tbl_companies` (
  `id` int NOT NULL,
  `business_name` varchar(50) DEFAULT NULL,
  `short_name` varchar(2) NOT NULL DEFAULT 'iR',
  `website` text,
  `date_format` varchar(50) DEFAULT NULL,
  `zone_name` varchar(50) DEFAULT NULL,
  `currency` varchar(50) DEFAULT NULL,
  `currency_position` varchar(100) DEFAULT NULL,
  `precision` varchar(10) DEFAULT NULL,
  `default_customer` int DEFAULT '1',
  `default_waiter` int DEFAULT NULL,
  `default_payment` int DEFAULT NULL,
  `payment_settings` text,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `invoice_footer` varchar(500) DEFAULT NULL,
  `print_format_invoice` varchar(500) DEFAULT '80mm',
  `sms_setting_check` varchar(20) DEFAULT NULL,
  `invoice_logo` text,
  `company_id` int DEFAULT NULL,
  `collect_tax` varchar(50) DEFAULT NULL,
  `tax_title` varchar(100) DEFAULT NULL,
  `tax_registration_no` varchar(100) DEFAULT NULL,
  `tax_is_gst` varchar(50) DEFAULT NULL,
  `state_code` varchar(50) DEFAULT NULL,
  `tax_setting` text,
  `tax_string` varchar(250) DEFAULT NULL,
  `outlet_qty` int DEFAULT NULL,
  `sms_enable_status` int DEFAULT NULL,
  `sms_details` text,
  `custom_label` varchar(200) DEFAULT NULL,
  `custom_url` text,
  `smtp_enable_status` int DEFAULT NULL,
  `smtp_details` text,
  `whatsapp_share_number` varchar(20) DEFAULT NULL,
  `language_manifesto` varchar(20) DEFAULT NULL,
  `white_label` text,
  `website_white_label` text,
  `company_id_xml` varchar(250) DEFAULT NULL,
  `tax_registration_number` varchar(250) DEFAULT NULL,
  `attendance_type` int NOT NULL DEFAULT '2',
  `tax_accounting_basis` varchar(250) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `plan_id` int DEFAULT NULL,
  `monthly_cost` float DEFAULT NULL,
  `number_of_maximum_users` varchar(10) DEFAULT NULL,
  `number_of_maximum_outlets` varchar(10) DEFAULT NULL,
  `number_of_maximum_invoices` varchar(10) DEFAULT NULL,
  `access_day` varchar(10) DEFAULT NULL,
  `payment_clear` varchar(20) DEFAULT 'No',
  `is_block_all_user` varchar(10) DEFAULT 'No',
  `customer_reviewers` text,
  `counter_details` text,
  `social_link_details` text,
  `email_settings` text,
  `export_daily_sale` varchar(20) DEFAULT NULL,
  `printing_invoice` varchar(30) DEFAULT 'web_browser',
  `receipt_printer_invoice` int DEFAULT NULL,
  `printing_bill` varchar(100) DEFAULT 'web_browser',
  `receipt_printer_bill` varchar(100) DEFAULT NULL,
  `print_format_bill` varchar(100) DEFAULT '80mm',
  `printing_kot` varchar(100) DEFAULT 'web_browser',
  `receipt_printer_kot` varchar(100) DEFAULT NULL,
  `print_format_kot` varchar(100) DEFAULT '80mm',
  `print_server_url_invoice` varchar(100) DEFAULT NULL,
  `print_server_url_bill` varchar(100) DEFAULT NULL,
  `languge_manifesto` varchar(50) DEFAULT NULL,
  `print_server_url_kot` varchar(100) DEFAULT NULL,
  `service_type` varchar(20) DEFAULT 'delivery',
  `service_amount` varchar(20) DEFAULT NULL,
  `take_away_service_charge` varchar(50) DEFAULT NULL,
  `delivery_type` varchar(20) DEFAULT NULL,
  `delivery_amount` varchar(20) DEFAULT NULL,
  `languagefcrt_manifesto` varchar(50) DEFAULT NULL,
  `active_code` varchar(20) DEFAULT NULL,
  `is_active` int NOT NULL DEFAULT '1',
  `tax_type` int NOT NULL DEFAULT '1',
  `decimals_separator` varchar(20) DEFAULT '.',
  `thousands_separator` varchar(20) DEFAULT '',
  `print_kot_when_placing_order` varchar(5) NOT NULL DEFAULT 'No',
  `open_cash_drawer_when_printing_invoice` varchar(5) DEFAULT 'No',
  `when_clicking_on_item_in_pos` varchar(20) DEFAULT '2',
  `default_order_type` int DEFAULT NULL,
  `default_order_type_delivery_p` int DEFAULT NULL,
  `is_rounding_enable` int DEFAULT NULL,
  `is_loyalty_enable` varchar(20) NOT NULL DEFAULT 'Yes',
  `minimum_point_to_redeem` int NOT NULL DEFAULT '0',
  `loyalty_rate` float DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live',
  `sos_enable_self_order` varchar(20) NOT NULL DEFAULT 'No',
  `sos_enable_online_order` varchar(20) NOT NULL DEFAULT 'No',
  `sos_enable_online_order_frontend_website` int NOT NULL DEFAULT '1',
  `split_bill` int NOT NULL DEFAULT '1',
  `place_order_tooltip` varchar(20) NOT NULL DEFAULT 'show',
  `pre_or_post_payment` int NOT NULL DEFAULT '1',
  `food_menu_tooltip` varchar(20) NOT NULL DEFAULT 'show',
  `reservation_times` text,
  `reservation_status` varchar(20) NOT NULL DEFAULT 'enable',
  `price_interval` varchar(20) DEFAULT NULL,
  `sms_service_provider` int NOT NULL DEFAULT '0',
  `sms_send_auto` int NOT NULL DEFAULT '1',
  `saas_landing_page` int NOT NULL DEFAULT '1',
  `table_bg_color` varchar(50) DEFAULT '#3f50e0',
  `active_login_button` int NOT NULL DEFAULT '1',
  `login_type` int NOT NULL DEFAULT '1',
  `main_banner_section` text,
  `service_section` text,
  `explore_menu_section` text,
  `social_media` text,
  `google_map` text,
  `contact_us_des` text,
  `about_us` text,
  `common_menu_page` text,
  `facebook_app_id` text,
  `facebook_app_secret` text,
  `google_client_id` text,
  `google_client_secret_key` text,
  `administrator_email` varchar(100) DEFAULT NULL,
  `terms_and_condition` varchar(11) DEFAULT NULL,
  `apply_on_delivery_charge` int NOT NULL DEFAULT '2',
  `sos_enable_reservation` varchar(20) DEFAULT 'Yes',
  `kot_print_online_self_order` int NOT NULL DEFAULT '2',
  `show_order_full_short` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_companies`
--

INSERT INTO `tbl_companies` (`id`, `business_name`, `short_name`, `website`, `date_format`, `zone_name`, `currency`, `currency_position`, `precision`, `default_customer`, `default_waiter`, `default_payment`, `payment_settings`, `address`, `phone`, `invoice_footer`, `print_format_invoice`, `sms_setting_check`, `invoice_logo`, `company_id`, `collect_tax`, `tax_title`, `tax_registration_no`, `tax_is_gst`, `state_code`, `tax_setting`, `tax_string`, `outlet_qty`, `sms_enable_status`, `sms_details`, `custom_label`, `custom_url`, `smtp_enable_status`, `smtp_details`, `whatsapp_share_number`, `language_manifesto`, `white_label`, `website_white_label`, `company_id_xml`, `tax_registration_number`, `attendance_type`, `tax_accounting_basis`, `created_date`, `plan_id`, `monthly_cost`, `number_of_maximum_users`, `number_of_maximum_outlets`, `number_of_maximum_invoices`, `access_day`, `payment_clear`, `is_block_all_user`, `customer_reviewers`, `counter_details`, `social_link_details`, `email_settings`, `export_daily_sale`, `printing_invoice`, `receipt_printer_invoice`, `printing_bill`, `receipt_printer_bill`, `print_format_bill`, `printing_kot`, `receipt_printer_kot`, `print_format_kot`, `print_server_url_invoice`, `print_server_url_bill`, `languge_manifesto`, `print_server_url_kot`, `service_type`, `service_amount`, `take_away_service_charge`, `delivery_type`, `delivery_amount`, `languagefcrt_manifesto`, `active_code`, `is_active`, `tax_type`, `decimals_separator`, `thousands_separator`, `print_kot_when_placing_order`, `open_cash_drawer_when_printing_invoice`, `when_clicking_on_item_in_pos`, `default_order_type`, `default_order_type_delivery_p`, `is_rounding_enable`, `is_loyalty_enable`, `minimum_point_to_redeem`, `loyalty_rate`, `del_status`, `sos_enable_self_order`, `sos_enable_online_order`, `sos_enable_online_order_frontend_website`, `split_bill`, `place_order_tooltip`, `pre_or_post_payment`, `food_menu_tooltip`, `reservation_times`, `reservation_status`, `price_interval`, `sms_service_provider`, `sms_send_auto`, `saas_landing_page`, `table_bg_color`, `active_login_button`, `login_type`, `main_banner_section`, `service_section`, `explore_menu_section`, `social_media`, `google_map`, `contact_us_des`, `about_us`, `common_menu_page`, `facebook_app_id`, `facebook_app_secret`, `google_client_id`, `google_client_secret_key`, `administrator_email`, `terms_and_condition`, `apply_on_delivery_charge`, `sos_enable_reservation`, `kot_print_online_self_order`, `show_order_full_short`) VALUES
(1, 'Cheezy Bite MA-MA &amp;amp; Sons', 'iR', 'fireapp.cc', 'Y/m/d', 'Asia/Karachi', 'PKR', 'Before Amount', '2', 1, 3, 1, '{\"field_2\":\"\",\"field_3\":\"\",\"field_5\":\"\",\"field_2_v\":\"sandbox\",\"field_3_v\":\"demo\",\"field_4_v\":\"demo\",\"field_2_key_1\":\"AU4W5_vh3LbxnLpd6w6-Ctk5juhxfHPOSii3R_sFvTnC0HPgf-9T7-TZ2UTjH_2xaP5rBcOHUaKVtPiK\",\"field_2_key_2\":\"EIH1A6UUFtnIKn1OyIejWckUpRDnCQJC7cHNmiDMOOSNr7zPNGvkWq53ULT1Pg3g3eKA89OaQxrd3gi0\",\"field_3_key_1\":\"sk_test_51GqddZFGCHDmFd2QAXjmjrbYpEiVTjx4VrLifrt2BqPgMEDOvaPpE78MJUQjpRitJYiHgsAVUh3MEPbT3S97WsVq00ErmzU133\",\"field_3_key_2\":\"pk_test_51GqddZFGCHDmFd2QQCHEDkicU2Y6AiRvUQySrQVzaarBO9c4VJvq7F8geZWCV3JOQK4ETUJHhDXPDVVN0PXyqfIT00uWJ56gPB\",\"field_4_key_1\":\"rzp_test_pm0zv2KQ07bwi5\",\"field_4_key_2\":\"2LD1rNucYo9aXxfb1cve1oms\",\"paypal_business_email\":\"sb-xtr47c5533995@business.example.com\",\"url_paypal\":\"https:\\/\\/www.sandbox.paypal.com\\/cgi-bin\\/webscr\"}', '384, KALIBARY ROAD, PIROJPUR-8500', '+923065305216', 'Thank you for visiting us!', '80mm', 'Yes', '758aded8490b65debcaa135174711d19.jpeg', 1, 'No', 'Local Taxes', '32132587', 'No', '0931232', '[{\"id\":\"1\",\"tax\":\"CGST\",\"tax_rate\":\"9\"},{\"id\":\"1\",\"tax\":\"SGST\",\"tax_rate\":\"9\"},{\"id\":\"1\",\"tax\":\"IGST\",\"tax_rate\":\"6\"}]', 'CGST:SGST:IGST:', 2, 5, '{\"field_1_0\":\"AC912936630bb5e4a34cf6247ff9d28f07\",\"field_1_1\":\"7183bbecf7b47009dd592f1e80f2cb1a\",\"field_1_2\":\"+15108923589\",\"field_2_0\":\"wwww\",\"field_2_1\":\"wwww\",\"field_2_2\":\"wwww\",\"field_2_3\":\"+880\"}', 'Watch Video', 'https://www.facebook.com/', 1, '{\"email_address\":\"test@gmail.com\",\"password\":\"43241\"}', '+923065305216', 'revhgbrev', '{\"site_name\":\"Cheezy Bite \",\"system_logo\":\"02567c75eeccf29ebe7aa151788d1457.jpeg\",\"favicon\":\"9e0ac66726db5420c6cc1664eafacc02.jpeg\",\"footer\":\"Cheezy Bite\"}', '{\"site_name\":\"Online Order of Cheezy Bite MA-MA &amp; Sons\",\"system_logo\":\"c9fc05649cb439099967a1c7f4b50bba.jpeg\",\"favicon\":\"e27900eedcbbe2d3e56a0187aff77c15.jpeg\",\"footer\":\"Online Order of Cheezy Bite MA-MA &amp; Sons\\r\\n\",\"website_theme_color\":\"#d7ff0f\"}', NULL, NULL, 2, NULL, '2021-03-17 16:42:03', NULL, NULL, NULL, '1', NULL, NULL, 'No', 'No', '[\"{\\\"name\\\":\\\"Colin Smalls\\\",\\\"designation\\\":\\\"Basketball Player\\\",\\\"description\\\":\\\"This cozy restaurant has left the best impressions! Hospitable hosts, delicious dishes, beautiful presentation, wide wine list and wonderful dessert. I recommend to everyone! I would like to come back here again and again.\\\"}\",\"{\\\"name\\\":\\\"Sylvester Stallone\\\",\\\"designation\\\":\\\"Actor\\\",\\\"description\\\":\\\"It\\\\u2019s a great experience. The ambiance is very welcoming and charming. Amazing wines, food and service. Staff are extremely knowledgeable and make great recommendations.\\\"}\",\"{\\\"name\\\":\\\"Billie Eilish\\\",\\\"designation\\\":\\\"Musician\\\",\\\"description\\\":\\\"Excellent food. Menu is extensive and seasonal to a particularly high standard. Definitely fine dining. It can be expensive but worth it and they do different deals on different nights so it\\\\u2019s worth checking them out before you book. Highly recommended.\\\"}\"]', '{\"restaurants\":\"47\",\"users\":\"214\",\"reference\":\"96\",\"daily_transactions\":\"8128\"}', '{\"facebook\":\"https:\\/\\/www.facebook.com\\/\",\"twitter\":\"https:\\/\\/twitter.com\\/\",\"instagram\":\"https:\\/\\/www.instagram.com\\/\",\"youtube\":\"https:\\/\\/www.youtube.com\\/\"}', '{\"enable_status\":\"1\",\"host_name\":\"smtp.gmail.com\",\"email_send_to\":\"helpdesk@doorsoft.co\",\"port_address\":\"465\",\"user_name\":\"mkraju.doorsoft@gmail.com\",\"password\":\"mhmrpahjwmyyveuc\"}', 'enable', 'live_server_print', 0, 'live_server_print', '23', '80mm', 'direct_print', '2', '80mm', '192.168.1.12', '192.168.1.13', 'stwtyqxst', '192.168.1.14', 'service', '', '', NULL, '', 'sGmsJaFJVEFCrt1', '3332444', 1, 1, '.', ',', 'Yes', 'No', '2', 1, 0, 0, 'disable', 0, 0.1, 'Live', 'Yes', 'Yes', 0, 1, 'show', 1, 'show', '[{\"counter\":1,\"status\":\"1\",\"counter_name\":\"Sunday\",\"start_time\":\"01:00 am\",\"end_time\":\"12:00 am\",\"start_time_int\":\"1:00\",\"end_time_int\":24},{\"counter\":2,\"status\":\"1\",\"counter_name\":\"Monday\",\"start_time\":\"01:00 am\",\"end_time\":\"11:00 pm\",\"start_time_int\":\"1:00\",\"end_time_int\":\"23:00\"},{\"counter\":3,\"status\":\"\",\"counter_name\":\"Tuesday\",\"start_time\":\"01:00 pm\",\"end_time\":\"11:00 pm\",\"start_time_int\":\"13:00\",\"end_time_int\":\"23:00\"},{\"counter\":4,\"status\":\"1\",\"counter_name\":\"Wednesday\",\"start_time\":\"05:00 pm\",\"end_time\":\"10:00 pm\",\"start_time_int\":\"17:00\",\"end_time_int\":\"22:00\"},{\"counter\":5,\"status\":\"1\",\"counter_name\":\"Thursday\",\"start_time\":\"01:00 pm\",\"end_time\":\"12:00 am\",\"start_time_int\":\"13:00\",\"end_time_int\":24},{\"counter\":6,\"status\":\"1\",\"counter_name\":\"Friday\",\"start_time\":\"08:00 am\",\"end_time\":\"09:00 pm\",\"start_time_int\":\"8:00\",\"end_time_int\":\"21:00\"},{\"counter\":7,\"status\":\"1\",\"counter_name\":\"Saturday\",\"start_time\":\"11:00 am\",\"end_time\":\"04:30 pm\",\"start_time_int\":\"11:00\",\"end_time_int\":\"16:30\"}]', '', NULL, 0, 1, 1, 'table_bg_1', 1, 1, '{\"main_header\":\"Dine with Delight at Macdonald\",\"short_des\":\"Satisfy your cravings with delicious meals at Macdonald. Whether you&#039;re here for a quick bite or a special celebration\",\"main_banner\":\"08228d971ba94c79229271c56a738ca5.jpg\"}', '{\"service_title\":\"Fresh Ingredients, Great Taste\",\"service_heading\":\"Every Dish Made with Care\",\"service_description\":\"At Macdonald, we know great food starts with fresh ingredients. Our chefs put their heart into every dish, making sure each one is packed with flavor and quality. From tasty appetizers to delicious desserts, we have something for every taste. Each meal is made with care, so you can enjoy a wonderful dining experience from start to finish.\",\"service_image\":\"e9e4f71c0287a5cbec1918aa02c1c3d6.jpg\"}', '{\"explore_menu_title\":\"Explore Our Delicious Menu\",\"explore_menu_heading\":\"Tasty Dishes for Every Taste\"}', '{\"facebook_link\":\"x\",\"pinterest_link\":\"x\",\"google_link\":\"x\",\"twitter_link\":\"x\"}', 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d7299.367291073767!2d90.418476!3d23.829846!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c65e93000db3%3A0x53377a56daa4e74e!2sDoor%20Soft!5e0!3m2!1sen!2sbd!4v1738582088186!5m2!1sen!2sbd&quot; width=&quot;600&quot; height=&quot;450&quot; style=&quot;border:0;&quot; allowfullscreen=&quot;&quot; loading=&quot;lazy&quot; referrerpolicy=&quot;no-referrer-when-downgrade', 'At Macdonald, we value every customer and believe in creating a connection beyond just great food. If you have questions, feedback, or need assistance, we’re here to help! Reach out to us via phone for quick responses, send us an email for detailed inquiries, or visit us in person to experience our warm hospitality firsthand. Whether it’s about reservations, menu options, catering services, or anything else, we’re always happy to assist. Your thoughts and suggestions mean the world to us, so don’t hesitate to get in touch. We look forward to hearing from you and making your iRestora PLUS experience even better!', '{\"about_us_title\":\"Welcome to Macdonald\",\"abous_us_heading\":\"Good Food, Great Memories\",\"about_us_des\":\"At Macdonald, we are passionate about food and hospitality. We strive to offer a menu full of delicious dishes made with the finest ingredients, all served in a cozy, friendly environment. We believe that every meal should be memorable, and every guest should feel like family.\",\"about_us_image\":\"54f6dcc80b42c9235fefee43c2292e95.png\"}', '{\"common_menu_page_banner\":\"142b5e8c5f982e031f01abb694937b68.jpg\"}', 'd', 'd', 'd', 'd', 'adikhanofficial@gmail.com', NULL, 1, 'Yes', 1, 1),
(4, 'KFC R', 'iR', '', 'd/m/Y', 'Asia/Dhaka', '$', 'Before Amount', '2', 1, NULL, NULL, '{\"field_2\":\"1\",\"field_3\":\"1\",\"field_5\":\"1\",\"field_2_v\":\"sandbox\",\"field_3_v\":\"demo\",\"field_4_v\":\"demo\",\"field_2_key_1\":\"AU4W5_vh3LbxnLpd6w6-Ctk5juhxfHPOSii3R_sFvTnC0HPgf-9T7-TZ2UTjH_2xaP5rBcOHUaKVtPiK\",\"field_2_key_2\":\"EIH1A6UUFtnIKn1OyIejWckUpRDnCQJC7cHNmiDMOOSNr7zPNGvkWq53ULT1Pg3g3eKA89OaQxrd3gi0\",\"field_3_key_1\":\"sk_test_51GqddZFGCHDmFd2QAXjmjrbYpEiVTjx4VrLifrt2BqPgMEDOvaPpE78MJUQjpRitJYiHgsAVUh3MEPbT3S97WsVq00ErmzU133\",\"field_3_key_2\":\"pk_test_51GqddZFGCHDmFd2QQCHEDkicU2Y6AiRvUQySrQVzaarBO9c4VJvq7F8geZWCV3JOQK4ETUJHhDXPDVVN0PXyqfIT00uWJ56gPB\",\"field_4_key_1\":\"rzp_test_pm0zv2KQ07bwi5\",\"field_4_key_2\":\"2LD1rNucYo9aXxfb1cve1oms\",\"paypal_business_email\":\"sb-xtr47c5533995@business.example.com\",\"url_paypal\":\"https:\\/\\/www.sandbox.paypal.com\\/cgi-bin\\/webscr\"}', '', '123546789', '', '80mm', 'Yes', '', NULL, 'Yes', 'Local Taxes', '32132587', 'Yes', '0931232', '[{\"id\":\"1\",\"tax\":\"CGST\",\"tax_rate\":\"9\"},{\"id\":\"1\",\"tax\":\"SGST\",\"tax_rate\":\"9\"},{\"id\":\"1\",\"tax\":\"IGST\",\"tax_rate\":\"6\"},{\"id\":\"1\",\"tax\":\"VAT\",\"tax_rate\":\"5\"}]', 'CGST:SGST:IGST:VAT:', NULL, 5, '{\"field_1_0\":\"AC912936630bb5e4a34cf6247ff9d28f07\",\"field_1_1\":\"7183bbecf7b47009dd592f1e80f2cb1a\",\"field_1_2\":\"+15108923589\",\"field_2_0\":\"wwww\",\"field_2_1\":\"wwww\",\"field_2_2\":\"wwww\",\"field_2_3\":\"+880\"}', NULL, NULL, 1, '{\"email_address\":\"test@gmail.com\",\"password\":\"43241\"}', '+923065305216', 'revhgbrev', '{\"site_name\":\"iRestora PLUS  - Next Gen Restaurant POS\",\"system_logo\":\"320612551b106b790e6f2a113039de3e.png\",\"favicon\":\"b121388844c8a5041ca68911b1256815.ico\",\"footer\":\"iRestora PLUS  - Next Gen Restaurant POS\"}', NULL, NULL, NULL, 2, NULL, '2025-04-24 06:19:53', 2, 20.99, '33', '33', '33', '15', 'Yes', 'No', NULL, NULL, NULL, NULL, NULL, 'web_browser', NULL, 'web_browser', NULL, '80mm', 'web_browser', NULL, '80mm', NULL, NULL, NULL, NULL, 'delivery', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '.', '', 'No', 'No', '2', NULL, NULL, NULL, 'Yes', 0, NULL, 'Live', 'No', 'No', 1, 1, 'show', 1, 'show', NULL, 'enable', NULL, 0, 1, 1, '#3f50e0', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'Yes', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contacts`
--

CREATE TABLE `tbl_contacts` (
  `id` int NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_counters`
--

CREATE TABLE `tbl_counters` (
  `id` int NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `outlet_id` varchar(11) DEFAULT NULL,
  `invoice_printer_id` int DEFAULT NULL,
  `bill_printer_id` int NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `added_date` varchar(55) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT '0',
  `del_status` varchar(11) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_counters`
--

INSERT INTO `tbl_counters` (`id`, `name`, `outlet_id`, `invoice_printer_id`, `bill_printer_id`, `description`, `added_date`, `user_id`, `company_id`, `del_status`) VALUES
(1, '01', '1', 1, 1, '', '2026-02-03 00:07:15', 1, 1, 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customers`
--

CREATE TABLE `tbl_customers` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `gst_number` varchar(50) DEFAULT NULL,
  `pre_or_post_payment` varchar(20) DEFAULT 'Post Payment',
  `area_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live',
  `date_of_birth` date DEFAULT NULL,
  `date_of_anniversary` date DEFAULT NULL,
  `default_discount` varchar(100) NOT NULL DEFAULT '0',
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `password_online_user` varchar(250) DEFAULT NULL,
  `same_or_diff_state` int NOT NULL DEFAULT '0',
  `active_code` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_customers`
--

INSERT INTO `tbl_customers` (`id`, `name`, `phone`, `email`, `address`, `password`, `gst_number`, `pre_or_post_payment`, `area_id`, `user_id`, `company_id`, `del_status`, `date_of_birth`, `date_of_anniversary`, `default_discount`, `added_date`, `password_online_user`, `same_or_diff_state`, `active_code`) VALUES
(1, 'Walk-in Customer', '', '', '', NULL, NULL, 'Post Payment', 0, 1, 1, 'Live', NULL, NULL, '', '2022-02-28 15:30:49', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer_address`
--

CREATE TABLE `tbl_customer_address` (
  `id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `is_active` int DEFAULT '0',
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer_due_receives`
--

CREATE TABLE `tbl_customer_due_receives` (
  `id` int NOT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `payment_id` int DEFAULT NULL,
  `only_date` date DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live',
  `counter_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_delivery_partners`
--

CREATE TABLE `tbl_delivery_partners` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `aggregator_tran_code` varchar(30) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `company_id` int UNSIGNED DEFAULT NULL,
  `logo` text,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_denominations`
--

CREATE TABLE `tbl_denominations` (
  `id` int NOT NULL,
  `amount` int DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_denominations`
--

INSERT INTO `tbl_denominations` (`id`, `amount`, `description`, `company_id`, `del_status`) VALUES
(1, 10, '', 1, 'Live'),
(2, 20, '', 1, 'Live'),
(3, 30, '', 1, 'Live'),
(4, 40, '', 1, 'Live'),
(5, 50, '', 1, 'Live'),
(6, 100, '', 1, 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_expenses`
--

CREATE TABLE `tbl_expenses` (
  `id` int NOT NULL,
  `date` date DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `payment_id` int DEFAULT '0',
  `added_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `del_status` varchar(10) DEFAULT 'Live',
  `counter_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_expense_items`
--

CREATE TABLE `tbl_expense_items` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_explores`
--

CREATE TABLE `tbl_explores` (
  `id` int NOT NULL,
  `explore_title` varchar(255) DEFAULT NULL,
  `explore_price` float DEFAULT NULL,
  `explore_des` text,
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(11) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_food_menus`
--

CREATE TABLE `tbl_food_menus` (
  `id` int NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternative_name` varchar(100) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `sale_price` float DEFAULT NULL,
  `tax_information` text,
  `tax_string` varchar(250) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `photo` varchar(250) DEFAULT NULL,
  `veg_item` varchar(50) DEFAULT 'Veg No',
  `beverage_item` varchar(50) DEFAULT 'Beverage No',
  `bar_item` varchar(50) DEFAULT 'Bar No',
  `parent_id` int NOT NULL DEFAULT '0',
  `vr_ingr` text,
  `del_status` varchar(10) DEFAULT 'Live',
  `vr_del_details` text,
  `sale_price_take_away` float DEFAULT NULL,
  `sale_price_delivery` float DEFAULT NULL,
  `delivery_price` text,
  `total_cost` float DEFAULT NULL,
  `loyalty_point` float DEFAULT '0',
  `product_type` int NOT NULL DEFAULT '1',
  `purchase_price` float DEFAULT NULL,
  `alert_quantity` float DEFAULT NULL,
  `ing_category_id` int DEFAULT NULL,
  `combo_ids` varchar(50) DEFAULT NULL,
  `is_variation` int NOT NULL DEFAULT '0',
  `show_online` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_food_menus`
--

INSERT INTO `tbl_food_menus` (`id`, `code`, `name`, `alternative_name`, `category_id`, `description`, `sale_price`, `tax_information`, `tax_string`, `user_id`, `company_id`, `photo`, `veg_item`, `beverage_item`, `bar_item`, `parent_id`, `vr_ingr`, `del_status`, `vr_del_details`, `sale_price_take_away`, `sale_price_delivery`, `delivery_price`, `total_cost`, `loyalty_point`, `product_type`, `purchase_price`, `alert_quantity`, `ing_category_id`, `combo_ids`, `is_variation`, `show_online`) VALUES
(1, 'APP-001', 'Supreme Nachos', '', 1, '', 495, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 495, 495, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(2, 'APP-002', 'Arabic Fries Nuggets (6Pcs)', '', 1, '', 450, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 450, 450, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(3, 'APP-003', 'Chicken Strips (6Pcs)', '', 1, '', 495, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 495, 495, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(4, 'APP-004', 'Fully Loaded Fries', '', 1, '', 550, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 550, 550, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(5, 'APP-005', 'Cheese Fries', '', 1, '', 450, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 450, 450, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(6, 'APP-006', 'Garlic Mayo Fries', '', 1, '', 350, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 350, 350, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(7, 'APP-007', 'French Fries', '', 1, '', 299, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 299, 299, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(8, 'APP-008', 'Fish &amp; Chips (4Pcs)', '', 1, '', 899, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 899, 899, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(9, 'APP-009', 'Cheese Ball (4Pcs)', '', 1, '', 650, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 650, 650, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(10, 'APP-010', 'Hummus', '', 1, '', 370, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 370, 370, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(11, 'APP-011', 'B.B.Q Wings (6Pcs)', '', 1, '', 370, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 370, 370, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(12, 'APP-012', 'Hot Wings (6Pcs)', '', 1, '', 320, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 320, 320, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(13, 'APP-013', 'Hot Shots (12Pcs)', '', 1, '', 599, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 599, 599, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(14, 'APP-014', 'Honey Mustard Wings (6Pcs)', '', 1, '', 370, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 370, 370, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(15, 'APP-015', 'Honey B.B.Q Wings (6Pcs)', '', 1, '', 370, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 370, 370, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(16, 'APP-016', 'Buffalo Wing (6Pcs)', '', 1, '', 370, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 370, 370, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(17, 'SOUP-001', 'Cheese Bite Special Soup', '', 2, 'Single', 200, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 200, 200, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(18, 'SOUP-002', 'Hot &amp; Sour Soup', '', 2, 'Single', 150, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 150, 150, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(19, 'SOUP-003', 'Chicken Corn Soup', '', 2, 'Single', 150, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 150, 150, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(20, 'TWIST-001', 'Cheese Bite Special Wrap', '', 4, '', 400, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 400, 400, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(21, 'TWIST-002', 'Grilled Chicken Cheese Wrap', '', 4, '', 400, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 400, 400, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(22, 'TWIST-003', 'Zinger Wrap', '', 4, '', 350, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 350, 350, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(23, 'TWIST-004', 'Arabic Shawarma', '', 4, '', 380, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 380, 380, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(24, 'TWIST-005', 'Zinger Shawarma', '', 4, '', 280, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 280, 280, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(25, 'TWIST-006', 'Chicken Cheese Shawarma', '', 4, '', 260, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 260, 260, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(26, 'TWIST-007', 'Chicken Shawarma', '', 4, '', 200, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 200, 200, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(27, 'TWIST-008', 'B.B.Q Paratha Roll', '', 4, '', 300, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 300, 300, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(28, 'TWIST-009', 'Zinger Paratha Roll', '', 4, '', 350, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 350, 350, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(29, 'TWIST-010', 'Behare Roll', '', 4, '', 450, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 450, 450, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(30, 'TWIST-011', 'Pizza Paratha', '', 4, '', 450, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 450, 450, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(31, 'TWIST-012', 'Chicken Paratha', '', 4, '', 350, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 350, 350, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(32, 'BROAST-001', 'Full Broast (8Pcs)', '', 5, '', 1999, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 1999, 1999, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(33, 'BROAST-002', 'Half Broast (4Pcs)', '', 5, '', 999, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 999, 999, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(34, 'BROAST-003', 'Fried Chicken Leg/Tigal', '', 5, '', 299, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 299, 299, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(35, 'BROAST-004', 'Fish Broast (500g)', '', 5, '', 1000, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 1000, 1000, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(36, 'BURG-001', 'Cheese Blast', '', 6, '', 499, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 499, 499, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(37, 'BURG-002', 'Spicy Burger', '', 6, '', 480, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 480, 480, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(38, 'BURG-003', 'Zing Burger', '', 6, '', 450, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 450, 450, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(39, 'BURG-004', 'Chicken Fillet Burger', '', 6, '', 470, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 470, 470, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(40, 'BURG-005', 'Grilled Chicken Cheese Burger', '', 6, '', 450, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 450, 450, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(41, 'BURG-006', 'Classic Beef Burger', '', 6, '', 750, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 750, 750, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(42, 'BURG-007', 'Sub Burger', '', 6, '', 350, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 350, 350, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(43, 'BURG-008', 'Tower Burger', '', 6, '', 700, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 700, 700, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(44, 'BURG-009', 'Aezal Burger', '', 6, '', 450, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 450, 450, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(45, 'BURG-010', 'Lawa Burger', '', 6, '', 700, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 700, 700, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(46, 'BURG-011', 'Club Sandwich', '', 6, '', 480, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 480, 480, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(47, 'BURG-012', 'Grilled Sandwich', '', 6, '', 450, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 450, 450, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(100, 'PIZZA-001', 'Special Crown Crust', '', 3, 'Pizza', 700, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 700, 700, '[]', 0, 0, 1, 0, 0, 0, '', 1, NULL),
(101, 'PIZZA-001-01', 'Small', 'S', 3, 'Pizza', 700, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 100, '', 'Live', '', 700, 700, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(102, 'PIZZA-001-02', 'Medium', 'M', 3, 'Pizza', 1300, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 100, '', 'Live', '', 1300, 1300, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(103, 'PIZZA-001-03', 'Large', 'L', 3, 'Pizza', 1800, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 100, '', 'Live', '', 1800, 1800, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(104, 'PIZZA-001-04', 'Extra Large', 'XL', 3, 'Pizza', 2200, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 100, '', 'Live', '', 2200, 2200, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(105, 'PIZZA-002', 'Chicken Tikka', '', 3, 'Pizza', 600, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 600, 600, '[]', 0, 0, 1, 0, 0, 0, '', 1, NULL),
(106, 'PIZZA-002-01', 'Small', 'S', 3, 'Pizza', 600, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 105, '', 'Live', '', 600, 600, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(107, 'PIZZA-002-02', 'Medium', 'M', 3, 'Pizza', 1200, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 105, '', 'Live', '', 1200, 1200, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(108, 'PIZZA-002-03', 'Large', 'L', 3, 'Pizza', 1600, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 105, '', 'Live', '', 1600, 1600, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(109, 'PIZZA-002-04', 'Extra Large', 'XL', 3, 'Pizza', 2000, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 105, '', 'Live', '', 2000, 2000, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(110, 'PIZZA-003', 'Fajita', '', 3, 'Pizza', 600, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 600, 600, '[]', 0, 0, 1, 0, 0, 0, '', 1, NULL),
(111, 'PIZZA-003-01', 'Small', 'S', 3, 'Pizza', 600, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 110, '', 'Live', '', 600, 600, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(112, 'PIZZA-003-02', 'Medium', 'M', 3, 'Pizza', 1200, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 110, '', 'Live', '', 1200, 1200, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(113, 'PIZZA-003-03', 'Large', 'L', 3, 'Pizza', 1600, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 110, '', 'Live', '', 1600, 1600, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(114, 'PIZZA-003-04', 'Extra Large', 'XL', 3, 'Pizza', 2000, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 110, '', 'Live', '', 2000, 2000, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(115, 'PIZZA-004', 'Hot &amp; Spicy', '', 3, 'Pizza', 600, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 600, 600, '[]', 0, 0, 1, 0, 0, 0, '', 1, NULL),
(116, 'PIZZA-004-01', 'Small', 'S', 3, 'Pizza', 600, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 115, '', 'Live', '', 600, 600, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(117, 'PIZZA-004-02', 'Medium', 'M', 3, 'Pizza', 1200, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 115, '', 'Live', '', 1200, 1200, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(118, 'PIZZA-004-03', 'Large', 'L', 3, 'Pizza', 1600, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 115, '', 'Live', '', 1600, 1600, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(119, 'PIZZA-004-04', 'Extra Large', 'XL', 3, 'Pizza', 2000, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 115, '', 'Live', '', 2000, 2000, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(120, 'PIZZA-005', 'Malai Tikka', '', 3, 'Pizza', 600, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 600, 600, '[]', 0, 0, 1, 0, 0, 0, '', 1, NULL),
(121, 'PIZZA-005-01', 'Small', 'S', 3, 'Pizza', 600, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 120, '', 'Live', '', 600, 600, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(122, 'PIZZA-005-02', 'Medium', 'M', 3, 'Pizza', 1200, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 120, '', 'Live', '', 1200, 1200, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(123, 'PIZZA-005-03', 'Large', 'L', 3, 'Pizza', 1600, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 120, '', 'Live', '', 1600, 1600, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(124, 'PIZZA-005-04', 'Extra Large', 'XL', 3, 'Pizza', 2000, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 120, '', 'Live', '', 2000, 2000, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(125, 'PIZZA-006', 'Vegetarian', '', 3, 'Pizza', 600, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 600, 600, '[]', 0, 0, 1, 0, 0, 0, '', 1, NULL),
(126, 'PIZZA-006-01', 'Small', 'S', 3, 'Pizza', 600, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 125, '', 'Live', '', 600, 600, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(127, 'PIZZA-006-02', 'Medium', 'M', 3, 'Pizza', 1200, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 125, '', 'Live', '', 1200, 1200, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(128, 'PIZZA-006-03', 'Large', 'L', 3, 'Pizza', 1600, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 125, '', 'Live', '', 1600, 1600, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(129, 'PIZZA-006-04', 'Extra Large', 'XL', 3, 'Pizza', 2000, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 125, '', 'Live', '', 2000, 2000, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(130, 'PIZZA-007', 'Pepperoni Pizza', '', 3, 'Pizza', 600, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 600, 600, '[]', 0, 0, 1, 0, 0, 0, '', 1, NULL),
(131, 'PIZZA-007-01', 'Small', 'S', 3, 'Pizza', 600, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 130, '', 'Live', '', 600, 600, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(132, 'PIZZA-007-02', 'Medium', 'M', 3, 'Pizza', 1200, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 130, '', 'Live', '', 1200, 1200, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(133, 'PIZZA-007-03', 'Large', 'L', 3, 'Pizza', 1600, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 130, '', 'Live', '', 1600, 1600, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(134, 'PIZZA-007-04', 'Extra Large', 'XL', 3, 'Pizza', 2000, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 130, '', 'Live', '', 2000, 2000, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(135, 'PIZZA-008', 'Calzone Pizza', '', 3, 'Pizza', 600, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 600, 600, '[]', 0, 0, 1, 0, 0, 0, '', 1, NULL),
(136, 'PIZZA-008-01', 'Small', 'S', 3, 'Pizza', 600, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 135, '', 'Live', '', 600, 600, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(137, 'PIZZA-008-02', 'Medium', 'M', 3, 'Pizza', 1200, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 135, '', 'Live', '', 1200, 1200, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(138, 'PIZZA-008-03', 'Large', 'L', 3, 'Pizza', 1600, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 135, '', 'Live', '', 1600, 1600, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(139, 'PIZZA-008-04', 'Extra Large', 'XL', 3, 'Pizza', 2000, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 135, '', 'Live', '', 2000, 2000, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(140, 'PIZZA-009', 'Cheese Lover', '', 3, 'Pizza', 600, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 600, 600, '[]', 0, 0, 1, 0, 0, 0, '', 1, NULL),
(141, 'PIZZA-009-01', 'Small', 'S', 3, 'Pizza', 600, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 140, '', 'Live', '', 600, 600, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(142, 'PIZZA-009-02', 'Medium', 'M', 3, 'Pizza', 1200, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 140, '', 'Live', '', 1200, 1200, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(143, 'PIZZA-009-03', 'Large', 'L', 3, 'Pizza', 1600, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 140, '', 'Live', '', 1600, 1600, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(144, 'PIZZA-009-04', 'Extra Large', 'XL', 3, 'Pizza', 2000, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 140, '', 'Live', '', 2000, 2000, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(145, 'PIZZA-010', 'Stuff Crust', '', 3, 'Pizza', 600, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 600, 600, '[]', 0, 0, 1, 0, 0, 0, '', 1, NULL),
(146, 'PIZZA-010-01', 'Small', 'S', 3, 'Pizza', 600, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 145, '', 'Live', '', 600, 600, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(147, 'PIZZA-010-02', 'Medium', 'M', 3, 'Pizza', 1200, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 145, '', 'Live', '', 1200, 1200, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(148, 'PIZZA-010-03', 'Large', 'L', 3, 'Pizza', 1600, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 145, '', 'Live', '', 1600, 1600, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(149, 'PIZZA-010-04', 'Extra Large', 'XL', 3, 'Pizza', 2000, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 145, '', 'Live', '', 2000, 2000, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(150, 'PIZZA-011', 'Train Pizza (28 Inch)', '', 3, 'Special Large Pizza', 3599, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 3599, 3599, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(200, 'MAIN-001', 'Mandi Al Arab', '', 7, 'Main Course', 700, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 700, 700, '[]', 0, 0, 1, 0, 0, 0, '', 1, NULL),
(201, 'MAIN-001-01', '1/2kg', '1/2kg', 7, 'Main Course', 700, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 200, '', 'Live', '', 700, 700, '{\"index_\":\"\"}', 0, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(202, 'MAIN-001-02', '1kg', '1kg', 7, 'Main Course', 1500, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 200, '', 'Live', '', 1500, 1500, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(203, 'MAIN-001-FULL', 'Full Chicken', 'Full', 7, 'Full Chicken', 2050, '[]', '', 1, 1, NULL, 'Veg No', 'Beverage No', 'Bar No', 200, '', 'Deleted', '', 2050, 2050, '{\"index_\":\"\"}', 0, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(204, 'MAIN-002', 'Shawai Chicken', '', 7, 'Main Course', 899, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 899, 899, '[]', 0, 0, 1, 0, 0, 0, '', 1, NULL),
(205, 'MAIN-002-01', 'Half', 'Half', 7, 'Main Course', 899, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 204, '', 'Live', '', 899, 899, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(206, 'MAIN-002-02', 'Full', 'Full', 7, 'Main Course', 1799, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 204, '', 'Live', '', 1799, 1799, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(207, 'MAIN-003', 'Chicken Chilli Dry', '', 7, '', 699, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 699, 699, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(208, 'MAIN-004', 'Beef Chilli Dry', '', 7, '', 850, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 850, 850, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(209, 'MAIN-005', 'Manchurian', '', 7, '', 699, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 699, 699, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(210, 'MAIN-006', 'Special Fried Rice', '', 7, '', 599, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 599, 599, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(211, 'MAIN-007', 'Chicken Fried Rice', '', 7, '', 499, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 499, 499, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(212, 'MAIN-008', 'Vegetable Fried Rice', '', 7, '', 399, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 399, 399, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(213, 'MAIN-009', 'Stuff Chicken With Rice', '', 7, '', 700, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 700, 700, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(214, 'MAIN-010', 'Thai Chicken Noodles', '', 7, '', 450, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 450, 450, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(215, 'MAIN-011', 'Chicken Chow Mein', '', 7, '', 499, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 499, 499, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(300, 'STEAK-001', 'Cheese Bite Special Steak', '', 8, 'Steak', 1400, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 1400, 1400, '[]', 0, 0, 1, 0, 0, 0, '', 1, NULL),
(301, 'STEAK-001-01', 'Chicken', 'Chicken', 8, 'Steak', 1400, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 300, '', 'Live', '', 1400, 1400, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(302, 'STEAK-001-02', 'Beef', 'Beef', 8, 'Steak', 1800, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 300, '', 'Live', '', 1800, 1800, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(303, 'STEAK-002', 'Mushroom Steak', '', 8, 'Steak', 1200, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 1200, 1200, '[]', 0, 0, 1, 0, 0, 0, '', 1, NULL),
(304, 'STEAK-002-01', 'Chicken', 'Chicken', 8, 'Steak', 1200, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 303, '', 'Live', '', 1200, 1200, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(305, 'STEAK-002-02', 'Beef', 'Beef', 8, 'Steak', 1600, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 303, '', 'Live', '', 1600, 1600, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(306, 'STEAK-003', 'Mexican Steak', '', 8, 'Steak', 1200, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 1200, 1200, '[]', 0, 0, 1, 0, 0, 0, '', 1, NULL),
(307, 'STEAK-003-01', 'Chicken', 'Chicken', 8, 'Steak', 1200, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 306, '', 'Live', '', 1200, 1200, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(308, 'STEAK-003-02', 'Beef', 'Beef', 8, 'Steak', 1600, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 306, '', 'Live', '', 1600, 1600, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(400, 'PASTA-001', 'Fettuccine Alfredo Pasta', '', 9, '', 750, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 750, 750, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(401, 'PASTA-002', 'Mushroom Pasta', '', 9, '', 700, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 700, 700, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(402, 'PASTA-003', 'Penne Pasta', '', 9, '', 700, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 700, 700, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(500, 'CHINESE-001', 'Soup', '', 10, '', 1299, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 1299, 1299, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(501, 'CHINESE-002', 'Chowmein', '', 10, '', 0, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 0, 0, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(502, 'CHINESE-003', 'Manchurian', '', 10, '', 0, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 0, 0, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(503, 'CHINESE-004', 'Chicken Chilli Dry', '', 10, '', 0, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 0, 0, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(504, 'CHINESE-005', 'Vegetable Fried Rice', '', 10, '', 0, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 0, 0, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(600, 'DESSERT-001', 'Cheese Bite Kunafa Cheese', '', 11, '', 599, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 599, 599, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(601, 'DESSERT-002', 'Sizzling Brownie', '', 11, '', 499, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 499, 499, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(700, 'HOT-001', 'Cappuccino', '', 12, '', 399, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 399, 399, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(701, 'HOT-002', 'Latte', '', 12, '', 350, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 350, 350, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(702, 'HOT-003', 'Hot Coffee', '', 12, '', 299, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 299, 299, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(703, 'HOT-004', 'Special Karak Tea', '', 12, '', 120, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 120, 120, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(704, 'HOT-005', 'Pink Tea', '', 12, '', 250, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 250, 250, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(705, 'HOT-006', 'Green Tea', '', 12, '', 70, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 70, 70, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(800, 'COLD-001', 'Mint Margarita', '', 13, '', 299, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 299, 299, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(801, 'COLD-002', 'Blue Mojito', '', 13, '', 250, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 250, 250, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(802, 'COLD-003', 'Strawberry Mojito', '', 13, '', 250, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 250, 250, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(803, 'COLD-004', 'Ice Lemonade', '', 13, '', 199, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 199, 199, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(804, 'COLD-005', 'Fresh Lime', '', 13, '', 180, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 180, 180, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(805, 'COLD-006', 'Oreo Shake', '', 13, '', 350, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 350, 350, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(806, 'COLD-007', 'Oreo Banana Shake', '', 13, '', 399, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 399, 399, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(807, 'COLD-008', 'Seasonal Shake', '', 13, '', 350, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 350, 350, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(808, 'COLD-009', 'Peni Colada', '', 13, '', 450, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 450, 450, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(809, 'COLD-010', 'Blue Colada', '', 13, '', 450, '[]', '', 1, 1, NULL, 'Veg Yes', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 450, 450, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(900, 'SOFT-001', 'Soft Drinks', '', 14, 'Soft Drinks', 0, '[]', '', 1, 1, NULL, 'Veg Yes', 'Beverage Yes', 'Bar No', 0, NULL, 'Deleted', NULL, 0, 0, '[]', 0, 0, 1, 0, 0, 0, '', 1, NULL),
(901, 'SOFT-001-1.5L', '1.5Lt Sting 500ml', '1.5Lt', 14, '1.5 Liter', 0, '[]', '', 1, 1, NULL, 'Veg Yes', 'Beverage Yes', 'Bar No', 900, '', 'Deleted', '', 0, 0, '{\"index_\":\"\"}', 0, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(902, 'SOFT-001-1L', '1-Ltr Regular', '1L', 14, '1 Liter', 0, '[]', '', 1, 1, NULL, 'Veg Yes', 'Beverage Yes', 'Bar No', 900, '', 'Deleted', '', 0, 0, '{\"index_\":\"\"}', 0, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(903, 'SOFT-001-CAN', 'Can Mineral Water Large/Small', 'Can', 14, 'Can', 0, '[]', '', 1, 1, NULL, 'Veg Yes', 'Beverage Yes', 'Bar No', 900, '', 'Deleted', '', 0, 0, '{\"index_\":\"\"}', 0, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(904, 'MAIN-001-03', 'Full Chicken', 'Full', 7, 'Main Course', 2900, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 200, '', 'Live', '', 2900, 2900, '{\"index_\":\"\"}', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL),
(905, '155', 'Value Pizza Deal-1 3 X  1Ltr D small pizza', '', 16, '', 1600, '[]', '', 1, 1, NULL, 'Veg No', 'Beverage No', 'Bar No', 0, NULL, 'Live', NULL, 1600, 1600, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(906, '156', 'Value Pizza Deal-2 3xM Pizza 1LD', '', 16, '', 2999, '[]', '', 1, 1, NULL, 'Veg No', 'Beverage No', 'Bar No', 0, NULL, 'Live', NULL, 2999, 2999, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(907, '157', 'Value Pizza Deal- 3 3xLarge Pizza 1.5LD', '', 16, '', 3999, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 3999, 3999, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(908, '158', 'Value Pizza Deal-4 3xX L Pizza 1LD', '', 16, '', 5200, '[]', '', 1, 1, NULL, 'Veg No', 'Beverage No', 'Bar No', 0, NULL, 'Live', NULL, 5200, 5200, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(909, '159', 'Combo Deals', '', 15, '1x Small Pizza 1x Zinger Burger 4x Hot Wings 4x Hot Shots 500ml Drink', 1299, '[]', '', 1, 1, NULL, 'Veg No', 'Bev No', 'Bar No', 0, NULL, 'Live', NULL, 1299, 1299, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(910, '160', '1-Person Deal ', '', 17, '1-Person Deal 1x Zinger Burger 1x Regular Fries 1x Fried Chicken 1x Reg Drink', 799, '[]', '', 1, 1, NULL, 'Veg No', 'Beverage No', 'Bar No', 0, NULL, 'Live', NULL, 799, 799, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(911, '161', '2-Person Deal ', '', 17, '2-Person Deal - 2x Zing Burger 2x Fried Chicken 1x Regular Fries 2x Regular Drinks', 1400, '[]', '', 1, 1, NULL, 'Veg No', 'Beverage No', 'Bar No', 0, NULL, 'Live', NULL, 1400, 1400, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(912, '162', '4-Person Deal ', '', 17, '4-Person Deal Medium-Pizza 2xZing Burger 4x Fried Chicken 1x Nachos 1x Regular Fries 1.5 ', 3500, '[]', '', 1, 1, NULL, 'Veg No', 'Beverage No', 'Bar No', 0, NULL, 'Live', NULL, 3500, 3500, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL),
(913, '163', 'Family Deal', '', 17, 'Family Deal 1x Large-Pizza 2x Zing Burger 2x Grill Chicken Cheese Burger 6x Hot Shot 4x Fried Chicken 1x Nachos 1x Loaded Fried 1.5 Ltr', 4999, '[]', '', 1, 1, NULL, 'Veg No', 'Beverage No', 'Bar No', 0, NULL, 'Live', NULL, 4999, 4999, '[]', 0, 0, 1, 0, 0, 0, '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_food_menus_ingredients`
--

CREATE TABLE `tbl_food_menus_ingredients` (
  `id` bigint NOT NULL,
  `ingredient_id` int DEFAULT NULL,
  `consumption` float(10,2) DEFAULT NULL,
  `food_menu_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live',
  `cost` float DEFAULT NULL,
  `total` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_food_menus_modifiers`
--

CREATE TABLE `tbl_food_menus_modifiers` (
  `id` bigint NOT NULL,
  `modifier_id` int DEFAULT NULL,
  `food_menu_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_food_menus_modifiers`
--

INSERT INTO `tbl_food_menus_modifiers` (`id`, `modifier_id`, `food_menu_id`, `user_id`, `outlet_id`, `company_id`, `del_status`) VALUES
(1, 1, 150, 1, NULL, 1, 'Live'),
(2, 3, 150, 1, NULL, 1, 'Live'),
(3, 4, 150, 1, NULL, 1, 'Live'),
(4, 5, 150, 1, NULL, 1, 'Live'),
(5, 1, 145, 1, NULL, 1, 'Live'),
(6, 3, 145, 1, NULL, 1, 'Live'),
(7, 4, 145, 1, NULL, 1, 'Live'),
(8, 5, 145, 1, NULL, 1, 'Live'),
(9, 1, 140, 1, NULL, 1, 'Live'),
(10, 3, 140, 1, NULL, 1, 'Live'),
(11, 4, 140, 1, NULL, 1, 'Live'),
(12, 5, 140, 1, NULL, 1, 'Live'),
(13, 1, 135, 1, NULL, 1, 'Live'),
(14, 3, 135, 1, NULL, 1, 'Live'),
(15, 4, 135, 1, NULL, 1, 'Live'),
(16, 5, 135, 1, NULL, 1, 'Live'),
(17, 1, 130, 1, NULL, 1, 'Live'),
(18, 3, 130, 1, NULL, 1, 'Live'),
(19, 4, 130, 1, NULL, 1, 'Live'),
(20, 5, 130, 1, NULL, 1, 'Live'),
(21, 1, 125, 1, NULL, 1, 'Live'),
(22, 3, 125, 1, NULL, 1, 'Live'),
(23, 4, 125, 1, NULL, 1, 'Live'),
(24, 5, 125, 1, NULL, 1, 'Live'),
(25, 1, 120, 1, NULL, 1, 'Live'),
(26, 3, 120, 1, NULL, 1, 'Live'),
(27, 4, 120, 1, NULL, 1, 'Live'),
(28, 5, 120, 1, NULL, 1, 'Live'),
(29, 1, 115, 1, NULL, 1, 'Live'),
(30, 3, 115, 1, NULL, 1, 'Live'),
(31, 4, 115, 1, NULL, 1, 'Live'),
(32, 5, 115, 1, NULL, 1, 'Live'),
(33, 1, 110, 1, NULL, 1, 'Live'),
(34, 3, 110, 1, NULL, 1, 'Live'),
(35, 4, 110, 1, NULL, 1, 'Live'),
(36, 5, 110, 1, NULL, 1, 'Live'),
(37, 1, 105, 1, NULL, 1, 'Live'),
(38, 3, 105, 1, NULL, 1, 'Live'),
(39, 4, 105, 1, NULL, 1, 'Live'),
(40, 5, 105, 1, NULL, 1, 'Live'),
(41, 1, 100, 1, NULL, 1, 'Live'),
(42, 3, 100, 1, NULL, 1, 'Live'),
(43, 4, 100, 1, NULL, 1, 'Live'),
(44, 5, 100, 1, NULL, 1, 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_food_menu_categories`
--

CREATE TABLE `tbl_food_menu_categories` (
  `id` int NOT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `company_id` int UNSIGNED DEFAULT NULL,
  `order_by` int DEFAULT '0',
  `category_image` varchar(255) DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_food_menu_categories`
--

INSERT INTO `tbl_food_menu_categories` (`id`, `category_name`, `description`, `user_id`, `company_id`, `order_by`, `category_image`, `del_status`) VALUES
(1, 'APPETIZER', 'Appetizer Items', 1, 1, 0, NULL, 'Live'),
(2, 'SOUPS', 'Soup Items', 1, 1, 0, NULL, 'Live'),
(3, 'PIZZA', 'Pizza Items', 1, 1, 0, NULL, 'Live'),
(4, 'TWISTER', 'Twister Items', 1, 1, 0, NULL, 'Live'),
(5, 'INJECTED BROAST', 'Broast Items', 1, 1, 0, NULL, 'Live'),
(6, 'BURGER & SANDWICHES', 'Burgers and Sandwiches', 1, 1, 0, NULL, 'Live'),
(7, 'MAIN COURSE', 'Main Course Items', 1, 1, 0, NULL, 'Live'),
(8, 'STEAK', 'Steak Items', 1, 1, 0, NULL, 'Live'),
(9, 'PASTA', 'Pasta Items', 1, 1, 0, NULL, 'Live'),
(10, 'CHINESE PLATTER', 'Chinese Items', 1, 1, 0, NULL, 'Live'),
(11, 'DESSERT', 'Dessert Items', 1, 1, 0, NULL, 'Live'),
(12, 'HOT BEVERAGES', 'Hot Drinks', 1, 1, 0, NULL, 'Live'),
(13, 'COLD BEVERAGES', 'Cold Drinks', 1, 1, 0, NULL, 'Live'),
(14, 'SOFT DRINKS', 'Soft Drinks', 1, 1, 0, NULL, 'Live'),
(15, 'Combo', '', 1, 1, 0, '', 'Live'),
(16, 'Pizza Deals', '', 1, 1, 0, '', 'Live'),
(17, 'Deals', '', 1, 1, 0, '', 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_food_menu_ratings`
--

CREATE TABLE `tbl_food_menu_ratings` (
  `id` int NOT NULL,
  `food_menu_id` int NOT NULL,
  `rating` int NOT NULL,
  `user_id` int NOT NULL,
  `company_id` int NOT NULL,
  `del_status` varchar(50) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_galleries`
--

CREATE TABLE `tbl_galleries` (
  `id` int NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_holds`
--

CREATE TABLE `tbl_holds` (
  `id` int NOT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `sale_no` varchar(500) NOT NULL DEFAULT '000000',
  `total_items` int DEFAULT NULL,
  `sub_total` float DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `due_amount` float DEFAULT NULL,
  `disc` varchar(50) DEFAULT NULL,
  `disc_actual` float DEFAULT NULL,
  `vat` float DEFAULT NULL,
  `total_payable` float DEFAULT NULL,
  `payment_method_id` int DEFAULT NULL,
  `close_time` time NOT NULL,
  `table_id` int DEFAULT NULL,
  `total_item_discount_amount` float NOT NULL,
  `sub_total_with_discount` float NOT NULL,
  `sub_total_discount_amount` float NOT NULL,
  `total_discount_amount` float NOT NULL,
  `charge_type` varchar(30) DEFAULT NULL,
  `delivery_charge` varchar(100) DEFAULT NULL,
  `tips_amount` varchar(100) DEFAULT NULL,
  `tips_amount_actual_charge` float DEFAULT NULL,
  `delivery_charge_actual_charge` float DEFAULT NULL,
  `sub_total_discount_value` varchar(10) NOT NULL,
  `sub_total_discount_type` varchar(20) NOT NULL,
  `sale_date` varchar(20) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_time` time NOT NULL,
  `cooking_start_time` varchar(30) DEFAULT '',
  `cooking_done_time` varchar(30) DEFAULT '',
  `modified` enum('Yes','No') NOT NULL DEFAULT 'No',
  `user_id` int DEFAULT NULL,
  `waiter_id` int NOT NULL DEFAULT '0',
  `outlet_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `order_status` tinyint(1) NOT NULL COMMENT '1=new order, 2=invoiced order, 3=closed order',
  `order_type` tinyint(1) NOT NULL COMMENT '1=dine in, 2 = take away, 3 = delivery',
  `del_status` varchar(50) DEFAULT 'Live',
  `is_merge` int NOT NULL DEFAULT '0',
  `counter_id` int NOT NULL DEFAULT '0',
  `is_accept` int NOT NULL DEFAULT '1',
  `given_amount` float DEFAULT NULL,
  `change_amount` float DEFAULT NULL,
  `sale_vat_objects` text,
  `future_sale_status` int NOT NULL DEFAULT '1',
  `random_code` varchar(50) DEFAULT NULL,
  `is_kitchen_bell` int DEFAULT '1',
  `del_address` varchar(250) DEFAULT NULL,
  `delivery_partner_id` int DEFAULT NULL,
  `rounding_amount_hidden` float DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'Pending',
  `previous_due_tmp` float DEFAULT NULL,
  `used_loyalty_point` int DEFAULT NULL,
  `split_sale_id` int DEFAULT NULL,
  `orders_table_text` varchar(250) DEFAULT NULL,
  `self_order_content` text,
  `is_self_order` varchar(20) NOT NULL DEFAULT 'No',
  `is_online_order` varchar(10) DEFAULT 'No',
  `self_order_ran_code` varchar(50) DEFAULT NULL,
  `self_order_status` varchar(20) NOT NULL DEFAULT 'Pending',
  `token_number` varchar(50) DEFAULT NULL,
  `is_pickup_sale` int NOT NULL DEFAULT '0',
  `order_receiving_id` int NOT NULL DEFAULT '0',
  `pull_update` int NOT NULL DEFAULT '1',
  `is_delete_sender` int NOT NULL DEFAULT '0',
  `is_delete_receiver` int NOT NULL DEFAULT '0',
  `is_update_sender` int NOT NULL DEFAULT '0',
  `is_update_receiver` int NOT NULL DEFAULT '0',
  `online_self_order_receiving_id` int NOT NULL DEFAULT '0',
  `is_update_receiver_admin` int NOT NULL DEFAULT '0',
  `is_delete_receiver_admin` int NOT NULL DEFAULT '0',
  `order_receiving_id_admin` int NOT NULL DEFAULT '0',
  `pull_update_admin` int NOT NULL DEFAULT '1',
  `pull_update_cashier` int NOT NULL DEFAULT '1',
  `combo_items` text,
  `online_payment_details` text,
  `online_order_receiving_id` int NOT NULL DEFAULT '0',
  `is_invoice` int NOT NULL DEFAULT '0',
  `is_kitchen` int NOT NULL DEFAULT '1',
  `zatca_value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_holds_details`
--

CREATE TABLE `tbl_holds_details` (
  `id` bigint NOT NULL,
  `food_menu_id` int DEFAULT NULL,
  `menu_name` varchar(50) DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `tmp_qty` int DEFAULT NULL,
  `menu_price_without_discount` float NOT NULL,
  `menu_price_with_discount` float NOT NULL,
  `menu_unit_price` float NOT NULL,
  `menu_vat_percentage` float NOT NULL,
  `menu_taxes` text,
  `menu_discount_value` varchar(20) DEFAULT NULL,
  `discount_type` varchar(20) NOT NULL,
  `menu_note` varchar(150) DEFAULT NULL,
  `menu_combo_items` text,
  `discount_amount` double DEFAULT NULL,
  `item_type` varchar(50) DEFAULT NULL,
  `cooking_status` varchar(30) DEFAULT NULL,
  `cooking_start_time` varchar(30) DEFAULT '',
  `cooking_done_time` varchar(30) DEFAULT '',
  `previous_id` bigint NOT NULL,
  `loyalty_point_earn` float DEFAULT '0',
  `sales_id` int DEFAULT NULL,
  `order_status` tinyint(1) NOT NULL COMMENT '1=new order,2=invoiced order, 3=closed order',
  `user_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `is_free_item` int NOT NULL DEFAULT '0',
  `is_print` int NOT NULL DEFAULT '1',
  `del_status` varchar(50) DEFAULT 'Live',
  `is_merge` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_holds_details_modifiers`
--

CREATE TABLE `tbl_holds_details_modifiers` (
  `id` bigint NOT NULL,
  `modifier_id` int NOT NULL,
  `modifier_price` float NOT NULL,
  `food_menu_id` int NOT NULL,
  `sales_id` int NOT NULL,
  `order_status` tinyint(1) NOT NULL COMMENT '1=new order,2=invoiced order, 3=closed order',
  `sales_details_id` int NOT NULL,
  `menu_vat_percentage` float DEFAULT NULL,
  `menu_taxes` text,
  `user_id` int NOT NULL,
  `outlet_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `is_print` int NOT NULL DEFAULT '1',
  `is_merge` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_holds_table`
--

CREATE TABLE `tbl_holds_table` (
  `id` bigint NOT NULL,
  `persons` int NOT NULL,
  `booking_time` varchar(50) NOT NULL,
  `hold_id` int NOT NULL,
  `hold_no` varchar(20) NOT NULL,
  `outlet_id` int NOT NULL,
  `table_id` int NOT NULL,
  `del_status` varchar(20) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ingredients`
--

CREATE TABLE `tbl_ingredients` (
  `id` int NOT NULL,
  `code` varchar(50) NOT NULL DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `purchase_price` float DEFAULT NULL,
  `alert_quantity` float DEFAULT NULL,
  `unit_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live',
  `purchase_unit_id` float DEFAULT NULL,
  `conversion_rate` float DEFAULT NULL,
  `consumption_unit_cost` float DEFAULT NULL,
  `average_consumption_per_unit` float NOT NULL DEFAULT '0',
  `is_direct_food` int NOT NULL DEFAULT '1',
  `food_id` int DEFAULT NULL,
  `ing_type` varchar(30) NOT NULL DEFAULT 'Plain Ingredient',
  `unit_type` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_ingredients`
--

INSERT INTO `tbl_ingredients` (`id`, `code`, `name`, `category_id`, `purchase_price`, `alert_quantity`, `unit_id`, `user_id`, `company_id`, `del_status`, `purchase_unit_id`, `conversion_rate`, `consumption_unit_cost`, `average_consumption_per_unit`, `is_direct_food`, `food_id`, `ing_type`, `unit_type`) VALUES
(1, '001', 'Flour ', 1, 4, 20, 1, 1, 1, 'Live', 1, 5, 0.8, 0.8, 1, NULL, 'Plain Ingredient', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ingredient_categories`
--

CREATE TABLE `tbl_ingredient_categories` (
  `id` int NOT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_ingredient_categories`
--

INSERT INTO `tbl_ingredient_categories` (`id`, `category_name`, `description`, `user_id`, `company_id`, `del_status`) VALUES
(1, 'Flour ', '', 1, 1, 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_inventory_adjustment`
--

CREATE TABLE `tbl_inventory_adjustment` (
  `id` int NOT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `date` date NOT NULL,
  `note` varchar(200) DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_inventory_adjustment_ingredients`
--

CREATE TABLE `tbl_inventory_adjustment_ingredients` (
  `id` int NOT NULL,
  `ingredient_id` int DEFAULT NULL,
  `consumption_amount` float DEFAULT NULL,
  `inventory_adjustment_id` int DEFAULT NULL,
  `consumption_status` enum('Plus','Minus','') DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kitchens`
--

CREATE TABLE `tbl_kitchens` (
  `id` int NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `printer_id` int DEFAULT NULL,
  `print_server_url` varchar(250) DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(20) NOT NULL DEFAULT 'Live',
  `outlet_id` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_kitchens`
--

INSERT INTO `tbl_kitchens` (`id`, `name`, `printer_id`, `print_server_url`, `company_id`, `del_status`, `outlet_id`) VALUES
(1, 'KOT !', 1, NULL, 1, 'Live', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kitchen_categories`
--

CREATE TABLE `tbl_kitchen_categories` (
  `id` int NOT NULL,
  `kitchen_id` int DEFAULT NULL,
  `cat_id` int DEFAULT NULL,
  `via_printer` int DEFAULT NULL,
  `del_status` varchar(20) NOT NULL DEFAULT 'Live',
  `outlet_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_kitchen_categories`
--

INSERT INTO `tbl_kitchen_categories` (`id`, `kitchen_id`, `cat_id`, `via_printer`, `del_status`, `outlet_id`) VALUES
(1, 1, 1, NULL, 'Live', 1),
(2, 1, 2, NULL, 'Live', 1),
(3, 1, 3, NULL, 'Live', 1),
(4, 1, 4, NULL, 'Live', 1),
(5, 1, 5, NULL, 'Live', 1),
(6, 1, 6, NULL, 'Live', 1),
(7, 1, 7, NULL, 'Live', 1),
(8, 1, 8, NULL, 'Live', 1),
(9, 1, 9, NULL, 'Live', 1),
(10, 1, 10, NULL, 'Live', 1),
(11, 1, 11, NULL, 'Live', 1),
(12, 1, 12, NULL, 'Live', 1),
(13, 1, 13, NULL, 'Live', 1),
(14, 1, 14, NULL, 'Live', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kitchen_sales`
--

CREATE TABLE `tbl_kitchen_sales` (
  `id` int NOT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `sale_no` varchar(500) NOT NULL DEFAULT '000000',
  `total_items` int DEFAULT NULL,
  `sub_total` float DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `due_amount` float DEFAULT NULL,
  `disc` varchar(50) DEFAULT NULL,
  `disc_actual` float DEFAULT NULL,
  `vat` float DEFAULT NULL,
  `total_payable` float DEFAULT NULL,
  `payment_method_id` int DEFAULT NULL,
  `close_time` time NOT NULL,
  `table_id` int DEFAULT NULL,
  `total_item_discount_amount` float NOT NULL,
  `sub_total_with_discount` float NOT NULL,
  `sub_total_discount_amount` float NOT NULL,
  `total_discount_amount` float NOT NULL,
  `charge_type` varchar(30) DEFAULT NULL,
  `delivery_charge` varchar(100) DEFAULT NULL,
  `tips_amount` varchar(100) DEFAULT NULL,
  `tips_amount_actual_charge` float DEFAULT NULL,
  `delivery_charge_actual_charge` float DEFAULT NULL,
  `sub_total_discount_value` varchar(10) NOT NULL,
  `sub_total_discount_type` varchar(20) NOT NULL,
  `sale_date` varchar(20) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_time` time NOT NULL,
  `cooking_start_time` varchar(30) DEFAULT '',
  `cooking_done_time` varchar(30) DEFAULT '',
  `modified` enum('Yes','No') NOT NULL DEFAULT 'No',
  `user_id` int DEFAULT NULL,
  `waiter_id` int NOT NULL DEFAULT '0',
  `outlet_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `order_status` tinyint(1) NOT NULL COMMENT '1=new order, 2=invoiced order, 3=closed order',
  `order_type` tinyint(1) NOT NULL COMMENT '1=dine in, 2 = take away, 3 = delivery',
  `del_status` varchar(50) DEFAULT 'Live',
  `is_merge` int NOT NULL DEFAULT '0',
  `counter_id` int NOT NULL DEFAULT '0',
  `is_accept` int NOT NULL DEFAULT '1',
  `given_amount` float DEFAULT NULL,
  `change_amount` float DEFAULT NULL,
  `sale_vat_objects` text,
  `future_sale_status` int NOT NULL DEFAULT '1',
  `random_code` varchar(50) DEFAULT NULL,
  `is_kitchen_bell` int DEFAULT '1',
  `del_address` varchar(250) DEFAULT NULL,
  `delivery_partner_id` int DEFAULT NULL,
  `rounding_amount_hidden` float DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'Pending',
  `previous_due_tmp` float DEFAULT NULL,
  `used_loyalty_point` int DEFAULT NULL,
  `split_sale_id` int DEFAULT NULL,
  `orders_table_text` varchar(250) DEFAULT NULL,
  `self_order_content` text,
  `is_self_order` varchar(20) NOT NULL DEFAULT 'No',
  `is_online_order` varchar(10) DEFAULT 'No',
  `self_order_ran_code` varchar(50) DEFAULT NULL,
  `self_order_status` varchar(20) NOT NULL DEFAULT 'Pending',
  `token_number` varchar(50) DEFAULT NULL,
  `is_pickup_sale` int NOT NULL DEFAULT '0',
  `order_receiving_id` int NOT NULL DEFAULT '0',
  `pull_update` int NOT NULL DEFAULT '1',
  `is_delete_sender` int NOT NULL DEFAULT '0',
  `is_delete_receiver` int NOT NULL DEFAULT '0',
  `is_update_sender` int NOT NULL DEFAULT '0',
  `is_update_receiver` int NOT NULL DEFAULT '0',
  `online_self_order_receiving_id` int NOT NULL DEFAULT '0',
  `is_update_receiver_admin` int NOT NULL DEFAULT '0',
  `is_delete_receiver_admin` int NOT NULL DEFAULT '0',
  `order_receiving_id_admin` int NOT NULL DEFAULT '0',
  `pull_update_admin` int NOT NULL DEFAULT '1',
  `pull_update_cashier` int NOT NULL DEFAULT '1',
  `combo_items` text,
  `online_payment_details` text,
  `online_order_receiving_id` int NOT NULL DEFAULT '0',
  `is_invoice` int NOT NULL DEFAULT '0',
  `is_kitchen` int NOT NULL DEFAULT '1',
  `zatca_value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_kitchen_sales`
--

INSERT INTO `tbl_kitchen_sales` (`id`, `customer_id`, `sale_no`, `total_items`, `sub_total`, `paid_amount`, `due_amount`, `disc`, `disc_actual`, `vat`, `total_payable`, `payment_method_id`, `close_time`, `table_id`, `total_item_discount_amount`, `sub_total_with_discount`, `sub_total_discount_amount`, `total_discount_amount`, `charge_type`, `delivery_charge`, `tips_amount`, `tips_amount_actual_charge`, `delivery_charge_actual_charge`, `sub_total_discount_value`, `sub_total_discount_type`, `sale_date`, `date_time`, `order_time`, `cooking_start_time`, `cooking_done_time`, `modified`, `user_id`, `waiter_id`, `outlet_id`, `company_id`, `order_status`, `order_type`, `del_status`, `is_merge`, `counter_id`, `is_accept`, `given_amount`, `change_amount`, `sale_vat_objects`, `future_sale_status`, `random_code`, `is_kitchen_bell`, `del_address`, `delivery_partner_id`, `rounding_amount_hidden`, `status`, `previous_due_tmp`, `used_loyalty_point`, `split_sale_id`, `orders_table_text`, `self_order_content`, `is_self_order`, `is_online_order`, `self_order_ran_code`, `self_order_status`, `token_number`, `is_pickup_sale`, `order_receiving_id`, `pull_update`, `is_delete_sender`, `is_delete_receiver`, `is_update_sender`, `is_update_receiver`, `online_self_order_receiving_id`, `is_update_receiver_admin`, `is_delete_receiver_admin`, `order_receiving_id_admin`, `pull_update_admin`, `pull_update_cashier`, `combo_items`, `online_payment_details`, `online_order_receiving_id`, `is_invoice`, `is_kitchen`, `zatca_value`) VALUES
(7, '1', 'aCQ260203-007', 4, 1849, NULL, NULL, NULL, NULL, 0, 1849, NULL, '00:00:00', 0, 0, 1849, 0, 0, 'service', '', '0.00', 0, 0, '0.00', 'fixed', '2026-02-03', '2026-02-03 07:18:47', '10:18:47', '', '', 'Yes', 1, 3, 1, 1, 1, 1, 'Live', 0, 1, 1, NULL, NULL, '[]', 1, 'pRDvsSRVfraLn27', 2, '', 0, 0, 'Pending', 0, NULL, NULL, '', '{\"sale_no\":\"aCQ260203-007\",\"is_merge\":\"\",\"is_online_order\":\"\",\"edit_sale_id\":\"0\",\"waiter_app_status\":\"No\",\"hidden_given_amount\":\"\",\"hidden_change_amount\":\"\",\"counter_id\":\"1\",\"counter_name\":\"01\",\"random_code\":\"pRDvsSRVfraLn27\",\"token_number\":\"\",\"customer_id\":\"1\",\"customer_address\":\"\",\"customer_gst_number\":\"\",\"status\":\"Pending\",\"user_name\":\"Admin User\",\"user_id\":\"1\",\"zatca_invoice_value\":\"AQtDaGV6enkgQml0ZQIIMzIxMzI1ODcDEzIwMjYtMDItMDNUMTI6MTg6NDUEBzE4NDkuMDAFBDAuMDA=\",\"customer_name\":\"Walk-in Customer \",\"delivery_partner_id\":\"\",\"self_order_table_id\":\"0\",\"self_order_table_person\":\"undefined\",\"rounding_amount_hidden\":\"0.00\",\"previous_due_tmp\":\"0\",\"waiter_id\":\"3\",\"waiter_name\":\"Ds Waiter\",\"open_invoice_date_hidden\":\"2026-02-03\",\"total_items_in_cart\":\"4\",\"total_items_in_cart_qty\":\"4\",\"sub_total\":\"1849.00\",\"sale_date\":\"2026-02-03\",\"date_time\":\"2026-02-03 10:18:47 AM\",\"order_time\":\"10:18:47 AM\",\"charge_type\":\"service\",\"total_vat\":\"0.00\",\"total_payable\":\"1849.00\",\"total_item_discount_amount\":\"0.00\",\"sub_total_with_discount\":\"1849.00\",\"sub_total_discount_amount\":\"0.00\",\"total_discount_amount\":\"0.00\",\"delivery_charge\":\"\",\"tips_amount\":\"0.00\",\"delivery_charge_actual_charge\":\"\",\"tips_amount_actual_charge\":\"0.00\",\"sub_total_discount_value\":\"0.00\",\"sub_total_discount_type\":\"fixed\",\"order_type\":\"1\",\"order_status\":\"1\",\"sale_vat_objects\":[],\"orders_table\":[{\"table_id\":\"\", \"persons\":\"undefined\"}],\"table_id\":\"\",\"orders_table_text\":\"\",\"items\":[{\"food_menu_id\":\"7\", \"is_print\":\"1\", \"is_kot_print\":\"1\", \"menu_name\":\"French Fries\", \"kitchen_id\":\"1\", \"kitchen_name\":\"KOT !\", \"is_free\":\"0\", \"rounding_amount_hidden\":\"0\", \"item_vat\":[],\"menu_discount_value\":\"\",\"discount_type\":\"fixed\",\"menu_price_without_discount\":\"299.00\",\"menu_unit_price\":\"299.00\",\"qty\":\"1\",\"tmp_qty\":\"undefined\",\"p_qty\":\"undefined\",\"item_previous_id\":\"\",\"item_cooking_done_time\":\"\",\"item_cooking_start_time\":\"\",\"item_cooking_status\":\"\",\"item_type\":\"\",\"menu_price_with_discount\":\"299.00\",\"item_discount_amount\":\"0.00\",\"modifiers_id\":\"\", \"modifiers_name\":\"\", \"modifiers_price\":\"\", \"modifier_vat\":\"\",\"item_note\":\"\", \"discount_reason\":\"\",\"menu_combo_items\":\"\"},{\"food_menu_id\":\"5\", \"is_print\":\"1\", \"is_kot_print\":\"undefined\", \"menu_name\":\"Cheese Fries\", \"kitchen_id\":\"1\", \"kitchen_name\":\"KOT !\", \"is_free\":\"0\", \"rounding_amount_hidden\":\"0\", \"item_vat\":[],\"menu_discount_value\":\"\",\"discount_type\":\"fixed\",\"menu_price_without_discount\":\"450.00\",\"menu_unit_price\":\"450.00\",\"qty\":\"1\",\"tmp_qty\":\"undefined\",\"p_qty\":\"1\",\"item_previous_id\":\"\",\"item_cooking_done_time\":\"\",\"item_cooking_start_time\":\"\",\"item_cooking_status\":\"\",\"item_type\":\"\",\"menu_price_with_discount\":\"450.00\",\"item_discount_amount\":\"0.00\",\"modifiers_id\":\"\", \"modifiers_name\":\"\", \"modifiers_price\":\"\", \"modifier_vat\":\"\",\"item_note\":\"\", \"discount_reason\":\"\",\"menu_combo_items\":\"\"},{\"food_menu_id\":\"9\", \"is_print\":\"1\", \"is_kot_print\":\"undefined\", \"menu_name\":\"Cheese Ball 4Pcs\", \"kitchen_id\":\"1\", \"kitchen_name\":\"KOT !\", \"is_free\":\"0\", \"rounding_amount_hidden\":\"0\", \"item_vat\":[],\"menu_discount_value\":\"\",\"discount_type\":\"fixed\",\"menu_price_without_discount\":\"650.00\",\"menu_unit_price\":\"650.00\",\"qty\":\"1\",\"tmp_qty\":\"undefined\",\"p_qty\":\"1\",\"item_previous_id\":\"\",\"item_cooking_done_time\":\"\",\"item_cooking_start_time\":\"\",\"item_cooking_status\":\"\",\"item_type\":\"\",\"menu_price_with_discount\":\"650.00\",\"item_discount_amount\":\"0.00\",\"modifiers_id\":\"\", \"modifiers_name\":\"\", \"modifiers_price\":\"\", \"modifier_vat\":\"\",\"item_note\":\"\", \"discount_reason\":\"\",\"menu_combo_items\":\"\"},{\"food_menu_id\":\"2\", \"is_print\":\"1\", \"is_kot_print\":\"undefined\", \"menu_name\":\"Arabic Fries Nuggets 6Pcs\", \"kitchen_id\":\"1\", \"kitchen_name\":\"KOT !\", \"is_free\":\"0\", \"rounding_amount_hidden\":\"0\", \"item_vat\":[],\"menu_discount_value\":\"\",\"discount_type\":\"fixed\",\"menu_price_without_discount\":\"450.00\",\"menu_unit_price\":\"450.00\",\"qty\":\"1\",\"tmp_qty\":\"undefined\",\"p_qty\":\"1\",\"item_previous_id\":\"\",\"item_cooking_done_time\":\"\",\"item_cooking_start_time\":\"\",\"item_cooking_status\":\"\",\"item_type\":\"\",\"menu_price_with_discount\":\"450.00\",\"item_discount_amount\":\"0.00\",\"modifiers_id\":\"\", \"modifiers_name\":\"\", \"modifiers_price\":\"\", \"modifier_vat\":\"\",\"item_note\":\"\", \"discount_reason\":\"\",\"menu_combo_items\":\"\"}]}', 'No', 'No', NULL, 'Pending', NULL, 1, 0, 1, 0, 0, 3, 1, 0, 1, 0, 0, 1, 1, NULL, NULL, 0, 0, 1, 'AQtDaGV6enkgQml0ZQIIMzIxMzI1ODcDEzIwMjYtMDItMDNUMTI6MTg6NDUEBzE4NDkuMDAFBDAuMDA='),
(8, '1', 'aCQ260203-008', 1, 370, NULL, NULL, NULL, NULL, 0, 370, NULL, '00:00:00', 1, 0, 370, 0, 0, 'service', '', '', 0, 0, '', 'fixed', '2026-02-03', '2026-02-03 07:18:16', '10:18:16', '2026-02-03 12:20:44', '2026-02-03 12:20:53', 'No', 1, 3, 1, 1, 1, 1, 'Live', 0, 1, 1, NULL, NULL, '[]', 1, 'QHd7ZZXjhZ3jOU6', 2, '', 0, 0, 'Pending', 0, NULL, NULL, 'Table 1', '{\"sale_no\":\"aCQ260203-008\",\"is_merge\":\"\",\"is_online_order\":\"\",\"edit_sale_id\":\"0\",\"waiter_app_status\":\"No\",\"hidden_given_amount\":\"\",\"hidden_change_amount\":\"\",\"counter_id\":\"1\",\"counter_name\":\"01\",\"random_code\":\"QHd7ZZXjhZ3jOU6\",\"token_number\":\"\",\"customer_id\":\"1\",\"customer_address\":\"\",\"customer_gst_number\":\"\",\"status\":\"Pending\",\"user_name\":\"Admin User\",\"user_id\":\"1\",\"zatca_invoice_value\":\"AQtDaGV6enkgQml0ZQIIMzIxMzI1ODcDEzIwMjYtMDItMDNUMTI6MTg6MTQEBjM3MC4wMAUEMC4wMA==\",\"customer_name\":\"Walk-in Customer \",\"delivery_partner_id\":\"\",\"self_order_table_id\":\"0\",\"self_order_table_person\":\"undefined\",\"rounding_amount_hidden\":\"0.00\",\"previous_due_tmp\":\"0\",\"waiter_id\":\"3\",\"waiter_name\":\"Ds Waiter\",\"open_invoice_date_hidden\":\"2026-02-03\",\"total_items_in_cart\":\"1\",\"total_items_in_cart_qty\":\"1\",\"sub_total\":\"370.00\",\"sale_date\":\"2026-02-03\",\"date_time\":\"2026-02-03 10:18:16 AM\",\"order_time\":\"10:18:16 AM\",\"charge_type\":\"service\",\"total_vat\":\"0.00\",\"total_payable\":\"370.00\",\"total_item_discount_amount\":\"0.00\",\"sub_total_with_discount\":\"370.00\",\"sub_total_discount_amount\":\"0.00\",\"total_discount_amount\":\"0.00\",\"delivery_charge\":\"\",\"tips_amount\":\"\",\"delivery_charge_actual_charge\":\"\",\"tips_amount_actual_charge\":\"0.00\",\"sub_total_discount_value\":\"\",\"sub_total_discount_type\":\"fixed\",\"order_type\":\"1\",\"order_status\":\"1\",\"sale_vat_objects\":[],\"orders_table\":[{\"table_id\":\"1\", \"persons\":\"4\"}],\"table_id\":\"1\",\"orders_table_text\":\"Table 1\",\"items\":[{\"food_menu_id\":\"11\", \"is_print\":\"1\", \"is_kot_print\":\"1\", \"menu_name\":\"B.B.Q Wings 6Pcs\", \"kitchen_id\":\"1\", \"kitchen_name\":\"KOT !\", \"is_free\":\"0\", \"rounding_amount_hidden\":\"0\", \"item_vat\":[],\"menu_discount_value\":\"\",\"discount_type\":\"fixed\",\"menu_price_without_discount\":\"370.00\",\"menu_unit_price\":\"370.00\",\"qty\":\"1\",\"tmp_qty\":\"undefined\",\"p_qty\":\"undefined\",\"item_previous_id\":\"\",\"item_cooking_done_time\":\"\",\"item_cooking_start_time\":\"\",\"item_cooking_status\":\"\",\"item_type\":\"\",\"menu_price_with_discount\":\"370.00\",\"item_discount_amount\":\"0.00\",\"modifiers_id\":\"\", \"modifiers_name\":\"\", \"modifiers_price\":\"\", \"modifier_vat\":\"\",\"item_note\":\"\", \"discount_reason\":\"\",\"menu_combo_items\":\"\"}]}', 'No', 'No', NULL, 'Pending', NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, NULL, NULL, 0, 0, 1, 'AQtDaGV6enkgQml0ZQIIMzIxMzI1ODcDEzIwMjYtMDItMDNUMTI6MTg6MTQEBjM3MC4wMAUEMC4wMA==');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kitchen_sales_details`
--

CREATE TABLE `tbl_kitchen_sales_details` (
  `id` bigint NOT NULL,
  `food_menu_id` int DEFAULT NULL,
  `menu_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `tmp_qty` int DEFAULT NULL,
  `menu_price_without_discount` float NOT NULL,
  `menu_price_with_discount` float NOT NULL,
  `menu_unit_price` float NOT NULL,
  `menu_vat_percentage` float NOT NULL,
  `menu_taxes` text,
  `menu_discount_value` varchar(20) DEFAULT NULL,
  `discount_type` varchar(20) NOT NULL,
  `menu_note` varchar(150) DEFAULT NULL,
  `menu_combo_items` text,
  `discount_amount` double DEFAULT NULL,
  `item_type` varchar(50) DEFAULT NULL,
  `cooking_status` varchar(30) DEFAULT NULL,
  `cooking_start_time` varchar(30) DEFAULT '',
  `cooking_done_time` varchar(30) DEFAULT '',
  `previous_id` bigint NOT NULL,
  `loyalty_point_earn` float DEFAULT '0',
  `sales_id` int DEFAULT NULL,
  `order_status` tinyint(1) NOT NULL COMMENT '1=new order,2=invoiced order, 3=closed order',
  `user_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `is_free_item` int NOT NULL DEFAULT '0',
  `is_print` int NOT NULL DEFAULT '1',
  `del_status` varchar(50) DEFAULT 'Live',
  `discount_reason` varchar(250) DEFAULT NULL,
  `is_merge` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_kitchen_sales_details`
--

INSERT INTO `tbl_kitchen_sales_details` (`id`, `food_menu_id`, `menu_name`, `qty`, `tmp_qty`, `menu_price_without_discount`, `menu_price_with_discount`, `menu_unit_price`, `menu_vat_percentage`, `menu_taxes`, `menu_discount_value`, `discount_type`, `menu_note`, `menu_combo_items`, `discount_amount`, `item_type`, `cooking_status`, `cooking_start_time`, `cooking_done_time`, `previous_id`, `loyalty_point_earn`, `sales_id`, `order_status`, `user_id`, `outlet_id`, `is_free_item`, `is_print`, `del_status`, `discount_reason`, `is_merge`) VALUES
(9, 5, 'Cheese Fries', 1, 0, 450, 450, 450, 0, '[]', '', 'fixed', '', '', 0, 'Kitchen Item', 'New', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9, 0, 7, 0, 1, 1, 0, 2, 'Live', '', 0),
(10, 9, 'Cheese Ball 4Pcs', 1, 0, 650, 650, 650, 0, '[]', '', 'fixed', '', '', 0, 'Kitchen Item', 'New', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 10, 0, 7, 0, 1, 1, 0, 2, 'Live', '', 0),
(11, 2, 'Arabic Fries Nuggets 6Pcs', 1, 0, 450, 450, 450, 0, '[]', '', 'fixed', '', '', 0, 'Kitchen Item', 'New', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 11, 0, 7, 0, 1, 1, 0, 2, 'Live', '', 0),
(12, 11, 'B.B.Q Wings 6Pcs', 1, 1, 370, 370, 370, 0, '[]', '', 'fixed', '', '', 0, 'Kitchen Item', 'Done', '2026-02-03 12:20:44', '2026-02-03 12:20:53', 12, 0, 8, 0, 1, 1, 0, 2, 'Live', '', 0),
(13, 7, 'French Fries', 1, 1, 299, 299, 299, 0, '[]', '', 'fixed', '', '', 0, 'Kitchen Item', 'New', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 13, 0, 7, 0, 1, 1, 0, 1, 'Live', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kitchen_sales_details_modifiers`
--

CREATE TABLE `tbl_kitchen_sales_details_modifiers` (
  `id` bigint NOT NULL,
  `modifier_id` int NOT NULL,
  `modifier_price` float NOT NULL,
  `food_menu_id` int NOT NULL,
  `sales_id` int NOT NULL,
  `order_status` tinyint(1) NOT NULL COMMENT '1=new order,2=invoiced order, 3=closed order',
  `sales_details_id` int NOT NULL,
  `menu_vat_percentage` float DEFAULT NULL,
  `menu_taxes` text,
  `user_id` int NOT NULL,
  `outlet_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `is_print` int NOT NULL DEFAULT '1',
  `is_merge` int NOT NULL DEFAULT '0',
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_main_modules`
--

CREATE TABLE `tbl_main_modules` (
  `id` int NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `del_status` varchar(15) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_main_modules`
--

INSERT INTO `tbl_main_modules` (`id`, `name`, `del_status`) VALUES
(1, 'common_menu', 'Live'),
(2, 'Saas', 'Live'),
(3, 'Settings', 'Live'),
(4, 'Panel', 'Live'),
(5, 'purchase', 'Live'),
(6, 'sale', 'Live'),
(7, 'expense', 'Live'),
(8, 'report', 'Live'),
(9, 'master', 'Live'),
(10, 'account_user', 'Live'),
(11, 'allsettingpermission', 'Live'),
(12, 'online_order_st', 'Live'),
(13, 'sos_Self_Order', 'Live'),
(14, 'reservationSetting', 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_modifiers`
--

CREATE TABLE `tbl_modifiers` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `tax_information` text,
  `tax_string` varchar(250) DEFAULT NULL,
  `total_cost` float DEFAULT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_modifiers`
--

INSERT INTO `tbl_modifiers` (`id`, `name`, `price`, `description`, `user_id`, `company_id`, `tax_information`, `tax_string`, `total_cost`, `del_status`) VALUES
(1, 'Extra Topping (100)', 100, '', 1, 1, '[]', '', 0, 'Live'),
(3, 'Extra Topping (150)', 150, '', 1, 1, '[]', '', 0, 'Live'),
(4, 'Extra Topping (200)', 200, '', 1, 1, '[]', '', 0, 'Live'),
(5, 'Extra Topping (250)', 250, '', 1, 1, '[]', '', 0, 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_modifier_ingredients`
--

CREATE TABLE `tbl_modifier_ingredients` (
  `id` bigint NOT NULL,
  `ingredient_id` int DEFAULT NULL,
  `consumption` float DEFAULT NULL,
  `modifier_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `cost` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_multiple_currencies`
--

CREATE TABLE `tbl_multiple_currencies` (
  `id` int NOT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `conversion_rate` float DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_notifications`
--

CREATE TABLE `tbl_notifications` (
  `id` bigint NOT NULL,
  `notification` text NOT NULL,
  `sale_id` int NOT NULL,
  `waiter_id` int DEFAULT NULL,
  `push_status` int NOT NULL DEFAULT '1',
  `outlet_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_notifications`
--

INSERT INTO `tbl_notifications` (`id`, `notification`, `sale_id`, `waiter_id`, `push_status`, `outlet_id`) VALUES
(5, 'an order has been deleted, Order Number is: aRV260204-001', 9, 3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_notification_bar_kitchen_panel`
--

CREATE TABLE `tbl_notification_bar_kitchen_panel` (
  `id` int NOT NULL,
  `notification` text NOT NULL,
  `sale_id` int NOT NULL,
  `kitchen_id` int DEFAULT NULL,
  `outlet_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders_table`
--

CREATE TABLE `tbl_orders_table` (
  `id` bigint NOT NULL,
  `persons` int NOT NULL,
  `booking_time` varchar(50) NOT NULL,
  `sale_id` int NOT NULL,
  `sale_no` varchar(20) NOT NULL,
  `outlet_id` int NOT NULL,
  `table_id` int NOT NULL,
  `del_status` varchar(20) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_orders_table`
--

INSERT INTO `tbl_orders_table` (`id`, `persons`, `booking_time`, `sale_id`, `sale_no`, `outlet_id`, `table_id`, `del_status`) VALUES
(1, 0, '2026-02-03 02:00:41', 1, 'aFU260203-001', 1, 0, 'Live'),
(2, 0, '2026-02-03 02:01:32', 1, 'aFU260203-001', 1, 0, 'Live'),
(3, 0, '2026-02-03 02:04:39', 2, 'aJO260203-002', 1, 0, 'Live'),
(4, 0, '2026-02-03 02:08:57', 3, 'aAK260203-003', 1, 0, 'Live'),
(5, 0, '2026-02-03 02:09:52', 2, 'aAK260203-003', 1, 0, 'Live'),
(6, 0, '2026-02-03 02:09:52', 2, 'aAK260203-003', 1, 0, 'Live'),
(7, 4, '2026-02-03 11:57:48', 4, 'aJQ260203-004', 1, 1, 'Live'),
(8, 4, '2026-02-03 11:58:24', 3, 'aJQ260203-004', 1, 1, 'Live'),
(9, 4, '2026-02-03 11:58:24', 3, 'aJQ260203-004', 1, 1, 'Live'),
(10, 0, '2026-02-03 12:02:08', 5, 'aJQ260203-005', 1, 0, 'Live'),
(11, 0, '2026-02-03 12:12:12', 6, 'aJQ260203-006', 1, 0, 'Live'),
(12, 0, '2026-02-03 12:16:00', 4, 'aJQ260203-006', 1, 0, 'Live'),
(13, 0, '2026-02-03 12:16:23', 5, 'aJQ260203-005', 1, 0, 'Live'),
(14, 0, '2026-02-03 12:16:53', 7, 'aCQ260203-007', 1, 0, 'Live'),
(15, 4, '2026-02-03 12:18:16', 8, 'aCQ260203-008', 1, 1, 'Live'),
(16, 0, '2026-02-03 12:18:47', 7, 'aCQ260203-007', 1, 0, 'Live'),
(17, 0, '2026-02-04 23:42:30', 9, 'aRV260204-001', 1, 0, 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_outlets`
--

CREATE TABLE `tbl_outlets` (
  `id` int NOT NULL,
  `outlet_name` varchar(50) DEFAULT NULL,
  `outlet_code` varchar(10) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `default_waiter` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `food_menus` text,
  `food_menu_prices` text,
  `delivery_price` text,
  `has_kitchen` varchar(10) NOT NULL DEFAULT 'No',
  `active_status` varchar(20) DEFAULT 'active',
  `del_status` varchar(10) DEFAULT 'Live',
  `online_self_order_receiving_id` int NOT NULL DEFAULT '0',
  `created_date` varchar(20) DEFAULT NULL,
  `online_order_module` int NOT NULL DEFAULT '1',
  `available_online_foods` text,
  `thumb_imgs` text,
  `large_imgs` text,
  `explore_section_items` text,
  `online_order_receiving_id` int NOT NULL DEFAULT '0',
  `reservation_order_receiving_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_outlets`
--

INSERT INTO `tbl_outlets` (`id`, `outlet_name`, `outlet_code`, `address`, `phone`, `email`, `default_waiter`, `company_id`, `food_menus`, `food_menu_prices`, `delivery_price`, `has_kitchen`, `active_status`, `del_status`, `online_self_order_receiving_id`, `created_date`, `online_order_module`, `available_online_foods`, `thumb_imgs`, `large_imgs`, `explore_section_items`, `online_order_receiving_id`, `reservation_order_receiving_id`) VALUES
(1, 'Chezzy Bite', '000001', 'Cheezy Bite MA-MA &amp; Sons  Plaza Shah Derai, Swat', '0313-4367417  0348-5567417', '', 3, 1, '39,45,116,123,25,19,118,125,20,112,126,111,115,31,18,23,114,21,113,22,29,110,109,119,121,26,124,107,41,122,117,37,108,120,35,104,30,38,,1,2,3,4,5,150,145,146,147,148,149,140,141,142,143,144,135,136,137,138,139,130,131,132,133,134,127,128,129,105,106,100,101,102,103,809,808,807,806,805,804,803,802,801,800,705,704,703,702,701,700,601,600,16,15,14,13,12,11,10,9,8,7,6,17,28,27,24,34,33,32,47,46,44,43,42,40,36,215,214,213,212,211,210,209,208,207,204,205,206,200,201,202,904,306,307,308,303,304,305,300,301,302,402,401,400,504,503,502,501,500,905,906,907,908,909,910,911,912,913', '{\"tmp39\":\"470||470||470\",\"tmp45\":\"700||700||700\",\"tmp116\":\"600||600||600\",\"tmp123\":\"1600||1600||1600\",\"tmp25\":\"260||260||260\",\"tmp19\":\"150||150||150\",\"tmp118\":\"1600||1600||1600\",\"tmp125\":\"600||600||600\",\"tmp20\":\"400||400||400\",\"tmp112\":\"1200||1200||1200\",\"tmp126\":\"600||600||600\",\"tmp111\":\"600||600||600\",\"tmp115\":\"600||600||600\",\"tmp31\":\"350||350||350\",\"tmp18\":\"150||150||150\",\"tmp23\":\"380||380||380\",\"tmp114\":\"2000||2000||2000\",\"tmp21\":\"400||400||400\",\"tmp113\":\"1600||1600||1600\",\"tmp22\":\"350||350||350\",\"tmp29\":\"450||450||450\",\"tmp110\":\"600||600||600\",\"tmp109\":\"2000||2000||2000\",\"tmp119\":\"2000||2000||2000\",\"tmp121\":\"600||600||600\",\"tmp26\":\"200||200||200\",\"tmp124\":\"2000||2000||2000\",\"tmp107\":\"1200||1200||1200\",\"tmp41\":\"750||750||750\",\"tmp122\":\"1200||1200||1200\",\"tmp117\":\"1200||1200||1200\",\"tmp37\":\"480||480||480\",\"tmp108\":\"1600||1600||1600\",\"tmp120\":\"600||600||600\",\"tmp35\":\"1000||1000||1000\",\"tmp104\":\"2200||2200||2200\",\"tmp30\":\"450||450||450\",\"tmp38\":\"450||450||450\",\"tmp1\":\"495||495||495\",\"tmp2\":\"450||450||450\",\"tmp3\":\"495||495||495\",\"tmp4\":\"550||550||550\",\"tmp5\":\"450||450||450\",\"tmp150\":\"3599||3599||3599\",\"tmp145\":\"600||600||600\",\"tmp146\":\"600||600||600\",\"tmp147\":\"1200||1200||1200\",\"tmp148\":\"1600||1600||1600\",\"tmp149\":\"2000||2000||2000\",\"tmp140\":\"600||600||600\",\"tmp141\":\"600||600||600\",\"tmp142\":\"1200||1200||1200\",\"tmp143\":\"1600||1600||1600\",\"tmp144\":\"2000||2000||2000\",\"tmp135\":\"600||600||600\",\"tmp136\":\"600||600||600\",\"tmp137\":\"1200||1200||1200\",\"tmp138\":\"1600||1600||1600\",\"tmp139\":\"2000||2000||2000\",\"tmp130\":\"600||600||600\",\"tmp131\":\"600||600||600\",\"tmp132\":\"1200||1200||1200\",\"tmp133\":\"1600||1600||1600\",\"tmp134\":\"2000||2000||2000\",\"tmp127\":\"1200||1200||1200\",\"tmp128\":\"1600||1600||1600\",\"tmp129\":\"2000||2000||2000\",\"tmp105\":\"600||600||600\",\"tmp106\":\"600||600||600\",\"tmp100\":\"700||700||700\",\"tmp101\":\"700||700||700\",\"tmp102\":\"1300||1300||1300\",\"tmp103\":\"1800||1800||1800\",\"tmp809\":\"450||450||450\",\"tmp808\":\"450||450||450\",\"tmp807\":\"350||350||350\",\"tmp806\":\"399||399||399\",\"tmp805\":\"350||350||350\",\"tmp804\":\"180||180||180\",\"tmp803\":\"199||199||199\",\"tmp802\":\"250||250||250\",\"tmp801\":\"250||250||250\",\"tmp800\":\"299||299||299\",\"tmp705\":\"70||70||70\",\"tmp704\":\"250||250||250\",\"tmp703\":\"120||120||120\",\"tmp702\":\"299||299||299\",\"tmp701\":\"350||350||350\",\"tmp700\":\"399||399||399\",\"tmp601\":\"499||499||499\",\"tmp600\":\"599||599||599\",\"tmp16\":\"370||370||370\",\"tmp15\":\"370||370||370\",\"tmp14\":\"370||370||370\",\"tmp13\":\"599||599||599\",\"tmp12\":\"320||320||320\",\"tmp11\":\"370||370||370\",\"tmp10\":\"370||370||370\",\"tmp9\":\"650||650||650\",\"tmp8\":\"899||899||899\",\"tmp7\":\"299||299||299\",\"tmp6\":\"350||350||350\",\"tmp17\":\"200||200||200\",\"tmp28\":\"350||350||350\",\"tmp27\":\"300||300||300\",\"tmp24\":\"280||280||280\",\"tmp34\":\"299||299||299\",\"tmp33\":\"999||999||999\",\"tmp32\":\"1999||1999||1999\",\"tmp47\":\"450||450||450\",\"tmp46\":\"480||480||480\",\"tmp44\":\"450||450||450\",\"tmp43\":\"700||700||700\",\"tmp42\":\"350||350||350\",\"tmp40\":\"450||450||450\",\"tmp36\":\"499||499||499\",\"tmp215\":\"499||499||499\",\"tmp214\":\"450||450||450\",\"tmp213\":\"700||700||700\",\"tmp212\":\"399||399||399\",\"tmp211\":\"499||499||499\",\"tmp210\":\"599||599||599\",\"tmp209\":\"699||699||699\",\"tmp208\":\"850||850||850\",\"tmp207\":\"699||699||699\",\"tmp204\":\"899||899||899\",\"tmp205\":\"899||899||899\",\"tmp206\":\"1799||1799||1799\",\"tmp200\":\"700||700||700\",\"tmp201\":\"700||700||700\",\"tmp202\":\"1500||1500||1500\",\"tmp904\":\"2900||2900||2900\",\"tmp306\":\"1200||1200||1200\",\"tmp307\":\"1200||1200||1200\",\"tmp308\":\"1600||1600||1600\",\"tmp303\":\"1200||1200||1200\",\"tmp304\":\"1200||1200||1200\",\"tmp305\":\"1600||1600||1600\",\"tmp300\":\"1400||1400||1400\",\"tmp301\":\"1400||1400||1400\",\"tmp302\":\"1800||1800||1800\",\"tmp402\":\"700||700||700\",\"tmp401\":\"700||700||700\",\"tmp400\":\"750||750||750\",\"tmp504\":\"||||\",\"tmp503\":\"||||\",\"tmp502\":\"||||\",\"tmp501\":\"||||\",\"tmp500\":\"1299||1299||1299\",\"tmp905\":\"1600||1600||1600\",\"tmp906\":\"2999||2999||2999\",\"tmp907\":\"3999||3999||3999\",\"tmp908\":\"5200||5200||5200\",\"tmp909\":\"1299||1299||1299\",\"tmp910\":\"799||799||799\",\"tmp911\":\"1400||1400||1400\",\"tmp912\":\"3500||3500||3500\",\"tmp913\":\"4999||4999||4999\"}', '{\"index_39\":\"[]\",\"index_45\":\"[]\",\"index_116\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_123\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_25\":\"[]\",\"index_19\":\"[]\",\"index_118\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_125\":\"[]\",\"index_20\":\"[]\",\"index_112\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_126\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_111\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_115\":\"[]\",\"index_31\":\"[]\",\"index_18\":\"[]\",\"index_23\":\"[]\",\"index_114\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_21\":\"[]\",\"index_113\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_22\":\"[]\",\"index_29\":\"[]\",\"index_110\":\"[]\",\"index_109\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_119\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_121\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_26\":\"[]\",\"index_124\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_107\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_41\":\"[]\",\"index_122\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_117\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_37\":\"[]\",\"index_108\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_120\":\"[]\",\"index_35\":\"[]\",\"index_104\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_30\":\"[]\",\"index_38\":\"[]\",\"index_1\":\"[]\",\"index_2\":\"[]\",\"index_3\":\"[]\",\"index_4\":\"[]\",\"index_5\":\"[]\",\"index_150\":\"[]\",\"index_145\":\"[]\",\"index_146\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_147\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_148\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_149\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_140\":\"[]\",\"index_141\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_142\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_143\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_144\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_135\":\"[]\",\"index_136\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_137\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_138\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_139\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_130\":\"[]\",\"index_131\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_132\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_133\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_134\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_127\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_128\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_129\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_105\":\"[]\",\"index_106\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_100\":\"[]\",\"index_101\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_102\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_103\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_809\":\"[]\",\"index_808\":\"[]\",\"index_807\":\"[]\",\"index_806\":\"[]\",\"index_805\":\"[]\",\"index_804\":\"[]\",\"index_803\":\"[]\",\"index_802\":\"[]\",\"index_801\":\"[]\",\"index_800\":\"[]\",\"index_705\":\"[]\",\"index_704\":\"[]\",\"index_703\":\"[]\",\"index_702\":\"[]\",\"index_701\":\"[]\",\"index_700\":\"[]\",\"index_601\":\"[]\",\"index_600\":\"[]\",\"index_16\":\"[]\",\"index_15\":\"[]\",\"index_14\":\"[]\",\"index_13\":\"[]\",\"index_12\":\"[]\",\"index_11\":\"[]\",\"index_10\":\"[]\",\"index_9\":\"[]\",\"index_8\":\"[]\",\"index_7\":\"[]\",\"index_6\":\"[]\",\"index_17\":\"[]\",\"index_28\":\"[]\",\"index_27\":\"[]\",\"index_24\":\"[]\",\"index_34\":\"[]\",\"index_33\":\"[]\",\"index_32\":\"[]\",\"index_47\":\"[]\",\"index_46\":\"[]\",\"index_44\":\"[]\",\"index_43\":\"[]\",\"index_42\":\"[]\",\"index_40\":\"[]\",\"index_36\":\"[]\",\"index_215\":\"[]\",\"index_214\":\"[]\",\"index_213\":\"[]\",\"index_212\":\"[]\",\"index_211\":\"[]\",\"index_210\":\"[]\",\"index_209\":\"[]\",\"index_208\":\"[]\",\"index_207\":\"[]\",\"index_204\":\"[]\",\"index_205\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_206\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_200\":\"[]\",\"index_201\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_202\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_904\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_306\":\"[]\",\"index_307\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_308\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_303\":\"[]\",\"index_304\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_305\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_300\":\"[]\",\"index_301\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_302\":\"{\\\"index_\\\":\\\"\\\"}\",\"index_402\":\"[]\",\"index_401\":\"[]\",\"index_400\":\"[]\",\"index_504\":\"[]\",\"index_503\":\"[]\",\"index_502\":\"[]\",\"index_501\":\"[]\",\"index_500\":\"[]\",\"index_905\":\"[]\",\"index_906\":\"[]\",\"index_907\":\"[]\",\"index_908\":\"[]\",\"index_909\":\"[]\",\"index_910\":\"[]\",\"index_911\":\"[]\",\"index_912\":\"[]\",\"index_913\":\"[]\"}', 'Yes', 'active', 'Live', 4, NULL, 2, '1_18,1_19,1_20,1_21,1_22,1_23,1_25,1_26,1_29,1_30,1_35,1_37,1_38,1_39,1_41,1_31,1_45,1_104,1_107,1_108,1_109,1_110,1_111,1_112,1_113,1_114,1_115,1_116,1_117,1_118,1_119,1_120,1_121,1_122,1_123,1_124,2_125,1_126,1_129', '{\"thumb_18\":\"1738500118.png\",\"thumb_19\":\"1738500077.png\",\"thumb_20\":\"1738740427.png\",\"thumb_21\":\"1738740826.png\",\"thumb_22\":\"1738741673.png\",\"thumb_23\":\"1738741718.png\",\"thumb_25\":\"1738741842.png\",\"thumb_26\":\"1738742663.png\",\"thumb_29\":\"1738742778.png\",\"thumb_30\":\"1738742811.png\",\"thumb_35\":\"1738742940.png\",\"thumb_37\":\"1738742993.png\",\"thumb_38\":\"1738743033.png\",\"thumb_39\":\"1738743066.png\",\"thumb_41\":\"1738743160.png\",\"thumb_31\":\"1738742904.png\",\"thumb_45\":\"1738743183.png\",\"thumb_104\":\"1738743620.png\",\"thumb_107\":\"1738743657.png\",\"thumb_108\":\"1738743680.png\",\"thumb_109\":\"1738743708.png\",\"thumb_110\":\"1738743738.png\",\"thumb_111\":\"1738743766.png\",\"thumb_112\":\"1738743860.png\",\"thumb_113\":\"1738744026.png\",\"thumb_114\":\"1738744053.png\",\"thumb_115\":\"1738744076.png\",\"thumb_116\":\"1738744104.png\",\"thumb_117\":\"1738744133.png\",\"thumb_118\":\"1738744163.png\",\"thumb_119\":\"1738744195.png\",\"thumb_120\":\"1738744222.png\",\"thumb_121\":\"1738744619.png\",\"thumb_122\":\"1738744650.png\",\"thumb_123\":\"1738744694.png\",\"thumb_124\":\"1738744719.png\",\"thumb_125\":\"1738744873.png\",\"thumb_126\":\"1738744910.png\",\"thumb_129\":\"\"}', '{\"large_18\":\"1738500103.png\",\"large_19\":\"1738500089.png\",\"large_20\":\"1738699189.png\",\"large_21\":\"1738699291.png\",\"large_22\":\"1738699514.png\",\"large_23\":\"1738699573.png\",\"large_25\":\"1738699709.png\",\"large_26\":\"1738699727.png\",\"large_29\":\"1738699791.png\",\"large_30\":\"1738699842.png\",\"large_35\":\"1738699868.png\",\"large_37\":\"1738699925.png\",\"large_38\":\"1738699957.png\",\"large_39\":\"1738700025.png\",\"large_41\":\"1738700146.png\",\"large_31\":\"1738738806.png\",\"large_45\":\"1738739028.png\",\"large_104\":\"1738739097.png\",\"large_107\":\"1738739135.png\",\"large_108\":\"1738739166.png\",\"large_109\":\"1738739229.png\",\"large_110\":\"1738739301.png\",\"large_111\":\"1738739367.png\",\"large_112\":\"1738739498.png\",\"large_113\":\"1738739562.png\",\"large_114\":\"1738739601.png\",\"large_115\":\"1738739627.png\",\"large_116\":\"1738739657.png\",\"large_117\":\"1738739684.png\",\"large_118\":\"1738739711.png\",\"large_119\":\"1738739752.png\",\"large_120\":\"1738739799.png\",\"large_121\":\"1738739885.png\",\"large_122\":\"1738739908.png\",\"large_123\":\"1738739941.png\",\"large_124\":\"1738739966.png\",\"large_125\":\"1738739989.png\",\"large_126\":\"1738740133.png\",\"large_129\":\"\"}', '[{\"food_id\":\"18\",\"name\":\"Fish Tacos(02)\",\"sale_price\":\"7\",\"description\":\"Fish tacos are a delicious dish featuring crispy or grilled fish wrapped in soft corn or flour tortillas. They are typically topped with fresh slaw, creamy sauce, and a squeeze of lime for a perfect balance of flavors and textures.\"},{\"food_id\":\"19\",\"name\":\"Black Pepper Beef(03)\",\"sale_price\":\"50\",\"description\":\"Black Pepper Beef is a flavorful stir-fry dish featuring tender beef cooked with bell peppers, onions, and a rich black pepper sauce. Served with rice or noodles, it offers a perfect balance of savory, spicy, and aromatic flavors.\"},{\"food_id\":\"20\",\"name\":\"Ceviche(04)\",\"sale_price\":\"59\",\"description\":\"Ceviche is a refreshing seafood dish made with fresh raw fish cured in citrus juice, mixed with onions, cilantro, and peppers. Served chilled, it offers a perfect balance of tangy, spicy, and savory flavors.\"},{\"food_id\":\"41\",\"name\":\"Shrimp Toast(025)\",\"sale_price\":\"9\",\"description\":\"Shrimp Toast is a crispy appetizer made with seasoned shrimp paste spread on bread, then fried to golden perfection. Served with dipping sauce, it offers a delicious balance of savory, crunchy, and umami flavors.\"}]', 38, 5),
(2, 'KFC Zone', '000002', '328 Bobcat Drive, Washington, United States', '7895478', '', 0, 1, '39,45,116,25,19,118,125,20,112,126,111,115,31,18,23,114,21,113,22,29,110,109,119,121,26,124,107,41,122,117,37,108,120,35,104,30,38,123,', '{\"tmp39\":\"49||49||\",\"tmp45\":\"35||35||\",\"tmp116\":\"39||39||\",\"tmp25\":\"29||29||\",\"tmp19\":\"50||50||\",\"tmp118\":\"99||99||\",\"tmp125\":\"9||9||\",\"tmp20\":\"59||59||\",\"tmp112\":\"299||299||\",\"tmp126\":\"196||196||\",\"tmp111\":\"310||310||\",\"tmp115\":\"199||199||\",\"tmp31\":\"2||2||\",\"tmp18\":\"7||7||\",\"tmp23\":\"49||49||\",\"tmp114\":\"199||199||\",\"tmp21\":\"49||49||\",\"tmp113\":\"249||249||\",\"tmp22\":\"39||39||\",\"tmp29\":\"68||68||\",\"tmp110\":\"89||89||\",\"tmp109\":\"99||99||\",\"tmp119\":\"49||49||\",\"tmp121\":\"49||49||\",\"tmp26\":\"5||5||\",\"tmp124\":\"49||49||\",\"tmp107\":\"150||150||\",\"tmp41\":\"9||9||\",\"tmp122\":\"99||99||\",\"tmp117\":\"99||99||\",\"tmp37\":\"79||79||\",\"tmp108\":\"99||99||\",\"tmp120\":\"49||49||\",\"tmp35\":\"69||69||\",\"tmp104\":\"40||40||\",\"tmp30\":\"6||6||\",\"tmp38\":\"49||49||\",\"tmp123\":\"149||149||\"}', '{\"index_39\":\"{\\\"index_5\\\":\\\"49\\\",\\\"index_4\\\":\\\"49\\\",\\\"index_3\\\":\\\"49\\\",\\\"index_2\\\":\\\"49\\\",\\\"index_1\\\":\\\"49\\\"}\",\"index_45\":\"{\\\"index_5\\\":\\\"35\\\",\\\"index_4\\\":\\\"35\\\",\\\"index_3\\\":\\\"35\\\",\\\"index_2\\\":\\\"35\\\",\\\"index_1\\\":\\\"35\\\"}\",\"index_116\":\"{\\\"index_5\\\":\\\"39\\\",\\\"index_4\\\":\\\"39\\\",\\\"index_3\\\":\\\"39\\\",\\\"index_2\\\":\\\"39\\\",\\\"index_1\\\":\\\"39\\\"}\",\"index_25\":\"{\\\"index_5\\\":\\\"29\\\",\\\"index_4\\\":\\\"29\\\",\\\"index_3\\\":\\\"29\\\",\\\"index_2\\\":\\\"29\\\",\\\"index_1\\\":\\\"29\\\"}\",\"index_19\":\"{\\\"index_5\\\":\\\"50\\\",\\\"index_4\\\":\\\"50\\\",\\\"index_3\\\":\\\"50\\\",\\\"index_2\\\":\\\"50\\\",\\\"index_1\\\":\\\"50\\\"}\",\"index_118\":\"{\\\"index_5\\\":\\\"99\\\",\\\"index_4\\\":\\\"99\\\",\\\"index_3\\\":\\\"99\\\",\\\"index_2\\\":\\\"99\\\",\\\"index_1\\\":\\\"99\\\"}\",\"index_125\":\"{\\\"index_5\\\":\\\"9\\\",\\\"index_4\\\":\\\"9\\\",\\\"index_3\\\":\\\"9\\\",\\\"index_2\\\":\\\"9\\\",\\\"index_1\\\":\\\"9\\\"}\",\"index_20\":\"{\\\"index_5\\\":\\\"59\\\",\\\"index_4\\\":\\\"59\\\",\\\"index_3\\\":\\\"59\\\",\\\"index_2\\\":\\\"59\\\",\\\"index_1\\\":\\\"59\\\"}\",\"index_112\":\"{\\\"index_5\\\":\\\"299\\\",\\\"index_4\\\":\\\"299\\\",\\\"index_3\\\":\\\"299\\\",\\\"index_2\\\":\\\"299\\\",\\\"index_1\\\":\\\"299\\\"}\",\"index_126\":\"{\\\"index_5\\\":\\\"196\\\",\\\"index_4\\\":\\\"196\\\",\\\"index_3\\\":\\\"196\\\",\\\"index_2\\\":\\\"196\\\",\\\"index_1\\\":\\\"196\\\"}\",\"index_111\":\"{\\\"index_5\\\":\\\"315\\\",\\\"index_4\\\":\\\"315\\\",\\\"index_3\\\":\\\"315\\\",\\\"index_2\\\":\\\"315\\\",\\\"index_1\\\":\\\"315\\\"}\",\"index_115\":\"{\\\"index_5\\\":\\\"199\\\",\\\"index_4\\\":\\\"199\\\",\\\"index_3\\\":\\\"199\\\",\\\"index_2\\\":\\\"199\\\",\\\"index_1\\\":\\\"199\\\"}\",\"index_31\":\"{\\\"index_5\\\":\\\"2\\\",\\\"index_4\\\":\\\"2\\\",\\\"index_3\\\":\\\"2\\\",\\\"index_2\\\":\\\"2\\\",\\\"index_1\\\":\\\"2\\\"}\",\"index_18\":\"{\\\"index_5\\\":\\\"7\\\",\\\"index_4\\\":\\\"7\\\",\\\"index_3\\\":\\\"7\\\",\\\"index_2\\\":\\\"7\\\",\\\"index_1\\\":\\\"7\\\"}\",\"index_23\":\"{\\\"index_5\\\":\\\"49\\\",\\\"index_4\\\":\\\"49\\\",\\\"index_3\\\":\\\"49\\\",\\\"index_2\\\":\\\"49\\\",\\\"index_1\\\":\\\"49\\\"}\",\"index_114\":\"{\\\"index_5\\\":\\\"205\\\",\\\"index_4\\\":\\\"205\\\",\\\"index_3\\\":\\\"205\\\",\\\"index_2\\\":\\\"205\\\",\\\"index_1\\\":\\\"205\\\"}\",\"index_21\":\"{\\\"index_5\\\":\\\"49\\\",\\\"index_4\\\":\\\"49\\\",\\\"index_3\\\":\\\"49\\\",\\\"index_2\\\":\\\"49\\\",\\\"index_1\\\":\\\"49\\\"}\",\"index_113\":\"{\\\"index_5\\\":\\\"259\\\",\\\"index_4\\\":\\\"259\\\",\\\"index_3\\\":\\\"259\\\",\\\"index_2\\\":\\\"259\\\",\\\"index_1\\\":\\\"259\\\"}\",\"index_22\":\"{\\\"index_5\\\":\\\"39\\\",\\\"index_4\\\":\\\"39\\\",\\\"index_3\\\":\\\"39\\\",\\\"index_2\\\":\\\"49\\\",\\\"index_1\\\":\\\"39\\\"}\",\"index_29\":\"{\\\"index_5\\\":\\\"68\\\",\\\"index_4\\\":\\\"68\\\",\\\"index_3\\\":\\\"68\\\",\\\"index_2\\\":\\\"68\\\",\\\"index_1\\\":\\\"68\\\"}\",\"index_110\":\"{\\\"index_5\\\":\\\"95\\\",\\\"index_4\\\":\\\"95\\\",\\\"index_3\\\":\\\"95\\\",\\\"index_2\\\":\\\"95\\\",\\\"index_1\\\":\\\"95\\\"}\",\"index_109\":\"{\\\"index_5\\\":\\\"105\\\",\\\"index_4\\\":\\\"105\\\",\\\"index_3\\\":\\\"105\\\",\\\"index_2\\\":\\\"105\\\",\\\"index_1\\\":\\\"105\\\"}\",\"index_119\":\"{\\\"index_5\\\":\\\"49\\\",\\\"index_4\\\":\\\"49\\\",\\\"index_3\\\":\\\"49\\\",\\\"index_2\\\":\\\"49\\\",\\\"index_1\\\":\\\"49\\\"}\",\"index_121\":\"{\\\"index_5\\\":\\\"49\\\",\\\"index_4\\\":\\\"49\\\",\\\"index_3\\\":\\\"49\\\",\\\"index_2\\\":\\\"49\\\",\\\"index_1\\\":\\\"49\\\"}\",\"index_26\":\"{\\\"index_5\\\":\\\"5\\\",\\\"index_4\\\":\\\"5\\\",\\\"index_3\\\":\\\"5\\\",\\\"index_2\\\":\\\"5\\\",\\\"index_1\\\":\\\"5\\\"}\",\"index_124\":\"{\\\"index_5\\\":\\\"49\\\",\\\"index_4\\\":\\\"49\\\",\\\"index_3\\\":\\\"49\\\",\\\"index_2\\\":\\\"49\\\",\\\"index_1\\\":\\\"49\\\"}\",\"index_107\":\"{\\\"index_5\\\":\\\"160\\\",\\\"index_4\\\":\\\"160\\\",\\\"index_3\\\":\\\"160\\\",\\\"index_2\\\":\\\"160\\\",\\\"index_1\\\":\\\"160\\\"}\",\"index_41\":\"{\\\"index_5\\\":\\\"9\\\",\\\"index_4\\\":\\\"9\\\",\\\"index_3\\\":\\\"9\\\",\\\"index_2\\\":\\\"9\\\",\\\"index_1\\\":\\\"9\\\"}\",\"index_122\":\"{\\\"index_5\\\":\\\"99\\\",\\\"index_4\\\":\\\"99\\\",\\\"index_3\\\":\\\"99\\\",\\\"index_2\\\":\\\"99\\\",\\\"index_1\\\":\\\"99\\\"}\",\"index_117\":\"{\\\"index_5\\\":\\\"99\\\",\\\"index_4\\\":\\\"99\\\",\\\"index_3\\\":\\\"99\\\",\\\"index_2\\\":\\\"99\\\",\\\"index_1\\\":\\\"99\\\"}\",\"index_37\":\"{\\\"index_5\\\":\\\"79\\\",\\\"index_4\\\":\\\"79\\\",\\\"index_3\\\":\\\"79\\\",\\\"index_2\\\":\\\"79\\\",\\\"index_1\\\":\\\"79\\\"}\",\"index_108\":\"{\\\"index_5\\\":\\\"105\\\",\\\"index_4\\\":\\\"105\\\",\\\"index_3\\\":\\\"105\\\",\\\"index_2\\\":\\\"105\\\",\\\"index_1\\\":\\\"105\\\"}\",\"index_120\":\"{\\\"index_5\\\":\\\"49\\\",\\\"index_4\\\":\\\"49\\\",\\\"index_3\\\":\\\"49\\\",\\\"index_2\\\":\\\"49\\\",\\\"index_1\\\":\\\"49\\\"}\",\"index_35\":\"{\\\"index_5\\\":\\\"69\\\",\\\"index_4\\\":\\\"69\\\",\\\"index_3\\\":\\\"69\\\",\\\"index_2\\\":\\\"69\\\",\\\"index_1\\\":\\\"69\\\"}\",\"index_104\":\"{\\\"index_5\\\":\\\"55\\\",\\\"index_4\\\":\\\"56\\\",\\\"index_3\\\":\\\"1\\\",\\\"index_2\\\":\\\"1\\\",\\\"index_1\\\":\\\"1\\\"}\",\"index_30\":\"{\\\"index_5\\\":\\\"6\\\",\\\"index_4\\\":\\\"6\\\",\\\"index_3\\\":\\\"6\\\",\\\"index_2\\\":\\\"6\\\",\\\"index_1\\\":\\\"6\\\"}\",\"index_38\":\"{\\\"index_5\\\":\\\"49\\\",\\\"index_4\\\":\\\"49\\\",\\\"index_3\\\":\\\"49\\\",\\\"index_2\\\":\\\"49\\\",\\\"index_1\\\":\\\"49\\\"}\",\"index_123\":\"{\\\"index_5\\\":\\\"149\\\",\\\"index_4\\\":\\\"194\\\",\\\"index_3\\\":\\\"149\\\",\\\"index_2\\\":\\\"149\\\",\\\"index_1\\\":\\\"149\\\"}\"}', 'No', 'active', 'Deleted', 4, NULL, 1, NULL, NULL, NULL, NULL, 5, 3),
(4, 'KFC Modern Zone', '000001', 'kp, uk', '54897', '', 0, 4, NULL, NULL, NULL, 'No', 'active', 'Live', 0, '2025-04-24', 1, NULL, NULL, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment_histories`
--

CREATE TABLE `tbl_payment_histories` (
  `id` int NOT NULL,
  `payment_type` varchar(20) DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `payment_date` varchar(20) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `trans_id` varchar(100) DEFAULT NULL,
  `json_details` text,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment_methods`
--

CREATE TABLE `tbl_payment_methods` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `user_id` int NOT NULL,
  `company_id` int NOT NULL,
  `order_by` int DEFAULT NULL,
  `personalinformation` text,
  `del_status` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_payment_methods`
--

INSERT INTO `tbl_payment_methods` (`id`, `name`, `description`, `user_id`, `company_id`, `order_by`, `personalinformation`, `del_status`) VALUES
(1, 'Cash', '', 1, 1, 1, '', 'Live'),
(2, 'Credit Card', 'Card', 1, 1, 1, NULL, 'Live'),
(3, 'Check', '', 1, 1, 2, NULL, 'Live'),
(4, 'Bank Transfer', '', 1, 1, 3, NULL, 'Live'),
(5, 'Loyalty Point', '', 1, 1, 4, NULL, 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_plugins`
--

CREATE TABLE `tbl_plugins` (
  `id` int NOT NULL,
  `name` varchar(250) NOT NULL,
  `product_id` int NOT NULL,
  `details` varchar(250) NOT NULL,
  `bestoro` varchar(100) NOT NULL,
  `active_status` varchar(10) NOT NULL DEFAULT 'Active',
  `installation_date` varchar(20) DEFAULT NULL,
  `version` varchar(20) NOT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_plugins`
--

INSERT INTO `tbl_plugins` (`id`, `name`, `product_id`, `details`, `bestoro`, `active_status`, `installation_date`, `version`, `company_id`, `del_status`) VALUES
(1, 'Saas', 23033741, 'iRestora PLUS - Next Gen Restaurant POS Saas Module', 'fTzfWnSWR', 'Active', '2021-03-22', '1.1', 1, 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_premade_ingredients`
--

CREATE TABLE `tbl_premade_ingredients` (
  `id` bigint NOT NULL,
  `ingredient_id` int DEFAULT NULL,
  `consumption` float DEFAULT NULL,
  `pre_made_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live',
  `cost` float DEFAULT NULL,
  `total` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pricing_plans`
--

CREATE TABLE `tbl_pricing_plans` (
  `id` int NOT NULL,
  `plan_name` varchar(100) DEFAULT NULL,
  `payment_type` text,
  `link_for_paypal` text,
  `link_for_stripe` text,
  `monthly_cost` float DEFAULT NULL,
  `price_for_month2` float DEFAULT NULL,
  `number_of_maximum_users` varchar(100) DEFAULT NULL,
  `number_of_maximum_outlets` varchar(100) DEFAULT NULL,
  `number_of_maximum_invoices` varchar(100) DEFAULT NULL,
  `trail_days` varchar(100) DEFAULT NULL,
  `free_trial_status` varchar(11) DEFAULT 'No',
  `is_recommended` varchar(10) DEFAULT 'No',
  `description` varchar(250) DEFAULT NULL,
  `price_interval` varchar(11) DEFAULT 'monthly',
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_pricing_plans`
--

INSERT INTO `tbl_pricing_plans` (`id`, `plan_name`, `payment_type`, `link_for_paypal`, `link_for_stripe`, `monthly_cost`, `price_for_month2`, `number_of_maximum_users`, `number_of_maximum_outlets`, `number_of_maximum_invoices`, `trail_days`, `free_trial_status`, `is_recommended`, `description`, `price_interval`, `del_status`) VALUES
(1, 'Silver', '2', '', '', 10.99, 9.99, '2', '2', '500', '365', 'No', 'No', '', 'yearly', 'Live'),
(2, 'Gold', '2', '', '', 20.99, 18.99, '5', '5', '2000', '15', 'No', 'No', '', 'monthly', 'Live'),
(3, 'Platinum', '1', '', '', 29.99, 25.99, '9', '4', '4000', '15', 'No', 'Yes', '', 'monthly', 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_printers`
--

CREATE TABLE `tbl_printers` (
  `id` int NOT NULL,
  `path` varchar(300) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `profile_` varchar(100) DEFAULT NULL,
  `characters_per_line` int DEFAULT NULL,
  `printer_ip_address` varchar(20) DEFAULT NULL,
  `printer_port` varchar(20) DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `outlet_id` int NOT NULL DEFAULT '0',
  `printing_choice` varchar(100) DEFAULT NULL,
  `ipvfour_address` varchar(50) DEFAULT NULL,
  `print_format` varchar(100) DEFAULT NULL,
  `inv_qr_code_enable_status` varchar(50) DEFAULT NULL,
  `open_cash_drawer_when_printing_invoice` varchar(20) NOT NULL DEFAULT 'No',
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_printers`
--

INSERT INTO `tbl_printers` (`id`, `path`, `title`, `type`, `profile_`, `characters_per_line`, `printer_ip_address`, `printer_port`, `company_id`, `outlet_id`, `printing_choice`, `ipvfour_address`, `print_format`, `inv_qr_code_enable_status`, `open_cash_drawer_when_printing_invoice`, `del_status`) VALUES
(1, '', 'Printer', '', '', 0, '', '', 1, 1, 'web_browser_popup', '', '80mm', 'Enable', 'No', 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_production`
--

CREATE TABLE `tbl_production` (
  `id` int NOT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `date` varchar(15) NOT NULL,
  `user_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live',
  `status` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_production_ingredients`
--

CREATE TABLE `tbl_production_ingredients` (
  `id` int NOT NULL,
  `ingredient_id` int DEFAULT NULL,
  `quantity_amount` float DEFAULT NULL,
  `production_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live',
  `status` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_promotions`
--

CREATE TABLE `tbl_promotions` (
  `id` int NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `type` int DEFAULT NULL,
  `food_menu_id` varchar(11) DEFAULT NULL,
  `qty` float DEFAULT NULL,
  `get_food_menu_id` varchar(11) DEFAULT NULL,
  `get_qty` float DEFAULT NULL,
  `discount` varchar(10) DEFAULT NULL,
  `status` int DEFAULT '1',
  `outlet_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `promotion_code` varchar(30) DEFAULT NULL,
  `del_status` varchar(20) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchase`
--

CREATE TABLE `tbl_purchase` (
  `id` int NOT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `date` varchar(15) NOT NULL,
  `subtotal` float DEFAULT NULL,
  `other` float DEFAULT NULL,
  `grand_total` float DEFAULT NULL,
  `paid` float DEFAULT NULL,
  `due` float DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `added_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_id` int NOT NULL DEFAULT '0',
  `del_status` varchar(50) DEFAULT 'Live',
  `counter_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchase_ingredients`
--

CREATE TABLE `tbl_purchase_ingredients` (
  `id` int NOT NULL,
  `ingredient_id` int DEFAULT NULL,
  `unit_price` float DEFAULT NULL,
  `quantity_amount` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `purchase_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live',
  `cost_per_unit` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_register`
--

CREATE TABLE `tbl_register` (
  `id` int NOT NULL,
  `opening_balance` float DEFAULT NULL,
  `opening_details` text,
  `closing_balance` float DEFAULT NULL,
  `opening_balance_date_time` varchar(50) DEFAULT NULL,
  `closing_balance_date_time` varchar(50) DEFAULT NULL,
  `sale_paid_amount` float DEFAULT NULL,
  `refund_amount` float DEFAULT NULL,
  `customer_due_receive` float DEFAULT NULL,
  `payment_methods_sale` text,
  `register_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=open,2=closed',
  `others_currency` text,
  `total_purchase` float DEFAULT NULL,
  `total_due_payment` float DEFAULT NULL,
  `total_expense` float DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `counter_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_register`
--

INSERT INTO `tbl_register` (`id`, `opening_balance`, `opening_details`, `closing_balance`, `opening_balance_date_time`, `closing_balance_date_time`, `sale_paid_amount`, `refund_amount`, `customer_due_receive`, `payment_methods_sale`, `register_status`, `others_currency`, `total_purchase`, `total_due_payment`, `total_expense`, `user_id`, `outlet_id`, `company_id`, `counter_id`) VALUES
(1, 0, '[\"1||Cash||0\",\"2||Credit Card||0\",\"3||Check||0\",\"4||Bank Transfer||0\",\"5||Loyalty Point||0\"]', 0, '2026-02-03 00:07:22', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reservations`
--

CREATE TABLE `tbl_reservations` (
  `id` int NOT NULL,
  `company_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `number_of_guest` int DEFAULT NULL,
  `reservation_date` varchar(50) DEFAULT NULL,
  `reservation_time` varchar(55) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `reservation_type` varchar(50) DEFAULT NULL,
  `special_request` text,
  `status` varchar(20) NOT NULL DEFAULT 'Pending',
  `del_status` varchar(20) NOT NULL DEFAULT 'Live',
  `reservation_order_receiving_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_roles`
--

CREATE TABLE `tbl_roles` (
  `id` int NOT NULL,
  `role_name` varchar(250) DEFAULT NULL,
  `del_status` varchar(50) NOT NULL DEFAULT 'Live',
  `company_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_role_access`
--

CREATE TABLE `tbl_role_access` (
  `id` int NOT NULL,
  `role_id` int DEFAULT NULL,
  `access_parent_id` int DEFAULT NULL,
  `access_child_id` int DEFAULT NULL,
  `del_status` varchar(20) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_running_orders`
--

CREATE TABLE `tbl_running_orders` (
  `id` int NOT NULL,
  `order_content` text NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `del_status` varchar(12) DEFAULT 'Live',
  `sale_no` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_running_order_tables`
--

CREATE TABLE `tbl_running_order_tables` (
  `id` int NOT NULL,
  `table_content` text NOT NULL,
  `del_status` varchar(12) DEFAULT 'Live',
  `sale_no` varchar(20) DEFAULT NULL,
  `table_id` int NOT NULL DEFAULT '0',
  `outlet_id` int NOT NULL DEFAULT '0',
  `persons` int DEFAULT '0',
  `company_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_running_order_tables`
--

INSERT INTO `tbl_running_order_tables` (`id`, `table_content`, `del_status`, `sale_no`, `table_id`, `outlet_id`, `persons`, `company_id`) VALUES
(2, '{\"persons\":\"4\",\"table_id\":\"1\",\"sale_no\":\"aCQ260203-008\",\"outlet_id\":\"1\",\"company_id\":\"1\"}', 'Live', 'aCQ260203-008', 1, 1, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sales`
--

CREATE TABLE `tbl_sales` (
  `id` int NOT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `sale_no` varchar(500) NOT NULL DEFAULT '000000',
  `total_items` int DEFAULT NULL,
  `sub_total` float DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `due_amount` float DEFAULT NULL,
  `disc` varchar(50) DEFAULT NULL,
  `disc_actual` float DEFAULT NULL,
  `vat` float DEFAULT NULL,
  `total_payable` float DEFAULT NULL,
  `payment_method_id` int DEFAULT NULL,
  `close_time` time NOT NULL,
  `table_id` int DEFAULT NULL,
  `total_item_discount_amount` float NOT NULL,
  `sub_total_with_discount` float NOT NULL,
  `sub_total_discount_amount` float NOT NULL,
  `total_discount_amount` float NOT NULL,
  `charge_type` varchar(30) DEFAULT NULL,
  `delivery_charge` varchar(100) DEFAULT NULL,
  `tips_amount` varchar(100) DEFAULT NULL,
  `tips_amount_actual_charge` float DEFAULT NULL,
  `delivery_charge_actual_charge` float DEFAULT NULL,
  `sub_total_discount_value` varchar(10) NOT NULL,
  `sub_total_discount_type` varchar(20) NOT NULL,
  `sale_date` varchar(20) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_time` time NOT NULL,
  `cooking_start_time` varchar(50) DEFAULT NULL,
  `cooking_done_time` varchar(50) DEFAULT NULL,
  `modified` enum('Yes','No') NOT NULL DEFAULT 'No',
  `user_id` int DEFAULT NULL,
  `waiter_id` int NOT NULL DEFAULT '0',
  `outlet_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `order_status` tinyint(1) NOT NULL COMMENT '1=new order, 2=invoiced order, 3=closed order',
  `order_type` tinyint(1) NOT NULL COMMENT '1=dine in, 2 = take away, 3 = delivery',
  `del_status` varchar(50) DEFAULT 'Live',
  `zatca_value` text,
  `counter_id` int NOT NULL DEFAULT '0',
  `given_amount` float DEFAULT NULL,
  `change_amount` float DEFAULT NULL,
  `sale_vat_objects` text,
  `future_sale_status` int NOT NULL DEFAULT '1',
  `random_code` varchar(50) DEFAULT NULL,
  `is_kitchen_bell` int DEFAULT '1',
  `is_self_order` int NOT NULL DEFAULT '0',
  `self_order_ran_code` varchar(20) DEFAULT NULL,
  `self_order_status` varchar(20) NOT NULL DEFAULT 'Pending',
  `del_address` varchar(250) DEFAULT NULL,
  `delivery_partner_id` int DEFAULT NULL,
  `rounding_amount_hidden` float DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'Pending',
  `previous_due_tmp` float DEFAULT NULL,
  `used_loyalty_point` int DEFAULT NULL,
  `split_sale_id` int DEFAULT NULL,
  `orders_table_text` varchar(250) DEFAULT NULL,
  `refund_date_time` varchar(50) DEFAULT NULL,
  `refund_payment_id` int NOT NULL DEFAULT '0',
  `total_refund` float DEFAULT NULL,
  `refund_content` text,
  `token_number` varchar(50) DEFAULT NULL,
  `self_order_content` text,
  `paid_date_time` varchar(20) DEFAULT NULL,
  `is_invoice` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_sales`
--

INSERT INTO `tbl_sales` (`id`, `customer_id`, `sale_no`, `total_items`, `sub_total`, `paid_amount`, `due_amount`, `disc`, `disc_actual`, `vat`, `total_payable`, `payment_method_id`, `close_time`, `table_id`, `total_item_discount_amount`, `sub_total_with_discount`, `sub_total_discount_amount`, `total_discount_amount`, `charge_type`, `delivery_charge`, `tips_amount`, `tips_amount_actual_charge`, `delivery_charge_actual_charge`, `sub_total_discount_value`, `sub_total_discount_type`, `sale_date`, `date_time`, `order_time`, `cooking_start_time`, `cooking_done_time`, `modified`, `user_id`, `waiter_id`, `outlet_id`, `company_id`, `order_status`, `order_type`, `del_status`, `zatca_value`, `counter_id`, `given_amount`, `change_amount`, `sale_vat_objects`, `future_sale_status`, `random_code`, `is_kitchen_bell`, `is_self_order`, `self_order_ran_code`, `self_order_status`, `del_address`, `delivery_partner_id`, `rounding_amount_hidden`, `status`, `previous_due_tmp`, `used_loyalty_point`, `split_sale_id`, `orders_table_text`, `refund_date_time`, `refund_payment_id`, `total_refund`, `refund_content`, `token_number`, `self_order_content`, `paid_date_time`, `is_invoice`) VALUES
(1, '1', 'aFU260203-001', 1, 450, 450, 0, NULL, NULL, 0, 450, 1, '00:00:00', NULL, 0, 450, 0, 0, 'service', '', '', 0, 0, '', 'percentage', '2026-02-03', '2026-02-02 21:00:41', '00:00:41', NULL, NULL, 'No', 1, 3, 1, 1, 3, 1, 'Live', '', 1, 450, 0, '[]', 1, 'mDhmhnQJhXJOIqS', 1, 0, NULL, 'Pending', NULL, 0, NULL, 'Pending', 0, NULL, NULL, '', NULL, 0, NULL, NULL, '', '{\"sale_no\":\"aFU260203-001\",\"is_merge\":\"\",\"is_online_order\":\"\",\"edit_sale_id\":\"0\",\"waiter_app_status\":\"No\",\"hidden_given_amount\":\"450\",\"hidden_change_amount\":\"0.00\",\"counter_id\":\"1\",\"counter_name\":\"01\",\"random_code\":\"mDhmhnQJhXJOIqS\",\"token_number\":\"\",\"customer_id\":\"1\",\"customer_address\":\"\",\"customer_gst_number\":\"\",\"status\":\"Pending\",\"user_name\":\"Admin User\",\"user_id\":\"1\",\"zatca_invoice_value\":\"\",\"customer_name\":\"Walk-in Customer \",\"delivery_partner_id\":\"\",\"self_order_table_id\":\"0\",\"self_order_table_person\":\"undefined\",\"rounding_amount_hidden\":\"0.00\",\"previous_due_tmp\":\"0\",\"waiter_id\":\"3\",\"waiter_name\":\"Ds Waiter\",\"open_invoice_date_hidden\":\"2026-02-03\",\"total_items_in_cart\":\"1\",\"total_items_in_cart_qty\":\"1\",\"sub_total\":\"450.00\",\"sale_date\":\"2026-02-03\",\"date_time\":\"2026-02-03 12:00:41 AM\",\"order_time\":\"12:00:41 AM\",\"charge_type\":\"service\",\"total_vat\":\"0.00\",\"total_payable\":\"450.00\",\"total_item_discount_amount\":\"0.00\",\"sub_total_with_discount\":\"450.00\",\"sub_total_discount_amount\":\"0.00\",\"total_discount_amount\":\"0.00\",\"delivery_charge\":\"\",\"tips_amount\":\"\",\"delivery_charge_actual_charge\":\"\",\"tips_amount_actual_charge\":\"0.00\",\"sub_total_discount_value\":\"\",\"sub_total_discount_type\":\"percentage\",\"order_type\":\"1\",\"order_status\":3,\"sale_vat_objects\":[],\"orders_table\":[{\"table_id\":\"\",\"persons\":\"undefined\"}],\"table_id\":\"\",\"orders_table_text\":\"\",\"items\":[{\"food_menu_id\":\"2\",\"is_print\":\"1\",\"is_kot_print\":\"1\",\"menu_name\":\"Arabic Fries Nuggets 6Pcs\",\"kitchen_id\":\"\",\"kitchen_name\":\"\",\"is_free\":\"0\",\"rounding_amount_hidden\":\"0\",\"item_vat\":[],\"menu_discount_value\":\"\",\"discount_type\":\"fixed\",\"menu_price_without_discount\":\"450.00\",\"menu_unit_price\":\"450.00\",\"qty\":\"1\",\"tmp_qty\":\"undefined\",\"p_qty\":\"undefined\",\"item_previous_id\":\"\",\"item_cooking_done_time\":\"\",\"item_cooking_start_time\":\"\",\"item_cooking_status\":\"\",\"item_type\":\"\",\"menu_price_with_discount\":\"450.00\",\"item_discount_amount\":\"0.00\",\"modifiers_id\":\"\",\"modifiers_name\":\"\",\"modifiers_price\":\"\",\"modifier_vat\":\"\",\"item_note\":\"\",\"discount_reason\":\"\",\"menu_combo_items\":\"\"}],\"payment_method_type\":\"1\",\"paid_amount\":\"450.00\",\"due_amount\":\"0.00\",\"is_multi_currency\":\"\",\"multi_currency\":\"\",\"multi_currency_rate\":\"\",\"multi_currency_amount\":\"\",\"payment_object\":\"\\\"[{\\\\\\\"payment_id\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"payment_name\\\\\\\":\\\\\\\"Cash\\\\\\\",\\\\\\\"usage_point\\\\\\\":\\\\\\\"450\\\\\\\",\\\\\\\"amount\\\\\\\":\\\\\\\"450.00\\\\\\\"}]\\\"\",\"paid_date_time\":\"2026-02-03 12:01:31 AM\",\"send_sms_status\":\"\"}', '2026-02-03 02:01:32', 1),
(2, '1', 'aAK260203-003', 1, 550, 550, 0, NULL, NULL, 0, 550, 1, '00:00:00', NULL, 0, 550, 0, 0, 'service', '', '', 0, 0, '', 'percentage', '2026-02-03', '2026-02-02 21:08:57', '00:08:57', NULL, NULL, 'Yes', 1, 3, 1, 1, 3, 1, 'Live', 'AQtDaGV6enkgQml0ZQIIMzIxMzI1ODcDEzIwMjYtMDItMDNUMDI6MDg6NTQEBjU1MC4wMAUEMC4wMA==', 1, 1000, 450, '[]', 1, 'Pfnw3LWw6mr4ZZY', 1, 0, NULL, 'Pending', NULL, 0, NULL, 'Pending', 0, NULL, NULL, '', NULL, 0, NULL, NULL, '', '{\"sale_no\":\"aAK260203-003\",\"is_merge\":\"\",\"is_online_order\":\"\",\"edit_sale_id\":\"0\",\"waiter_app_status\":\"No\",\"hidden_given_amount\":\"1000\",\"hidden_change_amount\":\"450.00\",\"counter_id\":\"1\",\"counter_name\":\"01\",\"random_code\":\"Pfnw3LWw6mr4ZZY\",\"token_number\":\"\",\"customer_id\":\"1\",\"customer_address\":\"\",\"customer_gst_number\":\"\",\"status\":\"Pending\",\"user_name\":\"Admin User\",\"user_id\":\"1\",\"zatca_invoice_value\":\"AQtDaGV6enkgQml0ZQIIMzIxMzI1ODcDEzIwMjYtMDItMDNUMDI6MDg6NTQEBjU1MC4wMAUEMC4wMA==\",\"customer_name\":\"Walk-in Customer \",\"delivery_partner_id\":\"\",\"self_order_table_id\":\"0\",\"self_order_table_person\":\"undefined\",\"rounding_amount_hidden\":\"0.00\",\"previous_due_tmp\":\"0\",\"waiter_id\":\"3\",\"waiter_name\":\"Ds Waiter\",\"open_invoice_date_hidden\":\"2026-02-03\",\"total_items_in_cart\":\"1\",\"total_items_in_cart_qty\":\"1\",\"sub_total\":\"550.00\",\"sale_date\":\"2026-02-03\",\"date_time\":\"2026-02-03 12:08:57 AM\",\"order_time\":\"12:08:57 AM\",\"charge_type\":\"service\",\"total_vat\":\"0.00\",\"total_payable\":\"550.00\",\"total_item_discount_amount\":\"0.00\",\"sub_total_with_discount\":\"550.00\",\"sub_total_discount_amount\":\"0.00\",\"total_discount_amount\":\"0.00\",\"delivery_charge\":\"\",\"tips_amount\":\"\",\"delivery_charge_actual_charge\":\"\",\"tips_amount_actual_charge\":\"0.00\",\"sub_total_discount_value\":\"\",\"sub_total_discount_type\":\"percentage\",\"order_type\":\"1\",\"order_status\":3,\"sale_vat_objects\":[],\"orders_table\":[{\"table_id\":\"\",\"persons\":\"undefined\"}],\"table_id\":\"\",\"orders_table_text\":\"\",\"items\":[{\"food_menu_id\":\"4\",\"is_print\":\"1\",\"is_kot_print\":\"1\",\"menu_name\":\"Fully Loaded Fries\",\"kitchen_id\":\"\",\"kitchen_name\":\"\",\"is_free\":\"0\",\"rounding_amount_hidden\":\"0\",\"item_vat\":[],\"menu_discount_value\":\"\",\"discount_type\":\"fixed\",\"menu_price_without_discount\":\"550.00\",\"menu_unit_price\":\"550.00\",\"qty\":\"1\",\"tmp_qty\":\"undefined\",\"p_qty\":\"undefined\",\"item_previous_id\":\"\",\"item_cooking_done_time\":\"\",\"item_cooking_start_time\":\"\",\"item_cooking_status\":\"\",\"item_type\":\"\",\"menu_price_with_discount\":\"550.00\",\"item_discount_amount\":\"0.00\",\"modifiers_id\":\"\",\"modifiers_name\":\"\",\"modifiers_price\":\"\",\"modifier_vat\":\"\",\"item_note\":\"\",\"discount_reason\":\"\",\"menu_combo_items\":\"\"}],\"payment_method_type\":\"1\",\"paid_amount\":\"550.00\",\"due_amount\":\"0.00\",\"is_multi_currency\":\"\",\"multi_currency\":\"\",\"multi_currency_rate\":\"\",\"multi_currency_amount\":\"\",\"payment_object\":\"\\\"[{\\\\\\\"payment_id\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"payment_name\\\\\\\":\\\\\\\"Cash\\\\\\\",\\\\\\\"usage_point\\\\\\\":\\\\\\\"550\\\\\\\",\\\\\\\"amount\\\\\\\":\\\\\\\"550.00\\\\\\\"}]\\\"\",\"paid_date_time\":\"2026-02-03 12:09:41 AM\",\"send_sms_status\":\"\"}', '2026-02-03 02:09:52', 1),
(3, '1', 'aJQ260203-004', 3, 1550, 1550, 0, NULL, NULL, 0, 1550, 1, '00:00:00', NULL, 0, 1550, 0, 0, 'service', '', '', 0, 0, '', 'percentage', '2026-02-03', '2026-02-03 06:57:48', '09:57:48', NULL, NULL, 'Yes', 1, 3, 1, 1, 3, 1, 'Live', 'AQtDaGV6enkgQml0ZQIIMzIxMzI1ODcDEzIwMjYtMDItMDNUMTE6NTc6NDYEBzE1NTAuMDAFBDAuMDA=', 1, 2000, 450, '[]', 1, 'SuzLwZism8JgbtT', 1, 0, NULL, 'Pending', NULL, 0, NULL, 'Pending', 0, NULL, NULL, 'Table 1', NULL, 0, NULL, NULL, '', '{\"sale_no\":\"aJQ260203-004\",\"is_merge\":\"\",\"is_online_order\":\"\",\"edit_sale_id\":\"0\",\"waiter_app_status\":\"No\",\"hidden_given_amount\":\"2000\",\"hidden_change_amount\":\"450.00\",\"counter_id\":\"1\",\"counter_name\":\"01\",\"random_code\":\"SuzLwZism8JgbtT\",\"token_number\":\"\",\"customer_id\":\"1\",\"customer_address\":\"\",\"customer_gst_number\":\"\",\"status\":\"Pending\",\"user_name\":\"Admin User\",\"user_id\":\"1\",\"zatca_invoice_value\":\"AQtDaGV6enkgQml0ZQIIMzIxMzI1ODcDEzIwMjYtMDItMDNUMTE6NTc6NDYEBzE1NTAuMDAFBDAuMDA=\",\"customer_name\":\"Walk-in Customer \",\"delivery_partner_id\":\"\",\"self_order_table_id\":\"0\",\"self_order_table_person\":\"undefined\",\"rounding_amount_hidden\":\"0.00\",\"previous_due_tmp\":\"0\",\"waiter_id\":\"3\",\"waiter_name\":\"Ds Waiter\",\"open_invoice_date_hidden\":\"2026-02-03\",\"total_items_in_cart\":\"3\",\"total_items_in_cart_qty\":\"3\",\"sub_total\":\"1550.00\",\"sale_date\":\"2026-02-03\",\"date_time\":\"2026-02-03 9:57:48 AM\",\"order_time\":\"9:57:48 AM\",\"charge_type\":\"service\",\"total_vat\":\"0.00\",\"total_payable\":\"1550.00\",\"total_item_discount_amount\":\"0.00\",\"sub_total_with_discount\":\"1550.00\",\"sub_total_discount_amount\":\"0.00\",\"total_discount_amount\":\"0.00\",\"delivery_charge\":\"\",\"tips_amount\":\"\",\"delivery_charge_actual_charge\":\"\",\"tips_amount_actual_charge\":\"0.00\",\"sub_total_discount_value\":\"\",\"sub_total_discount_type\":\"percentage\",\"order_type\":\"1\",\"order_status\":3,\"sale_vat_objects\":[],\"orders_table\":[{\"table_id\":\"1\",\"persons\":\"4\"}],\"table_id\":\"1\",\"orders_table_text\":\"Table 1\",\"items\":[{\"food_menu_id\":\"5\",\"is_print\":\"1\",\"is_kot_print\":\"1\",\"menu_name\":\"Cheese Fries\",\"kitchen_id\":\"\",\"kitchen_name\":\"\",\"is_free\":\"0\",\"rounding_amount_hidden\":\"0\",\"item_vat\":[],\"menu_discount_value\":\"\",\"discount_type\":\"fixed\",\"menu_price_without_discount\":\"450.00\",\"menu_unit_price\":\"450.00\",\"qty\":\"1\",\"tmp_qty\":\"undefined\",\"p_qty\":\"undefined\",\"item_previous_id\":\"\",\"item_cooking_done_time\":\"\",\"item_cooking_start_time\":\"\",\"item_cooking_status\":\"\",\"item_type\":\"\",\"menu_price_with_discount\":\"450.00\",\"item_discount_amount\":\"0.00\",\"modifiers_id\":\"\",\"modifiers_name\":\"\",\"modifiers_price\":\"\",\"modifier_vat\":\"\",\"item_note\":\"\",\"discount_reason\":\"\",\"menu_combo_items\":\"\"},{\"food_menu_id\":\"9\",\"is_print\":\"1\",\"is_kot_print\":\"1\",\"menu_name\":\"Cheese Ball 4Pcs\",\"kitchen_id\":\"\",\"kitchen_name\":\"\",\"is_free\":\"0\",\"rounding_amount_hidden\":\"0\",\"item_vat\":[],\"menu_discount_value\":\"\",\"discount_type\":\"fixed\",\"menu_price_without_discount\":\"650.00\",\"menu_unit_price\":\"650.00\",\"qty\":\"1\",\"tmp_qty\":\"undefined\",\"p_qty\":\"undefined\",\"item_previous_id\":\"\",\"item_cooking_done_time\":\"\",\"item_cooking_start_time\":\"\",\"item_cooking_status\":\"\",\"item_type\":\"\",\"menu_price_with_discount\":\"650.00\",\"item_discount_amount\":\"0.00\",\"modifiers_id\":\"\",\"modifiers_name\":\"\",\"modifiers_price\":\"\",\"modifier_vat\":\"\",\"item_note\":\"\",\"discount_reason\":\"\",\"menu_combo_items\":\"\"},{\"food_menu_id\":\"2\",\"is_print\":\"1\",\"is_kot_print\":\"1\",\"menu_name\":\"Arabic Fries Nuggets 6Pcs\",\"kitchen_id\":\"\",\"kitchen_name\":\"\",\"is_free\":\"0\",\"rounding_amount_hidden\":\"0\",\"item_vat\":[],\"menu_discount_value\":\"\",\"discount_type\":\"fixed\",\"menu_price_without_discount\":\"450.00\",\"menu_unit_price\":\"450.00\",\"qty\":\"1\",\"tmp_qty\":\"undefined\",\"p_qty\":\"undefined\",\"item_previous_id\":\"\",\"item_cooking_done_time\":\"\",\"item_cooking_start_time\":\"\",\"item_cooking_status\":\"\",\"item_type\":\"\",\"menu_price_with_discount\":\"450.00\",\"item_discount_amount\":\"0.00\",\"modifiers_id\":\"\",\"modifiers_name\":\"\",\"modifiers_price\":\"\",\"modifier_vat\":\"\",\"item_note\":\"\",\"discount_reason\":\"\",\"menu_combo_items\":\"\"}],\"payment_method_type\":\"1\",\"paid_amount\":\"1550.00\",\"due_amount\":\"0.00\",\"is_multi_currency\":\"\",\"multi_currency\":\"\",\"multi_currency_rate\":\"\",\"multi_currency_amount\":\"\",\"payment_object\":\"\\\"[{\\\\\\\"payment_id\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"payment_name\\\\\\\":\\\\\\\"Cash\\\\\\\",\\\\\\\"usage_point\\\\\\\":\\\\\\\"1550\\\\\\\",\\\\\\\"amount\\\\\\\":\\\\\\\"1550.00\\\\\\\"}]\\\"\",\"paid_date_time\":\"2026-02-03 9:58:18 AM\",\"send_sms_status\":\"\"}', '2026-02-03 11:58:24', 1),
(4, '1', 'aJQ260203-006', 1, 2000, 2000, 0, NULL, NULL, 0, 2000, 1, '00:00:00', NULL, 0, 2000, 0, 0, 'service', '', '', 0, 0, '', 'percentage', '2026-02-03', '2026-02-03 07:12:12', '10:12:12', NULL, NULL, 'No', 1, 3, 1, 1, 3, 1, 'Live', 'AQtDaGV6enkgQml0ZQIIMzIxMzI1ODcDEzIwMjYtMDItMDNUMTI6MTI6MDkEBzIwMDAuMDAFBDAuMDA=', 1, 2000, 0, '[]', 1, 'fGz6NTzICV1cEds', 1, 0, NULL, 'Pending', NULL, 0, NULL, 'Pending', 0, NULL, NULL, '', NULL, 0, NULL, NULL, '', '{\"sale_no\":\"aJQ260203-006\",\"is_merge\":\"\",\"is_online_order\":\"\",\"edit_sale_id\":\"0\",\"waiter_app_status\":\"No\",\"hidden_given_amount\":\"2000\",\"hidden_change_amount\":\"0.00\",\"counter_id\":\"1\",\"counter_name\":\"01\",\"random_code\":\"fGz6NTzICV1cEds\",\"token_number\":\"\",\"customer_id\":\"1\",\"customer_address\":\"\",\"customer_gst_number\":\"\",\"status\":\"Pending\",\"user_name\":\"Admin User\",\"user_id\":\"1\",\"zatca_invoice_value\":\"AQtDaGV6enkgQml0ZQIIMzIxMzI1ODcDEzIwMjYtMDItMDNUMTI6MTI6MDkEBzIwMDAuMDAFBDAuMDA=\",\"customer_name\":\"Walk-in Customer \",\"delivery_partner_id\":\"\",\"self_order_table_id\":\"0\",\"self_order_table_person\":\"undefined\",\"rounding_amount_hidden\":\"0.00\",\"previous_due_tmp\":\"0\",\"waiter_id\":\"3\",\"waiter_name\":\"Ds Waiter\",\"open_invoice_date_hidden\":\"2026-02-03\",\"total_items_in_cart\":\"1\",\"total_items_in_cart_qty\":\"1\",\"sub_total\":\"2000.00\",\"sale_date\":\"2026-02-03\",\"date_time\":\"2026-02-03 10:12:12 AM\",\"order_time\":\"10:12:12 AM\",\"charge_type\":\"service\",\"total_vat\":\"0.00\",\"total_payable\":\"2000.00\",\"total_item_discount_amount\":\"0.00\",\"sub_total_with_discount\":\"2000.00\",\"sub_total_discount_amount\":\"0.00\",\"total_discount_amount\":\"0.00\",\"delivery_charge\":\"\",\"tips_amount\":\"\",\"delivery_charge_actual_charge\":\"\",\"tips_amount_actual_charge\":\"0.00\",\"sub_total_discount_value\":\"\",\"sub_total_discount_type\":\"percentage\",\"order_type\":\"1\",\"order_status\":3,\"sale_vat_objects\":[],\"orders_table\":[{\"table_id\":\"\",\"persons\":\"undefined\"}],\"table_id\":\"\",\"orders_table_text\":\"\",\"items\":[{\"food_menu_id\":\"139\",\"is_print\":\"1\",\"is_kot_print\":\"1\",\"menu_name\":\"Calzone Pizza Extra Large\",\"kitchen_id\":\"\",\"kitchen_name\":\"\",\"is_free\":\"0\",\"rounding_amount_hidden\":\"0\",\"item_vat\":[],\"menu_discount_value\":\"\",\"discount_type\":\"fixed\",\"menu_price_without_discount\":\"2000.00\",\"menu_unit_price\":\"2000.00\",\"qty\":\"1\",\"tmp_qty\":\"undefined\",\"p_qty\":\"undefined\",\"item_previous_id\":\"\",\"item_cooking_done_time\":\"\",\"item_cooking_start_time\":\"\",\"item_cooking_status\":\"\",\"item_type\":\"\",\"menu_price_with_discount\":\"2000.00\",\"item_discount_amount\":\"0.00\",\"modifiers_id\":\"\",\"modifiers_name\":\"\",\"modifiers_price\":\"\",\"modifier_vat\":\"\",\"item_note\":\"\",\"discount_reason\":\"\",\"menu_combo_items\":\"\"}],\"payment_method_type\":\"1\",\"paid_amount\":\"2000.00\",\"due_amount\":\"0.00\",\"is_multi_currency\":\"\",\"multi_currency\":\"\",\"multi_currency_rate\":\"\",\"multi_currency_amount\":\"\",\"payment_object\":\"\\\"[{\\\\\\\"payment_id\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"payment_name\\\\\\\":\\\\\\\"Cash\\\\\\\",\\\\\\\"usage_point\\\\\\\":\\\\\\\"2000\\\\\\\",\\\\\\\"amount\\\\\\\":\\\\\\\"2000.00\\\\\\\"}]\\\"\",\"paid_date_time\":\"2026-02-03 10:15:56 AM\",\"send_sms_status\":\"\"}', '2026-02-03 12:16:00', 1),
(5, '1', 'aJQ260203-005', 1, 700, 700, 0, NULL, NULL, 0, 700, 1, '00:00:00', NULL, 0, 700, 0, 0, 'service', '', '', 0, 0, '', 'percentage', '2026-02-03', '2026-02-03 07:02:08', '10:02:08', NULL, NULL, 'No', 1, 3, 1, 1, 3, 1, 'Live', 'AQtDaGV6enkgQml0ZQIIMzIxMzI1ODcDEzIwMjYtMDItMDNUMTI6MDI6MDUEBjcwMC4wMAUEMC4wMA==', 1, 700, 0, '[]', 1, '2wHnxol7wuaIE86', 1, 0, NULL, 'Pending', NULL, 0, NULL, 'Pending', 0, NULL, NULL, '', NULL, 0, NULL, NULL, '', '{\"sale_no\":\"aJQ260203-005\",\"is_merge\":\"\",\"is_online_order\":\"\",\"edit_sale_id\":\"0\",\"waiter_app_status\":\"No\",\"hidden_given_amount\":\"700\",\"hidden_change_amount\":\"0.00\",\"counter_id\":\"1\",\"counter_name\":\"01\",\"random_code\":\"2wHnxol7wuaIE86\",\"token_number\":\"\",\"customer_id\":\"1\",\"customer_address\":\"\",\"customer_gst_number\":\"\",\"status\":\"Pending\",\"user_name\":\"Admin User\",\"user_id\":\"1\",\"zatca_invoice_value\":\"AQtDaGV6enkgQml0ZQIIMzIxMzI1ODcDEzIwMjYtMDItMDNUMTI6MDI6MDUEBjcwMC4wMAUEMC4wMA==\",\"customer_name\":\"Walk-in Customer \",\"delivery_partner_id\":\"\",\"self_order_table_id\":\"0\",\"self_order_table_person\":\"undefined\",\"rounding_amount_hidden\":\"0.00\",\"previous_due_tmp\":\"0\",\"waiter_id\":\"3\",\"waiter_name\":\"Ds Waiter\",\"open_invoice_date_hidden\":\"2026-02-03\",\"total_items_in_cart\":\"1\",\"total_items_in_cart_qty\":\"1\",\"sub_total\":\"700.00\",\"sale_date\":\"2026-02-03\",\"date_time\":\"2026-02-03 10:02:08 AM\",\"order_time\":\"10:02:08 AM\",\"charge_type\":\"service\",\"total_vat\":\"0.00\",\"total_payable\":\"700.00\",\"total_item_discount_amount\":\"0.00\",\"sub_total_with_discount\":\"700.00\",\"sub_total_discount_amount\":\"0.00\",\"total_discount_amount\":\"0.00\",\"delivery_charge\":\"\",\"tips_amount\":\"\",\"delivery_charge_actual_charge\":\"\",\"tips_amount_actual_charge\":\"0.00\",\"sub_total_discount_value\":\"\",\"sub_total_discount_type\":\"percentage\",\"order_type\":\"1\",\"order_status\":3,\"sale_vat_objects\":[],\"orders_table\":[{\"table_id\":\"\",\"persons\":\"undefined\"}],\"table_id\":\"\",\"orders_table_text\":\"\",\"items\":[{\"food_menu_id\":\"136\",\"is_print\":\"1\",\"is_kot_print\":\"1\",\"menu_name\":\"Calzone Pizza Small\",\"kitchen_id\":\"\",\"kitchen_name\":\"\",\"is_free\":\"0\",\"rounding_amount_hidden\":\"0\",\"item_vat\":[],\"menu_discount_value\":\"\",\"discount_type\":\"fixed\",\"menu_price_without_discount\":\"600.00\",\"menu_unit_price\":\"600.00\",\"qty\":\"1\",\"tmp_qty\":\"undefined\",\"p_qty\":\"undefined\",\"item_previous_id\":\"\",\"item_cooking_done_time\":\"\",\"item_cooking_start_time\":\"\",\"item_cooking_status\":\"\",\"item_type\":\"\",\"menu_price_with_discount\":\"600.00\",\"item_discount_amount\":\"0.00\",\"modifiers_id\":\"1\",\"modifiers_name\":\"Extra Topping 100\",\"modifiers_price\":\"100.00\",\"modifier_vat\":\"[]\",\"item_note\":\"\",\"discount_reason\":\"\",\"menu_combo_items\":\"\"}],\"payment_method_type\":\"1\",\"paid_amount\":\"700.00\",\"due_amount\":\"0.00\",\"is_multi_currency\":\"\",\"multi_currency\":\"\",\"multi_currency_rate\":\"\",\"multi_currency_amount\":\"\",\"payment_object\":\"\\\"[{\\\\\\\"payment_id\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"payment_name\\\\\\\":\\\\\\\"Cash\\\\\\\",\\\\\\\"usage_point\\\\\\\":\\\\\\\"700\\\\\\\",\\\\\\\"amount\\\\\\\":\\\\\\\"700.00\\\\\\\"}]\\\"\",\"paid_date_time\":\"2026-02-03 10:16:21 AM\",\"send_sms_status\":\"\"}', '2026-02-03 12:16:23', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sales_details`
--

CREATE TABLE `tbl_sales_details` (
  `id` bigint NOT NULL,
  `food_menu_id` int DEFAULT NULL,
  `menu_name` varchar(250) DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `tmp_qty` int DEFAULT NULL,
  `menu_price_without_discount` float NOT NULL,
  `menu_price_with_discount` float NOT NULL,
  `menu_unit_price` float NOT NULL,
  `menu_vat_percentage` float NOT NULL,
  `menu_taxes` text,
  `menu_discount_value` varchar(20) DEFAULT NULL,
  `discount_type` varchar(20) NOT NULL,
  `menu_note` varchar(150) DEFAULT NULL,
  `menu_combo_items` text,
  `discount_amount` double DEFAULT NULL,
  `item_type` varchar(50) DEFAULT NULL,
  `cooking_status` varchar(30) DEFAULT NULL,
  `cooking_start_time` varchar(30) DEFAULT '',
  `cooking_done_time` varchar(30) DEFAULT '',
  `previous_id` bigint NOT NULL,
  `loyalty_point_earn` float DEFAULT '0',
  `sales_id` int DEFAULT NULL,
  `order_status` tinyint(1) NOT NULL COMMENT '1=new order,2=invoiced order, 3=closed order',
  `user_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `is_free_item` int NOT NULL DEFAULT '0',
  `del_status` varchar(50) DEFAULT 'Live',
  `discount_reason` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_sales_details`
--

INSERT INTO `tbl_sales_details` (`id`, `food_menu_id`, `menu_name`, `qty`, `tmp_qty`, `menu_price_without_discount`, `menu_price_with_discount`, `menu_unit_price`, `menu_vat_percentage`, `menu_taxes`, `menu_discount_value`, `discount_type`, `menu_note`, `menu_combo_items`, `discount_amount`, `item_type`, `cooking_status`, `cooking_start_time`, `cooking_done_time`, `previous_id`, `loyalty_point_earn`, `sales_id`, `order_status`, `user_id`, `outlet_id`, `is_free_item`, `del_status`, `discount_reason`) VALUES
(1, 2, ' Arabic Fries Nuggets (6Pcs)', 1, 1, 450, 450, 450, 0, '[]', '', 'fixed', '', '', 0, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 1, 0, 1, 1, 0, 'Live', ''),
(3, 4, ' Fully Loaded Fries', 1, 1, 550, 550, 550, 0, '[]', '', 'fixed', '', '', 0, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 0, 2, 0, 1, 1, 0, 'Live', ''),
(7, 5, ' Cheese Fries', 1, 1, 450, 450, 450, 0, '[]', '', 'fixed', '', '', 0, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 7, 0, 3, 0, 1, 1, 0, 'Live', ''),
(8, 9, ' Cheese Ball (4Pcs)', 1, 1, 650, 650, 650, 0, '[]', '', 'fixed', '', '', 0, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 8, 0, 3, 0, 1, 1, 0, 'Live', ''),
(9, 2, ' Arabic Fries Nuggets (6Pcs)', 1, 1, 450, 450, 450, 0, '[]', '', 'fixed', '', '', 0, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 9, 0, 3, 0, 1, 1, 0, 'Live', ''),
(10, 139, 'Calzone Pizza Extra Large', 1, 1, 2000, 2000, 2000, 0, '[]', '', 'fixed', '', '', 0, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 10, 0, 4, 0, 1, 1, 0, 'Live', ''),
(11, 136, 'Calzone Pizza Small', 1, 1, 600, 600, 600, 0, '[]', '', 'fixed', '', '', 0, 'Kitchen Item', NULL, '2026-02-03 12:11:06', '2026-02-03 12:11:12', 11, 0, 5, 0, 1, 1, 0, 'Live', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sales_details_modifiers`
--

CREATE TABLE `tbl_sales_details_modifiers` (
  `id` bigint NOT NULL,
  `modifier_id` int NOT NULL,
  `modifier_price` float NOT NULL,
  `food_menu_id` int NOT NULL,
  `sales_id` int NOT NULL,
  `order_status` tinyint(1) NOT NULL COMMENT '1=new order,2=invoiced order, 3=closed order',
  `sales_details_id` int NOT NULL,
  `menu_vat_percentage` float DEFAULT NULL,
  `menu_taxes` text,
  `user_id` int NOT NULL,
  `outlet_id` int NOT NULL,
  `customer_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_sales_details_modifiers`
--

INSERT INTO `tbl_sales_details_modifiers` (`id`, `modifier_id`, `modifier_price`, `food_menu_id`, `sales_id`, `order_status`, `sales_details_id`, `menu_vat_percentage`, `menu_taxes`, `user_id`, `outlet_id`, `customer_id`) VALUES
(1, 1, 100, 136, 5, 0, 11, NULL, '[]', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sale_consumptions`
--

CREATE TABLE `tbl_sale_consumptions` (
  `id` bigint NOT NULL,
  `sale_id` int DEFAULT NULL,
  `order_status` tinyint(1) NOT NULL COMMENT '1=new order,2=invoiced order, 3=closed order',
  `user_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_sale_consumptions`
--

INSERT INTO `tbl_sale_consumptions` (`id`, `sale_id`, `order_status`, `user_id`, `outlet_id`, `del_status`) VALUES
(1, 1, 0, 1, 1, 'Live'),
(3, 2, 0, 1, 1, 'Live'),
(5, 3, 0, 1, 1, 'Live'),
(6, 4, 0, 1, 1, 'Live'),
(7, 5, 0, 1, 1, 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sale_consumptions_of_menus`
--

CREATE TABLE `tbl_sale_consumptions_of_menus` (
  `id` bigint NOT NULL,
  `ingredient_id` int DEFAULT NULL,
  `consumption` float DEFAULT NULL,
  `sale_consumption_id` int DEFAULT NULL,
  `sales_id` int NOT NULL,
  `order_status` tinyint(1) NOT NULL COMMENT '1=new order,2=invoiced order, 3=closed order',
  `food_menu_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live',
  `cost` float DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `production_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sale_consumptions_of_modifiers_of_menus`
--

CREATE TABLE `tbl_sale_consumptions_of_modifiers_of_menus` (
  `id` bigint NOT NULL,
  `ingredient_id` int DEFAULT NULL,
  `consumption` float DEFAULT NULL,
  `sale_consumption_id` int DEFAULT NULL,
  `sales_id` int NOT NULL,
  `order_status` tinyint(1) NOT NULL COMMENT '1=new order,2=invoiced order, 3=closed order',
  `food_menu_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live',
  `cost` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sale_payments`
--

CREATE TABLE `tbl_sale_payments` (
  `id` int NOT NULL,
  `payment_id` int DEFAULT NULL,
  `currency_type` int DEFAULT NULL,
  `loyalty_rate` float DEFAULT NULL,
  `multi_currency` varchar(10) DEFAULT NULL,
  `multi_currency_rate` float DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `usage_point` float DEFAULT NULL,
  `sale_id` int DEFAULT NULL,
  `date_time` timestamp NULL DEFAULT NULL,
  `del_status` varchar(20) NOT NULL DEFAULT 'Live',
  `counter_id` int NOT NULL DEFAULT '0',
  `user_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `payment_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_sale_payments`
--

INSERT INTO `tbl_sale_payments` (`id`, `payment_id`, `currency_type`, `loyalty_rate`, `multi_currency`, `multi_currency_rate`, `amount`, `usage_point`, `sale_id`, `date_time`, `del_status`, `counter_id`, `user_id`, `outlet_id`, `payment_name`) VALUES
(1, 1, NULL, NULL, NULL, NULL, 450, NULL, 1, '2026-02-02 21:00:41', 'Live', 1, 1, 1, 'Cash'),
(3, 1, NULL, NULL, NULL, NULL, 550, NULL, 2, '2026-02-02 21:08:57', 'Live', 1, 1, 1, 'Cash'),
(5, 1, NULL, NULL, NULL, NULL, 1550, NULL, 3, '2026-02-03 06:57:48', 'Live', 1, 1, 1, 'Cash'),
(6, 1, NULL, NULL, NULL, NULL, 2000, NULL, 4, '2026-02-03 07:12:12', 'Live', 1, 1, 1, 'Cash'),
(7, 1, NULL, NULL, NULL, NULL, 700, NULL, 5, '2026-02-03 07:02:08', 'Live', 1, 1, 1, 'Cash');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sessions`
--

CREATE TABLE `tbl_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_sessions`
--

INSERT INTO `tbl_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('71c3a616aa3531ef98000c012b882c5b68d87633', '127.0.0.1', 1770101517, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737303130313531373b73797374656d5f76657273696f6e5f6e756d6265727c733a333a22372e36223b776c627c693a313b66756e6374696f6e5f6163636573737c613a3334343a7b693a303b733a383a22766965772d333730223b693a313b733a323a222d30223b693a323b733a33333a22616c6c5f73657474696e675f7265736572766174696f6e5f6f726465722d333638223b693a333b733a323a222d30223b693a343b733a32383a22616c6c5f73657474696e675f6f6e6c696e655f6f726465722d333636223b693a353b733a323a222d30223b693a363b733a32353a22616c6c5f73657474696e675f73656c5f6f726465722d333634223b693a373b733a323a222d30223b693a383b733a383a22766965772d333632223b693a393b733a323a222d30223b693a31303b733a31353a22616c6c5f73657474696e672d333538223b693a31313b733a323a222d30223b693a31323b733a31303a2264656c6574652d333533223b693a31333b733a383a22766965772d333533223b693a31343b733a31303a227570646174652d333533223b693a31353b733a373a226164642d333533223b693a31363b733a323a222d30223b693a31373b733a393a22706f735f32352d3733223b693a31383b733a393a2272657365742d333530223b693a31393b733a323a222d30223b693a32303b733a383a22766965772d333436223b693a32313b733a323a222d30223b693a32323b733a31363a22766965775f64657461696c732d333430223b693a32333b733a31303a2264656c6574652d333430223b693a32343b733a383a22766965772d333430223b693a32353b733a31303a227570646174652d333430223b693a32363b733a373a226164642d333430223b693a32373b733a323a222d30223b693a32383b733a31373a22736f7274696e67466f72504f532d323239223b693a32393b733a383a22766965772d333337223b693a33303b733a323a222d30223b693a33313b733a383a22766965772d333332223b693a33323b733a323a222d30223b693a33333b733a31303a227570646174652d333330223b693a33343b733a323a222d30223b693a33353b733a31303a2264656c6574652d333235223b693a33363b733a383a22766965772d333235223b693a33373b733a31303a227570646174652d333235223b693a33383b733a373a226164642d333235223b693a33393b733a323a222d30223b693a34303b733a383a22766965772d333231223b693a34313b733a323a222d30223b693a34323b733a31343a22646561637469766174652d333136223b693a34333b733a31323a2261637469766174652d333136223b693a34343b733a31303a2264656c6574652d333136223b693a34353b733a383a22766965772d333136223b693a34363b733a323a222d30223b693a34373b733a383a22766965772d333134223b693a34383b733a323a222d30223b693a34393b733a383a22766965772d333130223b693a35303b733a31333a22636865636b5f6f75742d333130223b693a35313b733a31323a22636865636b5f696e2d333130223b693a35323b733a323a222d30223b693a35333b733a31313a22736f7274696e672d323630223b693a35343b733a383a22766965772d333037223b693a35353b733a323a222d30223b693a35363b733a31393a2272657365744461696c7953616c65732d313233223b693a35373b733a32303a226578706f72744461696c7953616c65732d313233223b693a35383b733a32373a226368616e67655f64656c69766572795f616464726573732d313233223b693a35393b733a31303a227570646174652d333032223b693a36303b733a323a222d30223b693a36313b733a31303a227570646174652d333030223b693a36323b733a323a222d30223b693a36333b733a31303a227570646174652d323938223b693a36343b733a323a222d30223b693a36353b733a31343a22646561637469766174652d323931223b693a36363b733a31323a2261637469766174652d323931223b693a36373b733a31303a2264656c6574652d323931223b693a36383b733a383a22766965772d323931223b693a36393b733a31303a227570646174652d323931223b693a37303b733a373a226164642d323931223b693a37313b733a323a222d30223b693a37323b733a383a22636f70792d323835223b693a37333b733a31303a2264656c6574652d323835223b693a37343b733a383a22766965772d323835223b693a37353b733a31303a227570646174652d323835223b693a37363b733a373a226164642d323835223b693a37373b733a323a222d30223b693a37383b733a31303a2264656c6574652d323830223b693a37393b733a383a22766965772d323830223b693a38303b733a31303a227570646174652d323830223b693a38313b733a373a226164642d323830223b693a38323b733a323a222d30223b693a38333b733a31303a2264656c6574652d323735223b693a38343b733a383a22766965772d323735223b693a38353b733a31303a227570646174652d323735223b693a38363b733a373a226164642d323735223b693a38373b733a323a222d30223b693a38383b733a31303a2264656c6574652d323730223b693a38393b733a383a22766965772d323730223b693a39303b733a31303a227570646174652d323730223b693a39313b733a373a226164642d323730223b693a39323b733a323a222d30223b693a39333b733a31303a2264656c6574652d323635223b693a39343b733a383a22766965772d323635223b693a39353b733a31303a227570646174652d323635223b693a39363b733a373a226164642d323635223b693a39373b733a323a222d30223b693a39383b733a31303a2264656c6574652d323630223b693a39393b733a383a22766965772d323630223b693a3130303b733a31303a227570646174652d323630223b693a3130313b733a373a226164642d323630223b693a3130323b733a323a222d30223b693a3130333b733a31303a2264656c6574652d323535223b693a3130343b733a383a22766965772d323535223b693a3130353b733a31303a227570646174652d323535223b693a3130363b733a373a226164642d323535223b693a3130373b733a323a222d30223b693a3130383b733a31393a2275706c6f61645f637573746f6d65722d323439223b693a3130393b733a31303a2264656c6574652d323439223b693a3131303b733a383a22766965772d323439223b693a3131313b733a31303a227570646174652d323439223b693a3131323b733a373a226164642d323439223b693a3131333b733a323a222d30223b693a3131343b733a31303a2264656c6574652d323434223b693a3131353b733a383a22766965772d323434223b693a3131363b733a31303a227570646174652d323434223b693a3131373b733a373a226164642d323434223b693a3131383b733a323a222d30223b693a3131393b733a31363a226974656d5f626172636f64652d323334223b693a3132303b733a33323a2275706c6f61645f666f6f645f6d656e755f696e6772656469656e74732d323334223b693a3132313b733a32303a2275706c6f61645f666f6f645f6d656e752d323334223b693a3132323b733a31393a2261737369676e5f6d6f6469666965722d323334223b693a3132333b733a31363a22766965775f64657461696c732d323334223b693a3132343b733a31303a2264656c6574652d323334223b693a3132353b733a383a22766965772d323334223b693a3132363b733a31303a227570646174652d323334223b693a3132373b733a373a226164642d323334223b693a3132383b733a323a222d30223b693a3132393b733a31303a2264656c6574652d323239223b693a3133303b733a383a22766965772d323239223b693a3133313b733a31303a227570646174652d323239223b693a3133323b733a373a226164642d323239223b693a3133333b733a323a222d30223b693a3133343b733a31363a22766965775f64657461696c732d323233223b693a3133353b733a31303a2264656c6574652d323233223b693a3133363b733a383a22766965772d323233223b693a3133373b733a31303a227570646174652d323233223b693a3133383b733a373a226164642d323233223b693a3133393b733a323a222d30223b693a3134303b733a32313a2275706c6f61645f696e6772656469656e742d323137223b693a3134313b733a31303a2264656c6574652d323137223b693a3134323b733a383a22766965772d323137223b693a3134333b733a31303a227570646174652d323137223b693a3134343b733a373a226164642d323137223b693a3134353b733a323a222d30223b693a3134363b733a31303a2264656c6574652d323132223b693a3134373b733a383a22766965772d323132223b693a3134383b733a31303a227570646174652d323132223b693a3134393b733a373a226164642d323132223b693a3135303b733a323a222d30223b693a3135313b733a31303a2264656c6574652d323037223b693a3135323b733a383a22766965772d323037223b693a3135333b733a31303a227570646174652d323037223b693a3135343b733a373a226164642d323037223b693a3135353b733a323a222d30223b693a3135363b733a383a22766965772d323035223b693a3135373b733a323a222d30223b693a3135383b733a383a22766965772d323033223b693a3135393b733a323a222d30223b693a3136303b733a383a22766965772d323031223b693a3136313b733a323a222d30223b693a3136323b733a383a22766965772d313939223b693a3136333b733a323a222d30223b693a3136343b733a383a22766965772d313937223b693a3136353b733a323a222d30223b693a3136363b733a383a22766965772d313935223b693a3136373b733a323a222d30223b693a3136383b733a383a22766965772d313933223b693a3136393b733a323a222d30223b693a3137303b733a383a22766965772d313931223b693a3137313b733a323a222d30223b693a3137323b733a383a22766965772d313839223b693a3137333b733a323a222d30223b693a3137343b733a383a22766965772d313837223b693a3137353b733a323a222d30223b693a3137363b733a383a22766965772d313835223b693a3137373b733a323a222d30223b693a3137383b733a383a22766965772d313833223b693a3137393b733a323a222d30223b693a3138303b733a383a22766965772d313831223b693a3138313b733a323a222d30223b693a3138323b733a383a22766965772d313739223b693a3138333b733a323a222d30223b693a3138343b733a383a22766965772d313735223b693a3138353b733a323a222d30223b693a3138363b733a383a22766965772d313733223b693a3138373b733a323a222d30223b693a3138383b733a383a22766965772d313731223b693a3138393b733a323a222d30223b693a3139303b733a383a22766965772d313639223b693a3139313b733a323a222d30223b693a3139323b733a383a22766965772d313637223b693a3139333b733a323a222d30223b693a3139343b733a383a22766965772d313635223b693a3139353b733a323a222d30223b693a3139363b733a383a22766965772d313633223b693a3139373b733a323a222d30223b693a3139383b733a383a22766965772d313631223b693a3139393b733a323a222d30223b693a3230303b733a383a22766965772d313539223b693a3230313b733a323a222d30223b693a3230323b733a31303a2264656c6574652d313535223b693a3230333b733a383a22766965772d313535223b693a3230343b733a373a226164642d313535223b693a3230353b733a323a222d30223b693a3230363b733a31303a2264656c6574652d313531223b693a3230373b733a383a22766965772d313531223b693a3230383b733a373a226164642d313531223b693a3230393b733a323a222d30223b693a3231303b733a31303a2264656c6574652d313437223b693a3231313b733a383a22766965772d313437223b693a3231323b733a373a226164642d313437223b693a3231333b733a323a222d30223b693a3231343b733a31303a2264656c6574652d313432223b693a3231353b733a383a22766965772d313432223b693a3231363b733a31303a227570646174652d313432223b693a3231373b733a373a226164642d313432223b693a3231383b733a323a222d30223b693a3231393b733a31363a22766965775f64657461696c732d313337223b693a3232303b733a31303a2264656c6574652d313337223b693a3232313b733a383a22766965772d313337223b693a3232323b733a373a226164642d313337223b693a3232333b733a323a222d30223b693a3232343b733a31363a22766965775f64657461696c732d313331223b693a3232353b733a31303a2264656c6574652d313331223b693a3232363b733a383a22766965772d313331223b693a3232373b733a31303a227570646174652d313331223b693a3232383b733a373a226164642d313331223b693a3232393b733a323a222d30223b693a3233303b733a383a22766965772d313239223b693a3233313b733a323a222d30223b693a3233323b733a31303a2264656c6574652d313233223b693a3233333b733a31363a22766965775f696e766f6963652d313233223b693a3233343b733a31303a22726566756e642d313233223b693a3233353b733a383a22766965772d313233223b693a3233363b733a323a222d30223b693a3233373b733a31303a2264656c6574652d313138223b693a3233383b733a383a22766965772d313138223b693a3233393b733a31303a227570646174652d313138223b693a3234303b733a373a226164642d313138223b693a3234313b733a323a222d30223b693a3234323b733a31363a22766965775f64657461696c732d313132223b693a3234333b733a31303a2264656c6574652d313132223b693a3234343b733a383a22766965772d313132223b693a3234353b733a31303a227570646174652d313132223b693a3234363b733a373a226164642d313132223b693a3234373b733a323a222d30223b693a3234383b733a31363a22766965775f64657461696c732d313036223b693a3234393b733a31303a2264656c6574652d313036223b693a3235303b733a383a22766965772d313036223b693a3235313b733a31303a227570646174652d313036223b693a3235323b733a373a226164642d313036223b693a3235333b733a323a222d30223b693a3235343b733a383a22766965772d313034223b693a3235353b733a323a222d30223b693a3235363b733a383a22656e7465722d3938223b693a3235373b733a393a2264656c6574652d3938223b693a3235383b733a373a22766965772d3938223b693a3235393b733a393a227570646174652d3938223b693a3236303b733a363a226164642d3938223b693a3236313b733a323a222d30223b693a3236323b733a393a22706f735f32332d3733223b693a3236333b733a393a22706f735f32322d3733223b693a3236343b733a393a22706f735f32312d3733223b693a3236353b733a393a22706f735f32302d3733223b693a3236363b733a393a22706f735f31392d3733223b693a3236373b733a393a22706f735f31382d3733223b693a3236383b733a393a22706f735f31372d3733223b693a3236393b733a393a22706f735f31362d3733223b693a3237303b733a393a22706f735f31352d3733223b693a3237313b733a393a22706f735f31342d3733223b693a3237323b733a393a22706f735f31332d3733223b693a3237333b733a393a22706f735f31322d3733223b693a3237343b733a393a22706f735f31312d3733223b693a3237353b733a393a22706f735f31302d3733223b693a3237363b733a383a22706f735f392d3733223b693a3237373b733a383a22706f735f382d3733223b693a3237383b733a383a22706f735f372d3733223b693a3237393b733a383a22706f735f362d3733223b693a3238303b733a383a22706f735f352d3733223b693a3238313b733a383a22706f735f342d3733223b693a3238323b733a383a22706f735f332d3733223b693a3238333b733a383a22706f735f322d3733223b693a3238343b733a383a22706f735f312d3733223b693a3238353b733a323a222d30223b693a3238363b733a383a22656e7465722d3637223b693a3238373b733a393a2264656c6574652d3637223b693a3238383b733a373a22766965772d3637223b693a3238393b733a393a227570646174652d3637223b693a3239303b733a363a226164642d3637223b693a3239313b733a323a222d30223b693a3239323b733a393a227570646174652d3634223b693a3239333b733a323a222d30223b693a3239343b733a31323a22756e696e7374616c6c2d3632223b693a3239353b733a323a222d30223b693a3239363b733a393a227570646174652d3630223b693a3239373b733a323a222d30223b693a3239383b733a393a2264656c6574652d3535223b693a3239393b733a373a22766965772d3535223b693a3330303b733a393a227570646174652d3535223b693a3330313b733a363a226164642d3535223b693a3330323b733a323a222d30223b693a3330333b733a31333a227570646174655f7461782d3532223b693a3330343b733a323a222d30223b693a3330353b733a393a227570646174652d3439223b693a3330363b733a323a222d30223b693a3330373b733a393a2264656c6574652d3335223b693a3330383b733a373a22766965772d3335223b693a3330393b733a393a227570646174652d3335223b693a3331303b733a363a226164642d3335223b693a3331313b733a323a222d30223b693a3331323b733a393a227570646174652d3331223b693a3331333b733a373a22766965772d3331223b693a3331343b733a323a222d30223b693a3331353b733a393a2264656c6574652d3236223b693a3331363b733a373a22766965772d3236223b693a3331373b733a393a227570646174652d3236223b693a3331383b733a363a226164642d3236223b693a3331393b733a323a222d30223b693a3332303b733a393a2264656c6574652d3232223b693a3332313b733a373a22766965772d3232223b693a3332323b733a363a226164642d3232223b693a3332333b733a323a222d30223b693a3332343b733a31373a22626c6f636b5f616c6c5f757365722d3135223b693a3332353b733a31353a2273686f775f6f75746c6574732d3135223b693a3332363b733a393a2264656c6574652d3135223b693a3332373b733a373a22766965772d3135223b693a3332383b733a393a227570646174652d3135223b693a3332393b733a363a226164642d3135223b693a3333303b733a323a222d30223b693a3333313b733a393a227570646174652d3132223b693a3333323b733a373a22766965772d3132223b693a3333333b733a323a222d30223b693a3333343b733a383a227570646174652d39223b693a3333353b733a363a22766965772d39223b693a3333363b733a323a222d30223b693a3333373b733a383a227570646174652d36223b693a3333383b733a323a222d30223b693a3333393b733a383a227570646174652d33223b693a3334303b733a363a22766965772d33223b693a3334313b733a323a222d30223b693a3334323b733a363a22766965772d31223b693a3334333b733a323a222d30223b7d757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b64657369676e6174696f6e7c733a31313a2253757065722041646d696e223b66756c6c5f6e616d657c733a31303a2241646d696e2055736572223b73686f72745f6e616d657c733a313a2261223b70686f6e657c733a32363a22303331332d343336373431372020303334382d35353637343137223b656d61696c5f616464726573737c733a32353a226164696b68616e6f6666696369616c40676d61696c2e636f6d223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b73657373696f6e5f6f75746c6574737c733a313a2232223b6163746976655f6d656e755f746d707c733a303a22223b63757272656e63797c733a333a22504b52223b7a6f6e655f6e616d657c733a31323a22417369612f4b617261636869223b646174655f666f726d61747c733a353a22592f6d2f64223b627573696e6573735f6e616d657c733a33323a22436865657a792042697465204d412d4d412026616d703b616d703b20536f6e73223b776562736974657c733a31303a22666972656170702e6363223b63757272656e63795f706f736974696f6e7c733a31333a224265666f726520416d6f756e74223b707265636973696f6e7c733a313a2232223b64656661756c745f637573746f6d65727c733a313a2231223b6578706f72745f6461696c795f73616c657c733a363a22656e61626c65223b736572766963655f616d6f756e747c733a303a22223b74616b655f617761795f736572766963655f6368617267657c733a303a22223b64656c69766572795f616d6f756e747c733a303a22223b7461785f747970657c733a313a2231223b646563696d616c735f736570617261746f727c733a313a222e223b74686f7573616e64735f736570617261746f727c733a313a222c223b6f70656e5f636173685f6472617765725f7768656e5f7072696e74696e675f696e766f6963657c733a323a224e6f223b7768656e5f636c69636b696e675f6f6e5f6974656d5f696e5f706f737c733a313a2232223b69735f726f756e64696e675f656e61626c657c733a313a2230223b617474656e64616e63655f747970657c733a313a2232223b64656661756c745f6f726465725f747970657c733a313a2231223b69735f6c6f79616c74795f656e61626c657c733a373a2264697361626c65223b7072655f6f725f706f73745f7061796d656e747c733a313a2231223b6d696e696d756d5f706f696e745f746f5f72656465656d7c733a313a2230223b6c6f79616c74795f726174657c733a333a22302e31223b73706c69745f62696c6c7c733a313a2231223b706c6163655f6f726465725f746f6f6c7469707c733a343a2273686f77223b666f6f645f6d656e755f746f6f6c7469707c733a343a2273686f77223b7461626c655f62675f636f6c6f727c733a31303a227461626c655f62675f31223b6b6f745f7072696e745f6f6e6c696e655f73656c665f6f726465727c733a313a2231223b64656661756c745f7061796d656e747c733a313a2231223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b6c616e67756167655f6d616e69666573746f7c733a393a22726576686762726576223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f7469746c657c733a31313a224c6f63616c205461786573223b7461785f726567697374726174696f6e5f6e6f7c733a383a223332313332353837223b7461785f69735f6773747c733a323a224e6f223b6170706c795f6f6e5f64656c69766572795f6368617267657c733a313a2231223b73746174655f636f64657c733a373a2230393331323332223b6c6f67696e5f747970657c733a313a2231223b5f5f63695f766172737c613a333a7b733a31313a22657863657074696f6e5f32223b733a333a226f6c64223b733a393a22657863657074696f6e223b733a333a226f6c64223b733a31313a22657863657074696f6e5f33223b733a333a226f6c64223b7d6f75746c65745f6e616d657c733a31313a224368657a7a792042697465223b616464726573737c733a35323a22436865657a792042697465204d412d4d412026616d703b20536f6e732020506c617a6120536861682044657261692c2053776174223b656d61696c7c733a303a22223b6f6e6c696e655f6f726465725f6d6f64756c657c733a313a2232223b64656661756c745f7761697465727c733a313a2233223b6163746976655f7374617475737c733a363a22616374697665223b64656661756c745f6f726465725f747970655f64656c69766572795f707c733a303a22223b736d735f73656e645f6175746f7c733a313a2231223b73686f775f6f726465725f66756c6c5f73686f72747c733a313a2231223b6f6e6c696e655f73656c65637465645f6f75746c65747c733a313a2231223b696e766f6963655f6c6f676f7c733a33373a2237353861646564383439306236356465626361613133353137343731316431392e6a706567223b736974655f6e616d657c733a34343a224f6e6c696e65204f72646572206f6620436865657a792042697465204d412d4d412026616d703b20536f6e73223b666f6f7465727c733a34363a224f6e6c696e65204f72646572206f6620436865657a792042697465204d412d4d412026616d703b20536f6e730d0a223b73797374656d5f6c6f676f7c733a33373a2263396663303536343963623433393039393936376131633766346235306262612e6a706567223b66617669636f6e7c733a33373a2265323739303065656463626265326433653536613031383761666637376331352e6a706567223b776562736974655f7468656d655f636f6c6f727c733a373a2223643766663066223b6f75746c65745f69647c733a313a2231223b69735f7761697465727c733a323a224e6f223b636f756e7465725f69647c733a313a2231223b636f756e7465725f6e616d657c733a323a223031223b7072696e7465725f69647c733a313a2231223b62696c6c5f7072696e7465725f69647c733a313a2231223b706174687c733a303a22223b7469746c657c733a373a225072696e746572223b747970657c733a303a22223b636861726163746572735f7065725f6c696e657c733a313a2230223b7072696e7465725f69705f616464726573737c733a303a22223b7072696e7465725f706f72747c733a303a22223b7072696e74696e675f63686f6963657c733a31373a227765625f62726f777365725f706f707570223b697076666f75725f616464726573737c733a303a22223b7072696e745f666f726d61747c733a383a224e6f205072696e74223b696e765f71725f636f64655f656e61626c655f7374617475737c733a373a2244697361626c65223b706174685f62696c6c7c733a303a22223b7469746c655f62696c6c7c733a373a225072696e746572223b747970655f62696c6c7c733a303a22223b636861726163746572735f7065725f6c696e655f62696c6c7c733a313a2230223b7072696e7465725f69705f616464726573735f62696c6c7c733a303a22223b7072696e7465725f706f72745f62696c6c7c733a303a22223b7072696e74696e675f63686f6963655f62696c6c7c733a31373a227765625f62726f777365725f706f707570223b697076666f75725f616464726573735f62696c6c7c733a303a22223b7072696e745f666f726d61745f62696c6c7c733a383a224e6f205072696e74223b696e765f71725f636f64655f656e61626c655f7374617475735f62696c6c7c733a373a2244697361626c65223b),
('481a6253a05ff19083d76aa2a1eb68f2a9e63b7c', '127.0.0.1', 1770101839, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737303130313833393b73797374656d5f76657273696f6e5f6e756d6265727c733a333a22372e36223b776c627c693a313b66756e6374696f6e5f6163636573737c613a3334343a7b693a303b733a383a22766965772d333730223b693a313b733a323a222d30223b693a323b733a33333a22616c6c5f73657474696e675f7265736572766174696f6e5f6f726465722d333638223b693a333b733a323a222d30223b693a343b733a32383a22616c6c5f73657474696e675f6f6e6c696e655f6f726465722d333636223b693a353b733a323a222d30223b693a363b733a32353a22616c6c5f73657474696e675f73656c5f6f726465722d333634223b693a373b733a323a222d30223b693a383b733a383a22766965772d333632223b693a393b733a323a222d30223b693a31303b733a31353a22616c6c5f73657474696e672d333538223b693a31313b733a323a222d30223b693a31323b733a31303a2264656c6574652d333533223b693a31333b733a383a22766965772d333533223b693a31343b733a31303a227570646174652d333533223b693a31353b733a373a226164642d333533223b693a31363b733a323a222d30223b693a31373b733a393a22706f735f32352d3733223b693a31383b733a393a2272657365742d333530223b693a31393b733a323a222d30223b693a32303b733a383a22766965772d333436223b693a32313b733a323a222d30223b693a32323b733a31363a22766965775f64657461696c732d333430223b693a32333b733a31303a2264656c6574652d333430223b693a32343b733a383a22766965772d333430223b693a32353b733a31303a227570646174652d333430223b693a32363b733a373a226164642d333430223b693a32373b733a323a222d30223b693a32383b733a31373a22736f7274696e67466f72504f532d323239223b693a32393b733a383a22766965772d333337223b693a33303b733a323a222d30223b693a33313b733a383a22766965772d333332223b693a33323b733a323a222d30223b693a33333b733a31303a227570646174652d333330223b693a33343b733a323a222d30223b693a33353b733a31303a2264656c6574652d333235223b693a33363b733a383a22766965772d333235223b693a33373b733a31303a227570646174652d333235223b693a33383b733a373a226164642d333235223b693a33393b733a323a222d30223b693a34303b733a383a22766965772d333231223b693a34313b733a323a222d30223b693a34323b733a31343a22646561637469766174652d333136223b693a34333b733a31323a2261637469766174652d333136223b693a34343b733a31303a2264656c6574652d333136223b693a34353b733a383a22766965772d333136223b693a34363b733a323a222d30223b693a34373b733a383a22766965772d333134223b693a34383b733a323a222d30223b693a34393b733a383a22766965772d333130223b693a35303b733a31333a22636865636b5f6f75742d333130223b693a35313b733a31323a22636865636b5f696e2d333130223b693a35323b733a323a222d30223b693a35333b733a31313a22736f7274696e672d323630223b693a35343b733a383a22766965772d333037223b693a35353b733a323a222d30223b693a35363b733a31393a2272657365744461696c7953616c65732d313233223b693a35373b733a32303a226578706f72744461696c7953616c65732d313233223b693a35383b733a32373a226368616e67655f64656c69766572795f616464726573732d313233223b693a35393b733a31303a227570646174652d333032223b693a36303b733a323a222d30223b693a36313b733a31303a227570646174652d333030223b693a36323b733a323a222d30223b693a36333b733a31303a227570646174652d323938223b693a36343b733a323a222d30223b693a36353b733a31343a22646561637469766174652d323931223b693a36363b733a31323a2261637469766174652d323931223b693a36373b733a31303a2264656c6574652d323931223b693a36383b733a383a22766965772d323931223b693a36393b733a31303a227570646174652d323931223b693a37303b733a373a226164642d323931223b693a37313b733a323a222d30223b693a37323b733a383a22636f70792d323835223b693a37333b733a31303a2264656c6574652d323835223b693a37343b733a383a22766965772d323835223b693a37353b733a31303a227570646174652d323835223b693a37363b733a373a226164642d323835223b693a37373b733a323a222d30223b693a37383b733a31303a2264656c6574652d323830223b693a37393b733a383a22766965772d323830223b693a38303b733a31303a227570646174652d323830223b693a38313b733a373a226164642d323830223b693a38323b733a323a222d30223b693a38333b733a31303a2264656c6574652d323735223b693a38343b733a383a22766965772d323735223b693a38353b733a31303a227570646174652d323735223b693a38363b733a373a226164642d323735223b693a38373b733a323a222d30223b693a38383b733a31303a2264656c6574652d323730223b693a38393b733a383a22766965772d323730223b693a39303b733a31303a227570646174652d323730223b693a39313b733a373a226164642d323730223b693a39323b733a323a222d30223b693a39333b733a31303a2264656c6574652d323635223b693a39343b733a383a22766965772d323635223b693a39353b733a31303a227570646174652d323635223b693a39363b733a373a226164642d323635223b693a39373b733a323a222d30223b693a39383b733a31303a2264656c6574652d323630223b693a39393b733a383a22766965772d323630223b693a3130303b733a31303a227570646174652d323630223b693a3130313b733a373a226164642d323630223b693a3130323b733a323a222d30223b693a3130333b733a31303a2264656c6574652d323535223b693a3130343b733a383a22766965772d323535223b693a3130353b733a31303a227570646174652d323535223b693a3130363b733a373a226164642d323535223b693a3130373b733a323a222d30223b693a3130383b733a31393a2275706c6f61645f637573746f6d65722d323439223b693a3130393b733a31303a2264656c6574652d323439223b693a3131303b733a383a22766965772d323439223b693a3131313b733a31303a227570646174652d323439223b693a3131323b733a373a226164642d323439223b693a3131333b733a323a222d30223b693a3131343b733a31303a2264656c6574652d323434223b693a3131353b733a383a22766965772d323434223b693a3131363b733a31303a227570646174652d323434223b693a3131373b733a373a226164642d323434223b693a3131383b733a323a222d30223b693a3131393b733a31363a226974656d5f626172636f64652d323334223b693a3132303b733a33323a2275706c6f61645f666f6f645f6d656e755f696e6772656469656e74732d323334223b693a3132313b733a32303a2275706c6f61645f666f6f645f6d656e752d323334223b693a3132323b733a31393a2261737369676e5f6d6f6469666965722d323334223b693a3132333b733a31363a22766965775f64657461696c732d323334223b693a3132343b733a31303a2264656c6574652d323334223b693a3132353b733a383a22766965772d323334223b693a3132363b733a31303a227570646174652d323334223b693a3132373b733a373a226164642d323334223b693a3132383b733a323a222d30223b693a3132393b733a31303a2264656c6574652d323239223b693a3133303b733a383a22766965772d323239223b693a3133313b733a31303a227570646174652d323239223b693a3133323b733a373a226164642d323239223b693a3133333b733a323a222d30223b693a3133343b733a31363a22766965775f64657461696c732d323233223b693a3133353b733a31303a2264656c6574652d323233223b693a3133363b733a383a22766965772d323233223b693a3133373b733a31303a227570646174652d323233223b693a3133383b733a373a226164642d323233223b693a3133393b733a323a222d30223b693a3134303b733a32313a2275706c6f61645f696e6772656469656e742d323137223b693a3134313b733a31303a2264656c6574652d323137223b693a3134323b733a383a22766965772d323137223b693a3134333b733a31303a227570646174652d323137223b693a3134343b733a373a226164642d323137223b693a3134353b733a323a222d30223b693a3134363b733a31303a2264656c6574652d323132223b693a3134373b733a383a22766965772d323132223b693a3134383b733a31303a227570646174652d323132223b693a3134393b733a373a226164642d323132223b693a3135303b733a323a222d30223b693a3135313b733a31303a2264656c6574652d323037223b693a3135323b733a383a22766965772d323037223b693a3135333b733a31303a227570646174652d323037223b693a3135343b733a373a226164642d323037223b693a3135353b733a323a222d30223b693a3135363b733a383a22766965772d323035223b693a3135373b733a323a222d30223b693a3135383b733a383a22766965772d323033223b693a3135393b733a323a222d30223b693a3136303b733a383a22766965772d323031223b693a3136313b733a323a222d30223b693a3136323b733a383a22766965772d313939223b693a3136333b733a323a222d30223b693a3136343b733a383a22766965772d313937223b693a3136353b733a323a222d30223b693a3136363b733a383a22766965772d313935223b693a3136373b733a323a222d30223b693a3136383b733a383a22766965772d313933223b693a3136393b733a323a222d30223b693a3137303b733a383a22766965772d313931223b693a3137313b733a323a222d30223b693a3137323b733a383a22766965772d313839223b693a3137333b733a323a222d30223b693a3137343b733a383a22766965772d313837223b693a3137353b733a323a222d30223b693a3137363b733a383a22766965772d313835223b693a3137373b733a323a222d30223b693a3137383b733a383a22766965772d313833223b693a3137393b733a323a222d30223b693a3138303b733a383a22766965772d313831223b693a3138313b733a323a222d30223b693a3138323b733a383a22766965772d313739223b693a3138333b733a323a222d30223b693a3138343b733a383a22766965772d313735223b693a3138353b733a323a222d30223b693a3138363b733a383a22766965772d313733223b693a3138373b733a323a222d30223b693a3138383b733a383a22766965772d313731223b693a3138393b733a323a222d30223b693a3139303b733a383a22766965772d313639223b693a3139313b733a323a222d30223b693a3139323b733a383a22766965772d313637223b693a3139333b733a323a222d30223b693a3139343b733a383a22766965772d313635223b693a3139353b733a323a222d30223b693a3139363b733a383a22766965772d313633223b693a3139373b733a323a222d30223b693a3139383b733a383a22766965772d313631223b693a3139393b733a323a222d30223b693a3230303b733a383a22766965772d313539223b693a3230313b733a323a222d30223b693a3230323b733a31303a2264656c6574652d313535223b693a3230333b733a383a22766965772d313535223b693a3230343b733a373a226164642d313535223b693a3230353b733a323a222d30223b693a3230363b733a31303a2264656c6574652d313531223b693a3230373b733a383a22766965772d313531223b693a3230383b733a373a226164642d313531223b693a3230393b733a323a222d30223b693a3231303b733a31303a2264656c6574652d313437223b693a3231313b733a383a22766965772d313437223b693a3231323b733a373a226164642d313437223b693a3231333b733a323a222d30223b693a3231343b733a31303a2264656c6574652d313432223b693a3231353b733a383a22766965772d313432223b693a3231363b733a31303a227570646174652d313432223b693a3231373b733a373a226164642d313432223b693a3231383b733a323a222d30223b693a3231393b733a31363a22766965775f64657461696c732d313337223b693a3232303b733a31303a2264656c6574652d313337223b693a3232313b733a383a22766965772d313337223b693a3232323b733a373a226164642d313337223b693a3232333b733a323a222d30223b693a3232343b733a31363a22766965775f64657461696c732d313331223b693a3232353b733a31303a2264656c6574652d313331223b693a3232363b733a383a22766965772d313331223b693a3232373b733a31303a227570646174652d313331223b693a3232383b733a373a226164642d313331223b693a3232393b733a323a222d30223b693a3233303b733a383a22766965772d313239223b693a3233313b733a323a222d30223b693a3233323b733a31303a2264656c6574652d313233223b693a3233333b733a31363a22766965775f696e766f6963652d313233223b693a3233343b733a31303a22726566756e642d313233223b693a3233353b733a383a22766965772d313233223b693a3233363b733a323a222d30223b693a3233373b733a31303a2264656c6574652d313138223b693a3233383b733a383a22766965772d313138223b693a3233393b733a31303a227570646174652d313138223b693a3234303b733a373a226164642d313138223b693a3234313b733a323a222d30223b693a3234323b733a31363a22766965775f64657461696c732d313132223b693a3234333b733a31303a2264656c6574652d313132223b693a3234343b733a383a22766965772d313132223b693a3234353b733a31303a227570646174652d313132223b693a3234363b733a373a226164642d313132223b693a3234373b733a323a222d30223b693a3234383b733a31363a22766965775f64657461696c732d313036223b693a3234393b733a31303a2264656c6574652d313036223b693a3235303b733a383a22766965772d313036223b693a3235313b733a31303a227570646174652d313036223b693a3235323b733a373a226164642d313036223b693a3235333b733a323a222d30223b693a3235343b733a383a22766965772d313034223b693a3235353b733a323a222d30223b693a3235363b733a383a22656e7465722d3938223b693a3235373b733a393a2264656c6574652d3938223b693a3235383b733a373a22766965772d3938223b693a3235393b733a393a227570646174652d3938223b693a3236303b733a363a226164642d3938223b693a3236313b733a323a222d30223b693a3236323b733a393a22706f735f32332d3733223b693a3236333b733a393a22706f735f32322d3733223b693a3236343b733a393a22706f735f32312d3733223b693a3236353b733a393a22706f735f32302d3733223b693a3236363b733a393a22706f735f31392d3733223b693a3236373b733a393a22706f735f31382d3733223b693a3236383b733a393a22706f735f31372d3733223b693a3236393b733a393a22706f735f31362d3733223b693a3237303b733a393a22706f735f31352d3733223b693a3237313b733a393a22706f735f31342d3733223b693a3237323b733a393a22706f735f31332d3733223b693a3237333b733a393a22706f735f31322d3733223b693a3237343b733a393a22706f735f31312d3733223b693a3237353b733a393a22706f735f31302d3733223b693a3237363b733a383a22706f735f392d3733223b693a3237373b733a383a22706f735f382d3733223b693a3237383b733a383a22706f735f372d3733223b693a3237393b733a383a22706f735f362d3733223b693a3238303b733a383a22706f735f352d3733223b693a3238313b733a383a22706f735f342d3733223b693a3238323b733a383a22706f735f332d3733223b693a3238333b733a383a22706f735f322d3733223b693a3238343b733a383a22706f735f312d3733223b693a3238353b733a323a222d30223b693a3238363b733a383a22656e7465722d3637223b693a3238373b733a393a2264656c6574652d3637223b693a3238383b733a373a22766965772d3637223b693a3238393b733a393a227570646174652d3637223b693a3239303b733a363a226164642d3637223b693a3239313b733a323a222d30223b693a3239323b733a393a227570646174652d3634223b693a3239333b733a323a222d30223b693a3239343b733a31323a22756e696e7374616c6c2d3632223b693a3239353b733a323a222d30223b693a3239363b733a393a227570646174652d3630223b693a3239373b733a323a222d30223b693a3239383b733a393a2264656c6574652d3535223b693a3239393b733a373a22766965772d3535223b693a3330303b733a393a227570646174652d3535223b693a3330313b733a363a226164642d3535223b693a3330323b733a323a222d30223b693a3330333b733a31333a227570646174655f7461782d3532223b693a3330343b733a323a222d30223b693a3330353b733a393a227570646174652d3439223b693a3330363b733a323a222d30223b693a3330373b733a393a2264656c6574652d3335223b693a3330383b733a373a22766965772d3335223b693a3330393b733a393a227570646174652d3335223b693a3331303b733a363a226164642d3335223b693a3331313b733a323a222d30223b693a3331323b733a393a227570646174652d3331223b693a3331333b733a373a22766965772d3331223b693a3331343b733a323a222d30223b693a3331353b733a393a2264656c6574652d3236223b693a3331363b733a373a22766965772d3236223b693a3331373b733a393a227570646174652d3236223b693a3331383b733a363a226164642d3236223b693a3331393b733a323a222d30223b693a3332303b733a393a2264656c6574652d3232223b693a3332313b733a373a22766965772d3232223b693a3332323b733a363a226164642d3232223b693a3332333b733a323a222d30223b693a3332343b733a31373a22626c6f636b5f616c6c5f757365722d3135223b693a3332353b733a31353a2273686f775f6f75746c6574732d3135223b693a3332363b733a393a2264656c6574652d3135223b693a3332373b733a373a22766965772d3135223b693a3332383b733a393a227570646174652d3135223b693a3332393b733a363a226164642d3135223b693a3333303b733a323a222d30223b693a3333313b733a393a227570646174652d3132223b693a3333323b733a373a22766965772d3132223b693a3333333b733a323a222d30223b693a3333343b733a383a227570646174652d39223b693a3333353b733a363a22766965772d39223b693a3333363b733a323a222d30223b693a3333373b733a383a227570646174652d36223b693a3333383b733a323a222d30223b693a3333393b733a383a227570646174652d33223b693a3334303b733a363a22766965772d33223b693a3334313b733a323a222d30223b693a3334323b733a363a22766965772d31223b693a3334333b733a323a222d30223b7d757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b64657369676e6174696f6e7c733a31313a2253757065722041646d696e223b66756c6c5f6e616d657c733a31303a2241646d696e2055736572223b73686f72745f6e616d657c733a313a2261223b70686f6e657c733a31333a222b393233303635333035323136223b656d61696c5f616464726573737c733a32353a226164696b68616e6f6666696369616c40676d61696c2e636f6d223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b73657373696f6e5f6f75746c6574737c733a313a2232223b6163746976655f6d656e755f746d707c733a303a22223b63757272656e63797c733a333a22504b52223b7a6f6e655f6e616d657c733a31323a22417369612f4b617261636869223b646174655f666f726d61747c733a353a22592f6d2f64223b627573696e6573735f6e616d657c733a33323a22436865657a792042697465204d412d4d412026616d703b616d703b20536f6e73223b776562736974657c733a31303a22666972656170702e6363223b63757272656e63795f706f736974696f6e7c733a31333a224265666f726520416d6f756e74223b707265636973696f6e7c733a313a2232223b64656661756c745f637573746f6d65727c733a313a2231223b6578706f72745f6461696c795f73616c657c733a363a22656e61626c65223b736572766963655f616d6f756e747c733a303a22223b74616b655f617761795f736572766963655f6368617267657c733a303a22223b64656c69766572795f616d6f756e747c733a303a22223b7461785f747970657c733a313a2231223b646563696d616c735f736570617261746f727c733a313a222e223b74686f7573616e64735f736570617261746f727c733a313a222c223b6f70656e5f636173685f6472617765725f7768656e5f7072696e74696e675f696e766f6963657c733a323a224e6f223b7768656e5f636c69636b696e675f6f6e5f6974656d5f696e5f706f737c733a313a2232223b69735f726f756e64696e675f656e61626c657c733a313a2230223b617474656e64616e63655f747970657c733a313a2232223b64656661756c745f6f726465725f747970657c733a313a2231223b69735f6c6f79616c74795f656e61626c657c733a373a2264697361626c65223b7072655f6f725f706f73745f7061796d656e747c733a313a2231223b6d696e696d756d5f706f696e745f746f5f72656465656d7c733a313a2230223b6c6f79616c74795f726174657c733a333a22302e31223b73706c69745f62696c6c7c733a313a2231223b706c6163655f6f726465725f746f6f6c7469707c733a343a2273686f77223b666f6f645f6d656e755f746f6f6c7469707c733a343a2273686f77223b7461626c655f62675f636f6c6f727c733a31303a227461626c655f62675f31223b6b6f745f7072696e745f6f6e6c696e655f73656c665f6f726465727c733a313a2231223b64656661756c745f7061796d656e747c733a313a2231223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b6c616e67756167655f6d616e69666573746f7c733a393a22726576686762726576223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f7469746c657c733a31313a224c6f63616c205461786573223b7461785f726567697374726174696f6e5f6e6f7c733a383a223332313332353837223b7461785f69735f6773747c733a323a224e6f223b6170706c795f6f6e5f64656c69766572795f6368617267657c733a313a2231223b73746174655f636f64657c733a373a2230393331323332223b6c6f67696e5f747970657c733a313a2231223b5f5f63695f766172737c613a333a7b733a31313a22657863657074696f6e5f32223b733a333a226f6c64223b733a393a22657863657074696f6e223b733a333a226f6c64223b733a31313a22657863657074696f6e5f33223b733a333a226f6c64223b7d6f75746c65745f6e616d657c733a31313a224368657a7a792042697465223b616464726573737c733a35323a22436865657a792042697465204d412d4d412026616d703b20536f6e732020506c617a6120536861682044657261692c2053776174223b656d61696c7c733a303a22223b6f6e6c696e655f6f726465725f6d6f64756c657c733a313a2232223b64656661756c745f7761697465727c733a313a2233223b6163746976655f7374617475737c733a363a22616374697665223b64656661756c745f6f726465725f747970655f64656c69766572795f707c733a303a22223b736d735f73656e645f6175746f7c733a313a2231223b73686f775f6f726465725f66756c6c5f73686f72747c733a313a2231223b6f6e6c696e655f73656c65637465645f6f75746c65747c733a313a2231223b696e766f6963655f6c6f676f7c733a33373a2237353861646564383439306236356465626361613133353137343731316431392e6a706567223b736974655f6e616d657c733a34343a224f6e6c696e65204f72646572206f6620436865657a792042697465204d412d4d412026616d703b20536f6e73223b666f6f7465727c733a34363a224f6e6c696e65204f72646572206f6620436865657a792042697465204d412d4d412026616d703b20536f6e730d0a223b73797374656d5f6c6f676f7c733a33373a2263396663303536343963623433393039393936376131633766346235306262612e6a706567223b66617669636f6e7c733a33373a2265323739303065656463626265326433653536613031383761666637376331352e6a706567223b776562736974655f7468656d655f636f6c6f727c733a373a2223643766663066223b6f75746c65745f69647c733a313a2231223b69735f7761697465727c733a323a224e6f223b636f756e7465725f69647c733a313a2231223b636f756e7465725f6e616d657c733a323a223031223b7072696e7465725f69647c733a313a2231223b62696c6c5f7072696e7465725f69647c733a313a2231223b706174687c733a303a22223b7469746c657c733a373a225072696e746572223b747970657c733a303a22223b636861726163746572735f7065725f6c696e657c733a313a2230223b7072696e7465725f69705f616464726573737c733a303a22223b7072696e7465725f706f72747c733a303a22223b7072696e74696e675f63686f6963657c733a31373a227765625f62726f777365725f706f707570223b697076666f75725f616464726573737c733a303a22223b7072696e745f666f726d61747c733a383a224e6f205072696e74223b696e765f71725f636f64655f656e61626c655f7374617475737c733a373a2244697361626c65223b706174685f62696c6c7c733a303a22223b7469746c655f62696c6c7c733a373a225072696e746572223b747970655f62696c6c7c733a303a22223b636861726163746572735f7065725f6c696e655f62696c6c7c733a313a2230223b7072696e7465725f69705f616464726573735f62696c6c7c733a303a22223b7072696e7465725f706f72745f62696c6c7c733a303a22223b7072696e74696e675f63686f6963655f62696c6c7c733a31373a227765625f62726f777365725f706f707570223b697076666f75725f616464726573735f62696c6c7c733a303a22223b7072696e745f666f726d61745f62696c6c7c733a383a224e6f205072696e74223b696e765f71725f636f64655f656e61626c655f7374617475735f62696c6c7c733a373a2244697361626c65223b6163746976655f6c6f67696e5f627574746f6e7c733a313a2231223b);
INSERT INTO `tbl_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('91e727542719f2d29161964f090ea3d9bd9dde90', '127.0.0.1', 1770102205, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737303130323230353b73797374656d5f76657273696f6e5f6e756d6265727c733a333a22372e36223b776c627c693a313b66756e6374696f6e5f6163636573737c613a3334343a7b693a303b733a383a22766965772d333730223b693a313b733a323a222d30223b693a323b733a33333a22616c6c5f73657474696e675f7265736572766174696f6e5f6f726465722d333638223b693a333b733a323a222d30223b693a343b733a32383a22616c6c5f73657474696e675f6f6e6c696e655f6f726465722d333636223b693a353b733a323a222d30223b693a363b733a32353a22616c6c5f73657474696e675f73656c5f6f726465722d333634223b693a373b733a323a222d30223b693a383b733a383a22766965772d333632223b693a393b733a323a222d30223b693a31303b733a31353a22616c6c5f73657474696e672d333538223b693a31313b733a323a222d30223b693a31323b733a31303a2264656c6574652d333533223b693a31333b733a383a22766965772d333533223b693a31343b733a31303a227570646174652d333533223b693a31353b733a373a226164642d333533223b693a31363b733a323a222d30223b693a31373b733a393a22706f735f32352d3733223b693a31383b733a393a2272657365742d333530223b693a31393b733a323a222d30223b693a32303b733a383a22766965772d333436223b693a32313b733a323a222d30223b693a32323b733a31363a22766965775f64657461696c732d333430223b693a32333b733a31303a2264656c6574652d333430223b693a32343b733a383a22766965772d333430223b693a32353b733a31303a227570646174652d333430223b693a32363b733a373a226164642d333430223b693a32373b733a323a222d30223b693a32383b733a31373a22736f7274696e67466f72504f532d323239223b693a32393b733a383a22766965772d333337223b693a33303b733a323a222d30223b693a33313b733a383a22766965772d333332223b693a33323b733a323a222d30223b693a33333b733a31303a227570646174652d333330223b693a33343b733a323a222d30223b693a33353b733a31303a2264656c6574652d333235223b693a33363b733a383a22766965772d333235223b693a33373b733a31303a227570646174652d333235223b693a33383b733a373a226164642d333235223b693a33393b733a323a222d30223b693a34303b733a383a22766965772d333231223b693a34313b733a323a222d30223b693a34323b733a31343a22646561637469766174652d333136223b693a34333b733a31323a2261637469766174652d333136223b693a34343b733a31303a2264656c6574652d333136223b693a34353b733a383a22766965772d333136223b693a34363b733a323a222d30223b693a34373b733a383a22766965772d333134223b693a34383b733a323a222d30223b693a34393b733a383a22766965772d333130223b693a35303b733a31333a22636865636b5f6f75742d333130223b693a35313b733a31323a22636865636b5f696e2d333130223b693a35323b733a323a222d30223b693a35333b733a31313a22736f7274696e672d323630223b693a35343b733a383a22766965772d333037223b693a35353b733a323a222d30223b693a35363b733a31393a2272657365744461696c7953616c65732d313233223b693a35373b733a32303a226578706f72744461696c7953616c65732d313233223b693a35383b733a32373a226368616e67655f64656c69766572795f616464726573732d313233223b693a35393b733a31303a227570646174652d333032223b693a36303b733a323a222d30223b693a36313b733a31303a227570646174652d333030223b693a36323b733a323a222d30223b693a36333b733a31303a227570646174652d323938223b693a36343b733a323a222d30223b693a36353b733a31343a22646561637469766174652d323931223b693a36363b733a31323a2261637469766174652d323931223b693a36373b733a31303a2264656c6574652d323931223b693a36383b733a383a22766965772d323931223b693a36393b733a31303a227570646174652d323931223b693a37303b733a373a226164642d323931223b693a37313b733a323a222d30223b693a37323b733a383a22636f70792d323835223b693a37333b733a31303a2264656c6574652d323835223b693a37343b733a383a22766965772d323835223b693a37353b733a31303a227570646174652d323835223b693a37363b733a373a226164642d323835223b693a37373b733a323a222d30223b693a37383b733a31303a2264656c6574652d323830223b693a37393b733a383a22766965772d323830223b693a38303b733a31303a227570646174652d323830223b693a38313b733a373a226164642d323830223b693a38323b733a323a222d30223b693a38333b733a31303a2264656c6574652d323735223b693a38343b733a383a22766965772d323735223b693a38353b733a31303a227570646174652d323735223b693a38363b733a373a226164642d323735223b693a38373b733a323a222d30223b693a38383b733a31303a2264656c6574652d323730223b693a38393b733a383a22766965772d323730223b693a39303b733a31303a227570646174652d323730223b693a39313b733a373a226164642d323730223b693a39323b733a323a222d30223b693a39333b733a31303a2264656c6574652d323635223b693a39343b733a383a22766965772d323635223b693a39353b733a31303a227570646174652d323635223b693a39363b733a373a226164642d323635223b693a39373b733a323a222d30223b693a39383b733a31303a2264656c6574652d323630223b693a39393b733a383a22766965772d323630223b693a3130303b733a31303a227570646174652d323630223b693a3130313b733a373a226164642d323630223b693a3130323b733a323a222d30223b693a3130333b733a31303a2264656c6574652d323535223b693a3130343b733a383a22766965772d323535223b693a3130353b733a31303a227570646174652d323535223b693a3130363b733a373a226164642d323535223b693a3130373b733a323a222d30223b693a3130383b733a31393a2275706c6f61645f637573746f6d65722d323439223b693a3130393b733a31303a2264656c6574652d323439223b693a3131303b733a383a22766965772d323439223b693a3131313b733a31303a227570646174652d323439223b693a3131323b733a373a226164642d323439223b693a3131333b733a323a222d30223b693a3131343b733a31303a2264656c6574652d323434223b693a3131353b733a383a22766965772d323434223b693a3131363b733a31303a227570646174652d323434223b693a3131373b733a373a226164642d323434223b693a3131383b733a323a222d30223b693a3131393b733a31363a226974656d5f626172636f64652d323334223b693a3132303b733a33323a2275706c6f61645f666f6f645f6d656e755f696e6772656469656e74732d323334223b693a3132313b733a32303a2275706c6f61645f666f6f645f6d656e752d323334223b693a3132323b733a31393a2261737369676e5f6d6f6469666965722d323334223b693a3132333b733a31363a22766965775f64657461696c732d323334223b693a3132343b733a31303a2264656c6574652d323334223b693a3132353b733a383a22766965772d323334223b693a3132363b733a31303a227570646174652d323334223b693a3132373b733a373a226164642d323334223b693a3132383b733a323a222d30223b693a3132393b733a31303a2264656c6574652d323239223b693a3133303b733a383a22766965772d323239223b693a3133313b733a31303a227570646174652d323239223b693a3133323b733a373a226164642d323239223b693a3133333b733a323a222d30223b693a3133343b733a31363a22766965775f64657461696c732d323233223b693a3133353b733a31303a2264656c6574652d323233223b693a3133363b733a383a22766965772d323233223b693a3133373b733a31303a227570646174652d323233223b693a3133383b733a373a226164642d323233223b693a3133393b733a323a222d30223b693a3134303b733a32313a2275706c6f61645f696e6772656469656e742d323137223b693a3134313b733a31303a2264656c6574652d323137223b693a3134323b733a383a22766965772d323137223b693a3134333b733a31303a227570646174652d323137223b693a3134343b733a373a226164642d323137223b693a3134353b733a323a222d30223b693a3134363b733a31303a2264656c6574652d323132223b693a3134373b733a383a22766965772d323132223b693a3134383b733a31303a227570646174652d323132223b693a3134393b733a373a226164642d323132223b693a3135303b733a323a222d30223b693a3135313b733a31303a2264656c6574652d323037223b693a3135323b733a383a22766965772d323037223b693a3135333b733a31303a227570646174652d323037223b693a3135343b733a373a226164642d323037223b693a3135353b733a323a222d30223b693a3135363b733a383a22766965772d323035223b693a3135373b733a323a222d30223b693a3135383b733a383a22766965772d323033223b693a3135393b733a323a222d30223b693a3136303b733a383a22766965772d323031223b693a3136313b733a323a222d30223b693a3136323b733a383a22766965772d313939223b693a3136333b733a323a222d30223b693a3136343b733a383a22766965772d313937223b693a3136353b733a323a222d30223b693a3136363b733a383a22766965772d313935223b693a3136373b733a323a222d30223b693a3136383b733a383a22766965772d313933223b693a3136393b733a323a222d30223b693a3137303b733a383a22766965772d313931223b693a3137313b733a323a222d30223b693a3137323b733a383a22766965772d313839223b693a3137333b733a323a222d30223b693a3137343b733a383a22766965772d313837223b693a3137353b733a323a222d30223b693a3137363b733a383a22766965772d313835223b693a3137373b733a323a222d30223b693a3137383b733a383a22766965772d313833223b693a3137393b733a323a222d30223b693a3138303b733a383a22766965772d313831223b693a3138313b733a323a222d30223b693a3138323b733a383a22766965772d313739223b693a3138333b733a323a222d30223b693a3138343b733a383a22766965772d313735223b693a3138353b733a323a222d30223b693a3138363b733a383a22766965772d313733223b693a3138373b733a323a222d30223b693a3138383b733a383a22766965772d313731223b693a3138393b733a323a222d30223b693a3139303b733a383a22766965772d313639223b693a3139313b733a323a222d30223b693a3139323b733a383a22766965772d313637223b693a3139333b733a323a222d30223b693a3139343b733a383a22766965772d313635223b693a3139353b733a323a222d30223b693a3139363b733a383a22766965772d313633223b693a3139373b733a323a222d30223b693a3139383b733a383a22766965772d313631223b693a3139393b733a323a222d30223b693a3230303b733a383a22766965772d313539223b693a3230313b733a323a222d30223b693a3230323b733a31303a2264656c6574652d313535223b693a3230333b733a383a22766965772d313535223b693a3230343b733a373a226164642d313535223b693a3230353b733a323a222d30223b693a3230363b733a31303a2264656c6574652d313531223b693a3230373b733a383a22766965772d313531223b693a3230383b733a373a226164642d313531223b693a3230393b733a323a222d30223b693a3231303b733a31303a2264656c6574652d313437223b693a3231313b733a383a22766965772d313437223b693a3231323b733a373a226164642d313437223b693a3231333b733a323a222d30223b693a3231343b733a31303a2264656c6574652d313432223b693a3231353b733a383a22766965772d313432223b693a3231363b733a31303a227570646174652d313432223b693a3231373b733a373a226164642d313432223b693a3231383b733a323a222d30223b693a3231393b733a31363a22766965775f64657461696c732d313337223b693a3232303b733a31303a2264656c6574652d313337223b693a3232313b733a383a22766965772d313337223b693a3232323b733a373a226164642d313337223b693a3232333b733a323a222d30223b693a3232343b733a31363a22766965775f64657461696c732d313331223b693a3232353b733a31303a2264656c6574652d313331223b693a3232363b733a383a22766965772d313331223b693a3232373b733a31303a227570646174652d313331223b693a3232383b733a373a226164642d313331223b693a3232393b733a323a222d30223b693a3233303b733a383a22766965772d313239223b693a3233313b733a323a222d30223b693a3233323b733a31303a2264656c6574652d313233223b693a3233333b733a31363a22766965775f696e766f6963652d313233223b693a3233343b733a31303a22726566756e642d313233223b693a3233353b733a383a22766965772d313233223b693a3233363b733a323a222d30223b693a3233373b733a31303a2264656c6574652d313138223b693a3233383b733a383a22766965772d313138223b693a3233393b733a31303a227570646174652d313138223b693a3234303b733a373a226164642d313138223b693a3234313b733a323a222d30223b693a3234323b733a31363a22766965775f64657461696c732d313132223b693a3234333b733a31303a2264656c6574652d313132223b693a3234343b733a383a22766965772d313132223b693a3234353b733a31303a227570646174652d313132223b693a3234363b733a373a226164642d313132223b693a3234373b733a323a222d30223b693a3234383b733a31363a22766965775f64657461696c732d313036223b693a3234393b733a31303a2264656c6574652d313036223b693a3235303b733a383a22766965772d313036223b693a3235313b733a31303a227570646174652d313036223b693a3235323b733a373a226164642d313036223b693a3235333b733a323a222d30223b693a3235343b733a383a22766965772d313034223b693a3235353b733a323a222d30223b693a3235363b733a383a22656e7465722d3938223b693a3235373b733a393a2264656c6574652d3938223b693a3235383b733a373a22766965772d3938223b693a3235393b733a393a227570646174652d3938223b693a3236303b733a363a226164642d3938223b693a3236313b733a323a222d30223b693a3236323b733a393a22706f735f32332d3733223b693a3236333b733a393a22706f735f32322d3733223b693a3236343b733a393a22706f735f32312d3733223b693a3236353b733a393a22706f735f32302d3733223b693a3236363b733a393a22706f735f31392d3733223b693a3236373b733a393a22706f735f31382d3733223b693a3236383b733a393a22706f735f31372d3733223b693a3236393b733a393a22706f735f31362d3733223b693a3237303b733a393a22706f735f31352d3733223b693a3237313b733a393a22706f735f31342d3733223b693a3237323b733a393a22706f735f31332d3733223b693a3237333b733a393a22706f735f31322d3733223b693a3237343b733a393a22706f735f31312d3733223b693a3237353b733a393a22706f735f31302d3733223b693a3237363b733a383a22706f735f392d3733223b693a3237373b733a383a22706f735f382d3733223b693a3237383b733a383a22706f735f372d3733223b693a3237393b733a383a22706f735f362d3733223b693a3238303b733a383a22706f735f352d3733223b693a3238313b733a383a22706f735f342d3733223b693a3238323b733a383a22706f735f332d3733223b693a3238333b733a383a22706f735f322d3733223b693a3238343b733a383a22706f735f312d3733223b693a3238353b733a323a222d30223b693a3238363b733a383a22656e7465722d3637223b693a3238373b733a393a2264656c6574652d3637223b693a3238383b733a373a22766965772d3637223b693a3238393b733a393a227570646174652d3637223b693a3239303b733a363a226164642d3637223b693a3239313b733a323a222d30223b693a3239323b733a393a227570646174652d3634223b693a3239333b733a323a222d30223b693a3239343b733a31323a22756e696e7374616c6c2d3632223b693a3239353b733a323a222d30223b693a3239363b733a393a227570646174652d3630223b693a3239373b733a323a222d30223b693a3239383b733a393a2264656c6574652d3535223b693a3239393b733a373a22766965772d3535223b693a3330303b733a393a227570646174652d3535223b693a3330313b733a363a226164642d3535223b693a3330323b733a323a222d30223b693a3330333b733a31333a227570646174655f7461782d3532223b693a3330343b733a323a222d30223b693a3330353b733a393a227570646174652d3439223b693a3330363b733a323a222d30223b693a3330373b733a393a2264656c6574652d3335223b693a3330383b733a373a22766965772d3335223b693a3330393b733a393a227570646174652d3335223b693a3331303b733a363a226164642d3335223b693a3331313b733a323a222d30223b693a3331323b733a393a227570646174652d3331223b693a3331333b733a373a22766965772d3331223b693a3331343b733a323a222d30223b693a3331353b733a393a2264656c6574652d3236223b693a3331363b733a373a22766965772d3236223b693a3331373b733a393a227570646174652d3236223b693a3331383b733a363a226164642d3236223b693a3331393b733a323a222d30223b693a3332303b733a393a2264656c6574652d3232223b693a3332313b733a373a22766965772d3232223b693a3332323b733a363a226164642d3232223b693a3332333b733a323a222d30223b693a3332343b733a31373a22626c6f636b5f616c6c5f757365722d3135223b693a3332353b733a31353a2273686f775f6f75746c6574732d3135223b693a3332363b733a393a2264656c6574652d3135223b693a3332373b733a373a22766965772d3135223b693a3332383b733a393a227570646174652d3135223b693a3332393b733a363a226164642d3135223b693a3333303b733a323a222d30223b693a3333313b733a393a227570646174652d3132223b693a3333323b733a373a22766965772d3132223b693a3333333b733a323a222d30223b693a3333343b733a383a227570646174652d39223b693a3333353b733a363a22766965772d39223b693a3333363b733a323a222d30223b693a3333373b733a383a227570646174652d36223b693a3333383b733a323a222d30223b693a3333393b733a383a227570646174652d33223b693a3334303b733a363a22766965772d33223b693a3334313b733a323a222d30223b693a3334323b733a363a22766965772d31223b693a3334333b733a323a222d30223b7d757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b64657369676e6174696f6e7c733a31313a2253757065722041646d696e223b66756c6c5f6e616d657c733a31303a2241646d696e2055736572223b73686f72745f6e616d657c733a313a2261223b70686f6e657c733a31333a222b393233303635333035323136223b656d61696c5f616464726573737c733a32353a226164696b68616e6f6666696369616c40676d61696c2e636f6d223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b73657373696f6e5f6f75746c6574737c733a313a2232223b6163746976655f6d656e755f746d707c733a303a22223b63757272656e63797c733a333a22504b52223b7a6f6e655f6e616d657c733a31323a22417369612f4b617261636869223b646174655f666f726d61747c733a353a22592f6d2f64223b627573696e6573735f6e616d657c733a33323a22436865657a792042697465204d412d4d412026616d703b616d703b20536f6e73223b776562736974657c733a31303a22666972656170702e6363223b63757272656e63795f706f736974696f6e7c733a31333a224265666f726520416d6f756e74223b707265636973696f6e7c733a313a2232223b64656661756c745f637573746f6d65727c733a313a2231223b6578706f72745f6461696c795f73616c657c733a363a22656e61626c65223b736572766963655f616d6f756e747c733a303a22223b74616b655f617761795f736572766963655f6368617267657c733a303a22223b64656c69766572795f616d6f756e747c733a303a22223b7461785f747970657c733a313a2231223b646563696d616c735f736570617261746f727c733a313a222e223b74686f7573616e64735f736570617261746f727c733a313a222c223b6f70656e5f636173685f6472617765725f7768656e5f7072696e74696e675f696e766f6963657c733a323a224e6f223b7768656e5f636c69636b696e675f6f6e5f6974656d5f696e5f706f737c733a313a2232223b69735f726f756e64696e675f656e61626c657c733a313a2230223b617474656e64616e63655f747970657c733a313a2232223b64656661756c745f6f726465725f747970657c733a313a2231223b69735f6c6f79616c74795f656e61626c657c733a373a2264697361626c65223b7072655f6f725f706f73745f7061796d656e747c733a313a2231223b6d696e696d756d5f706f696e745f746f5f72656465656d7c733a313a2230223b6c6f79616c74795f726174657c733a333a22302e31223b73706c69745f62696c6c7c733a313a2231223b706c6163655f6f726465725f746f6f6c7469707c733a343a2273686f77223b666f6f645f6d656e755f746f6f6c7469707c733a343a2273686f77223b7461626c655f62675f636f6c6f727c733a31303a227461626c655f62675f31223b6b6f745f7072696e745f6f6e6c696e655f73656c665f6f726465727c733a313a2231223b64656661756c745f7061796d656e747c733a313a2231223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b6c616e67756167655f6d616e69666573746f7c733a393a22726576686762726576223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f7469746c657c733a31313a224c6f63616c205461786573223b7461785f726567697374726174696f6e5f6e6f7c733a383a223332313332353837223b7461785f69735f6773747c733a323a224e6f223b6170706c795f6f6e5f64656c69766572795f6368617267657c733a313a2231223b73746174655f636f64657c733a373a2230393331323332223b6c6f67696e5f747970657c733a313a2231223b5f5f63695f766172737c613a333a7b733a31313a22657863657074696f6e5f32223b733a333a226f6c64223b733a393a22657863657074696f6e223b733a333a226f6c64223b733a31313a22657863657074696f6e5f33223b733a333a226f6c64223b7d6f75746c65745f6e616d657c733a31313a224368657a7a792042697465223b616464726573737c733a35323a22436865657a792042697465204d412d4d412026616d703b20536f6e732020506c617a6120536861682044657261692c2053776174223b656d61696c7c733a303a22223b6f6e6c696e655f6f726465725f6d6f64756c657c733a313a2232223b64656661756c745f7761697465727c733a313a2233223b6163746976655f7374617475737c733a363a22616374697665223b64656661756c745f6f726465725f747970655f64656c69766572795f707c733a303a22223b736d735f73656e645f6175746f7c733a313a2231223b73686f775f6f726465725f66756c6c5f73686f72747c733a313a2231223b6f6e6c696e655f73656c65637465645f6f75746c65747c733a313a2231223b696e766f6963655f6c6f676f7c733a33373a2237353861646564383439306236356465626361613133353137343731316431392e6a706567223b736974655f6e616d657c733a34343a224f6e6c696e65204f72646572206f6620436865657a792042697465204d412d4d412026616d703b20536f6e73223b666f6f7465727c733a34363a224f6e6c696e65204f72646572206f6620436865657a792042697465204d412d4d412026616d703b20536f6e730d0a223b73797374656d5f6c6f676f7c733a33373a2263396663303536343963623433393039393936376131633766346235306262612e6a706567223b66617669636f6e7c733a33373a2265323739303065656463626265326433653536613031383761666637376331352e6a706567223b776562736974655f7468656d655f636f6c6f727c733a373a2223643766663066223b6f75746c65745f69647c733a313a2231223b69735f7761697465727c733a323a224e6f223b636f756e7465725f69647c733a313a2231223b636f756e7465725f6e616d657c733a323a223031223b7072696e7465725f69647c4e3b62696c6c5f7072696e7465725f69647c733a313a2231223b706174687c4e3b7469746c657c4e3b747970657c4e3b636861726163746572735f7065725f6c696e657c4e3b7072696e7465725f69705f616464726573737c4e3b7072696e7465725f706f72747c4e3b7072696e74696e675f63686f6963657c4e3b697076666f75725f616464726573737c4e3b7072696e745f666f726d61747c4e3b696e765f71725f636f64655f656e61626c655f7374617475737c4e3b706174685f62696c6c7c733a303a22223b7469746c655f62696c6c7c733a373a225072696e746572223b747970655f62696c6c7c733a303a22223b636861726163746572735f7065725f6c696e655f62696c6c7c733a313a2230223b7072696e7465725f69705f616464726573735f62696c6c7c733a303a22223b7072696e7465725f706f72745f62696c6c7c733a303a22223b7072696e74696e675f63686f6963655f62696c6c7c733a31373a227765625f62726f777365725f706f707570223b697076666f75725f616464726573735f62696c6c7c733a303a22223b7072696e745f666f726d61745f62696c6c7c733a383a224e6f205072696e74223b696e765f71725f636f64655f656e61626c655f7374617475735f62696c6c7c733a373a2244697361626c65223b6163746976655f6c6f67696e5f627574746f6e7c733a313a2231223b),
('bdb80340f9275d1170120dfc77708014a313f0f2', '127.0.0.1', 1770102551, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737303130323535313b73797374656d5f76657273696f6e5f6e756d6265727c733a333a22372e36223b776c627c693a313b66756e6374696f6e5f6163636573737c613a3334343a7b693a303b733a383a22766965772d333730223b693a313b733a323a222d30223b693a323b733a33333a22616c6c5f73657474696e675f7265736572766174696f6e5f6f726465722d333638223b693a333b733a323a222d30223b693a343b733a32383a22616c6c5f73657474696e675f6f6e6c696e655f6f726465722d333636223b693a353b733a323a222d30223b693a363b733a32353a22616c6c5f73657474696e675f73656c5f6f726465722d333634223b693a373b733a323a222d30223b693a383b733a383a22766965772d333632223b693a393b733a323a222d30223b693a31303b733a31353a22616c6c5f73657474696e672d333538223b693a31313b733a323a222d30223b693a31323b733a31303a2264656c6574652d333533223b693a31333b733a383a22766965772d333533223b693a31343b733a31303a227570646174652d333533223b693a31353b733a373a226164642d333533223b693a31363b733a323a222d30223b693a31373b733a393a22706f735f32352d3733223b693a31383b733a393a2272657365742d333530223b693a31393b733a323a222d30223b693a32303b733a383a22766965772d333436223b693a32313b733a323a222d30223b693a32323b733a31363a22766965775f64657461696c732d333430223b693a32333b733a31303a2264656c6574652d333430223b693a32343b733a383a22766965772d333430223b693a32353b733a31303a227570646174652d333430223b693a32363b733a373a226164642d333430223b693a32373b733a323a222d30223b693a32383b733a31373a22736f7274696e67466f72504f532d323239223b693a32393b733a383a22766965772d333337223b693a33303b733a323a222d30223b693a33313b733a383a22766965772d333332223b693a33323b733a323a222d30223b693a33333b733a31303a227570646174652d333330223b693a33343b733a323a222d30223b693a33353b733a31303a2264656c6574652d333235223b693a33363b733a383a22766965772d333235223b693a33373b733a31303a227570646174652d333235223b693a33383b733a373a226164642d333235223b693a33393b733a323a222d30223b693a34303b733a383a22766965772d333231223b693a34313b733a323a222d30223b693a34323b733a31343a22646561637469766174652d333136223b693a34333b733a31323a2261637469766174652d333136223b693a34343b733a31303a2264656c6574652d333136223b693a34353b733a383a22766965772d333136223b693a34363b733a323a222d30223b693a34373b733a383a22766965772d333134223b693a34383b733a323a222d30223b693a34393b733a383a22766965772d333130223b693a35303b733a31333a22636865636b5f6f75742d333130223b693a35313b733a31323a22636865636b5f696e2d333130223b693a35323b733a323a222d30223b693a35333b733a31313a22736f7274696e672d323630223b693a35343b733a383a22766965772d333037223b693a35353b733a323a222d30223b693a35363b733a31393a2272657365744461696c7953616c65732d313233223b693a35373b733a32303a226578706f72744461696c7953616c65732d313233223b693a35383b733a32373a226368616e67655f64656c69766572795f616464726573732d313233223b693a35393b733a31303a227570646174652d333032223b693a36303b733a323a222d30223b693a36313b733a31303a227570646174652d333030223b693a36323b733a323a222d30223b693a36333b733a31303a227570646174652d323938223b693a36343b733a323a222d30223b693a36353b733a31343a22646561637469766174652d323931223b693a36363b733a31323a2261637469766174652d323931223b693a36373b733a31303a2264656c6574652d323931223b693a36383b733a383a22766965772d323931223b693a36393b733a31303a227570646174652d323931223b693a37303b733a373a226164642d323931223b693a37313b733a323a222d30223b693a37323b733a383a22636f70792d323835223b693a37333b733a31303a2264656c6574652d323835223b693a37343b733a383a22766965772d323835223b693a37353b733a31303a227570646174652d323835223b693a37363b733a373a226164642d323835223b693a37373b733a323a222d30223b693a37383b733a31303a2264656c6574652d323830223b693a37393b733a383a22766965772d323830223b693a38303b733a31303a227570646174652d323830223b693a38313b733a373a226164642d323830223b693a38323b733a323a222d30223b693a38333b733a31303a2264656c6574652d323735223b693a38343b733a383a22766965772d323735223b693a38353b733a31303a227570646174652d323735223b693a38363b733a373a226164642d323735223b693a38373b733a323a222d30223b693a38383b733a31303a2264656c6574652d323730223b693a38393b733a383a22766965772d323730223b693a39303b733a31303a227570646174652d323730223b693a39313b733a373a226164642d323730223b693a39323b733a323a222d30223b693a39333b733a31303a2264656c6574652d323635223b693a39343b733a383a22766965772d323635223b693a39353b733a31303a227570646174652d323635223b693a39363b733a373a226164642d323635223b693a39373b733a323a222d30223b693a39383b733a31303a2264656c6574652d323630223b693a39393b733a383a22766965772d323630223b693a3130303b733a31303a227570646174652d323630223b693a3130313b733a373a226164642d323630223b693a3130323b733a323a222d30223b693a3130333b733a31303a2264656c6574652d323535223b693a3130343b733a383a22766965772d323535223b693a3130353b733a31303a227570646174652d323535223b693a3130363b733a373a226164642d323535223b693a3130373b733a323a222d30223b693a3130383b733a31393a2275706c6f61645f637573746f6d65722d323439223b693a3130393b733a31303a2264656c6574652d323439223b693a3131303b733a383a22766965772d323439223b693a3131313b733a31303a227570646174652d323439223b693a3131323b733a373a226164642d323439223b693a3131333b733a323a222d30223b693a3131343b733a31303a2264656c6574652d323434223b693a3131353b733a383a22766965772d323434223b693a3131363b733a31303a227570646174652d323434223b693a3131373b733a373a226164642d323434223b693a3131383b733a323a222d30223b693a3131393b733a31363a226974656d5f626172636f64652d323334223b693a3132303b733a33323a2275706c6f61645f666f6f645f6d656e755f696e6772656469656e74732d323334223b693a3132313b733a32303a2275706c6f61645f666f6f645f6d656e752d323334223b693a3132323b733a31393a2261737369676e5f6d6f6469666965722d323334223b693a3132333b733a31363a22766965775f64657461696c732d323334223b693a3132343b733a31303a2264656c6574652d323334223b693a3132353b733a383a22766965772d323334223b693a3132363b733a31303a227570646174652d323334223b693a3132373b733a373a226164642d323334223b693a3132383b733a323a222d30223b693a3132393b733a31303a2264656c6574652d323239223b693a3133303b733a383a22766965772d323239223b693a3133313b733a31303a227570646174652d323239223b693a3133323b733a373a226164642d323239223b693a3133333b733a323a222d30223b693a3133343b733a31363a22766965775f64657461696c732d323233223b693a3133353b733a31303a2264656c6574652d323233223b693a3133363b733a383a22766965772d323233223b693a3133373b733a31303a227570646174652d323233223b693a3133383b733a373a226164642d323233223b693a3133393b733a323a222d30223b693a3134303b733a32313a2275706c6f61645f696e6772656469656e742d323137223b693a3134313b733a31303a2264656c6574652d323137223b693a3134323b733a383a22766965772d323137223b693a3134333b733a31303a227570646174652d323137223b693a3134343b733a373a226164642d323137223b693a3134353b733a323a222d30223b693a3134363b733a31303a2264656c6574652d323132223b693a3134373b733a383a22766965772d323132223b693a3134383b733a31303a227570646174652d323132223b693a3134393b733a373a226164642d323132223b693a3135303b733a323a222d30223b693a3135313b733a31303a2264656c6574652d323037223b693a3135323b733a383a22766965772d323037223b693a3135333b733a31303a227570646174652d323037223b693a3135343b733a373a226164642d323037223b693a3135353b733a323a222d30223b693a3135363b733a383a22766965772d323035223b693a3135373b733a323a222d30223b693a3135383b733a383a22766965772d323033223b693a3135393b733a323a222d30223b693a3136303b733a383a22766965772d323031223b693a3136313b733a323a222d30223b693a3136323b733a383a22766965772d313939223b693a3136333b733a323a222d30223b693a3136343b733a383a22766965772d313937223b693a3136353b733a323a222d30223b693a3136363b733a383a22766965772d313935223b693a3136373b733a323a222d30223b693a3136383b733a383a22766965772d313933223b693a3136393b733a323a222d30223b693a3137303b733a383a22766965772d313931223b693a3137313b733a323a222d30223b693a3137323b733a383a22766965772d313839223b693a3137333b733a323a222d30223b693a3137343b733a383a22766965772d313837223b693a3137353b733a323a222d30223b693a3137363b733a383a22766965772d313835223b693a3137373b733a323a222d30223b693a3137383b733a383a22766965772d313833223b693a3137393b733a323a222d30223b693a3138303b733a383a22766965772d313831223b693a3138313b733a323a222d30223b693a3138323b733a383a22766965772d313739223b693a3138333b733a323a222d30223b693a3138343b733a383a22766965772d313735223b693a3138353b733a323a222d30223b693a3138363b733a383a22766965772d313733223b693a3138373b733a323a222d30223b693a3138383b733a383a22766965772d313731223b693a3138393b733a323a222d30223b693a3139303b733a383a22766965772d313639223b693a3139313b733a323a222d30223b693a3139323b733a383a22766965772d313637223b693a3139333b733a323a222d30223b693a3139343b733a383a22766965772d313635223b693a3139353b733a323a222d30223b693a3139363b733a383a22766965772d313633223b693a3139373b733a323a222d30223b693a3139383b733a383a22766965772d313631223b693a3139393b733a323a222d30223b693a3230303b733a383a22766965772d313539223b693a3230313b733a323a222d30223b693a3230323b733a31303a2264656c6574652d313535223b693a3230333b733a383a22766965772d313535223b693a3230343b733a373a226164642d313535223b693a3230353b733a323a222d30223b693a3230363b733a31303a2264656c6574652d313531223b693a3230373b733a383a22766965772d313531223b693a3230383b733a373a226164642d313531223b693a3230393b733a323a222d30223b693a3231303b733a31303a2264656c6574652d313437223b693a3231313b733a383a22766965772d313437223b693a3231323b733a373a226164642d313437223b693a3231333b733a323a222d30223b693a3231343b733a31303a2264656c6574652d313432223b693a3231353b733a383a22766965772d313432223b693a3231363b733a31303a227570646174652d313432223b693a3231373b733a373a226164642d313432223b693a3231383b733a323a222d30223b693a3231393b733a31363a22766965775f64657461696c732d313337223b693a3232303b733a31303a2264656c6574652d313337223b693a3232313b733a383a22766965772d313337223b693a3232323b733a373a226164642d313337223b693a3232333b733a323a222d30223b693a3232343b733a31363a22766965775f64657461696c732d313331223b693a3232353b733a31303a2264656c6574652d313331223b693a3232363b733a383a22766965772d313331223b693a3232373b733a31303a227570646174652d313331223b693a3232383b733a373a226164642d313331223b693a3232393b733a323a222d30223b693a3233303b733a383a22766965772d313239223b693a3233313b733a323a222d30223b693a3233323b733a31303a2264656c6574652d313233223b693a3233333b733a31363a22766965775f696e766f6963652d313233223b693a3233343b733a31303a22726566756e642d313233223b693a3233353b733a383a22766965772d313233223b693a3233363b733a323a222d30223b693a3233373b733a31303a2264656c6574652d313138223b693a3233383b733a383a22766965772d313138223b693a3233393b733a31303a227570646174652d313138223b693a3234303b733a373a226164642d313138223b693a3234313b733a323a222d30223b693a3234323b733a31363a22766965775f64657461696c732d313132223b693a3234333b733a31303a2264656c6574652d313132223b693a3234343b733a383a22766965772d313132223b693a3234353b733a31303a227570646174652d313132223b693a3234363b733a373a226164642d313132223b693a3234373b733a323a222d30223b693a3234383b733a31363a22766965775f64657461696c732d313036223b693a3234393b733a31303a2264656c6574652d313036223b693a3235303b733a383a22766965772d313036223b693a3235313b733a31303a227570646174652d313036223b693a3235323b733a373a226164642d313036223b693a3235333b733a323a222d30223b693a3235343b733a383a22766965772d313034223b693a3235353b733a323a222d30223b693a3235363b733a383a22656e7465722d3938223b693a3235373b733a393a2264656c6574652d3938223b693a3235383b733a373a22766965772d3938223b693a3235393b733a393a227570646174652d3938223b693a3236303b733a363a226164642d3938223b693a3236313b733a323a222d30223b693a3236323b733a393a22706f735f32332d3733223b693a3236333b733a393a22706f735f32322d3733223b693a3236343b733a393a22706f735f32312d3733223b693a3236353b733a393a22706f735f32302d3733223b693a3236363b733a393a22706f735f31392d3733223b693a3236373b733a393a22706f735f31382d3733223b693a3236383b733a393a22706f735f31372d3733223b693a3236393b733a393a22706f735f31362d3733223b693a3237303b733a393a22706f735f31352d3733223b693a3237313b733a393a22706f735f31342d3733223b693a3237323b733a393a22706f735f31332d3733223b693a3237333b733a393a22706f735f31322d3733223b693a3237343b733a393a22706f735f31312d3733223b693a3237353b733a393a22706f735f31302d3733223b693a3237363b733a383a22706f735f392d3733223b693a3237373b733a383a22706f735f382d3733223b693a3237383b733a383a22706f735f372d3733223b693a3237393b733a383a22706f735f362d3733223b693a3238303b733a383a22706f735f352d3733223b693a3238313b733a383a22706f735f342d3733223b693a3238323b733a383a22706f735f332d3733223b693a3238333b733a383a22706f735f322d3733223b693a3238343b733a383a22706f735f312d3733223b693a3238353b733a323a222d30223b693a3238363b733a383a22656e7465722d3637223b693a3238373b733a393a2264656c6574652d3637223b693a3238383b733a373a22766965772d3637223b693a3238393b733a393a227570646174652d3637223b693a3239303b733a363a226164642d3637223b693a3239313b733a323a222d30223b693a3239323b733a393a227570646174652d3634223b693a3239333b733a323a222d30223b693a3239343b733a31323a22756e696e7374616c6c2d3632223b693a3239353b733a323a222d30223b693a3239363b733a393a227570646174652d3630223b693a3239373b733a323a222d30223b693a3239383b733a393a2264656c6574652d3535223b693a3239393b733a373a22766965772d3535223b693a3330303b733a393a227570646174652d3535223b693a3330313b733a363a226164642d3535223b693a3330323b733a323a222d30223b693a3330333b733a31333a227570646174655f7461782d3532223b693a3330343b733a323a222d30223b693a3330353b733a393a227570646174652d3439223b693a3330363b733a323a222d30223b693a3330373b733a393a2264656c6574652d3335223b693a3330383b733a373a22766965772d3335223b693a3330393b733a393a227570646174652d3335223b693a3331303b733a363a226164642d3335223b693a3331313b733a323a222d30223b693a3331323b733a393a227570646174652d3331223b693a3331333b733a373a22766965772d3331223b693a3331343b733a323a222d30223b693a3331353b733a393a2264656c6574652d3236223b693a3331363b733a373a22766965772d3236223b693a3331373b733a393a227570646174652d3236223b693a3331383b733a363a226164642d3236223b693a3331393b733a323a222d30223b693a3332303b733a393a2264656c6574652d3232223b693a3332313b733a373a22766965772d3232223b693a3332323b733a363a226164642d3232223b693a3332333b733a323a222d30223b693a3332343b733a31373a22626c6f636b5f616c6c5f757365722d3135223b693a3332353b733a31353a2273686f775f6f75746c6574732d3135223b693a3332363b733a393a2264656c6574652d3135223b693a3332373b733a373a22766965772d3135223b693a3332383b733a393a227570646174652d3135223b693a3332393b733a363a226164642d3135223b693a3333303b733a323a222d30223b693a3333313b733a393a227570646174652d3132223b693a3333323b733a373a22766965772d3132223b693a3333333b733a323a222d30223b693a3333343b733a383a227570646174652d39223b693a3333353b733a363a22766965772d39223b693a3333363b733a323a222d30223b693a3333373b733a383a227570646174652d36223b693a3333383b733a323a222d30223b693a3333393b733a383a227570646174652d33223b693a3334303b733a363a22766965772d33223b693a3334313b733a323a222d30223b693a3334323b733a363a22766965772d31223b693a3334333b733a323a222d30223b7d757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b64657369676e6174696f6e7c733a31313a2253757065722041646d696e223b66756c6c5f6e616d657c733a31303a2241646d696e2055736572223b73686f72745f6e616d657c733a313a2261223b70686f6e657c733a32363a22303331332d343336373431372020303334382d35353637343137223b656d61696c5f616464726573737c733a32353a226164696b68616e6f6666696369616c40676d61696c2e636f6d223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b73657373696f6e5f6f75746c6574737c733a313a2232223b6163746976655f6d656e755f746d707c733a303a22223b63757272656e63797c733a333a22504b52223b7a6f6e655f6e616d657c733a31323a22417369612f4b617261636869223b646174655f666f726d61747c733a353a22592f6d2f64223b627573696e6573735f6e616d657c733a33323a22436865657a792042697465204d412d4d412026616d703b616d703b20536f6e73223b776562736974657c733a31303a22666972656170702e6363223b63757272656e63795f706f736974696f6e7c733a31333a224265666f726520416d6f756e74223b707265636973696f6e7c733a313a2232223b64656661756c745f637573746f6d65727c733a313a2231223b6578706f72745f6461696c795f73616c657c733a363a22656e61626c65223b736572766963655f616d6f756e747c733a303a22223b74616b655f617761795f736572766963655f6368617267657c733a303a22223b64656c69766572795f616d6f756e747c733a303a22223b7461785f747970657c733a313a2231223b646563696d616c735f736570617261746f727c733a313a222e223b74686f7573616e64735f736570617261746f727c733a313a222c223b6f70656e5f636173685f6472617765725f7768656e5f7072696e74696e675f696e766f6963657c733a323a224e6f223b7768656e5f636c69636b696e675f6f6e5f6974656d5f696e5f706f737c733a313a2232223b69735f726f756e64696e675f656e61626c657c733a313a2230223b617474656e64616e63655f747970657c733a313a2232223b64656661756c745f6f726465725f747970657c733a313a2231223b69735f6c6f79616c74795f656e61626c657c733a373a2264697361626c65223b7072655f6f725f706f73745f7061796d656e747c733a313a2231223b6d696e696d756d5f706f696e745f746f5f72656465656d7c733a313a2230223b6c6f79616c74795f726174657c733a333a22302e31223b73706c69745f62696c6c7c733a313a2231223b706c6163655f6f726465725f746f6f6c7469707c733a343a2273686f77223b666f6f645f6d656e755f746f6f6c7469707c733a343a2273686f77223b7461626c655f62675f636f6c6f727c733a31303a227461626c655f62675f31223b6b6f745f7072696e745f6f6e6c696e655f73656c665f6f726465727c733a313a2231223b64656661756c745f7061796d656e747c733a313a2231223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b6c616e67756167655f6d616e69666573746f7c733a393a22726576686762726576223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f7469746c657c733a31313a224c6f63616c205461786573223b7461785f726567697374726174696f6e5f6e6f7c733a383a223332313332353837223b7461785f69735f6773747c733a323a224e6f223b6170706c795f6f6e5f64656c69766572795f6368617267657c733a313a2231223b73746174655f636f64657c733a373a2230393331323332223b6c6f67696e5f747970657c733a313a2231223b5f5f63695f766172737c613a333a7b733a31313a22657863657074696f6e5f32223b733a333a226f6c64223b733a393a22657863657074696f6e223b733a333a226f6c64223b733a31313a22657863657074696f6e5f33223b733a333a226f6c64223b7d6f75746c65745f6e616d657c733a31313a224368657a7a792042697465223b616464726573737c733a35323a22436865657a792042697465204d412d4d412026616d703b20536f6e732020506c617a6120536861682044657261692c2053776174223b656d61696c7c733a303a22223b6f6e6c696e655f6f726465725f6d6f64756c657c733a313a2232223b64656661756c745f7761697465727c733a313a2233223b6163746976655f7374617475737c733a363a22616374697665223b64656661756c745f6f726465725f747970655f64656c69766572795f707c733a303a22223b736d735f73656e645f6175746f7c733a313a2231223b73686f775f6f726465725f66756c6c5f73686f72747c733a313a2231223b6f6e6c696e655f73656c65637465645f6f75746c65747c733a313a2231223b696e766f6963655f6c6f676f7c733a33373a2237353861646564383439306236356465626361613133353137343731316431392e6a706567223b736974655f6e616d657c733a34343a224f6e6c696e65204f72646572206f6620436865657a792042697465204d412d4d412026616d703b20536f6e73223b666f6f7465727c733a34363a224f6e6c696e65204f72646572206f6620436865657a792042697465204d412d4d412026616d703b20536f6e730d0a223b73797374656d5f6c6f676f7c733a33373a2263396663303536343963623433393039393936376131633766346235306262612e6a706567223b66617669636f6e7c733a33373a2265323739303065656463626265326433653536613031383761666637376331352e6a706567223b776562736974655f7468656d655f636f6c6f727c733a373a2223643766663066223b6f75746c65745f69647c733a313a2231223b69735f7761697465727c733a323a224e6f223b636f756e7465725f69647c733a313a2231223b636f756e7465725f6e616d657c733a323a223031223b7072696e7465725f69647c4e3b62696c6c5f7072696e7465725f69647c733a313a2231223b706174687c4e3b7469746c657c4e3b747970657c4e3b636861726163746572735f7065725f6c696e657c4e3b7072696e7465725f69705f616464726573737c4e3b7072696e7465725f706f72747c4e3b7072696e74696e675f63686f6963657c4e3b697076666f75725f616464726573737c4e3b7072696e745f666f726d61747c4e3b696e765f71725f636f64655f656e61626c655f7374617475737c4e3b706174685f62696c6c7c733a303a22223b7469746c655f62696c6c7c733a373a225072696e746572223b747970655f62696c6c7c733a303a22223b636861726163746572735f7065725f6c696e655f62696c6c7c733a313a2230223b7072696e7465725f69705f616464726573735f62696c6c7c733a303a22223b7072696e7465725f706f72745f62696c6c7c733a303a22223b7072696e74696e675f63686f6963655f62696c6c7c733a31373a227765625f62726f777365725f706f707570223b697076666f75725f616464726573735f62696c6c7c733a303a22223b7072696e745f666f726d61745f62696c6c7c733a383a224e6f205072696e74223b696e765f71725f636f64655f656e61626c655f7374617475735f62696c6c7c733a373a2244697361626c65223b6163746976655f6c6f67696e5f627574746f6e7c733a313a2231223b);
INSERT INTO `tbl_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('99919cae6ec9d107234500035ad54ce1e4f4322f', '127.0.0.1', 1770102967, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737303130323936373b73797374656d5f76657273696f6e5f6e756d6265727c733a333a22372e36223b776c627c693a313b66756e6374696f6e5f6163636573737c613a3334343a7b693a303b733a383a22766965772d333730223b693a313b733a323a222d30223b693a323b733a33333a22616c6c5f73657474696e675f7265736572766174696f6e5f6f726465722d333638223b693a333b733a323a222d30223b693a343b733a32383a22616c6c5f73657474696e675f6f6e6c696e655f6f726465722d333636223b693a353b733a323a222d30223b693a363b733a32353a22616c6c5f73657474696e675f73656c5f6f726465722d333634223b693a373b733a323a222d30223b693a383b733a383a22766965772d333632223b693a393b733a323a222d30223b693a31303b733a31353a22616c6c5f73657474696e672d333538223b693a31313b733a323a222d30223b693a31323b733a31303a2264656c6574652d333533223b693a31333b733a383a22766965772d333533223b693a31343b733a31303a227570646174652d333533223b693a31353b733a373a226164642d333533223b693a31363b733a323a222d30223b693a31373b733a393a22706f735f32352d3733223b693a31383b733a393a2272657365742d333530223b693a31393b733a323a222d30223b693a32303b733a383a22766965772d333436223b693a32313b733a323a222d30223b693a32323b733a31363a22766965775f64657461696c732d333430223b693a32333b733a31303a2264656c6574652d333430223b693a32343b733a383a22766965772d333430223b693a32353b733a31303a227570646174652d333430223b693a32363b733a373a226164642d333430223b693a32373b733a323a222d30223b693a32383b733a31373a22736f7274696e67466f72504f532d323239223b693a32393b733a383a22766965772d333337223b693a33303b733a323a222d30223b693a33313b733a383a22766965772d333332223b693a33323b733a323a222d30223b693a33333b733a31303a227570646174652d333330223b693a33343b733a323a222d30223b693a33353b733a31303a2264656c6574652d333235223b693a33363b733a383a22766965772d333235223b693a33373b733a31303a227570646174652d333235223b693a33383b733a373a226164642d333235223b693a33393b733a323a222d30223b693a34303b733a383a22766965772d333231223b693a34313b733a323a222d30223b693a34323b733a31343a22646561637469766174652d333136223b693a34333b733a31323a2261637469766174652d333136223b693a34343b733a31303a2264656c6574652d333136223b693a34353b733a383a22766965772d333136223b693a34363b733a323a222d30223b693a34373b733a383a22766965772d333134223b693a34383b733a323a222d30223b693a34393b733a383a22766965772d333130223b693a35303b733a31333a22636865636b5f6f75742d333130223b693a35313b733a31323a22636865636b5f696e2d333130223b693a35323b733a323a222d30223b693a35333b733a31313a22736f7274696e672d323630223b693a35343b733a383a22766965772d333037223b693a35353b733a323a222d30223b693a35363b733a31393a2272657365744461696c7953616c65732d313233223b693a35373b733a32303a226578706f72744461696c7953616c65732d313233223b693a35383b733a32373a226368616e67655f64656c69766572795f616464726573732d313233223b693a35393b733a31303a227570646174652d333032223b693a36303b733a323a222d30223b693a36313b733a31303a227570646174652d333030223b693a36323b733a323a222d30223b693a36333b733a31303a227570646174652d323938223b693a36343b733a323a222d30223b693a36353b733a31343a22646561637469766174652d323931223b693a36363b733a31323a2261637469766174652d323931223b693a36373b733a31303a2264656c6574652d323931223b693a36383b733a383a22766965772d323931223b693a36393b733a31303a227570646174652d323931223b693a37303b733a373a226164642d323931223b693a37313b733a323a222d30223b693a37323b733a383a22636f70792d323835223b693a37333b733a31303a2264656c6574652d323835223b693a37343b733a383a22766965772d323835223b693a37353b733a31303a227570646174652d323835223b693a37363b733a373a226164642d323835223b693a37373b733a323a222d30223b693a37383b733a31303a2264656c6574652d323830223b693a37393b733a383a22766965772d323830223b693a38303b733a31303a227570646174652d323830223b693a38313b733a373a226164642d323830223b693a38323b733a323a222d30223b693a38333b733a31303a2264656c6574652d323735223b693a38343b733a383a22766965772d323735223b693a38353b733a31303a227570646174652d323735223b693a38363b733a373a226164642d323735223b693a38373b733a323a222d30223b693a38383b733a31303a2264656c6574652d323730223b693a38393b733a383a22766965772d323730223b693a39303b733a31303a227570646174652d323730223b693a39313b733a373a226164642d323730223b693a39323b733a323a222d30223b693a39333b733a31303a2264656c6574652d323635223b693a39343b733a383a22766965772d323635223b693a39353b733a31303a227570646174652d323635223b693a39363b733a373a226164642d323635223b693a39373b733a323a222d30223b693a39383b733a31303a2264656c6574652d323630223b693a39393b733a383a22766965772d323630223b693a3130303b733a31303a227570646174652d323630223b693a3130313b733a373a226164642d323630223b693a3130323b733a323a222d30223b693a3130333b733a31303a2264656c6574652d323535223b693a3130343b733a383a22766965772d323535223b693a3130353b733a31303a227570646174652d323535223b693a3130363b733a373a226164642d323535223b693a3130373b733a323a222d30223b693a3130383b733a31393a2275706c6f61645f637573746f6d65722d323439223b693a3130393b733a31303a2264656c6574652d323439223b693a3131303b733a383a22766965772d323439223b693a3131313b733a31303a227570646174652d323439223b693a3131323b733a373a226164642d323439223b693a3131333b733a323a222d30223b693a3131343b733a31303a2264656c6574652d323434223b693a3131353b733a383a22766965772d323434223b693a3131363b733a31303a227570646174652d323434223b693a3131373b733a373a226164642d323434223b693a3131383b733a323a222d30223b693a3131393b733a31363a226974656d5f626172636f64652d323334223b693a3132303b733a33323a2275706c6f61645f666f6f645f6d656e755f696e6772656469656e74732d323334223b693a3132313b733a32303a2275706c6f61645f666f6f645f6d656e752d323334223b693a3132323b733a31393a2261737369676e5f6d6f6469666965722d323334223b693a3132333b733a31363a22766965775f64657461696c732d323334223b693a3132343b733a31303a2264656c6574652d323334223b693a3132353b733a383a22766965772d323334223b693a3132363b733a31303a227570646174652d323334223b693a3132373b733a373a226164642d323334223b693a3132383b733a323a222d30223b693a3132393b733a31303a2264656c6574652d323239223b693a3133303b733a383a22766965772d323239223b693a3133313b733a31303a227570646174652d323239223b693a3133323b733a373a226164642d323239223b693a3133333b733a323a222d30223b693a3133343b733a31363a22766965775f64657461696c732d323233223b693a3133353b733a31303a2264656c6574652d323233223b693a3133363b733a383a22766965772d323233223b693a3133373b733a31303a227570646174652d323233223b693a3133383b733a373a226164642d323233223b693a3133393b733a323a222d30223b693a3134303b733a32313a2275706c6f61645f696e6772656469656e742d323137223b693a3134313b733a31303a2264656c6574652d323137223b693a3134323b733a383a22766965772d323137223b693a3134333b733a31303a227570646174652d323137223b693a3134343b733a373a226164642d323137223b693a3134353b733a323a222d30223b693a3134363b733a31303a2264656c6574652d323132223b693a3134373b733a383a22766965772d323132223b693a3134383b733a31303a227570646174652d323132223b693a3134393b733a373a226164642d323132223b693a3135303b733a323a222d30223b693a3135313b733a31303a2264656c6574652d323037223b693a3135323b733a383a22766965772d323037223b693a3135333b733a31303a227570646174652d323037223b693a3135343b733a373a226164642d323037223b693a3135353b733a323a222d30223b693a3135363b733a383a22766965772d323035223b693a3135373b733a323a222d30223b693a3135383b733a383a22766965772d323033223b693a3135393b733a323a222d30223b693a3136303b733a383a22766965772d323031223b693a3136313b733a323a222d30223b693a3136323b733a383a22766965772d313939223b693a3136333b733a323a222d30223b693a3136343b733a383a22766965772d313937223b693a3136353b733a323a222d30223b693a3136363b733a383a22766965772d313935223b693a3136373b733a323a222d30223b693a3136383b733a383a22766965772d313933223b693a3136393b733a323a222d30223b693a3137303b733a383a22766965772d313931223b693a3137313b733a323a222d30223b693a3137323b733a383a22766965772d313839223b693a3137333b733a323a222d30223b693a3137343b733a383a22766965772d313837223b693a3137353b733a323a222d30223b693a3137363b733a383a22766965772d313835223b693a3137373b733a323a222d30223b693a3137383b733a383a22766965772d313833223b693a3137393b733a323a222d30223b693a3138303b733a383a22766965772d313831223b693a3138313b733a323a222d30223b693a3138323b733a383a22766965772d313739223b693a3138333b733a323a222d30223b693a3138343b733a383a22766965772d313735223b693a3138353b733a323a222d30223b693a3138363b733a383a22766965772d313733223b693a3138373b733a323a222d30223b693a3138383b733a383a22766965772d313731223b693a3138393b733a323a222d30223b693a3139303b733a383a22766965772d313639223b693a3139313b733a323a222d30223b693a3139323b733a383a22766965772d313637223b693a3139333b733a323a222d30223b693a3139343b733a383a22766965772d313635223b693a3139353b733a323a222d30223b693a3139363b733a383a22766965772d313633223b693a3139373b733a323a222d30223b693a3139383b733a383a22766965772d313631223b693a3139393b733a323a222d30223b693a3230303b733a383a22766965772d313539223b693a3230313b733a323a222d30223b693a3230323b733a31303a2264656c6574652d313535223b693a3230333b733a383a22766965772d313535223b693a3230343b733a373a226164642d313535223b693a3230353b733a323a222d30223b693a3230363b733a31303a2264656c6574652d313531223b693a3230373b733a383a22766965772d313531223b693a3230383b733a373a226164642d313531223b693a3230393b733a323a222d30223b693a3231303b733a31303a2264656c6574652d313437223b693a3231313b733a383a22766965772d313437223b693a3231323b733a373a226164642d313437223b693a3231333b733a323a222d30223b693a3231343b733a31303a2264656c6574652d313432223b693a3231353b733a383a22766965772d313432223b693a3231363b733a31303a227570646174652d313432223b693a3231373b733a373a226164642d313432223b693a3231383b733a323a222d30223b693a3231393b733a31363a22766965775f64657461696c732d313337223b693a3232303b733a31303a2264656c6574652d313337223b693a3232313b733a383a22766965772d313337223b693a3232323b733a373a226164642d313337223b693a3232333b733a323a222d30223b693a3232343b733a31363a22766965775f64657461696c732d313331223b693a3232353b733a31303a2264656c6574652d313331223b693a3232363b733a383a22766965772d313331223b693a3232373b733a31303a227570646174652d313331223b693a3232383b733a373a226164642d313331223b693a3232393b733a323a222d30223b693a3233303b733a383a22766965772d313239223b693a3233313b733a323a222d30223b693a3233323b733a31303a2264656c6574652d313233223b693a3233333b733a31363a22766965775f696e766f6963652d313233223b693a3233343b733a31303a22726566756e642d313233223b693a3233353b733a383a22766965772d313233223b693a3233363b733a323a222d30223b693a3233373b733a31303a2264656c6574652d313138223b693a3233383b733a383a22766965772d313138223b693a3233393b733a31303a227570646174652d313138223b693a3234303b733a373a226164642d313138223b693a3234313b733a323a222d30223b693a3234323b733a31363a22766965775f64657461696c732d313132223b693a3234333b733a31303a2264656c6574652d313132223b693a3234343b733a383a22766965772d313132223b693a3234353b733a31303a227570646174652d313132223b693a3234363b733a373a226164642d313132223b693a3234373b733a323a222d30223b693a3234383b733a31363a22766965775f64657461696c732d313036223b693a3234393b733a31303a2264656c6574652d313036223b693a3235303b733a383a22766965772d313036223b693a3235313b733a31303a227570646174652d313036223b693a3235323b733a373a226164642d313036223b693a3235333b733a323a222d30223b693a3235343b733a383a22766965772d313034223b693a3235353b733a323a222d30223b693a3235363b733a383a22656e7465722d3938223b693a3235373b733a393a2264656c6574652d3938223b693a3235383b733a373a22766965772d3938223b693a3235393b733a393a227570646174652d3938223b693a3236303b733a363a226164642d3938223b693a3236313b733a323a222d30223b693a3236323b733a393a22706f735f32332d3733223b693a3236333b733a393a22706f735f32322d3733223b693a3236343b733a393a22706f735f32312d3733223b693a3236353b733a393a22706f735f32302d3733223b693a3236363b733a393a22706f735f31392d3733223b693a3236373b733a393a22706f735f31382d3733223b693a3236383b733a393a22706f735f31372d3733223b693a3236393b733a393a22706f735f31362d3733223b693a3237303b733a393a22706f735f31352d3733223b693a3237313b733a393a22706f735f31342d3733223b693a3237323b733a393a22706f735f31332d3733223b693a3237333b733a393a22706f735f31322d3733223b693a3237343b733a393a22706f735f31312d3733223b693a3237353b733a393a22706f735f31302d3733223b693a3237363b733a383a22706f735f392d3733223b693a3237373b733a383a22706f735f382d3733223b693a3237383b733a383a22706f735f372d3733223b693a3237393b733a383a22706f735f362d3733223b693a3238303b733a383a22706f735f352d3733223b693a3238313b733a383a22706f735f342d3733223b693a3238323b733a383a22706f735f332d3733223b693a3238333b733a383a22706f735f322d3733223b693a3238343b733a383a22706f735f312d3733223b693a3238353b733a323a222d30223b693a3238363b733a383a22656e7465722d3637223b693a3238373b733a393a2264656c6574652d3637223b693a3238383b733a373a22766965772d3637223b693a3238393b733a393a227570646174652d3637223b693a3239303b733a363a226164642d3637223b693a3239313b733a323a222d30223b693a3239323b733a393a227570646174652d3634223b693a3239333b733a323a222d30223b693a3239343b733a31323a22756e696e7374616c6c2d3632223b693a3239353b733a323a222d30223b693a3239363b733a393a227570646174652d3630223b693a3239373b733a323a222d30223b693a3239383b733a393a2264656c6574652d3535223b693a3239393b733a373a22766965772d3535223b693a3330303b733a393a227570646174652d3535223b693a3330313b733a363a226164642d3535223b693a3330323b733a323a222d30223b693a3330333b733a31333a227570646174655f7461782d3532223b693a3330343b733a323a222d30223b693a3330353b733a393a227570646174652d3439223b693a3330363b733a323a222d30223b693a3330373b733a393a2264656c6574652d3335223b693a3330383b733a373a22766965772d3335223b693a3330393b733a393a227570646174652d3335223b693a3331303b733a363a226164642d3335223b693a3331313b733a323a222d30223b693a3331323b733a393a227570646174652d3331223b693a3331333b733a373a22766965772d3331223b693a3331343b733a323a222d30223b693a3331353b733a393a2264656c6574652d3236223b693a3331363b733a373a22766965772d3236223b693a3331373b733a393a227570646174652d3236223b693a3331383b733a363a226164642d3236223b693a3331393b733a323a222d30223b693a3332303b733a393a2264656c6574652d3232223b693a3332313b733a373a22766965772d3232223b693a3332323b733a363a226164642d3232223b693a3332333b733a323a222d30223b693a3332343b733a31373a22626c6f636b5f616c6c5f757365722d3135223b693a3332353b733a31353a2273686f775f6f75746c6574732d3135223b693a3332363b733a393a2264656c6574652d3135223b693a3332373b733a373a22766965772d3135223b693a3332383b733a393a227570646174652d3135223b693a3332393b733a363a226164642d3135223b693a3333303b733a323a222d30223b693a3333313b733a393a227570646174652d3132223b693a3333323b733a373a22766965772d3132223b693a3333333b733a323a222d30223b693a3333343b733a383a227570646174652d39223b693a3333353b733a363a22766965772d39223b693a3333363b733a323a222d30223b693a3333373b733a383a227570646174652d36223b693a3333383b733a323a222d30223b693a3333393b733a383a227570646174652d33223b693a3334303b733a363a22766965772d33223b693a3334313b733a323a222d30223b693a3334323b733a363a22766965772d31223b693a3334333b733a323a222d30223b7d757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b64657369676e6174696f6e7c733a31313a2253757065722041646d696e223b66756c6c5f6e616d657c733a31303a2241646d696e2055736572223b73686f72745f6e616d657c733a313a2261223b70686f6e657c733a32363a22303331332d343336373431372020303334382d35353637343137223b656d61696c5f616464726573737c733a32353a226164696b68616e6f6666696369616c40676d61696c2e636f6d223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b73657373696f6e5f6f75746c6574737c733a313a2232223b6163746976655f6d656e755f746d707c733a303a22223b63757272656e63797c733a333a22504b52223b7a6f6e655f6e616d657c733a31323a22417369612f4b617261636869223b646174655f666f726d61747c733a353a22592f6d2f64223b627573696e6573735f6e616d657c733a33323a22436865657a792042697465204d412d4d412026616d703b616d703b20536f6e73223b776562736974657c733a31303a22666972656170702e6363223b63757272656e63795f706f736974696f6e7c733a31333a224265666f726520416d6f756e74223b707265636973696f6e7c733a313a2232223b64656661756c745f637573746f6d65727c733a313a2231223b6578706f72745f6461696c795f73616c657c733a363a22656e61626c65223b736572766963655f616d6f756e747c733a303a22223b74616b655f617761795f736572766963655f6368617267657c733a303a22223b64656c69766572795f616d6f756e747c733a303a22223b7461785f747970657c733a313a2231223b646563696d616c735f736570617261746f727c733a313a222e223b74686f7573616e64735f736570617261746f727c733a313a222c223b6f70656e5f636173685f6472617765725f7768656e5f7072696e74696e675f696e766f6963657c733a323a224e6f223b7768656e5f636c69636b696e675f6f6e5f6974656d5f696e5f706f737c733a313a2232223b69735f726f756e64696e675f656e61626c657c733a313a2230223b617474656e64616e63655f747970657c733a313a2232223b64656661756c745f6f726465725f747970657c733a313a2231223b69735f6c6f79616c74795f656e61626c657c733a373a2264697361626c65223b7072655f6f725f706f73745f7061796d656e747c733a313a2231223b6d696e696d756d5f706f696e745f746f5f72656465656d7c733a313a2230223b6c6f79616c74795f726174657c733a333a22302e31223b73706c69745f62696c6c7c733a313a2231223b706c6163655f6f726465725f746f6f6c7469707c733a343a2273686f77223b666f6f645f6d656e755f746f6f6c7469707c733a343a2273686f77223b7461626c655f62675f636f6c6f727c733a31303a227461626c655f62675f31223b6b6f745f7072696e745f6f6e6c696e655f73656c665f6f726465727c733a313a2231223b64656661756c745f7061796d656e747c733a313a2231223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b6c616e67756167655f6d616e69666573746f7c733a393a22726576686762726576223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f7469746c657c733a31313a224c6f63616c205461786573223b7461785f726567697374726174696f6e5f6e6f7c733a383a223332313332353837223b7461785f69735f6773747c733a323a224e6f223b6170706c795f6f6e5f64656c69766572795f6368617267657c733a313a2231223b73746174655f636f64657c733a373a2230393331323332223b6c6f67696e5f747970657c733a313a2231223b5f5f63695f766172737c613a333a7b733a31313a22657863657074696f6e5f32223b733a333a226f6c64223b733a393a22657863657074696f6e223b733a333a226f6c64223b733a31313a22657863657074696f6e5f33223b733a333a226f6c64223b7d6f75746c65745f6e616d657c733a31313a224368657a7a792042697465223b616464726573737c733a35323a22436865657a792042697465204d412d4d412026616d703b20536f6e732020506c617a6120536861682044657261692c2053776174223b656d61696c7c733a303a22223b6f6e6c696e655f6f726465725f6d6f64756c657c733a313a2232223b64656661756c745f7761697465727c733a313a2233223b6163746976655f7374617475737c733a363a22616374697665223b64656661756c745f6f726465725f747970655f64656c69766572795f707c733a303a22223b736d735f73656e645f6175746f7c733a313a2231223b73686f775f6f726465725f66756c6c5f73686f72747c733a313a2231223b6f6e6c696e655f73656c65637465645f6f75746c65747c733a313a2231223b696e766f6963655f6c6f676f7c733a33373a2237353861646564383439306236356465626361613133353137343731316431392e6a706567223b736974655f6e616d657c733a34343a224f6e6c696e65204f72646572206f6620436865657a792042697465204d412d4d412026616d703b20536f6e73223b666f6f7465727c733a34363a224f6e6c696e65204f72646572206f6620436865657a792042697465204d412d4d412026616d703b20536f6e730d0a223b73797374656d5f6c6f676f7c733a33373a2263396663303536343963623433393039393936376131633766346235306262612e6a706567223b66617669636f6e7c733a33373a2265323739303065656463626265326433653536613031383761666637376331352e6a706567223b776562736974655f7468656d655f636f6c6f727c733a373a2223643766663066223b6f75746c65745f69647c733a313a2231223b69735f7761697465727c733a323a224e6f223b636f756e7465725f69647c733a313a2231223b636f756e7465725f6e616d657c733a323a223031223b7072696e7465725f69647c4e3b62696c6c5f7072696e7465725f69647c733a313a2231223b706174687c4e3b7469746c657c4e3b747970657c4e3b636861726163746572735f7065725f6c696e657c4e3b7072696e7465725f69705f616464726573737c4e3b7072696e7465725f706f72747c4e3b7072696e74696e675f63686f6963657c4e3b697076666f75725f616464726573737c4e3b7072696e745f666f726d61747c4e3b696e765f71725f636f64655f656e61626c655f7374617475737c4e3b706174685f62696c6c7c733a303a22223b7469746c655f62696c6c7c733a373a225072696e746572223b747970655f62696c6c7c733a303a22223b636861726163746572735f7065725f6c696e655f62696c6c7c733a313a2230223b7072696e7465725f69705f616464726573735f62696c6c7c733a303a22223b7072696e7465725f706f72745f62696c6c7c733a303a22223b7072696e74696e675f63686f6963655f62696c6c7c733a31373a227765625f62726f777365725f706f707570223b697076666f75725f616464726573735f62696c6c7c733a303a22223b7072696e745f666f726d61745f62696c6c7c733a383a224e6f205072696e74223b696e765f71725f636f64655f656e61626c655f7374617475735f62696c6c7c733a373a2244697361626c65223b6163746976655f6c6f67696e5f627574746f6e7c733a313a2231223b),
('d144879758d79a352fba9e70e34ed4ab2a0d147e', '127.0.0.1', 1770103272, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737303130333237323b73797374656d5f76657273696f6e5f6e756d6265727c733a333a22372e36223b776c627c693a313b66756e6374696f6e5f6163636573737c613a3334343a7b693a303b733a383a22766965772d333730223b693a313b733a323a222d30223b693a323b733a33333a22616c6c5f73657474696e675f7265736572766174696f6e5f6f726465722d333638223b693a333b733a323a222d30223b693a343b733a32383a22616c6c5f73657474696e675f6f6e6c696e655f6f726465722d333636223b693a353b733a323a222d30223b693a363b733a32353a22616c6c5f73657474696e675f73656c5f6f726465722d333634223b693a373b733a323a222d30223b693a383b733a383a22766965772d333632223b693a393b733a323a222d30223b693a31303b733a31353a22616c6c5f73657474696e672d333538223b693a31313b733a323a222d30223b693a31323b733a31303a2264656c6574652d333533223b693a31333b733a383a22766965772d333533223b693a31343b733a31303a227570646174652d333533223b693a31353b733a373a226164642d333533223b693a31363b733a323a222d30223b693a31373b733a393a22706f735f32352d3733223b693a31383b733a393a2272657365742d333530223b693a31393b733a323a222d30223b693a32303b733a383a22766965772d333436223b693a32313b733a323a222d30223b693a32323b733a31363a22766965775f64657461696c732d333430223b693a32333b733a31303a2264656c6574652d333430223b693a32343b733a383a22766965772d333430223b693a32353b733a31303a227570646174652d333430223b693a32363b733a373a226164642d333430223b693a32373b733a323a222d30223b693a32383b733a31373a22736f7274696e67466f72504f532d323239223b693a32393b733a383a22766965772d333337223b693a33303b733a323a222d30223b693a33313b733a383a22766965772d333332223b693a33323b733a323a222d30223b693a33333b733a31303a227570646174652d333330223b693a33343b733a323a222d30223b693a33353b733a31303a2264656c6574652d333235223b693a33363b733a383a22766965772d333235223b693a33373b733a31303a227570646174652d333235223b693a33383b733a373a226164642d333235223b693a33393b733a323a222d30223b693a34303b733a383a22766965772d333231223b693a34313b733a323a222d30223b693a34323b733a31343a22646561637469766174652d333136223b693a34333b733a31323a2261637469766174652d333136223b693a34343b733a31303a2264656c6574652d333136223b693a34353b733a383a22766965772d333136223b693a34363b733a323a222d30223b693a34373b733a383a22766965772d333134223b693a34383b733a323a222d30223b693a34393b733a383a22766965772d333130223b693a35303b733a31333a22636865636b5f6f75742d333130223b693a35313b733a31323a22636865636b5f696e2d333130223b693a35323b733a323a222d30223b693a35333b733a31313a22736f7274696e672d323630223b693a35343b733a383a22766965772d333037223b693a35353b733a323a222d30223b693a35363b733a31393a2272657365744461696c7953616c65732d313233223b693a35373b733a32303a226578706f72744461696c7953616c65732d313233223b693a35383b733a32373a226368616e67655f64656c69766572795f616464726573732d313233223b693a35393b733a31303a227570646174652d333032223b693a36303b733a323a222d30223b693a36313b733a31303a227570646174652d333030223b693a36323b733a323a222d30223b693a36333b733a31303a227570646174652d323938223b693a36343b733a323a222d30223b693a36353b733a31343a22646561637469766174652d323931223b693a36363b733a31323a2261637469766174652d323931223b693a36373b733a31303a2264656c6574652d323931223b693a36383b733a383a22766965772d323931223b693a36393b733a31303a227570646174652d323931223b693a37303b733a373a226164642d323931223b693a37313b733a323a222d30223b693a37323b733a383a22636f70792d323835223b693a37333b733a31303a2264656c6574652d323835223b693a37343b733a383a22766965772d323835223b693a37353b733a31303a227570646174652d323835223b693a37363b733a373a226164642d323835223b693a37373b733a323a222d30223b693a37383b733a31303a2264656c6574652d323830223b693a37393b733a383a22766965772d323830223b693a38303b733a31303a227570646174652d323830223b693a38313b733a373a226164642d323830223b693a38323b733a323a222d30223b693a38333b733a31303a2264656c6574652d323735223b693a38343b733a383a22766965772d323735223b693a38353b733a31303a227570646174652d323735223b693a38363b733a373a226164642d323735223b693a38373b733a323a222d30223b693a38383b733a31303a2264656c6574652d323730223b693a38393b733a383a22766965772d323730223b693a39303b733a31303a227570646174652d323730223b693a39313b733a373a226164642d323730223b693a39323b733a323a222d30223b693a39333b733a31303a2264656c6574652d323635223b693a39343b733a383a22766965772d323635223b693a39353b733a31303a227570646174652d323635223b693a39363b733a373a226164642d323635223b693a39373b733a323a222d30223b693a39383b733a31303a2264656c6574652d323630223b693a39393b733a383a22766965772d323630223b693a3130303b733a31303a227570646174652d323630223b693a3130313b733a373a226164642d323630223b693a3130323b733a323a222d30223b693a3130333b733a31303a2264656c6574652d323535223b693a3130343b733a383a22766965772d323535223b693a3130353b733a31303a227570646174652d323535223b693a3130363b733a373a226164642d323535223b693a3130373b733a323a222d30223b693a3130383b733a31393a2275706c6f61645f637573746f6d65722d323439223b693a3130393b733a31303a2264656c6574652d323439223b693a3131303b733a383a22766965772d323439223b693a3131313b733a31303a227570646174652d323439223b693a3131323b733a373a226164642d323439223b693a3131333b733a323a222d30223b693a3131343b733a31303a2264656c6574652d323434223b693a3131353b733a383a22766965772d323434223b693a3131363b733a31303a227570646174652d323434223b693a3131373b733a373a226164642d323434223b693a3131383b733a323a222d30223b693a3131393b733a31363a226974656d5f626172636f64652d323334223b693a3132303b733a33323a2275706c6f61645f666f6f645f6d656e755f696e6772656469656e74732d323334223b693a3132313b733a32303a2275706c6f61645f666f6f645f6d656e752d323334223b693a3132323b733a31393a2261737369676e5f6d6f6469666965722d323334223b693a3132333b733a31363a22766965775f64657461696c732d323334223b693a3132343b733a31303a2264656c6574652d323334223b693a3132353b733a383a22766965772d323334223b693a3132363b733a31303a227570646174652d323334223b693a3132373b733a373a226164642d323334223b693a3132383b733a323a222d30223b693a3132393b733a31303a2264656c6574652d323239223b693a3133303b733a383a22766965772d323239223b693a3133313b733a31303a227570646174652d323239223b693a3133323b733a373a226164642d323239223b693a3133333b733a323a222d30223b693a3133343b733a31363a22766965775f64657461696c732d323233223b693a3133353b733a31303a2264656c6574652d323233223b693a3133363b733a383a22766965772d323233223b693a3133373b733a31303a227570646174652d323233223b693a3133383b733a373a226164642d323233223b693a3133393b733a323a222d30223b693a3134303b733a32313a2275706c6f61645f696e6772656469656e742d323137223b693a3134313b733a31303a2264656c6574652d323137223b693a3134323b733a383a22766965772d323137223b693a3134333b733a31303a227570646174652d323137223b693a3134343b733a373a226164642d323137223b693a3134353b733a323a222d30223b693a3134363b733a31303a2264656c6574652d323132223b693a3134373b733a383a22766965772d323132223b693a3134383b733a31303a227570646174652d323132223b693a3134393b733a373a226164642d323132223b693a3135303b733a323a222d30223b693a3135313b733a31303a2264656c6574652d323037223b693a3135323b733a383a22766965772d323037223b693a3135333b733a31303a227570646174652d323037223b693a3135343b733a373a226164642d323037223b693a3135353b733a323a222d30223b693a3135363b733a383a22766965772d323035223b693a3135373b733a323a222d30223b693a3135383b733a383a22766965772d323033223b693a3135393b733a323a222d30223b693a3136303b733a383a22766965772d323031223b693a3136313b733a323a222d30223b693a3136323b733a383a22766965772d313939223b693a3136333b733a323a222d30223b693a3136343b733a383a22766965772d313937223b693a3136353b733a323a222d30223b693a3136363b733a383a22766965772d313935223b693a3136373b733a323a222d30223b693a3136383b733a383a22766965772d313933223b693a3136393b733a323a222d30223b693a3137303b733a383a22766965772d313931223b693a3137313b733a323a222d30223b693a3137323b733a383a22766965772d313839223b693a3137333b733a323a222d30223b693a3137343b733a383a22766965772d313837223b693a3137353b733a323a222d30223b693a3137363b733a383a22766965772d313835223b693a3137373b733a323a222d30223b693a3137383b733a383a22766965772d313833223b693a3137393b733a323a222d30223b693a3138303b733a383a22766965772d313831223b693a3138313b733a323a222d30223b693a3138323b733a383a22766965772d313739223b693a3138333b733a323a222d30223b693a3138343b733a383a22766965772d313735223b693a3138353b733a323a222d30223b693a3138363b733a383a22766965772d313733223b693a3138373b733a323a222d30223b693a3138383b733a383a22766965772d313731223b693a3138393b733a323a222d30223b693a3139303b733a383a22766965772d313639223b693a3139313b733a323a222d30223b693a3139323b733a383a22766965772d313637223b693a3139333b733a323a222d30223b693a3139343b733a383a22766965772d313635223b693a3139353b733a323a222d30223b693a3139363b733a383a22766965772d313633223b693a3139373b733a323a222d30223b693a3139383b733a383a22766965772d313631223b693a3139393b733a323a222d30223b693a3230303b733a383a22766965772d313539223b693a3230313b733a323a222d30223b693a3230323b733a31303a2264656c6574652d313535223b693a3230333b733a383a22766965772d313535223b693a3230343b733a373a226164642d313535223b693a3230353b733a323a222d30223b693a3230363b733a31303a2264656c6574652d313531223b693a3230373b733a383a22766965772d313531223b693a3230383b733a373a226164642d313531223b693a3230393b733a323a222d30223b693a3231303b733a31303a2264656c6574652d313437223b693a3231313b733a383a22766965772d313437223b693a3231323b733a373a226164642d313437223b693a3231333b733a323a222d30223b693a3231343b733a31303a2264656c6574652d313432223b693a3231353b733a383a22766965772d313432223b693a3231363b733a31303a227570646174652d313432223b693a3231373b733a373a226164642d313432223b693a3231383b733a323a222d30223b693a3231393b733a31363a22766965775f64657461696c732d313337223b693a3232303b733a31303a2264656c6574652d313337223b693a3232313b733a383a22766965772d313337223b693a3232323b733a373a226164642d313337223b693a3232333b733a323a222d30223b693a3232343b733a31363a22766965775f64657461696c732d313331223b693a3232353b733a31303a2264656c6574652d313331223b693a3232363b733a383a22766965772d313331223b693a3232373b733a31303a227570646174652d313331223b693a3232383b733a373a226164642d313331223b693a3232393b733a323a222d30223b693a3233303b733a383a22766965772d313239223b693a3233313b733a323a222d30223b693a3233323b733a31303a2264656c6574652d313233223b693a3233333b733a31363a22766965775f696e766f6963652d313233223b693a3233343b733a31303a22726566756e642d313233223b693a3233353b733a383a22766965772d313233223b693a3233363b733a323a222d30223b693a3233373b733a31303a2264656c6574652d313138223b693a3233383b733a383a22766965772d313138223b693a3233393b733a31303a227570646174652d313138223b693a3234303b733a373a226164642d313138223b693a3234313b733a323a222d30223b693a3234323b733a31363a22766965775f64657461696c732d313132223b693a3234333b733a31303a2264656c6574652d313132223b693a3234343b733a383a22766965772d313132223b693a3234353b733a31303a227570646174652d313132223b693a3234363b733a373a226164642d313132223b693a3234373b733a323a222d30223b693a3234383b733a31363a22766965775f64657461696c732d313036223b693a3234393b733a31303a2264656c6574652d313036223b693a3235303b733a383a22766965772d313036223b693a3235313b733a31303a227570646174652d313036223b693a3235323b733a373a226164642d313036223b693a3235333b733a323a222d30223b693a3235343b733a383a22766965772d313034223b693a3235353b733a323a222d30223b693a3235363b733a383a22656e7465722d3938223b693a3235373b733a393a2264656c6574652d3938223b693a3235383b733a373a22766965772d3938223b693a3235393b733a393a227570646174652d3938223b693a3236303b733a363a226164642d3938223b693a3236313b733a323a222d30223b693a3236323b733a393a22706f735f32332d3733223b693a3236333b733a393a22706f735f32322d3733223b693a3236343b733a393a22706f735f32312d3733223b693a3236353b733a393a22706f735f32302d3733223b693a3236363b733a393a22706f735f31392d3733223b693a3236373b733a393a22706f735f31382d3733223b693a3236383b733a393a22706f735f31372d3733223b693a3236393b733a393a22706f735f31362d3733223b693a3237303b733a393a22706f735f31352d3733223b693a3237313b733a393a22706f735f31342d3733223b693a3237323b733a393a22706f735f31332d3733223b693a3237333b733a393a22706f735f31322d3733223b693a3237343b733a393a22706f735f31312d3733223b693a3237353b733a393a22706f735f31302d3733223b693a3237363b733a383a22706f735f392d3733223b693a3237373b733a383a22706f735f382d3733223b693a3237383b733a383a22706f735f372d3733223b693a3237393b733a383a22706f735f362d3733223b693a3238303b733a383a22706f735f352d3733223b693a3238313b733a383a22706f735f342d3733223b693a3238323b733a383a22706f735f332d3733223b693a3238333b733a383a22706f735f322d3733223b693a3238343b733a383a22706f735f312d3733223b693a3238353b733a323a222d30223b693a3238363b733a383a22656e7465722d3637223b693a3238373b733a393a2264656c6574652d3637223b693a3238383b733a373a22766965772d3637223b693a3238393b733a393a227570646174652d3637223b693a3239303b733a363a226164642d3637223b693a3239313b733a323a222d30223b693a3239323b733a393a227570646174652d3634223b693a3239333b733a323a222d30223b693a3239343b733a31323a22756e696e7374616c6c2d3632223b693a3239353b733a323a222d30223b693a3239363b733a393a227570646174652d3630223b693a3239373b733a323a222d30223b693a3239383b733a393a2264656c6574652d3535223b693a3239393b733a373a22766965772d3535223b693a3330303b733a393a227570646174652d3535223b693a3330313b733a363a226164642d3535223b693a3330323b733a323a222d30223b693a3330333b733a31333a227570646174655f7461782d3532223b693a3330343b733a323a222d30223b693a3330353b733a393a227570646174652d3439223b693a3330363b733a323a222d30223b693a3330373b733a393a2264656c6574652d3335223b693a3330383b733a373a22766965772d3335223b693a3330393b733a393a227570646174652d3335223b693a3331303b733a363a226164642d3335223b693a3331313b733a323a222d30223b693a3331323b733a393a227570646174652d3331223b693a3331333b733a373a22766965772d3331223b693a3331343b733a323a222d30223b693a3331353b733a393a2264656c6574652d3236223b693a3331363b733a373a22766965772d3236223b693a3331373b733a393a227570646174652d3236223b693a3331383b733a363a226164642d3236223b693a3331393b733a323a222d30223b693a3332303b733a393a2264656c6574652d3232223b693a3332313b733a373a22766965772d3232223b693a3332323b733a363a226164642d3232223b693a3332333b733a323a222d30223b693a3332343b733a31373a22626c6f636b5f616c6c5f757365722d3135223b693a3332353b733a31353a2273686f775f6f75746c6574732d3135223b693a3332363b733a393a2264656c6574652d3135223b693a3332373b733a373a22766965772d3135223b693a3332383b733a393a227570646174652d3135223b693a3332393b733a363a226164642d3135223b693a3333303b733a323a222d30223b693a3333313b733a393a227570646174652d3132223b693a3333323b733a373a22766965772d3132223b693a3333333b733a323a222d30223b693a3333343b733a383a227570646174652d39223b693a3333353b733a363a22766965772d39223b693a3333363b733a323a222d30223b693a3333373b733a383a227570646174652d36223b693a3333383b733a323a222d30223b693a3333393b733a383a227570646174652d33223b693a3334303b733a363a22766965772d33223b693a3334313b733a323a222d30223b693a3334323b733a363a22766965772d31223b693a3334333b733a323a222d30223b7d757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b64657369676e6174696f6e7c733a31313a2253757065722041646d696e223b66756c6c5f6e616d657c733a31303a2241646d696e2055736572223b73686f72745f6e616d657c733a313a2261223b70686f6e657c733a32363a22303331332d343336373431372020303334382d35353637343137223b656d61696c5f616464726573737c733a32353a226164696b68616e6f6666696369616c40676d61696c2e636f6d223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b73657373696f6e5f6f75746c6574737c733a313a2232223b6163746976655f6d656e755f746d707c733a303a22223b63757272656e63797c733a333a22504b52223b7a6f6e655f6e616d657c733a31323a22417369612f4b617261636869223b646174655f666f726d61747c733a353a22592f6d2f64223b627573696e6573735f6e616d657c733a33323a22436865657a792042697465204d412d4d412026616d703b616d703b20536f6e73223b776562736974657c733a31303a22666972656170702e6363223b63757272656e63795f706f736974696f6e7c733a31333a224265666f726520416d6f756e74223b707265636973696f6e7c733a313a2232223b64656661756c745f637573746f6d65727c733a313a2231223b6578706f72745f6461696c795f73616c657c733a363a22656e61626c65223b736572766963655f616d6f756e747c733a303a22223b74616b655f617761795f736572766963655f6368617267657c733a303a22223b64656c69766572795f616d6f756e747c733a303a22223b7461785f747970657c733a313a2231223b646563696d616c735f736570617261746f727c733a313a222e223b74686f7573616e64735f736570617261746f727c733a313a222c223b6f70656e5f636173685f6472617765725f7768656e5f7072696e74696e675f696e766f6963657c733a323a224e6f223b7768656e5f636c69636b696e675f6f6e5f6974656d5f696e5f706f737c733a313a2232223b69735f726f756e64696e675f656e61626c657c733a313a2230223b617474656e64616e63655f747970657c733a313a2232223b64656661756c745f6f726465725f747970657c733a313a2231223b69735f6c6f79616c74795f656e61626c657c733a373a2264697361626c65223b7072655f6f725f706f73745f7061796d656e747c733a313a2231223b6d696e696d756d5f706f696e745f746f5f72656465656d7c733a313a2230223b6c6f79616c74795f726174657c733a333a22302e31223b73706c69745f62696c6c7c733a313a2231223b706c6163655f6f726465725f746f6f6c7469707c733a343a2273686f77223b666f6f645f6d656e755f746f6f6c7469707c733a343a2273686f77223b7461626c655f62675f636f6c6f727c733a31303a227461626c655f62675f31223b6b6f745f7072696e745f6f6e6c696e655f73656c665f6f726465727c733a313a2231223b64656661756c745f7061796d656e747c733a313a2231223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b6c616e67756167655f6d616e69666573746f7c733a393a22726576686762726576223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f7469746c657c733a31313a224c6f63616c205461786573223b7461785f726567697374726174696f6e5f6e6f7c733a383a223332313332353837223b7461785f69735f6773747c733a323a224e6f223b6170706c795f6f6e5f64656c69766572795f6368617267657c733a313a2231223b73746174655f636f64657c733a373a2230393331323332223b6c6f67696e5f747970657c733a313a2231223b5f5f63695f766172737c613a333a7b733a31313a22657863657074696f6e5f32223b733a333a226f6c64223b733a393a22657863657074696f6e223b733a333a226f6c64223b733a31313a22657863657074696f6e5f33223b733a333a226f6c64223b7d6f75746c65745f6e616d657c733a31313a224368657a7a792042697465223b616464726573737c733a35323a22436865657a792042697465204d412d4d412026616d703b20536f6e732020506c617a6120536861682044657261692c2053776174223b656d61696c7c733a303a22223b6f6e6c696e655f6f726465725f6d6f64756c657c733a313a2232223b64656661756c745f7761697465727c733a313a2233223b6163746976655f7374617475737c733a363a22616374697665223b64656661756c745f6f726465725f747970655f64656c69766572795f707c733a303a22223b736d735f73656e645f6175746f7c733a313a2231223b73686f775f6f726465725f66756c6c5f73686f72747c733a313a2231223b6f6e6c696e655f73656c65637465645f6f75746c65747c733a313a2231223b696e766f6963655f6c6f676f7c733a33373a2237353861646564383439306236356465626361613133353137343731316431392e6a706567223b736974655f6e616d657c733a34343a224f6e6c696e65204f72646572206f6620436865657a792042697465204d412d4d412026616d703b20536f6e73223b666f6f7465727c733a34363a224f6e6c696e65204f72646572206f6620436865657a792042697465204d412d4d412026616d703b20536f6e730d0a223b73797374656d5f6c6f676f7c733a33373a2263396663303536343963623433393039393936376131633766346235306262612e6a706567223b66617669636f6e7c733a33373a2265323739303065656463626265326433653536613031383761666637376331352e6a706567223b776562736974655f7468656d655f636f6c6f727c733a373a2223643766663066223b6f75746c65745f69647c733a313a2231223b69735f7761697465727c733a323a224e6f223b636f756e7465725f69647c733a313a2231223b636f756e7465725f6e616d657c733a323a223031223b7072696e7465725f69647c733a313a2231223b62696c6c5f7072696e7465725f69647c733a313a2231223b706174687c733a303a22223b7469746c657c733a373a225072696e746572223b747970657c733a303a22223b636861726163746572735f7065725f6c696e657c733a313a2230223b7072696e7465725f69705f616464726573737c733a303a22223b7072696e7465725f706f72747c733a303a22223b7072696e74696e675f63686f6963657c733a31373a227765625f62726f777365725f706f707570223b697076666f75725f616464726573737c733a303a22223b7072696e745f666f726d61747c733a343a2238306d6d223b696e765f71725f636f64655f656e61626c655f7374617475737c733a363a22456e61626c65223b706174685f62696c6c7c733a303a22223b7469746c655f62696c6c7c733a373a225072696e746572223b747970655f62696c6c7c733a303a22223b636861726163746572735f7065725f6c696e655f62696c6c7c733a313a2230223b7072696e7465725f69705f616464726573735f62696c6c7c733a303a22223b7072696e7465725f706f72745f62696c6c7c733a303a22223b7072696e74696e675f63686f6963655f62696c6c7c733a31373a227765625f62726f777365725f706f707570223b697076666f75725f616464726573735f62696c6c7c733a303a22223b7072696e745f666f726d61745f62696c6c7c733a343a2238306d6d223b696e765f71725f636f64655f656e61626c655f7374617475735f62696c6c7c733a363a22456e61626c65223b6163746976655f6c6f67696e5f627574746f6e7c733a313a2231223b);
INSERT INTO `tbl_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('f7fd8240cb1a37f2d9b61d52c9d2d9a51b64d2e0', '127.0.0.1', 1770103619, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737303130333631393b73797374656d5f76657273696f6e5f6e756d6265727c733a333a22372e36223b776c627c693a313b66756e6374696f6e5f6163636573737c613a3334343a7b693a303b733a383a22766965772d333730223b693a313b733a323a222d30223b693a323b733a33333a22616c6c5f73657474696e675f7265736572766174696f6e5f6f726465722d333638223b693a333b733a323a222d30223b693a343b733a32383a22616c6c5f73657474696e675f6f6e6c696e655f6f726465722d333636223b693a353b733a323a222d30223b693a363b733a32353a22616c6c5f73657474696e675f73656c5f6f726465722d333634223b693a373b733a323a222d30223b693a383b733a383a22766965772d333632223b693a393b733a323a222d30223b693a31303b733a31353a22616c6c5f73657474696e672d333538223b693a31313b733a323a222d30223b693a31323b733a31303a2264656c6574652d333533223b693a31333b733a383a22766965772d333533223b693a31343b733a31303a227570646174652d333533223b693a31353b733a373a226164642d333533223b693a31363b733a323a222d30223b693a31373b733a393a22706f735f32352d3733223b693a31383b733a393a2272657365742d333530223b693a31393b733a323a222d30223b693a32303b733a383a22766965772d333436223b693a32313b733a323a222d30223b693a32323b733a31363a22766965775f64657461696c732d333430223b693a32333b733a31303a2264656c6574652d333430223b693a32343b733a383a22766965772d333430223b693a32353b733a31303a227570646174652d333430223b693a32363b733a373a226164642d333430223b693a32373b733a323a222d30223b693a32383b733a31373a22736f7274696e67466f72504f532d323239223b693a32393b733a383a22766965772d333337223b693a33303b733a323a222d30223b693a33313b733a383a22766965772d333332223b693a33323b733a323a222d30223b693a33333b733a31303a227570646174652d333330223b693a33343b733a323a222d30223b693a33353b733a31303a2264656c6574652d333235223b693a33363b733a383a22766965772d333235223b693a33373b733a31303a227570646174652d333235223b693a33383b733a373a226164642d333235223b693a33393b733a323a222d30223b693a34303b733a383a22766965772d333231223b693a34313b733a323a222d30223b693a34323b733a31343a22646561637469766174652d333136223b693a34333b733a31323a2261637469766174652d333136223b693a34343b733a31303a2264656c6574652d333136223b693a34353b733a383a22766965772d333136223b693a34363b733a323a222d30223b693a34373b733a383a22766965772d333134223b693a34383b733a323a222d30223b693a34393b733a383a22766965772d333130223b693a35303b733a31333a22636865636b5f6f75742d333130223b693a35313b733a31323a22636865636b5f696e2d333130223b693a35323b733a323a222d30223b693a35333b733a31313a22736f7274696e672d323630223b693a35343b733a383a22766965772d333037223b693a35353b733a323a222d30223b693a35363b733a31393a2272657365744461696c7953616c65732d313233223b693a35373b733a32303a226578706f72744461696c7953616c65732d313233223b693a35383b733a32373a226368616e67655f64656c69766572795f616464726573732d313233223b693a35393b733a31303a227570646174652d333032223b693a36303b733a323a222d30223b693a36313b733a31303a227570646174652d333030223b693a36323b733a323a222d30223b693a36333b733a31303a227570646174652d323938223b693a36343b733a323a222d30223b693a36353b733a31343a22646561637469766174652d323931223b693a36363b733a31323a2261637469766174652d323931223b693a36373b733a31303a2264656c6574652d323931223b693a36383b733a383a22766965772d323931223b693a36393b733a31303a227570646174652d323931223b693a37303b733a373a226164642d323931223b693a37313b733a323a222d30223b693a37323b733a383a22636f70792d323835223b693a37333b733a31303a2264656c6574652d323835223b693a37343b733a383a22766965772d323835223b693a37353b733a31303a227570646174652d323835223b693a37363b733a373a226164642d323835223b693a37373b733a323a222d30223b693a37383b733a31303a2264656c6574652d323830223b693a37393b733a383a22766965772d323830223b693a38303b733a31303a227570646174652d323830223b693a38313b733a373a226164642d323830223b693a38323b733a323a222d30223b693a38333b733a31303a2264656c6574652d323735223b693a38343b733a383a22766965772d323735223b693a38353b733a31303a227570646174652d323735223b693a38363b733a373a226164642d323735223b693a38373b733a323a222d30223b693a38383b733a31303a2264656c6574652d323730223b693a38393b733a383a22766965772d323730223b693a39303b733a31303a227570646174652d323730223b693a39313b733a373a226164642d323730223b693a39323b733a323a222d30223b693a39333b733a31303a2264656c6574652d323635223b693a39343b733a383a22766965772d323635223b693a39353b733a31303a227570646174652d323635223b693a39363b733a373a226164642d323635223b693a39373b733a323a222d30223b693a39383b733a31303a2264656c6574652d323630223b693a39393b733a383a22766965772d323630223b693a3130303b733a31303a227570646174652d323630223b693a3130313b733a373a226164642d323630223b693a3130323b733a323a222d30223b693a3130333b733a31303a2264656c6574652d323535223b693a3130343b733a383a22766965772d323535223b693a3130353b733a31303a227570646174652d323535223b693a3130363b733a373a226164642d323535223b693a3130373b733a323a222d30223b693a3130383b733a31393a2275706c6f61645f637573746f6d65722d323439223b693a3130393b733a31303a2264656c6574652d323439223b693a3131303b733a383a22766965772d323439223b693a3131313b733a31303a227570646174652d323439223b693a3131323b733a373a226164642d323439223b693a3131333b733a323a222d30223b693a3131343b733a31303a2264656c6574652d323434223b693a3131353b733a383a22766965772d323434223b693a3131363b733a31303a227570646174652d323434223b693a3131373b733a373a226164642d323434223b693a3131383b733a323a222d30223b693a3131393b733a31363a226974656d5f626172636f64652d323334223b693a3132303b733a33323a2275706c6f61645f666f6f645f6d656e755f696e6772656469656e74732d323334223b693a3132313b733a32303a2275706c6f61645f666f6f645f6d656e752d323334223b693a3132323b733a31393a2261737369676e5f6d6f6469666965722d323334223b693a3132333b733a31363a22766965775f64657461696c732d323334223b693a3132343b733a31303a2264656c6574652d323334223b693a3132353b733a383a22766965772d323334223b693a3132363b733a31303a227570646174652d323334223b693a3132373b733a373a226164642d323334223b693a3132383b733a323a222d30223b693a3132393b733a31303a2264656c6574652d323239223b693a3133303b733a383a22766965772d323239223b693a3133313b733a31303a227570646174652d323239223b693a3133323b733a373a226164642d323239223b693a3133333b733a323a222d30223b693a3133343b733a31363a22766965775f64657461696c732d323233223b693a3133353b733a31303a2264656c6574652d323233223b693a3133363b733a383a22766965772d323233223b693a3133373b733a31303a227570646174652d323233223b693a3133383b733a373a226164642d323233223b693a3133393b733a323a222d30223b693a3134303b733a32313a2275706c6f61645f696e6772656469656e742d323137223b693a3134313b733a31303a2264656c6574652d323137223b693a3134323b733a383a22766965772d323137223b693a3134333b733a31303a227570646174652d323137223b693a3134343b733a373a226164642d323137223b693a3134353b733a323a222d30223b693a3134363b733a31303a2264656c6574652d323132223b693a3134373b733a383a22766965772d323132223b693a3134383b733a31303a227570646174652d323132223b693a3134393b733a373a226164642d323132223b693a3135303b733a323a222d30223b693a3135313b733a31303a2264656c6574652d323037223b693a3135323b733a383a22766965772d323037223b693a3135333b733a31303a227570646174652d323037223b693a3135343b733a373a226164642d323037223b693a3135353b733a323a222d30223b693a3135363b733a383a22766965772d323035223b693a3135373b733a323a222d30223b693a3135383b733a383a22766965772d323033223b693a3135393b733a323a222d30223b693a3136303b733a383a22766965772d323031223b693a3136313b733a323a222d30223b693a3136323b733a383a22766965772d313939223b693a3136333b733a323a222d30223b693a3136343b733a383a22766965772d313937223b693a3136353b733a323a222d30223b693a3136363b733a383a22766965772d313935223b693a3136373b733a323a222d30223b693a3136383b733a383a22766965772d313933223b693a3136393b733a323a222d30223b693a3137303b733a383a22766965772d313931223b693a3137313b733a323a222d30223b693a3137323b733a383a22766965772d313839223b693a3137333b733a323a222d30223b693a3137343b733a383a22766965772d313837223b693a3137353b733a323a222d30223b693a3137363b733a383a22766965772d313835223b693a3137373b733a323a222d30223b693a3137383b733a383a22766965772d313833223b693a3137393b733a323a222d30223b693a3138303b733a383a22766965772d313831223b693a3138313b733a323a222d30223b693a3138323b733a383a22766965772d313739223b693a3138333b733a323a222d30223b693a3138343b733a383a22766965772d313735223b693a3138353b733a323a222d30223b693a3138363b733a383a22766965772d313733223b693a3138373b733a323a222d30223b693a3138383b733a383a22766965772d313731223b693a3138393b733a323a222d30223b693a3139303b733a383a22766965772d313639223b693a3139313b733a323a222d30223b693a3139323b733a383a22766965772d313637223b693a3139333b733a323a222d30223b693a3139343b733a383a22766965772d313635223b693a3139353b733a323a222d30223b693a3139363b733a383a22766965772d313633223b693a3139373b733a323a222d30223b693a3139383b733a383a22766965772d313631223b693a3139393b733a323a222d30223b693a3230303b733a383a22766965772d313539223b693a3230313b733a323a222d30223b693a3230323b733a31303a2264656c6574652d313535223b693a3230333b733a383a22766965772d313535223b693a3230343b733a373a226164642d313535223b693a3230353b733a323a222d30223b693a3230363b733a31303a2264656c6574652d313531223b693a3230373b733a383a22766965772d313531223b693a3230383b733a373a226164642d313531223b693a3230393b733a323a222d30223b693a3231303b733a31303a2264656c6574652d313437223b693a3231313b733a383a22766965772d313437223b693a3231323b733a373a226164642d313437223b693a3231333b733a323a222d30223b693a3231343b733a31303a2264656c6574652d313432223b693a3231353b733a383a22766965772d313432223b693a3231363b733a31303a227570646174652d313432223b693a3231373b733a373a226164642d313432223b693a3231383b733a323a222d30223b693a3231393b733a31363a22766965775f64657461696c732d313337223b693a3232303b733a31303a2264656c6574652d313337223b693a3232313b733a383a22766965772d313337223b693a3232323b733a373a226164642d313337223b693a3232333b733a323a222d30223b693a3232343b733a31363a22766965775f64657461696c732d313331223b693a3232353b733a31303a2264656c6574652d313331223b693a3232363b733a383a22766965772d313331223b693a3232373b733a31303a227570646174652d313331223b693a3232383b733a373a226164642d313331223b693a3232393b733a323a222d30223b693a3233303b733a383a22766965772d313239223b693a3233313b733a323a222d30223b693a3233323b733a31303a2264656c6574652d313233223b693a3233333b733a31363a22766965775f696e766f6963652d313233223b693a3233343b733a31303a22726566756e642d313233223b693a3233353b733a383a22766965772d313233223b693a3233363b733a323a222d30223b693a3233373b733a31303a2264656c6574652d313138223b693a3233383b733a383a22766965772d313138223b693a3233393b733a31303a227570646174652d313138223b693a3234303b733a373a226164642d313138223b693a3234313b733a323a222d30223b693a3234323b733a31363a22766965775f64657461696c732d313132223b693a3234333b733a31303a2264656c6574652d313132223b693a3234343b733a383a22766965772d313132223b693a3234353b733a31303a227570646174652d313132223b693a3234363b733a373a226164642d313132223b693a3234373b733a323a222d30223b693a3234383b733a31363a22766965775f64657461696c732d313036223b693a3234393b733a31303a2264656c6574652d313036223b693a3235303b733a383a22766965772d313036223b693a3235313b733a31303a227570646174652d313036223b693a3235323b733a373a226164642d313036223b693a3235333b733a323a222d30223b693a3235343b733a383a22766965772d313034223b693a3235353b733a323a222d30223b693a3235363b733a383a22656e7465722d3938223b693a3235373b733a393a2264656c6574652d3938223b693a3235383b733a373a22766965772d3938223b693a3235393b733a393a227570646174652d3938223b693a3236303b733a363a226164642d3938223b693a3236313b733a323a222d30223b693a3236323b733a393a22706f735f32332d3733223b693a3236333b733a393a22706f735f32322d3733223b693a3236343b733a393a22706f735f32312d3733223b693a3236353b733a393a22706f735f32302d3733223b693a3236363b733a393a22706f735f31392d3733223b693a3236373b733a393a22706f735f31382d3733223b693a3236383b733a393a22706f735f31372d3733223b693a3236393b733a393a22706f735f31362d3733223b693a3237303b733a393a22706f735f31352d3733223b693a3237313b733a393a22706f735f31342d3733223b693a3237323b733a393a22706f735f31332d3733223b693a3237333b733a393a22706f735f31322d3733223b693a3237343b733a393a22706f735f31312d3733223b693a3237353b733a393a22706f735f31302d3733223b693a3237363b733a383a22706f735f392d3733223b693a3237373b733a383a22706f735f382d3733223b693a3237383b733a383a22706f735f372d3733223b693a3237393b733a383a22706f735f362d3733223b693a3238303b733a383a22706f735f352d3733223b693a3238313b733a383a22706f735f342d3733223b693a3238323b733a383a22706f735f332d3733223b693a3238333b733a383a22706f735f322d3733223b693a3238343b733a383a22706f735f312d3733223b693a3238353b733a323a222d30223b693a3238363b733a383a22656e7465722d3637223b693a3238373b733a393a2264656c6574652d3637223b693a3238383b733a373a22766965772d3637223b693a3238393b733a393a227570646174652d3637223b693a3239303b733a363a226164642d3637223b693a3239313b733a323a222d30223b693a3239323b733a393a227570646174652d3634223b693a3239333b733a323a222d30223b693a3239343b733a31323a22756e696e7374616c6c2d3632223b693a3239353b733a323a222d30223b693a3239363b733a393a227570646174652d3630223b693a3239373b733a323a222d30223b693a3239383b733a393a2264656c6574652d3535223b693a3239393b733a373a22766965772d3535223b693a3330303b733a393a227570646174652d3535223b693a3330313b733a363a226164642d3535223b693a3330323b733a323a222d30223b693a3330333b733a31333a227570646174655f7461782d3532223b693a3330343b733a323a222d30223b693a3330353b733a393a227570646174652d3439223b693a3330363b733a323a222d30223b693a3330373b733a393a2264656c6574652d3335223b693a3330383b733a373a22766965772d3335223b693a3330393b733a393a227570646174652d3335223b693a3331303b733a363a226164642d3335223b693a3331313b733a323a222d30223b693a3331323b733a393a227570646174652d3331223b693a3331333b733a373a22766965772d3331223b693a3331343b733a323a222d30223b693a3331353b733a393a2264656c6574652d3236223b693a3331363b733a373a22766965772d3236223b693a3331373b733a393a227570646174652d3236223b693a3331383b733a363a226164642d3236223b693a3331393b733a323a222d30223b693a3332303b733a393a2264656c6574652d3232223b693a3332313b733a373a22766965772d3232223b693a3332323b733a363a226164642d3232223b693a3332333b733a323a222d30223b693a3332343b733a31373a22626c6f636b5f616c6c5f757365722d3135223b693a3332353b733a31353a2273686f775f6f75746c6574732d3135223b693a3332363b733a393a2264656c6574652d3135223b693a3332373b733a373a22766965772d3135223b693a3332383b733a393a227570646174652d3135223b693a3332393b733a363a226164642d3135223b693a3333303b733a323a222d30223b693a3333313b733a393a227570646174652d3132223b693a3333323b733a373a22766965772d3132223b693a3333333b733a323a222d30223b693a3333343b733a383a227570646174652d39223b693a3333353b733a363a22766965772d39223b693a3333363b733a323a222d30223b693a3333373b733a383a227570646174652d36223b693a3333383b733a323a222d30223b693a3333393b733a383a227570646174652d33223b693a3334303b733a363a22766965772d33223b693a3334313b733a323a222d30223b693a3334323b733a363a22766965772d31223b693a3334333b733a323a222d30223b7d757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b64657369676e6174696f6e7c733a31313a2253757065722041646d696e223b66756c6c5f6e616d657c733a31303a2241646d696e2055736572223b73686f72745f6e616d657c733a313a2261223b70686f6e657c733a32363a22303331332d343336373431372020303334382d35353637343137223b656d61696c5f616464726573737c733a32353a226164696b68616e6f6666696369616c40676d61696c2e636f6d223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b73657373696f6e5f6f75746c6574737c733a313a2232223b6163746976655f6d656e755f746d707c733a303a22223b63757272656e63797c733a333a22504b52223b7a6f6e655f6e616d657c733a31323a22417369612f4b617261636869223b646174655f666f726d61747c733a353a22592f6d2f64223b627573696e6573735f6e616d657c733a33323a22436865657a792042697465204d412d4d412026616d703b616d703b20536f6e73223b776562736974657c733a31303a22666972656170702e6363223b63757272656e63795f706f736974696f6e7c733a31333a224265666f726520416d6f756e74223b707265636973696f6e7c733a313a2232223b64656661756c745f637573746f6d65727c733a313a2231223b6578706f72745f6461696c795f73616c657c733a363a22656e61626c65223b736572766963655f616d6f756e747c733a303a22223b74616b655f617761795f736572766963655f6368617267657c733a303a22223b64656c69766572795f616d6f756e747c733a303a22223b7461785f747970657c733a313a2231223b646563696d616c735f736570617261746f727c733a313a222e223b74686f7573616e64735f736570617261746f727c733a313a222c223b6f70656e5f636173685f6472617765725f7768656e5f7072696e74696e675f696e766f6963657c733a323a224e6f223b7768656e5f636c69636b696e675f6f6e5f6974656d5f696e5f706f737c733a313a2232223b69735f726f756e64696e675f656e61626c657c733a313a2230223b617474656e64616e63655f747970657c733a313a2232223b64656661756c745f6f726465725f747970657c733a313a2231223b69735f6c6f79616c74795f656e61626c657c733a373a2264697361626c65223b7072655f6f725f706f73745f7061796d656e747c733a313a2231223b6d696e696d756d5f706f696e745f746f5f72656465656d7c733a313a2230223b6c6f79616c74795f726174657c733a333a22302e31223b73706c69745f62696c6c7c733a313a2231223b706c6163655f6f726465725f746f6f6c7469707c733a343a2273686f77223b666f6f645f6d656e755f746f6f6c7469707c733a343a2273686f77223b7461626c655f62675f636f6c6f727c733a31303a227461626c655f62675f31223b6b6f745f7072696e745f6f6e6c696e655f73656c665f6f726465727c733a313a2231223b64656661756c745f7061796d656e747c733a313a2231223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b6c616e67756167655f6d616e69666573746f7c733a393a22726576686762726576223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f7469746c657c733a31313a224c6f63616c205461786573223b7461785f726567697374726174696f6e5f6e6f7c733a383a223332313332353837223b7461785f69735f6773747c733a323a224e6f223b6170706c795f6f6e5f64656c69766572795f6368617267657c733a313a2231223b73746174655f636f64657c733a373a2230393331323332223b6c6f67696e5f747970657c733a313a2231223b5f5f63695f766172737c613a333a7b733a31313a22657863657074696f6e5f32223b733a333a226f6c64223b733a393a22657863657074696f6e223b733a333a226f6c64223b733a31313a22657863657074696f6e5f33223b733a333a226f6c64223b7d6f75746c65745f6e616d657c733a31313a224368657a7a792042697465223b616464726573737c733a35323a22436865657a792042697465204d412d4d412026616d703b20536f6e732020506c617a6120536861682044657261692c2053776174223b656d61696c7c733a303a22223b6f6e6c696e655f6f726465725f6d6f64756c657c733a313a2232223b64656661756c745f7761697465727c733a313a2233223b6163746976655f7374617475737c733a363a22616374697665223b64656661756c745f6f726465725f747970655f64656c69766572795f707c733a303a22223b736d735f73656e645f6175746f7c733a313a2231223b73686f775f6f726465725f66756c6c5f73686f72747c733a313a2231223b6f6e6c696e655f73656c65637465645f6f75746c65747c733a313a2231223b696e766f6963655f6c6f676f7c733a33373a2237353861646564383439306236356465626361613133353137343731316431392e6a706567223b736974655f6e616d657c733a34343a224f6e6c696e65204f72646572206f6620436865657a792042697465204d412d4d412026616d703b20536f6e73223b666f6f7465727c733a34363a224f6e6c696e65204f72646572206f6620436865657a792042697465204d412d4d412026616d703b20536f6e730d0a223b73797374656d5f6c6f676f7c733a33373a2263396663303536343963623433393039393936376131633766346235306262612e6a706567223b66617669636f6e7c733a33373a2265323739303065656463626265326433653536613031383761666637376331352e6a706567223b776562736974655f7468656d655f636f6c6f727c733a373a2223643766663066223b6f75746c65745f69647c733a313a2231223b69735f7761697465727c733a323a224e6f223b636f756e7465725f69647c733a313a2231223b636f756e7465725f6e616d657c733a323a223031223b7072696e7465725f69647c733a313a2231223b62696c6c5f7072696e7465725f69647c733a313a2231223b706174687c733a303a22223b7469746c657c733a373a225072696e746572223b747970657c733a303a22223b636861726163746572735f7065725f6c696e657c733a313a2230223b7072696e7465725f69705f616464726573737c733a303a22223b7072696e7465725f706f72747c733a303a22223b7072696e74696e675f63686f6963657c733a31373a227765625f62726f777365725f706f707570223b697076666f75725f616464726573737c733a303a22223b7072696e745f666f726d61747c733a343a2238306d6d223b696e765f71725f636f64655f656e61626c655f7374617475737c733a363a22456e61626c65223b706174685f62696c6c7c733a303a22223b7469746c655f62696c6c7c733a373a225072696e746572223b747970655f62696c6c7c733a303a22223b636861726163746572735f7065725f6c696e655f62696c6c7c733a313a2230223b7072696e7465725f69705f616464726573735f62696c6c7c733a303a22223b7072696e7465725f706f72745f62696c6c7c733a303a22223b7072696e74696e675f63686f6963655f62696c6c7c733a31373a227765625f62726f777365725f706f707570223b697076666f75725f616464726573735f62696c6c7c733a303a22223b7072696e745f666f726d61745f62696c6c7c733a343a2238306d6d223b696e765f71725f636f64655f656e61626c655f7374617475735f62696c6c7c733a363a22456e61626c65223b6163746976655f6c6f67696e5f627574746f6e7c733a313a2231223b),
('38cb5d5689e29f1df075dd8cbd7375e78c2f0fac', '127.0.0.1', 1770104411, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737303130343431313b73797374656d5f76657273696f6e5f6e756d6265727c733a333a22372e36223b776c627c693a313b66756e6374696f6e5f6163636573737c613a3334343a7b693a303b733a383a22766965772d333730223b693a313b733a323a222d30223b693a323b733a33333a22616c6c5f73657474696e675f7265736572766174696f6e5f6f726465722d333638223b693a333b733a323a222d30223b693a343b733a32383a22616c6c5f73657474696e675f6f6e6c696e655f6f726465722d333636223b693a353b733a323a222d30223b693a363b733a32353a22616c6c5f73657474696e675f73656c5f6f726465722d333634223b693a373b733a323a222d30223b693a383b733a383a22766965772d333632223b693a393b733a323a222d30223b693a31303b733a31353a22616c6c5f73657474696e672d333538223b693a31313b733a323a222d30223b693a31323b733a31303a2264656c6574652d333533223b693a31333b733a383a22766965772d333533223b693a31343b733a31303a227570646174652d333533223b693a31353b733a373a226164642d333533223b693a31363b733a323a222d30223b693a31373b733a393a22706f735f32352d3733223b693a31383b733a393a2272657365742d333530223b693a31393b733a323a222d30223b693a32303b733a383a22766965772d333436223b693a32313b733a323a222d30223b693a32323b733a31363a22766965775f64657461696c732d333430223b693a32333b733a31303a2264656c6574652d333430223b693a32343b733a383a22766965772d333430223b693a32353b733a31303a227570646174652d333430223b693a32363b733a373a226164642d333430223b693a32373b733a323a222d30223b693a32383b733a31373a22736f7274696e67466f72504f532d323239223b693a32393b733a383a22766965772d333337223b693a33303b733a323a222d30223b693a33313b733a383a22766965772d333332223b693a33323b733a323a222d30223b693a33333b733a31303a227570646174652d333330223b693a33343b733a323a222d30223b693a33353b733a31303a2264656c6574652d333235223b693a33363b733a383a22766965772d333235223b693a33373b733a31303a227570646174652d333235223b693a33383b733a373a226164642d333235223b693a33393b733a323a222d30223b693a34303b733a383a22766965772d333231223b693a34313b733a323a222d30223b693a34323b733a31343a22646561637469766174652d333136223b693a34333b733a31323a2261637469766174652d333136223b693a34343b733a31303a2264656c6574652d333136223b693a34353b733a383a22766965772d333136223b693a34363b733a323a222d30223b693a34373b733a383a22766965772d333134223b693a34383b733a323a222d30223b693a34393b733a383a22766965772d333130223b693a35303b733a31333a22636865636b5f6f75742d333130223b693a35313b733a31323a22636865636b5f696e2d333130223b693a35323b733a323a222d30223b693a35333b733a31313a22736f7274696e672d323630223b693a35343b733a383a22766965772d333037223b693a35353b733a323a222d30223b693a35363b733a31393a2272657365744461696c7953616c65732d313233223b693a35373b733a32303a226578706f72744461696c7953616c65732d313233223b693a35383b733a32373a226368616e67655f64656c69766572795f616464726573732d313233223b693a35393b733a31303a227570646174652d333032223b693a36303b733a323a222d30223b693a36313b733a31303a227570646174652d333030223b693a36323b733a323a222d30223b693a36333b733a31303a227570646174652d323938223b693a36343b733a323a222d30223b693a36353b733a31343a22646561637469766174652d323931223b693a36363b733a31323a2261637469766174652d323931223b693a36373b733a31303a2264656c6574652d323931223b693a36383b733a383a22766965772d323931223b693a36393b733a31303a227570646174652d323931223b693a37303b733a373a226164642d323931223b693a37313b733a323a222d30223b693a37323b733a383a22636f70792d323835223b693a37333b733a31303a2264656c6574652d323835223b693a37343b733a383a22766965772d323835223b693a37353b733a31303a227570646174652d323835223b693a37363b733a373a226164642d323835223b693a37373b733a323a222d30223b693a37383b733a31303a2264656c6574652d323830223b693a37393b733a383a22766965772d323830223b693a38303b733a31303a227570646174652d323830223b693a38313b733a373a226164642d323830223b693a38323b733a323a222d30223b693a38333b733a31303a2264656c6574652d323735223b693a38343b733a383a22766965772d323735223b693a38353b733a31303a227570646174652d323735223b693a38363b733a373a226164642d323735223b693a38373b733a323a222d30223b693a38383b733a31303a2264656c6574652d323730223b693a38393b733a383a22766965772d323730223b693a39303b733a31303a227570646174652d323730223b693a39313b733a373a226164642d323730223b693a39323b733a323a222d30223b693a39333b733a31303a2264656c6574652d323635223b693a39343b733a383a22766965772d323635223b693a39353b733a31303a227570646174652d323635223b693a39363b733a373a226164642d323635223b693a39373b733a323a222d30223b693a39383b733a31303a2264656c6574652d323630223b693a39393b733a383a22766965772d323630223b693a3130303b733a31303a227570646174652d323630223b693a3130313b733a373a226164642d323630223b693a3130323b733a323a222d30223b693a3130333b733a31303a2264656c6574652d323535223b693a3130343b733a383a22766965772d323535223b693a3130353b733a31303a227570646174652d323535223b693a3130363b733a373a226164642d323535223b693a3130373b733a323a222d30223b693a3130383b733a31393a2275706c6f61645f637573746f6d65722d323439223b693a3130393b733a31303a2264656c6574652d323439223b693a3131303b733a383a22766965772d323439223b693a3131313b733a31303a227570646174652d323439223b693a3131323b733a373a226164642d323439223b693a3131333b733a323a222d30223b693a3131343b733a31303a2264656c6574652d323434223b693a3131353b733a383a22766965772d323434223b693a3131363b733a31303a227570646174652d323434223b693a3131373b733a373a226164642d323434223b693a3131383b733a323a222d30223b693a3131393b733a31363a226974656d5f626172636f64652d323334223b693a3132303b733a33323a2275706c6f61645f666f6f645f6d656e755f696e6772656469656e74732d323334223b693a3132313b733a32303a2275706c6f61645f666f6f645f6d656e752d323334223b693a3132323b733a31393a2261737369676e5f6d6f6469666965722d323334223b693a3132333b733a31363a22766965775f64657461696c732d323334223b693a3132343b733a31303a2264656c6574652d323334223b693a3132353b733a383a22766965772d323334223b693a3132363b733a31303a227570646174652d323334223b693a3132373b733a373a226164642d323334223b693a3132383b733a323a222d30223b693a3132393b733a31303a2264656c6574652d323239223b693a3133303b733a383a22766965772d323239223b693a3133313b733a31303a227570646174652d323239223b693a3133323b733a373a226164642d323239223b693a3133333b733a323a222d30223b693a3133343b733a31363a22766965775f64657461696c732d323233223b693a3133353b733a31303a2264656c6574652d323233223b693a3133363b733a383a22766965772d323233223b693a3133373b733a31303a227570646174652d323233223b693a3133383b733a373a226164642d323233223b693a3133393b733a323a222d30223b693a3134303b733a32313a2275706c6f61645f696e6772656469656e742d323137223b693a3134313b733a31303a2264656c6574652d323137223b693a3134323b733a383a22766965772d323137223b693a3134333b733a31303a227570646174652d323137223b693a3134343b733a373a226164642d323137223b693a3134353b733a323a222d30223b693a3134363b733a31303a2264656c6574652d323132223b693a3134373b733a383a22766965772d323132223b693a3134383b733a31303a227570646174652d323132223b693a3134393b733a373a226164642d323132223b693a3135303b733a323a222d30223b693a3135313b733a31303a2264656c6574652d323037223b693a3135323b733a383a22766965772d323037223b693a3135333b733a31303a227570646174652d323037223b693a3135343b733a373a226164642d323037223b693a3135353b733a323a222d30223b693a3135363b733a383a22766965772d323035223b693a3135373b733a323a222d30223b693a3135383b733a383a22766965772d323033223b693a3135393b733a323a222d30223b693a3136303b733a383a22766965772d323031223b693a3136313b733a323a222d30223b693a3136323b733a383a22766965772d313939223b693a3136333b733a323a222d30223b693a3136343b733a383a22766965772d313937223b693a3136353b733a323a222d30223b693a3136363b733a383a22766965772d313935223b693a3136373b733a323a222d30223b693a3136383b733a383a22766965772d313933223b693a3136393b733a323a222d30223b693a3137303b733a383a22766965772d313931223b693a3137313b733a323a222d30223b693a3137323b733a383a22766965772d313839223b693a3137333b733a323a222d30223b693a3137343b733a383a22766965772d313837223b693a3137353b733a323a222d30223b693a3137363b733a383a22766965772d313835223b693a3137373b733a323a222d30223b693a3137383b733a383a22766965772d313833223b693a3137393b733a323a222d30223b693a3138303b733a383a22766965772d313831223b693a3138313b733a323a222d30223b693a3138323b733a383a22766965772d313739223b693a3138333b733a323a222d30223b693a3138343b733a383a22766965772d313735223b693a3138353b733a323a222d30223b693a3138363b733a383a22766965772d313733223b693a3138373b733a323a222d30223b693a3138383b733a383a22766965772d313731223b693a3138393b733a323a222d30223b693a3139303b733a383a22766965772d313639223b693a3139313b733a323a222d30223b693a3139323b733a383a22766965772d313637223b693a3139333b733a323a222d30223b693a3139343b733a383a22766965772d313635223b693a3139353b733a323a222d30223b693a3139363b733a383a22766965772d313633223b693a3139373b733a323a222d30223b693a3139383b733a383a22766965772d313631223b693a3139393b733a323a222d30223b693a3230303b733a383a22766965772d313539223b693a3230313b733a323a222d30223b693a3230323b733a31303a2264656c6574652d313535223b693a3230333b733a383a22766965772d313535223b693a3230343b733a373a226164642d313535223b693a3230353b733a323a222d30223b693a3230363b733a31303a2264656c6574652d313531223b693a3230373b733a383a22766965772d313531223b693a3230383b733a373a226164642d313531223b693a3230393b733a323a222d30223b693a3231303b733a31303a2264656c6574652d313437223b693a3231313b733a383a22766965772d313437223b693a3231323b733a373a226164642d313437223b693a3231333b733a323a222d30223b693a3231343b733a31303a2264656c6574652d313432223b693a3231353b733a383a22766965772d313432223b693a3231363b733a31303a227570646174652d313432223b693a3231373b733a373a226164642d313432223b693a3231383b733a323a222d30223b693a3231393b733a31363a22766965775f64657461696c732d313337223b693a3232303b733a31303a2264656c6574652d313337223b693a3232313b733a383a22766965772d313337223b693a3232323b733a373a226164642d313337223b693a3232333b733a323a222d30223b693a3232343b733a31363a22766965775f64657461696c732d313331223b693a3232353b733a31303a2264656c6574652d313331223b693a3232363b733a383a22766965772d313331223b693a3232373b733a31303a227570646174652d313331223b693a3232383b733a373a226164642d313331223b693a3232393b733a323a222d30223b693a3233303b733a383a22766965772d313239223b693a3233313b733a323a222d30223b693a3233323b733a31303a2264656c6574652d313233223b693a3233333b733a31363a22766965775f696e766f6963652d313233223b693a3233343b733a31303a22726566756e642d313233223b693a3233353b733a383a22766965772d313233223b693a3233363b733a323a222d30223b693a3233373b733a31303a2264656c6574652d313138223b693a3233383b733a383a22766965772d313138223b693a3233393b733a31303a227570646174652d313138223b693a3234303b733a373a226164642d313138223b693a3234313b733a323a222d30223b693a3234323b733a31363a22766965775f64657461696c732d313132223b693a3234333b733a31303a2264656c6574652d313132223b693a3234343b733a383a22766965772d313132223b693a3234353b733a31303a227570646174652d313132223b693a3234363b733a373a226164642d313132223b693a3234373b733a323a222d30223b693a3234383b733a31363a22766965775f64657461696c732d313036223b693a3234393b733a31303a2264656c6574652d313036223b693a3235303b733a383a22766965772d313036223b693a3235313b733a31303a227570646174652d313036223b693a3235323b733a373a226164642d313036223b693a3235333b733a323a222d30223b693a3235343b733a383a22766965772d313034223b693a3235353b733a323a222d30223b693a3235363b733a383a22656e7465722d3938223b693a3235373b733a393a2264656c6574652d3938223b693a3235383b733a373a22766965772d3938223b693a3235393b733a393a227570646174652d3938223b693a3236303b733a363a226164642d3938223b693a3236313b733a323a222d30223b693a3236323b733a393a22706f735f32332d3733223b693a3236333b733a393a22706f735f32322d3733223b693a3236343b733a393a22706f735f32312d3733223b693a3236353b733a393a22706f735f32302d3733223b693a3236363b733a393a22706f735f31392d3733223b693a3236373b733a393a22706f735f31382d3733223b693a3236383b733a393a22706f735f31372d3733223b693a3236393b733a393a22706f735f31362d3733223b693a3237303b733a393a22706f735f31352d3733223b693a3237313b733a393a22706f735f31342d3733223b693a3237323b733a393a22706f735f31332d3733223b693a3237333b733a393a22706f735f31322d3733223b693a3237343b733a393a22706f735f31312d3733223b693a3237353b733a393a22706f735f31302d3733223b693a3237363b733a383a22706f735f392d3733223b693a3237373b733a383a22706f735f382d3733223b693a3237383b733a383a22706f735f372d3733223b693a3237393b733a383a22706f735f362d3733223b693a3238303b733a383a22706f735f352d3733223b693a3238313b733a383a22706f735f342d3733223b693a3238323b733a383a22706f735f332d3733223b693a3238333b733a383a22706f735f322d3733223b693a3238343b733a383a22706f735f312d3733223b693a3238353b733a323a222d30223b693a3238363b733a383a22656e7465722d3637223b693a3238373b733a393a2264656c6574652d3637223b693a3238383b733a373a22766965772d3637223b693a3238393b733a393a227570646174652d3637223b693a3239303b733a363a226164642d3637223b693a3239313b733a323a222d30223b693a3239323b733a393a227570646174652d3634223b693a3239333b733a323a222d30223b693a3239343b733a31323a22756e696e7374616c6c2d3632223b693a3239353b733a323a222d30223b693a3239363b733a393a227570646174652d3630223b693a3239373b733a323a222d30223b693a3239383b733a393a2264656c6574652d3535223b693a3239393b733a373a22766965772d3535223b693a3330303b733a393a227570646174652d3535223b693a3330313b733a363a226164642d3535223b693a3330323b733a323a222d30223b693a3330333b733a31333a227570646174655f7461782d3532223b693a3330343b733a323a222d30223b693a3330353b733a393a227570646174652d3439223b693a3330363b733a323a222d30223b693a3330373b733a393a2264656c6574652d3335223b693a3330383b733a373a22766965772d3335223b693a3330393b733a393a227570646174652d3335223b693a3331303b733a363a226164642d3335223b693a3331313b733a323a222d30223b693a3331323b733a393a227570646174652d3331223b693a3331333b733a373a22766965772d3331223b693a3331343b733a323a222d30223b693a3331353b733a393a2264656c6574652d3236223b693a3331363b733a373a22766965772d3236223b693a3331373b733a393a227570646174652d3236223b693a3331383b733a363a226164642d3236223b693a3331393b733a323a222d30223b693a3332303b733a393a2264656c6574652d3232223b693a3332313b733a373a22766965772d3232223b693a3332323b733a363a226164642d3232223b693a3332333b733a323a222d30223b693a3332343b733a31373a22626c6f636b5f616c6c5f757365722d3135223b693a3332353b733a31353a2273686f775f6f75746c6574732d3135223b693a3332363b733a393a2264656c6574652d3135223b693a3332373b733a373a22766965772d3135223b693a3332383b733a393a227570646174652d3135223b693a3332393b733a363a226164642d3135223b693a3333303b733a323a222d30223b693a3333313b733a393a227570646174652d3132223b693a3333323b733a373a22766965772d3132223b693a3333333b733a323a222d30223b693a3333343b733a383a227570646174652d39223b693a3333353b733a363a22766965772d39223b693a3333363b733a323a222d30223b693a3333373b733a383a227570646174652d36223b693a3333383b733a323a222d30223b693a3333393b733a383a227570646174652d33223b693a3334303b733a363a22766965772d33223b693a3334313b733a323a222d30223b693a3334323b733a363a22766965772d31223b693a3334333b733a323a222d30223b7d757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b64657369676e6174696f6e7c733a31313a2253757065722041646d696e223b66756c6c5f6e616d657c733a31303a2241646d696e2055736572223b73686f72745f6e616d657c733a313a2261223b70686f6e657c733a32363a22303331332d343336373431372020303334382d35353637343137223b656d61696c5f616464726573737c733a32353a226164696b68616e6f6666696369616c40676d61696c2e636f6d223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b73657373696f6e5f6f75746c6574737c733a313a2232223b6163746976655f6d656e755f746d707c733a303a22223b63757272656e63797c733a333a22504b52223b7a6f6e655f6e616d657c733a31323a22417369612f4b617261636869223b646174655f666f726d61747c733a353a22592f6d2f64223b627573696e6573735f6e616d657c733a33323a22436865657a792042697465204d412d4d412026616d703b616d703b20536f6e73223b776562736974657c733a31303a22666972656170702e6363223b63757272656e63795f706f736974696f6e7c733a31333a224265666f726520416d6f756e74223b707265636973696f6e7c733a313a2232223b64656661756c745f637573746f6d65727c733a313a2231223b6578706f72745f6461696c795f73616c657c733a363a22656e61626c65223b736572766963655f616d6f756e747c733a303a22223b74616b655f617761795f736572766963655f6368617267657c733a303a22223b64656c69766572795f616d6f756e747c733a303a22223b7461785f747970657c733a313a2231223b646563696d616c735f736570617261746f727c733a313a222e223b74686f7573616e64735f736570617261746f727c733a313a222c223b6f70656e5f636173685f6472617765725f7768656e5f7072696e74696e675f696e766f6963657c733a323a224e6f223b7768656e5f636c69636b696e675f6f6e5f6974656d5f696e5f706f737c733a313a2232223b69735f726f756e64696e675f656e61626c657c733a313a2230223b617474656e64616e63655f747970657c733a313a2232223b64656661756c745f6f726465725f747970657c733a313a2231223b69735f6c6f79616c74795f656e61626c657c733a373a2264697361626c65223b7072655f6f725f706f73745f7061796d656e747c733a313a2231223b6d696e696d756d5f706f696e745f746f5f72656465656d7c733a313a2230223b6c6f79616c74795f726174657c733a333a22302e31223b73706c69745f62696c6c7c733a313a2231223b706c6163655f6f726465725f746f6f6c7469707c733a343a2273686f77223b666f6f645f6d656e755f746f6f6c7469707c733a343a2273686f77223b7461626c655f62675f636f6c6f727c733a31303a227461626c655f62675f31223b6b6f745f7072696e745f6f6e6c696e655f73656c665f6f726465727c733a313a2231223b64656661756c745f7061796d656e747c733a313a2231223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b6c616e67756167655f6d616e69666573746f7c733a393a22726576686762726576223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f7469746c657c733a31313a224c6f63616c205461786573223b7461785f726567697374726174696f6e5f6e6f7c733a383a223332313332353837223b7461785f69735f6773747c733a323a224e6f223b6170706c795f6f6e5f64656c69766572795f6368617267657c733a313a2231223b73746174655f636f64657c733a373a2230393331323332223b6c6f67696e5f747970657c733a313a2231223b5f5f63695f766172737c613a333a7b733a31313a22657863657074696f6e5f32223b733a333a226f6c64223b733a393a22657863657074696f6e223b733a333a226f6c64223b733a31313a22657863657074696f6e5f33223b733a333a226f6c64223b7d6f75746c65745f6e616d657c733a31313a224368657a7a792042697465223b616464726573737c733a35323a22436865657a792042697465204d412d4d412026616d703b20536f6e732020506c617a6120536861682044657261692c2053776174223b656d61696c7c733a303a22223b6f6e6c696e655f6f726465725f6d6f64756c657c733a313a2232223b64656661756c745f7761697465727c733a313a2233223b6163746976655f7374617475737c733a363a22616374697665223b64656661756c745f6f726465725f747970655f64656c69766572795f707c733a303a22223b736d735f73656e645f6175746f7c733a313a2231223b73686f775f6f726465725f66756c6c5f73686f72747c733a313a2231223b6f6e6c696e655f73656c65637465645f6f75746c65747c733a313a2231223b696e766f6963655f6c6f676f7c733a33373a2237353861646564383439306236356465626361613133353137343731316431392e6a706567223b736974655f6e616d657c733a34343a224f6e6c696e65204f72646572206f6620436865657a792042697465204d412d4d412026616d703b20536f6e73223b666f6f7465727c733a34363a224f6e6c696e65204f72646572206f6620436865657a792042697465204d412d4d412026616d703b20536f6e730d0a223b73797374656d5f6c6f676f7c733a33373a2263396663303536343963623433393039393936376131633766346235306262612e6a706567223b66617669636f6e7c733a33373a2265323739303065656463626265326433653536613031383761666637376331352e6a706567223b776562736974655f7468656d655f636f6c6f727c733a373a2223643766663066223b6f75746c65745f69647c733a313a2231223b69735f7761697465727c733a323a224e6f223b636f756e7465725f69647c733a313a2231223b636f756e7465725f6e616d657c733a323a223031223b7072696e7465725f69647c733a313a2231223b62696c6c5f7072696e7465725f69647c733a313a2231223b706174687c733a303a22223b7469746c657c733a373a225072696e746572223b747970657c733a303a22223b636861726163746572735f7065725f6c696e657c733a313a2230223b7072696e7465725f69705f616464726573737c733a303a22223b7072696e7465725f706f72747c733a303a22223b7072696e74696e675f63686f6963657c733a31373a227765625f62726f777365725f706f707570223b697076666f75725f616464726573737c733a303a22223b7072696e745f666f726d61747c733a343a2238306d6d223b696e765f71725f636f64655f656e61626c655f7374617475737c733a363a22456e61626c65223b706174685f62696c6c7c733a303a22223b7469746c655f62696c6c7c733a373a225072696e746572223b747970655f62696c6c7c733a303a22223b636861726163746572735f7065725f6c696e655f62696c6c7c733a313a2230223b7072696e7465725f69705f616464726573735f62696c6c7c733a303a22223b7072696e7465725f706f72745f62696c6c7c733a303a22223b7072696e74696e675f63686f6963655f62696c6c7c733a31373a227765625f62726f777365725f706f707570223b697076666f75725f616464726573735f62696c6c7c733a303a22223b7072696e745f666f726d61745f62696c6c7c733a343a2238306d6d223b696e765f71725f636f64655f656e61626c655f7374617475735f62696c6c7c733a363a22456e61626c65223b6163746976655f6c6f67696e5f627574746f6e7c733a313a2231223b);
INSERT INTO `tbl_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('b8b97f7e90cee91740e2d003b2715f9184a36eb1', '127.0.0.1', 1770104753, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737303130343735333b73797374656d5f76657273696f6e5f6e756d6265727c733a333a22372e36223b776c627c693a313b66756e6374696f6e5f6163636573737c613a3334343a7b693a303b733a383a22766965772d333730223b693a313b733a323a222d30223b693a323b733a33333a22616c6c5f73657474696e675f7265736572766174696f6e5f6f726465722d333638223b693a333b733a323a222d30223b693a343b733a32383a22616c6c5f73657474696e675f6f6e6c696e655f6f726465722d333636223b693a353b733a323a222d30223b693a363b733a32353a22616c6c5f73657474696e675f73656c5f6f726465722d333634223b693a373b733a323a222d30223b693a383b733a383a22766965772d333632223b693a393b733a323a222d30223b693a31303b733a31353a22616c6c5f73657474696e672d333538223b693a31313b733a323a222d30223b693a31323b733a31303a2264656c6574652d333533223b693a31333b733a383a22766965772d333533223b693a31343b733a31303a227570646174652d333533223b693a31353b733a373a226164642d333533223b693a31363b733a323a222d30223b693a31373b733a393a22706f735f32352d3733223b693a31383b733a393a2272657365742d333530223b693a31393b733a323a222d30223b693a32303b733a383a22766965772d333436223b693a32313b733a323a222d30223b693a32323b733a31363a22766965775f64657461696c732d333430223b693a32333b733a31303a2264656c6574652d333430223b693a32343b733a383a22766965772d333430223b693a32353b733a31303a227570646174652d333430223b693a32363b733a373a226164642d333430223b693a32373b733a323a222d30223b693a32383b733a31373a22736f7274696e67466f72504f532d323239223b693a32393b733a383a22766965772d333337223b693a33303b733a323a222d30223b693a33313b733a383a22766965772d333332223b693a33323b733a323a222d30223b693a33333b733a31303a227570646174652d333330223b693a33343b733a323a222d30223b693a33353b733a31303a2264656c6574652d333235223b693a33363b733a383a22766965772d333235223b693a33373b733a31303a227570646174652d333235223b693a33383b733a373a226164642d333235223b693a33393b733a323a222d30223b693a34303b733a383a22766965772d333231223b693a34313b733a323a222d30223b693a34323b733a31343a22646561637469766174652d333136223b693a34333b733a31323a2261637469766174652d333136223b693a34343b733a31303a2264656c6574652d333136223b693a34353b733a383a22766965772d333136223b693a34363b733a323a222d30223b693a34373b733a383a22766965772d333134223b693a34383b733a323a222d30223b693a34393b733a383a22766965772d333130223b693a35303b733a31333a22636865636b5f6f75742d333130223b693a35313b733a31323a22636865636b5f696e2d333130223b693a35323b733a323a222d30223b693a35333b733a31313a22736f7274696e672d323630223b693a35343b733a383a22766965772d333037223b693a35353b733a323a222d30223b693a35363b733a31393a2272657365744461696c7953616c65732d313233223b693a35373b733a32303a226578706f72744461696c7953616c65732d313233223b693a35383b733a32373a226368616e67655f64656c69766572795f616464726573732d313233223b693a35393b733a31303a227570646174652d333032223b693a36303b733a323a222d30223b693a36313b733a31303a227570646174652d333030223b693a36323b733a323a222d30223b693a36333b733a31303a227570646174652d323938223b693a36343b733a323a222d30223b693a36353b733a31343a22646561637469766174652d323931223b693a36363b733a31323a2261637469766174652d323931223b693a36373b733a31303a2264656c6574652d323931223b693a36383b733a383a22766965772d323931223b693a36393b733a31303a227570646174652d323931223b693a37303b733a373a226164642d323931223b693a37313b733a323a222d30223b693a37323b733a383a22636f70792d323835223b693a37333b733a31303a2264656c6574652d323835223b693a37343b733a383a22766965772d323835223b693a37353b733a31303a227570646174652d323835223b693a37363b733a373a226164642d323835223b693a37373b733a323a222d30223b693a37383b733a31303a2264656c6574652d323830223b693a37393b733a383a22766965772d323830223b693a38303b733a31303a227570646174652d323830223b693a38313b733a373a226164642d323830223b693a38323b733a323a222d30223b693a38333b733a31303a2264656c6574652d323735223b693a38343b733a383a22766965772d323735223b693a38353b733a31303a227570646174652d323735223b693a38363b733a373a226164642d323735223b693a38373b733a323a222d30223b693a38383b733a31303a2264656c6574652d323730223b693a38393b733a383a22766965772d323730223b693a39303b733a31303a227570646174652d323730223b693a39313b733a373a226164642d323730223b693a39323b733a323a222d30223b693a39333b733a31303a2264656c6574652d323635223b693a39343b733a383a22766965772d323635223b693a39353b733a31303a227570646174652d323635223b693a39363b733a373a226164642d323635223b693a39373b733a323a222d30223b693a39383b733a31303a2264656c6574652d323630223b693a39393b733a383a22766965772d323630223b693a3130303b733a31303a227570646174652d323630223b693a3130313b733a373a226164642d323630223b693a3130323b733a323a222d30223b693a3130333b733a31303a2264656c6574652d323535223b693a3130343b733a383a22766965772d323535223b693a3130353b733a31303a227570646174652d323535223b693a3130363b733a373a226164642d323535223b693a3130373b733a323a222d30223b693a3130383b733a31393a2275706c6f61645f637573746f6d65722d323439223b693a3130393b733a31303a2264656c6574652d323439223b693a3131303b733a383a22766965772d323439223b693a3131313b733a31303a227570646174652d323439223b693a3131323b733a373a226164642d323439223b693a3131333b733a323a222d30223b693a3131343b733a31303a2264656c6574652d323434223b693a3131353b733a383a22766965772d323434223b693a3131363b733a31303a227570646174652d323434223b693a3131373b733a373a226164642d323434223b693a3131383b733a323a222d30223b693a3131393b733a31363a226974656d5f626172636f64652d323334223b693a3132303b733a33323a2275706c6f61645f666f6f645f6d656e755f696e6772656469656e74732d323334223b693a3132313b733a32303a2275706c6f61645f666f6f645f6d656e752d323334223b693a3132323b733a31393a2261737369676e5f6d6f6469666965722d323334223b693a3132333b733a31363a22766965775f64657461696c732d323334223b693a3132343b733a31303a2264656c6574652d323334223b693a3132353b733a383a22766965772d323334223b693a3132363b733a31303a227570646174652d323334223b693a3132373b733a373a226164642d323334223b693a3132383b733a323a222d30223b693a3132393b733a31303a2264656c6574652d323239223b693a3133303b733a383a22766965772d323239223b693a3133313b733a31303a227570646174652d323239223b693a3133323b733a373a226164642d323239223b693a3133333b733a323a222d30223b693a3133343b733a31363a22766965775f64657461696c732d323233223b693a3133353b733a31303a2264656c6574652d323233223b693a3133363b733a383a22766965772d323233223b693a3133373b733a31303a227570646174652d323233223b693a3133383b733a373a226164642d323233223b693a3133393b733a323a222d30223b693a3134303b733a32313a2275706c6f61645f696e6772656469656e742d323137223b693a3134313b733a31303a2264656c6574652d323137223b693a3134323b733a383a22766965772d323137223b693a3134333b733a31303a227570646174652d323137223b693a3134343b733a373a226164642d323137223b693a3134353b733a323a222d30223b693a3134363b733a31303a2264656c6574652d323132223b693a3134373b733a383a22766965772d323132223b693a3134383b733a31303a227570646174652d323132223b693a3134393b733a373a226164642d323132223b693a3135303b733a323a222d30223b693a3135313b733a31303a2264656c6574652d323037223b693a3135323b733a383a22766965772d323037223b693a3135333b733a31303a227570646174652d323037223b693a3135343b733a373a226164642d323037223b693a3135353b733a323a222d30223b693a3135363b733a383a22766965772d323035223b693a3135373b733a323a222d30223b693a3135383b733a383a22766965772d323033223b693a3135393b733a323a222d30223b693a3136303b733a383a22766965772d323031223b693a3136313b733a323a222d30223b693a3136323b733a383a22766965772d313939223b693a3136333b733a323a222d30223b693a3136343b733a383a22766965772d313937223b693a3136353b733a323a222d30223b693a3136363b733a383a22766965772d313935223b693a3136373b733a323a222d30223b693a3136383b733a383a22766965772d313933223b693a3136393b733a323a222d30223b693a3137303b733a383a22766965772d313931223b693a3137313b733a323a222d30223b693a3137323b733a383a22766965772d313839223b693a3137333b733a323a222d30223b693a3137343b733a383a22766965772d313837223b693a3137353b733a323a222d30223b693a3137363b733a383a22766965772d313835223b693a3137373b733a323a222d30223b693a3137383b733a383a22766965772d313833223b693a3137393b733a323a222d30223b693a3138303b733a383a22766965772d313831223b693a3138313b733a323a222d30223b693a3138323b733a383a22766965772d313739223b693a3138333b733a323a222d30223b693a3138343b733a383a22766965772d313735223b693a3138353b733a323a222d30223b693a3138363b733a383a22766965772d313733223b693a3138373b733a323a222d30223b693a3138383b733a383a22766965772d313731223b693a3138393b733a323a222d30223b693a3139303b733a383a22766965772d313639223b693a3139313b733a323a222d30223b693a3139323b733a383a22766965772d313637223b693a3139333b733a323a222d30223b693a3139343b733a383a22766965772d313635223b693a3139353b733a323a222d30223b693a3139363b733a383a22766965772d313633223b693a3139373b733a323a222d30223b693a3139383b733a383a22766965772d313631223b693a3139393b733a323a222d30223b693a3230303b733a383a22766965772d313539223b693a3230313b733a323a222d30223b693a3230323b733a31303a2264656c6574652d313535223b693a3230333b733a383a22766965772d313535223b693a3230343b733a373a226164642d313535223b693a3230353b733a323a222d30223b693a3230363b733a31303a2264656c6574652d313531223b693a3230373b733a383a22766965772d313531223b693a3230383b733a373a226164642d313531223b693a3230393b733a323a222d30223b693a3231303b733a31303a2264656c6574652d313437223b693a3231313b733a383a22766965772d313437223b693a3231323b733a373a226164642d313437223b693a3231333b733a323a222d30223b693a3231343b733a31303a2264656c6574652d313432223b693a3231353b733a383a22766965772d313432223b693a3231363b733a31303a227570646174652d313432223b693a3231373b733a373a226164642d313432223b693a3231383b733a323a222d30223b693a3231393b733a31363a22766965775f64657461696c732d313337223b693a3232303b733a31303a2264656c6574652d313337223b693a3232313b733a383a22766965772d313337223b693a3232323b733a373a226164642d313337223b693a3232333b733a323a222d30223b693a3232343b733a31363a22766965775f64657461696c732d313331223b693a3232353b733a31303a2264656c6574652d313331223b693a3232363b733a383a22766965772d313331223b693a3232373b733a31303a227570646174652d313331223b693a3232383b733a373a226164642d313331223b693a3232393b733a323a222d30223b693a3233303b733a383a22766965772d313239223b693a3233313b733a323a222d30223b693a3233323b733a31303a2264656c6574652d313233223b693a3233333b733a31363a22766965775f696e766f6963652d313233223b693a3233343b733a31303a22726566756e642d313233223b693a3233353b733a383a22766965772d313233223b693a3233363b733a323a222d30223b693a3233373b733a31303a2264656c6574652d313138223b693a3233383b733a383a22766965772d313138223b693a3233393b733a31303a227570646174652d313138223b693a3234303b733a373a226164642d313138223b693a3234313b733a323a222d30223b693a3234323b733a31363a22766965775f64657461696c732d313132223b693a3234333b733a31303a2264656c6574652d313132223b693a3234343b733a383a22766965772d313132223b693a3234353b733a31303a227570646174652d313132223b693a3234363b733a373a226164642d313132223b693a3234373b733a323a222d30223b693a3234383b733a31363a22766965775f64657461696c732d313036223b693a3234393b733a31303a2264656c6574652d313036223b693a3235303b733a383a22766965772d313036223b693a3235313b733a31303a227570646174652d313036223b693a3235323b733a373a226164642d313036223b693a3235333b733a323a222d30223b693a3235343b733a383a22766965772d313034223b693a3235353b733a323a222d30223b693a3235363b733a383a22656e7465722d3938223b693a3235373b733a393a2264656c6574652d3938223b693a3235383b733a373a22766965772d3938223b693a3235393b733a393a227570646174652d3938223b693a3236303b733a363a226164642d3938223b693a3236313b733a323a222d30223b693a3236323b733a393a22706f735f32332d3733223b693a3236333b733a393a22706f735f32322d3733223b693a3236343b733a393a22706f735f32312d3733223b693a3236353b733a393a22706f735f32302d3733223b693a3236363b733a393a22706f735f31392d3733223b693a3236373b733a393a22706f735f31382d3733223b693a3236383b733a393a22706f735f31372d3733223b693a3236393b733a393a22706f735f31362d3733223b693a3237303b733a393a22706f735f31352d3733223b693a3237313b733a393a22706f735f31342d3733223b693a3237323b733a393a22706f735f31332d3733223b693a3237333b733a393a22706f735f31322d3733223b693a3237343b733a393a22706f735f31312d3733223b693a3237353b733a393a22706f735f31302d3733223b693a3237363b733a383a22706f735f392d3733223b693a3237373b733a383a22706f735f382d3733223b693a3237383b733a383a22706f735f372d3733223b693a3237393b733a383a22706f735f362d3733223b693a3238303b733a383a22706f735f352d3733223b693a3238313b733a383a22706f735f342d3733223b693a3238323b733a383a22706f735f332d3733223b693a3238333b733a383a22706f735f322d3733223b693a3238343b733a383a22706f735f312d3733223b693a3238353b733a323a222d30223b693a3238363b733a383a22656e7465722d3637223b693a3238373b733a393a2264656c6574652d3637223b693a3238383b733a373a22766965772d3637223b693a3238393b733a393a227570646174652d3637223b693a3239303b733a363a226164642d3637223b693a3239313b733a323a222d30223b693a3239323b733a393a227570646174652d3634223b693a3239333b733a323a222d30223b693a3239343b733a31323a22756e696e7374616c6c2d3632223b693a3239353b733a323a222d30223b693a3239363b733a393a227570646174652d3630223b693a3239373b733a323a222d30223b693a3239383b733a393a2264656c6574652d3535223b693a3239393b733a373a22766965772d3535223b693a3330303b733a393a227570646174652d3535223b693a3330313b733a363a226164642d3535223b693a3330323b733a323a222d30223b693a3330333b733a31333a227570646174655f7461782d3532223b693a3330343b733a323a222d30223b693a3330353b733a393a227570646174652d3439223b693a3330363b733a323a222d30223b693a3330373b733a393a2264656c6574652d3335223b693a3330383b733a373a22766965772d3335223b693a3330393b733a393a227570646174652d3335223b693a3331303b733a363a226164642d3335223b693a3331313b733a323a222d30223b693a3331323b733a393a227570646174652d3331223b693a3331333b733a373a22766965772d3331223b693a3331343b733a323a222d30223b693a3331353b733a393a2264656c6574652d3236223b693a3331363b733a373a22766965772d3236223b693a3331373b733a393a227570646174652d3236223b693a3331383b733a363a226164642d3236223b693a3331393b733a323a222d30223b693a3332303b733a393a2264656c6574652d3232223b693a3332313b733a373a22766965772d3232223b693a3332323b733a363a226164642d3232223b693a3332333b733a323a222d30223b693a3332343b733a31373a22626c6f636b5f616c6c5f757365722d3135223b693a3332353b733a31353a2273686f775f6f75746c6574732d3135223b693a3332363b733a393a2264656c6574652d3135223b693a3332373b733a373a22766965772d3135223b693a3332383b733a393a227570646174652d3135223b693a3332393b733a363a226164642d3135223b693a3333303b733a323a222d30223b693a3333313b733a393a227570646174652d3132223b693a3333323b733a373a22766965772d3132223b693a3333333b733a323a222d30223b693a3333343b733a383a227570646174652d39223b693a3333353b733a363a22766965772d39223b693a3333363b733a323a222d30223b693a3333373b733a383a227570646174652d36223b693a3333383b733a323a222d30223b693a3333393b733a383a227570646174652d33223b693a3334303b733a363a22766965772d33223b693a3334313b733a323a222d30223b693a3334323b733a363a22766965772d31223b693a3334333b733a323a222d30223b7d757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b64657369676e6174696f6e7c733a31313a2253757065722041646d696e223b66756c6c5f6e616d657c733a31303a2241646d696e2055736572223b73686f72745f6e616d657c733a313a2261223b70686f6e657c733a31323a22393233343238393237333035223b656d61696c5f616464726573737c733a31353a2261646d696e4061646d696e2e636f6d223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b73657373696f6e5f6f75746c6574737c733a313a2232223b6163746976655f6d656e755f746d707c733a303a22223b63757272656e63797c733a333a22504b52223b7a6f6e655f6e616d657c733a31323a22417369612f4b617261636869223b646174655f666f726d61747c733a353a22592f6d2f64223b627573696e6573735f6e616d657c733a33323a22436865657a792042697465204d412d4d412026616d703b616d703b20536f6e73223b776562736974657c733a31303a22666972656170702e6363223b63757272656e63795f706f736974696f6e7c733a31333a224265666f726520416d6f756e74223b707265636973696f6e7c733a313a2232223b64656661756c745f637573746f6d65727c733a313a2231223b6578706f72745f6461696c795f73616c657c733a363a22656e61626c65223b736572766963655f616d6f756e747c733a303a22223b74616b655f617761795f736572766963655f6368617267657c733a303a22223b64656c69766572795f616d6f756e747c733a303a22223b7461785f747970657c733a313a2231223b646563696d616c735f736570617261746f727c733a313a222e223b74686f7573616e64735f736570617261746f727c733a313a222c223b6f70656e5f636173685f6472617765725f7768656e5f7072696e74696e675f696e766f6963657c733a323a224e6f223b7768656e5f636c69636b696e675f6f6e5f6974656d5f696e5f706f737c733a313a2232223b69735f726f756e64696e675f656e61626c657c733a313a2230223b617474656e64616e63655f747970657c733a313a2232223b64656661756c745f6f726465725f747970657c733a313a2231223b69735f6c6f79616c74795f656e61626c657c733a373a2264697361626c65223b7072655f6f725f706f73745f7061796d656e747c733a313a2231223b6d696e696d756d5f706f696e745f746f5f72656465656d7c733a313a2230223b6c6f79616c74795f726174657c733a333a22302e31223b73706c69745f62696c6c7c733a313a2231223b706c6163655f6f726465725f746f6f6c7469707c733a343a2273686f77223b666f6f645f6d656e755f746f6f6c7469707c733a343a2273686f77223b7461626c655f62675f636f6c6f727c733a31303a227461626c655f62675f31223b6b6f745f7072696e745f6f6e6c696e655f73656c665f6f726465727c733a313a2231223b64656661756c745f7061796d656e747c733a313a2231223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b6c616e67756167655f6d616e69666573746f7c733a393a22726576686762726576223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f7469746c657c733a31313a224c6f63616c205461786573223b7461785f726567697374726174696f6e5f6e6f7c733a383a223332313332353837223b7461785f69735f6773747c733a323a224e6f223b6170706c795f6f6e5f64656c69766572795f6368617267657c733a313a2231223b73746174655f636f64657c733a373a2230393331323332223b6c6f67696e5f747970657c733a313a2231223b5f5f63695f766172737c613a333a7b733a31313a22657863657074696f6e5f32223b733a333a226f6c64223b733a393a22657863657074696f6e223b733a333a226f6c64223b733a31313a22657863657074696f6e5f33223b733a333a226f6c64223b7d6f75746c65745f6e616d657c733a31313a224368657a7a792042697465223b616464726573737c733a35323a22436865657a792042697465204d412d4d412026616d703b20536f6e732020506c617a6120536861682044657261692c2053776174223b656d61696c7c733a303a22223b6f6e6c696e655f6f726465725f6d6f64756c657c733a313a2232223b64656661756c745f7761697465727c733a313a2233223b6163746976655f7374617475737c733a363a22616374697665223b64656661756c745f6f726465725f747970655f64656c69766572795f707c733a303a22223b736d735f73656e645f6175746f7c733a313a2231223b73686f775f6f726465725f66756c6c5f73686f72747c733a313a2231223b6f6e6c696e655f73656c65637465645f6f75746c65747c733a313a2231223b696e766f6963655f6c6f676f7c733a33373a2237353861646564383439306236356465626361613133353137343731316431392e6a706567223b736974655f6e616d657c733a34343a224f6e6c696e65204f72646572206f6620436865657a792042697465204d412d4d412026616d703b20536f6e73223b666f6f7465727c733a34363a224f6e6c696e65204f72646572206f6620436865657a792042697465204d412d4d412026616d703b20536f6e730d0a223b73797374656d5f6c6f676f7c733a33373a2263396663303536343963623433393039393936376131633766346235306262612e6a706567223b66617669636f6e7c733a33373a2265323739303065656463626265326433653536613031383761666637376331352e6a706567223b776562736974655f7468656d655f636f6c6f727c733a373a2223643766663066223b6f75746c65745f69647c733a313a2231223b69735f7761697465727c733a323a224e6f223b636f756e7465725f69647c733a313a2231223b636f756e7465725f6e616d657c733a323a223031223b7072696e7465725f69647c733a313a2231223b62696c6c5f7072696e7465725f69647c733a313a2231223b706174687c733a303a22223b7469746c657c733a373a225072696e746572223b747970657c733a303a22223b636861726163746572735f7065725f6c696e657c733a313a2230223b7072696e7465725f69705f616464726573737c733a303a22223b7072696e7465725f706f72747c733a303a22223b7072696e74696e675f63686f6963657c733a31373a227765625f62726f777365725f706f707570223b697076666f75725f616464726573737c733a303a22223b7072696e745f666f726d61747c733a343a2238306d6d223b696e765f71725f636f64655f656e61626c655f7374617475737c733a363a22456e61626c65223b706174685f62696c6c7c733a303a22223b7469746c655f62696c6c7c733a373a225072696e746572223b747970655f62696c6c7c733a303a22223b636861726163746572735f7065725f6c696e655f62696c6c7c733a313a2230223b7072696e7465725f69705f616464726573735f62696c6c7c733a303a22223b7072696e7465725f706f72745f62696c6c7c733a303a22223b7072696e74696e675f63686f6963655f62696c6c7c733a31373a227765625f62726f777365725f706f707570223b697076666f75725f616464726573735f62696c6c7c733a303a22223b7072696e745f666f726d61745f62696c6c7c733a343a2238306d6d223b696e765f71725f636f64655f656e61626c655f7374617475735f62696c6c7c733a363a22456e61626c65223b6163746976655f6c6f67696e5f627574746f6e7c733a313a2231223b),
('37a68367927a2725e6a3a1b5c283f27284b75535', '127.0.0.1', 1770105174, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737303130353137343b73797374656d5f76657273696f6e5f6e756d6265727c733a333a22372e36223b776c627c693a313b66756e6374696f6e5f6163636573737c613a3334343a7b693a303b733a383a22766965772d333730223b693a313b733a323a222d30223b693a323b733a33333a22616c6c5f73657474696e675f7265736572766174696f6e5f6f726465722d333638223b693a333b733a323a222d30223b693a343b733a32383a22616c6c5f73657474696e675f6f6e6c696e655f6f726465722d333636223b693a353b733a323a222d30223b693a363b733a32353a22616c6c5f73657474696e675f73656c5f6f726465722d333634223b693a373b733a323a222d30223b693a383b733a383a22766965772d333632223b693a393b733a323a222d30223b693a31303b733a31353a22616c6c5f73657474696e672d333538223b693a31313b733a323a222d30223b693a31323b733a31303a2264656c6574652d333533223b693a31333b733a383a22766965772d333533223b693a31343b733a31303a227570646174652d333533223b693a31353b733a373a226164642d333533223b693a31363b733a323a222d30223b693a31373b733a393a22706f735f32352d3733223b693a31383b733a393a2272657365742d333530223b693a31393b733a323a222d30223b693a32303b733a383a22766965772d333436223b693a32313b733a323a222d30223b693a32323b733a31363a22766965775f64657461696c732d333430223b693a32333b733a31303a2264656c6574652d333430223b693a32343b733a383a22766965772d333430223b693a32353b733a31303a227570646174652d333430223b693a32363b733a373a226164642d333430223b693a32373b733a323a222d30223b693a32383b733a31373a22736f7274696e67466f72504f532d323239223b693a32393b733a383a22766965772d333337223b693a33303b733a323a222d30223b693a33313b733a383a22766965772d333332223b693a33323b733a323a222d30223b693a33333b733a31303a227570646174652d333330223b693a33343b733a323a222d30223b693a33353b733a31303a2264656c6574652d333235223b693a33363b733a383a22766965772d333235223b693a33373b733a31303a227570646174652d333235223b693a33383b733a373a226164642d333235223b693a33393b733a323a222d30223b693a34303b733a383a22766965772d333231223b693a34313b733a323a222d30223b693a34323b733a31343a22646561637469766174652d333136223b693a34333b733a31323a2261637469766174652d333136223b693a34343b733a31303a2264656c6574652d333136223b693a34353b733a383a22766965772d333136223b693a34363b733a323a222d30223b693a34373b733a383a22766965772d333134223b693a34383b733a323a222d30223b693a34393b733a383a22766965772d333130223b693a35303b733a31333a22636865636b5f6f75742d333130223b693a35313b733a31323a22636865636b5f696e2d333130223b693a35323b733a323a222d30223b693a35333b733a31313a22736f7274696e672d323630223b693a35343b733a383a22766965772d333037223b693a35353b733a323a222d30223b693a35363b733a31393a2272657365744461696c7953616c65732d313233223b693a35373b733a32303a226578706f72744461696c7953616c65732d313233223b693a35383b733a32373a226368616e67655f64656c69766572795f616464726573732d313233223b693a35393b733a31303a227570646174652d333032223b693a36303b733a323a222d30223b693a36313b733a31303a227570646174652d333030223b693a36323b733a323a222d30223b693a36333b733a31303a227570646174652d323938223b693a36343b733a323a222d30223b693a36353b733a31343a22646561637469766174652d323931223b693a36363b733a31323a2261637469766174652d323931223b693a36373b733a31303a2264656c6574652d323931223b693a36383b733a383a22766965772d323931223b693a36393b733a31303a227570646174652d323931223b693a37303b733a373a226164642d323931223b693a37313b733a323a222d30223b693a37323b733a383a22636f70792d323835223b693a37333b733a31303a2264656c6574652d323835223b693a37343b733a383a22766965772d323835223b693a37353b733a31303a227570646174652d323835223b693a37363b733a373a226164642d323835223b693a37373b733a323a222d30223b693a37383b733a31303a2264656c6574652d323830223b693a37393b733a383a22766965772d323830223b693a38303b733a31303a227570646174652d323830223b693a38313b733a373a226164642d323830223b693a38323b733a323a222d30223b693a38333b733a31303a2264656c6574652d323735223b693a38343b733a383a22766965772d323735223b693a38353b733a31303a227570646174652d323735223b693a38363b733a373a226164642d323735223b693a38373b733a323a222d30223b693a38383b733a31303a2264656c6574652d323730223b693a38393b733a383a22766965772d323730223b693a39303b733a31303a227570646174652d323730223b693a39313b733a373a226164642d323730223b693a39323b733a323a222d30223b693a39333b733a31303a2264656c6574652d323635223b693a39343b733a383a22766965772d323635223b693a39353b733a31303a227570646174652d323635223b693a39363b733a373a226164642d323635223b693a39373b733a323a222d30223b693a39383b733a31303a2264656c6574652d323630223b693a39393b733a383a22766965772d323630223b693a3130303b733a31303a227570646174652d323630223b693a3130313b733a373a226164642d323630223b693a3130323b733a323a222d30223b693a3130333b733a31303a2264656c6574652d323535223b693a3130343b733a383a22766965772d323535223b693a3130353b733a31303a227570646174652d323535223b693a3130363b733a373a226164642d323535223b693a3130373b733a323a222d30223b693a3130383b733a31393a2275706c6f61645f637573746f6d65722d323439223b693a3130393b733a31303a2264656c6574652d323439223b693a3131303b733a383a22766965772d323439223b693a3131313b733a31303a227570646174652d323439223b693a3131323b733a373a226164642d323439223b693a3131333b733a323a222d30223b693a3131343b733a31303a2264656c6574652d323434223b693a3131353b733a383a22766965772d323434223b693a3131363b733a31303a227570646174652d323434223b693a3131373b733a373a226164642d323434223b693a3131383b733a323a222d30223b693a3131393b733a31363a226974656d5f626172636f64652d323334223b693a3132303b733a33323a2275706c6f61645f666f6f645f6d656e755f696e6772656469656e74732d323334223b693a3132313b733a32303a2275706c6f61645f666f6f645f6d656e752d323334223b693a3132323b733a31393a2261737369676e5f6d6f6469666965722d323334223b693a3132333b733a31363a22766965775f64657461696c732d323334223b693a3132343b733a31303a2264656c6574652d323334223b693a3132353b733a383a22766965772d323334223b693a3132363b733a31303a227570646174652d323334223b693a3132373b733a373a226164642d323334223b693a3132383b733a323a222d30223b693a3132393b733a31303a2264656c6574652d323239223b693a3133303b733a383a22766965772d323239223b693a3133313b733a31303a227570646174652d323239223b693a3133323b733a373a226164642d323239223b693a3133333b733a323a222d30223b693a3133343b733a31363a22766965775f64657461696c732d323233223b693a3133353b733a31303a2264656c6574652d323233223b693a3133363b733a383a22766965772d323233223b693a3133373b733a31303a227570646174652d323233223b693a3133383b733a373a226164642d323233223b693a3133393b733a323a222d30223b693a3134303b733a32313a2275706c6f61645f696e6772656469656e742d323137223b693a3134313b733a31303a2264656c6574652d323137223b693a3134323b733a383a22766965772d323137223b693a3134333b733a31303a227570646174652d323137223b693a3134343b733a373a226164642d323137223b693a3134353b733a323a222d30223b693a3134363b733a31303a2264656c6574652d323132223b693a3134373b733a383a22766965772d323132223b693a3134383b733a31303a227570646174652d323132223b693a3134393b733a373a226164642d323132223b693a3135303b733a323a222d30223b693a3135313b733a31303a2264656c6574652d323037223b693a3135323b733a383a22766965772d323037223b693a3135333b733a31303a227570646174652d323037223b693a3135343b733a373a226164642d323037223b693a3135353b733a323a222d30223b693a3135363b733a383a22766965772d323035223b693a3135373b733a323a222d30223b693a3135383b733a383a22766965772d323033223b693a3135393b733a323a222d30223b693a3136303b733a383a22766965772d323031223b693a3136313b733a323a222d30223b693a3136323b733a383a22766965772d313939223b693a3136333b733a323a222d30223b693a3136343b733a383a22766965772d313937223b693a3136353b733a323a222d30223b693a3136363b733a383a22766965772d313935223b693a3136373b733a323a222d30223b693a3136383b733a383a22766965772d313933223b693a3136393b733a323a222d30223b693a3137303b733a383a22766965772d313931223b693a3137313b733a323a222d30223b693a3137323b733a383a22766965772d313839223b693a3137333b733a323a222d30223b693a3137343b733a383a22766965772d313837223b693a3137353b733a323a222d30223b693a3137363b733a383a22766965772d313835223b693a3137373b733a323a222d30223b693a3137383b733a383a22766965772d313833223b693a3137393b733a323a222d30223b693a3138303b733a383a22766965772d313831223b693a3138313b733a323a222d30223b693a3138323b733a383a22766965772d313739223b693a3138333b733a323a222d30223b693a3138343b733a383a22766965772d313735223b693a3138353b733a323a222d30223b693a3138363b733a383a22766965772d313733223b693a3138373b733a323a222d30223b693a3138383b733a383a22766965772d313731223b693a3138393b733a323a222d30223b693a3139303b733a383a22766965772d313639223b693a3139313b733a323a222d30223b693a3139323b733a383a22766965772d313637223b693a3139333b733a323a222d30223b693a3139343b733a383a22766965772d313635223b693a3139353b733a323a222d30223b693a3139363b733a383a22766965772d313633223b693a3139373b733a323a222d30223b693a3139383b733a383a22766965772d313631223b693a3139393b733a323a222d30223b693a3230303b733a383a22766965772d313539223b693a3230313b733a323a222d30223b693a3230323b733a31303a2264656c6574652d313535223b693a3230333b733a383a22766965772d313535223b693a3230343b733a373a226164642d313535223b693a3230353b733a323a222d30223b693a3230363b733a31303a2264656c6574652d313531223b693a3230373b733a383a22766965772d313531223b693a3230383b733a373a226164642d313531223b693a3230393b733a323a222d30223b693a3231303b733a31303a2264656c6574652d313437223b693a3231313b733a383a22766965772d313437223b693a3231323b733a373a226164642d313437223b693a3231333b733a323a222d30223b693a3231343b733a31303a2264656c6574652d313432223b693a3231353b733a383a22766965772d313432223b693a3231363b733a31303a227570646174652d313432223b693a3231373b733a373a226164642d313432223b693a3231383b733a323a222d30223b693a3231393b733a31363a22766965775f64657461696c732d313337223b693a3232303b733a31303a2264656c6574652d313337223b693a3232313b733a383a22766965772d313337223b693a3232323b733a373a226164642d313337223b693a3232333b733a323a222d30223b693a3232343b733a31363a22766965775f64657461696c732d313331223b693a3232353b733a31303a2264656c6574652d313331223b693a3232363b733a383a22766965772d313331223b693a3232373b733a31303a227570646174652d313331223b693a3232383b733a373a226164642d313331223b693a3232393b733a323a222d30223b693a3233303b733a383a22766965772d313239223b693a3233313b733a323a222d30223b693a3233323b733a31303a2264656c6574652d313233223b693a3233333b733a31363a22766965775f696e766f6963652d313233223b693a3233343b733a31303a22726566756e642d313233223b693a3233353b733a383a22766965772d313233223b693a3233363b733a323a222d30223b693a3233373b733a31303a2264656c6574652d313138223b693a3233383b733a383a22766965772d313138223b693a3233393b733a31303a227570646174652d313138223b693a3234303b733a373a226164642d313138223b693a3234313b733a323a222d30223b693a3234323b733a31363a22766965775f64657461696c732d313132223b693a3234333b733a31303a2264656c6574652d313132223b693a3234343b733a383a22766965772d313132223b693a3234353b733a31303a227570646174652d313132223b693a3234363b733a373a226164642d313132223b693a3234373b733a323a222d30223b693a3234383b733a31363a22766965775f64657461696c732d313036223b693a3234393b733a31303a2264656c6574652d313036223b693a3235303b733a383a22766965772d313036223b693a3235313b733a31303a227570646174652d313036223b693a3235323b733a373a226164642d313036223b693a3235333b733a323a222d30223b693a3235343b733a383a22766965772d313034223b693a3235353b733a323a222d30223b693a3235363b733a383a22656e7465722d3938223b693a3235373b733a393a2264656c6574652d3938223b693a3235383b733a373a22766965772d3938223b693a3235393b733a393a227570646174652d3938223b693a3236303b733a363a226164642d3938223b693a3236313b733a323a222d30223b693a3236323b733a393a22706f735f32332d3733223b693a3236333b733a393a22706f735f32322d3733223b693a3236343b733a393a22706f735f32312d3733223b693a3236353b733a393a22706f735f32302d3733223b693a3236363b733a393a22706f735f31392d3733223b693a3236373b733a393a22706f735f31382d3733223b693a3236383b733a393a22706f735f31372d3733223b693a3236393b733a393a22706f735f31362d3733223b693a3237303b733a393a22706f735f31352d3733223b693a3237313b733a393a22706f735f31342d3733223b693a3237323b733a393a22706f735f31332d3733223b693a3237333b733a393a22706f735f31322d3733223b693a3237343b733a393a22706f735f31312d3733223b693a3237353b733a393a22706f735f31302d3733223b693a3237363b733a383a22706f735f392d3733223b693a3237373b733a383a22706f735f382d3733223b693a3237383b733a383a22706f735f372d3733223b693a3237393b733a383a22706f735f362d3733223b693a3238303b733a383a22706f735f352d3733223b693a3238313b733a383a22706f735f342d3733223b693a3238323b733a383a22706f735f332d3733223b693a3238333b733a383a22706f735f322d3733223b693a3238343b733a383a22706f735f312d3733223b693a3238353b733a323a222d30223b693a3238363b733a383a22656e7465722d3637223b693a3238373b733a393a2264656c6574652d3637223b693a3238383b733a373a22766965772d3637223b693a3238393b733a393a227570646174652d3637223b693a3239303b733a363a226164642d3637223b693a3239313b733a323a222d30223b693a3239323b733a393a227570646174652d3634223b693a3239333b733a323a222d30223b693a3239343b733a31323a22756e696e7374616c6c2d3632223b693a3239353b733a323a222d30223b693a3239363b733a393a227570646174652d3630223b693a3239373b733a323a222d30223b693a3239383b733a393a2264656c6574652d3535223b693a3239393b733a373a22766965772d3535223b693a3330303b733a393a227570646174652d3535223b693a3330313b733a363a226164642d3535223b693a3330323b733a323a222d30223b693a3330333b733a31333a227570646174655f7461782d3532223b693a3330343b733a323a222d30223b693a3330353b733a393a227570646174652d3439223b693a3330363b733a323a222d30223b693a3330373b733a393a2264656c6574652d3335223b693a3330383b733a373a22766965772d3335223b693a3330393b733a393a227570646174652d3335223b693a3331303b733a363a226164642d3335223b693a3331313b733a323a222d30223b693a3331323b733a393a227570646174652d3331223b693a3331333b733a373a22766965772d3331223b693a3331343b733a323a222d30223b693a3331353b733a393a2264656c6574652d3236223b693a3331363b733a373a22766965772d3236223b693a3331373b733a393a227570646174652d3236223b693a3331383b733a363a226164642d3236223b693a3331393b733a323a222d30223b693a3332303b733a393a2264656c6574652d3232223b693a3332313b733a373a22766965772d3232223b693a3332323b733a363a226164642d3232223b693a3332333b733a323a222d30223b693a3332343b733a31373a22626c6f636b5f616c6c5f757365722d3135223b693a3332353b733a31353a2273686f775f6f75746c6574732d3135223b693a3332363b733a393a2264656c6574652d3135223b693a3332373b733a373a22766965772d3135223b693a3332383b733a393a227570646174652d3135223b693a3332393b733a363a226164642d3135223b693a3333303b733a323a222d30223b693a3333313b733a393a227570646174652d3132223b693a3333323b733a373a22766965772d3132223b693a3333333b733a323a222d30223b693a3333343b733a383a227570646174652d39223b693a3333353b733a363a22766965772d39223b693a3333363b733a323a222d30223b693a3333373b733a383a227570646174652d36223b693a3333383b733a323a222d30223b693a3333393b733a383a227570646174652d33223b693a3334303b733a363a22766965772d33223b693a3334313b733a323a222d30223b693a3334323b733a363a22766965772d31223b693a3334333b733a323a222d30223b7d757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b64657369676e6174696f6e7c733a31313a2253757065722041646d696e223b66756c6c5f6e616d657c733a31303a2241646d696e2055736572223b73686f72745f6e616d657c733a313a2261223b70686f6e657c733a31323a22393233343238393237333035223b656d61696c5f616464726573737c733a31353a2261646d696e4061646d696e2e636f6d223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b73657373696f6e5f6f75746c6574737c733a313a2232223b6163746976655f6d656e755f746d707c733a303a22223b63757272656e63797c733a333a22504b52223b7a6f6e655f6e616d657c733a31323a22417369612f4b617261636869223b646174655f666f726d61747c733a353a22592f6d2f64223b627573696e6573735f6e616d657c733a33323a22436865657a792042697465204d412d4d412026616d703b616d703b20536f6e73223b776562736974657c733a31303a22666972656170702e6363223b63757272656e63795f706f736974696f6e7c733a31333a224265666f726520416d6f756e74223b707265636973696f6e7c733a313a2232223b64656661756c745f637573746f6d65727c733a313a2231223b6578706f72745f6461696c795f73616c657c733a363a22656e61626c65223b736572766963655f616d6f756e747c733a303a22223b74616b655f617761795f736572766963655f6368617267657c733a303a22223b64656c69766572795f616d6f756e747c733a303a22223b7461785f747970657c733a313a2231223b646563696d616c735f736570617261746f727c733a313a222e223b74686f7573616e64735f736570617261746f727c733a313a222c223b6f70656e5f636173685f6472617765725f7768656e5f7072696e74696e675f696e766f6963657c733a323a224e6f223b7768656e5f636c69636b696e675f6f6e5f6974656d5f696e5f706f737c733a313a2232223b69735f726f756e64696e675f656e61626c657c733a313a2230223b617474656e64616e63655f747970657c733a313a2232223b64656661756c745f6f726465725f747970657c733a313a2231223b69735f6c6f79616c74795f656e61626c657c733a373a2264697361626c65223b7072655f6f725f706f73745f7061796d656e747c733a313a2231223b6d696e696d756d5f706f696e745f746f5f72656465656d7c733a313a2230223b6c6f79616c74795f726174657c733a333a22302e31223b73706c69745f62696c6c7c733a313a2231223b706c6163655f6f726465725f746f6f6c7469707c733a343a2273686f77223b666f6f645f6d656e755f746f6f6c7469707c733a343a2273686f77223b7461626c655f62675f636f6c6f727c733a31303a227461626c655f62675f31223b6b6f745f7072696e745f6f6e6c696e655f73656c665f6f726465727c733a313a2231223b64656661756c745f7061796d656e747c733a313a2231223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b6c616e67756167655f6d616e69666573746f7c733a393a22726576686762726576223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f7469746c657c733a31313a224c6f63616c205461786573223b7461785f726567697374726174696f6e5f6e6f7c733a383a223332313332353837223b7461785f69735f6773747c733a323a224e6f223b6170706c795f6f6e5f64656c69766572795f6368617267657c733a313a2231223b73746174655f636f64657c733a373a2230393331323332223b6c6f67696e5f747970657c733a313a2231223b5f5f63695f766172737c613a333a7b733a31313a22657863657074696f6e5f32223b733a333a226f6c64223b733a393a22657863657074696f6e223b733a333a226f6c64223b733a31313a22657863657074696f6e5f33223b733a333a226f6c64223b7d6f75746c65745f6e616d657c733a31313a224368657a7a792042697465223b616464726573737c733a35323a22436865657a792042697465204d412d4d412026616d703b20536f6e732020506c617a6120536861682044657261692c2053776174223b656d61696c7c733a303a22223b6f6e6c696e655f6f726465725f6d6f64756c657c733a313a2232223b64656661756c745f7761697465727c733a313a2233223b6163746976655f7374617475737c733a363a22616374697665223b64656661756c745f6f726465725f747970655f64656c69766572795f707c733a303a22223b736d735f73656e645f6175746f7c733a313a2231223b73686f775f6f726465725f66756c6c5f73686f72747c733a313a2231223b6f6e6c696e655f73656c65637465645f6f75746c65747c733a313a2231223b696e766f6963655f6c6f676f7c733a33373a2237353861646564383439306236356465626361613133353137343731316431392e6a706567223b736974655f6e616d657c733a34343a224f6e6c696e65204f72646572206f6620436865657a792042697465204d412d4d412026616d703b20536f6e73223b666f6f7465727c733a34363a224f6e6c696e65204f72646572206f6620436865657a792042697465204d412d4d412026616d703b20536f6e730d0a223b73797374656d5f6c6f676f7c733a33373a2263396663303536343963623433393039393936376131633766346235306262612e6a706567223b66617669636f6e7c733a33373a2265323739303065656463626265326433653536613031383761666637376331352e6a706567223b776562736974655f7468656d655f636f6c6f727c733a373a2223643766663066223b6f75746c65745f69647c733a313a2231223b69735f7761697465727c733a323a224e6f223b636f756e7465725f69647c733a313a2231223b636f756e7465725f6e616d657c733a323a223031223b7072696e7465725f69647c733a313a2231223b62696c6c5f7072696e7465725f69647c733a313a2231223b706174687c733a303a22223b7469746c657c733a373a225072696e746572223b747970657c733a303a22223b636861726163746572735f7065725f6c696e657c733a313a2230223b7072696e7465725f69705f616464726573737c733a303a22223b7072696e7465725f706f72747c733a303a22223b7072696e74696e675f63686f6963657c733a31373a227765625f62726f777365725f706f707570223b697076666f75725f616464726573737c733a303a22223b7072696e745f666f726d61747c733a343a2238306d6d223b696e765f71725f636f64655f656e61626c655f7374617475737c733a363a22456e61626c65223b706174685f62696c6c7c733a303a22223b7469746c655f62696c6c7c733a373a225072696e746572223b747970655f62696c6c7c733a303a22223b636861726163746572735f7065725f6c696e655f62696c6c7c733a313a2230223b7072696e7465725f69705f616464726573735f62696c6c7c733a303a22223b7072696e7465725f706f72745f62696c6c7c733a303a22223b7072696e74696e675f63686f6963655f62696c6c7c733a31373a227765625f62726f777365725f706f707570223b697076666f75725f616464726573735f62696c6c7c733a303a22223b7072696e745f666f726d61745f62696c6c7c733a343a2238306d6d223b696e765f71725f636f64655f656e61626c655f7374617475735f62696c6c7c733a363a22456e61626c65223b6163746976655f6c6f67696e5f627574746f6e7c733a313a2231223b);
INSERT INTO `tbl_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('643059c18b56e1fdd19726edaf2a4871bfdffd6c', '127.0.0.1', 1770105698, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737303130353639383b73797374656d5f76657273696f6e5f6e756d6265727c733a333a22372e36223b776c627c693a313b66756e6374696f6e5f6163636573737c613a3334343a7b693a303b733a383a22766965772d333730223b693a313b733a323a222d30223b693a323b733a33333a22616c6c5f73657474696e675f7265736572766174696f6e5f6f726465722d333638223b693a333b733a323a222d30223b693a343b733a32383a22616c6c5f73657474696e675f6f6e6c696e655f6f726465722d333636223b693a353b733a323a222d30223b693a363b733a32353a22616c6c5f73657474696e675f73656c5f6f726465722d333634223b693a373b733a323a222d30223b693a383b733a383a22766965772d333632223b693a393b733a323a222d30223b693a31303b733a31353a22616c6c5f73657474696e672d333538223b693a31313b733a323a222d30223b693a31323b733a31303a2264656c6574652d333533223b693a31333b733a383a22766965772d333533223b693a31343b733a31303a227570646174652d333533223b693a31353b733a373a226164642d333533223b693a31363b733a323a222d30223b693a31373b733a393a22706f735f32352d3733223b693a31383b733a393a2272657365742d333530223b693a31393b733a323a222d30223b693a32303b733a383a22766965772d333436223b693a32313b733a323a222d30223b693a32323b733a31363a22766965775f64657461696c732d333430223b693a32333b733a31303a2264656c6574652d333430223b693a32343b733a383a22766965772d333430223b693a32353b733a31303a227570646174652d333430223b693a32363b733a373a226164642d333430223b693a32373b733a323a222d30223b693a32383b733a31373a22736f7274696e67466f72504f532d323239223b693a32393b733a383a22766965772d333337223b693a33303b733a323a222d30223b693a33313b733a383a22766965772d333332223b693a33323b733a323a222d30223b693a33333b733a31303a227570646174652d333330223b693a33343b733a323a222d30223b693a33353b733a31303a2264656c6574652d333235223b693a33363b733a383a22766965772d333235223b693a33373b733a31303a227570646174652d333235223b693a33383b733a373a226164642d333235223b693a33393b733a323a222d30223b693a34303b733a383a22766965772d333231223b693a34313b733a323a222d30223b693a34323b733a31343a22646561637469766174652d333136223b693a34333b733a31323a2261637469766174652d333136223b693a34343b733a31303a2264656c6574652d333136223b693a34353b733a383a22766965772d333136223b693a34363b733a323a222d30223b693a34373b733a383a22766965772d333134223b693a34383b733a323a222d30223b693a34393b733a383a22766965772d333130223b693a35303b733a31333a22636865636b5f6f75742d333130223b693a35313b733a31323a22636865636b5f696e2d333130223b693a35323b733a323a222d30223b693a35333b733a31313a22736f7274696e672d323630223b693a35343b733a383a22766965772d333037223b693a35353b733a323a222d30223b693a35363b733a31393a2272657365744461696c7953616c65732d313233223b693a35373b733a32303a226578706f72744461696c7953616c65732d313233223b693a35383b733a32373a226368616e67655f64656c69766572795f616464726573732d313233223b693a35393b733a31303a227570646174652d333032223b693a36303b733a323a222d30223b693a36313b733a31303a227570646174652d333030223b693a36323b733a323a222d30223b693a36333b733a31303a227570646174652d323938223b693a36343b733a323a222d30223b693a36353b733a31343a22646561637469766174652d323931223b693a36363b733a31323a2261637469766174652d323931223b693a36373b733a31303a2264656c6574652d323931223b693a36383b733a383a22766965772d323931223b693a36393b733a31303a227570646174652d323931223b693a37303b733a373a226164642d323931223b693a37313b733a323a222d30223b693a37323b733a383a22636f70792d323835223b693a37333b733a31303a2264656c6574652d323835223b693a37343b733a383a22766965772d323835223b693a37353b733a31303a227570646174652d323835223b693a37363b733a373a226164642d323835223b693a37373b733a323a222d30223b693a37383b733a31303a2264656c6574652d323830223b693a37393b733a383a22766965772d323830223b693a38303b733a31303a227570646174652d323830223b693a38313b733a373a226164642d323830223b693a38323b733a323a222d30223b693a38333b733a31303a2264656c6574652d323735223b693a38343b733a383a22766965772d323735223b693a38353b733a31303a227570646174652d323735223b693a38363b733a373a226164642d323735223b693a38373b733a323a222d30223b693a38383b733a31303a2264656c6574652d323730223b693a38393b733a383a22766965772d323730223b693a39303b733a31303a227570646174652d323730223b693a39313b733a373a226164642d323730223b693a39323b733a323a222d30223b693a39333b733a31303a2264656c6574652d323635223b693a39343b733a383a22766965772d323635223b693a39353b733a31303a227570646174652d323635223b693a39363b733a373a226164642d323635223b693a39373b733a323a222d30223b693a39383b733a31303a2264656c6574652d323630223b693a39393b733a383a22766965772d323630223b693a3130303b733a31303a227570646174652d323630223b693a3130313b733a373a226164642d323630223b693a3130323b733a323a222d30223b693a3130333b733a31303a2264656c6574652d323535223b693a3130343b733a383a22766965772d323535223b693a3130353b733a31303a227570646174652d323535223b693a3130363b733a373a226164642d323535223b693a3130373b733a323a222d30223b693a3130383b733a31393a2275706c6f61645f637573746f6d65722d323439223b693a3130393b733a31303a2264656c6574652d323439223b693a3131303b733a383a22766965772d323439223b693a3131313b733a31303a227570646174652d323439223b693a3131323b733a373a226164642d323439223b693a3131333b733a323a222d30223b693a3131343b733a31303a2264656c6574652d323434223b693a3131353b733a383a22766965772d323434223b693a3131363b733a31303a227570646174652d323434223b693a3131373b733a373a226164642d323434223b693a3131383b733a323a222d30223b693a3131393b733a31363a226974656d5f626172636f64652d323334223b693a3132303b733a33323a2275706c6f61645f666f6f645f6d656e755f696e6772656469656e74732d323334223b693a3132313b733a32303a2275706c6f61645f666f6f645f6d656e752d323334223b693a3132323b733a31393a2261737369676e5f6d6f6469666965722d323334223b693a3132333b733a31363a22766965775f64657461696c732d323334223b693a3132343b733a31303a2264656c6574652d323334223b693a3132353b733a383a22766965772d323334223b693a3132363b733a31303a227570646174652d323334223b693a3132373b733a373a226164642d323334223b693a3132383b733a323a222d30223b693a3132393b733a31303a2264656c6574652d323239223b693a3133303b733a383a22766965772d323239223b693a3133313b733a31303a227570646174652d323239223b693a3133323b733a373a226164642d323239223b693a3133333b733a323a222d30223b693a3133343b733a31363a22766965775f64657461696c732d323233223b693a3133353b733a31303a2264656c6574652d323233223b693a3133363b733a383a22766965772d323233223b693a3133373b733a31303a227570646174652d323233223b693a3133383b733a373a226164642d323233223b693a3133393b733a323a222d30223b693a3134303b733a32313a2275706c6f61645f696e6772656469656e742d323137223b693a3134313b733a31303a2264656c6574652d323137223b693a3134323b733a383a22766965772d323137223b693a3134333b733a31303a227570646174652d323137223b693a3134343b733a373a226164642d323137223b693a3134353b733a323a222d30223b693a3134363b733a31303a2264656c6574652d323132223b693a3134373b733a383a22766965772d323132223b693a3134383b733a31303a227570646174652d323132223b693a3134393b733a373a226164642d323132223b693a3135303b733a323a222d30223b693a3135313b733a31303a2264656c6574652d323037223b693a3135323b733a383a22766965772d323037223b693a3135333b733a31303a227570646174652d323037223b693a3135343b733a373a226164642d323037223b693a3135353b733a323a222d30223b693a3135363b733a383a22766965772d323035223b693a3135373b733a323a222d30223b693a3135383b733a383a22766965772d323033223b693a3135393b733a323a222d30223b693a3136303b733a383a22766965772d323031223b693a3136313b733a323a222d30223b693a3136323b733a383a22766965772d313939223b693a3136333b733a323a222d30223b693a3136343b733a383a22766965772d313937223b693a3136353b733a323a222d30223b693a3136363b733a383a22766965772d313935223b693a3136373b733a323a222d30223b693a3136383b733a383a22766965772d313933223b693a3136393b733a323a222d30223b693a3137303b733a383a22766965772d313931223b693a3137313b733a323a222d30223b693a3137323b733a383a22766965772d313839223b693a3137333b733a323a222d30223b693a3137343b733a383a22766965772d313837223b693a3137353b733a323a222d30223b693a3137363b733a383a22766965772d313835223b693a3137373b733a323a222d30223b693a3137383b733a383a22766965772d313833223b693a3137393b733a323a222d30223b693a3138303b733a383a22766965772d313831223b693a3138313b733a323a222d30223b693a3138323b733a383a22766965772d313739223b693a3138333b733a323a222d30223b693a3138343b733a383a22766965772d313735223b693a3138353b733a323a222d30223b693a3138363b733a383a22766965772d313733223b693a3138373b733a323a222d30223b693a3138383b733a383a22766965772d313731223b693a3138393b733a323a222d30223b693a3139303b733a383a22766965772d313639223b693a3139313b733a323a222d30223b693a3139323b733a383a22766965772d313637223b693a3139333b733a323a222d30223b693a3139343b733a383a22766965772d313635223b693a3139353b733a323a222d30223b693a3139363b733a383a22766965772d313633223b693a3139373b733a323a222d30223b693a3139383b733a383a22766965772d313631223b693a3139393b733a323a222d30223b693a3230303b733a383a22766965772d313539223b693a3230313b733a323a222d30223b693a3230323b733a31303a2264656c6574652d313535223b693a3230333b733a383a22766965772d313535223b693a3230343b733a373a226164642d313535223b693a3230353b733a323a222d30223b693a3230363b733a31303a2264656c6574652d313531223b693a3230373b733a383a22766965772d313531223b693a3230383b733a373a226164642d313531223b693a3230393b733a323a222d30223b693a3231303b733a31303a2264656c6574652d313437223b693a3231313b733a383a22766965772d313437223b693a3231323b733a373a226164642d313437223b693a3231333b733a323a222d30223b693a3231343b733a31303a2264656c6574652d313432223b693a3231353b733a383a22766965772d313432223b693a3231363b733a31303a227570646174652d313432223b693a3231373b733a373a226164642d313432223b693a3231383b733a323a222d30223b693a3231393b733a31363a22766965775f64657461696c732d313337223b693a3232303b733a31303a2264656c6574652d313337223b693a3232313b733a383a22766965772d313337223b693a3232323b733a373a226164642d313337223b693a3232333b733a323a222d30223b693a3232343b733a31363a22766965775f64657461696c732d313331223b693a3232353b733a31303a2264656c6574652d313331223b693a3232363b733a383a22766965772d313331223b693a3232373b733a31303a227570646174652d313331223b693a3232383b733a373a226164642d313331223b693a3232393b733a323a222d30223b693a3233303b733a383a22766965772d313239223b693a3233313b733a323a222d30223b693a3233323b733a31303a2264656c6574652d313233223b693a3233333b733a31363a22766965775f696e766f6963652d313233223b693a3233343b733a31303a22726566756e642d313233223b693a3233353b733a383a22766965772d313233223b693a3233363b733a323a222d30223b693a3233373b733a31303a2264656c6574652d313138223b693a3233383b733a383a22766965772d313138223b693a3233393b733a31303a227570646174652d313138223b693a3234303b733a373a226164642d313138223b693a3234313b733a323a222d30223b693a3234323b733a31363a22766965775f64657461696c732d313132223b693a3234333b733a31303a2264656c6574652d313132223b693a3234343b733a383a22766965772d313132223b693a3234353b733a31303a227570646174652d313132223b693a3234363b733a373a226164642d313132223b693a3234373b733a323a222d30223b693a3234383b733a31363a22766965775f64657461696c732d313036223b693a3234393b733a31303a2264656c6574652d313036223b693a3235303b733a383a22766965772d313036223b693a3235313b733a31303a227570646174652d313036223b693a3235323b733a373a226164642d313036223b693a3235333b733a323a222d30223b693a3235343b733a383a22766965772d313034223b693a3235353b733a323a222d30223b693a3235363b733a383a22656e7465722d3938223b693a3235373b733a393a2264656c6574652d3938223b693a3235383b733a373a22766965772d3938223b693a3235393b733a393a227570646174652d3938223b693a3236303b733a363a226164642d3938223b693a3236313b733a323a222d30223b693a3236323b733a393a22706f735f32332d3733223b693a3236333b733a393a22706f735f32322d3733223b693a3236343b733a393a22706f735f32312d3733223b693a3236353b733a393a22706f735f32302d3733223b693a3236363b733a393a22706f735f31392d3733223b693a3236373b733a393a22706f735f31382d3733223b693a3236383b733a393a22706f735f31372d3733223b693a3236393b733a393a22706f735f31362d3733223b693a3237303b733a393a22706f735f31352d3733223b693a3237313b733a393a22706f735f31342d3733223b693a3237323b733a393a22706f735f31332d3733223b693a3237333b733a393a22706f735f31322d3733223b693a3237343b733a393a22706f735f31312d3733223b693a3237353b733a393a22706f735f31302d3733223b693a3237363b733a383a22706f735f392d3733223b693a3237373b733a383a22706f735f382d3733223b693a3237383b733a383a22706f735f372d3733223b693a3237393b733a383a22706f735f362d3733223b693a3238303b733a383a22706f735f352d3733223b693a3238313b733a383a22706f735f342d3733223b693a3238323b733a383a22706f735f332d3733223b693a3238333b733a383a22706f735f322d3733223b693a3238343b733a383a22706f735f312d3733223b693a3238353b733a323a222d30223b693a3238363b733a383a22656e7465722d3637223b693a3238373b733a393a2264656c6574652d3637223b693a3238383b733a373a22766965772d3637223b693a3238393b733a393a227570646174652d3637223b693a3239303b733a363a226164642d3637223b693a3239313b733a323a222d30223b693a3239323b733a393a227570646174652d3634223b693a3239333b733a323a222d30223b693a3239343b733a31323a22756e696e7374616c6c2d3632223b693a3239353b733a323a222d30223b693a3239363b733a393a227570646174652d3630223b693a3239373b733a323a222d30223b693a3239383b733a393a2264656c6574652d3535223b693a3239393b733a373a22766965772d3535223b693a3330303b733a393a227570646174652d3535223b693a3330313b733a363a226164642d3535223b693a3330323b733a323a222d30223b693a3330333b733a31333a227570646174655f7461782d3532223b693a3330343b733a323a222d30223b693a3330353b733a393a227570646174652d3439223b693a3330363b733a323a222d30223b693a3330373b733a393a2264656c6574652d3335223b693a3330383b733a373a22766965772d3335223b693a3330393b733a393a227570646174652d3335223b693a3331303b733a363a226164642d3335223b693a3331313b733a323a222d30223b693a3331323b733a393a227570646174652d3331223b693a3331333b733a373a22766965772d3331223b693a3331343b733a323a222d30223b693a3331353b733a393a2264656c6574652d3236223b693a3331363b733a373a22766965772d3236223b693a3331373b733a393a227570646174652d3236223b693a3331383b733a363a226164642d3236223b693a3331393b733a323a222d30223b693a3332303b733a393a2264656c6574652d3232223b693a3332313b733a373a22766965772d3232223b693a3332323b733a363a226164642d3232223b693a3332333b733a323a222d30223b693a3332343b733a31373a22626c6f636b5f616c6c5f757365722d3135223b693a3332353b733a31353a2273686f775f6f75746c6574732d3135223b693a3332363b733a393a2264656c6574652d3135223b693a3332373b733a373a22766965772d3135223b693a3332383b733a393a227570646174652d3135223b693a3332393b733a363a226164642d3135223b693a3333303b733a323a222d30223b693a3333313b733a393a227570646174652d3132223b693a3333323b733a373a22766965772d3132223b693a3333333b733a323a222d30223b693a3333343b733a383a227570646174652d39223b693a3333353b733a363a22766965772d39223b693a3333363b733a323a222d30223b693a3333373b733a383a227570646174652d36223b693a3333383b733a323a222d30223b693a3333393b733a383a227570646174652d33223b693a3334303b733a363a22766965772d33223b693a3334313b733a323a222d30223b693a3334323b733a363a22766965772d31223b693a3334333b733a323a222d30223b7d757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b64657369676e6174696f6e7c733a31313a2253757065722041646d696e223b66756c6c5f6e616d657c733a31303a2241646d696e2055736572223b73686f72745f6e616d657c733a313a2261223b70686f6e657c733a31323a22393233343238393237333035223b656d61696c5f616464726573737c733a31353a2261646d696e4061646d696e2e636f6d223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b73657373696f6e5f6f75746c6574737c733a313a2232223b6163746976655f6d656e755f746d707c733a303a22223b63757272656e63797c733a333a22504b52223b7a6f6e655f6e616d657c733a31323a22417369612f4b617261636869223b646174655f666f726d61747c733a353a22592f6d2f64223b627573696e6573735f6e616d657c733a33323a22436865657a792042697465204d412d4d412026616d703b616d703b20536f6e73223b776562736974657c733a31303a22666972656170702e6363223b63757272656e63795f706f736974696f6e7c733a31333a224265666f726520416d6f756e74223b707265636973696f6e7c733a313a2232223b64656661756c745f637573746f6d65727c733a313a2231223b6578706f72745f6461696c795f73616c657c733a363a22656e61626c65223b736572766963655f616d6f756e747c733a303a22223b74616b655f617761795f736572766963655f6368617267657c733a303a22223b64656c69766572795f616d6f756e747c733a303a22223b7461785f747970657c733a313a2231223b646563696d616c735f736570617261746f727c733a313a222e223b74686f7573616e64735f736570617261746f727c733a313a222c223b6f70656e5f636173685f6472617765725f7768656e5f7072696e74696e675f696e766f6963657c733a323a224e6f223b7768656e5f636c69636b696e675f6f6e5f6974656d5f696e5f706f737c733a313a2232223b69735f726f756e64696e675f656e61626c657c733a313a2230223b617474656e64616e63655f747970657c733a313a2232223b64656661756c745f6f726465725f747970657c733a313a2231223b69735f6c6f79616c74795f656e61626c657c733a373a2264697361626c65223b7072655f6f725f706f73745f7061796d656e747c733a313a2231223b6d696e696d756d5f706f696e745f746f5f72656465656d7c733a313a2230223b6c6f79616c74795f726174657c733a333a22302e31223b73706c69745f62696c6c7c733a313a2231223b706c6163655f6f726465725f746f6f6c7469707c733a343a2273686f77223b666f6f645f6d656e755f746f6f6c7469707c733a343a2273686f77223b7461626c655f62675f636f6c6f727c733a31303a227461626c655f62675f31223b6b6f745f7072696e745f6f6e6c696e655f73656c665f6f726465727c733a313a2231223b64656661756c745f7061796d656e747c733a313a2231223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b6c616e67756167655f6d616e69666573746f7c733a393a22726576686762726576223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f7469746c657c733a31313a224c6f63616c205461786573223b7461785f726567697374726174696f6e5f6e6f7c733a383a223332313332353837223b7461785f69735f6773747c733a323a224e6f223b6170706c795f6f6e5f64656c69766572795f6368617267657c733a313a2231223b73746174655f636f64657c733a373a2230393331323332223b6c6f67696e5f747970657c733a313a2231223b5f5f63695f766172737c613a333a7b733a31313a22657863657074696f6e5f32223b733a333a226f6c64223b733a393a22657863657074696f6e223b733a333a226f6c64223b733a31313a22657863657074696f6e5f33223b733a333a226f6c64223b7d6f75746c65745f6e616d657c733a31313a224368657a7a792042697465223b616464726573737c733a35323a22436865657a792042697465204d412d4d412026616d703b20536f6e732020506c617a6120536861682044657261692c2053776174223b656d61696c7c733a303a22223b6f6e6c696e655f6f726465725f6d6f64756c657c733a313a2232223b64656661756c745f7761697465727c733a313a2233223b6163746976655f7374617475737c733a363a22616374697665223b64656661756c745f6f726465725f747970655f64656c69766572795f707c733a303a22223b736d735f73656e645f6175746f7c733a313a2231223b73686f775f6f726465725f66756c6c5f73686f72747c733a313a2231223b6f6e6c696e655f73656c65637465645f6f75746c65747c733a313a2231223b696e766f6963655f6c6f676f7c733a33373a2237353861646564383439306236356465626361613133353137343731316431392e6a706567223b736974655f6e616d657c733a34343a224f6e6c696e65204f72646572206f6620436865657a792042697465204d412d4d412026616d703b20536f6e73223b666f6f7465727c733a34363a224f6e6c696e65204f72646572206f6620436865657a792042697465204d412d4d412026616d703b20536f6e730d0a223b73797374656d5f6c6f676f7c733a33373a2263396663303536343963623433393039393936376131633766346235306262612e6a706567223b66617669636f6e7c733a33373a2265323739303065656463626265326433653536613031383761666637376331352e6a706567223b776562736974655f7468656d655f636f6c6f727c733a373a2223643766663066223b6f75746c65745f69647c733a313a2231223b69735f7761697465727c733a323a224e6f223b636f756e7465725f69647c733a313a2231223b636f756e7465725f6e616d657c733a323a223031223b7072696e7465725f69647c733a313a2231223b62696c6c5f7072696e7465725f69647c733a313a2231223b706174687c733a303a22223b7469746c657c733a373a225072696e746572223b747970657c733a303a22223b636861726163746572735f7065725f6c696e657c733a313a2230223b7072696e7465725f69705f616464726573737c733a303a22223b7072696e7465725f706f72747c733a303a22223b7072696e74696e675f63686f6963657c733a31373a227765625f62726f777365725f706f707570223b697076666f75725f616464726573737c733a303a22223b7072696e745f666f726d61747c733a343a2238306d6d223b696e765f71725f636f64655f656e61626c655f7374617475737c733a363a22456e61626c65223b706174685f62696c6c7c733a303a22223b7469746c655f62696c6c7c733a373a225072696e746572223b747970655f62696c6c7c733a303a22223b636861726163746572735f7065725f6c696e655f62696c6c7c733a313a2230223b7072696e7465725f69705f616464726573735f62696c6c7c733a303a22223b7072696e7465725f706f72745f62696c6c7c733a303a22223b7072696e74696e675f63686f6963655f62696c6c7c733a31373a227765625f62726f777365725f706f707570223b697076666f75725f616464726573735f62696c6c7c733a303a22223b7072696e745f666f726d61745f62696c6c7c733a343a2238306d6d223b696e765f71725f636f64655f656e61626c655f7374617475735f62696c6c7c733a363a22456e61626c65223b),
('9d9f4cb59045332e44c55f35f14b8b9f0cf73e5e', '127.0.0.1', 1770106271, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737303130363237313b73797374656d5f76657273696f6e5f6e756d6265727c733a333a22372e36223b776c627c693a313b66756e6374696f6e5f6163636573737c613a3334343a7b693a303b733a383a22766965772d333730223b693a313b733a323a222d30223b693a323b733a33333a22616c6c5f73657474696e675f7265736572766174696f6e5f6f726465722d333638223b693a333b733a323a222d30223b693a343b733a32383a22616c6c5f73657474696e675f6f6e6c696e655f6f726465722d333636223b693a353b733a323a222d30223b693a363b733a32353a22616c6c5f73657474696e675f73656c5f6f726465722d333634223b693a373b733a323a222d30223b693a383b733a383a22766965772d333632223b693a393b733a323a222d30223b693a31303b733a31353a22616c6c5f73657474696e672d333538223b693a31313b733a323a222d30223b693a31323b733a31303a2264656c6574652d333533223b693a31333b733a383a22766965772d333533223b693a31343b733a31303a227570646174652d333533223b693a31353b733a373a226164642d333533223b693a31363b733a323a222d30223b693a31373b733a393a22706f735f32352d3733223b693a31383b733a393a2272657365742d333530223b693a31393b733a323a222d30223b693a32303b733a383a22766965772d333436223b693a32313b733a323a222d30223b693a32323b733a31363a22766965775f64657461696c732d333430223b693a32333b733a31303a2264656c6574652d333430223b693a32343b733a383a22766965772d333430223b693a32353b733a31303a227570646174652d333430223b693a32363b733a373a226164642d333430223b693a32373b733a323a222d30223b693a32383b733a31373a22736f7274696e67466f72504f532d323239223b693a32393b733a383a22766965772d333337223b693a33303b733a323a222d30223b693a33313b733a383a22766965772d333332223b693a33323b733a323a222d30223b693a33333b733a31303a227570646174652d333330223b693a33343b733a323a222d30223b693a33353b733a31303a2264656c6574652d333235223b693a33363b733a383a22766965772d333235223b693a33373b733a31303a227570646174652d333235223b693a33383b733a373a226164642d333235223b693a33393b733a323a222d30223b693a34303b733a383a22766965772d333231223b693a34313b733a323a222d30223b693a34323b733a31343a22646561637469766174652d333136223b693a34333b733a31323a2261637469766174652d333136223b693a34343b733a31303a2264656c6574652d333136223b693a34353b733a383a22766965772d333136223b693a34363b733a323a222d30223b693a34373b733a383a22766965772d333134223b693a34383b733a323a222d30223b693a34393b733a383a22766965772d333130223b693a35303b733a31333a22636865636b5f6f75742d333130223b693a35313b733a31323a22636865636b5f696e2d333130223b693a35323b733a323a222d30223b693a35333b733a31313a22736f7274696e672d323630223b693a35343b733a383a22766965772d333037223b693a35353b733a323a222d30223b693a35363b733a31393a2272657365744461696c7953616c65732d313233223b693a35373b733a32303a226578706f72744461696c7953616c65732d313233223b693a35383b733a32373a226368616e67655f64656c69766572795f616464726573732d313233223b693a35393b733a31303a227570646174652d333032223b693a36303b733a323a222d30223b693a36313b733a31303a227570646174652d333030223b693a36323b733a323a222d30223b693a36333b733a31303a227570646174652d323938223b693a36343b733a323a222d30223b693a36353b733a31343a22646561637469766174652d323931223b693a36363b733a31323a2261637469766174652d323931223b693a36373b733a31303a2264656c6574652d323931223b693a36383b733a383a22766965772d323931223b693a36393b733a31303a227570646174652d323931223b693a37303b733a373a226164642d323931223b693a37313b733a323a222d30223b693a37323b733a383a22636f70792d323835223b693a37333b733a31303a2264656c6574652d323835223b693a37343b733a383a22766965772d323835223b693a37353b733a31303a227570646174652d323835223b693a37363b733a373a226164642d323835223b693a37373b733a323a222d30223b693a37383b733a31303a2264656c6574652d323830223b693a37393b733a383a22766965772d323830223b693a38303b733a31303a227570646174652d323830223b693a38313b733a373a226164642d323830223b693a38323b733a323a222d30223b693a38333b733a31303a2264656c6574652d323735223b693a38343b733a383a22766965772d323735223b693a38353b733a31303a227570646174652d323735223b693a38363b733a373a226164642d323735223b693a38373b733a323a222d30223b693a38383b733a31303a2264656c6574652d323730223b693a38393b733a383a22766965772d323730223b693a39303b733a31303a227570646174652d323730223b693a39313b733a373a226164642d323730223b693a39323b733a323a222d30223b693a39333b733a31303a2264656c6574652d323635223b693a39343b733a383a22766965772d323635223b693a39353b733a31303a227570646174652d323635223b693a39363b733a373a226164642d323635223b693a39373b733a323a222d30223b693a39383b733a31303a2264656c6574652d323630223b693a39393b733a383a22766965772d323630223b693a3130303b733a31303a227570646174652d323630223b693a3130313b733a373a226164642d323630223b693a3130323b733a323a222d30223b693a3130333b733a31303a2264656c6574652d323535223b693a3130343b733a383a22766965772d323535223b693a3130353b733a31303a227570646174652d323535223b693a3130363b733a373a226164642d323535223b693a3130373b733a323a222d30223b693a3130383b733a31393a2275706c6f61645f637573746f6d65722d323439223b693a3130393b733a31303a2264656c6574652d323439223b693a3131303b733a383a22766965772d323439223b693a3131313b733a31303a227570646174652d323439223b693a3131323b733a373a226164642d323439223b693a3131333b733a323a222d30223b693a3131343b733a31303a2264656c6574652d323434223b693a3131353b733a383a22766965772d323434223b693a3131363b733a31303a227570646174652d323434223b693a3131373b733a373a226164642d323434223b693a3131383b733a323a222d30223b693a3131393b733a31363a226974656d5f626172636f64652d323334223b693a3132303b733a33323a2275706c6f61645f666f6f645f6d656e755f696e6772656469656e74732d323334223b693a3132313b733a32303a2275706c6f61645f666f6f645f6d656e752d323334223b693a3132323b733a31393a2261737369676e5f6d6f6469666965722d323334223b693a3132333b733a31363a22766965775f64657461696c732d323334223b693a3132343b733a31303a2264656c6574652d323334223b693a3132353b733a383a22766965772d323334223b693a3132363b733a31303a227570646174652d323334223b693a3132373b733a373a226164642d323334223b693a3132383b733a323a222d30223b693a3132393b733a31303a2264656c6574652d323239223b693a3133303b733a383a22766965772d323239223b693a3133313b733a31303a227570646174652d323239223b693a3133323b733a373a226164642d323239223b693a3133333b733a323a222d30223b693a3133343b733a31363a22766965775f64657461696c732d323233223b693a3133353b733a31303a2264656c6574652d323233223b693a3133363b733a383a22766965772d323233223b693a3133373b733a31303a227570646174652d323233223b693a3133383b733a373a226164642d323233223b693a3133393b733a323a222d30223b693a3134303b733a32313a2275706c6f61645f696e6772656469656e742d323137223b693a3134313b733a31303a2264656c6574652d323137223b693a3134323b733a383a22766965772d323137223b693a3134333b733a31303a227570646174652d323137223b693a3134343b733a373a226164642d323137223b693a3134353b733a323a222d30223b693a3134363b733a31303a2264656c6574652d323132223b693a3134373b733a383a22766965772d323132223b693a3134383b733a31303a227570646174652d323132223b693a3134393b733a373a226164642d323132223b693a3135303b733a323a222d30223b693a3135313b733a31303a2264656c6574652d323037223b693a3135323b733a383a22766965772d323037223b693a3135333b733a31303a227570646174652d323037223b693a3135343b733a373a226164642d323037223b693a3135353b733a323a222d30223b693a3135363b733a383a22766965772d323035223b693a3135373b733a323a222d30223b693a3135383b733a383a22766965772d323033223b693a3135393b733a323a222d30223b693a3136303b733a383a22766965772d323031223b693a3136313b733a323a222d30223b693a3136323b733a383a22766965772d313939223b693a3136333b733a323a222d30223b693a3136343b733a383a22766965772d313937223b693a3136353b733a323a222d30223b693a3136363b733a383a22766965772d313935223b693a3136373b733a323a222d30223b693a3136383b733a383a22766965772d313933223b693a3136393b733a323a222d30223b693a3137303b733a383a22766965772d313931223b693a3137313b733a323a222d30223b693a3137323b733a383a22766965772d313839223b693a3137333b733a323a222d30223b693a3137343b733a383a22766965772d313837223b693a3137353b733a323a222d30223b693a3137363b733a383a22766965772d313835223b693a3137373b733a323a222d30223b693a3137383b733a383a22766965772d313833223b693a3137393b733a323a222d30223b693a3138303b733a383a22766965772d313831223b693a3138313b733a323a222d30223b693a3138323b733a383a22766965772d313739223b693a3138333b733a323a222d30223b693a3138343b733a383a22766965772d313735223b693a3138353b733a323a222d30223b693a3138363b733a383a22766965772d313733223b693a3138373b733a323a222d30223b693a3138383b733a383a22766965772d313731223b693a3138393b733a323a222d30223b693a3139303b733a383a22766965772d313639223b693a3139313b733a323a222d30223b693a3139323b733a383a22766965772d313637223b693a3139333b733a323a222d30223b693a3139343b733a383a22766965772d313635223b693a3139353b733a323a222d30223b693a3139363b733a383a22766965772d313633223b693a3139373b733a323a222d30223b693a3139383b733a383a22766965772d313631223b693a3139393b733a323a222d30223b693a3230303b733a383a22766965772d313539223b693a3230313b733a323a222d30223b693a3230323b733a31303a2264656c6574652d313535223b693a3230333b733a383a22766965772d313535223b693a3230343b733a373a226164642d313535223b693a3230353b733a323a222d30223b693a3230363b733a31303a2264656c6574652d313531223b693a3230373b733a383a22766965772d313531223b693a3230383b733a373a226164642d313531223b693a3230393b733a323a222d30223b693a3231303b733a31303a2264656c6574652d313437223b693a3231313b733a383a22766965772d313437223b693a3231323b733a373a226164642d313437223b693a3231333b733a323a222d30223b693a3231343b733a31303a2264656c6574652d313432223b693a3231353b733a383a22766965772d313432223b693a3231363b733a31303a227570646174652d313432223b693a3231373b733a373a226164642d313432223b693a3231383b733a323a222d30223b693a3231393b733a31363a22766965775f64657461696c732d313337223b693a3232303b733a31303a2264656c6574652d313337223b693a3232313b733a383a22766965772d313337223b693a3232323b733a373a226164642d313337223b693a3232333b733a323a222d30223b693a3232343b733a31363a22766965775f64657461696c732d313331223b693a3232353b733a31303a2264656c6574652d313331223b693a3232363b733a383a22766965772d313331223b693a3232373b733a31303a227570646174652d313331223b693a3232383b733a373a226164642d313331223b693a3232393b733a323a222d30223b693a3233303b733a383a22766965772d313239223b693a3233313b733a323a222d30223b693a3233323b733a31303a2264656c6574652d313233223b693a3233333b733a31363a22766965775f696e766f6963652d313233223b693a3233343b733a31303a22726566756e642d313233223b693a3233353b733a383a22766965772d313233223b693a3233363b733a323a222d30223b693a3233373b733a31303a2264656c6574652d313138223b693a3233383b733a383a22766965772d313138223b693a3233393b733a31303a227570646174652d313138223b693a3234303b733a373a226164642d313138223b693a3234313b733a323a222d30223b693a3234323b733a31363a22766965775f64657461696c732d313132223b693a3234333b733a31303a2264656c6574652d313132223b693a3234343b733a383a22766965772d313132223b693a3234353b733a31303a227570646174652d313132223b693a3234363b733a373a226164642d313132223b693a3234373b733a323a222d30223b693a3234383b733a31363a22766965775f64657461696c732d313036223b693a3234393b733a31303a2264656c6574652d313036223b693a3235303b733a383a22766965772d313036223b693a3235313b733a31303a227570646174652d313036223b693a3235323b733a373a226164642d313036223b693a3235333b733a323a222d30223b693a3235343b733a383a22766965772d313034223b693a3235353b733a323a222d30223b693a3235363b733a383a22656e7465722d3938223b693a3235373b733a393a2264656c6574652d3938223b693a3235383b733a373a22766965772d3938223b693a3235393b733a393a227570646174652d3938223b693a3236303b733a363a226164642d3938223b693a3236313b733a323a222d30223b693a3236323b733a393a22706f735f32332d3733223b693a3236333b733a393a22706f735f32322d3733223b693a3236343b733a393a22706f735f32312d3733223b693a3236353b733a393a22706f735f32302d3733223b693a3236363b733a393a22706f735f31392d3733223b693a3236373b733a393a22706f735f31382d3733223b693a3236383b733a393a22706f735f31372d3733223b693a3236393b733a393a22706f735f31362d3733223b693a3237303b733a393a22706f735f31352d3733223b693a3237313b733a393a22706f735f31342d3733223b693a3237323b733a393a22706f735f31332d3733223b693a3237333b733a393a22706f735f31322d3733223b693a3237343b733a393a22706f735f31312d3733223b693a3237353b733a393a22706f735f31302d3733223b693a3237363b733a383a22706f735f392d3733223b693a3237373b733a383a22706f735f382d3733223b693a3237383b733a383a22706f735f372d3733223b693a3237393b733a383a22706f735f362d3733223b693a3238303b733a383a22706f735f352d3733223b693a3238313b733a383a22706f735f342d3733223b693a3238323b733a383a22706f735f332d3733223b693a3238333b733a383a22706f735f322d3733223b693a3238343b733a383a22706f735f312d3733223b693a3238353b733a323a222d30223b693a3238363b733a383a22656e7465722d3637223b693a3238373b733a393a2264656c6574652d3637223b693a3238383b733a373a22766965772d3637223b693a3238393b733a393a227570646174652d3637223b693a3239303b733a363a226164642d3637223b693a3239313b733a323a222d30223b693a3239323b733a393a227570646174652d3634223b693a3239333b733a323a222d30223b693a3239343b733a31323a22756e696e7374616c6c2d3632223b693a3239353b733a323a222d30223b693a3239363b733a393a227570646174652d3630223b693a3239373b733a323a222d30223b693a3239383b733a393a2264656c6574652d3535223b693a3239393b733a373a22766965772d3535223b693a3330303b733a393a227570646174652d3535223b693a3330313b733a363a226164642d3535223b693a3330323b733a323a222d30223b693a3330333b733a31333a227570646174655f7461782d3532223b693a3330343b733a323a222d30223b693a3330353b733a393a227570646174652d3439223b693a3330363b733a323a222d30223b693a3330373b733a393a2264656c6574652d3335223b693a3330383b733a373a22766965772d3335223b693a3330393b733a393a227570646174652d3335223b693a3331303b733a363a226164642d3335223b693a3331313b733a323a222d30223b693a3331323b733a393a227570646174652d3331223b693a3331333b733a373a22766965772d3331223b693a3331343b733a323a222d30223b693a3331353b733a393a2264656c6574652d3236223b693a3331363b733a373a22766965772d3236223b693a3331373b733a393a227570646174652d3236223b693a3331383b733a363a226164642d3236223b693a3331393b733a323a222d30223b693a3332303b733a393a2264656c6574652d3232223b693a3332313b733a373a22766965772d3232223b693a3332323b733a363a226164642d3232223b693a3332333b733a323a222d30223b693a3332343b733a31373a22626c6f636b5f616c6c5f757365722d3135223b693a3332353b733a31353a2273686f775f6f75746c6574732d3135223b693a3332363b733a393a2264656c6574652d3135223b693a3332373b733a373a22766965772d3135223b693a3332383b733a393a227570646174652d3135223b693a3332393b733a363a226164642d3135223b693a3333303b733a323a222d30223b693a3333313b733a393a227570646174652d3132223b693a3333323b733a373a22766965772d3132223b693a3333333b733a323a222d30223b693a3333343b733a383a227570646174652d39223b693a3333353b733a363a22766965772d39223b693a3333363b733a323a222d30223b693a3333373b733a383a227570646174652d36223b693a3333383b733a323a222d30223b693a3333393b733a383a227570646174652d33223b693a3334303b733a363a22766965772d33223b693a3334313b733a323a222d30223b693a3334323b733a363a22766965772d31223b693a3334333b733a323a222d30223b7d757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b64657369676e6174696f6e7c733a31313a2253757065722041646d696e223b66756c6c5f6e616d657c733a31303a2241646d696e2055736572223b73686f72745f6e616d657c733a313a2261223b70686f6e657c733a31323a22393233343238393237333035223b656d61696c5f616464726573737c733a31353a2261646d696e4061646d696e2e636f6d223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b73657373696f6e5f6f75746c6574737c733a313a2232223b6163746976655f6d656e755f746d707c733a303a22223b63757272656e63797c733a333a22504b52223b7a6f6e655f6e616d657c733a31323a22417369612f4b617261636869223b646174655f666f726d61747c733a353a22592f6d2f64223b627573696e6573735f6e616d657c733a33323a22436865657a792042697465204d412d4d412026616d703b616d703b20536f6e73223b776562736974657c733a31303a22666972656170702e6363223b63757272656e63795f706f736974696f6e7c733a31333a224265666f726520416d6f756e74223b707265636973696f6e7c733a313a2232223b64656661756c745f637573746f6d65727c733a313a2231223b6578706f72745f6461696c795f73616c657c733a363a22656e61626c65223b736572766963655f616d6f756e747c733a303a22223b74616b655f617761795f736572766963655f6368617267657c733a303a22223b64656c69766572795f616d6f756e747c733a303a22223b7461785f747970657c733a313a2231223b646563696d616c735f736570617261746f727c733a313a222e223b74686f7573616e64735f736570617261746f727c733a313a222c223b6f70656e5f636173685f6472617765725f7768656e5f7072696e74696e675f696e766f6963657c733a323a224e6f223b7768656e5f636c69636b696e675f6f6e5f6974656d5f696e5f706f737c733a313a2232223b69735f726f756e64696e675f656e61626c657c733a313a2230223b617474656e64616e63655f747970657c733a313a2232223b64656661756c745f6f726465725f747970657c733a313a2231223b69735f6c6f79616c74795f656e61626c657c733a373a2264697361626c65223b7072655f6f725f706f73745f7061796d656e747c733a313a2231223b6d696e696d756d5f706f696e745f746f5f72656465656d7c733a313a2230223b6c6f79616c74795f726174657c733a333a22302e31223b73706c69745f62696c6c7c733a313a2231223b706c6163655f6f726465725f746f6f6c7469707c733a343a2273686f77223b666f6f645f6d656e755f746f6f6c7469707c733a343a2273686f77223b7461626c655f62675f636f6c6f727c733a31303a227461626c655f62675f31223b6b6f745f7072696e745f6f6e6c696e655f73656c665f6f726465727c733a313a2231223b64656661756c745f7061796d656e747c733a313a2231223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b6c616e67756167655f6d616e69666573746f7c733a393a22726576686762726576223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f7469746c657c733a31313a224c6f63616c205461786573223b7461785f726567697374726174696f6e5f6e6f7c733a383a223332313332353837223b7461785f69735f6773747c733a323a224e6f223b6170706c795f6f6e5f64656c69766572795f6368617267657c733a313a2231223b73746174655f636f64657c733a373a2230393331323332223b6c6f67696e5f747970657c733a313a2231223b5f5f63695f766172737c613a333a7b733a31313a22657863657074696f6e5f32223b733a333a226f6c64223b733a393a22657863657074696f6e223b733a333a226f6c64223b733a31313a22657863657074696f6e5f33223b733a333a226f6c64223b7d6f75746c65745f6e616d657c733a31313a224368657a7a792042697465223b616464726573737c733a35323a22436865657a792042697465204d412d4d412026616d703b20536f6e732020506c617a6120536861682044657261692c2053776174223b656d61696c7c733a303a22223b6f6e6c696e655f6f726465725f6d6f64756c657c733a313a2232223b64656661756c745f7761697465727c733a313a2233223b6163746976655f7374617475737c733a363a22616374697665223b64656661756c745f6f726465725f747970655f64656c69766572795f707c733a303a22223b736d735f73656e645f6175746f7c733a313a2231223b73686f775f6f726465725f66756c6c5f73686f72747c733a313a2231223b6f6e6c696e655f73656c65637465645f6f75746c65747c733a313a2231223b696e766f6963655f6c6f676f7c733a33373a2237353861646564383439306236356465626361613133353137343731316431392e6a706567223b736974655f6e616d657c733a34343a224f6e6c696e65204f72646572206f6620436865657a792042697465204d412d4d412026616d703b20536f6e73223b666f6f7465727c733a34363a224f6e6c696e65204f72646572206f6620436865657a792042697465204d412d4d412026616d703b20536f6e730d0a223b73797374656d5f6c6f676f7c733a33373a2263396663303536343963623433393039393936376131633766346235306262612e6a706567223b66617669636f6e7c733a33373a2265323739303065656463626265326433653536613031383761666637376331352e6a706567223b776562736974655f7468656d655f636f6c6f727c733a373a2223643766663066223b6f75746c65745f69647c733a313a2231223b69735f7761697465727c733a323a224e6f223b636f756e7465725f69647c733a313a2231223b636f756e7465725f6e616d657c733a323a223031223b7072696e7465725f69647c733a313a2231223b62696c6c5f7072696e7465725f69647c733a313a2231223b706174687c733a303a22223b7469746c657c733a373a225072696e746572223b747970657c733a303a22223b636861726163746572735f7065725f6c696e657c733a313a2230223b7072696e7465725f69705f616464726573737c733a303a22223b7072696e7465725f706f72747c733a303a22223b7072696e74696e675f63686f6963657c733a31373a227765625f62726f777365725f706f707570223b697076666f75725f616464726573737c733a303a22223b7072696e745f666f726d61747c733a343a2238306d6d223b696e765f71725f636f64655f656e61626c655f7374617475737c733a363a22456e61626c65223b706174685f62696c6c7c733a303a22223b7469746c655f62696c6c7c733a373a225072696e746572223b747970655f62696c6c7c733a303a22223b636861726163746572735f7065725f6c696e655f62696c6c7c733a313a2230223b7072696e7465725f69705f616464726573735f62696c6c7c733a303a22223b7072696e7465725f706f72745f62696c6c7c733a303a22223b7072696e74696e675f63686f6963655f62696c6c7c733a31373a227765625f62726f777365725f706f707570223b697076666f75725f616464726573735f62696c6c7c733a303a22223b7072696e745f666f726d61745f62696c6c7c733a343a2238306d6d223b696e765f71725f636f64655f656e61626c655f7374617475735f62696c6c7c733a363a22456e61626c65223b);
INSERT INTO `tbl_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('5e36bae92cfb24d3c674a8ea9aacd9aa52afbc14', '127.0.0.1', 1770106329, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737303130363237313b73797374656d5f76657273696f6e5f6e756d6265727c733a333a22372e36223b776c627c693a313b66756e6374696f6e5f6163636573737c613a3334343a7b693a303b733a383a22766965772d333730223b693a313b733a323a222d30223b693a323b733a33333a22616c6c5f73657474696e675f7265736572766174696f6e5f6f726465722d333638223b693a333b733a323a222d30223b693a343b733a32383a22616c6c5f73657474696e675f6f6e6c696e655f6f726465722d333636223b693a353b733a323a222d30223b693a363b733a32353a22616c6c5f73657474696e675f73656c5f6f726465722d333634223b693a373b733a323a222d30223b693a383b733a383a22766965772d333632223b693a393b733a323a222d30223b693a31303b733a31353a22616c6c5f73657474696e672d333538223b693a31313b733a323a222d30223b693a31323b733a31303a2264656c6574652d333533223b693a31333b733a383a22766965772d333533223b693a31343b733a31303a227570646174652d333533223b693a31353b733a373a226164642d333533223b693a31363b733a323a222d30223b693a31373b733a393a22706f735f32352d3733223b693a31383b733a393a2272657365742d333530223b693a31393b733a323a222d30223b693a32303b733a383a22766965772d333436223b693a32313b733a323a222d30223b693a32323b733a31363a22766965775f64657461696c732d333430223b693a32333b733a31303a2264656c6574652d333430223b693a32343b733a383a22766965772d333430223b693a32353b733a31303a227570646174652d333430223b693a32363b733a373a226164642d333430223b693a32373b733a323a222d30223b693a32383b733a31373a22736f7274696e67466f72504f532d323239223b693a32393b733a383a22766965772d333337223b693a33303b733a323a222d30223b693a33313b733a383a22766965772d333332223b693a33323b733a323a222d30223b693a33333b733a31303a227570646174652d333330223b693a33343b733a323a222d30223b693a33353b733a31303a2264656c6574652d333235223b693a33363b733a383a22766965772d333235223b693a33373b733a31303a227570646174652d333235223b693a33383b733a373a226164642d333235223b693a33393b733a323a222d30223b693a34303b733a383a22766965772d333231223b693a34313b733a323a222d30223b693a34323b733a31343a22646561637469766174652d333136223b693a34333b733a31323a2261637469766174652d333136223b693a34343b733a31303a2264656c6574652d333136223b693a34353b733a383a22766965772d333136223b693a34363b733a323a222d30223b693a34373b733a383a22766965772d333134223b693a34383b733a323a222d30223b693a34393b733a383a22766965772d333130223b693a35303b733a31333a22636865636b5f6f75742d333130223b693a35313b733a31323a22636865636b5f696e2d333130223b693a35323b733a323a222d30223b693a35333b733a31313a22736f7274696e672d323630223b693a35343b733a383a22766965772d333037223b693a35353b733a323a222d30223b693a35363b733a31393a2272657365744461696c7953616c65732d313233223b693a35373b733a32303a226578706f72744461696c7953616c65732d313233223b693a35383b733a32373a226368616e67655f64656c69766572795f616464726573732d313233223b693a35393b733a31303a227570646174652d333032223b693a36303b733a323a222d30223b693a36313b733a31303a227570646174652d333030223b693a36323b733a323a222d30223b693a36333b733a31303a227570646174652d323938223b693a36343b733a323a222d30223b693a36353b733a31343a22646561637469766174652d323931223b693a36363b733a31323a2261637469766174652d323931223b693a36373b733a31303a2264656c6574652d323931223b693a36383b733a383a22766965772d323931223b693a36393b733a31303a227570646174652d323931223b693a37303b733a373a226164642d323931223b693a37313b733a323a222d30223b693a37323b733a383a22636f70792d323835223b693a37333b733a31303a2264656c6574652d323835223b693a37343b733a383a22766965772d323835223b693a37353b733a31303a227570646174652d323835223b693a37363b733a373a226164642d323835223b693a37373b733a323a222d30223b693a37383b733a31303a2264656c6574652d323830223b693a37393b733a383a22766965772d323830223b693a38303b733a31303a227570646174652d323830223b693a38313b733a373a226164642d323830223b693a38323b733a323a222d30223b693a38333b733a31303a2264656c6574652d323735223b693a38343b733a383a22766965772d323735223b693a38353b733a31303a227570646174652d323735223b693a38363b733a373a226164642d323735223b693a38373b733a323a222d30223b693a38383b733a31303a2264656c6574652d323730223b693a38393b733a383a22766965772d323730223b693a39303b733a31303a227570646174652d323730223b693a39313b733a373a226164642d323730223b693a39323b733a323a222d30223b693a39333b733a31303a2264656c6574652d323635223b693a39343b733a383a22766965772d323635223b693a39353b733a31303a227570646174652d323635223b693a39363b733a373a226164642d323635223b693a39373b733a323a222d30223b693a39383b733a31303a2264656c6574652d323630223b693a39393b733a383a22766965772d323630223b693a3130303b733a31303a227570646174652d323630223b693a3130313b733a373a226164642d323630223b693a3130323b733a323a222d30223b693a3130333b733a31303a2264656c6574652d323535223b693a3130343b733a383a22766965772d323535223b693a3130353b733a31303a227570646174652d323535223b693a3130363b733a373a226164642d323535223b693a3130373b733a323a222d30223b693a3130383b733a31393a2275706c6f61645f637573746f6d65722d323439223b693a3130393b733a31303a2264656c6574652d323439223b693a3131303b733a383a22766965772d323439223b693a3131313b733a31303a227570646174652d323439223b693a3131323b733a373a226164642d323439223b693a3131333b733a323a222d30223b693a3131343b733a31303a2264656c6574652d323434223b693a3131353b733a383a22766965772d323434223b693a3131363b733a31303a227570646174652d323434223b693a3131373b733a373a226164642d323434223b693a3131383b733a323a222d30223b693a3131393b733a31363a226974656d5f626172636f64652d323334223b693a3132303b733a33323a2275706c6f61645f666f6f645f6d656e755f696e6772656469656e74732d323334223b693a3132313b733a32303a2275706c6f61645f666f6f645f6d656e752d323334223b693a3132323b733a31393a2261737369676e5f6d6f6469666965722d323334223b693a3132333b733a31363a22766965775f64657461696c732d323334223b693a3132343b733a31303a2264656c6574652d323334223b693a3132353b733a383a22766965772d323334223b693a3132363b733a31303a227570646174652d323334223b693a3132373b733a373a226164642d323334223b693a3132383b733a323a222d30223b693a3132393b733a31303a2264656c6574652d323239223b693a3133303b733a383a22766965772d323239223b693a3133313b733a31303a227570646174652d323239223b693a3133323b733a373a226164642d323239223b693a3133333b733a323a222d30223b693a3133343b733a31363a22766965775f64657461696c732d323233223b693a3133353b733a31303a2264656c6574652d323233223b693a3133363b733a383a22766965772d323233223b693a3133373b733a31303a227570646174652d323233223b693a3133383b733a373a226164642d323233223b693a3133393b733a323a222d30223b693a3134303b733a32313a2275706c6f61645f696e6772656469656e742d323137223b693a3134313b733a31303a2264656c6574652d323137223b693a3134323b733a383a22766965772d323137223b693a3134333b733a31303a227570646174652d323137223b693a3134343b733a373a226164642d323137223b693a3134353b733a323a222d30223b693a3134363b733a31303a2264656c6574652d323132223b693a3134373b733a383a22766965772d323132223b693a3134383b733a31303a227570646174652d323132223b693a3134393b733a373a226164642d323132223b693a3135303b733a323a222d30223b693a3135313b733a31303a2264656c6574652d323037223b693a3135323b733a383a22766965772d323037223b693a3135333b733a31303a227570646174652d323037223b693a3135343b733a373a226164642d323037223b693a3135353b733a323a222d30223b693a3135363b733a383a22766965772d323035223b693a3135373b733a323a222d30223b693a3135383b733a383a22766965772d323033223b693a3135393b733a323a222d30223b693a3136303b733a383a22766965772d323031223b693a3136313b733a323a222d30223b693a3136323b733a383a22766965772d313939223b693a3136333b733a323a222d30223b693a3136343b733a383a22766965772d313937223b693a3136353b733a323a222d30223b693a3136363b733a383a22766965772d313935223b693a3136373b733a323a222d30223b693a3136383b733a383a22766965772d313933223b693a3136393b733a323a222d30223b693a3137303b733a383a22766965772d313931223b693a3137313b733a323a222d30223b693a3137323b733a383a22766965772d313839223b693a3137333b733a323a222d30223b693a3137343b733a383a22766965772d313837223b693a3137353b733a323a222d30223b693a3137363b733a383a22766965772d313835223b693a3137373b733a323a222d30223b693a3137383b733a383a22766965772d313833223b693a3137393b733a323a222d30223b693a3138303b733a383a22766965772d313831223b693a3138313b733a323a222d30223b693a3138323b733a383a22766965772d313739223b693a3138333b733a323a222d30223b693a3138343b733a383a22766965772d313735223b693a3138353b733a323a222d30223b693a3138363b733a383a22766965772d313733223b693a3138373b733a323a222d30223b693a3138383b733a383a22766965772d313731223b693a3138393b733a323a222d30223b693a3139303b733a383a22766965772d313639223b693a3139313b733a323a222d30223b693a3139323b733a383a22766965772d313637223b693a3139333b733a323a222d30223b693a3139343b733a383a22766965772d313635223b693a3139353b733a323a222d30223b693a3139363b733a383a22766965772d313633223b693a3139373b733a323a222d30223b693a3139383b733a383a22766965772d313631223b693a3139393b733a323a222d30223b693a3230303b733a383a22766965772d313539223b693a3230313b733a323a222d30223b693a3230323b733a31303a2264656c6574652d313535223b693a3230333b733a383a22766965772d313535223b693a3230343b733a373a226164642d313535223b693a3230353b733a323a222d30223b693a3230363b733a31303a2264656c6574652d313531223b693a3230373b733a383a22766965772d313531223b693a3230383b733a373a226164642d313531223b693a3230393b733a323a222d30223b693a3231303b733a31303a2264656c6574652d313437223b693a3231313b733a383a22766965772d313437223b693a3231323b733a373a226164642d313437223b693a3231333b733a323a222d30223b693a3231343b733a31303a2264656c6574652d313432223b693a3231353b733a383a22766965772d313432223b693a3231363b733a31303a227570646174652d313432223b693a3231373b733a373a226164642d313432223b693a3231383b733a323a222d30223b693a3231393b733a31363a22766965775f64657461696c732d313337223b693a3232303b733a31303a2264656c6574652d313337223b693a3232313b733a383a22766965772d313337223b693a3232323b733a373a226164642d313337223b693a3232333b733a323a222d30223b693a3232343b733a31363a22766965775f64657461696c732d313331223b693a3232353b733a31303a2264656c6574652d313331223b693a3232363b733a383a22766965772d313331223b693a3232373b733a31303a227570646174652d313331223b693a3232383b733a373a226164642d313331223b693a3232393b733a323a222d30223b693a3233303b733a383a22766965772d313239223b693a3233313b733a323a222d30223b693a3233323b733a31303a2264656c6574652d313233223b693a3233333b733a31363a22766965775f696e766f6963652d313233223b693a3233343b733a31303a22726566756e642d313233223b693a3233353b733a383a22766965772d313233223b693a3233363b733a323a222d30223b693a3233373b733a31303a2264656c6574652d313138223b693a3233383b733a383a22766965772d313138223b693a3233393b733a31303a227570646174652d313138223b693a3234303b733a373a226164642d313138223b693a3234313b733a323a222d30223b693a3234323b733a31363a22766965775f64657461696c732d313132223b693a3234333b733a31303a2264656c6574652d313132223b693a3234343b733a383a22766965772d313132223b693a3234353b733a31303a227570646174652d313132223b693a3234363b733a373a226164642d313132223b693a3234373b733a323a222d30223b693a3234383b733a31363a22766965775f64657461696c732d313036223b693a3234393b733a31303a2264656c6574652d313036223b693a3235303b733a383a22766965772d313036223b693a3235313b733a31303a227570646174652d313036223b693a3235323b733a373a226164642d313036223b693a3235333b733a323a222d30223b693a3235343b733a383a22766965772d313034223b693a3235353b733a323a222d30223b693a3235363b733a383a22656e7465722d3938223b693a3235373b733a393a2264656c6574652d3938223b693a3235383b733a373a22766965772d3938223b693a3235393b733a393a227570646174652d3938223b693a3236303b733a363a226164642d3938223b693a3236313b733a323a222d30223b693a3236323b733a393a22706f735f32332d3733223b693a3236333b733a393a22706f735f32322d3733223b693a3236343b733a393a22706f735f32312d3733223b693a3236353b733a393a22706f735f32302d3733223b693a3236363b733a393a22706f735f31392d3733223b693a3236373b733a393a22706f735f31382d3733223b693a3236383b733a393a22706f735f31372d3733223b693a3236393b733a393a22706f735f31362d3733223b693a3237303b733a393a22706f735f31352d3733223b693a3237313b733a393a22706f735f31342d3733223b693a3237323b733a393a22706f735f31332d3733223b693a3237333b733a393a22706f735f31322d3733223b693a3237343b733a393a22706f735f31312d3733223b693a3237353b733a393a22706f735f31302d3733223b693a3237363b733a383a22706f735f392d3733223b693a3237373b733a383a22706f735f382d3733223b693a3237383b733a383a22706f735f372d3733223b693a3237393b733a383a22706f735f362d3733223b693a3238303b733a383a22706f735f352d3733223b693a3238313b733a383a22706f735f342d3733223b693a3238323b733a383a22706f735f332d3733223b693a3238333b733a383a22706f735f322d3733223b693a3238343b733a383a22706f735f312d3733223b693a3238353b733a323a222d30223b693a3238363b733a383a22656e7465722d3637223b693a3238373b733a393a2264656c6574652d3637223b693a3238383b733a373a22766965772d3637223b693a3238393b733a393a227570646174652d3637223b693a3239303b733a363a226164642d3637223b693a3239313b733a323a222d30223b693a3239323b733a393a227570646174652d3634223b693a3239333b733a323a222d30223b693a3239343b733a31323a22756e696e7374616c6c2d3632223b693a3239353b733a323a222d30223b693a3239363b733a393a227570646174652d3630223b693a3239373b733a323a222d30223b693a3239383b733a393a2264656c6574652d3535223b693a3239393b733a373a22766965772d3535223b693a3330303b733a393a227570646174652d3535223b693a3330313b733a363a226164642d3535223b693a3330323b733a323a222d30223b693a3330333b733a31333a227570646174655f7461782d3532223b693a3330343b733a323a222d30223b693a3330353b733a393a227570646174652d3439223b693a3330363b733a323a222d30223b693a3330373b733a393a2264656c6574652d3335223b693a3330383b733a373a22766965772d3335223b693a3330393b733a393a227570646174652d3335223b693a3331303b733a363a226164642d3335223b693a3331313b733a323a222d30223b693a3331323b733a393a227570646174652d3331223b693a3331333b733a373a22766965772d3331223b693a3331343b733a323a222d30223b693a3331353b733a393a2264656c6574652d3236223b693a3331363b733a373a22766965772d3236223b693a3331373b733a393a227570646174652d3236223b693a3331383b733a363a226164642d3236223b693a3331393b733a323a222d30223b693a3332303b733a393a2264656c6574652d3232223b693a3332313b733a373a22766965772d3232223b693a3332323b733a363a226164642d3232223b693a3332333b733a323a222d30223b693a3332343b733a31373a22626c6f636b5f616c6c5f757365722d3135223b693a3332353b733a31353a2273686f775f6f75746c6574732d3135223b693a3332363b733a393a2264656c6574652d3135223b693a3332373b733a373a22766965772d3135223b693a3332383b733a393a227570646174652d3135223b693a3332393b733a363a226164642d3135223b693a3333303b733a323a222d30223b693a3333313b733a393a227570646174652d3132223b693a3333323b733a373a22766965772d3132223b693a3333333b733a323a222d30223b693a3333343b733a383a227570646174652d39223b693a3333353b733a363a22766965772d39223b693a3333363b733a323a222d30223b693a3333373b733a383a227570646174652d36223b693a3333383b733a323a222d30223b693a3333393b733a383a227570646174652d33223b693a3334303b733a363a22766965772d33223b693a3334313b733a323a222d30223b693a3334323b733a363a22766965772d31223b693a3334333b733a323a222d30223b7d757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b64657369676e6174696f6e7c733a31313a2253757065722041646d696e223b66756c6c5f6e616d657c733a31303a2241646d696e2055736572223b73686f72745f6e616d657c733a313a2261223b70686f6e657c733a31323a22393233343238393237333035223b656d61696c5f616464726573737c733a31353a2261646d696e4061646d696e2e636f6d223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b73657373696f6e5f6f75746c6574737c733a313a2232223b6163746976655f6d656e755f746d707c733a303a22223b63757272656e63797c733a333a22504b52223b7a6f6e655f6e616d657c733a31323a22417369612f4b617261636869223b646174655f666f726d61747c733a353a22592f6d2f64223b627573696e6573735f6e616d657c733a33323a22436865657a792042697465204d412d4d412026616d703b616d703b20536f6e73223b776562736974657c733a31303a22666972656170702e6363223b63757272656e63795f706f736974696f6e7c733a31333a224265666f726520416d6f756e74223b707265636973696f6e7c733a313a2232223b64656661756c745f637573746f6d65727c733a313a2231223b6578706f72745f6461696c795f73616c657c733a363a22656e61626c65223b736572766963655f616d6f756e747c733a303a22223b74616b655f617761795f736572766963655f6368617267657c733a303a22223b64656c69766572795f616d6f756e747c733a303a22223b7461785f747970657c733a313a2231223b646563696d616c735f736570617261746f727c733a313a222e223b74686f7573616e64735f736570617261746f727c733a313a222c223b6f70656e5f636173685f6472617765725f7768656e5f7072696e74696e675f696e766f6963657c733a323a224e6f223b7768656e5f636c69636b696e675f6f6e5f6974656d5f696e5f706f737c733a313a2232223b69735f726f756e64696e675f656e61626c657c733a313a2230223b617474656e64616e63655f747970657c733a313a2232223b64656661756c745f6f726465725f747970657c733a313a2231223b69735f6c6f79616c74795f656e61626c657c733a373a2264697361626c65223b7072655f6f725f706f73745f7061796d656e747c733a313a2231223b6d696e696d756d5f706f696e745f746f5f72656465656d7c733a313a2230223b6c6f79616c74795f726174657c733a333a22302e31223b73706c69745f62696c6c7c733a313a2231223b706c6163655f6f726465725f746f6f6c7469707c733a343a2273686f77223b666f6f645f6d656e755f746f6f6c7469707c733a343a2273686f77223b7461626c655f62675f636f6c6f727c733a31303a227461626c655f62675f31223b6b6f745f7072696e745f6f6e6c696e655f73656c665f6f726465727c733a313a2231223b64656661756c745f7061796d656e747c733a313a2231223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b6c616e67756167655f6d616e69666573746f7c733a393a22726576686762726576223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f7469746c657c733a31313a224c6f63616c205461786573223b7461785f726567697374726174696f6e5f6e6f7c733a383a223332313332353837223b7461785f69735f6773747c733a323a224e6f223b6170706c795f6f6e5f64656c69766572795f6368617267657c733a313a2231223b73746174655f636f64657c733a373a2230393331323332223b6c6f67696e5f747970657c733a313a2231223b5f5f63695f766172737c613a333a7b733a31313a22657863657074696f6e5f32223b733a333a226f6c64223b733a393a22657863657074696f6e223b733a333a226f6c64223b733a31313a22657863657074696f6e5f33223b733a333a226f6c64223b7d6f75746c65745f6e616d657c733a31313a224368657a7a792042697465223b616464726573737c733a35323a22436865657a792042697465204d412d4d412026616d703b20536f6e732020506c617a6120536861682044657261692c2053776174223b656d61696c7c733a303a22223b6f6e6c696e655f6f726465725f6d6f64756c657c733a313a2232223b64656661756c745f7761697465727c733a313a2233223b6163746976655f7374617475737c733a363a22616374697665223b64656661756c745f6f726465725f747970655f64656c69766572795f707c733a303a22223b736d735f73656e645f6175746f7c733a313a2231223b73686f775f6f726465725f66756c6c5f73686f72747c733a313a2231223b6f6e6c696e655f73656c65637465645f6f75746c65747c733a313a2231223b696e766f6963655f6c6f676f7c733a33373a2237353861646564383439306236356465626361613133353137343731316431392e6a706567223b736974655f6e616d657c733a34343a224f6e6c696e65204f72646572206f6620436865657a792042697465204d412d4d412026616d703b20536f6e73223b666f6f7465727c733a34363a224f6e6c696e65204f72646572206f6620436865657a792042697465204d412d4d412026616d703b20536f6e730d0a223b73797374656d5f6c6f676f7c733a33373a2263396663303536343963623433393039393936376131633766346235306262612e6a706567223b66617669636f6e7c733a33373a2265323739303065656463626265326433653536613031383761666637376331352e6a706567223b776562736974655f7468656d655f636f6c6f727c733a373a2223643766663066223b6f75746c65745f69647c733a313a2231223b69735f7761697465727c733a323a224e6f223b636f756e7465725f69647c733a313a2231223b636f756e7465725f6e616d657c733a323a223031223b7072696e7465725f69647c733a313a2231223b62696c6c5f7072696e7465725f69647c733a313a2231223b706174687c733a303a22223b7469746c657c733a373a225072696e746572223b747970657c733a303a22223b636861726163746572735f7065725f6c696e657c733a313a2230223b7072696e7465725f69705f616464726573737c733a303a22223b7072696e7465725f706f72747c733a303a22223b7072696e74696e675f63686f6963657c733a31373a227765625f62726f777365725f706f707570223b697076666f75725f616464726573737c733a303a22223b7072696e745f666f726d61747c733a343a2238306d6d223b696e765f71725f636f64655f656e61626c655f7374617475737c733a363a22456e61626c65223b706174685f62696c6c7c733a303a22223b7469746c655f62696c6c7c733a373a225072696e746572223b747970655f62696c6c7c733a303a22223b636861726163746572735f7065725f6c696e655f62696c6c7c733a313a2230223b7072696e7465725f69705f616464726573735f62696c6c7c733a303a22223b7072696e7465725f706f72745f62696c6c7c733a303a22223b7072696e74696e675f63686f6963655f62696c6c7c733a31373a227765625f62726f777365725f706f707570223b697076666f75725f616464726573735f62696c6c7c733a303a22223b7072696e745f666f726d61745f62696c6c7c733a343a2238306d6d223b696e765f71725f636f64655f656e61626c655f7374617475735f62696c6c7c733a363a22456e61626c65223b6163746976655f6c6f67696e5f627574746f6e7c733a313a2231223b),
('5456bf60e99e0fc6773880b6009014f6a3821a13', '127.0.0.1', 1770215811, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737303231353831313b73797374656d5f76657273696f6e5f6e756d6265727c733a333a22372e36223b776c627c693a313b66756e6374696f6e5f6163636573737c613a3334343a7b693a303b733a383a22766965772d333730223b693a313b733a323a222d30223b693a323b733a33333a22616c6c5f73657474696e675f7265736572766174696f6e5f6f726465722d333638223b693a333b733a323a222d30223b693a343b733a32383a22616c6c5f73657474696e675f6f6e6c696e655f6f726465722d333636223b693a353b733a323a222d30223b693a363b733a32353a22616c6c5f73657474696e675f73656c5f6f726465722d333634223b693a373b733a323a222d30223b693a383b733a383a22766965772d333632223b693a393b733a323a222d30223b693a31303b733a31353a22616c6c5f73657474696e672d333538223b693a31313b733a323a222d30223b693a31323b733a31303a2264656c6574652d333533223b693a31333b733a383a22766965772d333533223b693a31343b733a31303a227570646174652d333533223b693a31353b733a373a226164642d333533223b693a31363b733a323a222d30223b693a31373b733a393a22706f735f32352d3733223b693a31383b733a393a2272657365742d333530223b693a31393b733a323a222d30223b693a32303b733a383a22766965772d333436223b693a32313b733a323a222d30223b693a32323b733a31363a22766965775f64657461696c732d333430223b693a32333b733a31303a2264656c6574652d333430223b693a32343b733a383a22766965772d333430223b693a32353b733a31303a227570646174652d333430223b693a32363b733a373a226164642d333430223b693a32373b733a323a222d30223b693a32383b733a31373a22736f7274696e67466f72504f532d323239223b693a32393b733a383a22766965772d333337223b693a33303b733a323a222d30223b693a33313b733a383a22766965772d333332223b693a33323b733a323a222d30223b693a33333b733a31303a227570646174652d333330223b693a33343b733a323a222d30223b693a33353b733a31303a2264656c6574652d333235223b693a33363b733a383a22766965772d333235223b693a33373b733a31303a227570646174652d333235223b693a33383b733a373a226164642d333235223b693a33393b733a323a222d30223b693a34303b733a383a22766965772d333231223b693a34313b733a323a222d30223b693a34323b733a31343a22646561637469766174652d333136223b693a34333b733a31323a2261637469766174652d333136223b693a34343b733a31303a2264656c6574652d333136223b693a34353b733a383a22766965772d333136223b693a34363b733a323a222d30223b693a34373b733a383a22766965772d333134223b693a34383b733a323a222d30223b693a34393b733a383a22766965772d333130223b693a35303b733a31333a22636865636b5f6f75742d333130223b693a35313b733a31323a22636865636b5f696e2d333130223b693a35323b733a323a222d30223b693a35333b733a31313a22736f7274696e672d323630223b693a35343b733a383a22766965772d333037223b693a35353b733a323a222d30223b693a35363b733a31393a2272657365744461696c7953616c65732d313233223b693a35373b733a32303a226578706f72744461696c7953616c65732d313233223b693a35383b733a32373a226368616e67655f64656c69766572795f616464726573732d313233223b693a35393b733a31303a227570646174652d333032223b693a36303b733a323a222d30223b693a36313b733a31303a227570646174652d333030223b693a36323b733a323a222d30223b693a36333b733a31303a227570646174652d323938223b693a36343b733a323a222d30223b693a36353b733a31343a22646561637469766174652d323931223b693a36363b733a31323a2261637469766174652d323931223b693a36373b733a31303a2264656c6574652d323931223b693a36383b733a383a22766965772d323931223b693a36393b733a31303a227570646174652d323931223b693a37303b733a373a226164642d323931223b693a37313b733a323a222d30223b693a37323b733a383a22636f70792d323835223b693a37333b733a31303a2264656c6574652d323835223b693a37343b733a383a22766965772d323835223b693a37353b733a31303a227570646174652d323835223b693a37363b733a373a226164642d323835223b693a37373b733a323a222d30223b693a37383b733a31303a2264656c6574652d323830223b693a37393b733a383a22766965772d323830223b693a38303b733a31303a227570646174652d323830223b693a38313b733a373a226164642d323830223b693a38323b733a323a222d30223b693a38333b733a31303a2264656c6574652d323735223b693a38343b733a383a22766965772d323735223b693a38353b733a31303a227570646174652d323735223b693a38363b733a373a226164642d323735223b693a38373b733a323a222d30223b693a38383b733a31303a2264656c6574652d323730223b693a38393b733a383a22766965772d323730223b693a39303b733a31303a227570646174652d323730223b693a39313b733a373a226164642d323730223b693a39323b733a323a222d30223b693a39333b733a31303a2264656c6574652d323635223b693a39343b733a383a22766965772d323635223b693a39353b733a31303a227570646174652d323635223b693a39363b733a373a226164642d323635223b693a39373b733a323a222d30223b693a39383b733a31303a2264656c6574652d323630223b693a39393b733a383a22766965772d323630223b693a3130303b733a31303a227570646174652d323630223b693a3130313b733a373a226164642d323630223b693a3130323b733a323a222d30223b693a3130333b733a31303a2264656c6574652d323535223b693a3130343b733a383a22766965772d323535223b693a3130353b733a31303a227570646174652d323535223b693a3130363b733a373a226164642d323535223b693a3130373b733a323a222d30223b693a3130383b733a31393a2275706c6f61645f637573746f6d65722d323439223b693a3130393b733a31303a2264656c6574652d323439223b693a3131303b733a383a22766965772d323439223b693a3131313b733a31303a227570646174652d323439223b693a3131323b733a373a226164642d323439223b693a3131333b733a323a222d30223b693a3131343b733a31303a2264656c6574652d323434223b693a3131353b733a383a22766965772d323434223b693a3131363b733a31303a227570646174652d323434223b693a3131373b733a373a226164642d323434223b693a3131383b733a323a222d30223b693a3131393b733a31363a226974656d5f626172636f64652d323334223b693a3132303b733a33323a2275706c6f61645f666f6f645f6d656e755f696e6772656469656e74732d323334223b693a3132313b733a32303a2275706c6f61645f666f6f645f6d656e752d323334223b693a3132323b733a31393a2261737369676e5f6d6f6469666965722d323334223b693a3132333b733a31363a22766965775f64657461696c732d323334223b693a3132343b733a31303a2264656c6574652d323334223b693a3132353b733a383a22766965772d323334223b693a3132363b733a31303a227570646174652d323334223b693a3132373b733a373a226164642d323334223b693a3132383b733a323a222d30223b693a3132393b733a31303a2264656c6574652d323239223b693a3133303b733a383a22766965772d323239223b693a3133313b733a31303a227570646174652d323239223b693a3133323b733a373a226164642d323239223b693a3133333b733a323a222d30223b693a3133343b733a31363a22766965775f64657461696c732d323233223b693a3133353b733a31303a2264656c6574652d323233223b693a3133363b733a383a22766965772d323233223b693a3133373b733a31303a227570646174652d323233223b693a3133383b733a373a226164642d323233223b693a3133393b733a323a222d30223b693a3134303b733a32313a2275706c6f61645f696e6772656469656e742d323137223b693a3134313b733a31303a2264656c6574652d323137223b693a3134323b733a383a22766965772d323137223b693a3134333b733a31303a227570646174652d323137223b693a3134343b733a373a226164642d323137223b693a3134353b733a323a222d30223b693a3134363b733a31303a2264656c6574652d323132223b693a3134373b733a383a22766965772d323132223b693a3134383b733a31303a227570646174652d323132223b693a3134393b733a373a226164642d323132223b693a3135303b733a323a222d30223b693a3135313b733a31303a2264656c6574652d323037223b693a3135323b733a383a22766965772d323037223b693a3135333b733a31303a227570646174652d323037223b693a3135343b733a373a226164642d323037223b693a3135353b733a323a222d30223b693a3135363b733a383a22766965772d323035223b693a3135373b733a323a222d30223b693a3135383b733a383a22766965772d323033223b693a3135393b733a323a222d30223b693a3136303b733a383a22766965772d323031223b693a3136313b733a323a222d30223b693a3136323b733a383a22766965772d313939223b693a3136333b733a323a222d30223b693a3136343b733a383a22766965772d313937223b693a3136353b733a323a222d30223b693a3136363b733a383a22766965772d313935223b693a3136373b733a323a222d30223b693a3136383b733a383a22766965772d313933223b693a3136393b733a323a222d30223b693a3137303b733a383a22766965772d313931223b693a3137313b733a323a222d30223b693a3137323b733a383a22766965772d313839223b693a3137333b733a323a222d30223b693a3137343b733a383a22766965772d313837223b693a3137353b733a323a222d30223b693a3137363b733a383a22766965772d313835223b693a3137373b733a323a222d30223b693a3137383b733a383a22766965772d313833223b693a3137393b733a323a222d30223b693a3138303b733a383a22766965772d313831223b693a3138313b733a323a222d30223b693a3138323b733a383a22766965772d313739223b693a3138333b733a323a222d30223b693a3138343b733a383a22766965772d313735223b693a3138353b733a323a222d30223b693a3138363b733a383a22766965772d313733223b693a3138373b733a323a222d30223b693a3138383b733a383a22766965772d313731223b693a3138393b733a323a222d30223b693a3139303b733a383a22766965772d313639223b693a3139313b733a323a222d30223b693a3139323b733a383a22766965772d313637223b693a3139333b733a323a222d30223b693a3139343b733a383a22766965772d313635223b693a3139353b733a323a222d30223b693a3139363b733a383a22766965772d313633223b693a3139373b733a323a222d30223b693a3139383b733a383a22766965772d313631223b693a3139393b733a323a222d30223b693a3230303b733a383a22766965772d313539223b693a3230313b733a323a222d30223b693a3230323b733a31303a2264656c6574652d313535223b693a3230333b733a383a22766965772d313535223b693a3230343b733a373a226164642d313535223b693a3230353b733a323a222d30223b693a3230363b733a31303a2264656c6574652d313531223b693a3230373b733a383a22766965772d313531223b693a3230383b733a373a226164642d313531223b693a3230393b733a323a222d30223b693a3231303b733a31303a2264656c6574652d313437223b693a3231313b733a383a22766965772d313437223b693a3231323b733a373a226164642d313437223b693a3231333b733a323a222d30223b693a3231343b733a31303a2264656c6574652d313432223b693a3231353b733a383a22766965772d313432223b693a3231363b733a31303a227570646174652d313432223b693a3231373b733a373a226164642d313432223b693a3231383b733a323a222d30223b693a3231393b733a31363a22766965775f64657461696c732d313337223b693a3232303b733a31303a2264656c6574652d313337223b693a3232313b733a383a22766965772d313337223b693a3232323b733a373a226164642d313337223b693a3232333b733a323a222d30223b693a3232343b733a31363a22766965775f64657461696c732d313331223b693a3232353b733a31303a2264656c6574652d313331223b693a3232363b733a383a22766965772d313331223b693a3232373b733a31303a227570646174652d313331223b693a3232383b733a373a226164642d313331223b693a3232393b733a323a222d30223b693a3233303b733a383a22766965772d313239223b693a3233313b733a323a222d30223b693a3233323b733a31303a2264656c6574652d313233223b693a3233333b733a31363a22766965775f696e766f6963652d313233223b693a3233343b733a31303a22726566756e642d313233223b693a3233353b733a383a22766965772d313233223b693a3233363b733a323a222d30223b693a3233373b733a31303a2264656c6574652d313138223b693a3233383b733a383a22766965772d313138223b693a3233393b733a31303a227570646174652d313138223b693a3234303b733a373a226164642d313138223b693a3234313b733a323a222d30223b693a3234323b733a31363a22766965775f64657461696c732d313132223b693a3234333b733a31303a2264656c6574652d313132223b693a3234343b733a383a22766965772d313132223b693a3234353b733a31303a227570646174652d313132223b693a3234363b733a373a226164642d313132223b693a3234373b733a323a222d30223b693a3234383b733a31363a22766965775f64657461696c732d313036223b693a3234393b733a31303a2264656c6574652d313036223b693a3235303b733a383a22766965772d313036223b693a3235313b733a31303a227570646174652d313036223b693a3235323b733a373a226164642d313036223b693a3235333b733a323a222d30223b693a3235343b733a383a22766965772d313034223b693a3235353b733a323a222d30223b693a3235363b733a383a22656e7465722d3938223b693a3235373b733a393a2264656c6574652d3938223b693a3235383b733a373a22766965772d3938223b693a3235393b733a393a227570646174652d3938223b693a3236303b733a363a226164642d3938223b693a3236313b733a323a222d30223b693a3236323b733a393a22706f735f32332d3733223b693a3236333b733a393a22706f735f32322d3733223b693a3236343b733a393a22706f735f32312d3733223b693a3236353b733a393a22706f735f32302d3733223b693a3236363b733a393a22706f735f31392d3733223b693a3236373b733a393a22706f735f31382d3733223b693a3236383b733a393a22706f735f31372d3733223b693a3236393b733a393a22706f735f31362d3733223b693a3237303b733a393a22706f735f31352d3733223b693a3237313b733a393a22706f735f31342d3733223b693a3237323b733a393a22706f735f31332d3733223b693a3237333b733a393a22706f735f31322d3733223b693a3237343b733a393a22706f735f31312d3733223b693a3237353b733a393a22706f735f31302d3733223b693a3237363b733a383a22706f735f392d3733223b693a3237373b733a383a22706f735f382d3733223b693a3237383b733a383a22706f735f372d3733223b693a3237393b733a383a22706f735f362d3733223b693a3238303b733a383a22706f735f352d3733223b693a3238313b733a383a22706f735f342d3733223b693a3238323b733a383a22706f735f332d3733223b693a3238333b733a383a22706f735f322d3733223b693a3238343b733a383a22706f735f312d3733223b693a3238353b733a323a222d30223b693a3238363b733a383a22656e7465722d3637223b693a3238373b733a393a2264656c6574652d3637223b693a3238383b733a373a22766965772d3637223b693a3238393b733a393a227570646174652d3637223b693a3239303b733a363a226164642d3637223b693a3239313b733a323a222d30223b693a3239323b733a393a227570646174652d3634223b693a3239333b733a323a222d30223b693a3239343b733a31323a22756e696e7374616c6c2d3632223b693a3239353b733a323a222d30223b693a3239363b733a393a227570646174652d3630223b693a3239373b733a323a222d30223b693a3239383b733a393a2264656c6574652d3535223b693a3239393b733a373a22766965772d3535223b693a3330303b733a393a227570646174652d3535223b693a3330313b733a363a226164642d3535223b693a3330323b733a323a222d30223b693a3330333b733a31333a227570646174655f7461782d3532223b693a3330343b733a323a222d30223b693a3330353b733a393a227570646174652d3439223b693a3330363b733a323a222d30223b693a3330373b733a393a2264656c6574652d3335223b693a3330383b733a373a22766965772d3335223b693a3330393b733a393a227570646174652d3335223b693a3331303b733a363a226164642d3335223b693a3331313b733a323a222d30223b693a3331323b733a393a227570646174652d3331223b693a3331333b733a373a22766965772d3331223b693a3331343b733a323a222d30223b693a3331353b733a393a2264656c6574652d3236223b693a3331363b733a373a22766965772d3236223b693a3331373b733a393a227570646174652d3236223b693a3331383b733a363a226164642d3236223b693a3331393b733a323a222d30223b693a3332303b733a393a2264656c6574652d3232223b693a3332313b733a373a22766965772d3232223b693a3332323b733a363a226164642d3232223b693a3332333b733a323a222d30223b693a3332343b733a31373a22626c6f636b5f616c6c5f757365722d3135223b693a3332353b733a31353a2273686f775f6f75746c6574732d3135223b693a3332363b733a393a2264656c6574652d3135223b693a3332373b733a373a22766965772d3135223b693a3332383b733a393a227570646174652d3135223b693a3332393b733a363a226164642d3135223b693a3333303b733a323a222d30223b693a3333313b733a393a227570646174652d3132223b693a3333323b733a373a22766965772d3132223b693a3333333b733a323a222d30223b693a3333343b733a383a227570646174652d39223b693a3333353b733a363a22766965772d39223b693a3333363b733a323a222d30223b693a3333373b733a383a227570646174652d36223b693a3333383b733a323a222d30223b693a3333393b733a383a227570646174652d33223b693a3334303b733a363a22766965772d33223b693a3334313b733a323a222d30223b693a3334323b733a363a22766965772d31223b693a3334333b733a323a222d30223b7d757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b64657369676e6174696f6e7c733a31313a2253757065722041646d696e223b66756c6c5f6e616d657c733a31303a2241646d696e2055736572223b73686f72745f6e616d657c733a313a2261223b70686f6e657c733a31323a22393233343238393237333035223b656d61696c5f616464726573737c733a31353a2261646d696e4061646d696e2e636f6d223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b73657373696f6e5f6f75746c6574737c733a313a2232223b6163746976655f6d656e755f746d707c693a313b63757272656e63797c733a333a22504b52223b7a6f6e655f6e616d657c733a31323a22417369612f4b617261636869223b646174655f666f726d61747c733a353a22592f6d2f64223b627573696e6573735f6e616d657c733a33323a22436865657a792042697465204d412d4d412026616d703b616d703b20536f6e73223b776562736974657c733a31303a22666972656170702e6363223b63757272656e63795f706f736974696f6e7c733a31333a224265666f726520416d6f756e74223b707265636973696f6e7c733a313a2232223b64656661756c745f637573746f6d65727c733a313a2231223b6578706f72745f6461696c795f73616c657c733a363a22656e61626c65223b736572766963655f616d6f756e747c733a303a22223b74616b655f617761795f736572766963655f6368617267657c733a303a22223b64656c69766572795f616d6f756e747c733a303a22223b7461785f747970657c733a313a2231223b646563696d616c735f736570617261746f727c733a313a222e223b74686f7573616e64735f736570617261746f727c733a313a222c223b6f70656e5f636173685f6472617765725f7768656e5f7072696e74696e675f696e766f6963657c733a323a224e6f223b7768656e5f636c69636b696e675f6f6e5f6974656d5f696e5f706f737c733a313a2232223b69735f726f756e64696e675f656e61626c657c733a313a2230223b617474656e64616e63655f747970657c733a313a2232223b64656661756c745f6f726465725f747970657c733a313a2231223b69735f6c6f79616c74795f656e61626c657c733a373a2264697361626c65223b7072655f6f725f706f73745f7061796d656e747c733a313a2231223b6d696e696d756d5f706f696e745f746f5f72656465656d7c733a313a2230223b6c6f79616c74795f726174657c733a333a22302e31223b73706c69745f62696c6c7c733a313a2231223b706c6163655f6f726465725f746f6f6c7469707c733a343a2273686f77223b666f6f645f6d656e755f746f6f6c7469707c733a343a2273686f77223b7461626c655f62675f636f6c6f727c733a31303a227461626c655f62675f31223b6b6f745f7072696e745f6f6e6c696e655f73656c665f6f726465727c733a313a2231223b64656661756c745f7061796d656e747c733a313a2231223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b696e766f6963655f6c6f676f7c733a33373a2237353861646564383439306236356465626361613133353137343731316431392e6a706567223b6c616e67756167655f6d616e69666573746f7c733a393a22726576686762726576223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f7469746c657c733a31313a224c6f63616c205461786573223b7461785f726567697374726174696f6e5f6e6f7c733a383a223332313332353837223b7461785f69735f6773747c733a323a224e6f223b6170706c795f6f6e5f64656c69766572795f6368617267657c733a313a2231223b73746174655f636f64657c733a373a2230393331323332223b6163746976655f6c6f67696e5f627574746f6e7c733a313a2231223b6c6f67696e5f747970657c733a313a2231223b5f5f63695f766172737c613a313a7b733a31313a22657863657074696f6e5f32223b733a333a226f6c64223b7d);
INSERT INTO `tbl_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('fe0a38ab8ba432114e2635cf744f682ed3e7d6d2', '127.0.0.1', 1770215835, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737303231353831313b73797374656d5f76657273696f6e5f6e756d6265727c733a333a22372e36223b776c627c693a313b66756e6374696f6e5f6163636573737c613a3334343a7b693a303b733a383a22766965772d333730223b693a313b733a323a222d30223b693a323b733a33333a22616c6c5f73657474696e675f7265736572766174696f6e5f6f726465722d333638223b693a333b733a323a222d30223b693a343b733a32383a22616c6c5f73657474696e675f6f6e6c696e655f6f726465722d333636223b693a353b733a323a222d30223b693a363b733a32353a22616c6c5f73657474696e675f73656c5f6f726465722d333634223b693a373b733a323a222d30223b693a383b733a383a22766965772d333632223b693a393b733a323a222d30223b693a31303b733a31353a22616c6c5f73657474696e672d333538223b693a31313b733a323a222d30223b693a31323b733a31303a2264656c6574652d333533223b693a31333b733a383a22766965772d333533223b693a31343b733a31303a227570646174652d333533223b693a31353b733a373a226164642d333533223b693a31363b733a323a222d30223b693a31373b733a393a22706f735f32352d3733223b693a31383b733a393a2272657365742d333530223b693a31393b733a323a222d30223b693a32303b733a383a22766965772d333436223b693a32313b733a323a222d30223b693a32323b733a31363a22766965775f64657461696c732d333430223b693a32333b733a31303a2264656c6574652d333430223b693a32343b733a383a22766965772d333430223b693a32353b733a31303a227570646174652d333430223b693a32363b733a373a226164642d333430223b693a32373b733a323a222d30223b693a32383b733a31373a22736f7274696e67466f72504f532d323239223b693a32393b733a383a22766965772d333337223b693a33303b733a323a222d30223b693a33313b733a383a22766965772d333332223b693a33323b733a323a222d30223b693a33333b733a31303a227570646174652d333330223b693a33343b733a323a222d30223b693a33353b733a31303a2264656c6574652d333235223b693a33363b733a383a22766965772d333235223b693a33373b733a31303a227570646174652d333235223b693a33383b733a373a226164642d333235223b693a33393b733a323a222d30223b693a34303b733a383a22766965772d333231223b693a34313b733a323a222d30223b693a34323b733a31343a22646561637469766174652d333136223b693a34333b733a31323a2261637469766174652d333136223b693a34343b733a31303a2264656c6574652d333136223b693a34353b733a383a22766965772d333136223b693a34363b733a323a222d30223b693a34373b733a383a22766965772d333134223b693a34383b733a323a222d30223b693a34393b733a383a22766965772d333130223b693a35303b733a31333a22636865636b5f6f75742d333130223b693a35313b733a31323a22636865636b5f696e2d333130223b693a35323b733a323a222d30223b693a35333b733a31313a22736f7274696e672d323630223b693a35343b733a383a22766965772d333037223b693a35353b733a323a222d30223b693a35363b733a31393a2272657365744461696c7953616c65732d313233223b693a35373b733a32303a226578706f72744461696c7953616c65732d313233223b693a35383b733a32373a226368616e67655f64656c69766572795f616464726573732d313233223b693a35393b733a31303a227570646174652d333032223b693a36303b733a323a222d30223b693a36313b733a31303a227570646174652d333030223b693a36323b733a323a222d30223b693a36333b733a31303a227570646174652d323938223b693a36343b733a323a222d30223b693a36353b733a31343a22646561637469766174652d323931223b693a36363b733a31323a2261637469766174652d323931223b693a36373b733a31303a2264656c6574652d323931223b693a36383b733a383a22766965772d323931223b693a36393b733a31303a227570646174652d323931223b693a37303b733a373a226164642d323931223b693a37313b733a323a222d30223b693a37323b733a383a22636f70792d323835223b693a37333b733a31303a2264656c6574652d323835223b693a37343b733a383a22766965772d323835223b693a37353b733a31303a227570646174652d323835223b693a37363b733a373a226164642d323835223b693a37373b733a323a222d30223b693a37383b733a31303a2264656c6574652d323830223b693a37393b733a383a22766965772d323830223b693a38303b733a31303a227570646174652d323830223b693a38313b733a373a226164642d323830223b693a38323b733a323a222d30223b693a38333b733a31303a2264656c6574652d323735223b693a38343b733a383a22766965772d323735223b693a38353b733a31303a227570646174652d323735223b693a38363b733a373a226164642d323735223b693a38373b733a323a222d30223b693a38383b733a31303a2264656c6574652d323730223b693a38393b733a383a22766965772d323730223b693a39303b733a31303a227570646174652d323730223b693a39313b733a373a226164642d323730223b693a39323b733a323a222d30223b693a39333b733a31303a2264656c6574652d323635223b693a39343b733a383a22766965772d323635223b693a39353b733a31303a227570646174652d323635223b693a39363b733a373a226164642d323635223b693a39373b733a323a222d30223b693a39383b733a31303a2264656c6574652d323630223b693a39393b733a383a22766965772d323630223b693a3130303b733a31303a227570646174652d323630223b693a3130313b733a373a226164642d323630223b693a3130323b733a323a222d30223b693a3130333b733a31303a2264656c6574652d323535223b693a3130343b733a383a22766965772d323535223b693a3130353b733a31303a227570646174652d323535223b693a3130363b733a373a226164642d323535223b693a3130373b733a323a222d30223b693a3130383b733a31393a2275706c6f61645f637573746f6d65722d323439223b693a3130393b733a31303a2264656c6574652d323439223b693a3131303b733a383a22766965772d323439223b693a3131313b733a31303a227570646174652d323439223b693a3131323b733a373a226164642d323439223b693a3131333b733a323a222d30223b693a3131343b733a31303a2264656c6574652d323434223b693a3131353b733a383a22766965772d323434223b693a3131363b733a31303a227570646174652d323434223b693a3131373b733a373a226164642d323434223b693a3131383b733a323a222d30223b693a3131393b733a31363a226974656d5f626172636f64652d323334223b693a3132303b733a33323a2275706c6f61645f666f6f645f6d656e755f696e6772656469656e74732d323334223b693a3132313b733a32303a2275706c6f61645f666f6f645f6d656e752d323334223b693a3132323b733a31393a2261737369676e5f6d6f6469666965722d323334223b693a3132333b733a31363a22766965775f64657461696c732d323334223b693a3132343b733a31303a2264656c6574652d323334223b693a3132353b733a383a22766965772d323334223b693a3132363b733a31303a227570646174652d323334223b693a3132373b733a373a226164642d323334223b693a3132383b733a323a222d30223b693a3132393b733a31303a2264656c6574652d323239223b693a3133303b733a383a22766965772d323239223b693a3133313b733a31303a227570646174652d323239223b693a3133323b733a373a226164642d323239223b693a3133333b733a323a222d30223b693a3133343b733a31363a22766965775f64657461696c732d323233223b693a3133353b733a31303a2264656c6574652d323233223b693a3133363b733a383a22766965772d323233223b693a3133373b733a31303a227570646174652d323233223b693a3133383b733a373a226164642d323233223b693a3133393b733a323a222d30223b693a3134303b733a32313a2275706c6f61645f696e6772656469656e742d323137223b693a3134313b733a31303a2264656c6574652d323137223b693a3134323b733a383a22766965772d323137223b693a3134333b733a31303a227570646174652d323137223b693a3134343b733a373a226164642d323137223b693a3134353b733a323a222d30223b693a3134363b733a31303a2264656c6574652d323132223b693a3134373b733a383a22766965772d323132223b693a3134383b733a31303a227570646174652d323132223b693a3134393b733a373a226164642d323132223b693a3135303b733a323a222d30223b693a3135313b733a31303a2264656c6574652d323037223b693a3135323b733a383a22766965772d323037223b693a3135333b733a31303a227570646174652d323037223b693a3135343b733a373a226164642d323037223b693a3135353b733a323a222d30223b693a3135363b733a383a22766965772d323035223b693a3135373b733a323a222d30223b693a3135383b733a383a22766965772d323033223b693a3135393b733a323a222d30223b693a3136303b733a383a22766965772d323031223b693a3136313b733a323a222d30223b693a3136323b733a383a22766965772d313939223b693a3136333b733a323a222d30223b693a3136343b733a383a22766965772d313937223b693a3136353b733a323a222d30223b693a3136363b733a383a22766965772d313935223b693a3136373b733a323a222d30223b693a3136383b733a383a22766965772d313933223b693a3136393b733a323a222d30223b693a3137303b733a383a22766965772d313931223b693a3137313b733a323a222d30223b693a3137323b733a383a22766965772d313839223b693a3137333b733a323a222d30223b693a3137343b733a383a22766965772d313837223b693a3137353b733a323a222d30223b693a3137363b733a383a22766965772d313835223b693a3137373b733a323a222d30223b693a3137383b733a383a22766965772d313833223b693a3137393b733a323a222d30223b693a3138303b733a383a22766965772d313831223b693a3138313b733a323a222d30223b693a3138323b733a383a22766965772d313739223b693a3138333b733a323a222d30223b693a3138343b733a383a22766965772d313735223b693a3138353b733a323a222d30223b693a3138363b733a383a22766965772d313733223b693a3138373b733a323a222d30223b693a3138383b733a383a22766965772d313731223b693a3138393b733a323a222d30223b693a3139303b733a383a22766965772d313639223b693a3139313b733a323a222d30223b693a3139323b733a383a22766965772d313637223b693a3139333b733a323a222d30223b693a3139343b733a383a22766965772d313635223b693a3139353b733a323a222d30223b693a3139363b733a383a22766965772d313633223b693a3139373b733a323a222d30223b693a3139383b733a383a22766965772d313631223b693a3139393b733a323a222d30223b693a3230303b733a383a22766965772d313539223b693a3230313b733a323a222d30223b693a3230323b733a31303a2264656c6574652d313535223b693a3230333b733a383a22766965772d313535223b693a3230343b733a373a226164642d313535223b693a3230353b733a323a222d30223b693a3230363b733a31303a2264656c6574652d313531223b693a3230373b733a383a22766965772d313531223b693a3230383b733a373a226164642d313531223b693a3230393b733a323a222d30223b693a3231303b733a31303a2264656c6574652d313437223b693a3231313b733a383a22766965772d313437223b693a3231323b733a373a226164642d313437223b693a3231333b733a323a222d30223b693a3231343b733a31303a2264656c6574652d313432223b693a3231353b733a383a22766965772d313432223b693a3231363b733a31303a227570646174652d313432223b693a3231373b733a373a226164642d313432223b693a3231383b733a323a222d30223b693a3231393b733a31363a22766965775f64657461696c732d313337223b693a3232303b733a31303a2264656c6574652d313337223b693a3232313b733a383a22766965772d313337223b693a3232323b733a373a226164642d313337223b693a3232333b733a323a222d30223b693a3232343b733a31363a22766965775f64657461696c732d313331223b693a3232353b733a31303a2264656c6574652d313331223b693a3232363b733a383a22766965772d313331223b693a3232373b733a31303a227570646174652d313331223b693a3232383b733a373a226164642d313331223b693a3232393b733a323a222d30223b693a3233303b733a383a22766965772d313239223b693a3233313b733a323a222d30223b693a3233323b733a31303a2264656c6574652d313233223b693a3233333b733a31363a22766965775f696e766f6963652d313233223b693a3233343b733a31303a22726566756e642d313233223b693a3233353b733a383a22766965772d313233223b693a3233363b733a323a222d30223b693a3233373b733a31303a2264656c6574652d313138223b693a3233383b733a383a22766965772d313138223b693a3233393b733a31303a227570646174652d313138223b693a3234303b733a373a226164642d313138223b693a3234313b733a323a222d30223b693a3234323b733a31363a22766965775f64657461696c732d313132223b693a3234333b733a31303a2264656c6574652d313132223b693a3234343b733a383a22766965772d313132223b693a3234353b733a31303a227570646174652d313132223b693a3234363b733a373a226164642d313132223b693a3234373b733a323a222d30223b693a3234383b733a31363a22766965775f64657461696c732d313036223b693a3234393b733a31303a2264656c6574652d313036223b693a3235303b733a383a22766965772d313036223b693a3235313b733a31303a227570646174652d313036223b693a3235323b733a373a226164642d313036223b693a3235333b733a323a222d30223b693a3235343b733a383a22766965772d313034223b693a3235353b733a323a222d30223b693a3235363b733a383a22656e7465722d3938223b693a3235373b733a393a2264656c6574652d3938223b693a3235383b733a373a22766965772d3938223b693a3235393b733a393a227570646174652d3938223b693a3236303b733a363a226164642d3938223b693a3236313b733a323a222d30223b693a3236323b733a393a22706f735f32332d3733223b693a3236333b733a393a22706f735f32322d3733223b693a3236343b733a393a22706f735f32312d3733223b693a3236353b733a393a22706f735f32302d3733223b693a3236363b733a393a22706f735f31392d3733223b693a3236373b733a393a22706f735f31382d3733223b693a3236383b733a393a22706f735f31372d3733223b693a3236393b733a393a22706f735f31362d3733223b693a3237303b733a393a22706f735f31352d3733223b693a3237313b733a393a22706f735f31342d3733223b693a3237323b733a393a22706f735f31332d3733223b693a3237333b733a393a22706f735f31322d3733223b693a3237343b733a393a22706f735f31312d3733223b693a3237353b733a393a22706f735f31302d3733223b693a3237363b733a383a22706f735f392d3733223b693a3237373b733a383a22706f735f382d3733223b693a3237383b733a383a22706f735f372d3733223b693a3237393b733a383a22706f735f362d3733223b693a3238303b733a383a22706f735f352d3733223b693a3238313b733a383a22706f735f342d3733223b693a3238323b733a383a22706f735f332d3733223b693a3238333b733a383a22706f735f322d3733223b693a3238343b733a383a22706f735f312d3733223b693a3238353b733a323a222d30223b693a3238363b733a383a22656e7465722d3637223b693a3238373b733a393a2264656c6574652d3637223b693a3238383b733a373a22766965772d3637223b693a3238393b733a393a227570646174652d3637223b693a3239303b733a363a226164642d3637223b693a3239313b733a323a222d30223b693a3239323b733a393a227570646174652d3634223b693a3239333b733a323a222d30223b693a3239343b733a31323a22756e696e7374616c6c2d3632223b693a3239353b733a323a222d30223b693a3239363b733a393a227570646174652d3630223b693a3239373b733a323a222d30223b693a3239383b733a393a2264656c6574652d3535223b693a3239393b733a373a22766965772d3535223b693a3330303b733a393a227570646174652d3535223b693a3330313b733a363a226164642d3535223b693a3330323b733a323a222d30223b693a3330333b733a31333a227570646174655f7461782d3532223b693a3330343b733a323a222d30223b693a3330353b733a393a227570646174652d3439223b693a3330363b733a323a222d30223b693a3330373b733a393a2264656c6574652d3335223b693a3330383b733a373a22766965772d3335223b693a3330393b733a393a227570646174652d3335223b693a3331303b733a363a226164642d3335223b693a3331313b733a323a222d30223b693a3331323b733a393a227570646174652d3331223b693a3331333b733a373a22766965772d3331223b693a3331343b733a323a222d30223b693a3331353b733a393a2264656c6574652d3236223b693a3331363b733a373a22766965772d3236223b693a3331373b733a393a227570646174652d3236223b693a3331383b733a363a226164642d3236223b693a3331393b733a323a222d30223b693a3332303b733a393a2264656c6574652d3232223b693a3332313b733a373a22766965772d3232223b693a3332323b733a363a226164642d3232223b693a3332333b733a323a222d30223b693a3332343b733a31373a22626c6f636b5f616c6c5f757365722d3135223b693a3332353b733a31353a2273686f775f6f75746c6574732d3135223b693a3332363b733a393a2264656c6574652d3135223b693a3332373b733a373a22766965772d3135223b693a3332383b733a393a227570646174652d3135223b693a3332393b733a363a226164642d3135223b693a3333303b733a323a222d30223b693a3333313b733a393a227570646174652d3132223b693a3333323b733a373a22766965772d3132223b693a3333333b733a323a222d30223b693a3333343b733a383a227570646174652d39223b693a3333353b733a363a22766965772d39223b693a3333363b733a323a222d30223b693a3333373b733a383a227570646174652d36223b693a3333383b733a323a222d30223b693a3333393b733a383a227570646174652d33223b693a3334303b733a363a22766965772d33223b693a3334313b733a323a222d30223b693a3334323b733a363a22766965772d31223b693a3334333b733a323a222d30223b7d757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b64657369676e6174696f6e7c733a31313a2253757065722041646d696e223b66756c6c5f6e616d657c733a31303a2241646d696e2055736572223b73686f72745f6e616d657c733a313a2261223b70686f6e657c733a31323a22393233343238393237333035223b656d61696c5f616464726573737c733a31353a2261646d696e4061646d696e2e636f6d223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b73657373696f6e5f6f75746c6574737c733a313a2232223b6163746976655f6d656e755f746d707c693a313b63757272656e63797c733a333a22504b52223b7a6f6e655f6e616d657c733a31323a22417369612f4b617261636869223b646174655f666f726d61747c733a353a22592f6d2f64223b627573696e6573735f6e616d657c733a33323a22436865657a792042697465204d412d4d412026616d703b616d703b20536f6e73223b776562736974657c733a31303a22666972656170702e6363223b63757272656e63795f706f736974696f6e7c733a31333a224265666f726520416d6f756e74223b707265636973696f6e7c733a313a2232223b64656661756c745f637573746f6d65727c733a313a2231223b6578706f72745f6461696c795f73616c657c733a363a22656e61626c65223b736572766963655f616d6f756e747c733a303a22223b74616b655f617761795f736572766963655f6368617267657c733a303a22223b64656c69766572795f616d6f756e747c733a303a22223b7461785f747970657c733a313a2231223b646563696d616c735f736570617261746f727c733a313a222e223b74686f7573616e64735f736570617261746f727c733a313a222c223b6f70656e5f636173685f6472617765725f7768656e5f7072696e74696e675f696e766f6963657c733a323a224e6f223b7768656e5f636c69636b696e675f6f6e5f6974656d5f696e5f706f737c733a313a2232223b69735f726f756e64696e675f656e61626c657c733a313a2230223b617474656e64616e63655f747970657c733a313a2232223b64656661756c745f6f726465725f747970657c733a313a2231223b69735f6c6f79616c74795f656e61626c657c733a373a2264697361626c65223b7072655f6f725f706f73745f7061796d656e747c733a313a2231223b6d696e696d756d5f706f696e745f746f5f72656465656d7c733a313a2230223b6c6f79616c74795f726174657c733a333a22302e31223b73706c69745f62696c6c7c733a313a2231223b706c6163655f6f726465725f746f6f6c7469707c733a343a2273686f77223b666f6f645f6d656e755f746f6f6c7469707c733a343a2273686f77223b7461626c655f62675f636f6c6f727c733a31303a227461626c655f62675f31223b6b6f745f7072696e745f6f6e6c696e655f73656c665f6f726465727c733a313a2231223b64656661756c745f7061796d656e747c733a313a2231223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b696e766f6963655f6c6f676f7c733a33373a2237353861646564383439306236356465626361613133353137343731316431392e6a706567223b6c616e67756167655f6d616e69666573746f7c733a393a22726576686762726576223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f7469746c657c733a31313a224c6f63616c205461786573223b7461785f726567697374726174696f6e5f6e6f7c733a383a223332313332353837223b7461785f69735f6773747c733a323a224e6f223b6170706c795f6f6e5f64656c69766572795f6368617267657c733a313a2231223b73746174655f636f64657c733a373a2230393331323332223b6163746976655f6c6f67696e5f627574746f6e7c733a313a2231223b6c6f67696e5f747970657c733a313a2231223b5f5f63695f766172737c613a313a7b733a31313a22657863657074696f6e5f32223b733a333a226f6c64223b7d),
('092956cc4b6d99c6b408642281184c8281144776', '127.0.0.1', 1770229911, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737303232393931313b73797374656d5f76657273696f6e5f6e756d6265727c733a333a22372e36223b776c627c693a313b66756e6374696f6e5f6163636573737c613a3334343a7b693a303b733a383a22766965772d333730223b693a313b733a323a222d30223b693a323b733a33333a22616c6c5f73657474696e675f7265736572766174696f6e5f6f726465722d333638223b693a333b733a323a222d30223b693a343b733a32383a22616c6c5f73657474696e675f6f6e6c696e655f6f726465722d333636223b693a353b733a323a222d30223b693a363b733a32353a22616c6c5f73657474696e675f73656c5f6f726465722d333634223b693a373b733a323a222d30223b693a383b733a383a22766965772d333632223b693a393b733a323a222d30223b693a31303b733a31353a22616c6c5f73657474696e672d333538223b693a31313b733a323a222d30223b693a31323b733a31303a2264656c6574652d333533223b693a31333b733a383a22766965772d333533223b693a31343b733a31303a227570646174652d333533223b693a31353b733a373a226164642d333533223b693a31363b733a323a222d30223b693a31373b733a393a22706f735f32352d3733223b693a31383b733a393a2272657365742d333530223b693a31393b733a323a222d30223b693a32303b733a383a22766965772d333436223b693a32313b733a323a222d30223b693a32323b733a31363a22766965775f64657461696c732d333430223b693a32333b733a31303a2264656c6574652d333430223b693a32343b733a383a22766965772d333430223b693a32353b733a31303a227570646174652d333430223b693a32363b733a373a226164642d333430223b693a32373b733a323a222d30223b693a32383b733a31373a22736f7274696e67466f72504f532d323239223b693a32393b733a383a22766965772d333337223b693a33303b733a323a222d30223b693a33313b733a383a22766965772d333332223b693a33323b733a323a222d30223b693a33333b733a31303a227570646174652d333330223b693a33343b733a323a222d30223b693a33353b733a31303a2264656c6574652d333235223b693a33363b733a383a22766965772d333235223b693a33373b733a31303a227570646174652d333235223b693a33383b733a373a226164642d333235223b693a33393b733a323a222d30223b693a34303b733a383a22766965772d333231223b693a34313b733a323a222d30223b693a34323b733a31343a22646561637469766174652d333136223b693a34333b733a31323a2261637469766174652d333136223b693a34343b733a31303a2264656c6574652d333136223b693a34353b733a383a22766965772d333136223b693a34363b733a323a222d30223b693a34373b733a383a22766965772d333134223b693a34383b733a323a222d30223b693a34393b733a383a22766965772d333130223b693a35303b733a31333a22636865636b5f6f75742d333130223b693a35313b733a31323a22636865636b5f696e2d333130223b693a35323b733a323a222d30223b693a35333b733a31313a22736f7274696e672d323630223b693a35343b733a383a22766965772d333037223b693a35353b733a323a222d30223b693a35363b733a31393a2272657365744461696c7953616c65732d313233223b693a35373b733a32303a226578706f72744461696c7953616c65732d313233223b693a35383b733a32373a226368616e67655f64656c69766572795f616464726573732d313233223b693a35393b733a31303a227570646174652d333032223b693a36303b733a323a222d30223b693a36313b733a31303a227570646174652d333030223b693a36323b733a323a222d30223b693a36333b733a31303a227570646174652d323938223b693a36343b733a323a222d30223b693a36353b733a31343a22646561637469766174652d323931223b693a36363b733a31323a2261637469766174652d323931223b693a36373b733a31303a2264656c6574652d323931223b693a36383b733a383a22766965772d323931223b693a36393b733a31303a227570646174652d323931223b693a37303b733a373a226164642d323931223b693a37313b733a323a222d30223b693a37323b733a383a22636f70792d323835223b693a37333b733a31303a2264656c6574652d323835223b693a37343b733a383a22766965772d323835223b693a37353b733a31303a227570646174652d323835223b693a37363b733a373a226164642d323835223b693a37373b733a323a222d30223b693a37383b733a31303a2264656c6574652d323830223b693a37393b733a383a22766965772d323830223b693a38303b733a31303a227570646174652d323830223b693a38313b733a373a226164642d323830223b693a38323b733a323a222d30223b693a38333b733a31303a2264656c6574652d323735223b693a38343b733a383a22766965772d323735223b693a38353b733a31303a227570646174652d323735223b693a38363b733a373a226164642d323735223b693a38373b733a323a222d30223b693a38383b733a31303a2264656c6574652d323730223b693a38393b733a383a22766965772d323730223b693a39303b733a31303a227570646174652d323730223b693a39313b733a373a226164642d323730223b693a39323b733a323a222d30223b693a39333b733a31303a2264656c6574652d323635223b693a39343b733a383a22766965772d323635223b693a39353b733a31303a227570646174652d323635223b693a39363b733a373a226164642d323635223b693a39373b733a323a222d30223b693a39383b733a31303a2264656c6574652d323630223b693a39393b733a383a22766965772d323630223b693a3130303b733a31303a227570646174652d323630223b693a3130313b733a373a226164642d323630223b693a3130323b733a323a222d30223b693a3130333b733a31303a2264656c6574652d323535223b693a3130343b733a383a22766965772d323535223b693a3130353b733a31303a227570646174652d323535223b693a3130363b733a373a226164642d323535223b693a3130373b733a323a222d30223b693a3130383b733a31393a2275706c6f61645f637573746f6d65722d323439223b693a3130393b733a31303a2264656c6574652d323439223b693a3131303b733a383a22766965772d323439223b693a3131313b733a31303a227570646174652d323439223b693a3131323b733a373a226164642d323439223b693a3131333b733a323a222d30223b693a3131343b733a31303a2264656c6574652d323434223b693a3131353b733a383a22766965772d323434223b693a3131363b733a31303a227570646174652d323434223b693a3131373b733a373a226164642d323434223b693a3131383b733a323a222d30223b693a3131393b733a31363a226974656d5f626172636f64652d323334223b693a3132303b733a33323a2275706c6f61645f666f6f645f6d656e755f696e6772656469656e74732d323334223b693a3132313b733a32303a2275706c6f61645f666f6f645f6d656e752d323334223b693a3132323b733a31393a2261737369676e5f6d6f6469666965722d323334223b693a3132333b733a31363a22766965775f64657461696c732d323334223b693a3132343b733a31303a2264656c6574652d323334223b693a3132353b733a383a22766965772d323334223b693a3132363b733a31303a227570646174652d323334223b693a3132373b733a373a226164642d323334223b693a3132383b733a323a222d30223b693a3132393b733a31303a2264656c6574652d323239223b693a3133303b733a383a22766965772d323239223b693a3133313b733a31303a227570646174652d323239223b693a3133323b733a373a226164642d323239223b693a3133333b733a323a222d30223b693a3133343b733a31363a22766965775f64657461696c732d323233223b693a3133353b733a31303a2264656c6574652d323233223b693a3133363b733a383a22766965772d323233223b693a3133373b733a31303a227570646174652d323233223b693a3133383b733a373a226164642d323233223b693a3133393b733a323a222d30223b693a3134303b733a32313a2275706c6f61645f696e6772656469656e742d323137223b693a3134313b733a31303a2264656c6574652d323137223b693a3134323b733a383a22766965772d323137223b693a3134333b733a31303a227570646174652d323137223b693a3134343b733a373a226164642d323137223b693a3134353b733a323a222d30223b693a3134363b733a31303a2264656c6574652d323132223b693a3134373b733a383a22766965772d323132223b693a3134383b733a31303a227570646174652d323132223b693a3134393b733a373a226164642d323132223b693a3135303b733a323a222d30223b693a3135313b733a31303a2264656c6574652d323037223b693a3135323b733a383a22766965772d323037223b693a3135333b733a31303a227570646174652d323037223b693a3135343b733a373a226164642d323037223b693a3135353b733a323a222d30223b693a3135363b733a383a22766965772d323035223b693a3135373b733a323a222d30223b693a3135383b733a383a22766965772d323033223b693a3135393b733a323a222d30223b693a3136303b733a383a22766965772d323031223b693a3136313b733a323a222d30223b693a3136323b733a383a22766965772d313939223b693a3136333b733a323a222d30223b693a3136343b733a383a22766965772d313937223b693a3136353b733a323a222d30223b693a3136363b733a383a22766965772d313935223b693a3136373b733a323a222d30223b693a3136383b733a383a22766965772d313933223b693a3136393b733a323a222d30223b693a3137303b733a383a22766965772d313931223b693a3137313b733a323a222d30223b693a3137323b733a383a22766965772d313839223b693a3137333b733a323a222d30223b693a3137343b733a383a22766965772d313837223b693a3137353b733a323a222d30223b693a3137363b733a383a22766965772d313835223b693a3137373b733a323a222d30223b693a3137383b733a383a22766965772d313833223b693a3137393b733a323a222d30223b693a3138303b733a383a22766965772d313831223b693a3138313b733a323a222d30223b693a3138323b733a383a22766965772d313739223b693a3138333b733a323a222d30223b693a3138343b733a383a22766965772d313735223b693a3138353b733a323a222d30223b693a3138363b733a383a22766965772d313733223b693a3138373b733a323a222d30223b693a3138383b733a383a22766965772d313731223b693a3138393b733a323a222d30223b693a3139303b733a383a22766965772d313639223b693a3139313b733a323a222d30223b693a3139323b733a383a22766965772d313637223b693a3139333b733a323a222d30223b693a3139343b733a383a22766965772d313635223b693a3139353b733a323a222d30223b693a3139363b733a383a22766965772d313633223b693a3139373b733a323a222d30223b693a3139383b733a383a22766965772d313631223b693a3139393b733a323a222d30223b693a3230303b733a383a22766965772d313539223b693a3230313b733a323a222d30223b693a3230323b733a31303a2264656c6574652d313535223b693a3230333b733a383a22766965772d313535223b693a3230343b733a373a226164642d313535223b693a3230353b733a323a222d30223b693a3230363b733a31303a2264656c6574652d313531223b693a3230373b733a383a22766965772d313531223b693a3230383b733a373a226164642d313531223b693a3230393b733a323a222d30223b693a3231303b733a31303a2264656c6574652d313437223b693a3231313b733a383a22766965772d313437223b693a3231323b733a373a226164642d313437223b693a3231333b733a323a222d30223b693a3231343b733a31303a2264656c6574652d313432223b693a3231353b733a383a22766965772d313432223b693a3231363b733a31303a227570646174652d313432223b693a3231373b733a373a226164642d313432223b693a3231383b733a323a222d30223b693a3231393b733a31363a22766965775f64657461696c732d313337223b693a3232303b733a31303a2264656c6574652d313337223b693a3232313b733a383a22766965772d313337223b693a3232323b733a373a226164642d313337223b693a3232333b733a323a222d30223b693a3232343b733a31363a22766965775f64657461696c732d313331223b693a3232353b733a31303a2264656c6574652d313331223b693a3232363b733a383a22766965772d313331223b693a3232373b733a31303a227570646174652d313331223b693a3232383b733a373a226164642d313331223b693a3232393b733a323a222d30223b693a3233303b733a383a22766965772d313239223b693a3233313b733a323a222d30223b693a3233323b733a31303a2264656c6574652d313233223b693a3233333b733a31363a22766965775f696e766f6963652d313233223b693a3233343b733a31303a22726566756e642d313233223b693a3233353b733a383a22766965772d313233223b693a3233363b733a323a222d30223b693a3233373b733a31303a2264656c6574652d313138223b693a3233383b733a383a22766965772d313138223b693a3233393b733a31303a227570646174652d313138223b693a3234303b733a373a226164642d313138223b693a3234313b733a323a222d30223b693a3234323b733a31363a22766965775f64657461696c732d313132223b693a3234333b733a31303a2264656c6574652d313132223b693a3234343b733a383a22766965772d313132223b693a3234353b733a31303a227570646174652d313132223b693a3234363b733a373a226164642d313132223b693a3234373b733a323a222d30223b693a3234383b733a31363a22766965775f64657461696c732d313036223b693a3234393b733a31303a2264656c6574652d313036223b693a3235303b733a383a22766965772d313036223b693a3235313b733a31303a227570646174652d313036223b693a3235323b733a373a226164642d313036223b693a3235333b733a323a222d30223b693a3235343b733a383a22766965772d313034223b693a3235353b733a323a222d30223b693a3235363b733a383a22656e7465722d3938223b693a3235373b733a393a2264656c6574652d3938223b693a3235383b733a373a22766965772d3938223b693a3235393b733a393a227570646174652d3938223b693a3236303b733a363a226164642d3938223b693a3236313b733a323a222d30223b693a3236323b733a393a22706f735f32332d3733223b693a3236333b733a393a22706f735f32322d3733223b693a3236343b733a393a22706f735f32312d3733223b693a3236353b733a393a22706f735f32302d3733223b693a3236363b733a393a22706f735f31392d3733223b693a3236373b733a393a22706f735f31382d3733223b693a3236383b733a393a22706f735f31372d3733223b693a3236393b733a393a22706f735f31362d3733223b693a3237303b733a393a22706f735f31352d3733223b693a3237313b733a393a22706f735f31342d3733223b693a3237323b733a393a22706f735f31332d3733223b693a3237333b733a393a22706f735f31322d3733223b693a3237343b733a393a22706f735f31312d3733223b693a3237353b733a393a22706f735f31302d3733223b693a3237363b733a383a22706f735f392d3733223b693a3237373b733a383a22706f735f382d3733223b693a3237383b733a383a22706f735f372d3733223b693a3237393b733a383a22706f735f362d3733223b693a3238303b733a383a22706f735f352d3733223b693a3238313b733a383a22706f735f342d3733223b693a3238323b733a383a22706f735f332d3733223b693a3238333b733a383a22706f735f322d3733223b693a3238343b733a383a22706f735f312d3733223b693a3238353b733a323a222d30223b693a3238363b733a383a22656e7465722d3637223b693a3238373b733a393a2264656c6574652d3637223b693a3238383b733a373a22766965772d3637223b693a3238393b733a393a227570646174652d3637223b693a3239303b733a363a226164642d3637223b693a3239313b733a323a222d30223b693a3239323b733a393a227570646174652d3634223b693a3239333b733a323a222d30223b693a3239343b733a31323a22756e696e7374616c6c2d3632223b693a3239353b733a323a222d30223b693a3239363b733a393a227570646174652d3630223b693a3239373b733a323a222d30223b693a3239383b733a393a2264656c6574652d3535223b693a3239393b733a373a22766965772d3535223b693a3330303b733a393a227570646174652d3535223b693a3330313b733a363a226164642d3535223b693a3330323b733a323a222d30223b693a3330333b733a31333a227570646174655f7461782d3532223b693a3330343b733a323a222d30223b693a3330353b733a393a227570646174652d3439223b693a3330363b733a323a222d30223b693a3330373b733a393a2264656c6574652d3335223b693a3330383b733a373a22766965772d3335223b693a3330393b733a393a227570646174652d3335223b693a3331303b733a363a226164642d3335223b693a3331313b733a323a222d30223b693a3331323b733a393a227570646174652d3331223b693a3331333b733a373a22766965772d3331223b693a3331343b733a323a222d30223b693a3331353b733a393a2264656c6574652d3236223b693a3331363b733a373a22766965772d3236223b693a3331373b733a393a227570646174652d3236223b693a3331383b733a363a226164642d3236223b693a3331393b733a323a222d30223b693a3332303b733a393a2264656c6574652d3232223b693a3332313b733a373a22766965772d3232223b693a3332323b733a363a226164642d3232223b693a3332333b733a323a222d30223b693a3332343b733a31373a22626c6f636b5f616c6c5f757365722d3135223b693a3332353b733a31353a2273686f775f6f75746c6574732d3135223b693a3332363b733a393a2264656c6574652d3135223b693a3332373b733a373a22766965772d3135223b693a3332383b733a393a227570646174652d3135223b693a3332393b733a363a226164642d3135223b693a3333303b733a323a222d30223b693a3333313b733a393a227570646174652d3132223b693a3333323b733a373a22766965772d3132223b693a3333333b733a323a222d30223b693a3333343b733a383a227570646174652d39223b693a3333353b733a363a22766965772d39223b693a3333363b733a323a222d30223b693a3333373b733a383a227570646174652d36223b693a3333383b733a323a222d30223b693a3333393b733a383a227570646174652d33223b693a3334303b733a363a22766965772d33223b693a3334313b733a323a222d30223b693a3334323b733a363a22766965772d31223b693a3334333b733a323a222d30223b7d757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b64657369676e6174696f6e7c733a31313a2253757065722041646d696e223b66756c6c5f6e616d657c733a31303a2241646d696e2055736572223b73686f72745f6e616d657c733a313a2261223b70686f6e657c733a32363a22303331332d343336373431372020303334382d35353637343137223b656d61696c5f616464726573737c733a31353a2261646d696e4061646d696e2e636f6d223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b73657373696f6e5f6f75746c6574737c733a313a2232223b6163746976655f6d656e755f746d707c733a303a22223b63757272656e63797c733a333a22504b52223b7a6f6e655f6e616d657c733a31323a22417369612f4b617261636869223b646174655f666f726d61747c733a353a22592f6d2f64223b627573696e6573735f6e616d657c733a33323a22436865657a792042697465204d412d4d412026616d703b616d703b20536f6e73223b776562736974657c733a31303a22666972656170702e6363223b63757272656e63795f706f736974696f6e7c733a31333a224265666f726520416d6f756e74223b707265636973696f6e7c733a313a2232223b64656661756c745f637573746f6d65727c733a313a2231223b6578706f72745f6461696c795f73616c657c733a363a22656e61626c65223b736572766963655f616d6f756e747c733a303a22223b74616b655f617761795f736572766963655f6368617267657c733a303a22223b64656c69766572795f616d6f756e747c733a303a22223b7461785f747970657c733a313a2231223b646563696d616c735f736570617261746f727c733a313a222e223b74686f7573616e64735f736570617261746f727c733a313a222c223b6f70656e5f636173685f6472617765725f7768656e5f7072696e74696e675f696e766f6963657c733a323a224e6f223b7768656e5f636c69636b696e675f6f6e5f6974656d5f696e5f706f737c733a313a2232223b69735f726f756e64696e675f656e61626c657c733a313a2230223b617474656e64616e63655f747970657c733a313a2232223b64656661756c745f6f726465725f747970657c733a313a2231223b69735f6c6f79616c74795f656e61626c657c733a373a2264697361626c65223b7072655f6f725f706f73745f7061796d656e747c733a313a2231223b6d696e696d756d5f706f696e745f746f5f72656465656d7c733a313a2230223b6c6f79616c74795f726174657c733a333a22302e31223b73706c69745f62696c6c7c733a313a2231223b706c6163655f6f726465725f746f6f6c7469707c733a343a2273686f77223b666f6f645f6d656e755f746f6f6c7469707c733a343a2273686f77223b7461626c655f62675f636f6c6f727c733a31303a227461626c655f62675f31223b6b6f745f7072696e745f6f6e6c696e655f73656c665f6f726465727c733a313a2231223b64656661756c745f7061796d656e747c733a313a2231223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b696e766f6963655f6c6f676f7c733a33373a2237353861646564383439306236356465626361613133353137343731316431392e6a706567223b6c616e67756167655f6d616e69666573746f7c733a393a22726576686762726576223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f7469746c657c733a31313a224c6f63616c205461786573223b7461785f726567697374726174696f6e5f6e6f7c733a383a223332313332353837223b7461785f69735f6773747c733a323a224e6f223b6170706c795f6f6e5f64656c69766572795f6368617267657c733a313a2231223b73746174655f636f64657c733a373a2230393331323332223b6163746976655f6c6f67696e5f627574746f6e7c733a313a2231223b6c6f67696e5f747970657c733a313a2231223b5f5f63695f766172737c613a323a7b733a31313a22657863657074696f6e5f32223b733a333a226f6c64223b733a393a22657863657074696f6e223b733a333a226f6c64223b7d6f75746c65745f69647c733a313a2231223b6f75746c65745f6e616d657c733a31313a224368657a7a792042697465223b616464726573737c733a35323a22436865657a792042697465204d412d4d412026616d703b20536f6e732020506c617a6120536861682044657261692c2053776174223b656d61696c7c733a303a22223b6f6e6c696e655f6f726465725f6d6f64756c657c733a313a2232223b64656661756c745f7761697465727c733a313a2233223b657863657074696f6e7c733a34303a22496e666f726d6174696f6e20686173206265656e206164646564207375636365737366756c6c7921223b);
INSERT INTO `tbl_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('bd638cd0b4069d0f1989c7765e732be33c7e388d', '127.0.0.1', 1770230247, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737303233303234373b73797374656d5f76657273696f6e5f6e756d6265727c733a333a22372e36223b776c627c693a313b66756e6374696f6e5f6163636573737c613a3334343a7b693a303b733a383a22766965772d333730223b693a313b733a323a222d30223b693a323b733a33333a22616c6c5f73657474696e675f7265736572766174696f6e5f6f726465722d333638223b693a333b733a323a222d30223b693a343b733a32383a22616c6c5f73657474696e675f6f6e6c696e655f6f726465722d333636223b693a353b733a323a222d30223b693a363b733a32353a22616c6c5f73657474696e675f73656c5f6f726465722d333634223b693a373b733a323a222d30223b693a383b733a383a22766965772d333632223b693a393b733a323a222d30223b693a31303b733a31353a22616c6c5f73657474696e672d333538223b693a31313b733a323a222d30223b693a31323b733a31303a2264656c6574652d333533223b693a31333b733a383a22766965772d333533223b693a31343b733a31303a227570646174652d333533223b693a31353b733a373a226164642d333533223b693a31363b733a323a222d30223b693a31373b733a393a22706f735f32352d3733223b693a31383b733a393a2272657365742d333530223b693a31393b733a323a222d30223b693a32303b733a383a22766965772d333436223b693a32313b733a323a222d30223b693a32323b733a31363a22766965775f64657461696c732d333430223b693a32333b733a31303a2264656c6574652d333430223b693a32343b733a383a22766965772d333430223b693a32353b733a31303a227570646174652d333430223b693a32363b733a373a226164642d333430223b693a32373b733a323a222d30223b693a32383b733a31373a22736f7274696e67466f72504f532d323239223b693a32393b733a383a22766965772d333337223b693a33303b733a323a222d30223b693a33313b733a383a22766965772d333332223b693a33323b733a323a222d30223b693a33333b733a31303a227570646174652d333330223b693a33343b733a323a222d30223b693a33353b733a31303a2264656c6574652d333235223b693a33363b733a383a22766965772d333235223b693a33373b733a31303a227570646174652d333235223b693a33383b733a373a226164642d333235223b693a33393b733a323a222d30223b693a34303b733a383a22766965772d333231223b693a34313b733a323a222d30223b693a34323b733a31343a22646561637469766174652d333136223b693a34333b733a31323a2261637469766174652d333136223b693a34343b733a31303a2264656c6574652d333136223b693a34353b733a383a22766965772d333136223b693a34363b733a323a222d30223b693a34373b733a383a22766965772d333134223b693a34383b733a323a222d30223b693a34393b733a383a22766965772d333130223b693a35303b733a31333a22636865636b5f6f75742d333130223b693a35313b733a31323a22636865636b5f696e2d333130223b693a35323b733a323a222d30223b693a35333b733a31313a22736f7274696e672d323630223b693a35343b733a383a22766965772d333037223b693a35353b733a323a222d30223b693a35363b733a31393a2272657365744461696c7953616c65732d313233223b693a35373b733a32303a226578706f72744461696c7953616c65732d313233223b693a35383b733a32373a226368616e67655f64656c69766572795f616464726573732d313233223b693a35393b733a31303a227570646174652d333032223b693a36303b733a323a222d30223b693a36313b733a31303a227570646174652d333030223b693a36323b733a323a222d30223b693a36333b733a31303a227570646174652d323938223b693a36343b733a323a222d30223b693a36353b733a31343a22646561637469766174652d323931223b693a36363b733a31323a2261637469766174652d323931223b693a36373b733a31303a2264656c6574652d323931223b693a36383b733a383a22766965772d323931223b693a36393b733a31303a227570646174652d323931223b693a37303b733a373a226164642d323931223b693a37313b733a323a222d30223b693a37323b733a383a22636f70792d323835223b693a37333b733a31303a2264656c6574652d323835223b693a37343b733a383a22766965772d323835223b693a37353b733a31303a227570646174652d323835223b693a37363b733a373a226164642d323835223b693a37373b733a323a222d30223b693a37383b733a31303a2264656c6574652d323830223b693a37393b733a383a22766965772d323830223b693a38303b733a31303a227570646174652d323830223b693a38313b733a373a226164642d323830223b693a38323b733a323a222d30223b693a38333b733a31303a2264656c6574652d323735223b693a38343b733a383a22766965772d323735223b693a38353b733a31303a227570646174652d323735223b693a38363b733a373a226164642d323735223b693a38373b733a323a222d30223b693a38383b733a31303a2264656c6574652d323730223b693a38393b733a383a22766965772d323730223b693a39303b733a31303a227570646174652d323730223b693a39313b733a373a226164642d323730223b693a39323b733a323a222d30223b693a39333b733a31303a2264656c6574652d323635223b693a39343b733a383a22766965772d323635223b693a39353b733a31303a227570646174652d323635223b693a39363b733a373a226164642d323635223b693a39373b733a323a222d30223b693a39383b733a31303a2264656c6574652d323630223b693a39393b733a383a22766965772d323630223b693a3130303b733a31303a227570646174652d323630223b693a3130313b733a373a226164642d323630223b693a3130323b733a323a222d30223b693a3130333b733a31303a2264656c6574652d323535223b693a3130343b733a383a22766965772d323535223b693a3130353b733a31303a227570646174652d323535223b693a3130363b733a373a226164642d323535223b693a3130373b733a323a222d30223b693a3130383b733a31393a2275706c6f61645f637573746f6d65722d323439223b693a3130393b733a31303a2264656c6574652d323439223b693a3131303b733a383a22766965772d323439223b693a3131313b733a31303a227570646174652d323439223b693a3131323b733a373a226164642d323439223b693a3131333b733a323a222d30223b693a3131343b733a31303a2264656c6574652d323434223b693a3131353b733a383a22766965772d323434223b693a3131363b733a31303a227570646174652d323434223b693a3131373b733a373a226164642d323434223b693a3131383b733a323a222d30223b693a3131393b733a31363a226974656d5f626172636f64652d323334223b693a3132303b733a33323a2275706c6f61645f666f6f645f6d656e755f696e6772656469656e74732d323334223b693a3132313b733a32303a2275706c6f61645f666f6f645f6d656e752d323334223b693a3132323b733a31393a2261737369676e5f6d6f6469666965722d323334223b693a3132333b733a31363a22766965775f64657461696c732d323334223b693a3132343b733a31303a2264656c6574652d323334223b693a3132353b733a383a22766965772d323334223b693a3132363b733a31303a227570646174652d323334223b693a3132373b733a373a226164642d323334223b693a3132383b733a323a222d30223b693a3132393b733a31303a2264656c6574652d323239223b693a3133303b733a383a22766965772d323239223b693a3133313b733a31303a227570646174652d323239223b693a3133323b733a373a226164642d323239223b693a3133333b733a323a222d30223b693a3133343b733a31363a22766965775f64657461696c732d323233223b693a3133353b733a31303a2264656c6574652d323233223b693a3133363b733a383a22766965772d323233223b693a3133373b733a31303a227570646174652d323233223b693a3133383b733a373a226164642d323233223b693a3133393b733a323a222d30223b693a3134303b733a32313a2275706c6f61645f696e6772656469656e742d323137223b693a3134313b733a31303a2264656c6574652d323137223b693a3134323b733a383a22766965772d323137223b693a3134333b733a31303a227570646174652d323137223b693a3134343b733a373a226164642d323137223b693a3134353b733a323a222d30223b693a3134363b733a31303a2264656c6574652d323132223b693a3134373b733a383a22766965772d323132223b693a3134383b733a31303a227570646174652d323132223b693a3134393b733a373a226164642d323132223b693a3135303b733a323a222d30223b693a3135313b733a31303a2264656c6574652d323037223b693a3135323b733a383a22766965772d323037223b693a3135333b733a31303a227570646174652d323037223b693a3135343b733a373a226164642d323037223b693a3135353b733a323a222d30223b693a3135363b733a383a22766965772d323035223b693a3135373b733a323a222d30223b693a3135383b733a383a22766965772d323033223b693a3135393b733a323a222d30223b693a3136303b733a383a22766965772d323031223b693a3136313b733a323a222d30223b693a3136323b733a383a22766965772d313939223b693a3136333b733a323a222d30223b693a3136343b733a383a22766965772d313937223b693a3136353b733a323a222d30223b693a3136363b733a383a22766965772d313935223b693a3136373b733a323a222d30223b693a3136383b733a383a22766965772d313933223b693a3136393b733a323a222d30223b693a3137303b733a383a22766965772d313931223b693a3137313b733a323a222d30223b693a3137323b733a383a22766965772d313839223b693a3137333b733a323a222d30223b693a3137343b733a383a22766965772d313837223b693a3137353b733a323a222d30223b693a3137363b733a383a22766965772d313835223b693a3137373b733a323a222d30223b693a3137383b733a383a22766965772d313833223b693a3137393b733a323a222d30223b693a3138303b733a383a22766965772d313831223b693a3138313b733a323a222d30223b693a3138323b733a383a22766965772d313739223b693a3138333b733a323a222d30223b693a3138343b733a383a22766965772d313735223b693a3138353b733a323a222d30223b693a3138363b733a383a22766965772d313733223b693a3138373b733a323a222d30223b693a3138383b733a383a22766965772d313731223b693a3138393b733a323a222d30223b693a3139303b733a383a22766965772d313639223b693a3139313b733a323a222d30223b693a3139323b733a383a22766965772d313637223b693a3139333b733a323a222d30223b693a3139343b733a383a22766965772d313635223b693a3139353b733a323a222d30223b693a3139363b733a383a22766965772d313633223b693a3139373b733a323a222d30223b693a3139383b733a383a22766965772d313631223b693a3139393b733a323a222d30223b693a3230303b733a383a22766965772d313539223b693a3230313b733a323a222d30223b693a3230323b733a31303a2264656c6574652d313535223b693a3230333b733a383a22766965772d313535223b693a3230343b733a373a226164642d313535223b693a3230353b733a323a222d30223b693a3230363b733a31303a2264656c6574652d313531223b693a3230373b733a383a22766965772d313531223b693a3230383b733a373a226164642d313531223b693a3230393b733a323a222d30223b693a3231303b733a31303a2264656c6574652d313437223b693a3231313b733a383a22766965772d313437223b693a3231323b733a373a226164642d313437223b693a3231333b733a323a222d30223b693a3231343b733a31303a2264656c6574652d313432223b693a3231353b733a383a22766965772d313432223b693a3231363b733a31303a227570646174652d313432223b693a3231373b733a373a226164642d313432223b693a3231383b733a323a222d30223b693a3231393b733a31363a22766965775f64657461696c732d313337223b693a3232303b733a31303a2264656c6574652d313337223b693a3232313b733a383a22766965772d313337223b693a3232323b733a373a226164642d313337223b693a3232333b733a323a222d30223b693a3232343b733a31363a22766965775f64657461696c732d313331223b693a3232353b733a31303a2264656c6574652d313331223b693a3232363b733a383a22766965772d313331223b693a3232373b733a31303a227570646174652d313331223b693a3232383b733a373a226164642d313331223b693a3232393b733a323a222d30223b693a3233303b733a383a22766965772d313239223b693a3233313b733a323a222d30223b693a3233323b733a31303a2264656c6574652d313233223b693a3233333b733a31363a22766965775f696e766f6963652d313233223b693a3233343b733a31303a22726566756e642d313233223b693a3233353b733a383a22766965772d313233223b693a3233363b733a323a222d30223b693a3233373b733a31303a2264656c6574652d313138223b693a3233383b733a383a22766965772d313138223b693a3233393b733a31303a227570646174652d313138223b693a3234303b733a373a226164642d313138223b693a3234313b733a323a222d30223b693a3234323b733a31363a22766965775f64657461696c732d313132223b693a3234333b733a31303a2264656c6574652d313132223b693a3234343b733a383a22766965772d313132223b693a3234353b733a31303a227570646174652d313132223b693a3234363b733a373a226164642d313132223b693a3234373b733a323a222d30223b693a3234383b733a31363a22766965775f64657461696c732d313036223b693a3234393b733a31303a2264656c6574652d313036223b693a3235303b733a383a22766965772d313036223b693a3235313b733a31303a227570646174652d313036223b693a3235323b733a373a226164642d313036223b693a3235333b733a323a222d30223b693a3235343b733a383a22766965772d313034223b693a3235353b733a323a222d30223b693a3235363b733a383a22656e7465722d3938223b693a3235373b733a393a2264656c6574652d3938223b693a3235383b733a373a22766965772d3938223b693a3235393b733a393a227570646174652d3938223b693a3236303b733a363a226164642d3938223b693a3236313b733a323a222d30223b693a3236323b733a393a22706f735f32332d3733223b693a3236333b733a393a22706f735f32322d3733223b693a3236343b733a393a22706f735f32312d3733223b693a3236353b733a393a22706f735f32302d3733223b693a3236363b733a393a22706f735f31392d3733223b693a3236373b733a393a22706f735f31382d3733223b693a3236383b733a393a22706f735f31372d3733223b693a3236393b733a393a22706f735f31362d3733223b693a3237303b733a393a22706f735f31352d3733223b693a3237313b733a393a22706f735f31342d3733223b693a3237323b733a393a22706f735f31332d3733223b693a3237333b733a393a22706f735f31322d3733223b693a3237343b733a393a22706f735f31312d3733223b693a3237353b733a393a22706f735f31302d3733223b693a3237363b733a383a22706f735f392d3733223b693a3237373b733a383a22706f735f382d3733223b693a3237383b733a383a22706f735f372d3733223b693a3237393b733a383a22706f735f362d3733223b693a3238303b733a383a22706f735f352d3733223b693a3238313b733a383a22706f735f342d3733223b693a3238323b733a383a22706f735f332d3733223b693a3238333b733a383a22706f735f322d3733223b693a3238343b733a383a22706f735f312d3733223b693a3238353b733a323a222d30223b693a3238363b733a383a22656e7465722d3637223b693a3238373b733a393a2264656c6574652d3637223b693a3238383b733a373a22766965772d3637223b693a3238393b733a393a227570646174652d3637223b693a3239303b733a363a226164642d3637223b693a3239313b733a323a222d30223b693a3239323b733a393a227570646174652d3634223b693a3239333b733a323a222d30223b693a3239343b733a31323a22756e696e7374616c6c2d3632223b693a3239353b733a323a222d30223b693a3239363b733a393a227570646174652d3630223b693a3239373b733a323a222d30223b693a3239383b733a393a2264656c6574652d3535223b693a3239393b733a373a22766965772d3535223b693a3330303b733a393a227570646174652d3535223b693a3330313b733a363a226164642d3535223b693a3330323b733a323a222d30223b693a3330333b733a31333a227570646174655f7461782d3532223b693a3330343b733a323a222d30223b693a3330353b733a393a227570646174652d3439223b693a3330363b733a323a222d30223b693a3330373b733a393a2264656c6574652d3335223b693a3330383b733a373a22766965772d3335223b693a3330393b733a393a227570646174652d3335223b693a3331303b733a363a226164642d3335223b693a3331313b733a323a222d30223b693a3331323b733a393a227570646174652d3331223b693a3331333b733a373a22766965772d3331223b693a3331343b733a323a222d30223b693a3331353b733a393a2264656c6574652d3236223b693a3331363b733a373a22766965772d3236223b693a3331373b733a393a227570646174652d3236223b693a3331383b733a363a226164642d3236223b693a3331393b733a323a222d30223b693a3332303b733a393a2264656c6574652d3232223b693a3332313b733a373a22766965772d3232223b693a3332323b733a363a226164642d3232223b693a3332333b733a323a222d30223b693a3332343b733a31373a22626c6f636b5f616c6c5f757365722d3135223b693a3332353b733a31353a2273686f775f6f75746c6574732d3135223b693a3332363b733a393a2264656c6574652d3135223b693a3332373b733a373a22766965772d3135223b693a3332383b733a393a227570646174652d3135223b693a3332393b733a363a226164642d3135223b693a3333303b733a323a222d30223b693a3333313b733a393a227570646174652d3132223b693a3333323b733a373a22766965772d3132223b693a3333333b733a323a222d30223b693a3333343b733a383a227570646174652d39223b693a3333353b733a363a22766965772d39223b693a3333363b733a323a222d30223b693a3333373b733a383a227570646174652d36223b693a3333383b733a323a222d30223b693a3333393b733a383a227570646174652d33223b693a3334303b733a363a22766965772d33223b693a3334313b733a323a222d30223b693a3334323b733a363a22766965772d31223b693a3334333b733a323a222d30223b7d757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b64657369676e6174696f6e7c733a31313a2253757065722041646d696e223b66756c6c5f6e616d657c733a31303a2241646d696e2055736572223b73686f72745f6e616d657c733a313a2261223b70686f6e657c733a32363a22303331332d343336373431372020303334382d35353637343137223b656d61696c5f616464726573737c733a31353a2261646d696e4061646d696e2e636f6d223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b73657373696f6e5f6f75746c6574737c733a313a2232223b6163746976655f6d656e755f746d707c733a303a22223b63757272656e63797c733a333a22504b52223b7a6f6e655f6e616d657c733a31323a22417369612f4b617261636869223b646174655f666f726d61747c733a353a22592f6d2f64223b627573696e6573735f6e616d657c733a33323a22436865657a792042697465204d412d4d412026616d703b616d703b20536f6e73223b776562736974657c733a31303a22666972656170702e6363223b63757272656e63795f706f736974696f6e7c733a31333a224265666f726520416d6f756e74223b707265636973696f6e7c733a313a2232223b64656661756c745f637573746f6d65727c733a313a2231223b6578706f72745f6461696c795f73616c657c733a363a22656e61626c65223b736572766963655f616d6f756e747c733a303a22223b74616b655f617761795f736572766963655f6368617267657c733a303a22223b64656c69766572795f616d6f756e747c733a303a22223b7461785f747970657c733a313a2231223b646563696d616c735f736570617261746f727c733a313a222e223b74686f7573616e64735f736570617261746f727c733a313a222c223b6f70656e5f636173685f6472617765725f7768656e5f7072696e74696e675f696e766f6963657c733a323a224e6f223b7768656e5f636c69636b696e675f6f6e5f6974656d5f696e5f706f737c733a313a2232223b69735f726f756e64696e675f656e61626c657c733a313a2230223b617474656e64616e63655f747970657c733a313a2232223b64656661756c745f6f726465725f747970657c733a313a2231223b69735f6c6f79616c74795f656e61626c657c733a373a2264697361626c65223b7072655f6f725f706f73745f7061796d656e747c733a313a2231223b6d696e696d756d5f706f696e745f746f5f72656465656d7c733a313a2230223b6c6f79616c74795f726174657c733a333a22302e31223b73706c69745f62696c6c7c733a313a2231223b706c6163655f6f726465725f746f6f6c7469707c733a343a2273686f77223b666f6f645f6d656e755f746f6f6c7469707c733a343a2273686f77223b7461626c655f62675f636f6c6f727c733a31303a227461626c655f62675f31223b6b6f745f7072696e745f6f6e6c696e655f73656c665f6f726465727c733a313a2231223b64656661756c745f7061796d656e747c733a313a2231223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b696e766f6963655f6c6f676f7c733a33373a2237353861646564383439306236356465626361613133353137343731316431392e6a706567223b6c616e67756167655f6d616e69666573746f7c733a393a22726576686762726576223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f7469746c657c733a31313a224c6f63616c205461786573223b7461785f726567697374726174696f6e5f6e6f7c733a383a223332313332353837223b7461785f69735f6773747c733a323a224e6f223b6170706c795f6f6e5f64656c69766572795f6368617267657c733a313a2231223b73746174655f636f64657c733a373a2230393331323332223b6163746976655f6c6f67696e5f627574746f6e7c733a313a2231223b6c6f67696e5f747970657c733a313a2231223b5f5f63695f766172737c613a323a7b733a31313a22657863657074696f6e5f32223b733a333a226f6c64223b733a393a22657863657074696f6e223b733a333a226f6c64223b7d6f75746c65745f69647c733a313a2231223b6f75746c65745f6e616d657c733a31313a224368657a7a792042697465223b616464726573737c733a35323a22436865657a792042697465204d412d4d412026616d703b20536f6e732020506c617a6120536861682044657261692c2053776174223b656d61696c7c733a303a22223b6f6e6c696e655f6f726465725f6d6f64756c657c733a313a2232223b64656661756c745f7761697465727c733a313a2233223b657863657074696f6e7c733a34303a22496e666f726d6174696f6e20686173206265656e206164646564207375636365737366756c6c7921223b69735f7761697465727c733a323a224e6f223b636f756e7465725f69647c733a313a2231223b636f756e7465725f6e616d657c733a323a223031223b7072696e7465725f69647c733a313a2231223b706174687c733a303a22223b7469746c657c733a373a225072696e746572223b747970657c733a303a22223b636861726163746572735f7065725f6c696e657c733a313a2230223b7072696e7465725f69705f616464726573737c733a303a22223b7072696e7465725f706f72747c733a303a22223b7072696e74696e675f63686f6963657c733a31373a227765625f62726f777365725f706f707570223b697076666f75725f616464726573737c733a303a22223b7072696e745f666f726d61747c733a343a2238306d6d223b696e765f71725f636f64655f656e61626c655f7374617475737c733a363a22456e61626c65223b62696c6c5f7072696e7465725f69647c733a313a2231223b706174685f62696c6c7c733a303a22223b7469746c655f62696c6c7c733a373a225072696e746572223b747970655f62696c6c7c733a303a22223b636861726163746572735f7065725f6c696e655f62696c6c7c733a313a2230223b7072696e7465725f69705f616464726573735f62696c6c7c733a303a22223b7072696e7465725f706f72745f62696c6c7c733a303a22223b7072696e74696e675f63686f6963655f62696c6c7c733a31373a227765625f62726f777365725f706f707570223b697076666f75725f616464726573735f62696c6c7c733a303a22223b7072696e745f666f726d61745f62696c6c7c733a343a2238306d6d223b696e765f71725f636f64655f656e61626c655f7374617475735f62696c6c7c733a363a22456e61626c65223b),
('5085a0fdf3d5c0653be5b38008a7828d50eab3fb', '127.0.0.1', 1770230601, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737303233303630313b73797374656d5f76657273696f6e5f6e756d6265727c733a333a22372e36223b776c627c693a313b66756e6374696f6e5f6163636573737c613a3334343a7b693a303b733a383a22766965772d333730223b693a313b733a323a222d30223b693a323b733a33333a22616c6c5f73657474696e675f7265736572766174696f6e5f6f726465722d333638223b693a333b733a323a222d30223b693a343b733a32383a22616c6c5f73657474696e675f6f6e6c696e655f6f726465722d333636223b693a353b733a323a222d30223b693a363b733a32353a22616c6c5f73657474696e675f73656c5f6f726465722d333634223b693a373b733a323a222d30223b693a383b733a383a22766965772d333632223b693a393b733a323a222d30223b693a31303b733a31353a22616c6c5f73657474696e672d333538223b693a31313b733a323a222d30223b693a31323b733a31303a2264656c6574652d333533223b693a31333b733a383a22766965772d333533223b693a31343b733a31303a227570646174652d333533223b693a31353b733a373a226164642d333533223b693a31363b733a323a222d30223b693a31373b733a393a22706f735f32352d3733223b693a31383b733a393a2272657365742d333530223b693a31393b733a323a222d30223b693a32303b733a383a22766965772d333436223b693a32313b733a323a222d30223b693a32323b733a31363a22766965775f64657461696c732d333430223b693a32333b733a31303a2264656c6574652d333430223b693a32343b733a383a22766965772d333430223b693a32353b733a31303a227570646174652d333430223b693a32363b733a373a226164642d333430223b693a32373b733a323a222d30223b693a32383b733a31373a22736f7274696e67466f72504f532d323239223b693a32393b733a383a22766965772d333337223b693a33303b733a323a222d30223b693a33313b733a383a22766965772d333332223b693a33323b733a323a222d30223b693a33333b733a31303a227570646174652d333330223b693a33343b733a323a222d30223b693a33353b733a31303a2264656c6574652d333235223b693a33363b733a383a22766965772d333235223b693a33373b733a31303a227570646174652d333235223b693a33383b733a373a226164642d333235223b693a33393b733a323a222d30223b693a34303b733a383a22766965772d333231223b693a34313b733a323a222d30223b693a34323b733a31343a22646561637469766174652d333136223b693a34333b733a31323a2261637469766174652d333136223b693a34343b733a31303a2264656c6574652d333136223b693a34353b733a383a22766965772d333136223b693a34363b733a323a222d30223b693a34373b733a383a22766965772d333134223b693a34383b733a323a222d30223b693a34393b733a383a22766965772d333130223b693a35303b733a31333a22636865636b5f6f75742d333130223b693a35313b733a31323a22636865636b5f696e2d333130223b693a35323b733a323a222d30223b693a35333b733a31313a22736f7274696e672d323630223b693a35343b733a383a22766965772d333037223b693a35353b733a323a222d30223b693a35363b733a31393a2272657365744461696c7953616c65732d313233223b693a35373b733a32303a226578706f72744461696c7953616c65732d313233223b693a35383b733a32373a226368616e67655f64656c69766572795f616464726573732d313233223b693a35393b733a31303a227570646174652d333032223b693a36303b733a323a222d30223b693a36313b733a31303a227570646174652d333030223b693a36323b733a323a222d30223b693a36333b733a31303a227570646174652d323938223b693a36343b733a323a222d30223b693a36353b733a31343a22646561637469766174652d323931223b693a36363b733a31323a2261637469766174652d323931223b693a36373b733a31303a2264656c6574652d323931223b693a36383b733a383a22766965772d323931223b693a36393b733a31303a227570646174652d323931223b693a37303b733a373a226164642d323931223b693a37313b733a323a222d30223b693a37323b733a383a22636f70792d323835223b693a37333b733a31303a2264656c6574652d323835223b693a37343b733a383a22766965772d323835223b693a37353b733a31303a227570646174652d323835223b693a37363b733a373a226164642d323835223b693a37373b733a323a222d30223b693a37383b733a31303a2264656c6574652d323830223b693a37393b733a383a22766965772d323830223b693a38303b733a31303a227570646174652d323830223b693a38313b733a373a226164642d323830223b693a38323b733a323a222d30223b693a38333b733a31303a2264656c6574652d323735223b693a38343b733a383a22766965772d323735223b693a38353b733a31303a227570646174652d323735223b693a38363b733a373a226164642d323735223b693a38373b733a323a222d30223b693a38383b733a31303a2264656c6574652d323730223b693a38393b733a383a22766965772d323730223b693a39303b733a31303a227570646174652d323730223b693a39313b733a373a226164642d323730223b693a39323b733a323a222d30223b693a39333b733a31303a2264656c6574652d323635223b693a39343b733a383a22766965772d323635223b693a39353b733a31303a227570646174652d323635223b693a39363b733a373a226164642d323635223b693a39373b733a323a222d30223b693a39383b733a31303a2264656c6574652d323630223b693a39393b733a383a22766965772d323630223b693a3130303b733a31303a227570646174652d323630223b693a3130313b733a373a226164642d323630223b693a3130323b733a323a222d30223b693a3130333b733a31303a2264656c6574652d323535223b693a3130343b733a383a22766965772d323535223b693a3130353b733a31303a227570646174652d323535223b693a3130363b733a373a226164642d323535223b693a3130373b733a323a222d30223b693a3130383b733a31393a2275706c6f61645f637573746f6d65722d323439223b693a3130393b733a31303a2264656c6574652d323439223b693a3131303b733a383a22766965772d323439223b693a3131313b733a31303a227570646174652d323439223b693a3131323b733a373a226164642d323439223b693a3131333b733a323a222d30223b693a3131343b733a31303a2264656c6574652d323434223b693a3131353b733a383a22766965772d323434223b693a3131363b733a31303a227570646174652d323434223b693a3131373b733a373a226164642d323434223b693a3131383b733a323a222d30223b693a3131393b733a31363a226974656d5f626172636f64652d323334223b693a3132303b733a33323a2275706c6f61645f666f6f645f6d656e755f696e6772656469656e74732d323334223b693a3132313b733a32303a2275706c6f61645f666f6f645f6d656e752d323334223b693a3132323b733a31393a2261737369676e5f6d6f6469666965722d323334223b693a3132333b733a31363a22766965775f64657461696c732d323334223b693a3132343b733a31303a2264656c6574652d323334223b693a3132353b733a383a22766965772d323334223b693a3132363b733a31303a227570646174652d323334223b693a3132373b733a373a226164642d323334223b693a3132383b733a323a222d30223b693a3132393b733a31303a2264656c6574652d323239223b693a3133303b733a383a22766965772d323239223b693a3133313b733a31303a227570646174652d323239223b693a3133323b733a373a226164642d323239223b693a3133333b733a323a222d30223b693a3133343b733a31363a22766965775f64657461696c732d323233223b693a3133353b733a31303a2264656c6574652d323233223b693a3133363b733a383a22766965772d323233223b693a3133373b733a31303a227570646174652d323233223b693a3133383b733a373a226164642d323233223b693a3133393b733a323a222d30223b693a3134303b733a32313a2275706c6f61645f696e6772656469656e742d323137223b693a3134313b733a31303a2264656c6574652d323137223b693a3134323b733a383a22766965772d323137223b693a3134333b733a31303a227570646174652d323137223b693a3134343b733a373a226164642d323137223b693a3134353b733a323a222d30223b693a3134363b733a31303a2264656c6574652d323132223b693a3134373b733a383a22766965772d323132223b693a3134383b733a31303a227570646174652d323132223b693a3134393b733a373a226164642d323132223b693a3135303b733a323a222d30223b693a3135313b733a31303a2264656c6574652d323037223b693a3135323b733a383a22766965772d323037223b693a3135333b733a31303a227570646174652d323037223b693a3135343b733a373a226164642d323037223b693a3135353b733a323a222d30223b693a3135363b733a383a22766965772d323035223b693a3135373b733a323a222d30223b693a3135383b733a383a22766965772d323033223b693a3135393b733a323a222d30223b693a3136303b733a383a22766965772d323031223b693a3136313b733a323a222d30223b693a3136323b733a383a22766965772d313939223b693a3136333b733a323a222d30223b693a3136343b733a383a22766965772d313937223b693a3136353b733a323a222d30223b693a3136363b733a383a22766965772d313935223b693a3136373b733a323a222d30223b693a3136383b733a383a22766965772d313933223b693a3136393b733a323a222d30223b693a3137303b733a383a22766965772d313931223b693a3137313b733a323a222d30223b693a3137323b733a383a22766965772d313839223b693a3137333b733a323a222d30223b693a3137343b733a383a22766965772d313837223b693a3137353b733a323a222d30223b693a3137363b733a383a22766965772d313835223b693a3137373b733a323a222d30223b693a3137383b733a383a22766965772d313833223b693a3137393b733a323a222d30223b693a3138303b733a383a22766965772d313831223b693a3138313b733a323a222d30223b693a3138323b733a383a22766965772d313739223b693a3138333b733a323a222d30223b693a3138343b733a383a22766965772d313735223b693a3138353b733a323a222d30223b693a3138363b733a383a22766965772d313733223b693a3138373b733a323a222d30223b693a3138383b733a383a22766965772d313731223b693a3138393b733a323a222d30223b693a3139303b733a383a22766965772d313639223b693a3139313b733a323a222d30223b693a3139323b733a383a22766965772d313637223b693a3139333b733a323a222d30223b693a3139343b733a383a22766965772d313635223b693a3139353b733a323a222d30223b693a3139363b733a383a22766965772d313633223b693a3139373b733a323a222d30223b693a3139383b733a383a22766965772d313631223b693a3139393b733a323a222d30223b693a3230303b733a383a22766965772d313539223b693a3230313b733a323a222d30223b693a3230323b733a31303a2264656c6574652d313535223b693a3230333b733a383a22766965772d313535223b693a3230343b733a373a226164642d313535223b693a3230353b733a323a222d30223b693a3230363b733a31303a2264656c6574652d313531223b693a3230373b733a383a22766965772d313531223b693a3230383b733a373a226164642d313531223b693a3230393b733a323a222d30223b693a3231303b733a31303a2264656c6574652d313437223b693a3231313b733a383a22766965772d313437223b693a3231323b733a373a226164642d313437223b693a3231333b733a323a222d30223b693a3231343b733a31303a2264656c6574652d313432223b693a3231353b733a383a22766965772d313432223b693a3231363b733a31303a227570646174652d313432223b693a3231373b733a373a226164642d313432223b693a3231383b733a323a222d30223b693a3231393b733a31363a22766965775f64657461696c732d313337223b693a3232303b733a31303a2264656c6574652d313337223b693a3232313b733a383a22766965772d313337223b693a3232323b733a373a226164642d313337223b693a3232333b733a323a222d30223b693a3232343b733a31363a22766965775f64657461696c732d313331223b693a3232353b733a31303a2264656c6574652d313331223b693a3232363b733a383a22766965772d313331223b693a3232373b733a31303a227570646174652d313331223b693a3232383b733a373a226164642d313331223b693a3232393b733a323a222d30223b693a3233303b733a383a22766965772d313239223b693a3233313b733a323a222d30223b693a3233323b733a31303a2264656c6574652d313233223b693a3233333b733a31363a22766965775f696e766f6963652d313233223b693a3233343b733a31303a22726566756e642d313233223b693a3233353b733a383a22766965772d313233223b693a3233363b733a323a222d30223b693a3233373b733a31303a2264656c6574652d313138223b693a3233383b733a383a22766965772d313138223b693a3233393b733a31303a227570646174652d313138223b693a3234303b733a373a226164642d313138223b693a3234313b733a323a222d30223b693a3234323b733a31363a22766965775f64657461696c732d313132223b693a3234333b733a31303a2264656c6574652d313132223b693a3234343b733a383a22766965772d313132223b693a3234353b733a31303a227570646174652d313132223b693a3234363b733a373a226164642d313132223b693a3234373b733a323a222d30223b693a3234383b733a31363a22766965775f64657461696c732d313036223b693a3234393b733a31303a2264656c6574652d313036223b693a3235303b733a383a22766965772d313036223b693a3235313b733a31303a227570646174652d313036223b693a3235323b733a373a226164642d313036223b693a3235333b733a323a222d30223b693a3235343b733a383a22766965772d313034223b693a3235353b733a323a222d30223b693a3235363b733a383a22656e7465722d3938223b693a3235373b733a393a2264656c6574652d3938223b693a3235383b733a373a22766965772d3938223b693a3235393b733a393a227570646174652d3938223b693a3236303b733a363a226164642d3938223b693a3236313b733a323a222d30223b693a3236323b733a393a22706f735f32332d3733223b693a3236333b733a393a22706f735f32322d3733223b693a3236343b733a393a22706f735f32312d3733223b693a3236353b733a393a22706f735f32302d3733223b693a3236363b733a393a22706f735f31392d3733223b693a3236373b733a393a22706f735f31382d3733223b693a3236383b733a393a22706f735f31372d3733223b693a3236393b733a393a22706f735f31362d3733223b693a3237303b733a393a22706f735f31352d3733223b693a3237313b733a393a22706f735f31342d3733223b693a3237323b733a393a22706f735f31332d3733223b693a3237333b733a393a22706f735f31322d3733223b693a3237343b733a393a22706f735f31312d3733223b693a3237353b733a393a22706f735f31302d3733223b693a3237363b733a383a22706f735f392d3733223b693a3237373b733a383a22706f735f382d3733223b693a3237383b733a383a22706f735f372d3733223b693a3237393b733a383a22706f735f362d3733223b693a3238303b733a383a22706f735f352d3733223b693a3238313b733a383a22706f735f342d3733223b693a3238323b733a383a22706f735f332d3733223b693a3238333b733a383a22706f735f322d3733223b693a3238343b733a383a22706f735f312d3733223b693a3238353b733a323a222d30223b693a3238363b733a383a22656e7465722d3637223b693a3238373b733a393a2264656c6574652d3637223b693a3238383b733a373a22766965772d3637223b693a3238393b733a393a227570646174652d3637223b693a3239303b733a363a226164642d3637223b693a3239313b733a323a222d30223b693a3239323b733a393a227570646174652d3634223b693a3239333b733a323a222d30223b693a3239343b733a31323a22756e696e7374616c6c2d3632223b693a3239353b733a323a222d30223b693a3239363b733a393a227570646174652d3630223b693a3239373b733a323a222d30223b693a3239383b733a393a2264656c6574652d3535223b693a3239393b733a373a22766965772d3535223b693a3330303b733a393a227570646174652d3535223b693a3330313b733a363a226164642d3535223b693a3330323b733a323a222d30223b693a3330333b733a31333a227570646174655f7461782d3532223b693a3330343b733a323a222d30223b693a3330353b733a393a227570646174652d3439223b693a3330363b733a323a222d30223b693a3330373b733a393a2264656c6574652d3335223b693a3330383b733a373a22766965772d3335223b693a3330393b733a393a227570646174652d3335223b693a3331303b733a363a226164642d3335223b693a3331313b733a323a222d30223b693a3331323b733a393a227570646174652d3331223b693a3331333b733a373a22766965772d3331223b693a3331343b733a323a222d30223b693a3331353b733a393a2264656c6574652d3236223b693a3331363b733a373a22766965772d3236223b693a3331373b733a393a227570646174652d3236223b693a3331383b733a363a226164642d3236223b693a3331393b733a323a222d30223b693a3332303b733a393a2264656c6574652d3232223b693a3332313b733a373a22766965772d3232223b693a3332323b733a363a226164642d3232223b693a3332333b733a323a222d30223b693a3332343b733a31373a22626c6f636b5f616c6c5f757365722d3135223b693a3332353b733a31353a2273686f775f6f75746c6574732d3135223b693a3332363b733a393a2264656c6574652d3135223b693a3332373b733a373a22766965772d3135223b693a3332383b733a393a227570646174652d3135223b693a3332393b733a363a226164642d3135223b693a3333303b733a323a222d30223b693a3333313b733a393a227570646174652d3132223b693a3333323b733a373a22766965772d3132223b693a3333333b733a323a222d30223b693a3333343b733a383a227570646174652d39223b693a3333353b733a363a22766965772d39223b693a3333363b733a323a222d30223b693a3333373b733a383a227570646174652d36223b693a3333383b733a323a222d30223b693a3333393b733a383a227570646174652d33223b693a3334303b733a363a22766965772d33223b693a3334313b733a323a222d30223b693a3334323b733a363a22766965772d31223b693a3334333b733a323a222d30223b7d757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b64657369676e6174696f6e7c733a31313a2253757065722041646d696e223b66756c6c5f6e616d657c733a31303a2241646d696e2055736572223b73686f72745f6e616d657c733a313a2261223b70686f6e657c733a32363a22303331332d343336373431372020303334382d35353637343137223b656d61696c5f616464726573737c733a31353a2261646d696e4061646d696e2e636f6d223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b73657373696f6e5f6f75746c6574737c733a313a2232223b6163746976655f6d656e755f746d707c733a303a22223b63757272656e63797c733a333a22504b52223b7a6f6e655f6e616d657c733a31323a22417369612f4b617261636869223b646174655f666f726d61747c733a353a22592f6d2f64223b627573696e6573735f6e616d657c733a33323a22436865657a792042697465204d412d4d412026616d703b616d703b20536f6e73223b776562736974657c733a31303a22666972656170702e6363223b63757272656e63795f706f736974696f6e7c733a31333a224265666f726520416d6f756e74223b707265636973696f6e7c733a313a2232223b64656661756c745f637573746f6d65727c733a313a2231223b6578706f72745f6461696c795f73616c657c733a363a22656e61626c65223b736572766963655f616d6f756e747c733a303a22223b74616b655f617761795f736572766963655f6368617267657c733a303a22223b64656c69766572795f616d6f756e747c733a303a22223b7461785f747970657c733a313a2231223b646563696d616c735f736570617261746f727c733a313a222e223b74686f7573616e64735f736570617261746f727c733a313a222c223b6f70656e5f636173685f6472617765725f7768656e5f7072696e74696e675f696e766f6963657c733a323a224e6f223b7768656e5f636c69636b696e675f6f6e5f6974656d5f696e5f706f737c733a313a2232223b69735f726f756e64696e675f656e61626c657c733a313a2230223b617474656e64616e63655f747970657c733a313a2232223b64656661756c745f6f726465725f747970657c733a313a2231223b69735f6c6f79616c74795f656e61626c657c733a373a2264697361626c65223b7072655f6f725f706f73745f7061796d656e747c733a313a2231223b6d696e696d756d5f706f696e745f746f5f72656465656d7c733a313a2230223b6c6f79616c74795f726174657c733a333a22302e31223b73706c69745f62696c6c7c733a313a2231223b706c6163655f6f726465725f746f6f6c7469707c733a343a2273686f77223b666f6f645f6d656e755f746f6f6c7469707c733a343a2273686f77223b7461626c655f62675f636f6c6f727c733a31303a227461626c655f62675f31223b6b6f745f7072696e745f6f6e6c696e655f73656c665f6f726465727c733a313a2231223b64656661756c745f7061796d656e747c733a313a2231223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b696e766f6963655f6c6f676f7c733a33373a2237353861646564383439306236356465626361613133353137343731316431392e6a706567223b6c616e67756167655f6d616e69666573746f7c733a393a22726576686762726576223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f7469746c657c733a31313a224c6f63616c205461786573223b7461785f726567697374726174696f6e5f6e6f7c733a383a223332313332353837223b7461785f69735f6773747c733a323a224e6f223b6170706c795f6f6e5f64656c69766572795f6368617267657c733a313a2231223b73746174655f636f64657c733a373a2230393331323332223b6163746976655f6c6f67696e5f627574746f6e7c733a313a2231223b6c6f67696e5f747970657c733a313a2231223b5f5f63695f766172737c613a323a7b733a31313a22657863657074696f6e5f32223b733a333a226f6c64223b733a393a22657863657074696f6e223b733a333a226f6c64223b7d6f75746c65745f69647c733a313a2231223b6f75746c65745f6e616d657c733a31313a224368657a7a792042697465223b616464726573737c733a35323a22436865657a792042697465204d412d4d412026616d703b20536f6e732020506c617a6120536861682044657261692c2053776174223b656d61696c7c733a303a22223b6f6e6c696e655f6f726465725f6d6f64756c657c733a313a2232223b64656661756c745f7761697465727c733a313a2233223b69735f7761697465727c733a323a224e6f223b636f756e7465725f69647c733a313a2231223b636f756e7465725f6e616d657c733a323a223031223b7072696e7465725f69647c733a313a2231223b706174687c733a303a22223b7469746c657c733a373a225072696e746572223b747970657c733a303a22223b636861726163746572735f7065725f6c696e657c733a313a2230223b7072696e7465725f69705f616464726573737c733a303a22223b7072696e7465725f706f72747c733a303a22223b7072696e74696e675f63686f6963657c733a31373a227765625f62726f777365725f706f707570223b697076666f75725f616464726573737c733a303a22223b7072696e745f666f726d61747c733a343a2238306d6d223b696e765f71725f636f64655f656e61626c655f7374617475737c733a363a22456e61626c65223b62696c6c5f7072696e7465725f69647c733a313a2231223b706174685f62696c6c7c733a303a22223b7469746c655f62696c6c7c733a373a225072696e746572223b747970655f62696c6c7c733a303a22223b636861726163746572735f7065725f6c696e655f62696c6c7c733a313a2230223b7072696e7465725f69705f616464726573735f62696c6c7c733a303a22223b7072696e7465725f706f72745f62696c6c7c733a303a22223b7072696e74696e675f63686f6963655f62696c6c7c733a31373a227765625f62726f777365725f706f707570223b697076666f75725f616464726573735f62696c6c7c733a303a22223b7072696e745f666f726d61745f62696c6c7c733a343a2238306d6d223b696e765f71725f636f64655f656e61626c655f7374617475735f62696c6c7c733a363a22456e61626c65223b657863657074696f6e7c733a34303a22496e666f726d6174696f6e20686173206265656e206164646564207375636365737366756c6c7921223b);
INSERT INTO `tbl_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('7d8b82b769a4dc0b42ba66d00135f8a6fb89a819', '127.0.0.1', 1770230979, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737303233303937393b73797374656d5f76657273696f6e5f6e756d6265727c733a333a22372e36223b776c627c693a313b66756e6374696f6e5f6163636573737c613a3334343a7b693a303b733a383a22766965772d333730223b693a313b733a323a222d30223b693a323b733a33333a22616c6c5f73657474696e675f7265736572766174696f6e5f6f726465722d333638223b693a333b733a323a222d30223b693a343b733a32383a22616c6c5f73657474696e675f6f6e6c696e655f6f726465722d333636223b693a353b733a323a222d30223b693a363b733a32353a22616c6c5f73657474696e675f73656c5f6f726465722d333634223b693a373b733a323a222d30223b693a383b733a383a22766965772d333632223b693a393b733a323a222d30223b693a31303b733a31353a22616c6c5f73657474696e672d333538223b693a31313b733a323a222d30223b693a31323b733a31303a2264656c6574652d333533223b693a31333b733a383a22766965772d333533223b693a31343b733a31303a227570646174652d333533223b693a31353b733a373a226164642d333533223b693a31363b733a323a222d30223b693a31373b733a393a22706f735f32352d3733223b693a31383b733a393a2272657365742d333530223b693a31393b733a323a222d30223b693a32303b733a383a22766965772d333436223b693a32313b733a323a222d30223b693a32323b733a31363a22766965775f64657461696c732d333430223b693a32333b733a31303a2264656c6574652d333430223b693a32343b733a383a22766965772d333430223b693a32353b733a31303a227570646174652d333430223b693a32363b733a373a226164642d333430223b693a32373b733a323a222d30223b693a32383b733a31373a22736f7274696e67466f72504f532d323239223b693a32393b733a383a22766965772d333337223b693a33303b733a323a222d30223b693a33313b733a383a22766965772d333332223b693a33323b733a323a222d30223b693a33333b733a31303a227570646174652d333330223b693a33343b733a323a222d30223b693a33353b733a31303a2264656c6574652d333235223b693a33363b733a383a22766965772d333235223b693a33373b733a31303a227570646174652d333235223b693a33383b733a373a226164642d333235223b693a33393b733a323a222d30223b693a34303b733a383a22766965772d333231223b693a34313b733a323a222d30223b693a34323b733a31343a22646561637469766174652d333136223b693a34333b733a31323a2261637469766174652d333136223b693a34343b733a31303a2264656c6574652d333136223b693a34353b733a383a22766965772d333136223b693a34363b733a323a222d30223b693a34373b733a383a22766965772d333134223b693a34383b733a323a222d30223b693a34393b733a383a22766965772d333130223b693a35303b733a31333a22636865636b5f6f75742d333130223b693a35313b733a31323a22636865636b5f696e2d333130223b693a35323b733a323a222d30223b693a35333b733a31313a22736f7274696e672d323630223b693a35343b733a383a22766965772d333037223b693a35353b733a323a222d30223b693a35363b733a31393a2272657365744461696c7953616c65732d313233223b693a35373b733a32303a226578706f72744461696c7953616c65732d313233223b693a35383b733a32373a226368616e67655f64656c69766572795f616464726573732d313233223b693a35393b733a31303a227570646174652d333032223b693a36303b733a323a222d30223b693a36313b733a31303a227570646174652d333030223b693a36323b733a323a222d30223b693a36333b733a31303a227570646174652d323938223b693a36343b733a323a222d30223b693a36353b733a31343a22646561637469766174652d323931223b693a36363b733a31323a2261637469766174652d323931223b693a36373b733a31303a2264656c6574652d323931223b693a36383b733a383a22766965772d323931223b693a36393b733a31303a227570646174652d323931223b693a37303b733a373a226164642d323931223b693a37313b733a323a222d30223b693a37323b733a383a22636f70792d323835223b693a37333b733a31303a2264656c6574652d323835223b693a37343b733a383a22766965772d323835223b693a37353b733a31303a227570646174652d323835223b693a37363b733a373a226164642d323835223b693a37373b733a323a222d30223b693a37383b733a31303a2264656c6574652d323830223b693a37393b733a383a22766965772d323830223b693a38303b733a31303a227570646174652d323830223b693a38313b733a373a226164642d323830223b693a38323b733a323a222d30223b693a38333b733a31303a2264656c6574652d323735223b693a38343b733a383a22766965772d323735223b693a38353b733a31303a227570646174652d323735223b693a38363b733a373a226164642d323735223b693a38373b733a323a222d30223b693a38383b733a31303a2264656c6574652d323730223b693a38393b733a383a22766965772d323730223b693a39303b733a31303a227570646174652d323730223b693a39313b733a373a226164642d323730223b693a39323b733a323a222d30223b693a39333b733a31303a2264656c6574652d323635223b693a39343b733a383a22766965772d323635223b693a39353b733a31303a227570646174652d323635223b693a39363b733a373a226164642d323635223b693a39373b733a323a222d30223b693a39383b733a31303a2264656c6574652d323630223b693a39393b733a383a22766965772d323630223b693a3130303b733a31303a227570646174652d323630223b693a3130313b733a373a226164642d323630223b693a3130323b733a323a222d30223b693a3130333b733a31303a2264656c6574652d323535223b693a3130343b733a383a22766965772d323535223b693a3130353b733a31303a227570646174652d323535223b693a3130363b733a373a226164642d323535223b693a3130373b733a323a222d30223b693a3130383b733a31393a2275706c6f61645f637573746f6d65722d323439223b693a3130393b733a31303a2264656c6574652d323439223b693a3131303b733a383a22766965772d323439223b693a3131313b733a31303a227570646174652d323439223b693a3131323b733a373a226164642d323439223b693a3131333b733a323a222d30223b693a3131343b733a31303a2264656c6574652d323434223b693a3131353b733a383a22766965772d323434223b693a3131363b733a31303a227570646174652d323434223b693a3131373b733a373a226164642d323434223b693a3131383b733a323a222d30223b693a3131393b733a31363a226974656d5f626172636f64652d323334223b693a3132303b733a33323a2275706c6f61645f666f6f645f6d656e755f696e6772656469656e74732d323334223b693a3132313b733a32303a2275706c6f61645f666f6f645f6d656e752d323334223b693a3132323b733a31393a2261737369676e5f6d6f6469666965722d323334223b693a3132333b733a31363a22766965775f64657461696c732d323334223b693a3132343b733a31303a2264656c6574652d323334223b693a3132353b733a383a22766965772d323334223b693a3132363b733a31303a227570646174652d323334223b693a3132373b733a373a226164642d323334223b693a3132383b733a323a222d30223b693a3132393b733a31303a2264656c6574652d323239223b693a3133303b733a383a22766965772d323239223b693a3133313b733a31303a227570646174652d323239223b693a3133323b733a373a226164642d323239223b693a3133333b733a323a222d30223b693a3133343b733a31363a22766965775f64657461696c732d323233223b693a3133353b733a31303a2264656c6574652d323233223b693a3133363b733a383a22766965772d323233223b693a3133373b733a31303a227570646174652d323233223b693a3133383b733a373a226164642d323233223b693a3133393b733a323a222d30223b693a3134303b733a32313a2275706c6f61645f696e6772656469656e742d323137223b693a3134313b733a31303a2264656c6574652d323137223b693a3134323b733a383a22766965772d323137223b693a3134333b733a31303a227570646174652d323137223b693a3134343b733a373a226164642d323137223b693a3134353b733a323a222d30223b693a3134363b733a31303a2264656c6574652d323132223b693a3134373b733a383a22766965772d323132223b693a3134383b733a31303a227570646174652d323132223b693a3134393b733a373a226164642d323132223b693a3135303b733a323a222d30223b693a3135313b733a31303a2264656c6574652d323037223b693a3135323b733a383a22766965772d323037223b693a3135333b733a31303a227570646174652d323037223b693a3135343b733a373a226164642d323037223b693a3135353b733a323a222d30223b693a3135363b733a383a22766965772d323035223b693a3135373b733a323a222d30223b693a3135383b733a383a22766965772d323033223b693a3135393b733a323a222d30223b693a3136303b733a383a22766965772d323031223b693a3136313b733a323a222d30223b693a3136323b733a383a22766965772d313939223b693a3136333b733a323a222d30223b693a3136343b733a383a22766965772d313937223b693a3136353b733a323a222d30223b693a3136363b733a383a22766965772d313935223b693a3136373b733a323a222d30223b693a3136383b733a383a22766965772d313933223b693a3136393b733a323a222d30223b693a3137303b733a383a22766965772d313931223b693a3137313b733a323a222d30223b693a3137323b733a383a22766965772d313839223b693a3137333b733a323a222d30223b693a3137343b733a383a22766965772d313837223b693a3137353b733a323a222d30223b693a3137363b733a383a22766965772d313835223b693a3137373b733a323a222d30223b693a3137383b733a383a22766965772d313833223b693a3137393b733a323a222d30223b693a3138303b733a383a22766965772d313831223b693a3138313b733a323a222d30223b693a3138323b733a383a22766965772d313739223b693a3138333b733a323a222d30223b693a3138343b733a383a22766965772d313735223b693a3138353b733a323a222d30223b693a3138363b733a383a22766965772d313733223b693a3138373b733a323a222d30223b693a3138383b733a383a22766965772d313731223b693a3138393b733a323a222d30223b693a3139303b733a383a22766965772d313639223b693a3139313b733a323a222d30223b693a3139323b733a383a22766965772d313637223b693a3139333b733a323a222d30223b693a3139343b733a383a22766965772d313635223b693a3139353b733a323a222d30223b693a3139363b733a383a22766965772d313633223b693a3139373b733a323a222d30223b693a3139383b733a383a22766965772d313631223b693a3139393b733a323a222d30223b693a3230303b733a383a22766965772d313539223b693a3230313b733a323a222d30223b693a3230323b733a31303a2264656c6574652d313535223b693a3230333b733a383a22766965772d313535223b693a3230343b733a373a226164642d313535223b693a3230353b733a323a222d30223b693a3230363b733a31303a2264656c6574652d313531223b693a3230373b733a383a22766965772d313531223b693a3230383b733a373a226164642d313531223b693a3230393b733a323a222d30223b693a3231303b733a31303a2264656c6574652d313437223b693a3231313b733a383a22766965772d313437223b693a3231323b733a373a226164642d313437223b693a3231333b733a323a222d30223b693a3231343b733a31303a2264656c6574652d313432223b693a3231353b733a383a22766965772d313432223b693a3231363b733a31303a227570646174652d313432223b693a3231373b733a373a226164642d313432223b693a3231383b733a323a222d30223b693a3231393b733a31363a22766965775f64657461696c732d313337223b693a3232303b733a31303a2264656c6574652d313337223b693a3232313b733a383a22766965772d313337223b693a3232323b733a373a226164642d313337223b693a3232333b733a323a222d30223b693a3232343b733a31363a22766965775f64657461696c732d313331223b693a3232353b733a31303a2264656c6574652d313331223b693a3232363b733a383a22766965772d313331223b693a3232373b733a31303a227570646174652d313331223b693a3232383b733a373a226164642d313331223b693a3232393b733a323a222d30223b693a3233303b733a383a22766965772d313239223b693a3233313b733a323a222d30223b693a3233323b733a31303a2264656c6574652d313233223b693a3233333b733a31363a22766965775f696e766f6963652d313233223b693a3233343b733a31303a22726566756e642d313233223b693a3233353b733a383a22766965772d313233223b693a3233363b733a323a222d30223b693a3233373b733a31303a2264656c6574652d313138223b693a3233383b733a383a22766965772d313138223b693a3233393b733a31303a227570646174652d313138223b693a3234303b733a373a226164642d313138223b693a3234313b733a323a222d30223b693a3234323b733a31363a22766965775f64657461696c732d313132223b693a3234333b733a31303a2264656c6574652d313132223b693a3234343b733a383a22766965772d313132223b693a3234353b733a31303a227570646174652d313132223b693a3234363b733a373a226164642d313132223b693a3234373b733a323a222d30223b693a3234383b733a31363a22766965775f64657461696c732d313036223b693a3234393b733a31303a2264656c6574652d313036223b693a3235303b733a383a22766965772d313036223b693a3235313b733a31303a227570646174652d313036223b693a3235323b733a373a226164642d313036223b693a3235333b733a323a222d30223b693a3235343b733a383a22766965772d313034223b693a3235353b733a323a222d30223b693a3235363b733a383a22656e7465722d3938223b693a3235373b733a393a2264656c6574652d3938223b693a3235383b733a373a22766965772d3938223b693a3235393b733a393a227570646174652d3938223b693a3236303b733a363a226164642d3938223b693a3236313b733a323a222d30223b693a3236323b733a393a22706f735f32332d3733223b693a3236333b733a393a22706f735f32322d3733223b693a3236343b733a393a22706f735f32312d3733223b693a3236353b733a393a22706f735f32302d3733223b693a3236363b733a393a22706f735f31392d3733223b693a3236373b733a393a22706f735f31382d3733223b693a3236383b733a393a22706f735f31372d3733223b693a3236393b733a393a22706f735f31362d3733223b693a3237303b733a393a22706f735f31352d3733223b693a3237313b733a393a22706f735f31342d3733223b693a3237323b733a393a22706f735f31332d3733223b693a3237333b733a393a22706f735f31322d3733223b693a3237343b733a393a22706f735f31312d3733223b693a3237353b733a393a22706f735f31302d3733223b693a3237363b733a383a22706f735f392d3733223b693a3237373b733a383a22706f735f382d3733223b693a3237383b733a383a22706f735f372d3733223b693a3237393b733a383a22706f735f362d3733223b693a3238303b733a383a22706f735f352d3733223b693a3238313b733a383a22706f735f342d3733223b693a3238323b733a383a22706f735f332d3733223b693a3238333b733a383a22706f735f322d3733223b693a3238343b733a383a22706f735f312d3733223b693a3238353b733a323a222d30223b693a3238363b733a383a22656e7465722d3637223b693a3238373b733a393a2264656c6574652d3637223b693a3238383b733a373a22766965772d3637223b693a3238393b733a393a227570646174652d3637223b693a3239303b733a363a226164642d3637223b693a3239313b733a323a222d30223b693a3239323b733a393a227570646174652d3634223b693a3239333b733a323a222d30223b693a3239343b733a31323a22756e696e7374616c6c2d3632223b693a3239353b733a323a222d30223b693a3239363b733a393a227570646174652d3630223b693a3239373b733a323a222d30223b693a3239383b733a393a2264656c6574652d3535223b693a3239393b733a373a22766965772d3535223b693a3330303b733a393a227570646174652d3535223b693a3330313b733a363a226164642d3535223b693a3330323b733a323a222d30223b693a3330333b733a31333a227570646174655f7461782d3532223b693a3330343b733a323a222d30223b693a3330353b733a393a227570646174652d3439223b693a3330363b733a323a222d30223b693a3330373b733a393a2264656c6574652d3335223b693a3330383b733a373a22766965772d3335223b693a3330393b733a393a227570646174652d3335223b693a3331303b733a363a226164642d3335223b693a3331313b733a323a222d30223b693a3331323b733a393a227570646174652d3331223b693a3331333b733a373a22766965772d3331223b693a3331343b733a323a222d30223b693a3331353b733a393a2264656c6574652d3236223b693a3331363b733a373a22766965772d3236223b693a3331373b733a393a227570646174652d3236223b693a3331383b733a363a226164642d3236223b693a3331393b733a323a222d30223b693a3332303b733a393a2264656c6574652d3232223b693a3332313b733a373a22766965772d3232223b693a3332323b733a363a226164642d3232223b693a3332333b733a323a222d30223b693a3332343b733a31373a22626c6f636b5f616c6c5f757365722d3135223b693a3332353b733a31353a2273686f775f6f75746c6574732d3135223b693a3332363b733a393a2264656c6574652d3135223b693a3332373b733a373a22766965772d3135223b693a3332383b733a393a227570646174652d3135223b693a3332393b733a363a226164642d3135223b693a3333303b733a323a222d30223b693a3333313b733a393a227570646174652d3132223b693a3333323b733a373a22766965772d3132223b693a3333333b733a323a222d30223b693a3333343b733a383a227570646174652d39223b693a3333353b733a363a22766965772d39223b693a3333363b733a323a222d30223b693a3333373b733a383a227570646174652d36223b693a3333383b733a323a222d30223b693a3333393b733a383a227570646174652d33223b693a3334303b733a363a22766965772d33223b693a3334313b733a323a222d30223b693a3334323b733a363a22766965772d31223b693a3334333b733a323a222d30223b7d757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b64657369676e6174696f6e7c733a31313a2253757065722041646d696e223b66756c6c5f6e616d657c733a31303a2241646d696e2055736572223b73686f72745f6e616d657c733a313a2261223b70686f6e657c733a32363a22303331332d343336373431372020303334382d35353637343137223b656d61696c5f616464726573737c733a31353a2261646d696e4061646d696e2e636f6d223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b73657373696f6e5f6f75746c6574737c733a313a2232223b6163746976655f6d656e755f746d707c733a303a22223b63757272656e63797c733a333a22504b52223b7a6f6e655f6e616d657c733a31323a22417369612f4b617261636869223b646174655f666f726d61747c733a353a22592f6d2f64223b627573696e6573735f6e616d657c733a33323a22436865657a792042697465204d412d4d412026616d703b616d703b20536f6e73223b776562736974657c733a31303a22666972656170702e6363223b63757272656e63795f706f736974696f6e7c733a31333a224265666f726520416d6f756e74223b707265636973696f6e7c733a313a2232223b64656661756c745f637573746f6d65727c733a313a2231223b6578706f72745f6461696c795f73616c657c733a363a22656e61626c65223b736572766963655f616d6f756e747c733a303a22223b74616b655f617761795f736572766963655f6368617267657c733a303a22223b64656c69766572795f616d6f756e747c733a303a22223b7461785f747970657c733a313a2231223b646563696d616c735f736570617261746f727c733a313a222e223b74686f7573616e64735f736570617261746f727c733a313a222c223b6f70656e5f636173685f6472617765725f7768656e5f7072696e74696e675f696e766f6963657c733a323a224e6f223b7768656e5f636c69636b696e675f6f6e5f6974656d5f696e5f706f737c733a313a2232223b69735f726f756e64696e675f656e61626c657c733a313a2230223b617474656e64616e63655f747970657c733a313a2232223b64656661756c745f6f726465725f747970657c733a313a2231223b69735f6c6f79616c74795f656e61626c657c733a373a2264697361626c65223b7072655f6f725f706f73745f7061796d656e747c733a313a2231223b6d696e696d756d5f706f696e745f746f5f72656465656d7c733a313a2230223b6c6f79616c74795f726174657c733a333a22302e31223b73706c69745f62696c6c7c733a313a2231223b706c6163655f6f726465725f746f6f6c7469707c733a343a2273686f77223b666f6f645f6d656e755f746f6f6c7469707c733a343a2273686f77223b7461626c655f62675f636f6c6f727c733a31303a227461626c655f62675f31223b6b6f745f7072696e745f6f6e6c696e655f73656c665f6f726465727c733a313a2231223b64656661756c745f7061796d656e747c733a313a2231223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b696e766f6963655f6c6f676f7c733a33373a2237353861646564383439306236356465626361613133353137343731316431392e6a706567223b6c616e67756167655f6d616e69666573746f7c733a393a22726576686762726576223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f7469746c657c733a31313a224c6f63616c205461786573223b7461785f726567697374726174696f6e5f6e6f7c733a383a223332313332353837223b7461785f69735f6773747c733a323a224e6f223b6170706c795f6f6e5f64656c69766572795f6368617267657c733a313a2231223b73746174655f636f64657c733a373a2230393331323332223b6c6f67696e5f747970657c733a313a2231223b5f5f63695f766172737c613a323a7b733a31313a22657863657074696f6e5f32223b733a333a226f6c64223b733a393a22657863657074696f6e223b733a333a226f6c64223b7d6f75746c65745f69647c733a313a2231223b6f75746c65745f6e616d657c733a31313a224368657a7a792042697465223b616464726573737c733a35323a22436865657a792042697465204d412d4d412026616d703b20536f6e732020506c617a6120536861682044657261692c2053776174223b656d61696c7c733a303a22223b6f6e6c696e655f6f726465725f6d6f64756c657c733a313a2232223b64656661756c745f7761697465727c733a313a2233223b69735f7761697465727c733a323a224e6f223b636f756e7465725f69647c733a313a2231223b636f756e7465725f6e616d657c733a323a223031223b7072696e7465725f69647c733a313a2231223b706174687c733a303a22223b7469746c657c733a373a225072696e746572223b747970657c733a303a22223b636861726163746572735f7065725f6c696e657c733a313a2230223b7072696e7465725f69705f616464726573737c733a303a22223b7072696e7465725f706f72747c733a303a22223b7072696e74696e675f63686f6963657c733a31373a227765625f62726f777365725f706f707570223b697076666f75725f616464726573737c733a303a22223b7072696e745f666f726d61747c733a343a2238306d6d223b696e765f71725f636f64655f656e61626c655f7374617475737c733a363a22456e61626c65223b62696c6c5f7072696e7465725f69647c733a313a2231223b706174685f62696c6c7c733a303a22223b7469746c655f62696c6c7c733a373a225072696e746572223b747970655f62696c6c7c733a303a22223b636861726163746572735f7065725f6c696e655f62696c6c7c733a313a2230223b7072696e7465725f69705f616464726573735f62696c6c7c733a303a22223b7072696e7465725f706f72745f62696c6c7c733a303a22223b7072696e74696e675f63686f6963655f62696c6c7c733a31373a227765625f62726f777365725f706f707570223b697076666f75725f616464726573735f62696c6c7c733a303a22223b7072696e745f666f726d61745f62696c6c7c733a343a2238306d6d223b696e765f71725f636f64655f656e61626c655f7374617475735f62696c6c7c733a363a22456e61626c65223b6163746976655f6c6f67696e5f627574746f6e7c733a313a2231223b657863657074696f6e7c733a34323a22496e666f726d6174696f6e20686173206265656e2075706461746564207375636365737366756c6c7921223b),
('efa0feb5be6ba4945d875c0936aef439f6dc761a', '127.0.0.1', 1770231246, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737303233303937393b73797374656d5f76657273696f6e5f6e756d6265727c733a333a22372e36223b776c627c693a313b66756e6374696f6e5f6163636573737c613a3334343a7b693a303b733a383a22766965772d333730223b693a313b733a323a222d30223b693a323b733a33333a22616c6c5f73657474696e675f7265736572766174696f6e5f6f726465722d333638223b693a333b733a323a222d30223b693a343b733a32383a22616c6c5f73657474696e675f6f6e6c696e655f6f726465722d333636223b693a353b733a323a222d30223b693a363b733a32353a22616c6c5f73657474696e675f73656c5f6f726465722d333634223b693a373b733a323a222d30223b693a383b733a383a22766965772d333632223b693a393b733a323a222d30223b693a31303b733a31353a22616c6c5f73657474696e672d333538223b693a31313b733a323a222d30223b693a31323b733a31303a2264656c6574652d333533223b693a31333b733a383a22766965772d333533223b693a31343b733a31303a227570646174652d333533223b693a31353b733a373a226164642d333533223b693a31363b733a323a222d30223b693a31373b733a393a22706f735f32352d3733223b693a31383b733a393a2272657365742d333530223b693a31393b733a323a222d30223b693a32303b733a383a22766965772d333436223b693a32313b733a323a222d30223b693a32323b733a31363a22766965775f64657461696c732d333430223b693a32333b733a31303a2264656c6574652d333430223b693a32343b733a383a22766965772d333430223b693a32353b733a31303a227570646174652d333430223b693a32363b733a373a226164642d333430223b693a32373b733a323a222d30223b693a32383b733a31373a22736f7274696e67466f72504f532d323239223b693a32393b733a383a22766965772d333337223b693a33303b733a323a222d30223b693a33313b733a383a22766965772d333332223b693a33323b733a323a222d30223b693a33333b733a31303a227570646174652d333330223b693a33343b733a323a222d30223b693a33353b733a31303a2264656c6574652d333235223b693a33363b733a383a22766965772d333235223b693a33373b733a31303a227570646174652d333235223b693a33383b733a373a226164642d333235223b693a33393b733a323a222d30223b693a34303b733a383a22766965772d333231223b693a34313b733a323a222d30223b693a34323b733a31343a22646561637469766174652d333136223b693a34333b733a31323a2261637469766174652d333136223b693a34343b733a31303a2264656c6574652d333136223b693a34353b733a383a22766965772d333136223b693a34363b733a323a222d30223b693a34373b733a383a22766965772d333134223b693a34383b733a323a222d30223b693a34393b733a383a22766965772d333130223b693a35303b733a31333a22636865636b5f6f75742d333130223b693a35313b733a31323a22636865636b5f696e2d333130223b693a35323b733a323a222d30223b693a35333b733a31313a22736f7274696e672d323630223b693a35343b733a383a22766965772d333037223b693a35353b733a323a222d30223b693a35363b733a31393a2272657365744461696c7953616c65732d313233223b693a35373b733a32303a226578706f72744461696c7953616c65732d313233223b693a35383b733a32373a226368616e67655f64656c69766572795f616464726573732d313233223b693a35393b733a31303a227570646174652d333032223b693a36303b733a323a222d30223b693a36313b733a31303a227570646174652d333030223b693a36323b733a323a222d30223b693a36333b733a31303a227570646174652d323938223b693a36343b733a323a222d30223b693a36353b733a31343a22646561637469766174652d323931223b693a36363b733a31323a2261637469766174652d323931223b693a36373b733a31303a2264656c6574652d323931223b693a36383b733a383a22766965772d323931223b693a36393b733a31303a227570646174652d323931223b693a37303b733a373a226164642d323931223b693a37313b733a323a222d30223b693a37323b733a383a22636f70792d323835223b693a37333b733a31303a2264656c6574652d323835223b693a37343b733a383a22766965772d323835223b693a37353b733a31303a227570646174652d323835223b693a37363b733a373a226164642d323835223b693a37373b733a323a222d30223b693a37383b733a31303a2264656c6574652d323830223b693a37393b733a383a22766965772d323830223b693a38303b733a31303a227570646174652d323830223b693a38313b733a373a226164642d323830223b693a38323b733a323a222d30223b693a38333b733a31303a2264656c6574652d323735223b693a38343b733a383a22766965772d323735223b693a38353b733a31303a227570646174652d323735223b693a38363b733a373a226164642d323735223b693a38373b733a323a222d30223b693a38383b733a31303a2264656c6574652d323730223b693a38393b733a383a22766965772d323730223b693a39303b733a31303a227570646174652d323730223b693a39313b733a373a226164642d323730223b693a39323b733a323a222d30223b693a39333b733a31303a2264656c6574652d323635223b693a39343b733a383a22766965772d323635223b693a39353b733a31303a227570646174652d323635223b693a39363b733a373a226164642d323635223b693a39373b733a323a222d30223b693a39383b733a31303a2264656c6574652d323630223b693a39393b733a383a22766965772d323630223b693a3130303b733a31303a227570646174652d323630223b693a3130313b733a373a226164642d323630223b693a3130323b733a323a222d30223b693a3130333b733a31303a2264656c6574652d323535223b693a3130343b733a383a22766965772d323535223b693a3130353b733a31303a227570646174652d323535223b693a3130363b733a373a226164642d323535223b693a3130373b733a323a222d30223b693a3130383b733a31393a2275706c6f61645f637573746f6d65722d323439223b693a3130393b733a31303a2264656c6574652d323439223b693a3131303b733a383a22766965772d323439223b693a3131313b733a31303a227570646174652d323439223b693a3131323b733a373a226164642d323439223b693a3131333b733a323a222d30223b693a3131343b733a31303a2264656c6574652d323434223b693a3131353b733a383a22766965772d323434223b693a3131363b733a31303a227570646174652d323434223b693a3131373b733a373a226164642d323434223b693a3131383b733a323a222d30223b693a3131393b733a31363a226974656d5f626172636f64652d323334223b693a3132303b733a33323a2275706c6f61645f666f6f645f6d656e755f696e6772656469656e74732d323334223b693a3132313b733a32303a2275706c6f61645f666f6f645f6d656e752d323334223b693a3132323b733a31393a2261737369676e5f6d6f6469666965722d323334223b693a3132333b733a31363a22766965775f64657461696c732d323334223b693a3132343b733a31303a2264656c6574652d323334223b693a3132353b733a383a22766965772d323334223b693a3132363b733a31303a227570646174652d323334223b693a3132373b733a373a226164642d323334223b693a3132383b733a323a222d30223b693a3132393b733a31303a2264656c6574652d323239223b693a3133303b733a383a22766965772d323239223b693a3133313b733a31303a227570646174652d323239223b693a3133323b733a373a226164642d323239223b693a3133333b733a323a222d30223b693a3133343b733a31363a22766965775f64657461696c732d323233223b693a3133353b733a31303a2264656c6574652d323233223b693a3133363b733a383a22766965772d323233223b693a3133373b733a31303a227570646174652d323233223b693a3133383b733a373a226164642d323233223b693a3133393b733a323a222d30223b693a3134303b733a32313a2275706c6f61645f696e6772656469656e742d323137223b693a3134313b733a31303a2264656c6574652d323137223b693a3134323b733a383a22766965772d323137223b693a3134333b733a31303a227570646174652d323137223b693a3134343b733a373a226164642d323137223b693a3134353b733a323a222d30223b693a3134363b733a31303a2264656c6574652d323132223b693a3134373b733a383a22766965772d323132223b693a3134383b733a31303a227570646174652d323132223b693a3134393b733a373a226164642d323132223b693a3135303b733a323a222d30223b693a3135313b733a31303a2264656c6574652d323037223b693a3135323b733a383a22766965772d323037223b693a3135333b733a31303a227570646174652d323037223b693a3135343b733a373a226164642d323037223b693a3135353b733a323a222d30223b693a3135363b733a383a22766965772d323035223b693a3135373b733a323a222d30223b693a3135383b733a383a22766965772d323033223b693a3135393b733a323a222d30223b693a3136303b733a383a22766965772d323031223b693a3136313b733a323a222d30223b693a3136323b733a383a22766965772d313939223b693a3136333b733a323a222d30223b693a3136343b733a383a22766965772d313937223b693a3136353b733a323a222d30223b693a3136363b733a383a22766965772d313935223b693a3136373b733a323a222d30223b693a3136383b733a383a22766965772d313933223b693a3136393b733a323a222d30223b693a3137303b733a383a22766965772d313931223b693a3137313b733a323a222d30223b693a3137323b733a383a22766965772d313839223b693a3137333b733a323a222d30223b693a3137343b733a383a22766965772d313837223b693a3137353b733a323a222d30223b693a3137363b733a383a22766965772d313835223b693a3137373b733a323a222d30223b693a3137383b733a383a22766965772d313833223b693a3137393b733a323a222d30223b693a3138303b733a383a22766965772d313831223b693a3138313b733a323a222d30223b693a3138323b733a383a22766965772d313739223b693a3138333b733a323a222d30223b693a3138343b733a383a22766965772d313735223b693a3138353b733a323a222d30223b693a3138363b733a383a22766965772d313733223b693a3138373b733a323a222d30223b693a3138383b733a383a22766965772d313731223b693a3138393b733a323a222d30223b693a3139303b733a383a22766965772d313639223b693a3139313b733a323a222d30223b693a3139323b733a383a22766965772d313637223b693a3139333b733a323a222d30223b693a3139343b733a383a22766965772d313635223b693a3139353b733a323a222d30223b693a3139363b733a383a22766965772d313633223b693a3139373b733a323a222d30223b693a3139383b733a383a22766965772d313631223b693a3139393b733a323a222d30223b693a3230303b733a383a22766965772d313539223b693a3230313b733a323a222d30223b693a3230323b733a31303a2264656c6574652d313535223b693a3230333b733a383a22766965772d313535223b693a3230343b733a373a226164642d313535223b693a3230353b733a323a222d30223b693a3230363b733a31303a2264656c6574652d313531223b693a3230373b733a383a22766965772d313531223b693a3230383b733a373a226164642d313531223b693a3230393b733a323a222d30223b693a3231303b733a31303a2264656c6574652d313437223b693a3231313b733a383a22766965772d313437223b693a3231323b733a373a226164642d313437223b693a3231333b733a323a222d30223b693a3231343b733a31303a2264656c6574652d313432223b693a3231353b733a383a22766965772d313432223b693a3231363b733a31303a227570646174652d313432223b693a3231373b733a373a226164642d313432223b693a3231383b733a323a222d30223b693a3231393b733a31363a22766965775f64657461696c732d313337223b693a3232303b733a31303a2264656c6574652d313337223b693a3232313b733a383a22766965772d313337223b693a3232323b733a373a226164642d313337223b693a3232333b733a323a222d30223b693a3232343b733a31363a22766965775f64657461696c732d313331223b693a3232353b733a31303a2264656c6574652d313331223b693a3232363b733a383a22766965772d313331223b693a3232373b733a31303a227570646174652d313331223b693a3232383b733a373a226164642d313331223b693a3232393b733a323a222d30223b693a3233303b733a383a22766965772d313239223b693a3233313b733a323a222d30223b693a3233323b733a31303a2264656c6574652d313233223b693a3233333b733a31363a22766965775f696e766f6963652d313233223b693a3233343b733a31303a22726566756e642d313233223b693a3233353b733a383a22766965772d313233223b693a3233363b733a323a222d30223b693a3233373b733a31303a2264656c6574652d313138223b693a3233383b733a383a22766965772d313138223b693a3233393b733a31303a227570646174652d313138223b693a3234303b733a373a226164642d313138223b693a3234313b733a323a222d30223b693a3234323b733a31363a22766965775f64657461696c732d313132223b693a3234333b733a31303a2264656c6574652d313132223b693a3234343b733a383a22766965772d313132223b693a3234353b733a31303a227570646174652d313132223b693a3234363b733a373a226164642d313132223b693a3234373b733a323a222d30223b693a3234383b733a31363a22766965775f64657461696c732d313036223b693a3234393b733a31303a2264656c6574652d313036223b693a3235303b733a383a22766965772d313036223b693a3235313b733a31303a227570646174652d313036223b693a3235323b733a373a226164642d313036223b693a3235333b733a323a222d30223b693a3235343b733a383a22766965772d313034223b693a3235353b733a323a222d30223b693a3235363b733a383a22656e7465722d3938223b693a3235373b733a393a2264656c6574652d3938223b693a3235383b733a373a22766965772d3938223b693a3235393b733a393a227570646174652d3938223b693a3236303b733a363a226164642d3938223b693a3236313b733a323a222d30223b693a3236323b733a393a22706f735f32332d3733223b693a3236333b733a393a22706f735f32322d3733223b693a3236343b733a393a22706f735f32312d3733223b693a3236353b733a393a22706f735f32302d3733223b693a3236363b733a393a22706f735f31392d3733223b693a3236373b733a393a22706f735f31382d3733223b693a3236383b733a393a22706f735f31372d3733223b693a3236393b733a393a22706f735f31362d3733223b693a3237303b733a393a22706f735f31352d3733223b693a3237313b733a393a22706f735f31342d3733223b693a3237323b733a393a22706f735f31332d3733223b693a3237333b733a393a22706f735f31322d3733223b693a3237343b733a393a22706f735f31312d3733223b693a3237353b733a393a22706f735f31302d3733223b693a3237363b733a383a22706f735f392d3733223b693a3237373b733a383a22706f735f382d3733223b693a3237383b733a383a22706f735f372d3733223b693a3237393b733a383a22706f735f362d3733223b693a3238303b733a383a22706f735f352d3733223b693a3238313b733a383a22706f735f342d3733223b693a3238323b733a383a22706f735f332d3733223b693a3238333b733a383a22706f735f322d3733223b693a3238343b733a383a22706f735f312d3733223b693a3238353b733a323a222d30223b693a3238363b733a383a22656e7465722d3637223b693a3238373b733a393a2264656c6574652d3637223b693a3238383b733a373a22766965772d3637223b693a3238393b733a393a227570646174652d3637223b693a3239303b733a363a226164642d3637223b693a3239313b733a323a222d30223b693a3239323b733a393a227570646174652d3634223b693a3239333b733a323a222d30223b693a3239343b733a31323a22756e696e7374616c6c2d3632223b693a3239353b733a323a222d30223b693a3239363b733a393a227570646174652d3630223b693a3239373b733a323a222d30223b693a3239383b733a393a2264656c6574652d3535223b693a3239393b733a373a22766965772d3535223b693a3330303b733a393a227570646174652d3535223b693a3330313b733a363a226164642d3535223b693a3330323b733a323a222d30223b693a3330333b733a31333a227570646174655f7461782d3532223b693a3330343b733a323a222d30223b693a3330353b733a393a227570646174652d3439223b693a3330363b733a323a222d30223b693a3330373b733a393a2264656c6574652d3335223b693a3330383b733a373a22766965772d3335223b693a3330393b733a393a227570646174652d3335223b693a3331303b733a363a226164642d3335223b693a3331313b733a323a222d30223b693a3331323b733a393a227570646174652d3331223b693a3331333b733a373a22766965772d3331223b693a3331343b733a323a222d30223b693a3331353b733a393a2264656c6574652d3236223b693a3331363b733a373a22766965772d3236223b693a3331373b733a393a227570646174652d3236223b693a3331383b733a363a226164642d3236223b693a3331393b733a323a222d30223b693a3332303b733a393a2264656c6574652d3232223b693a3332313b733a373a22766965772d3232223b693a3332323b733a363a226164642d3232223b693a3332333b733a323a222d30223b693a3332343b733a31373a22626c6f636b5f616c6c5f757365722d3135223b693a3332353b733a31353a2273686f775f6f75746c6574732d3135223b693a3332363b733a393a2264656c6574652d3135223b693a3332373b733a373a22766965772d3135223b693a3332383b733a393a227570646174652d3135223b693a3332393b733a363a226164642d3135223b693a3333303b733a323a222d30223b693a3333313b733a393a227570646174652d3132223b693a3333323b733a373a22766965772d3132223b693a3333333b733a323a222d30223b693a3333343b733a383a227570646174652d39223b693a3333353b733a363a22766965772d39223b693a3333363b733a323a222d30223b693a3333373b733a383a227570646174652d36223b693a3333383b733a323a222d30223b693a3333393b733a383a227570646174652d33223b693a3334303b733a363a22766965772d33223b693a3334313b733a323a222d30223b693a3334323b733a363a22766965772d31223b693a3334333b733a323a222d30223b7d757365725f69647c733a313a2231223b6c616e67756167657c733a373a22656e676c697368223b64657369676e6174696f6e7c733a31313a2253757065722041646d696e223b66756c6c5f6e616d657c733a31303a2241646d696e2055736572223b73686f72745f6e616d657c733a313a2261223b70686f6e657c733a32363a22303331332d343336373431372020303334382d35353637343137223b656d61696c5f616464726573737c733a31353a2261646d696e4061646d696e2e636f6d223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b73657373696f6e5f6f75746c6574737c733a313a2232223b6163746976655f6d656e755f746d707c733a303a22223b63757272656e63797c733a333a22504b52223b7a6f6e655f6e616d657c733a31323a22417369612f4b617261636869223b646174655f666f726d61747c733a353a22592f6d2f64223b627573696e6573735f6e616d657c733a33323a22436865657a792042697465204d412d4d412026616d703b616d703b20536f6e73223b776562736974657c733a31303a22666972656170702e6363223b63757272656e63795f706f736974696f6e7c733a31333a224265666f726520416d6f756e74223b707265636973696f6e7c733a313a2232223b64656661756c745f637573746f6d65727c733a313a2231223b6578706f72745f6461696c795f73616c657c733a363a22656e61626c65223b736572766963655f616d6f756e747c733a303a22223b74616b655f617761795f736572766963655f6368617267657c733a303a22223b64656c69766572795f616d6f756e747c733a303a22223b7461785f747970657c733a313a2231223b646563696d616c735f736570617261746f727c733a313a222e223b74686f7573616e64735f736570617261746f727c733a313a222c223b6f70656e5f636173685f6472617765725f7768656e5f7072696e74696e675f696e766f6963657c733a323a224e6f223b7768656e5f636c69636b696e675f6f6e5f6974656d5f696e5f706f737c733a313a2232223b69735f726f756e64696e675f656e61626c657c733a313a2230223b617474656e64616e63655f747970657c733a313a2232223b64656661756c745f6f726465725f747970657c733a313a2231223b69735f6c6f79616c74795f656e61626c657c733a373a2264697361626c65223b7072655f6f725f706f73745f7061796d656e747c733a313a2231223b6d696e696d756d5f706f696e745f746f5f72656465656d7c733a313a2230223b6c6f79616c74795f726174657c733a333a22302e31223b73706c69745f62696c6c7c733a313a2231223b706c6163655f6f726465725f746f6f6c7469707c733a343a2273686f77223b666f6f645f6d656e755f746f6f6c7469707c733a343a2273686f77223b7461626c655f62675f636f6c6f727c733a31303a227461626c655f62675f31223b6b6f745f7072696e745f6f6e6c696e655f73656c665f6f726465727c733a313a2231223b64656661756c745f7061796d656e747c733a313a2231223b696e766f6963655f666f6f7465727c733a32363a225468616e6b20796f7520666f72207669736974696e6720757321223b696e766f6963655f6c6f676f7c733a33373a2237353861646564383439306236356465626361613133353137343731316431392e6a706567223b6c616e67756167655f6d616e69666573746f7c733a393a22726576686762726576223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f7469746c657c733a31313a224c6f63616c205461786573223b7461785f726567697374726174696f6e5f6e6f7c733a383a223332313332353837223b7461785f69735f6773747c733a323a224e6f223b6170706c795f6f6e5f64656c69766572795f6368617267657c733a313a2231223b73746174655f636f64657c733a373a2230393331323332223b6c6f67696e5f747970657c733a313a2231223b5f5f63695f766172737c613a323a7b733a31313a22657863657074696f6e5f32223b733a333a226f6c64223b733a393a22657863657074696f6e223b733a333a226f6c64223b7d6f75746c65745f69647c733a313a2231223b6f75746c65745f6e616d657c733a31313a224368657a7a792042697465223b616464726573737c733a35323a22436865657a792042697465204d412d4d412026616d703b20536f6e732020506c617a6120536861682044657261692c2053776174223b656d61696c7c733a303a22223b6f6e6c696e655f6f726465725f6d6f64756c657c733a313a2232223b64656661756c745f7761697465727c733a313a2233223b69735f7761697465727c733a323a224e6f223b636f756e7465725f69647c733a313a2231223b636f756e7465725f6e616d657c733a323a223031223b7072696e7465725f69647c733a313a2231223b706174687c733a303a22223b7469746c657c733a373a225072696e746572223b747970657c733a303a22223b636861726163746572735f7065725f6c696e657c733a313a2230223b7072696e7465725f69705f616464726573737c733a303a22223b7072696e7465725f706f72747c733a303a22223b7072696e74696e675f63686f6963657c733a31373a227765625f62726f777365725f706f707570223b697076666f75725f616464726573737c733a303a22223b7072696e745f666f726d61747c733a343a2238306d6d223b696e765f71725f636f64655f656e61626c655f7374617475737c733a363a22456e61626c65223b62696c6c5f7072696e7465725f69647c733a313a2231223b706174685f62696c6c7c733a303a22223b7469746c655f62696c6c7c733a373a225072696e746572223b747970655f62696c6c7c733a303a22223b636861726163746572735f7065725f6c696e655f62696c6c7c733a313a2230223b7072696e7465725f69705f616464726573735f62696c6c7c733a303a22223b7072696e7465725f706f72745f62696c6c7c733a303a22223b7072696e74696e675f63686f6963655f62696c6c7c733a31373a227765625f62726f777365725f706f707570223b697076666f75725f616464726573735f62696c6c7c733a303a22223b7072696e745f666f726d61745f62696c6c7c733a343a2238306d6d223b696e765f71725f636f64655f656e61626c655f7374617475735f62696c6c7c733a363a22456e61626c65223b6163746976655f6c6f67696e5f627574746f6e7c733a313a2231223b);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_settings`
--

CREATE TABLE `tbl_settings` (
  `id` int NOT NULL,
  `site_name` varchar(300) DEFAULT NULL,
  `footer` varchar(300) DEFAULT NULL,
  `system_logo` text,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_settings`
--

INSERT INTO `tbl_settings` (`id`, `site_name`, `footer`, `system_logo`, `company_id`, `del_status`) VALUES
(4, 'iRestora PLUS - Next Gen Restaurant POS', 'iRestora PLUS - Next Gen Restaurant POS', '93ddd1cfd25f29986c3815608532212f.png', 1, 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_suppliers`
--

CREATE TABLE `tbl_suppliers` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `contact_person` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live',
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supplier_payments`
--

CREATE TABLE `tbl_supplier_payments` (
  `id` int NOT NULL,
  `date` date DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live',
  `counter_id` int NOT NULL DEFAULT '0',
  `payment_id` int NOT NULL DEFAULT '0',
  `added_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tables`
--

CREATE TABLE `tbl_tables` (
  `id` int NOT NULL,
  `area` int DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `sit_capacity` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live',
  `is_setting` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_tables`
--

INSERT INTO `tbl_tables` (`id`, `area`, `name`, `sit_capacity`, `position`, `description`, `user_id`, `outlet_id`, `company_id`, `del_status`, `is_setting`) VALUES
(1, 1, 'Table 1', '4', '', '', 1, 1, 1, 'Live', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_time_zone`
--

CREATE TABLE `tbl_time_zone` (
  `id` int NOT NULL,
  `country_code` varchar(2) DEFAULT NULL,
  `zone_name` varchar(35) DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_time_zone`
--

INSERT INTO `tbl_time_zone` (`id`, `country_code`, `zone_name`, `del_status`) VALUES
(1, 'AD', 'Europe/Andorra', 'Live'),
(2, 'AE', 'Asia/Dubai', 'Live'),
(3, 'AF', 'Asia/Kabul', 'Live'),
(4, 'AG', 'America/Antigua', 'Live'),
(5, 'AI', 'America/Anguilla', 'Live'),
(6, 'AL', 'Europe/Tirane', 'Live'),
(7, 'AM', 'Asia/Yerevan', 'Live'),
(8, 'AO', 'Africa/Luanda', 'Live'),
(9, 'AQ', 'Antarctica/McMurdo', 'Live'),
(10, 'AQ', 'Antarctica/Casey', 'Live'),
(11, 'AQ', 'Antarctica/Davis', 'Live'),
(12, 'AQ', 'Antarctica/DumontDUrville', 'Live'),
(13, 'AQ', 'Antarctica/Mawson', 'Live'),
(14, 'AQ', 'Antarctica/Palmer', 'Live'),
(15, 'AQ', 'Antarctica/Rothera', 'Live'),
(16, 'AQ', 'Antarctica/Syowa', 'Live'),
(17, 'AQ', 'Antarctica/Troll', 'Live'),
(18, 'AQ', 'Antarctica/Vostok', 'Live'),
(19, 'AR', 'America/Argentina/Buenos_Aires', 'Live'),
(20, 'AR', 'America/Argentina/Cordoba', 'Live'),
(21, 'AR', 'America/Argentina/Salta', 'Live'),
(22, 'AR', 'America/Argentina/Jujuy', 'Live'),
(23, 'AR', 'America/Argentina/Tucuman', 'Live'),
(24, 'AR', 'America/Argentina/Catamarca', 'Live'),
(25, 'AR', 'America/Argentina/La_Rioja', 'Live'),
(26, 'AR', 'America/Argentina/San_Juan', 'Live'),
(27, 'AR', 'America/Argentina/Mendoza', 'Live'),
(28, 'AR', 'America/Argentina/San_Luis', 'Live'),
(29, 'AR', 'America/Argentina/Rio_Gallegos', 'Live'),
(30, 'AR', 'America/Argentina/Ushuaia', 'Live'),
(31, 'AS', 'Pacific/Pago_Pago', 'Live'),
(32, 'AT', 'Europe/Vienna', 'Live'),
(33, 'AU', 'Australia/Lord_Howe', 'Live'),
(34, 'AU', 'Antarctica/Macquarie', 'Live'),
(35, 'AU', 'Australia/Hobart', 'Live'),
(36, 'AU', 'Australia/Currie', 'Live'),
(37, 'AU', 'Australia/Melbourne', 'Live'),
(38, 'AU', 'Australia/Sydney', 'Live'),
(39, 'AU', 'Australia/Broken_Hill', 'Live'),
(40, 'AU', 'Australia/Brisbane', 'Live'),
(41, 'AU', 'Australia/Lindeman', 'Live'),
(42, 'AU', 'Australia/Adelaide', 'Live'),
(43, 'AU', 'Australia/Darwin', 'Live'),
(44, 'AU', 'Australia/Perth', 'Live'),
(45, 'AU', 'Australia/Eucla', 'Live'),
(46, 'AW', 'America/Aruba', 'Live'),
(47, 'AX', 'Europe/Mariehamn', 'Live'),
(48, 'AZ', 'Asia/Baku', 'Live'),
(49, 'BA', 'Europe/Sarajevo', 'Live'),
(50, 'BB', 'America/Barbados', 'Live'),
(51, 'BD', 'Asia/Dhaka', 'Live'),
(52, 'BE', 'Europe/Brussels', 'Live'),
(53, 'BF', 'Africa/Ouagadougou', 'Live'),
(54, 'BG', 'Europe/Sofia', 'Live'),
(55, 'BH', 'Asia/Bahrain', 'Live'),
(56, 'BI', 'Africa/Bujumbura', 'Live'),
(57, 'BJ', 'Africa/Porto-Novo', 'Live'),
(58, 'BL', 'America/St_Barthelemy', 'Live'),
(59, 'BM', 'Atlantic/Bermuda', 'Live'),
(60, 'BN', 'Asia/Brunei', 'Live'),
(61, 'BO', 'America/La_Paz', 'Live'),
(62, 'BQ', 'America/Kralendijk', 'Live'),
(63, 'BR', 'America/Noronha', 'Live'),
(64, 'BR', 'America/Belem', 'Live'),
(65, 'BR', 'America/Fortaleza', 'Live'),
(66, 'BR', 'America/Recife', 'Live'),
(67, 'BR', 'America/Araguaina', 'Live'),
(68, 'BR', 'America/Maceio', 'Live'),
(69, 'BR', 'America/Bahia', 'Live'),
(70, 'BR', 'America/Sao_Paulo', 'Live'),
(71, 'BR', 'America/Campo_Grande', 'Live'),
(72, 'BR', 'America/Cuiaba', 'Live'),
(73, 'BR', 'America/Santarem', 'Live'),
(74, 'BR', 'America/Porto_Velho', 'Live'),
(75, 'BR', 'America/Boa_Vista', 'Live'),
(76, 'BR', 'America/Manaus', 'Live'),
(77, 'BR', 'America/Eirunepe', 'Live'),
(78, 'BR', 'America/Rio_Branco', 'Live'),
(79, 'BS', 'America/Nassau', 'Live'),
(80, 'BT', 'Asia/Thimphu', 'Live'),
(81, 'BW', 'Africa/Gaborone', 'Live'),
(82, 'BY', 'Europe/Minsk', 'Live'),
(83, 'BZ', 'America/Belize', 'Live'),
(84, 'CA', 'America/St_Johns', 'Live'),
(85, 'CA', 'America/Halifax', 'Live'),
(86, 'CA', 'America/Glace_Bay', 'Live'),
(87, 'CA', 'America/Moncton', 'Live'),
(88, 'CA', 'America/Goose_Bay', 'Live'),
(89, 'CA', 'America/Blanc-Sablon', 'Live'),
(90, 'CA', 'America/Toronto', 'Live'),
(91, 'CA', 'America/Nipigon', 'Live'),
(92, 'CA', 'America/Thunder_Bay', 'Live'),
(93, 'CA', 'America/Iqaluit', 'Live'),
(94, 'CA', 'America/Pangnirtung', 'Live'),
(95, 'CA', 'America/Atikokan', 'Live'),
(96, 'CA', 'America/Winnipeg', 'Live'),
(97, 'CA', 'America/Rainy_River', 'Live'),
(98, 'CA', 'America/Resolute', 'Live'),
(99, 'CA', 'America/Rankin_Inlet', 'Live'),
(100, 'CA', 'America/Regina', 'Live'),
(101, 'CA', 'America/Swift_Current', 'Live'),
(102, 'CA', 'America/Edmonton', 'Live'),
(103, 'CA', 'America/Cambridge_Bay', 'Live'),
(104, 'CA', 'America/Yellowknife', 'Live'),
(105, 'CA', 'America/Inuvik', 'Live'),
(106, 'CA', 'America/Creston', 'Live'),
(107, 'CA', 'America/Dawson_Creek', 'Live'),
(108, 'CA', 'America/Fort_Nelson', 'Live'),
(109, 'CA', 'America/Vancouver', 'Live'),
(110, 'CA', 'America/Whitehorse', 'Live'),
(111, 'CA', 'America/Dawson', 'Live'),
(112, 'CC', 'Indian/Cocos', 'Live'),
(113, 'CD', 'Africa/Kinshasa', 'Live'),
(114, 'CD', 'Africa/Lubumbashi', 'Live'),
(115, 'CF', 'Africa/Bangui', 'Live'),
(116, 'CG', 'Africa/Brazzaville', 'Live'),
(117, 'CH', 'Europe/Zurich', 'Live'),
(118, 'CI', 'Africa/Abidjan', 'Live'),
(119, 'CK', 'Pacific/Rarotonga', 'Live'),
(120, 'CL', 'America/Santiago', 'Live'),
(121, 'CL', 'America/Punta_Arenas', 'Live'),
(122, 'CL', 'Pacific/Easter', 'Live'),
(123, 'CM', 'Africa/Douala', 'Live'),
(124, 'CN', 'Asia/Shanghai', 'Live'),
(125, 'CN', 'Asia/Urumqi', 'Live'),
(126, 'CO', 'America/Bogota', 'Live'),
(127, 'CR', 'America/Costa_Rica', 'Live'),
(128, 'CU', 'America/Havana', 'Live'),
(129, 'CV', 'Atlantic/Cape_Verde', 'Live'),
(130, 'CW', 'America/Curacao', 'Live'),
(131, 'CX', 'Indian/Christmas', 'Live'),
(132, 'CY', 'Asia/Nicosia', 'Live'),
(133, 'CY', 'Asia/Famagusta', 'Live'),
(134, 'CZ', 'Europe/Prague', 'Live'),
(135, 'DE', 'Europe/Berlin', 'Live'),
(136, 'DE', 'Europe/Busingen', 'Live'),
(137, 'DJ', 'Africa/Djibouti', 'Live'),
(138, 'DK', 'Europe/Copenhagen', 'Live'),
(139, 'DM', 'America/Dominica', 'Live'),
(140, 'DO', 'America/Santo_Domingo', 'Live'),
(141, 'DZ', 'Africa/Algiers', 'Live'),
(142, 'EC', 'America/Guayaquil', 'Live'),
(143, 'EC', 'Pacific/Galapagos', 'Live'),
(144, 'EE', 'Europe/Tallinn', 'Live'),
(145, 'EG', 'Africa/Cairo', 'Live'),
(146, 'EH', 'Africa/El_Aaiun', 'Live'),
(147, 'ER', 'Africa/Asmara', 'Live'),
(148, 'ES', 'Europe/Madrid', 'Live'),
(149, 'ES', 'Africa/Ceuta', 'Live'),
(150, 'ES', 'Atlantic/Canary', 'Live'),
(151, 'ET', 'Africa/Addis_Ababa', 'Live'),
(152, 'FI', 'Europe/Helsinki', 'Live'),
(153, 'FJ', 'Pacific/Fiji', 'Live'),
(154, 'FK', 'Atlantic/Stanley', 'Live'),
(155, 'FM', 'Pacific/Chuuk', 'Live'),
(156, 'FM', 'Pacific/Pohnpei', 'Live'),
(157, 'FM', 'Pacific/Kosrae', 'Live'),
(158, 'FO', 'Atlantic/Faroe', 'Live'),
(159, 'FR', 'Europe/Paris', 'Live'),
(160, 'GA', 'Africa/Libreville', 'Live'),
(161, 'GB', 'Europe/London', 'Live'),
(162, 'GD', 'America/Grenada', 'Live'),
(163, 'GE', 'Asia/Tbilisi', 'Live'),
(164, 'GF', 'America/Cayenne', 'Live'),
(165, 'GG', 'Europe/Guernsey', 'Live'),
(166, 'GH', 'Africa/Accra', 'Live'),
(167, 'GI', 'Europe/Gibraltar', 'Live'),
(168, 'GL', 'America/Godthab', 'Live'),
(169, 'GL', 'America/Danmarkshavn', 'Live'),
(170, 'GL', 'America/Scoresbysund', 'Live'),
(171, 'GL', 'America/Thule', 'Live'),
(172, 'GM', 'Africa/Banjul', 'Live'),
(173, 'GN', 'Africa/Conakry', 'Live'),
(174, 'GP', 'America/Guadeloupe', 'Live'),
(175, 'GQ', 'Africa/Malabo', 'Live'),
(176, 'GR', 'Europe/Athens', 'Live'),
(177, 'GS', 'Atlantic/South_Georgia', 'Live'),
(178, 'GT', 'America/Guatemala', 'Live'),
(179, 'GU', 'Pacific/Guam', 'Live'),
(180, 'GW', 'Africa/Bissau', 'Live'),
(181, 'GY', 'America/Guyana', 'Live'),
(182, 'HK', 'Asia/Hong_Kong', 'Live'),
(183, 'HN', 'America/Tegucigalpa', 'Live'),
(184, 'HR', 'Europe/Zagreb', 'Live'),
(185, 'HT', 'America/Port-au-Prince', 'Live'),
(186, 'HU', 'Europe/Budapest', 'Live'),
(187, 'ID', 'Asia/Jakarta', 'Live'),
(188, 'ID', 'Asia/Pontianak', 'Live'),
(189, 'ID', 'Asia/Makassar', 'Live'),
(190, 'ID', 'Asia/Jayapura', 'Live'),
(191, 'IE', 'Europe/Dublin', 'Live'),
(192, 'IL', 'Asia/Jerusalem', 'Live'),
(193, 'IM', 'Europe/Isle_of_Man', 'Live'),
(194, 'IN', 'Asia/Kolkata', 'Live'),
(195, 'IO', 'Indian/Chagos', 'Live'),
(196, 'IQ', 'Asia/Baghdad', 'Live'),
(197, 'IR', 'Asia/Tehran', 'Live'),
(198, 'IS', 'Atlantic/Reykjavik', 'Live'),
(199, 'IT', 'Europe/Rome', 'Live'),
(200, 'JE', 'Europe/Jersey', 'Live'),
(201, 'JM', 'America/Jamaica', 'Live'),
(202, 'JO', 'Asia/Amman', 'Live'),
(203, 'JP', 'Asia/Tokyo', 'Live'),
(204, 'KE', 'Africa/Nairobi', 'Live'),
(205, 'KG', 'Asia/Bishkek', 'Live'),
(206, 'KH', 'Asia/Phnom_Penh', 'Live'),
(207, 'KI', 'Pacific/Tarawa', 'Live'),
(208, 'KI', 'Pacific/Enderbury', 'Live'),
(209, 'KI', 'Pacific/Kiritimati', 'Live'),
(210, 'KM', 'Indian/Comoro', 'Live'),
(211, 'KN', 'America/St_Kitts', 'Live'),
(212, 'KP', 'Asia/Pyongyang', 'Live'),
(213, 'KR', 'Asia/Seoul', 'Live'),
(214, 'KW', 'Asia/Kuwait', 'Live'),
(215, 'KY', 'America/Cayman', 'Live'),
(216, 'KZ', 'Asia/Almaty', 'Live'),
(217, 'KZ', 'Asia/Qyzylorda', 'Live'),
(218, 'KZ', 'Asia/Aqtobe', 'Live'),
(219, 'KZ', 'Asia/Aqtau', 'Live'),
(220, 'KZ', 'Asia/Atyrau', 'Live'),
(221, 'KZ', 'Asia/Oral', 'Live'),
(222, 'LA', 'Asia/Vientiane', 'Live'),
(223, 'LB', 'Asia/Beirut', 'Live'),
(224, 'LC', 'America/St_Lucia', 'Live'),
(225, 'LI', 'Europe/Vaduz', 'Live'),
(226, 'LK', 'Asia/Colombo', 'Live'),
(227, 'LR', 'Africa/Monrovia', 'Live'),
(228, 'LS', 'Africa/Maseru', 'Live'),
(229, 'LT', 'Europe/Vilnius', 'Live'),
(230, 'LU', 'Europe/Luxembourg', 'Live'),
(231, 'LV', 'Europe/Riga', 'Live'),
(232, 'LY', 'Africa/Tripoli', 'Live'),
(233, 'MA', 'Africa/Casablanca', 'Live'),
(234, 'MC', 'Europe/Monaco', 'Live'),
(235, 'MD', 'Europe/Chisinau', 'Live'),
(236, 'ME', 'Europe/Podgorica', 'Live'),
(237, 'MF', 'America/Marigot', 'Live'),
(238, 'MG', 'Indian/Antananarivo', 'Live'),
(239, 'MH', 'Pacific/Majuro', 'Live'),
(240, 'MH', 'Pacific/Kwajalein', 'Live'),
(241, 'MK', 'Europe/Skopje', 'Live'),
(242, 'ML', 'Africa/Bamako', 'Live'),
(243, 'MM', 'Asia/Yangon', 'Live'),
(244, 'MN', 'Asia/Ulaanbaatar', 'Live'),
(245, 'MN', 'Asia/Hovd', 'Live'),
(246, 'MN', 'Asia/Choibalsan', 'Live'),
(247, 'MO', 'Asia/Macau', 'Live'),
(248, 'MP', 'Pacific/Saipan', 'Live'),
(249, 'MQ', 'America/Martinique', 'Live'),
(250, 'MR', 'Africa/Nouakchott', 'Live'),
(251, 'MS', 'America/Montserrat', 'Live'),
(252, 'MT', 'Europe/Malta', 'Live'),
(253, 'MU', 'Indian/Mauritius', 'Live'),
(254, 'MV', 'Indian/Maldives', 'Live'),
(255, 'MW', 'Africa/Blantyre', 'Live'),
(256, 'MX', 'America/Mexico_City', 'Live'),
(257, 'MX', 'America/Cancun', 'Live'),
(258, 'MX', 'America/Merida', 'Live'),
(259, 'MX', 'America/Monterrey', 'Live'),
(260, 'MX', 'America/Matamoros', 'Live'),
(261, 'MX', 'America/Mazatlan', 'Live'),
(262, 'MX', 'America/Chihuahua', 'Live'),
(263, 'MX', 'America/Ojinaga', 'Live'),
(264, 'MX', 'America/Hermosillo', 'Live'),
(265, 'MX', 'America/Tijuana', 'Live'),
(266, 'MX', 'America/Bahia_Banderas', 'Live'),
(267, 'MY', 'Asia/Kuala_Lumpur', 'Live'),
(268, 'MY', 'Asia/Kuching', 'Live'),
(269, 'MZ', 'Africa/Maputo', 'Live'),
(270, 'NA', 'Africa/Windhoek', 'Live'),
(271, 'NC', 'Pacific/Noumea', 'Live'),
(272, 'NE', 'Africa/Niamey', 'Live'),
(273, 'NF', 'Pacific/Norfolk', 'Live'),
(274, 'NG', 'Africa/Lagos', 'Live'),
(275, 'NI', 'America/Managua', 'Live'),
(276, 'NL', 'Europe/Amsterdam', 'Live'),
(277, 'NO', 'Europe/Oslo', 'Live'),
(278, 'NP', 'Asia/Kathmandu', 'Live'),
(279, 'NR', 'Pacific/Nauru', 'Live'),
(280, 'NU', 'Pacific/Niue', 'Live'),
(281, 'NZ', 'Pacific/Auckland', 'Live'),
(282, 'NZ', 'Pacific/Chatham', 'Live'),
(283, 'OM', 'Asia/Muscat', 'Live'),
(284, 'PA', 'America/Panama', 'Live'),
(285, 'PE', 'America/Lima', 'Live'),
(286, 'PF', 'Pacific/Tahiti', 'Live'),
(287, 'PF', 'Pacific/Marquesas', 'Live'),
(288, 'PF', 'Pacific/Gambier', 'Live'),
(289, 'PG', 'Pacific/Port_Moresby', 'Live'),
(290, 'PG', 'Pacific/Bougainville', 'Live'),
(291, 'PH', 'Asia/Manila', 'Live'),
(292, 'PK', 'Asia/Karachi', 'Live'),
(293, 'PL', 'Europe/Warsaw', 'Live'),
(294, 'PM', 'America/Miquelon', 'Live'),
(295, 'PN', 'Pacific/Pitcairn', 'Live'),
(296, 'PR', 'America/Puerto_Rico', 'Live'),
(297, 'PS', 'Asia/Gaza', 'Live'),
(298, 'PS', 'Asia/Hebron', 'Live'),
(299, 'PT', 'Europe/Lisbon', 'Live'),
(300, 'PT', 'Atlantic/Madeira', 'Live'),
(301, 'PT', 'Atlantic/Azores', 'Live'),
(302, 'PW', 'Pacific/Palau', 'Live'),
(303, 'PY', 'America/Asuncion', 'Live'),
(304, 'QA', 'Asia/Qatar', 'Live'),
(305, 'RE', 'Indian/Reunion', 'Live'),
(306, 'RO', 'Europe/Bucharest', 'Live'),
(307, 'RS', 'Europe/Belgrade', 'Live'),
(308, 'RU', 'Europe/Kaliningrad', 'Live'),
(309, 'RU', 'Europe/Moscow', 'Live'),
(310, 'RU', 'Europe/Simferopol', 'Live'),
(311, 'RU', 'Europe/Volgograd', 'Live'),
(312, 'RU', 'Europe/Kirov', 'Live'),
(313, 'RU', 'Europe/Astrakhan', 'Live'),
(314, 'RU', 'Europe/Saratov', 'Live'),
(315, 'RU', 'Europe/Ulyanovsk', 'Live'),
(316, 'RU', 'Europe/Samara', 'Live'),
(317, 'RU', 'Asia/Yekaterinburg', 'Live'),
(318, 'RU', 'Asia/Omsk', 'Live'),
(319, 'RU', 'Asia/Novosibirsk', 'Live'),
(320, 'RU', 'Asia/Barnaul', 'Live'),
(321, 'RU', 'Asia/Tomsk', 'Live'),
(322, 'RU', 'Asia/Novokuznetsk', 'Live'),
(323, 'RU', 'Asia/Krasnoyarsk', 'Live'),
(324, 'RU', 'Asia/Irkutsk', 'Live'),
(325, 'RU', 'Asia/Chita', 'Live'),
(326, 'RU', 'Asia/Yakutsk', 'Live'),
(327, 'RU', 'Asia/Khandyga', 'Live'),
(328, 'RU', 'Asia/Vladivostok', 'Live'),
(329, 'RU', 'Asia/Ust-Nera', 'Live'),
(330, 'RU', 'Asia/Magadan', 'Live'),
(331, 'RU', 'Asia/Sakhalin', 'Live'),
(332, 'RU', 'Asia/Srednekolymsk', 'Live'),
(333, 'RU', 'Asia/Kamchatka', 'Live'),
(334, 'RU', 'Asia/Anadyr', 'Live'),
(335, 'RW', 'Africa/Kigali', 'Live'),
(336, 'SA', 'Asia/Riyadh', 'Live'),
(337, 'SB', 'Pacific/Guadalcanal', 'Live'),
(338, 'SC', 'Indian/Mahe', 'Live'),
(339, 'SD', 'Africa/Khartoum', 'Live'),
(340, 'SE', 'Europe/Stockholm', 'Live'),
(341, 'SG', 'Asia/Singapore', 'Live'),
(342, 'SH', 'Atlantic/St_Helena', 'Live'),
(343, 'SI', 'Europe/Ljubljana', 'Live'),
(344, 'SJ', 'Arctic/Longyearbyen', 'Live'),
(345, 'SK', 'Europe/Bratislava', 'Live'),
(346, 'SL', 'Africa/Freetown', 'Live'),
(347, 'SM', 'Europe/San_Marino', 'Live'),
(348, 'SN', 'Africa/Dakar', 'Live'),
(349, 'SO', 'Africa/Mogadishu', 'Live'),
(350, 'SR', 'America/Paramaribo', 'Live'),
(351, 'SS', 'Africa/Juba', 'Live'),
(352, 'ST', 'Africa/Sao_Tome', 'Live'),
(353, 'SV', 'America/El_Salvador', 'Live'),
(354, 'SX', 'America/Lower_Princes', 'Live'),
(355, 'SY', 'Asia/Damascus', 'Live'),
(356, 'SZ', 'Africa/Mbabane', 'Live'),
(357, 'TC', 'America/Grand_Turk', 'Live'),
(358, 'TD', 'Africa/Ndjamena', 'Live'),
(359, 'TF', 'Indian/Kerguelen', 'Live'),
(360, 'TG', 'Africa/Lome', 'Live'),
(361, 'TH', 'Asia/Bangkok', 'Live'),
(362, 'TJ', 'Asia/Dushanbe', 'Live'),
(363, 'TK', 'Pacific/Fakaofo', 'Live'),
(364, 'TL', 'Asia/Dili', 'Live'),
(365, 'TM', 'Asia/Ashgabat', 'Live'),
(366, 'TN', 'Africa/Tunis', 'Live'),
(367, 'TO', 'Pacific/Tongatapu', 'Live'),
(368, 'TR', 'Europe/Istanbul', 'Live'),
(369, 'TT', 'America/Port_of_Spain', 'Live'),
(370, 'TV', 'Pacific/Funafuti', 'Live'),
(371, 'TW', 'Asia/Taipei', 'Live'),
(372, 'TZ', 'Africa/Dar_es_Salaam', 'Live'),
(373, 'UA', 'Europe/Kiev', 'Live'),
(374, 'UA', 'Europe/Uzhgorod', 'Live'),
(375, 'UA', 'Europe/Zaporozhye', 'Live'),
(376, 'UG', 'Africa/Kampala', 'Live'),
(377, 'UM', 'Pacific/Midway', 'Live'),
(378, 'UM', 'Pacific/Wake', 'Live'),
(379, 'US', 'America/New_York', 'Live'),
(380, 'US', 'America/Detroit', 'Live'),
(381, 'US', 'America/Kentucky/Louisville', 'Live'),
(382, 'US', 'America/Kentucky/Monticello', 'Live'),
(383, 'US', 'America/Indiana/Indianapolis', 'Live'),
(384, 'US', 'America/Indiana/Vincennes', 'Live'),
(385, 'US', 'America/Indiana/Winamac', 'Live'),
(386, 'US', 'America/Indiana/Marengo', 'Live'),
(387, 'US', 'America/Indiana/Petersburg', 'Live'),
(388, 'US', 'America/Indiana/Vevay', 'Live'),
(389, 'US', 'America/Chicago', 'Live'),
(390, 'US', 'America/Indiana/Tell_City', 'Live'),
(391, 'US', 'America/Indiana/Knox', 'Live'),
(392, 'US', 'America/Menominee', 'Live'),
(393, 'US', 'America/North_Dakota/Center', 'Live'),
(394, 'US', 'America/North_Dakota/New_Salem', 'Live'),
(395, 'US', 'America/North_Dakota/Beulah', 'Live'),
(396, 'US', 'America/Denver', 'Live'),
(397, 'US', 'America/Boise', 'Live'),
(398, 'US', 'America/Phoenix', 'Live'),
(399, 'US', 'America/Los_Angeles', 'Live'),
(400, 'US', 'America/Anchorage', 'Live'),
(401, 'US', 'America/Juneau', 'Live'),
(402, 'US', 'America/Sitka', 'Live'),
(403, 'US', 'America/Metlakatla', 'Live'),
(404, 'US', 'America/Yakutat', 'Live'),
(405, 'US', 'America/Nome', 'Live'),
(406, 'US', 'America/Adak', 'Live'),
(407, 'US', 'Pacific/Honolulu', 'Live'),
(408, 'UY', 'America/Montevideo', 'Live'),
(409, 'UZ', 'Asia/Samarkand', 'Live'),
(410, 'UZ', 'Asia/Tashkent', 'Live'),
(411, 'VA', 'Europe/Vatican', 'Live'),
(412, 'VC', 'America/St_Vincent', 'Live'),
(413, 'VE', 'America/Caracas', 'Live'),
(414, 'VG', 'America/Tortola', 'Live'),
(415, 'VI', 'America/St_Thomas', 'Live'),
(416, 'VN', 'Asia/Ho_Chi_Minh', 'Live'),
(417, 'VU', 'Pacific/Efate', 'Live'),
(418, 'WF', 'Pacific/Wallis', 'Live'),
(419, 'WS', 'Pacific/Apia', 'Live'),
(420, 'YE', 'Asia/Aden', 'Live'),
(421, 'YT', 'Indian/Mayotte', 'Live'),
(422, 'ZA', 'Africa/Johannesburg', 'Live'),
(423, 'ZM', 'Africa/Lusaka', 'Live'),
(424, 'ZW', 'Africa/Harare', 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transfer`
--

CREATE TABLE `tbl_transfer` (
  `id` int NOT NULL,
  `transfer_type` int NOT NULL DEFAULT '1',
  `reference_no` varchar(50) DEFAULT NULL,
  `date` varchar(15) NOT NULL,
  `received_date` date DEFAULT NULL,
  `note_for_sender` varchar(300) DEFAULT NULL,
  `note_for_receiver` varchar(300) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `from_outlet_id` int DEFAULT NULL,
  `to_outlet_id` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transfer_ingredients`
--

CREATE TABLE `tbl_transfer_ingredients` (
  `id` int NOT NULL,
  `transfer_type` int NOT NULL DEFAULT '1',
  `status` int DEFAULT NULL,
  `ingredient_id` int DEFAULT NULL,
  `quantity_amount` float DEFAULT NULL,
  `unit_price` float DEFAULT NULL,
  `transfer_id` int DEFAULT NULL,
  `from_outlet_id` int DEFAULT NULL,
  `to_outlet_id` int DEFAULT NULL,
  `total_cost` float DEFAULT NULL,
  `single_cost_total` float DEFAULT NULL,
  `single_total_tax` float DEFAULT NULL,
  `single_total_sale_amount` float DEFAULT NULL,
  `total_tax` float DEFAULT NULL,
  `total_sale_amount` float DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transfer_received_ingredients`
--

CREATE TABLE `tbl_transfer_received_ingredients` (
  `id` int NOT NULL,
  `transfer_type` int NOT NULL DEFAULT '1',
  `status` int DEFAULT NULL,
  `ingredient_id` int DEFAULT NULL,
  `quantity_amount` float DEFAULT NULL,
  `unit_price` float DEFAULT NULL,
  `transfer_id` int DEFAULT NULL,
  `from_outlet_id` int DEFAULT NULL,
  `to_outlet_id` int DEFAULT NULL,
  `total_cost` float DEFAULT NULL,
  `single_cost_total` float DEFAULT NULL,
  `single_total_tax` float DEFAULT NULL,
  `single_total_sale_amount` float DEFAULT NULL,
  `total_tax` float DEFAULT NULL,
  `total_sale_amount` float DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_units`
--

CREATE TABLE `tbl_units` (
  `id` int NOT NULL,
  `unit_name` varchar(10) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_units`
--

INSERT INTO `tbl_units` (`id`, `unit_name`, `description`, `company_id`, `del_status`) VALUES
(1, 'Kg', '', 1, 'Live'),
(2, 'Gram', '', 1, 'Live');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int NOT NULL,
  `full_name` varchar(25) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email_address` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `will_login` varchar(20) DEFAULT 'No',
  `role` varchar(25) DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `outlets` varchar(100) DEFAULT NULL,
  `kitchens` varchar(250) DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `account_creation_date` varchar(50) DEFAULT NULL,
  `language` varchar(100) DEFAULT 'english',
  `last_login` varchar(50) DEFAULT NULL,
  `created_id` int DEFAULT NULL,
  `active_status` varchar(25) DEFAULT 'Active',
  `del_status` varchar(10) DEFAULT 'Live',
  `created_date` varchar(20) DEFAULT NULL,
  `question` varchar(250) DEFAULT NULL,
  `answer` varchar(250) DEFAULT NULL,
  `login_pin` varchar(4) DEFAULT NULL,
  `order_receiving_id` int NOT NULL DEFAULT '0',
  `role_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `full_name`, `phone`, `email_address`, `password`, `designation`, `will_login`, `role`, `outlet_id`, `outlets`, `kitchens`, `company_id`, `account_creation_date`, `language`, `last_login`, `created_id`, `active_status`, `del_status`, `created_date`, `question`, `answer`, `login_pin`, `order_receiving_id`, `role_id`) VALUES
(1, 'Admin User', '923428927305', 'admin@admin.com', 'e10adc3949ba59abbe56e057f20f883e', 'Super Admin', 'Yes', 'Admin', 1, '2', NULL, 1, '2018-02-17 07:28:32', 'english', '', NULL, 'Active', 'Live', NULL, 'What is your favorite food?', 'Burger', '1234', 0, NULL),
(2, 'Self Order', '-', '', '', NULL, 'No', NULL, NULL, NULL, NULL, NULL, NULL, 'english', NULL, NULL, 'Active', 'Deleted', NULL, NULL, NULL, NULL, 0, NULL),
(3, 'Waiter', '123456789', 'waiter1@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Waiter', 'Yes', 'User', 1, '1', '1,', 1, NULL, 'french', NULL, 1, 'Active', 'Live', NULL, NULL, NULL, '3333', 4, 0),
(4, 'kamran', '4569854', 'kamran@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Cashier', 'Yes', 'User', 1, '1', '', 1, NULL, 'english', NULL, 1, 'Active', 'Live', NULL, NULL, NULL, '9988', 0, 0),
(5, 'Naveed', '1558744', 'naveed@gmail.com', '6b17920a59f8e2061aaaf3eb1d50c2cc', 'Manager', 'Yes', 'User', 1, '1', '1,', 1, NULL, 'english', NULL, 1, 'Active', 'Live', NULL, NULL, NULL, '4321', 0, 0),
(38, 'cashier', '12312312312', '', '4297f44b13955235245b2497399d7a93', 'Cashier', 'Yes', 'User', 1, '1', '', 1, NULL, 'english', NULL, 1, 'Active', 'Live', NULL, NULL, NULL, '2222', 4, 3),
(39, 'Chef User', '12354789', 'chef@doorsoft.co', 'e10adc3949ba59abbe56e057f20f883e', 'Chef', 'Yes', NULL, 1, '1', '', 1, NULL, 'english', NULL, 1, 'Active', 'Live', NULL, NULL, NULL, '4444', 4, 8),
(46, 'kpc@doorsoft.co', '123546789', 'kpc@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Admin User', 'Yes', 'Admin', NULL, '4', NULL, 4, NULL, 'english', NULL, NULL, 'Active', 'Live', NULL, NULL, NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_menu_access`
--

CREATE TABLE `tbl_user_menu_access` (
  `id` int NOT NULL,
  `menu_id` int DEFAULT '0',
  `user_id` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wastes`
--

CREATE TABLE `tbl_wastes` (
  `id` int NOT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `date` date NOT NULL,
  `total_loss` float(10,2) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live',
  `food_menu_id` int DEFAULT NULL,
  `food_menu_waste_qty` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_waste_ingredients`
--

CREATE TABLE `tbl_waste_ingredients` (
  `id` int NOT NULL,
  `ingredient_id` int DEFAULT NULL,
  `waste_amount` float(10,2) DEFAULT NULL,
  `last_purchase_price` float(10,2) DEFAULT NULL,
  `loss_amount` float(10,2) DEFAULT NULL,
  `waste_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`access_token`);

--
-- Indexes for table `oauth_authorization_codes`
--
ALTER TABLE `oauth_authorization_codes`
  ADD PRIMARY KEY (`authorization_code`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`refresh_token`);

--
-- Indexes for table `oauth_scopes`
--
ALTER TABLE `oauth_scopes`
  ADD PRIMARY KEY (`scope`);

--
-- Indexes for table `oauth_users`
--
ALTER TABLE `oauth_users`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `tbl_access`
--
ALTER TABLE `tbl_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_areas`
--
ALTER TABLE `tbl_areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_attendance`
--
ALTER TABLE `tbl_attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_audit_logs`
--
ALTER TABLE `tbl_audit_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_carts`
--
ALTER TABLE `tbl_carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_combo_food_menus`
--
ALTER TABLE `tbl_combo_food_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_menu_del` (`food_menu_id`,`del_status`);

--
-- Indexes for table `tbl_companies`
--
ALTER TABLE `tbl_companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_contacts`
--
ALTER TABLE `tbl_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_counters`
--
ALTER TABLE `tbl_counters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_customers`
--
ALTER TABLE `tbl_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_customer_address`
--
ALTER TABLE `tbl_customer_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_customer_due_receives`
--
ALTER TABLE `tbl_customer_due_receives`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_delivery_partners`
--
ALTER TABLE `tbl_delivery_partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_denominations`
--
ALTER TABLE `tbl_denominations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_expenses`
--
ALTER TABLE `tbl_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_expense_items`
--
ALTER TABLE `tbl_expense_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_explores`
--
ALTER TABLE `tbl_explores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_food_menus`
--
ALTER TABLE `tbl_food_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_del` (`company_id`,`del_status`),
  ADD KEY `id_del` (`id`,`del_status`);

--
-- Indexes for table `tbl_food_menus_ingredients`
--
ALTER TABLE `tbl_food_menus_ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_food_menus_modifiers`
--
ALTER TABLE `tbl_food_menus_modifiers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_food_menu_categories`
--
ALTER TABLE `tbl_food_menu_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_food_menu_ratings`
--
ALTER TABLE `tbl_food_menu_ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_galleries`
--
ALTER TABLE `tbl_galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_holds`
--
ALTER TABLE `tbl_holds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `os_del_out` (`order_status`,`del_status`,`outlet_id`),
  ADD KEY `id_del_outlet` (`id`,`del_status`,`outlet_id`),
  ADD KEY `outlet_order_status` (`outlet_id`,`order_status`),
  ADD KEY `id_del` (`id`,`del_status`),
  ADD KEY `user_date_time_del_order` (`user_id`,`date_time`,`del_status`,`order_status`),
  ADD KEY `table_id_status` (`table_id`,`order_status`),
  ADD KEY `outlet_id_waiter_id_order_status` (`outlet_id`,`waiter_id`,`order_status`);

--
-- Indexes for table `tbl_holds_details`
--
ALTER TABLE `tbl_holds_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_menu_and_sale_id` (`food_menu_id`,`sales_id`);

--
-- Indexes for table `tbl_holds_details_modifiers`
--
ALTER TABLE `tbl_holds_details_modifiers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_id_details_id` (`sales_id`,`sales_details_id`);

--
-- Indexes for table `tbl_holds_table`
--
ALTER TABLE `tbl_holds_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_ingredients`
--
ALTER TABLE `tbl_ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `del` (`del_status`);

--
-- Indexes for table `tbl_ingredient_categories`
--
ALTER TABLE `tbl_ingredient_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_inventory_adjustment`
--
ALTER TABLE `tbl_inventory_adjustment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_inventory_adjustment_ingredients`
--
ALTER TABLE `tbl_inventory_adjustment_ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_kitchens`
--
ALTER TABLE `tbl_kitchens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_kitchen_categories`
--
ALTER TABLE `tbl_kitchen_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_kitchen_sales`
--
ALTER TABLE `tbl_kitchen_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `os_del_out` (`order_status`,`del_status`,`outlet_id`),
  ADD KEY `id_del_outlet` (`id`,`del_status`,`outlet_id`),
  ADD KEY `outlet_order_status` (`outlet_id`,`order_status`),
  ADD KEY `id_del` (`id`,`del_status`),
  ADD KEY `user_date_time_del_order` (`user_id`,`date_time`,`del_status`,`order_status`),
  ADD KEY `table_id_status` (`table_id`,`order_status`),
  ADD KEY `outlet_id_waiter_id_order_status` (`outlet_id`,`waiter_id`,`order_status`);

--
-- Indexes for table `tbl_kitchen_sales_details`
--
ALTER TABLE `tbl_kitchen_sales_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_menu_and_sale_id` (`food_menu_id`,`sales_id`);

--
-- Indexes for table `tbl_kitchen_sales_details_modifiers`
--
ALTER TABLE `tbl_kitchen_sales_details_modifiers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_id_details_id` (`sales_id`,`sales_details_id`);

--
-- Indexes for table `tbl_main_modules`
--
ALTER TABLE `tbl_main_modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_modifiers`
--
ALTER TABLE `tbl_modifiers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_modifier_ingredients`
--
ALTER TABLE `tbl_modifier_ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_multiple_currencies`
--
ALTER TABLE `tbl_multiple_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_notifications`
--
ALTER TABLE `tbl_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_notification_bar_kitchen_panel`
--
ALTER TABLE `tbl_notification_bar_kitchen_panel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_orders_table`
--
ALTER TABLE `tbl_orders_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_outlets`
--
ALTER TABLE `tbl_outlets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_payment_histories`
--
ALTER TABLE `tbl_payment_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_payment_methods`
--
ALTER TABLE `tbl_payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_plugins`
--
ALTER TABLE `tbl_plugins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_premade_ingredients`
--
ALTER TABLE `tbl_premade_ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_menu_del` (`pre_made_id`,`del_status`);

--
-- Indexes for table `tbl_pricing_plans`
--
ALTER TABLE `tbl_pricing_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_printers`
--
ALTER TABLE `tbl_printers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_production`
--
ALTER TABLE `tbl_production`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_production_ingredients`
--
ALTER TABLE `tbl_production_ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_promotions`
--
ALTER TABLE `tbl_promotions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_purchase`
--
ALTER TABLE `tbl_purchase`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_purchase_ingredients`
--
ALTER TABLE `tbl_purchase_ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_register`
--
ALTER TABLE `tbl_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_reservations`
--
ALTER TABLE `tbl_reservations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_role_access`
--
ALTER TABLE `tbl_role_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_running_orders`
--
ALTER TABLE `tbl_running_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_running_order_tables`
--
ALTER TABLE `tbl_running_order_tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_sales`
--
ALTER TABLE `tbl_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `os_del_out` (`order_status`,`del_status`,`outlet_id`),
  ADD KEY `id_del_outlet` (`id`,`del_status`,`outlet_id`),
  ADD KEY `outlet_order_status` (`outlet_id`,`order_status`),
  ADD KEY `id_del` (`id`,`del_status`),
  ADD KEY `user_date_time_del_order` (`user_id`,`date_time`,`del_status`,`order_status`),
  ADD KEY `table_id_status` (`table_id`,`order_status`),
  ADD KEY `outlet_id_waiter_id_order_status` (`outlet_id`,`waiter_id`,`order_status`),
  ADD KEY `get_orders_for_delete_runnig_orders` (`sale_no`,`del_status`);

--
-- Indexes for table `tbl_sales_details`
--
ALTER TABLE `tbl_sales_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_sales_details_modifiers`
--
ALTER TABLE `tbl_sales_details_modifiers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_id_details_id` (`sales_id`,`sales_details_id`);

--
-- Indexes for table `tbl_sale_consumptions`
--
ALTER TABLE `tbl_sale_consumptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_sale_consumptions_of_menus`
--
ALTER TABLE `tbl_sale_consumptions_of_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_sale_consumptions_of_modifiers_of_menus`
--
ALTER TABLE `tbl_sale_consumptions_of_modifiers_of_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_sale_payments`
--
ALTER TABLE `tbl_sale_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_sessions`
--
ALTER TABLE `tbl_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_suppliers`
--
ALTER TABLE `tbl_suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_supplier_payments`
--
ALTER TABLE `tbl_supplier_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_tables`
--
ALTER TABLE `tbl_tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_time_zone`
--
ALTER TABLE `tbl_time_zone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_transfer`
--
ALTER TABLE `tbl_transfer`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `tbl_transfer_ingredients`
--
ALTER TABLE `tbl_transfer_ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_transfer_received_ingredients`
--
ALTER TABLE `tbl_transfer_received_ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_units`
--
ALTER TABLE `tbl_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user_menu_access`
--
ALTER TABLE `tbl_user_menu_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_wastes`
--
ALTER TABLE `tbl_wastes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_waste_ingredients`
--
ALTER TABLE `tbl_waste_ingredients`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_access`
--
ALTER TABLE `tbl_access`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=372;

--
-- AUTO_INCREMENT for table `tbl_areas`
--
ALTER TABLE `tbl_areas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_attendance`
--
ALTER TABLE `tbl_attendance`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_audit_logs`
--
ALTER TABLE `tbl_audit_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_carts`
--
ALTER TABLE `tbl_carts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_combo_food_menus`
--
ALTER TABLE `tbl_combo_food_menus`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_companies`
--
ALTER TABLE `tbl_companies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_contacts`
--
ALTER TABLE `tbl_contacts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_counters`
--
ALTER TABLE `tbl_counters`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_customers`
--
ALTER TABLE `tbl_customers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `tbl_customer_address`
--
ALTER TABLE `tbl_customer_address`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_customer_due_receives`
--
ALTER TABLE `tbl_customer_due_receives`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_delivery_partners`
--
ALTER TABLE `tbl_delivery_partners`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_denominations`
--
ALTER TABLE `tbl_denominations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_expenses`
--
ALTER TABLE `tbl_expenses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_expense_items`
--
ALTER TABLE `tbl_expense_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_explores`
--
ALTER TABLE `tbl_explores`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_food_menus`
--
ALTER TABLE `tbl_food_menus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=914;

--
-- AUTO_INCREMENT for table `tbl_food_menus_ingredients`
--
ALTER TABLE `tbl_food_menus_ingredients`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_food_menus_modifiers`
--
ALTER TABLE `tbl_food_menus_modifiers`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tbl_food_menu_categories`
--
ALTER TABLE `tbl_food_menu_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_food_menu_ratings`
--
ALTER TABLE `tbl_food_menu_ratings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_galleries`
--
ALTER TABLE `tbl_galleries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_holds`
--
ALTER TABLE `tbl_holds`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_holds_details`
--
ALTER TABLE `tbl_holds_details`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_holds_details_modifiers`
--
ALTER TABLE `tbl_holds_details_modifiers`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_holds_table`
--
ALTER TABLE `tbl_holds_table`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_ingredients`
--
ALTER TABLE `tbl_ingredients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_ingredient_categories`
--
ALTER TABLE `tbl_ingredient_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_inventory_adjustment`
--
ALTER TABLE `tbl_inventory_adjustment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_inventory_adjustment_ingredients`
--
ALTER TABLE `tbl_inventory_adjustment_ingredients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_kitchens`
--
ALTER TABLE `tbl_kitchens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_kitchen_categories`
--
ALTER TABLE `tbl_kitchen_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_kitchen_sales`
--
ALTER TABLE `tbl_kitchen_sales`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_kitchen_sales_details`
--
ALTER TABLE `tbl_kitchen_sales_details`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_kitchen_sales_details_modifiers`
--
ALTER TABLE `tbl_kitchen_sales_details_modifiers`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_main_modules`
--
ALTER TABLE `tbl_main_modules`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_modifiers`
--
ALTER TABLE `tbl_modifiers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_modifier_ingredients`
--
ALTER TABLE `tbl_modifier_ingredients`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_multiple_currencies`
--
ALTER TABLE `tbl_multiple_currencies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_notifications`
--
ALTER TABLE `tbl_notifications`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_notification_bar_kitchen_panel`
--
ALTER TABLE `tbl_notification_bar_kitchen_panel`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_orders_table`
--
ALTER TABLE `tbl_orders_table`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_outlets`
--
ALTER TABLE `tbl_outlets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_payment_histories`
--
ALTER TABLE `tbl_payment_histories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_payment_methods`
--
ALTER TABLE `tbl_payment_methods`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `tbl_plugins`
--
ALTER TABLE `tbl_plugins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_premade_ingredients`
--
ALTER TABLE `tbl_premade_ingredients`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_pricing_plans`
--
ALTER TABLE `tbl_pricing_plans`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_printers`
--
ALTER TABLE `tbl_printers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_production`
--
ALTER TABLE `tbl_production`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_production_ingredients`
--
ALTER TABLE `tbl_production_ingredients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_promotions`
--
ALTER TABLE `tbl_promotions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_purchase`
--
ALTER TABLE `tbl_purchase`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_purchase_ingredients`
--
ALTER TABLE `tbl_purchase_ingredients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_register`
--
ALTER TABLE `tbl_register`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_reservations`
--
ALTER TABLE `tbl_reservations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_role_access`
--
ALTER TABLE `tbl_role_access`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_running_orders`
--
ALTER TABLE `tbl_running_orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_running_order_tables`
--
ALTER TABLE `tbl_running_order_tables`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_sales`
--
ALTER TABLE `tbl_sales`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_sales_details`
--
ALTER TABLE `tbl_sales_details`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_sales_details_modifiers`
--
ALTER TABLE `tbl_sales_details_modifiers`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_sale_consumptions`
--
ALTER TABLE `tbl_sale_consumptions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_sale_consumptions_of_menus`
--
ALTER TABLE `tbl_sale_consumptions_of_menus`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_sale_consumptions_of_modifiers_of_menus`
--
ALTER TABLE `tbl_sale_consumptions_of_modifiers_of_menus`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_sale_payments`
--
ALTER TABLE `tbl_sale_payments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_suppliers`
--
ALTER TABLE `tbl_suppliers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_supplier_payments`
--
ALTER TABLE `tbl_supplier_payments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_tables`
--
ALTER TABLE `tbl_tables`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_time_zone`
--
ALTER TABLE `tbl_time_zone`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=425;

--
-- AUTO_INCREMENT for table `tbl_transfer`
--
ALTER TABLE `tbl_transfer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_transfer_ingredients`
--
ALTER TABLE `tbl_transfer_ingredients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_transfer_received_ingredients`
--
ALTER TABLE `tbl_transfer_received_ingredients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_units`
--
ALTER TABLE `tbl_units`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `tbl_user_menu_access`
--
ALTER TABLE `tbl_user_menu_access`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_wastes`
--
ALTER TABLE `tbl_wastes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_waste_ingredients`
--
ALTER TABLE `tbl_waste_ingredients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
