-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 09, 2022 lúc 01:29 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `online_store`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chi_muc_gio_hang`
--

CREATE TABLE `chi_muc_gio_hang` (
  `id` bigint(20) NOT NULL,
  `so_luong` int(11) NOT NULL,
  `ma_gio_hang` bigint(20) DEFAULT NULL,
  `ma_san_pham` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chi_tiet_don_hang`
--

CREATE TABLE `chi_tiet_don_hang` (
  `id` bigint(20) NOT NULL,
  `don_gia` bigint(20) NOT NULL,
  `so_luong` int(11) NOT NULL DEFAULT 1,
  `ma_don_hang` bigint(20) DEFAULT NULL,
  `ma_san_pham` bigint(20) DEFAULT NULL,
  `so_luong_dat` int(11) NOT NULL,
  `so_luong_nhan_hang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `chi_tiet_don_hang`
--

INSERT INTO `chi_tiet_don_hang` (`id`, `don_gia`, `so_luong`, `ma_don_hang`, `ma_san_pham`, `so_luong_dat`, `so_luong_nhan_hang`) VALUES
(262, 900000, 1, 180, 32, 1, 1),
(263, 3200000, 1, 181, 38, 1, 1),
(264, 9000000, 1, 181, 34, 1, 1),
(265, 15800000, 1, 181, 28, 1, 1),
(266, 3800000, 1, 181, 25, 1, 1),
(267, 900000, 1, 182, 32, 1, 1),
(268, 15800000, 1, 182, 28, 1, 1),
(269, 3800000, 1, 182, 25, 1, 1),
(270, 3900000, 1, 182, 27, 1, 1),
(271, 12000000, 1, 183, 29, 2, 2),
(272, 1860000, 1, 183, 26, 1, 1),
(273, 3900000, 1, 184, 27, 1, 1),
(274, 1860000, 1, 184, 26, 1, 1),
(275, 5000000, 1, 185, 16, 1, 1),
(276, 7900000, 1, 185, 13, 1, 1),
(277, 6800000, 1, 185, 15, 1, 1),
(278, 9000000, 1, 186, 34, 1, 2),
(279, 6900000, 1, 186, 4, 3, 1),
(280, 900000, 1, 187, 32, 1, 1),
(281, 7800000, 1, 187, 27, 2, 2),
(282, 5580000, 1, 187, 26, 3, 2),
(283, 4560000, 1, 188, 6, 2, 2),
(284, 900000, 1, 189, 35, 1, 0),
(285, 1860000, 1, 189, 26, 1, 0),
(286, 6000000, 1, 189, 29, 1, 1),
(287, 900000, 1, 190, 35, 1, 1),
(288, 900000, 1, 191, 35, 1, 1),
(289, 9000000, 1, 191, 34, 1, 1),
(290, 3900000, 1, 192, 27, 1, 1),
(291, 6000000, 1, 193, 29, 1, 1),
(292, 3800000, 1, 193, 25, 1, 1),
(293, 1860000, 1, 194, 26, 1, 1),
(294, 15800000, 1, 194, 28, 1, 1),
(295, 2000000, 1, 195, 30, 1, 1),
(296, 900000, 1, 196, 32, 1, 1),
(297, 3800000, 1, 196, 25, 1, 1),
(298, 3900000, 1, 196, 27, 1, 1),
(299, 3720000, 1, 196, 26, 2, 2),
(300, 1860000, 1, 201, 26, 1, 1),
(301, 3900000, 1, 201, 21, 1, 1),
(302, 6000000, 1, 203, 29, 1, 1),
(303, 2280000, 1, 204, 6, 1, 1),
(304, 1350000, 1, 205, 33, 1, 1),
(305, 2200000, 1, 205, 20, 1, 1),
(306, 3900000, 1, 205, 27, 1, 1),
(307, 9000000, 1, 206, 34, 1, 1),
(308, 3800000, 1, 206, 25, 1, 1),
(309, 5000000, 1, 207, 16, 1, 1),
(310, 9000000, 1, 208, 34, 1, 1),
(311, 900000, 1, 216, 35, 1, 0),
(312, 6000000, 1, 216, 29, 1, 0),
(313, 2280000, 1, 216, 6, 1, 0),
(314, 2200000, 1, 216, 19, 1, 0),
(315, 6800000, 1, 217, 15, 1, 0),
(316, 3900000, 1, 217, 21, 1, 0),
(317, 2200000, 1, 218, 20, 1, 0),
(318, 1500000, 1, 218, 10, 1, 0),
(319, 1250000, 1, 218, 31, 1, 0),
(320, 900000, 1, 219, 32, 1, 0),
(321, 2200000, 1, 219, 19, 1, 0),
(322, 3200000, 1, 219, 38, 1, 0),
(323, 3900000, 1, 220, 27, 1, 0),
(324, 2200000, 1, 220, 20, 1, 0),
(325, 2200000, 1, 220, 9, 1, 0),
(326, 900000, 1, 221, 32, 1, 0),
(327, 6000000, 1, 221, 29, 1, 0),
(328, 9000000, 1, 221, 34, 1, 0),
(329, 1350000, 1, 222, 33, 1, 0),
(330, 6800000, 1, 222, 15, 1, 0),
(331, 2200000, 1, 222, 19, 1, 0),
(332, 3000000, 1, 222, 7, 1, 0),
(333, 1860000, 1, 223, 26, 1, 0),
(334, 5600000, 1, 223, 2, 1, 0),
(335, 9000000, 1, 224, 34, 1, 0),
(336, 3900000, 1, 225, 27, 1, 0),
(337, 3800000, 1, 225, 25, 1, 0),
(338, 1860000, 1, 225, 26, 1, 0),
(339, 9000000, 1, 229, 34, 1, 0),
(340, 1350000, 1, 229, 33, 1, 0),
(341, 9000000, 1, 231, 34, 1, 0),
(342, 9000000, 1, 232, 34, 1, 0),
(343, 900000, 1, 232, 32, 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danh_muc`
--

CREATE TABLE `danh_muc` (
  `id` bigint(20) NOT NULL,
  `ten_danh_muc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `danh_muc`
--

INSERT INTO `danh_muc` (`id`, `ten_danh_muc`) VALUES
(1, 'BÌNH TÀI LỘC'),
(2, 'BÌNH HOA - LỌ HOA'),
(3, 'TRỨNG PHONG THỦY'),
(4, 'HỒ LÔ GỐM SỨ'),
(5, 'ĐÈN BÀN GỐM'),
(6, 'TRANH GỐM'),
(7, 'TƯỢNG GỐM'),
(8, 'ĐĨA CẢNH');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `don_hang`
--

CREATE TABLE `don_hang` (
  `id` bigint(20) NOT NULL,
  `dia_chi_nhan` varchar(255) DEFAULT NULL,
  `ghi_chu` varchar(255) DEFAULT NULL,
  `ho_ten_nguoi_nhan` varchar(255) DEFAULT NULL,
  `ngay_dat_hang` datetime DEFAULT NULL,
  `ngay_giao_hang` datetime DEFAULT NULL,
  `ngay_nhan_hang` datetime DEFAULT NULL,
  `sdt_nhan_hang` varchar(255) DEFAULT NULL,
  `trang_thai_don_hang` varchar(255) DEFAULT NULL,
  `ma_nguoi_dat` bigint(20) DEFAULT NULL,
  `tong_gia_tri` bigint(20) NOT NULL,
  `ma_employee` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `don_hang`
--

INSERT INTO `don_hang` (`id`, `dia_chi_nhan`, `ghi_chu`, `ho_ten_nguoi_nhan`, `ngay_dat_hang`, `ngay_giao_hang`, `ngay_nhan_hang`, `sdt_nhan_hang`, `trang_thai_don_hang`, `ma_nguoi_dat`, `tong_gia_tri`, `ma_employee`) VALUES
(180, 'Hà Nội', 'No problem', 'Lxzvy', '2022-06-17 00:59:36', '2022-06-17 01:20:41', '2022-06-17 01:22:19', '0302547244', 'Hoàn thành', 29, 900000, 30),
(181, 'California', 'Khách VIP', 'Người Dơi', '2022-06-17 21:13:32', '2022-06-17 21:15:27', '2022-06-21 01:07:22', '0978462468', 'Hoàn thành', 34, 31800000, 35),
(182, 'New York', 'Ok', 'Thần Sấm', '2022-06-21 01:50:17', '2022-06-21 01:50:41', '2022-06-21 01:51:03', '0989898989', 'Hoàn thành', 39, 24400000, 36),
(183, 'New York', 'Ok', 'Người Sắt', '2022-06-22 20:10:39', '2022-06-22 20:11:17', '2022-06-22 20:12:34', '0999988899', 'Hoàn thành', 38, 13860000, 35),
(184, 'California', 'Hoàn thành', 'Người Dơi', '2022-06-22 20:17:11', '2022-06-22 20:19:37', '2022-06-22 20:20:38', '0978462468', 'Hoàn thành', 34, 5760000, 37),
(185, 'California', 'Ok', 'Người Dơi', '2022-06-22 20:22:30', '2022-06-22 20:26:17', '2022-06-22 20:28:23', '0978462468', 'Hoàn thành', 34, 19700000, 35),
(186, 'New York', 'Ok', 'Thần Sấm', '2022-06-22 20:29:50', '2022-06-22 20:30:54', '2022-06-22 20:32:05', '0989898989', 'Hoàn thành', 39, 15900000, 35),
(187, 'California', 'Ok', 'Người Dơi', '2022-06-23 21:19:13', '2022-06-23 21:21:00', '2022-06-23 21:21:00', '0978462468', 'Đang giao', 34, 14280000, 35),
(188, 'New York', NULL, 'Người Sắt', '2022-06-23 23:08:17', '2022-06-23 23:18:47', '2022-10-01 02:45:14', '0999988899', 'Hoàn thành', 38, 4560000, 35),
(189, 'California', NULL, 'Người Dơi', '2022-09-06 10:37:39', '2022-09-06 10:46:51', '2022-09-06 10:49:53', '0978462468', 'Hoàn thành', 34, 8760000, 35),
(190, 'California', 'None', 'Người Dơi', '2022-09-06 10:40:42', '2022-09-28 00:05:41', '2022-10-01 02:35:07', '0978462468', 'Đã bị hủy', 34, 900000, 35),
(191, 'California', NULL, 'Người Dơi', '2022-09-27 23:38:33', '2022-10-01 02:29:36', '2022-10-01 02:33:58', '0978462468', 'Hoàn thành', 34, 9900000, 36),
(192, 'California', 'None', 'Người Dơi', '2022-09-27 23:41:48', '2022-09-28 00:05:48', '2022-09-28 00:05:48', '0978462468', 'Đang giao', 34, 3900000, 35),
(193, 'New York', NULL, 'Thần Sấm', '2022-09-27 23:46:54', '2022-10-01 02:29:41', '2022-10-01 02:29:41', '0989898989', 'Đang giao', 39, 9800000, 36),
(194, 'New York', 'None', 'Người Sắt', '2022-09-27 23:47:54', '2022-09-28 00:05:57', '2022-09-28 00:05:57', '0999988899', 'Đang giao', 38, 17660000, 35),
(195, 'New York', 'Đổi địa chỉ nhận hàng', 'Người Sắt', '2022-09-27 23:48:28', NULL, '2022-09-28 00:06:52', '0999988899', 'Đã bị hủy', 38, 2000000, 35),
(196, 'New York', NULL, 'Người Sắt', '2022-09-27 23:49:58', '2022-10-01 02:30:18', '2022-10-01 02:30:18', '0999988899', 'Đang giao', 38, 12320000, 36),
(201, 'California', NULL, 'Người Dơi', '2022-09-28 15:59:24', '2022-10-01 02:30:30', '2022-10-01 02:34:10', '0978462468', 'Đã bị hủy', 34, 5760000, 36),
(203, 'California', 'Ok', 'Người Dơi', '2022-09-28 16:00:27', '2022-10-01 02:30:41', '2022-10-01 02:33:40', '0978462468', 'Hoàn thành', 34, 6000000, 37),
(204, 'California', NULL, 'Người Dơi', '2022-09-28 16:01:24', '2022-10-01 02:30:46', '2022-10-01 02:30:46', '0978462468', 'Đang giao', 34, 2280000, 37),
(205, 'New York', NULL, 'Thần Sấm', '2022-09-28 16:01:55', '2022-10-01 02:30:52', '2022-10-01 02:30:52', '0989898989', 'Đang giao', 39, 7450000, 37),
(206, 'New York', 'Ok', 'Người Sắt', '2022-09-28 16:03:14', '2022-10-01 02:31:34', '2022-10-01 02:33:13', '0999988899', 'Hoàn thành', 38, 12800000, 30),
(207, 'New York', NULL, 'Người Sắt', '2022-09-28 16:05:59', '2022-10-01 02:31:47', '2022-10-01 02:31:47', '0999988899', 'Đang giao', 38, 5000000, 30),
(208, 'New York', NULL, 'Thần Sấm', '2022-10-01 02:20:56', '2022-10-01 02:31:55', '2022-10-01 02:31:55', '0989898989', 'Đang giao', 39, 9000000, 30),
(216, 'New York', NULL, 'Thần Sấm', '2022-10-01 02:42:27', NULL, NULL, '0989898989', 'Đang chờ xác nhận khách mua', 39, 11380000, NULL),
(217, 'New York', NULL, 'Thần Sấm', '2022-10-01 02:43:07', NULL, NULL, '0989898989', 'Đang chờ xác nhận khách mua', 39, 10700000, NULL),
(218, 'New York', NULL, 'Người Sắt', '2022-10-01 02:43:38', NULL, NULL, '0999988899', 'Đang chờ xác nhận khách mua', 38, 4950000, NULL),
(219, 'New York', NULL, 'Người Sắt', '2022-10-01 02:44:17', NULL, NULL, '0999988899', 'Đang chờ xác nhận khách mua', 38, 6300000, NULL),
(220, 'California', NULL, 'Người Dơi', '2022-10-01 02:46:51', NULL, NULL, '0978462468', 'Đang chờ xác nhận khách mua', 34, 8300000, NULL),
(221, 'Cầu Giấy - Hà Nội', NULL, 'Naul', '2022-10-01 02:48:02', NULL, NULL, '0989464919', 'Đang chờ xác nhận khách mua', 43, 15900000, NULL),
(222, 'Cầu Giấy - Hà Nội', NULL, 'Naul', '2022-10-01 02:48:55', NULL, NULL, '0989464919', 'Đang chờ xác nhận khách mua', 43, 13350000, NULL),
(223, 'Cầu Giấy - Hà Nội', NULL, 'Naul', '2022-10-01 02:49:12', NULL, NULL, '0989464919', 'Đang chờ xác nhận khách mua', 43, 7460000, NULL),
(224, 'Everywhere...', NULL, 'Superman', '2022-10-05 21:14:24', NULL, NULL, '0978462499', 'Đang chờ xác nhận khách mua', 34, 9000000, NULL),
(225, 'Everywhere...', NULL, 'Superman', '2022-10-05 21:42:06', NULL, NULL, '0978462499', 'Đang chờ xác nhận khách mua', 34, 9560000, NULL),
(229, 'California', NULL, 'Batman\'s wife', '2022-10-05 23:28:53', NULL, NULL, '0981566544', 'Đang chờ xác nhận khách mua', 34, 10350000, NULL),
(231, 'California', NULL, 'Someone', '2022-10-06 21:27:02', NULL, NULL, '0989564866', 'Đang chờ xác nhận khách mua', 34, 9000000, NULL),
(232, 'California', NULL, 'Người Dơi', '2022-10-09 01:14:49', NULL, NULL, '0978462468', 'Đang chờ xác nhận khách mua', 34, 9900000, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gio_hang`
--

CREATE TABLE `gio_hang` (
  `id` bigint(20) NOT NULL,
  `tong_tien` varchar(255) DEFAULT NULL,
  `ma_nguoi_dung` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `gio_hang`
--

INSERT INTO `gio_hang` (`id`, `tong_tien`, `ma_nguoi_dung`) VALUES
(11, NULL, 39),
(12, NULL, 38),
(13, NULL, 34),
(14, NULL, 43);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hang_san_xuat`
--

CREATE TABLE `hang_san_xuat` (
  `id` bigint(20) NOT NULL,
  `ten_hang_san_xuat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hang_san_xuat`
--

INSERT INTO `hang_san_xuat` (`id`, `ten_hang_san_xuat`) VALUES
(2, 'BÁT TRÀNG');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lien_he`
--

CREATE TABLE `lien_he` (
  `id` bigint(20) NOT NULL,
  `email_lien_he` varchar(255) DEFAULT NULL,
  `ngay_lien_he` datetime DEFAULT NULL,
  `ngay_tra_loi` datetime DEFAULT NULL,
  `noi_dung_lien_he` varchar(255) DEFAULT NULL,
  `noi_dung_tra_loi` varchar(255) DEFAULT NULL,
  `trang_thai` varchar(255) DEFAULT NULL,
  `ma_nguoi_tra_loi` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `lien_he`
--

INSERT INTO `lien_he` (`id`, `email_lien_he`, `ngay_lien_he`, `ngay_tra_loi`, `noi_dung_lien_he`, `noi_dung_tra_loi`, `trang_thai`, `ma_nguoi_tra_loi`) VALUES
(5, 'lnd@gmail.com', '2022-06-06 22:48:11', NULL, 'Em muốn lái máy bay', NULL, 'Đang chờ trả lời', NULL),
(6, 'member1@gmail.com', '2022-06-06 22:48:11', '2022-06-06 23:48:11', 'Á há há', 'Í hí hí', 'Đã trả lời', NULL),
(7, 'member1@gmail.com', '2022-06-06 22:48:11', NULL, 'Yo', NULL, 'Đang chờ trả lời', NULL),
(8, 'member2@gmail.com', '2022-06-06 22:48:11', '2022-06-23 21:35:34', 'Em xin địa chỉ cửa hàng với ạ', 'Ừ', 'Đã trả lời', NULL),
(9, 'member2@gmail.com', '2022-06-06 22:48:11', NULL, 'Em muốn xin số điện thoại nhân viên giao hàng', NULL, 'Đang chờ trả lời', NULL),
(10, 'luan59456@gmail.com', '2022-06-23 22:04:06', '2022-06-23 22:04:34', 'Asolo', 'OkOk', 'Đã trả lời', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoidung_vaitro`
--

CREATE TABLE `nguoidung_vaitro` (
  `ma_nguoi_dung` bigint(20) NOT NULL,
  `ma_vai_tro` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `nguoidung_vaitro`
--

INSERT INTO `nguoidung_vaitro` (`ma_nguoi_dung`, `ma_vai_tro`) VALUES
(29, 1),
(30, 7),
(33, 1),
(34, 2),
(35, 7),
(36, 7),
(37, 7),
(38, 2),
(39, 2),
(40, 1),
(41, 2),
(42, 7),
(43, 2),
(44, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoi_dung`
--

CREATE TABLE `nguoi_dung` (
  `id` bigint(20) NOT NULL,
  `dia_chi` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `ho_ten` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `so_dien_thoai` varchar(255) DEFAULT NULL,
  `is_blocked` bit(1) DEFAULT NULL,
  `block_todate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `nguoi_dung`
--

INSERT INTO `nguoi_dung` (`id`, `dia_chi`, `email`, `ho_ten`, `password`, `so_dien_thoai`, `is_blocked`, `block_todate`) VALUES
(29, 'Cầu Giấy - Hà Nội', 'lxzvy@gmail.com', 'Lxzvy', '$2a$10$EPbXj8r3p10Xa5tMX8kiwO5dnExjcVLIE.UBYsR/4ZNOYY5iy7eyq', '0986246998', b'0', '1970-01-01 07:00:00'),
(30, 'Hà Đông - Hà Nội', 'employee4@gmail.com', 'Empl D', '$2a$10$t5Bla5z2dtEGFUKm88Wvbes5zqRY9HPNGYyNkWOqphkxR5kG6gxTG', '0988802555', b'0', '1970-01-01 07:00:00'),
(33, 'Cầu Giấy - Hà Nội', 'luannguyenduc@gmail.com', 'Nguyễn Đức Luân', '$2a$10$5Cpgb.jQstUZD2.rOmG7sOodhV.4K3CrB0mn3henazlIOh9D8isd.', '0986424689', b'0', '1970-01-01 07:00:00'),
(34, 'California', 'batman@gmail.com', 'Người Dơi', '$2a$10$fAT205.ph5CoyfmvFuzmpOR8M9reNdYZ8L1WMXFZDKfzZwLKXzAFC', '0978462468', b'0', '1970-01-01 07:00:00'),
(35, 'Cầu Giấy - Hà Nội', 'employee1@gmail.com', 'Empl A', '$2a$10$ePlcF1jJmTzoKQgsmMEesOb9D6EPqCHWDt4S9xWWSgo5rxTtRU0.K', '0978797679', b'0', '1970-01-01 07:00:00'),
(36, 'Tây Hồ - Hà Nội', 'employee2@gmail.com', 'Empl B', '$2a$10$XQeOcZfln3/Z75n6Zz/3aOghAKjs1203uMT9wbf8qQwMWn.OySPQy', '0978797999', b'0', '1970-01-01 07:00:00'),
(37, 'Bắc Từ Liêm - Hà Nội', 'employee3@gmail.com', 'Empl C', '$2a$10$bHEupoIY.j9ThDyjq68QR..pC6sPbwzGbSfY4vfk0.dF1.zcTVr4i', '0978698516', b'0', '1970-01-01 07:00:00'),
(38, 'New York', 'ironman@gmail.com', 'Người Sắt', '$2a$10$nlMUbba9VXVeGwiNp/D93urnxfVAwWr/u.Tjb9xWAdCcXutBmKW3C', '0999988899', b'0', '1970-01-01 07:00:00'),
(39, 'New York', 'thor@gmail.com', 'Thần Sấm', '$2a$10$XQEwyGwBbmaC6/Gu/ArgZ.tN5Ti/ytcscoCQsbtP9PMU179PVNObO', '0989898989', b'0', '1970-01-01 07:00:00'),
(40, 'Nam Từ Liêm - Hà Nội', 'admin@gmail.com', 'Admin', '$2a$10$NE/3zQ15pyE4S9ydi1dpHeEe4K5JxxC5t0UIr0czE8iriyBQS/lce', '0333456789', b'0', '1970-01-01 07:00:00'),
(41, 'Quận 7 - TP.Hồ Chí Minh', 'member@gmail.com', 'Member X', '$2a$10$XymJm.rqSMeKMmiaIiS1r.5bEiE4ApXnFK3bhO7zZ.RF8SBXuYmPS', '0989636699', b'0', '1970-01-01 07:00:00'),
(42, 'Cầu Giấy - Hà Nội', 'employee@gmail.com', 'Empl X', '$2a$10$iQXJo27eiab90AH9nfBTN.yg4vKgcsO4/5ypyxMqZNvlqwxYipoRa', '0369369699', b'0', '1970-01-01 07:00:00'),
(43, 'Cầu Giấy - Hà Nội', 'luan59456@gmail.com', 'Naul', '$2a$10$e58X.KWVnU2FkoMBeUE0nex0q.3zbgcevrbU2nY.8C0wi8fvXCfmi', '0989464919', b'0', '1970-01-01 07:00:00'),
(44, 'London', 'kvealend@gmail.com', 'Kvealend', '$2a$10$6kVu0LIKpEMtdlQ5/bDL7uwH.OswSYDv.ZhHf/r9YrZQ7a9XwBKUK', '0946247274', b'1', '3000-01-01 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `san_pham`
--

CREATE TABLE `san_pham` (
  `id` bigint(20) NOT NULL,
  `ma_danh_muc` bigint(20) DEFAULT NULL,
  `ma_hang_sx` bigint(20) DEFAULT NULL,
  `ten_san_pham` varchar(255) DEFAULT NULL,
  `thong_tin_chung` varchar(255) DEFAULT NULL,
  `don_gia` bigint(20) NOT NULL,
  `so_luong` int(11) NOT NULL,
  `thiet_ke` varchar(255) DEFAULT NULL,
  `mau_sac` varchar(255) NOT NULL,
  `chat_lieu` varchar(255) NOT NULL,
  `kich_thuoc` varchar(255) NOT NULL,
  `thong_tin_bao_hanh` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `san_pham`
--

INSERT INTO `san_pham` (`id`, `ma_danh_muc`, `ma_hang_sx`, `ten_san_pham`, `thong_tin_chung`, `don_gia`, `so_luong`, `thiet_ke`, `mau_sac`, `chat_lieu`, `kich_thuoc`, `thong_tin_bao_hanh`) VALUES
(2, 1, 2, 'BÌNH HÚT LỘC VẼ VÀNG THUẬN BUỒM XUÔI GIÓ CAO CẤP H35', 'Bình tài lộc xét về hình dáng miệng loe rộng, giữa cổ thắt lại thân dưới phình to đến cực đại và điểm cuối thu nhỏ lại dần đặt lên trên kệ gỗ rất phù hợp.', 5600000, 96, 'Nhị cảnh thuận buồm xuôi gió, chữ Lộc', 'xanh lam vẽ vàng', 'Sứ cao cấp vẽ vàng 34k', 'Cao 35 cm', '12 tháng'),
(3, 1, 2, 'BÌNH HÚT LỘC CÔNG DANH PHÚ QUÝ VẼ VÀNG 30CM', 'Bình tài lộc xét về hình dáng miệng loe rộng, giữa cổ thắt lại thân dưới phình to đến cực đại và điểm cuối thu nhỏ lại dần đặt lên trên kệ gỗ rất phù hợp.', 3500000, 99, 'Chim công, hoa đào, phù dung', '', 'Sứ cao cấp vẽ vàng 34k', 'Cao 30 cm', '12 tháng'),
(4, 1, 2, 'BÌNH HÚT LỘC CHIM CÔNG HOA ĐÀO NỀN VÀNG 35CM', 'Bình tài lộc xét về hình dáng miệng loe rộng, giữa cổ thắt lại thân dưới phình to đến cực đại và điểm cuối thu nhỏ lại dần đặt lên trên kệ gỗ rất phù hợp. ', 2300000, 99, 'Chim công, hoa đào, phù dung', 'Phối màu, nền vàng', 'Sứ cao cấp ', 'Cao 35 cm', '12 tháng'),
(5, 1, 2, 'BÌNH HÚT LỘC NHỊ CẢNH BÁCH NHI BÁCH PHÚC 35CM', 'Bình tài lộc xét về hình dáng miệng loe rộng, giữa cổ thắt lại thân dưới phình to đến cực đại và điểm cuối thu nhỏ lại dần đặt lên trên kệ gỗ rất phù hợp.', 4800000, 100, 'Bách nhi đồ, bách nhi bách phúc', 'Phối màu', ' Sứ cao cấp vẽ vàng 24k', 'Cao 35 cm', '12 tháng'),
(6, 1, 2, 'BÌNH TÀI LỘC HOÀNG LONG NHẢ NGỌC CAO 30CM', 'Với hình dáng như vậy thì bình tài lộc đã nói lên được giá trị của nó là vừa hút Tài Lộc lại vừa giữ Tài Lộc rất tốt. Người ta tin rằng sở hữu bình tài lộc trong nhà sẽ kích hoạt sinh khí, mang lại nhiều may mắn và tài vận cho gia chủ.', 2280000, 94, 'Rồng nổi', 'Men vàng', 'Sứ cao cấp ', 'Cao 30 cm', '12 tháng'),
(7, 2, 2, 'BÌNH GỐM KHẮC HOA CAO CẤP 35CM', 'Bình gốm khắc hoa cao cấp 35cm với kiểu dáng lạ mắt bình cắm hoa đẹp này còn có thể trưng bày như một bình gốm trang trí phòng khách, trang trí kệ ti vi, phòng làm việc…', 3000000, 99, 'Khắc hoa dây nổi', 'Vàng da lươn, vàng đất', 'Sứ cao cấp ', 'Cao 35 cm', '12 tháng'),
(8, 2, 2, 'TỎI CẢNH QUÊ SƠN MÀI THỦ CÔNG CAO 66CM', 'Lọ sơn mài Bát Tràng được làm bằng phương pháp thủ công truyền thống, kiểu dáng hiện đại kết hợp hoa văn vẽ cảnh đồng quê thuần Việt tạo nét độc đáo cho sản phẩm.', 2300000, 100, 'Vẽ cảnh quê', 'Sơn mài', 'Sứ cao cấp', 'Cao 66cm, đường kính 45cm', '12 tháng'),
(9, 2, 2, 'LỌ TỎI SƠN MÀI HOA PHÙ DUNG', 'Đóa hoa Phù Dung được rất nhiều người yêu thích bởi vẻ đẹp tinh tế, đáng yêu của nó. Buổi sáng hoa Phù Dung nở ra có màu thanh khiết, đến trưa từ từ chuyển sang hồng rồi hồng đậm… ', 2200000, 97, 'Hoa Sen khảm bạc', 'Sơn mài', 'Sứ cao cấp ', 'Cao 53 cm', '12 tháng'),
(10, 2, 2, 'BỘ 3 BÌNH TRANG TRÍ MÀU ĐEN TRẮNG', 'Bộ 3 bình trang trí đen và trắng này có thế trưng bày trang trí phòng khách trên giá kệ tivi, giá kệ phòng làm việc phong cách hiện đai', 1500000, 98, 'Hoa Dây', 'Trắng, đen', 'Sứ cao cấp ', 'Cao 30-20-10 cm', '12 tháng'),
(11, 2, 2, 'VÒ CẮM HOA MEN RẠN CAO 26 CM', 'Vò cắm hoa men rạn cao 26 cm gốm sứ Bát Tràng cao cấp', 1500000, 100, 'Vẽ Hoa', 'Men rạn', 'Sứ cao cấp ', 'Cao 26 cm, đường kính 26 cm', '12 tháng'),
(12, 3, 2, 'TRỨNG PHONG THỦY VẼ NHỊ CẢNH BÁCH NHI CAO 45CM', 'Trứng phong thủy vẽ nhị cảnh bách nhi cao 45cm là dòng sản phẩm cao cấp của Bát Tràng.\r\n', 7200000, 100, 'Nhị cảnh bách nhi đồ', 'Men phối màu', 'Sứ trắng men khử cao cấp', 'Cao 45 cm', '12 tháng'),
(13, 3, 2, 'TRỨNG SỨ CAO CẤP VẼ HOA SEN CAO 45 CM', 'Trứng sứ cao cấp vẽ hoa sen cao 45 cm là dòng sản phẩm cao cấp của Bát Tràng.\r\n\r\n', 7900000, 99, 'Hoa sen', 'Men phối màu', 'Sứ trắng men khử cao cấp', 'Cao 45 cm', '12 tháng'),
(14, 3, 2, 'TRỨNG BÁCH HOA PHÚ QUÝ GỐM SỨ BÁT TRÀNG 45CM', 'Trứng phong thuỷ có thể trưng bày phòng khách, phòng làm việc để mang lại may mắn, sự phát triển, sinh sôi nảy nở của công danh, sự nghiệp cũng nhưng thuận lợi trong kinh doanh, buôn bán.', 6800000, 100, 'Bách hoa phú quý', 'Ph', 'Sứ trắng khử', 'Cao 45 cm', '12 tháng'),
(15, 3, 2, 'TRỨNG PHONG THỦY CÁ CHÉP HOÁ RỒNG VẼ VÀNG CAO 50CM', 'Trứng phong thủy cá chép hoá rồng vẽ vàng h50 sản phẩm men Lam cao cấp của Bát Tràng\r\n\r\n', 6800000, 97, 'Cá chép vượt vũ môn, cá chép hoá rồng', 'Men Lam vẽ vàng', 'Sứ trắng khử vẽ vàng 24k', 'Cao 50 cm', '12 tháng'),
(16, 3, 2, 'TRỨNG PHONG THỦY VẼ CÁ CHÉP HOA SEN CAO 40CM', 'Trứng phong thủy vẽ cá chép hoa sen cao 40cm', 5000000, 98, 'Cá chép hoa sen', 'Phối màu', 'Sứ cao cấp ', 'Cao 45 cm', '12 tháng'),
(17, 4, 2, 'HỒ LÔ GỐM SỨ MEN RẠN CỔ CAO 40 CM', 'Hồ lô gốm sứ men rạn cổ để trưng bày theo phong thuỷ mang lại sức khỏe và sự bình yên cho gia chủ. Bình hồ lô phong thuỷ gắn liền với hình ảnh trái bầu buộc trên chiếc gậy của ông Thọ, đây chính là biểu tượng của niềm vui, sức khoẻ và an lành.', 1300000, 100, 'Sơn thuỷ hữu tình', 'Men rạn', 'Sứ cao cấp ', 'Cao 40 cm', '12 tháng'),
(18, 4, 2, 'HỒ LÔ GỐM SỨ VẼ SƠN THUỶ CAO 60 CM', 'Hồ lô gốm sứ vẽ sơn thuỷ cao thường dùng để trưng bày để mang lại sức khỏe và sự bình yên cho gia chủ. Hồ lô phong thuỷ có hình trái bầu và luôn gắn liền với hình ảnh trên chiếc gậy của ông Thọ, đó chính là biểu tượng của sức khỏe, niềm vui và an lành.', 1600000, 1, 'Sơn thuỷ hữu tình', 'Men rạn', 'Sứ cao cấp', 'Cao 60 cm', '12 tháng'),
(19, 4, 2, 'BÌNH HỒ LÔ GỐM SỨ VẼ SƠN THUỶ 80 CM', 'Bình hồ lô sơn thuỷ dùng để trưng bày theo phong thuỷ mang lại sức khỏe và sự bình yên cho gia chủ. Hồ lô phong thuỷ có hình trái bầu và luôn gắn liền với hình ảnh buộc trên chiếc gậy của ông Thọ, đây chính là biểu tượng của niềm vui, sức khoẻ và an lành.', 2200000, 97, 'Sơn thuỷ hữu tình', 'Men rạn', 'Sứ cao cấp ', 'Cao 80 cm', '12 tháng'),
(20, 5, 2, 'ĐÈN NGỦ GỐM SƠN MÀI KHẢM HOA SEN', 'Đèn ngủ gốm sơn mài khảm hoa sen', 2200000, 97, 'Hoa sen', 'Vàng', 'Sứ sơn mài khảm trứng', 'Cao 55 cm', '12 tháng'),
(21, 5, 2, 'ĐÈN BÀN TRANG TRÍ GỐM SỨ CAO CẤP', 'Đèn bàn trang trí gốm sứ cao cấp, sản phẩm hanmade của làng nghề Bát Tràng. Chiếc đèn ngủ gốm sứ này vừa có thể sử dụng thắp sáng vừa làm vật trang trí đẹp mắt cho phòng khách, phòng ngủ nhà bạn', 3900000, 99, 'Hoa Dây', 'Xanh lam', 'Sứ khử cao cấp', 'Cao 55 cm', '12 tháng'),
(22, 5, 2, 'ĐÈN NGỦ GỐM SỨ VẼ HOA THIÊN ĐIỂU', 'Đèn ngủ gốm sứ vẽ hoa thiên điểu, hàng thủ công của Bát Tràng.Thân đèn được chế tác từ chiếc bình hoa bằng gốm hoạ tiết vẽ tay đẹp mắt. Chiếc đèn ngủ có thể sử dụng làm đèn ngủ gia đình, đèn ngủ cho đôi vợ chồng mới cưới, đèn ngủ cho khách sạn,...', 1650000, 100, 'Hoa thiên điểu', 'Phối màu', 'Sứ cao cấp ', 'Cao 60 cm', '12 tháng'),
(23, 6, 2, 'TRANH BỘ LÝ NGƯ VỌNG NGUYỆT GỐM SỨ 50×1 M', 'Tranh bộ lý ngư vọng nguyệt gốm sứ 50×1 m ', 3600000, 100, 'Cá chép, lý ngư vọng nguyệt', 'Phối màu', 'Sứ cao cấp', '50 cm x 1 m', '12 tháng'),
(24, 6, 2, 'TRANH TỨ CẢNH ĐẮP NỔI KỸ MEN CHÀM 45×90 CM', 'Tranh Tứ quý thuộc loại tranh bốn bức vẽ cảnh bốn mùa là xuân, hạ, thu, đông. Mọi người treo tranh tứ quý không chỉ là để trang trí mà còn mang nhiều ý nghĩa mong cầu may mắn, phú quý, sung túc và mang cả những yếu tố phong thủy trong đó.', 4800000, 98, 'Đắp nổi Tùng cúc trúc mai', 'Men chàm cổ', 'Sứ cao cấp ', '45 cm x 90 cm', '12 tháng'),
(25, 6, 2, 'TRANH TỨ QUÝ TÙNG CÚC TRÚC MAI NỔI 0,5×1 M', 'Kích thước chi tiết  52 cm x 120 cm tính cả khung.', 3800000, 89, 'Vẽ cảnh Tứ Quý ', '50 cm x 98 cm', 'Sứ cao cấp ', '', 'Men bóng, phối màu'),
(26, 6, 2, 'TRANH PHONG THỦY CỬU NGƯ QUẦN HỘI MEN LAM', 'Tranh phong thủy Cửu ngư quần hội men Lam', 1860000, 89, 'Vẽ Cửu ngư quần hội', 'Men Lam ', 'Sứ cao cấp ', '64 cm x 98 cm', '12 tháng'),
(27, 6, 2, 'TRANH ỐP TƯỜNG GỐM BÁT TRÀNG VẼ CẢNH CHỢ QUÊ', 'Tranh ốp tường gốm bát tràng vẽ cảnh chợ quê gốm bát tràng', 3900000, 85, 'Phong cảnh chợ quê', 'Phối màu', 'Sứ cao cấp ', 'Tuỳ chỉnh', '12 tháng'),
(28, 7, 2, 'TƯỢNG TAM ĐA CAO 100 CM – HÀNG KỸ', 'Ba ông Phúc, Lộc,Thọ đã nhắn nhủ người đời rằng hạnh phúc ở đời suy cho cùng cũng chỉ là tương đối thôi. Không điều gì mãn nguyện tròn đầy và bền vững cả.Ngày Xuân xin chúc mọi người chúng ta hưởng Phúc–Lộc–Thọ với tất cả minh triết của “Tam đa”', 15800000, 91, 'Tượng Phúc Lộc Thọ, Tam đa', 'Men rạn cổ', 'Sứ cao cấp ', 'Cao 100 cm', '12 tháng'),
(29, 7, 2, 'TƯỢNG NGHÊ GỐM SỨ BÁT TRÀNG CAO 35 CM', 'Tượng nghê gốm sứ Bát Tràng cao 35 cm\r\n\r\n', 6000000, 53, 'Nghê sứ', 'Men xanh ngọc', 'Sứ cao cấp ', 'Cao 35 cm', '12 tháng'),
(30, 7, 2, 'TƯỢNG PHÚC LỘC THỌ TỨ LINH – CAO 86CM', 'Tượng phúc lộc thọ tứ linh – cao 86cm', 2000000, 58, 'Tượng Phúc Lộc Thọ, Tam đa', 'Men rạn cổ', 'Sứ cao cấp ', 'Cao 86 cm', '12 tháng'),
(31, 7, 2, 'TƯỢNG KHỔNG MINH MEN RẠN CAO 40 CM', 'Khổng minh Gia Cát lượng là một vị quân sư nổi tiếng dưới trướng phù trợ cho Lưu Bị. Ông là một vị quân sư được coi là tài giỏi nhất trong lịch sử trung quốc, với tài thao binh khiển tướng và dùng kế sách giúp Nhà Hán tranh giành thiên hạ', 1250000, 68, 'Khổng Minh, Gia Cát Lượng', 'Men rạn', 'Sứ cao cấp ', 'Cao 40 cm', '12 tháng'),
(32, 8, 2, 'ĐĨA SỨ VẼ CẢNH TRẺ THƠ VUI ĐÙA PHI 30 CM', 'Đĩa sứ vẽ cảnh trẻ thơ vui đùa phi 30', 900000, 981, 'Vẽ cảnh trẻ thơ vui đùa', 'Men lam', 'Sứ cao cấp', 'Phi 30', '12 tháng'),
(33, 8, 2, 'ĐĨA CẢNH TÙNG LỘC MEN LAM PHI 35 CM', 'Đĩa cảnh Tùng Lộc men Lam phi 35 cm mang nhiều giá trị nghệ thuật và ý nghĩa phong thủy. Người ta trưng bày đĩa cảnh Tùng lộc trong nhà sẽ đem lại nhiều may mắn tài lộc.', 1350000, 2, 'Tùng Lộc', 'Men Lam', 'Sứ cao cấp ', 'Đường kính 35 cm', '12 tháng'),
(34, 8, 2, 'ĐĨA CẢNH SỨ MÃ ĐÁO THÀNH CÔNG PHI 35 CM', 'Đĩa cảnh sứ mã đáo mang nhiều ý nghĩa về thành công trong kinh doanh, thắng lợi trong chiến trận với hình ảnh mã đáo là ngựa quay về. Đĩa cảnh mã đáo thành công là tranh vẽ về một bầy ngựa thường gồm tám con ngựa đang phi nước đại tiến về một hướng', 9000000, 928, 'Mã đáo thành công', 'Men giả cổ', 'Sứ cao cấp ', 'Đường kính 35 cm', '12 tháng'),
(35, 8, 2, 'ĐĨA SỨ VẼ KIM KÊ ĐỘC LẬP GIẢ CỔ 35 CM', 'Đĩa sứ vẽ Kim kê độc lập giả cổ  rất nhiều giá trị nghệ thuật và ý nghĩa phong thủy. Gà là một trong 12 con giáp, là một dấu tích của nền văn minh và văn hóa nông nghiệp ', 900000, 991, 'Kim kê độc lập', 'Men rạn cổ', 'Sứ cao cấp ', 'Đường kính 35cm', '12 tháng'),
(38, 1, 2, 'BÌNH HÚT LỘC BÁT TRÀNG BÁCH NHI ĐỒ CAO 30CM', 'Trưng bày phòng khách, phong thủy,…', 3200000, 988, 'Bách nhi đồ, bách nhi bách phúc', 'Men bóng', 'Sứ cao cấp', 'Cao 30 cm', '12 tháng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vai_tro`
--

CREATE TABLE `vai_tro` (
  `id` bigint(20) NOT NULL,
  `ten_vai_tro` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `vai_tro`
--

INSERT INTO `vai_tro` (`id`, `ten_vai_tro`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_MEMBER'),
(7, 'ROLE_EMPLOYEE');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chi_muc_gio_hang`
--
ALTER TABLE `chi_muc_gio_hang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK49lmmclnjgb7eck20lwhv0cks` (`ma_gio_hang`),
  ADD KEY `FKkd69a7wiulr4xgohxl0rlhth4` (`ma_san_pham`);

--
-- Chỉ mục cho bảng `chi_tiet_don_hang`
--
ALTER TABLE `chi_tiet_don_hang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK9wl3houbukbxpixsut6uvojhy` (`ma_don_hang`),
  ADD KEY `FK3ry84nmdxgoarx53qjxd671tk` (`ma_san_pham`);

--
-- Chỉ mục cho bảng `danh_muc`
--
ALTER TABLE `danh_muc`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `don_hang`
--
ALTER TABLE `don_hang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKnwjiboxao1uvw1siemkvs1jb9` (`ma_nguoi_dat`),
  ADD KEY `FK5d0ivtt887a9birqbsr3hqyde` (`ma_employee`);

--
-- Chỉ mục cho bảng `gio_hang`
--
ALTER TABLE `gio_hang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKitverect56puwr47y7tyvy6er` (`ma_nguoi_dung`);

--
-- Chỉ mục cho bảng `hang_san_xuat`
--
ALTER TABLE `hang_san_xuat`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `lien_he`
--
ALTER TABLE `lien_he`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK6jm47uh7f94pc3wix0duvedde` (`ma_nguoi_tra_loi`);

--
-- Chỉ mục cho bảng `nguoidung_vaitro`
--
ALTER TABLE `nguoidung_vaitro`
  ADD PRIMARY KEY (`ma_nguoi_dung`,`ma_vai_tro`),
  ADD KEY `FKig6jxd861mqv02a8pn68r43fr` (`ma_vai_tro`);

--
-- Chỉ mục cho bảng `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKqss6n6gtx6lhb7flcka9un18t` (`ma_danh_muc`),
  ADD KEY `FKchvjvgjnq8lbt9mjtyfn5pksq` (`ma_hang_sx`);

--
-- Chỉ mục cho bảng `vai_tro`
--
ALTER TABLE `vai_tro`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `chi_muc_gio_hang`
--
ALTER TABLE `chi_muc_gio_hang`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=414;

--
-- AUTO_INCREMENT cho bảng `chi_tiet_don_hang`
--
ALTER TABLE `chi_tiet_don_hang`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=344;

--
-- AUTO_INCREMENT cho bảng `danh_muc`
--
ALTER TABLE `danh_muc`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `don_hang`
--
ALTER TABLE `don_hang`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=233;

--
-- AUTO_INCREMENT cho bảng `gio_hang`
--
ALTER TABLE `gio_hang`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `hang_san_xuat`
--
ALTER TABLE `hang_san_xuat`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `lien_he`
--
ALTER TABLE `lien_he`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT cho bảng `vai_tro`
--
ALTER TABLE `vai_tro`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chi_muc_gio_hang`
--
ALTER TABLE `chi_muc_gio_hang`
  ADD CONSTRAINT `FK49lmmclnjgb7eck20lwhv0cks` FOREIGN KEY (`ma_gio_hang`) REFERENCES `gio_hang` (`id`),
  ADD CONSTRAINT `FKkd69a7wiulr4xgohxl0rlhth4` FOREIGN KEY (`ma_san_pham`) REFERENCES `san_pham` (`id`);

--
-- Các ràng buộc cho bảng `chi_tiet_don_hang`
--
ALTER TABLE `chi_tiet_don_hang`
  ADD CONSTRAINT `FK3ry84nmdxgoarx53qjxd671tk` FOREIGN KEY (`ma_san_pham`) REFERENCES `san_pham` (`id`),
  ADD CONSTRAINT `FK9wl3houbukbxpixsut6uvojhy` FOREIGN KEY (`ma_don_hang`) REFERENCES `don_hang` (`id`);

--
-- Các ràng buộc cho bảng `don_hang`
--
ALTER TABLE `don_hang`
  ADD CONSTRAINT `FK5d0ivtt887a9birqbsr3hqyde` FOREIGN KEY (`ma_employee`) REFERENCES `nguoi_dung` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FKnwjiboxao1uvw1siemkvs1jb9` FOREIGN KEY (`ma_nguoi_dat`) REFERENCES `nguoi_dung` (`id`);

--
-- Các ràng buộc cho bảng `gio_hang`
--
ALTER TABLE `gio_hang`
  ADD CONSTRAINT `FKitverect56puwr47y7tyvy6er` FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `nguoi_dung` (`id`);

--
-- Các ràng buộc cho bảng `lien_he`
--
ALTER TABLE `lien_he`
  ADD CONSTRAINT `FK6jm47uh7f94pc3wix0duvedde` FOREIGN KEY (`ma_nguoi_tra_loi`) REFERENCES `nguoi_dung` (`id`);

--
-- Các ràng buộc cho bảng `nguoidung_vaitro`
--
ALTER TABLE `nguoidung_vaitro`
  ADD CONSTRAINT `FKig6jxd861mqv02a8pn68r43fr` FOREIGN KEY (`ma_vai_tro`) REFERENCES `vai_tro` (`id`),
  ADD CONSTRAINT `FKocavcnspu1wcvp2w0s4usfgbf` FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `nguoi_dung` (`id`);

--
-- Các ràng buộc cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  ADD CONSTRAINT `FKchvjvgjnq8lbt9mjtyfn5pksq` FOREIGN KEY (`ma_hang_sx`) REFERENCES `hang_san_xuat` (`id`),
  ADD CONSTRAINT `FKqss6n6gtx6lhb7flcka9un18t` FOREIGN KEY (`ma_danh_muc`) REFERENCES `danh_muc` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
