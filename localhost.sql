-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 21, 2025 at 03:03 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web_nghe_nhac`
--
CREATE DATABASE IF NOT EXISTS `web_nghe_nhac` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `web_nghe_nhac`;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cat_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `resources` json DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `love` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_love` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `slug`, `tags`, `photo`, `summary`, `content`, `cat_id`, `user_id`, `resources`, `status`, `created_at`, `updated_at`, `love`, `user_love`) VALUES
(6, 'Sơn Tùng M-TP và dàn nghệ sĩ khuấy động đêm nhạc Y-Fest', 'son-tung-m-tp-va-dan-nghe-si-khuay-dong-dem-nhac-y-fest', NULL, 'http://127.0.0.1:8000/storage/avatar/SUdXFdRXh5FjqudhaM7qIabDHTF8gnVHkngHBrXg.webp', 'Lễ hội Y-Fest', '<p>Sơn T&ugrave;ng M-TP l&agrave; nghệ sĩ diễn cuối c&ugrave;ng tại Viettel Y-Fest 2024. Giọng ca gốc Th&aacute;i B&igrave;nh lần lượt tr&igrave;nh diễn 4 ca kh&uacute;c&nbsp;<em>H&atilde;y trao cho anh, Lạc tr&ocirc;i, Em của ng&agrave;y h&ocirc;m qua</em>&nbsp;v&agrave;&nbsp;<em>Đừng l&agrave;m tr&aacute;i tim anh đau.</em></p>\r\n\r\n<p>Ca sĩ 30 tuổi thường xuy&ecirc;n c&oacute; mặt trong c&aacute;c đại nhạc hội do Viettel tổ chức những năm gần đ&acirc;y như Kết nối triệu t&acirc;m hồn năm 2018, Y-Fest 2023 (phố đi bộ Nguyễn Huệ, TP HCM), Y-Fest 2024 (quảng trường C&aacute;ch mạng Th&aacute;ng T&aacute;m, H&agrave; Nội). Sự xuất hiện của Sơn T&ugrave;ng M-TP khuấy động s&acirc;n khấu. H&agrave;ng chục ngh&igrave;n kh&aacute;n giả h&aacute;t c&ugrave;ng c&aacute;c bản nhạc.</p>\r\n\r\n<p><img alt=\"\" src=\"https://i1-giaitri.vnecdn.net/2024/11/28/z6067786224816-db0b0fc60d0229b6275d3ef608a17537-1732764229.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=bblzP2RuYqKnkHY_g__4mw\" /></p>\r\n\r\n<p>Giọng ca&nbsp;<em>Em của ng&agrave;y h&ocirc;m qua&nbsp;</em>tr&igrave;nh diễn tự tin đồng thời c&oacute; nhiều khoảnh khắc giao lưu với fan.</p>\r\n\r\n<p><img alt=\"\" src=\"https://i1-giaitri.vnecdn.net/2024/11/28/HTH2-1732764250.png?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=29ZVhVGXyN349u2XeH2jDA\" /></p>\r\n\r\n<p>Xuất hiện trong đ&ecirc;m nhạc c&ograve;n c&oacute; Hieuthuhai. Rapper tr&igrave;nh diễn&nbsp;<em>Kh&ocirc;ng thể say, Ngủ một m&igrave;nh, Hẹn gặp nhau dưới &aacute;nh trăng&nbsp;</em>v&agrave;&nbsp;<em>Ng&aacute;o Ngơ.</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"https://i1-giaitri.vnecdn.net/2024/11/28/z6067786201308-f4a22d2aee057680eda82490e9983b8d-1732764338.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=b7TpjArQM0Nkud1S0SSWVg\" /></p>\r\n\r\n<p>Soobin diện &aacute;o kho&aacute;c da, mang đ&agrave;n bầu l&ecirc;n s&acirc;n khấu với ca kh&uacute;c&nbsp;<em>Ngồi tựa mạn thuyền</em>. Phần tr&igrave;nh diễn kết hợp nhạc cụ d&acirc;n tộc khiến kh&aacute;n giả th&iacute;ch th&uacute;.</p>\r\n\r\n<p><img alt=\"\" src=\"https://i1-giaitri.vnecdn.net/2024/11/28/z6067786236335-aa72ca252c8fddc9e96da03988071bf0-1732764411.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=ujJUCKqI-cve-Ttlg6zMEg\" /></p>\r\n\r\n<p>Orange mang l&ecirc;n s&acirc;n khấu nhiều bản hit tự s&aacute;ng t&aacute;c.</p>\r\n\r\n<p><img alt=\"\" src=\"https://i1-giaitri.vnecdn.net/2024/11/28/z6067786187318-b810562668aede42f529bd199c7a253c-1732764433.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=1MhA0JGVhg5VjnjCbj4Oaw\" /></p>\r\n\r\n<p>H&ograve;a Minzy khuấy động kh&aacute;n giả với nhiều bản hit như&nbsp;<em>Thị M&agrave;u, Rời bỏ, Bật t&igrave;nh y&ecirc;u l&ecirc;n</em>. S&acirc;n khấu Y-Fest kết hợp giữa &acirc;m nhạc v&agrave; c&ocirc;ng nghệ khiến m&agrave;n tr&igrave;nh diễn của c&aacute;c nghệ sĩ trở n&ecirc;n ấn tượng hơn.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"https://i1-giaitri.vnecdn.net/2024/11/28/z6067786180838-c5279ead9980fdec55255eba74a405e7-1732764467.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=t6eeHr2fLOy81xttfqVcKw\" /></p>\r\n\r\n<p>Viettel Y-Fest được ban tổ chức đầu tư hai s&acirc;n khấu. S&acirc;n khấu ch&iacute;nh tại Quảng trường C&aacute;ch mạng th&aacute;ng T&aacute;m l&agrave; nơi c&aacute;c nghệ sĩ biểu diễn. S&acirc;n khấu thứ hai được đặt ở quảng trường Đ&ocirc;ng Kinh Nghĩa Thục c&oacute; m&agrave;n h&igrave;nh LED cỡ lớn để c&aacute;c kh&aacute;n giả theo d&otilde;i. Hai s&acirc;n khấu được kết nối với nhau qua h&igrave;nh thức cầu truyền h&igrave;nh, sử dụng c&ocirc;ng nghệ 5G kh&ocirc;ng độ trễ của Viettel.</p>\r\n\r\n<p>Với s&acirc;n khấu ch&iacute;nh, ban tổ chức thiết kế kh&ocirc;ng gian đa chiều, tạo trải nghiệm kh&ocirc;ng giới hạn. Đ&acirc;y l&agrave; s&acirc;n khấu lớn với chiều cao l&ecirc;n đến 25m c&ugrave;ng khối lượng khung truss gần 40 tấn. Tổng diện t&iacute;ch m&agrave;n LED hơn 500 m2.</p>\r\n\r\n<p><img alt=\"\" src=\"https://i1-giaitri.vnecdn.net/2024/11/28/z6067786208319-656c8a1f0acf9311928559a95fd17fe4-1732764519.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=iQpQy81HYHplZ4oqqM6YSw\" /></p>\r\n\r\n<p>Ngo&agrave;i theo d&otilde;i m&agrave;n biểu diễn c&aacute;c nghệ sĩ, kh&aacute;n giả c&ograve;n được trải nghiệm tương t&aacute;c người khổng lồ &aacute;nh s&aacute;ng - Dundu. Nh&acirc;n vật Dundu được điều khiển chuyển động v&agrave; lập tr&igrave;nh &aacute;nh s&aacute;ng từ c&aacute;c chuy&ecirc;n gia, nghệ sĩ từ Đức, khiến kh&ocirc;ng gian trở n&ecirc;n lung linh hơn. Rất đ&ocirc;ng kh&aacute;n giả chăm ch&uacute; theo d&otilde;i, với tay để chạm v&agrave;o nh&acirc;n vật.</p>\r\n\r\n<p><img alt=\"\" src=\"https://i1-giaitri.vnecdn.net/2024/11/28/z6067786191784-4a28867e3f963961cf62f30594f140ff-1732764541.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=hcx338CjtG9dXBaO_LMp4Q\" /></p>\r\n\r\n<p>Sự kết hợp giữa &acirc;m nhạc với c&ocirc;ng nghệ tạo n&ecirc;n đ&ecirc;m diễn nhiều cảm x&uacute;c. Dọc c&aacute;c con phố xung quanh hồ Ho&agrave;n Kiếm như Cổ T&acirc;n, Phan Chu Trinh, Tr&agrave;ng Tiền, Đinh Ti&ecirc;n Ho&agrave;ng&hellip; kh&aacute;n giả đứng chật k&iacute;n để theo d&otilde;i c&aacute;c m&agrave;n biểu diễn.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"https://i1-giaitri.vnecdn.net/2024/11/28/z6070185470421-e6fd2bacaaef93c9b91f8eb67a075f29-1732764563.jpg?w=1200&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=tv8NCWQg9HjVfH5bZWQjkQ\" /></p>\r\n\r\n<p>Y-Fest kh&eacute;p lại với ph&aacute;o hoa rực s&aacute;ng bầu trời. Với chuỗi sự kiện như trạm dừng của bus c&ocirc;ng nghệ, nhạc hội Y-Fest 2024, Viettel ghi đậm dấu ấn với kh&aacute;n giả trẻ về th&ocirc;ng điệp c&ocirc;ng nghệ kết nối từ tr&aacute;i tim.</p>\r\n\r\n<p><strong>Ho&agrave;i Phương</strong><br />\r\n<em>Ảnh: Viettel</em></p>', 1, 12, NULL, 'active', '2025-05-18 16:43:02', '2025-05-18 16:43:14', '1', '[12]'),
(7, 'Ravolution Music Festival', 'ravolution-music-festival', NULL, 'http://127.0.0.1:8000/storage/avatar/iQEl443sjfXggQo9IeAljHZdjtD1EAYk0gubca5O.png', 'Ravolution Music Festival', '<p>Bạn l&agrave; người y&ecirc;u th&iacute;ch EDM hoặc nhạc dance th&igrave; đại nhạc hội Ravolution Music Festival (RMF) kh&ocirc;ng c&ograve;n l&agrave; c&aacute;i t&ecirc;n qu&aacute; xa lạ. Xuất hiện lần đầu v&agrave;o năm 2016, đến nay chương tr&igrave;nh nhanh ch&oacute;ng trở th&agrave;nh sự kiện được tổ chức thường ni&ecirc;n, l&agrave; m&oacute;n ăn tinh thần kh&ocirc;ng thể thiếu đối với c&aacute;c RAVER - t&ecirc;n gọi d&agrave;nh ri&ecirc;ng cho c&aacute;c fan trung th&agrave;nh của thể loại EDM.</p>\r\n\r\n<p>Với d&agrave;n lineup &ldquo;cực khủng&rdquo;, RMF g&acirc;y ấn tượng cả về phần nghe lẫn phần nh&igrave;n, mang đến cho c&aacute;c RAVER nhiều cảm x&uacute;c m&atilde;nh liệt, thỏa m&atilde;n được 3 yếu tố nghe - xem - trải nghiệm.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img src=\"https://cdn.stage.vn/images/49zqtdrhew-ravo-n4LA.png\" style=\"width:1071px\" /></p>', 1, 12, NULL, 'active', '2025-05-18 16:51:18', '2025-05-18 16:51:18', NULL, NULL),
(8, 'Hozo Festival', 'hozo-festival', NULL, 'http://127.0.0.1:8000/storage/avatar/gJ3Q9QxzaFwggwZBCz7fH5dE8DimCUSMeboOLq3s.png', 'Hozo Festival', '<p>Hozo Festival (H&ograve; D&ocirc;) c&oacute; thể xem l&agrave; một trong những lễ hội &acirc;m nhạc lớn nhất, ho&agrave;nh tr&aacute;ng nhất v&agrave; quy m&ocirc; nhất cuối năm 2022 với sự chờ đ&oacute;n h&agrave;ng chục ngh&igrave;n kh&aacute;n giả. Hozo một lễ hội &acirc;m nhạc đa s&acirc;n khấu - đa thể loại - đa sắc tộc độc đ&aacute;o nhất tại TP.HCM.</p>\r\n\r\n<p>B&ecirc;n cạnh phần &acirc;m nhạc cực k&igrave; chất lượng đến từ những si&ecirc;u sao l&agrave;ng nhạc Việt c&ugrave;ng c&aacute;c đại diện đ&aacute;ng ch&uacute; &yacute; ở nhiều quốc gia, HOZO c&ograve;n sở hữu v&ocirc; số c&aacute;c hoạt động b&ecirc;n lề. Với c&aacute;c hoạt động đan xen như li&ecirc;n hoan &acirc;m nhạc, workshop, kh&ocirc;ng gian ảo metaverse, cuộc thi t&agrave;i năng, c&aacute;c liveshow...HOZO c&ograve;n g&acirc;y &ldquo;cho&aacute;ng ngợp&rdquo; với người tham dự khi tổ chức m&ocirc; h&igrave;nh &ldquo;lễ hội trong lễ hội&rdquo; khi kết hợp tổ chức Ng&agrave;y hội Khinh kh&iacute; cầu Th&agrave;nh phố Hồ Ch&iacute; Minh lần 2 mới mẻ, độc đ&aacute;o với quy m&ocirc; lớn nhất nước từ trước đến nay.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img src=\"https://cdn.stage.vn/images/7mbdq6s3va-hozo-IzVb.png\" style=\"width:1057px\" /></p>\r\n\r\n<p>&nbsp;</p>', 1, 12, NULL, 'active', '2025-05-18 16:51:49', '2025-05-18 16:51:49', NULL, NULL),
(9, 'Monsoon Music Festival', 'monsoon-music-festival', NULL, 'http://127.0.0.1:8000/storage/avatar/RWkCg1xddWe1cbNPYuIeo8slOjSQNuRwb3AFDQJA.png', 'Monsoon Music Festival', '<p>Monsoon Festival Music 2019 l&agrave; nơi hội tụ của c&aacute;c nghệ sĩ trong nước v&agrave; quốc tế đem đến một bữa tiệc &acirc;m nhạc đa sắc m&agrave;u phục vụ c&ocirc;ng ch&uacute;ng. B&ecirc;n cạnh hiện tượng &quot;tạo hit&quot; l&agrave;ng Vpop Ti&ecirc;n Ti&ecirc;n, ho&agrave;ng tử indie Vũ, hay ca sĩ người Đức gốc Việt từng &#39;g&acirc;y b&atilde;o&#39; mạng x&atilde; hội - Vinh Khuất. C&aacute;c fan c&ograve;n c&oacute; cơ hội gặp gỡ với nh&oacute;m nhạc nổi tiếng Hyukoh (H&agrave;n Quốc), Mariyah (Đan Mạch), Totemo (Israel)&hellip;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img src=\"https://cdn.stage.vn/images/cc39zmbpud-monsoon-kWdV.png\" style=\"width:1076px\" /></p>', 1, 12, NULL, 'active', '2025-05-18 16:52:20', '2025-05-21 07:07:29', '1', '[21]'),
(10, 'Born Pink World Tour~~', 'born-pink-world-tour', NULL, 'http://127.0.0.1:8000/storage/avatar/iNqTcJQfuMhqbCtToJrbNZE6Rz6ilECDbFtCAKMr.png', 'Đối với sự nổi tiếng của nhóm nhạc Hàn Quốc Blackpink này thì không có từ ngữ nào có thể diễn tả hoàn hảo.', '<p><strong>Born Pink World Tour l&agrave; một chuyến lưu diễn to&agrave;n cầu của nh&oacute;m nhạc nữ H&agrave;n Quốc nổi tiếng với mục đ&iacute;ch quảng b&aacute; album Born Pink của nh&oacute;m. Được bắt đầu từ th&aacute;ng 10 năm 2022, đến nay Blackpink đ&atilde; tổ chức được 26 buổi c&ocirc;ng diễn, thu h&uacute;t h&agrave;ng trăm ngh&igrave;n fan tham dự. V&agrave; khi c&oacute; th&ocirc;ng tin nh&oacute;m nhạc đ&igrave;nh đ&aacute;m n&agrave;y sẽ c&oacute; một buổi concert tại s&acirc;n vận động Mỹ Đ&igrave;nh, H&agrave; Nội, sự h&agrave;o hứng v&agrave; kh&ocirc;ng kh&iacute; s&ocirc;i động đ&atilde; lan tỏa khắp cả nước.</strong></p>', 1, 21, NULL, 'active', '2025-05-21 07:10:50', '2025-05-21 07:11:05', NULL, NULL),
(11, 'Lễ hội cà phê Buôn Ma Thuột', 'le-hoi-ca-phe-buon-ma-thuot', NULL, 'http://127.0.0.1:8000/storage/avatar/c85ckTV3F3BTPiez4Hj2PmpgkW9sPMqHltFkmRdm.jpg', 'Nằm trong Top lễ hội đặc sắc Buôn Ma Thuột, Lễ hội cà phê Buôn Ma Thuột mang tầm vóc quốc gia và trở thành một nét đẹp văn hóa không thể thiếu', '<p>Nằm trong Top lễ hội đặc sắc Bu&ocirc;n Ma Thuột,&nbsp;<a href=\"https://mia.vn/cam-nang-du-lich/choang-ngop-voi-le-hoi-ca-phe-buon-ma-thuot-dam-da-sac-mau-van-hoa-5459\" target=\"_blank\">Lễ hội c&agrave; ph&ecirc; Bu&ocirc;n Ma Thuột</a>&nbsp;mang tầm v&oacute;c quốc gia v&agrave; trở th&agrave;nh một n&eacute;t đẹp văn h&oacute;a kh&ocirc;ng thể thiếu của người d&acirc;n sinh sống tại T&acirc;y Nguy&ecirc;n n&oacute;i chung v&agrave; Bu&ocirc;n Ma Thuột n&oacute;i ri&ecirc;ng. Lễ hội được tổ chức hai năm một lần v&agrave; thu h&uacute;t đ&ocirc;ng đảo du kh&aacute;ch gần xa đến tham quan nhờ nhiều trải nghiệm cực kỳ th&uacute; vị như đi c&agrave; kheo, diễn tấu cồng chi&ecirc;ng, lễ diễu h&agrave;nh của đ&agrave;n voi T&acirc;y Nguy&ecirc;n....</p>\r\n\r\n<p><img alt=\"Top lễ hội đặc sắc Buôn Ma Thuột mà bạn không được bỏ qua 5\" src=\"https://mia.vn/media/uploads/blog-du-lich/top-le-hoi-dac-sac-buon-ma-thuot-ma-ban-khong-duoc-bo-qua-04-1652222876.jpeg\" /></p>\r\n\r\n<p>Lễ hội c&agrave; ph&ecirc; Bu&ocirc;n Ma Thuột trở th&agrave;nh một n&eacute;t đẹp văn h&oacute;a kh&ocirc;ng thể thiếu của người d&acirc;n sinh sống tại đ&acirc;y</p>', 1, 22, NULL, 'active', '2025-05-21 07:44:11', '2025-05-21 07:44:20', '1', '[22]');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `title`, `slug`, `photo`, `status`, `created_at`, `updated_at`) VALUES
(1, 'DANH MỤC BÀI VIẾT', 'danh-muc-bai-viet', 'http://127.0.0.1:8000/storage/avatar/74697966-e434-479e-9c82-8a86df35861c_vbOnZ.jpg', 'active', '2025-04-26 10:38:02', '2025-04-26 10:38:02');

-- --------------------------------------------------------

--
-- Table structure for table `blog_coment`
--

CREATE TABLE `blog_coment` (
  `id` int UNSIGNED NOT NULL,
  `blog_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `like` bigint DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reply` bigint DEFAULT NULL,
  `user_like` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `blog_coment`
--

INSERT INTO `blog_coment` (`id`, `blog_id`, `user_id`, `like`, `content`, `created_at`, `updated_at`, `reply`, `user_like`) VALUES
(11, 6, 12, 0, 'Họp sếp thôi nào !!!', '2025-05-18 16:43:25', '2025-05-18 16:43:25', 0, '[]'),
(12, 9, 21, 1, 'Good!!!', '2025-05-21 07:07:38', '2025-05-21 07:07:52', 0, '[21]'),
(13, 11, 22, 0, 'Good', '2025-05-21 07:44:29', '2025-05-21 07:44:29', 0, '[]');

-- --------------------------------------------------------

--
-- Table structure for table `blog_reply`
--

CREATE TABLE `blog_reply` (
  `id` int UNSIGNED NOT NULL,
  `comment_id` int DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `blog_reply`
--

INSERT INTO `blog_reply` (`id`, `comment_id`, `content`, `user_id`, `created_at`, `updated_at`) VALUES
(9, 11, 'Đi thôi', '12', '2025-05-18 16:43:43', '2025-05-18 16:43:43'),
(10, 12, 'Nice try', '21', '2025-05-21 07:08:04', '2025-05-21 07:08:04');

-- --------------------------------------------------------

--
-- Table structure for table `cmd_functions`
--

CREATE TABLE `cmd_functions` (
  `id` bigint UNSIGNED NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int UNSIGNED NOT NULL,
  `post_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `like` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `reply` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `style` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `content`, `status`, `created_at`, `updated_at`, `like`, `reply`, `style`) VALUES
(44, '56', '13', 'tuyệt vời sếp ơi!', '1', '2025-05-21 06:30:05', '2025-05-21 06:30:28', '1', '1', NULL),
(45, '59', '21', 'Rockkkkk!!', '1', '2025-05-21 07:13:01', '2025-05-21 07:13:05', '1', '0', NULL),
(46, '61', '22', 'Nice, Good!!!~~', '1', '2025-05-21 07:46:43', '2025-05-21 07:47:14', '1', '0', NULL),
(47, '62', '22', '+1 máy đi chung', '1', '2025-05-21 07:50:47', '2025-05-21 07:50:47', '0', '0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comment_children`
--

CREATE TABLE `comment_children` (
  `id` int UNSIGNED NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `comment_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `comment_children`
--

INSERT INTO `comment_children` (`id`, `user_id`, `created_at`, `status`, `updated_at`, `comment_id`) VALUES
(43, '22', '2025-05-21 14:46:49', '1', '2025-05-21 07:46:49', '46'),
(42, '21', '2025-05-21 14:13:05', '1', '2025-05-21 07:13:05', '45'),
(41, '13', '2025-05-21 13:30:17', '1', '2025-05-21 06:30:17', '44');

-- --------------------------------------------------------

--
-- Table structure for table `composers`
--

CREATE TABLE `composers` (
  `id` bigint UNSIGNED NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `composers`
--

INSERT INTO `composers` (`id`, `fullname`, `slug`, `status`, `summary`, `content`, `photo`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Pháo', 'ph-o', 'active', 'MÔ TẢ NGẮN', 'NỘI DUNG', 'http://127.0.0.1:8000/storage/avatar/373563598_1682225782190018_404392973951086558_n_7DDHJ.jpg', 1, '2025-04-26 20:28:35', '2025-04-26 20:28:35');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `resources` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `timestart` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `timeend` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `diadiem` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_type_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `fanclub_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `photo`, `slug`, `summary`, `description`, `resources`, `timestart`, `timeend`, `diadiem`, `tags`, `event_type_id`, `created_at`, `updated_at`, `fanclub_id`, `quantity`, `price`) VALUES
(12, 'Lễ hội cồng chiêng', 'http://127.0.0.1:8000/images/event/1747837056.jfif', 'le-hoi-cong-chieng', NULL, '<p><a href=\"https://mia.vn/cam-nang-du-lich/trai-nghiem-le-hoi-cong-chieng-tay-nguyen-thu-vi-tai-dak-lak-5420\" target=\"_blank\">Lễ hội cồng chi&ecirc;ng T&acirc;y Nguy&ecirc;n</a>&nbsp;được xem l&agrave; một trong những n&eacute;t văn h&oacute;a đặc trưng v&agrave; quan trọng của mảnh đất n&agrave;y. Theo Top lễ hội đặc sắc Bu&ocirc;n Ma Thuột, kh&aacute;c với c&aacute;c lễ hội kh&aacute;c, lễ hội cồng chi&ecirc;ng được tổ chức cực kỳ ho&agrave;ng tr&aacute;ng với quy m&ocirc; v&ocirc; c&ugrave;ng rộng lớn. Với mục đ&iacute;ch, &yacute; nghĩa đầy cao đẹp l&agrave; quảng b&aacute; kh&ocirc;ng gian văn h&oacute;a cồng chi&ecirc;n của v&ugrave;ng đất T&acirc;y Nguy&ecirc;n đến với mọi người tr&ecirc;n khắp thế giới, lễ hội cồng chi&ecirc;ng T&acirc;y Nguy&ecirc;n được UNESCO c&ocirc;ng nhận l&agrave; di sản truyền khẩu v&agrave; phi vật thể của to&agrave;n nh&acirc;n loại.</p>\r\n\r\n<p><img alt=\"Top lễ hội đặc sắc Buôn Ma Thuột mà bạn không được bỏ qua 4\" src=\"https://mia.vn/media/uploads/blog-du-lich/top-le-hoi-dac-sac-buon-ma-thuot-ma-ban-khong-duoc-bo-qua-03-1652222876.jpeg\" /></p>\r\n\r\n<p>Lễ hội cồng chi&ecirc;ng T&acirc;y Nguy&ecirc;n được xem l&agrave; một trong những n&eacute;t văn h&oacute;a đặc trưng v&agrave; quan trọng của mảnh đất n&agrave;y</p>', NULL, '2025-05-22 14:17:00', '2025-05-23 14:17:00', 'BMT, đắk lắk', NULL, NULL, '2025-05-21 07:17:36', '2025-05-21 07:17:36', '9', '2', '6000'),
(13, 'Lễ hội thắp sáng bầu trời', 'http://127.0.0.1:8000/images/event/1747839239.jfif', 'le-hoi-thap-sang-bau-troi', NULL, '<h2>Thắp S&aacute;ng Bầu Trời &ndash; Light to sky</h2>\r\n\r\n<p>Lễ hội sẽ diễn ra trong suốt m&ugrave;a h&egrave; n&agrave;y từ 01/06 đến hết 02/09.<br />\r\nBạn muốn thả đ&egrave;n hoa đăng, h&atilde;y tới s&ocirc;ng Ho&agrave;i, muốn chụp h&igrave;nh với đ&egrave;n lồng đến Chợ Đ&ecirc;m.<br />\r\nMuốn thắp đ&egrave;n ước nguyện thắp s&aacute;ng trời đ&ecirc;m h&atilde;y đến đảo k&yacute; ức hội an.<br />\r\n<br />\r\n- Gi&aacute; v&eacute; : 200.000 đ<br />\r\n<br />\r\n<strong>Bạn sẽ c&oacute; những trải nghiệm đ&aacute;ng nhớ, chỉ c&oacute; tại đảo K&yacute; Ức Hội An. Chương tr&igrave;nh bao gồm:</strong><br />\r\n<br />\r\n- Thả đ&egrave;n lồng ước nguyện<br />\r\n- Thưởng thức c&aacute;c mini show tr&igrave;nh diễn &aacute;nh s&aacute;ng độc đ&aacute;o chưa từng c&oacute; tại Hội An.<br />\r\n<br />\r\n<img alt=\"mini show ánh sang\" src=\"https://kyuchoian.com/userfiles/image/an-tuong-hoi-an/2024/thapsang-bautroi/mini-anh-sang.jpg\" /><br />\r\n<br />\r\n<img alt=\"màn diễn chủ đề ánh sáng\" src=\"https://kyuchoian.com/userfiles/image/an-tuong-hoi-an/2024/thapsang-bautroi/mini-anh-sang-2.jpg\" /></p>\r\n\r\n<p>Đăng bởi :<strong>K&yacute; Ức Hội An</strong></p>\r\n\r\n<p>Địa chỉ : Cồn hến - 200 Nguyễn Tri Phương (rẽ tr&aacute;i) - Cẩm Nam - Hội An</p>\r\n\r\n<p>Hotline : 0983 257730</p>\r\n\r\n<p>Website :&nbsp;<a href=\"https://kyuchoian.com/\" target=\"_blank\">https://kyuchoian.com</a></p>', NULL, '2025-05-23 14:53:00', '2025-05-24 14:53:00', 'Sân khấu cây đa, đầu cầu Ánh Trăng', NULL, NULL, '2025-05-21 07:53:59', '2025-05-21 07:53:59', '10', '2', '2000');

-- --------------------------------------------------------

--
-- Table structure for table `event_blogs`
--

CREATE TABLE `event_blogs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `event_id` bigint UNSIGNED NOT NULL,
  `blog_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `event_groups`
--

CREATE TABLE `event_groups` (
  `id` bigint UNSIGNED NOT NULL,
  `group_id` bigint UNSIGNED NOT NULL,
  `event_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `event_types`
--

CREATE TABLE `event_types` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `event_users`
--

CREATE TABLE `event_users` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `event_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `vote` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `fanclubs`
--

CREATE TABLE `fanclubs` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `quantity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fanclubs`
--

INSERT INTO `fanclubs` (`id`, `title`, `slug`, `photo`, `summary`, `content`, `status`, `user_id`, `created_at`, `updated_at`, `quantity`) VALUES
(8, 'Mtp', 'mtp', 'http://127.0.0.1:8000/images/fanclub/1747835348.jfif', 'Cùng sếp thỏa sức vui đùa', 'Hãy gia nhập cùng chúng tôi, trải nghiệm và nghe nhạc của M-M-MTP', 'active', 13, '2025-05-21 06:49:09', '2025-05-21 07:15:33', '1'),
(9, 'Lễ hội', 'le-hoi', 'http://127.0.0.1:8000/images/fanclub/1747836970.png', 'Lễ hội', 'Lễ hội', 'active', 21, '2025-05-21 07:16:10', '2025-05-21 07:51:01', '2'),
(10, 'Sky Fire', 'sky-fire', 'http://127.0.0.1:8000/images/fanclub/1747839181.jfif', 'Thắp sáng bầu trời', 'Ký ức, muôn ngàn nỗi nhớ', 'active', 22, '2025-05-21 07:53:02', '2025-05-21 07:53:02', '0');

-- --------------------------------------------------------

--
-- Table structure for table `fanclub_blogs`
--

CREATE TABLE `fanclub_blogs` (
  `id` bigint UNSIGNED NOT NULL,
  `fanclub_id` bigint UNSIGNED NOT NULL,
  `blog_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `fanclub_items`
--

CREATE TABLE `fanclub_items` (
  `id` bigint UNSIGNED NOT NULL,
  `resource_id` bigint UNSIGNED NOT NULL,
  `resource_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `fanclub_users`
--

CREATE TABLE `fanclub_users` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `fanclub_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `fanclub_users`
--

INSERT INTO `fanclub_users` (`id`, `user_id`, `fanclub_id`, `role_id`, `created_at`, `updated_at`) VALUES
(15, 21, 8, NULL, '2025-05-21 07:15:33', '2025-05-21 07:15:33'),
(16, 1, 9, NULL, '2025-05-21 07:31:45', '2025-05-21 07:31:45'),
(17, 22, 9, NULL, '2025-05-21 07:51:01', '2025-05-21 07:51:01');

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `id` int UNSIGNED NOT NULL,
  `user_follow` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`id`, `user_follow`, `user_id`, `created_at`, `updated_at`) VALUES
(13, '21', '22', '2025-05-21 07:45:01', '2025-05-21 07:45:01'),
(12, '13', '21', '2025-05-21 07:11:33', '2025-05-21 07:11:33');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_private` int NOT NULL DEFAULT '0',
  `author_id` int NOT NULL DEFAULT '0',
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `group_blogs`
--

CREATE TABLE `group_blogs` (
  `id` bigint UNSIGNED NOT NULL,
  `group_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_private` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `group_folders`
--

CREATE TABLE `group_folders` (
  `id` bigint UNSIGNED NOT NULL,
  `group_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_private` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `group_members`
--

CREATE TABLE `group_members` (
  `id` bigint UNSIGNED NOT NULL,
  `group_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `group_roles`
--

CREATE TABLE `group_roles` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `group_types`
--

CREATE TABLE `group_types` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `image_user`
--

CREATE TABLE `image_user` (
  `id` int UNSIGNED NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `image_user`
--

INSERT INTO `image_user` (`id`, `image`, `created_at`, `updated_at`, `user_id`, `status`) VALUES
(8, 'avatar/img1.jpg', '2025-05-18 08:01:33', '2025-05-18 08:01:33', '13', '1');

-- --------------------------------------------------------

--
-- Table structure for table `listeners`
--

CREATE TABLE `listeners` (
  `id` bigint UNSIGNED NOT NULL,
  `favorite_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favorite_song` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favorite_singer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favorite_composer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2023_07_21_052409_create_u_groups_table', 1),
(5, '2023_07_29_082030_create_setting_details_table', 1),
(6, '2024_02_07_131700_create_tags_table', 1),
(7, '2024_02_07_131703_create_tag_blogs_table', 1),
(8, '2024_02_17_122214_create_role_functions_table', 1),
(9, '2024_02_17_122215_create_roles_table', 1),
(10, '2024_02_17_122241_create_cmd_functions_table', 1),
(11, '2024_10_16_130236_create_blogs_table', 1),
(12, '2024_10_16_130441_create_blog_categories_table', 1),
(13, '2024_10_16_131845_create_resource_types_table', 1),
(14, '2024_10_16_131913_create_resource_link_types_table', 1),
(15, '2024_10_16_131933_create_resources_table', 1),
(16, '2024_10_17_033531_create_oauth_auth_codes_table', 1),
(17, '2024_10_17_033532_create_oauth_access_tokens_table', 1),
(18, '2024_10_17_033533_create_oauth_refresh_tokens_table', 1),
(19, '2024_10_17_033534_create_oauth_clients_table', 1),
(20, '2024_10_17_033535_create_oauth_personal_access_clients_table', 1),
(21, '2024_10_17_082307_create_sessions_table', 1),
(22, '2024_10_27_050732_create_comments', 1),
(23, '2024_10_27_050732_create_group_blogs', 1),
(24, '2024_10_27_050732_create_group_folder', 1),
(25, '2024_10_27_050732_create_group_member', 1),
(26, '2024_10_27_050732_create_group_role', 1),
(27, '2024_10_27_050732_create_group_table', 1),
(28, '2024_10_27_050732_create_group_type', 1),
(29, '2024_10_27_050732_create_page', 1),
(30, '2024_10_27_050732_create_page_item', 1),
(31, '2024_10_27_050732_create_tblog', 1),
(32, '2024_10_27_050732_create_titem', 1),
(33, '2024_10_27_050732_create_tmotion', 1),
(34, '2024_10_27_050732_create_tmotion_item', 1),
(35, '2024_10_27_050732_create_tnotice', 1),
(36, '2024_10_27_050732_create_toptions', 1),
(37, '2024_10_27_050732_create_tquestion', 1),
(38, '2024_10_27_050732_create_trecommend', 1),
(39, '2024_10_27_050732_create_tsurvey', 1),
(40, '2024_10_27_050732_create_ttag', 1),
(41, '2024_10_27_050732_create_ttag_item', 1),
(42, '2024_10_27_050732_create_tuserpage', 1),
(43, '2024_10_27_050732_create_tuserpageitem', 1),
(44, '2024_10_27_050732_create_tvote_item', 1),
(45, '2024_10_28_072944_create_music_companies_table', 1),
(46, '2024_11_02_061057_create_singers_table', 1),
(47, '2024_11_02_064625_create_music_types_table', 1),
(48, '2024_11_04_022454_create_composers_table', 1),
(49, '2024_11_08_011816_create_songs_table', 1),
(50, '2024_11_08_012626_create_fanclubs_table', 1),
(51, '2024_11_08_013324_create_fanclub_blogs_table', 1),
(52, '2024_11_08_013326_create_fanclub_items_table', 1),
(53, '2024_11_08_013333_create_fanclub_users_table', 1),
(54, '2024_11_12_072523_create_playlists_table', 1),
(55, '2024_11_15_073136_create_listeners_table', 1),
(56, '2024_11_18_202032_create_event_types_table', 1),
(57, '2024_11_18_202212_create_events_table', 1),
(58, '2024_11_18_202354_create_event_users_table', 1),
(59, '2024_11_18_203339_create_event_blogs_table', 1),
(60, '2024_11_18_203525_create_event_groups_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `music_companies`
--

CREATE TABLE `music_companies` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `resources` json DEFAULT NULL,
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `music_types`
--

CREATE TABLE `music_types` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `music_types`
--

INSERT INTO `music_types` (`id`, `title`, `photo`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(4, 'Pop', 'http://127.0.0.1:8000/storage/avatar/tải xuống (7)_pcJ2w.jfif', 'pop', 'active', '2025-05-18 08:20:08', '2025-05-18 08:20:08'),
(5, 'Rock', 'http://127.0.0.1:8000/storage/avatar/tải xuống (8)_D2jpG.jfif', 'rock', 'active', '2025-05-18 08:21:07', '2025-05-18 08:21:07'),
(6, 'EDM', 'http://127.0.0.1:8000/storage/avatar/tải xuống (9)_QRTXJ.jfif', 'edm', 'active', '2025-05-18 08:22:06', '2025-05-18 08:22:06'),
(7, 'Nhạc việt', 'http://127.0.0.1:8000/storage/avatar/tải xuống (10)_qzOn4.jfif', 'nhac-viet', 'active', '2025-05-18 08:23:02', '2025-05-18 08:23:02'),
(8, 'Hip-hop', 'http://127.0.0.1:8000/storage/avatar/tải xuống (12)_IZDGv.jfif', 'hip-hop', 'active', '2025-05-18 08:24:17', '2025-05-18 08:24:17'),
(9, 'Nhạc đồng quê', 'http://127.0.0.1:8000/storage/avatar/tải xuống (13)_MlhpV.jfif', 'nhac-dong-que', 'active', '2025-05-18 08:24:44', '2025-05-18 08:24:44'),
(10, 'Nhạc trẻ', 'http://127.0.0.1:8000/storage/avatar/images (2)_CpFTZ.jfif', 'nhac-tre', 'active', '2025-05-18 08:26:24', '2025-05-18 08:26:24'),
(11, 'Khác', 'http://127.0.0.1:8000/storage/avatar/tải xuống (11)_wBZed.jfif', 'khac', 'active', '2025-05-18 08:27:21', '2025-05-18 08:28:12');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `client_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `client_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `playlists`
--

CREATE TABLE `playlists` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `song_id` json NOT NULL,
  `order_id` int NOT NULL,
  `type` enum('public','private') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `playlists`
--

INSERT INTO `playlists` (`id`, `title`, `photo`, `slug`, `user_id`, `song_id`, `order_id`, `type`, `created_at`, `updated_at`) VALUES
(13, 'My Love', 'http://127.0.0.1:8000/storage/avatar/tải xuống (6).jfif', 'my-love', 13, '[]', 1, 'public', '2025-05-21 06:47:35', '2025-05-21 06:47:35'),
(14, 'MTP', 'http://127.0.0.1:8000/storage/avatar/photo-1717578325958-171757832617863214382.webp', 'mtp', 21, '[30, 32]', 2, 'public', '2025-05-21 07:14:43', '2025-05-21 07:15:03'),
(15, 'UwU', 'http://127.0.0.1:8000/storage/avatar/img3.jpg', 'uwu', 22, '[30, 32]', 3, 'public', '2025-05-21 07:47:54', '2025-05-21 07:48:11');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int UNSIGNED NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `like` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dislike` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `share` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `post_form` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `post_singer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `url_share` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `url_user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `description`, `created_at`, `updated_at`, `link`, `image`, `user_id`, `like`, `dislike`, `comment`, `share`, `status`, `post_form`, `post_singer`, `url_share`, `url_user_id`) VALUES
(56, 'Đừng làm trái tim anh đau - https://www.youtube.com/watch?v=abPmZCZZrFA', '2025-05-21 06:29:10', '2025-05-21 06:30:05', 'https://www.youtube.com/watch?v=abPmZCZZrFA', NULL, 13, '1', NULL, '1', '0', '1', NULL, NULL, 'http://127.0.0.1:8000/zing-play-slug/dung-lam-trai-tim-anh-dau', '14'),
(57, 'EDM mix - https://www.youtube.com/watch?v=iuPKiSm2xHs', '2025-05-21 06:36:16', '2025-05-21 07:48:34', 'https://www.youtube.com/watch?v=iuPKiSm2xHs', NULL, 13, '1', NULL, '0', '0', '1', NULL, NULL, 'http://127.0.0.1:8000/zing-play-slug/edm-mix', '13'),
(58, '<p>Monsoon Festival Music 2019 l&agrave; nơi hội tụ của c&aacute;c nghệ sĩ trong nước v&agrave; quốc tế đem đến một bữa tiệc &acirc;m nhạc đa sắc m&agrave;u phục vụ c&ocirc;ng ch&uacute;ng. B&ecirc;n cạnh hiện tượng &quot;tạo hit&quot; l&agrave;ng Vpop Ti&ecirc;n Ti&ecirc;n, ho&agrave;ng tử indie Vũ, hay ca sĩ người Đức gốc Việt từng &#39;g&acirc;y b&atilde;o&#39; mạng x&atilde; hội - Vinh Khuất. C&aacute;c fan c&ograve;n c&oacute; cơ hội gặp gỡ với nh&oacute;m nhạc nổi tiếng Hyukoh (H&agrave;n Quốc), Mariyah (Đan Mạch), Totemo (Israel)&hellip;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img src=\"https://cdn.stage.vn/images/cc39zmbpud-monsoon-kWdV.png\" style=\"width:1076px\" /></p>', '2025-05-21 06:47:05', '2025-05-21 07:48:39', NULL, 'http://127.0.0.1:8000/storage/avatar/RWkCg1xddWe1cbNPYuIeo8slOjSQNuRwb3AFDQJA.png', 13, '1', '0', '0', '0', '1', NULL, NULL, 'http://127.0.0.1:8000/blogs/monsoon-music-festival', '12'),
(59, 'Rock battle - https://www.youtube.com/watch?v=hEIUNlB9pOc', '2025-05-21 07:12:40', '2025-05-21 07:13:01', 'https://www.youtube.com/watch?v=hEIUNlB9pOc', NULL, 21, '1', NULL, '1', '0', '1', NULL, NULL, 'http://127.0.0.1:8000/zing-play-slug/rock-battle', '21'),
(60, '<p>Nằm trong Top lễ hội đặc sắc Bu&ocirc;n Ma Thuột,&nbsp;<a href=\"https://mia.vn/cam-nang-du-lich/choang-ngop-voi-le-hoi-ca-phe-buon-ma-thuot-dam-da-sac-mau-van-hoa-5459\" target=\"_blank\">Lễ hội c&agrave; ph&ecirc; Bu&ocirc;n Ma Thuột</a>&nbsp;mang tầm v&oacute;c quốc gia v&agrave; trở th&agrave;nh một n&eacute;t đẹp văn h&oacute;a kh&ocirc;ng thể thiếu của người d&acirc;n sinh sống tại T&acirc;y Nguy&ecirc;n n&oacute;i chung v&agrave; Bu&ocirc;n Ma Thuột n&oacute;i ri&ecirc;ng. Lễ hội được tổ chức hai năm một lần v&agrave; thu h&uacute;t đ&ocirc;ng đảo du kh&aacute;ch gần xa đến tham quan nhờ nhiều trải nghiệm cực kỳ th&uacute; vị như đi c&agrave; kheo, diễn tấu cồng chi&ecirc;ng, lễ diễu h&agrave;nh của đ&agrave;n voi T&acirc;y Nguy&ecirc;n....</p>\r\n\r\n<p><img alt=\"Top lễ hội đặc sắc Buôn Ma Thuột mà bạn không được bỏ qua 5\" src=\"https://mia.vn/media/uploads/blog-du-lich/top-le-hoi-dac-sac-buon-ma-thuot-ma-ban-khong-duoc-bo-qua-04-1652222876.jpeg\" /></p>\r\n\r\n<p>Lễ hội c&agrave; ph&ecirc; Bu&ocirc;n Ma Thuột trở th&agrave;nh một n&eacute;t đẹp văn h&oacute;a kh&ocirc;ng thể thiếu của người d&acirc;n sinh sống tại đ&acirc;y</p>', '2025-05-21 07:44:33', '2025-05-21 07:44:33', NULL, 'http://127.0.0.1:8000/storage/avatar/c85ckTV3F3BTPiez4Hj2PmpgkW9sPMqHltFkmRdm.jpg', 22, '0', '0', '0', '0', '1', NULL, NULL, 'http://127.0.0.1:8000/blogs/le-hoi-ca-phe-buon-ma-thuot', '22'),
(61, 'Anh trai hip gop - https://www.youtube.com/watch?v=XMGcYBNpgrs', '2025-05-21 07:46:27', '2025-05-21 07:46:43', 'https://www.youtube.com/watch?v=XMGcYBNpgrs', NULL, 22, '1', NULL, '1', '0', '1', NULL, NULL, 'http://127.0.0.1:8000/zing-play-slug/anh-trai-hip-gop', '22'),
(62, 'Cần bạn đi festival music', '2025-05-21 07:49:02', '2025-05-21 07:50:47', NULL, 'http://127.0.0.1:8000/storage/posts/avatar_1747838942.png', 22, '1', '0', '1', '0', '1', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `post_user`
--

CREATE TABLE `post_user` (
  `id` int UNSIGNED NOT NULL,
  `post_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `post_user`
--

INSERT INTO `post_user` (`id`, `post_id`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(41, '56', '13', 'like', '2025-05-21 06:29:37', '2025-05-21 06:29:37'),
(42, '59', '21', 'like', '2025-05-21 07:12:48', '2025-05-21 07:12:48'),
(43, '61', '22', 'like', '2025-05-21 07:46:32', '2025-05-21 07:46:32'),
(44, '57', '22', 'like', '2025-05-21 07:48:34', '2025-05-21 07:48:34'),
(45, '58', '22', 'like', '2025-05-21 07:48:39', '2025-05-21 07:48:39'),
(46, '62', '22', 'like', '2025-05-21 07:50:32', '2025-05-21 07:50:32');

-- --------------------------------------------------------

--
-- Table structure for table `reply_comment`
--

CREATE TABLE `reply_comment` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `comment_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `like` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `reply_comment`
--

INSERT INTO `reply_comment` (`id`, `user_id`, `content`, `comment_id`, `created_at`, `updated_at`, `like`) VALUES
(19, 13, 'good', 44, '2025-05-21 06:30:28', '2025-05-21 06:30:28', '0');

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE `resources` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` json DEFAULT NULL,
  `type_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `resources`
--

INSERT INTO `resources` (`id`, `title`, `slug`, `file_name`, `file_type`, `file_size`, `url`, `code`, `description`, `tags`, `type_code`, `link_code`, `created_at`, `updated_at`) VALUES
(51, 'Đừng làm trái tim anh đau', 'dung-lam-trai-tim-anh-dau', NULL, 'URL', '0', 'https://www.youtube.com/watch?v=abPmZCZZrFA', 'songs', NULL, NULL, 'order', NULL, '2025-05-21 06:12:46', '2025-05-21 06:12:46'),
(52, 'Nơi này có anh', 'noi-nay-co-anh', NULL, 'URL', '0', 'https://www.youtube.com/watch?v=FN7ALfpGxiI', 'songs', NULL, NULL, 'order', NULL, '2025-05-21 06:15:25', '2025-05-21 06:15:25'),
(53, 'EDM mix', 'edm-mix', NULL, 'URL', '0', 'https://www.youtube.com/watch?v=iuPKiSm2xHs', 'songs', NULL, NULL, 'order', NULL, '2025-05-21 06:34:57', '2025-05-21 06:34:57'),
(54, 'Balab bao chill', 'balab-bao-chill', NULL, 'URL', '0', 'https://www.youtube.com/watch?v=yqImQ034mj0', 'songs', NULL, NULL, 'order', NULL, '2025-05-21 06:36:03', '2025-05-21 06:36:03'),
(55, 'Rock battle', 'rock-battle', NULL, 'URL', '0', 'https://www.youtube.com/watch?v=hEIUNlB9pOc', 'songs', NULL, NULL, 'order', NULL, '2025-05-21 07:12:32', '2025-05-21 07:12:32'),
(56, 'Anh trai hip gop', 'anh-trai-hip-gop', NULL, 'URL', '0', 'https://www.youtube.com/watch?v=XMGcYBNpgrs', 'songs', NULL, NULL, 'order', NULL, '2025-05-21 07:46:10', '2025-05-21 07:46:10');

-- --------------------------------------------------------

--
-- Table structure for table `resource_link_types`
--

CREATE TABLE `resource_link_types` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `viewcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `resource_types`
--

CREATE TABLE `resource_types` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `alias`, `title`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Quản trị viên', 'active', NULL, NULL),
(6, 'member', 'Thành viên', 'active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_functions`
--

CREATE TABLE `role_functions` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` int NOT NULL,
  `cfunction_id` int NOT NULL,
  `value` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `setting_details`
--

CREATE TABLE `setting_details` (
  `id` bigint UNSIGNED NOT NULL,
  `company_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `web_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `memory` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `keyword` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `mst` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shopee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lazada` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hotline` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itcctv_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itcctv_pass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `public_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paymentinfo` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `setting_details`
--

INSERT INTO `setting_details` (`id`, `company_name`, `web_title`, `address`, `logo`, `short_name`, `site_url`, `phone`, `icon`, `map`, `memory`, `keyword`, `mst`, `email`, `facebook`, `shopee`, `lazada`, `hotline`, `itcctv_email`, `itcctv_pass`, `public_key`, `paymentinfo`, `created_at`, `updated_at`) VALUES
(1, 'Miquinn', 'Miquinn', 'Ywang Buôn Ma Thuột, Đăk Lăk', 'http://127.0.0.1:8000/storage/avatar/Miquinntab_pL1Tf.png', NULL, NULL, '0500363732', 'http://127.0.0.1:8000/storage/avatar/Miquinntab_NZk4a.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p>&nbsp;</p>', NULL, '2025-05-18 06:52:44');

-- --------------------------------------------------------

--
-- Table structure for table `singers`
--

CREATE TABLE `singers` (
  `id` bigint UNSIGNED NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_id` bigint UNSIGNED NOT NULL,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `start_year` int DEFAULT NULL,
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `company_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE `songs` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `resources` json DEFAULT NULL,
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `composer_id` bigint UNSIGNED DEFAULT NULL,
  `singer_id` bigint UNSIGNED DEFAULT NULL,
  `musictype_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `view` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `like` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dislike` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`id`, `title`, `slug`, `summary`, `content`, `resources`, `tags`, `status`, `composer_id`, `singer_id`, `musictype_id`, `created_at`, `updated_at`, `view`, `user_id`, `like`, `dislike`) VALUES
(30, 'Đừng làm trái tim anh đau', 'dung-lam-trai-tim-anh-dau', 'Hãy cùng thưởng thức ca khúc ĐỪNG LÀM TRÁI TIM ANH ĐAU ngay tại đây nhé: 👉🏻 👉🏻 👉🏻  https://vivienm.lnk.to/DLTTAD 💍❤️‍🩹🧩', 'Hãy cùng thưởng thức ca khúc ĐỪNG LÀM TRÁI TIM ANH ĐAU ngay tại đây nhé: 👉🏻 👉🏻 👉🏻  https://vivienm.lnk.to/DLTTAD 💍❤️‍🩹🧩', '\"[{\\\"song_id\\\":14,\\\"resource_id\\\":51}]\"', NULL, 'active', NULL, NULL, 7, '2025-05-21 06:12:47', '2025-05-21 07:42:41', 6, 14, NULL, NULL),
(31, 'Nơi này có anh', 'noi-nay-co-anh', 'Nơi Này Có Anh | Official Music Video | Sơn Tùng M-TP\r\nBất kì Video nào có liên quan tới \"Nơi Này Có Anh\" chưa có sự cho phép đều được coi là vi phạm bản quyền.', 'Được thực hiện bởi / Video made by\r\nSáng tác / Composer: Sơn Tùng M-TP\r\nPhối khí / Arranger: Khắc Hưng\r\nMaster: Long Halo\r\nSản xuất / Produced by Dreams Productions\r\nĐạo diễn / Director: Gin Tran\r\nĐạo diễn hình ảnh / D.O.P: Lub Nguyen\r\nGiám đốc nghệ thuật / Art Director: Thien Thanh\r\nThiết kế đồ hoạ / Graphic Designer: Meimei Hoang\r\nĐiều hành sản xuất / Executive Producer: M&M HOUSE', '\"[{\\\"song_id\\\":14,\\\"resource_id\\\":52}]\"', NULL, 'active', NULL, NULL, 7, '2025-05-21 06:15:25', '2025-05-21 07:42:36', 3, 14, NULL, NULL),
(32, 'EDM mix', 'edm-mix', 'TOP 15 Bản Nhạc EDM Mix Thư Giãn Giai Điệu Vui Tươi ♫ Nhạc Điện Tử Gây Nghiện Hay Nhất 2025', 'TOP 15 Bản Nhạc EDM Mix Thư Giãn Giai Điệu Vui Tươi ♫ Nhạc Điện Tử Gây Nghiện Hay Nhất 2025', '\"[{\\\"song_id\\\":13,\\\"resource_id\\\":53}]\"', NULL, 'active', NULL, NULL, 6, '2025-05-21 06:34:57', '2025-05-21 06:38:11', 3, 13, NULL, NULL),
(33, 'Balab bao chill', 'balab-bao-chill', '(Playlist 1 Giờ) Tổng hợp nhạc Pop Ballad bap chill~ | Nhạc thư giãn, up mood', '(Playlist 1 Giờ) Tổng hợp nhạc Pop Ballad bap chill~ | Nhạc thư giãn, up mood', '\"[{\\\"song_id\\\":13,\\\"resource_id\\\":54}]\"', NULL, 'active', NULL, NULL, 4, '2025-05-21 06:36:03', '2025-05-21 07:41:51', 7, 13, NULL, NULL),
(34, 'Rock battle', 'rock-battle', 'Cùng xem màn trình diễn ca khúc \"Tìm lại\" từ các band nhạc rock trẻ ở độ tuổi THCS và THPT nhé!', 'Cùng xem màn trình diễn ca khúc \"Tìm lại\" từ các band nhạc rock trẻ ở độ tuổi THCS và THPT nhé!', '\"[{\\\"song_id\\\":21,\\\"resource_id\\\":55}]\"', NULL, 'active', NULL, NULL, 5, '2025-05-21 07:12:32', '2025-05-21 07:42:30', 6, 21, NULL, NULL),
(35, 'Anh trai hip gop', 'anh-trai-hip-gop', 'ANH TRAI HIP HOP - B Ray x Robber x Gill oanh tạc sân khấu cực cháy | Rap Việt 2024 [Performance]', 'ANH TRAI HIP HOP - B Ray x Robber x Gill oanh tạc sân khấu cực cháy | Rap Việt 2024 [Performance]', '\"[{\\\"song_id\\\":22,\\\"resource_id\\\":56}]\"', NULL, 'active', NULL, NULL, 8, '2025-05-21 07:46:10', '2025-05-21 07:46:23', 1, 22, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `song_coment`
--

CREATE TABLE `song_coment` (
  `id` int UNSIGNED NOT NULL,
  `song_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `like` bigint DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reply` bigint DEFAULT NULL,
  `user_like` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `song_coment`
--

INSERT INTO `song_coment` (`id`, `song_id`, `user_id`, `like`, `content`, `created_at`, `updated_at`, `reply`, `user_like`) VALUES
(10, 32, 13, 0, 'Thật là chill', '2025-05-21 06:38:02', '2025-05-21 06:38:02', 0, NULL),
(11, 33, 21, 1, 'Nice!!!', '2025-05-21 07:06:13', '2025-05-21 07:06:18', 0, '[21]'),
(12, 34, 21, 0, 'Youtube cấm', '2025-05-21 07:14:01', '2025-05-21 07:14:01', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `song_like_dislike`
--

CREATE TABLE `song_like_dislike` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `song_id` int DEFAULT NULL,
  `style` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `song_reply`
--

CREATE TABLE `song_reply` (
  `id` int UNSIGNED NOT NULL,
  `comment_id` int DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `song_reply`
--

INSERT INTO `song_reply` (`id`, `comment_id`, `content`, `user_id`, `created_at`, `updated_at`) VALUES
(8, 10, 'vui vẻ thôi', '13', '2025-05-21 06:38:10', '2025-05-21 06:38:10');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tag_blogs`
--

CREATE TABLE `tag_blogs` (
  `id` bigint UNSIGNED NOT NULL,
  `tag_id` int NOT NULL,
  `blog_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `t_blogs`
--

CREATE TABLE `t_blogs` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int NOT NULL,
  `hit` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `resources` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `t_comments`
--

CREATE TABLE `t_comments` (
  `id` bigint UNSIGNED NOT NULL,
  `item_id` int NOT NULL,
  `item_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int NOT NULL,
  `resources` json DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `t_items`
--

CREATE TABLE `t_items` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `urlview` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `t_motions`
--

CREATE TABLE `t_motions` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `t_motion_items`
--

CREATE TABLE `t_motion_items` (
  `id` bigint UNSIGNED NOT NULL,
  `item_id` int NOT NULL,
  `item_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `motions` json DEFAULT NULL,
  `user_motions` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `t_notices`
--

CREATE TABLE `t_notices` (
  `id` bigint UNSIGNED NOT NULL,
  `item_id` int NOT NULL,
  `item_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_view` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `seen` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `t_options`
--

CREATE TABLE `t_options` (
  `id` bigint UNSIGNED NOT NULL,
  `question_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `votes` int NOT NULL DEFAULT '0',
  `users` json DEFAULT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `t_pages`
--

CREATE TABLE `t_pages` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_id` int NOT NULL,
  `item_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `t_page_items`
--

CREATE TABLE `t_page_items` (
  `id` bigint UNSIGNED NOT NULL,
  `page_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `t_questions`
--

CREATE TABLE `t_questions` (
  `id` bigint UNSIGNED NOT NULL,
  `question` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `survey_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `t_recommends`
--

CREATE TABLE `t_recommends` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `item_id` int NOT NULL,
  `item_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `t_surveys`
--

CREATE TABLE `t_surveys` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_id` int NOT NULL,
  `item_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_date` date NOT NULL,
  `user_id` int NOT NULL,
  `user_ids` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `t_tags`
--

CREATE TABLE `t_tags` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hit` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `t_tag_items`
--

CREATE TABLE `t_tag_items` (
  `id` bigint UNSIGNED NOT NULL,
  `tag_id` int NOT NULL,
  `item_id` int NOT NULL,
  `item_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `t_userpages`
--

CREATE TABLE `t_userpages` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `t_userpage_items`
--

CREATE TABLE `t_userpage_items` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `page_id` int NOT NULL,
  `item_id` int NOT NULL,
  `item_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` int NOT NULL,
  `status` enum('công khai','riêng tư') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'công khai',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `t_vote_items`
--

CREATE TABLE `t_vote_items` (
  `id` bigint UNSIGNED NOT NULL,
  `item_id` int NOT NULL,
  `item_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` int NOT NULL,
  `point` decimal(8,2) NOT NULL,
  `votes` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `global_id` int DEFAULT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ship_id` int DEFAULT NULL,
  `ugroup_id` int DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'customer',
  `budget` bigint NOT NULL DEFAULT '0',
  `totalpoint` bigint NOT NULL DEFAULT '0',
  `totalrevenue` bigint NOT NULL DEFAULT '0',
  `totalinvoice` bigint NOT NULL DEFAULT '0',
  `taxcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taxname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taxaddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `monitor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `following` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `code`, `global_id`, `full_name`, `username`, `email`, `email_verified_at`, `password`, `photo`, `phone`, `address`, `description`, `ship_id`, `ugroup_id`, `role`, `budget`, `totalpoint`, `totalrevenue`, `totalinvoice`, `taxcode`, `taxname`, `taxaddress`, `status`, `remember_token`, `created_at`, `updated_at`, `monitor`, `following`) VALUES
(1, NULL, NULL, 'admin', 'admin', 'admin@gmail.com', NULL, '$2y$12$rcUMGt.P5UTgggVhVrf2Aup7dFyoNVWDTW2NcCU5S.vp/FIDnwZ1u', NULL, '111111111', NULL, NULL, NULL, NULL, 'admin', 0, 0, 0, 0, NULL, NULL, NULL, 'active', NULL, NULL, NULL, NULL, NULL),
(12, NULL, NULL, 'suri', 'suri@gmail.com', 'suri@gmail.com', NULL, '$2y$12$r9vuWkMBvgWjeg55RmA4i.FiumLjNyyvD8B8BbEW8PgewKMtYcEfq', NULL, '', NULL, NULL, NULL, NULL, 'customer', 0, 0, 0, 0, NULL, NULL, NULL, 'active', NULL, '2025-05-18 07:26:13', '2025-05-18 07:26:13', NULL, NULL),
(13, NULL, NULL, 'miquinn', 'miquinn@gmail.com', 'miquinn@gmail.com', NULL, '$2y$12$GSoi3lBvfVHMoEWiYS/b6u1atE0XZUdTyWXTkIBxVZnlZXSqh0CfW', 'avatar/img1.jpg', '0328597623', NULL, 'Hãy vui lên!!!', NULL, NULL, 'customer', 0, 0, 0, 0, NULL, NULL, 'Lê duẩn, TP BMT, Đắk Lắk', 'active', NULL, '2025-05-18 07:26:29', '2025-05-21 07:11:33', '1', NULL),
(14, NULL, NULL, 'Sơn Tùng', 'mtp@gmail.com', 'mtp@gmail.com', NULL, '$2y$12$ym7iIjTCVfXZYILGy7tIhuYN6it18oEhF1Da5/w9OGuIvrGvBGIE6', 'avatar/images (1).jfif', '', NULL, NULL, NULL, NULL, 'customer', 0, 0, 0, 0, NULL, NULL, NULL, 'active', NULL, '2025-05-18 08:11:17', '2025-05-18 17:07:56', NULL, NULL),
(15, NULL, NULL, 'Amee', 'amee@gmail.com', 'amee@gmail.com', NULL, '$2y$12$OppwPC9xB.lj/Py7fE.nluC9AggjZxQuTmgXMDP9BS1pSFstRQ5km', 'avatar/tải xuống (1).webp', '', NULL, NULL, NULL, NULL, 'customer', 0, 0, 0, 0, NULL, NULL, NULL, 'active', NULL, '2025-05-18 08:13:13', '2025-05-18 17:08:54', NULL, NULL),
(16, NULL, NULL, 'Đức Phúc', 'ducphuc@gmail.com', 'ducphuc@gmail.com', NULL, '$2y$12$WTYgiNIp6Ta5F.K8Fvp3tO5AOrU8z0LpMSIxTaNj/3WuFnh4As7x6', NULL, '', NULL, NULL, NULL, NULL, 'customer', 0, 0, 0, 0, NULL, NULL, NULL, 'active', NULL, '2025-05-18 08:14:03', '2025-05-18 08:14:03', NULL, NULL),
(17, NULL, NULL, 'Bùi Anh Tuấn', 'buianhtuan@gmail.com', 'buianhtuan@gmail.com', NULL, '$2y$12$rLLlWxqL.ocreXIRiYFABeWetNADCpH/uuNEO4xAyetUMMZX8Crre', 'avatar/tải xuống (4).webp', '', NULL, NULL, NULL, NULL, 'customer', 0, 0, 0, 0, NULL, NULL, NULL, 'active', NULL, '2025-05-18 08:15:14', '2025-05-18 17:10:39', NULL, NULL),
(18, NULL, NULL, 'Noo Phước Thịnh', 'noo@gmail.com', 'noo@gmail.com', NULL, '$2y$12$jlpvk2O7SqeWGKhrC7tfqu6eIJAI.EUt5MaeaztRrdPj93SfKY0BC', 'avatar/tải xuống (3).webp', '', NULL, NULL, NULL, NULL, 'customer', 0, 0, 0, 0, NULL, NULL, NULL, 'active', NULL, '2025-05-18 08:16:13', '2025-05-18 17:10:16', NULL, NULL),
(19, NULL, NULL, 'Isaac', 'isaac@gmail.com', 'isaac@gmail.com', NULL, '$2y$12$9YXJfTTAbQgi6PyfMFSgKew/LOiuZ2czXT8oVqCkJFW.1una2aSsq', 'avatar/tải xuống (2).webp', '', NULL, NULL, NULL, NULL, 'customer', 0, 0, 0, 0, NULL, NULL, NULL, 'active', NULL, '2025-05-18 08:16:40', '2025-05-18 17:09:50', NULL, NULL),
(20, NULL, NULL, 'Kay Trần', 'kaytran@gmail.com', 'kaytran@gmail.com', NULL, '$2y$12$sMR/.PorT4RUEvvwLsGhN.PgW7OGyEl8jaC7zyPZezo5CPw1Dj3vm', 'avatar/tải xuống.webp', '', NULL, NULL, NULL, NULL, 'customer', 0, 0, 0, 0, NULL, NULL, NULL, 'active', NULL, '2025-05-18 08:17:55', '2025-05-18 17:08:32', NULL, NULL),
(21, NULL, NULL, 'longle', 'longle@gmail.com', 'longle@gmail.com', NULL, '$2y$12$97ebxm9/LTgU7N7xfgcNDOF0iJtBLRIK.d9cMGh1hSDbYXmquda9y', 'avatar/img2.jpg', '012345676324', NULL, 'Chill Chill', NULL, NULL, 'customer', 0, 0, 0, 0, NULL, NULL, 'Lê duẩn, TP BMT, Đắk Lắk', 'active', NULL, '2025-05-21 07:05:03', '2025-05-21 07:45:01', '1', '1'),
(22, NULL, NULL, 'arlong', 'arlong@gmail.com', 'arlong@gmail.com', NULL, '$2y$12$Lip6.PSlFQfTLDo0Fpg29.Zey6G9k7qRzWScGnkjvsh03sP036hYu', 'avatar/img3.jpg', '0302158434', NULL, 'Good boy', NULL, NULL, 'customer', 0, 0, 0, 0, NULL, NULL, 'Lê duẩn, TP BMT, Đắk Lắk', 'active', NULL, '2025-05-21 07:40:31', '2025-05-21 07:45:27', NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `u_groups`
--

CREATE TABLE `u_groups` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `blogs_slug_unique` (`slug`) USING BTREE;

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `blog_categories_slug_unique` (`slug`) USING BTREE;

--
-- Indexes for table `blog_coment`
--
ALTER TABLE `blog_coment`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `blog_reply`
--
ALTER TABLE `blog_reply`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `cmd_functions`
--
ALTER TABLE `cmd_functions`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `comment_children`
--
ALTER TABLE `comment_children`
  ADD PRIMARY KEY (`id` DESC) USING BTREE;

--
-- Indexes for table `composers`
--
ALTER TABLE `composers`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `composers_slug_unique` (`slug`) USING BTREE,
  ADD KEY `composers_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `events_slug_unique` (`slug`) USING BTREE,
  ADD KEY `events_event_type_id_foreign` (`event_type_id`) USING BTREE;

--
-- Indexes for table `event_blogs`
--
ALTER TABLE `event_blogs`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `event_blogs_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `event_blogs_event_id_foreign` (`event_id`) USING BTREE,
  ADD KEY `event_blogs_blog_id_foreign` (`blog_id`) USING BTREE;

--
-- Indexes for table `event_groups`
--
ALTER TABLE `event_groups`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `event_groups_group_id_foreign` (`group_id`) USING BTREE,
  ADD KEY `event_groups_event_id_foreign` (`event_id`) USING BTREE;

--
-- Indexes for table `event_types`
--
ALTER TABLE `event_types`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `event_types_slug_unique` (`slug`) USING BTREE;

--
-- Indexes for table `event_users`
--
ALTER TABLE `event_users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `event_users_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `event_users_event_id_foreign` (`event_id`) USING BTREE,
  ADD KEY `event_users_role_id_foreign` (`role_id`) USING BTREE;

--
-- Indexes for table `fanclubs`
--
ALTER TABLE `fanclubs`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `fanclubs_slug_unique` (`slug`) USING BTREE,
  ADD KEY `fanclubs_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indexes for table `fanclub_blogs`
--
ALTER TABLE `fanclub_blogs`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fanclub_blogs_fanclub_id_foreign` (`fanclub_id`) USING BTREE,
  ADD KEY `fanclub_blogs_blog_id_foreign` (`blog_id`) USING BTREE;

--
-- Indexes for table `fanclub_items`
--
ALTER TABLE `fanclub_items`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fanclub_items_resource_id_foreign` (`resource_id`) USING BTREE;

--
-- Indexes for table `fanclub_users`
--
ALTER TABLE `fanclub_users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fanclub_users_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `fanclub_users_fanclub_id_foreign` (`fanclub_id`) USING BTREE,
  ADD KEY `fanclub_users_role_id_foreign` (`role_id`) USING BTREE;

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`id` DESC) USING BTREE;

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `group_blogs`
--
ALTER TABLE `group_blogs`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `group_folders`
--
ALTER TABLE `group_folders`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `group_members`
--
ALTER TABLE `group_members`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `group_roles`
--
ALTER TABLE `group_roles`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `group_types`
--
ALTER TABLE `group_types`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `image_user`
--
ALTER TABLE `image_user`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `listeners`
--
ALTER TABLE `listeners`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `music_companies`
--
ALTER TABLE `music_companies`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `music_companies_slug_unique` (`slug`) USING BTREE,
  ADD KEY `music_companies_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indexes for table `music_types`
--
ALTER TABLE `music_types`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `music_types_slug_unique` (`slug`) USING BTREE;

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`) USING BTREE;

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`) USING BTREE;

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `oauth_clients_user_id_index` (`user_id`) USING BTREE;

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`) USING BTREE;

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`) USING BTREE;

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`) USING BTREE;

--
-- Indexes for table `playlists`
--
ALTER TABLE `playlists`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `playlists_slug_unique` (`slug`) USING BTREE,
  ADD KEY `playlists_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `post_user`
--
ALTER TABLE `post_user`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `reply_comment`
--
ALTER TABLE `reply_comment`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `resources_slug_unique` (`slug`) USING BTREE;

--
-- Indexes for table `resource_link_types`
--
ALTER TABLE `resource_link_types`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `resource_link_types_code_unique` (`code`) USING BTREE;

--
-- Indexes for table `resource_types`
--
ALTER TABLE `resource_types`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `resource_types_code_unique` (`code`) USING BTREE;

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `role_functions`
--
ALTER TABLE `role_functions`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `sessions_user_id_index` (`user_id`) USING BTREE,
  ADD KEY `sessions_last_activity_index` (`last_activity`) USING BTREE;

--
-- Indexes for table `setting_details`
--
ALTER TABLE `setting_details`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `singers`
--
ALTER TABLE `singers`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `singers_slug_unique` (`slug`) USING BTREE;

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `songs_slug_unique` (`slug`) USING BTREE,
  ADD KEY `songs_composer_id_foreign` (`composer_id`) USING BTREE,
  ADD KEY `songs_singer_id_foreign` (`singer_id`) USING BTREE,
  ADD KEY `songs_musictype_id_foreign` (`musictype_id`) USING BTREE;

--
-- Indexes for table `song_coment`
--
ALTER TABLE `song_coment`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `song_like_dislike`
--
ALTER TABLE `song_like_dislike`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `song_reply`
--
ALTER TABLE `song_reply`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `tag_blogs`
--
ALTER TABLE `tag_blogs`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `t_blogs`
--
ALTER TABLE `t_blogs`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `t_comments`
--
ALTER TABLE `t_comments`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `t_items`
--
ALTER TABLE `t_items`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `t_motions`
--
ALTER TABLE `t_motions`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `t_motion_items`
--
ALTER TABLE `t_motion_items`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `t_notices`
--
ALTER TABLE `t_notices`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `t_options`
--
ALTER TABLE `t_options`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `t_pages`
--
ALTER TABLE `t_pages`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `t_page_items`
--
ALTER TABLE `t_page_items`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `t_questions`
--
ALTER TABLE `t_questions`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `t_recommends`
--
ALTER TABLE `t_recommends`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `t_surveys`
--
ALTER TABLE `t_surveys`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `t_tags`
--
ALTER TABLE `t_tags`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `t_tags_title_unique` (`title`) USING BTREE,
  ADD UNIQUE KEY `t_tags_slug_unique` (`slug`) USING BTREE;

--
-- Indexes for table `t_tag_items`
--
ALTER TABLE `t_tag_items`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `t_userpages`
--
ALTER TABLE `t_userpages`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `t_userpage_items`
--
ALTER TABLE `t_userpage_items`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `t_vote_items`
--
ALTER TABLE `t_vote_items`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `u_groups`
--
ALTER TABLE `u_groups`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog_coment`
--
ALTER TABLE `blog_coment`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `blog_reply`
--
ALTER TABLE `blog_reply`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cmd_functions`
--
ALTER TABLE `cmd_functions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `comment_children`
--
ALTER TABLE `comment_children`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `composers`
--
ALTER TABLE `composers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `event_blogs`
--
ALTER TABLE `event_blogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_groups`
--
ALTER TABLE `event_groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_types`
--
ALTER TABLE `event_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_users`
--
ALTER TABLE `event_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fanclubs`
--
ALTER TABLE `fanclubs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `fanclub_blogs`
--
ALTER TABLE `fanclub_blogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fanclub_items`
--
ALTER TABLE `fanclub_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fanclub_users`
--
ALTER TABLE `fanclub_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_blogs`
--
ALTER TABLE `group_blogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_folders`
--
ALTER TABLE `group_folders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_members`
--
ALTER TABLE `group_members`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_roles`
--
ALTER TABLE `group_roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_types`
--
ALTER TABLE `group_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `image_user`
--
ALTER TABLE `image_user`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `listeners`
--
ALTER TABLE `listeners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `music_companies`
--
ALTER TABLE `music_companies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `music_types`
--
ALTER TABLE `music_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `playlists`
--
ALTER TABLE `playlists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `post_user`
--
ALTER TABLE `post_user`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `reply_comment`
--
ALTER TABLE `reply_comment`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `resources`
--
ALTER TABLE `resources`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `resource_link_types`
--
ALTER TABLE `resource_link_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resource_types`
--
ALTER TABLE `resource_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `role_functions`
--
ALTER TABLE `role_functions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setting_details`
--
ALTER TABLE `setting_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `singers`
--
ALTER TABLE `singers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `songs`
--
ALTER TABLE `songs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `song_coment`
--
ALTER TABLE `song_coment`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `song_like_dislike`
--
ALTER TABLE `song_like_dislike`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `song_reply`
--
ALTER TABLE `song_reply`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tag_blogs`
--
ALTER TABLE `tag_blogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_blogs`
--
ALTER TABLE `t_blogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_comments`
--
ALTER TABLE `t_comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_items`
--
ALTER TABLE `t_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_motions`
--
ALTER TABLE `t_motions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_motion_items`
--
ALTER TABLE `t_motion_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_notices`
--
ALTER TABLE `t_notices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_options`
--
ALTER TABLE `t_options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_pages`
--
ALTER TABLE `t_pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_page_items`
--
ALTER TABLE `t_page_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_questions`
--
ALTER TABLE `t_questions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_recommends`
--
ALTER TABLE `t_recommends`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_surveys`
--
ALTER TABLE `t_surveys`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_tags`
--
ALTER TABLE `t_tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_tag_items`
--
ALTER TABLE `t_tag_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_userpages`
--
ALTER TABLE `t_userpages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_userpage_items`
--
ALTER TABLE `t_userpage_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_vote_items`
--
ALTER TABLE `t_vote_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `u_groups`
--
ALTER TABLE `u_groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `composers`
--
ALTER TABLE `composers`
  ADD CONSTRAINT `composers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_event_type_id_foreign` FOREIGN KEY (`event_type_id`) REFERENCES `event_types` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `event_blogs`
--
ALTER TABLE `event_blogs`
  ADD CONSTRAINT `event_blogs_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `event_blogs_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `event_blogs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `event_groups`
--
ALTER TABLE `event_groups`
  ADD CONSTRAINT `event_groups_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `event_groups_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `event_users`
--
ALTER TABLE `event_users`
  ADD CONSTRAINT `event_users_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `event_users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  ADD CONSTRAINT `event_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `fanclubs`
--
ALTER TABLE `fanclubs`
  ADD CONSTRAINT `fanclubs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `fanclub_blogs`
--
ALTER TABLE `fanclub_blogs`
  ADD CONSTRAINT `fanclub_blogs_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `fanclub_blogs_fanclub_id_foreign` FOREIGN KEY (`fanclub_id`) REFERENCES `fanclubs` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `fanclub_items`
--
ALTER TABLE `fanclub_items`
  ADD CONSTRAINT `fanclub_items_resource_id_foreign` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `fanclub_users`
--
ALTER TABLE `fanclub_users`
  ADD CONSTRAINT `fanclub_users_fanclub_id_foreign` FOREIGN KEY (`fanclub_id`) REFERENCES `fanclubs` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `fanclub_users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `fanclub_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `music_companies`
--
ALTER TABLE `music_companies`
  ADD CONSTRAINT `music_companies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `playlists`
--
ALTER TABLE `playlists`
  ADD CONSTRAINT `playlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `songs`
--
ALTER TABLE `songs`
  ADD CONSTRAINT `songs_composer_id_foreign` FOREIGN KEY (`composer_id`) REFERENCES `composers` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `songs_musictype_id_foreign` FOREIGN KEY (`musictype_id`) REFERENCES `music_types` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `songs_singer_id_foreign` FOREIGN KEY (`singer_id`) REFERENCES `singers` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
