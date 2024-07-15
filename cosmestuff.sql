-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 15, 2024 at 01:19 PM
-- Server version: 8.0.30
-- PHP Version: 8.2.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cosmestuff`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllProducts` ()   BEGIN
select * from produk;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetProdukByKategori` (`pKategoriId` VARCHAR(50))   BEGIN
    DECLARE jmlProduk INT;
    SELECT COUNT(*) INTO jmlProduk
    FROM produk
    WHERE id_kategori = pKategoriId COLLATE utf8mb4_general_ci;
    IF jmlProduk > 0 THEN
        SELECT id_produk, nama_produk, harga, stok
        FROM produk
        WHERE id_kategori = pKategoriId COLLATE utf8mb4_general_ci;
    ELSE
        SELECT 'Produk tidak ditemukan untuk kategori tersebut' AS message;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getProdukByKategoriSupplier` (`pIdKategori` INT, `pIdSupplier` INT)   BEGIN
    select * from produk 
    WHERE id_kategori = pIdKategori and id_supplier = pIdSupplier;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detail_pembayaran`
--

CREATE TABLE `detail_pembayaran` (
  `id_detail_pembayaran` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `id_produk` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_kategori` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_pembayaran` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_pembayaran`
--

INSERT INTO `detail_pembayaran` (`id_detail_pembayaran`, `id_produk`, `id_kategori`, `id_pembayaran`) VALUES
('DP001', 'P001', 'K001', 'PB001'),
('DP002', 'P003', 'K003', 'PB002'),
('DP003', 'P009', 'K009', 'PB003'),
('DP004', 'P008', 'K008', 'PB004'),
('DP005', 'P005', 'K005', 'PB005'),
('DP006', 'P004', 'K004', 'PB006'),
('DP007', 'P007', 'K007', 'PB007'),
('DP008', 'P002', 'K002', 'PB008'),
('DP009', 'P006', 'K006', 'PB009'),
('DP010', 'P012', 'K012', 'PB010');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_kategori` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
('K001', 'Foundation'),
('K002', 'Concealer'),
('K003', 'Blush'),
('K004', 'Bronzer'),
('K005', 'Highlighter'),
('K006', 'Setting Powder'),
('K007', 'Primer'),
('K008', 'Eyeshadow'),
('K009', 'Eyeliner'),
('K010', 'Mascara'),
('K011', 'Eyebrow Pencil'),
('K012', 'Eyebrow Gel'),
('K013', 'False Lashes'),
('K014', 'Lipstick'),
('K015', 'Lip Gloss'),
('K016', 'Lip Liner'),
('K017', 'Lip Balm'),
('K018', 'Lip Stain'),
('K019', 'Brushes'),
('K020', 'Sponges'),
('K021', 'Applicators'),
('K023', 'Eyelash Curlers'),
('K024', 'Moisturizer'),
('K025', 'Serum'),
('K026', 'Toner'),
('K027', 'Cleansers'),
('K028', 'Masks'),
('K029', 'Exfoliators'),
('K030', 'Shampoos'),
('K031', 'Conditioners'),
('K032', 'Hair Masks'),
('K033', 'Styling Products'),
('K034', 'Nail Polish'),
('K035', 'Nail Polish Remover'),
('K036', 'Nail Tools'),
('K037', 'Alas kaki'),
('K038', 'Tas'),
('K039', 'Aksesoris'),
('K040', 'Pernak pernik'),
('K300', 'Menyerap minyak berlebih');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `id_produk` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tanggal_waktu_bayar` datetime NOT NULL,
  `jumlah_produk` int NOT NULL,
  `total_bayar` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_produk`, `tanggal_waktu_bayar`, `jumlah_produk`, `total_bayar`) VALUES
('PB001', 'P001', '2024-07-12 08:00:00', 3, 150.00),
('PB002', 'P003', '2024-07-12 09:30:00', 1, 50.00),
('PB003', 'P009', '2024-07-12 10:45:00', 2, 90.00),
('PB004', 'P008', '2024-07-12 11:20:00', 4, 200.00),
('PB005', 'P005', '2024-07-12 13:15:00', 1, 70.00),
('PB006', 'P004', '2024-07-12 14:00:00', 3, 120.00),
('PB007', 'P007', '2024-07-12 15:10:00', 2, 100.00),
('PB008', 'P002', '2024-07-12 16:30:00', 1, 60.00),
('PB009', 'P006', '2024-07-12 17:45:00', 5, 250.00),
('PB010', 'P012', '2024-07-12 18:20:00', 3, 140.00);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_produk` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `harga` int NOT NULL,
  `stok` int NOT NULL,
  `deskripsi` text COLLATE utf8mb4_general_ci,
  `id_kategori` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `id_supplier` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `harga`, `stok`, `deskripsi`, `id_kategori`, `id_supplier`) VALUES
('P001', 'Make Over Ultra Cover Liquid Matt Foundation', 200000, 50, 'bisa sebagai moisturizer, sunscreen, dan soft-focus agent untuk menyamarkan tampilan garis-garis halus.', 'K001', 'S001'),
('P002', 'Maybelline Fit Me Foundation', 150000, 40, 'Foundation dengan coverage tinggi', 'K001', 'S002'),
('P003', 'Luxcrime Ultra Cover Foundation Balm', 180000, 30, 'Foundation tahan lama', 'K001', 'S003'),
('P004', 'Pinkflash eyeshadow pk04', 120000, 20, 'hasil akhir yang bagus tetapi juga tahan lama hingga 12 jam.', 'K002', 'S004'),
('P005', 'Maybelline Fit Me Liquid Concealer Makeup', 300000, 25, 'Concealer dengan coverage tinggi', 'K002', 'S005'),
('P006', 'Wardah Lightening Liquid Concealer', 120000, 35, 'Concealer untuk menyamarkan garis halus', 'K002', 'S002'),
('P007', 'MAKE OVER Blush On Single', 110000, 40, 'Blush dengan warna pink peach', 'K003', 'S004'),
('P008', 'Wardah Colorft Cream Blush', 60000, 30, 'Blush dengan banyak pilihan warna', 'K003', 'S006'),
('P009', 'Luxcrime Flushy-Cheek Blush', 80000, 50, 'Blush dengan hasil akhir shimmer', 'K003', 'S007'),
('P010', 'Luxcrime Warm-It-Up Bronzer', 200000, 20, 'Bronzer lokal ini tahan lama seharian dan mampu memberikan tampilan sun kissed serta bisa mempertegas wajah dengan formula sehalus sutra', 'K004', 'S008'),
('P011', 'Pinkflash OhMyShow', 35000, 25, 'Pinkflash OhMyShow memiliki tekstur yang sangat halus, mudah di-blend, dan pigmentasinya bagus.', 'K004', 'S009'),
('P012', 'Madame Gie Precious Heart Bronzer', 50000, 30, 'Bronzer dengan hasil akhir natural', 'K004', 'S010'),
('P013', 'Luxcrime Ultra Highlighter', 200000, 15, 'Highlighter dengan hasil glowing', 'K005', 'S011'),
('P014', 'Make Over Riche Glow', 190000, 20, 'Highlighter dengan warna intens', 'K005', 'S001'),
('P015', 'DEAR ME BEAUTY Glass Skin Liquid Highlighter', 130000, 25, 'Highlighter dengan shimmer halus', 'K005', 'S002'),
('P016', 'Esqa Setting Powder', 10000, 20, 'Setting powder yang ringan', 'K006', 'S003'),
('P017', 'Hanasui Perfect Fit Setting Powder', 50000, 30, 'Setting powder tanpa warna', 'K006', 'S004'),
('P018', 'Maybelline Fit Me Loose Finishing Powder', 150000, 40, 'Setting powder dengan coverage ringan', 'K006', 'S002'),
('P019', 'Maybelline New York Fit Me Primer', 140000, 25, 'Primer yang membuat kulit halus', 'K007', 'S005'),
('P020', 'MAKE OVER Powerstay Color Correcting Primer', 100000, 20, 'Primer untuk mengecilkan pori', 'K007', 'S006'),
('P021', 'Luxcrime Perfect Canvas - Hydro Blur Finish Primer', 100000, 35, 'Primer dengan efek glowing', 'K007', 'S007'),
('P022', 'ESQA Goddess Eyeshadow Palette', 250000, 15, 'Palet eyeshadow dengan warna netral', 'K008', 'S008'),
('P023', 'INEZ Eyeshadow Collection', 55000, 20, 'Palet eyeshadow dengan warna hangat', 'K008', 'S009'),
('P024', 'Madame Gie Playful Eyeshadow', 50000, 25, 'Palet eyeshadow dengan banyak pilihan warna', 'K008', 'S010'),
('P025', 'MAKE OVER Hyperblack Superstay Liner', 140000, 30, 'Eyeliner yang tahan lama', 'K009', 'S011'),
('P026', 'Wardah Eyexpert Staylast Liquid Eyeliner', 50000, 25, 'Produk ini berbahan dasar air sehingga mudah Anda aplikasikan dan teksturnya yang ringan tidak menggumpal', 'K009', 'S002'),
('P027', 'Maybelline Eye Studio Lasting Drama Gel Eyeliner', 150000, 40, 'Eyeliner gel dengan warna intens', 'K009', 'S002'),
('P028', 'Maybelline Sky High Waterproof Mascara', 150000, 20, 'Mascara dengan volume maksimal', 'K010', 'S003'),
('P029', 'Make Over Lash Impulse Waterproof Mascara', 150000, 30, 'Mascara dengan efek panjang dan tebal', 'K010', 'S001'),
('P030', 'Maybelline Great Lash Mascara', 120000, 40, 'Mascara klasik dengan hasil natural', 'K010', 'S002'),
('P031', 'Implora Eyebrow Pencil', 10000, 25, 'Pensil alis dengan ujung presisi', 'K011', 'S001'),
('P032', 'Somethinc Brow Wiz Retractable Eyebrow', 65000, 20, 'Pensil alis tahan lama', 'K011', 'S002'),
('P033', 'Hanasui Makeup Micro Brow Pencil', 20000, 35, 'Pensil alis dengan warna natural', 'K011', 'S003'),
('P034', 'Luxcrime On Fleek Browcara', 150000, 25, 'Gel alis transparan', 'K012', 'S004'),
('P035', 'ESQA Cosmetics Freeze Tinted Brow Mascara', 200000, 20, 'Gel alis dengan warna', 'K012', 'S005'),
('P036', 'Glossier Boy Brow', 280000, 30, 'Gel alis untuk tampilan fluffy', 'K012', 'S006'),
('P037', 'Huda Beauty Classic False Lashes', 80000, 50, 'Bulu mata palsu dengan volume', 'K013', 'S007'),
('P038', 'Ardell Demi Wispies', 120000, 60, 'Bulu mata palsu natural', 'K013', 'S008'),
('P039', 'Velour Lashes Effortless Collection', 79000, 40, 'Bulu mata palsu premium', 'K013', 'S009'),
('P040', 'MAC Matte Lipstick', 250000, 30, 'Lipstick matte dengan banyak pilihan warna', 'K014', 'S010'),
('P041', 'Maybelline SuperStay Matte Ink', 150000, 40, 'Lipstick tahan lama', 'K014', 'S001'),
('P042', 'Somethinc Checkmatte Transferproof Lipstick', 300000, 20, 'Lipstick dengan warna intens', 'K014', 'S001'),
('P043', 'ESQA Lip Gloss', 100000, 25, 'Lip gloss dengan efek shiny', 'K015', 'S002'),
('P044', 'SOMETHINC MULTITASK Water Gloss', 90000, 35, 'Lip gloss dengan tekstur creamy', 'K015', 'S003'),
('P045', 'Make Over Powestay Glossy Lip Top Coat', 150000, 20, 'Lip gloss dengan efek plumping', 'K015', 'S004'),
('P046', 'Implora Lip Crayon Satin', 40000, 25, 'Lip liner dengan tekstur creamy', 'K016', 'S005'),
('P047', 'Luxcrime Ultra Smooth Lip Liner', 100000, 40, 'Lip liner dengan berbagai warna', 'K016', 'S006'),
('P048', 'Make Over Lip Amplify Countour Liner', 110000, 20, 'Lip liner untuk tampilan bibir penuh', 'K016', 'S007'),
('P049', 'Nivea Lip Care', 50000, 50, 'Lip balm dengan bahan alami', 'K017', 'S008'),
('P050', 'Vaseline Lip Theraphy', 55000, 60, 'Lip balm dengan berbagai rasa', 'K017', 'S009'),
('P051', 'Wardah Lip Balm', 50000, 40, 'Lip balm dengan bentuk unik', 'K017', 'S010'),
('P052', 'Hanasui Tintdorable Lip Stain', 45000, 25, 'Lip stain dengan warna merah alami', 'K018', 'S001'),
('P053', 'Luxcrime Ultra Light Lip Stain', 100000, 35, 'Lip stain dengan tekstur ringan', 'K018', 'S001'),
('P054', 'Emina Glossy Stain', 50000, 30, 'Lip stain dengan warna intens', 'K018', 'S002'),
('P055', 'Real Techniques Brush Set', 350000, 20, 'Set kuas dengan kualitas tinggi', 'K019', 'S003'),
('P056', 'Masami Shouko', 350000, 25, 'Kuas makeup dengan berbagai ukuran', 'K019', 'S004'),
('P057', 'beauty Story', 300000, 15, 'Set kuas dengan berbagai jenis', 'K019', 'S005'),
('P058', 'Beautyblender Original', 250000, 30, 'Sponge makeup untuk aplikasi foundation', 'K020', 'S006'),
('P059', 'Real Techniques Miracle Complexion Sponge', 150000, 40, 'Sponge dengan tekstur lembut', 'K020', 'S007'),
('P060', 'EcoTools Perfecting Blender Duo', 200000, 25, 'Set sponge dengan berbagai ukuran', 'K020', 'S008'),
('P061', 'Sephora Collection PRO Shadow Brush', 200000, 20, 'Aplikator eyeshadow profesional', 'K021', 'S004'),
('P062', 'MAC 217S Blending Brush', 250000, 25, 'Aplikator untuk blending eyeshadow', 'K021', 'S005'),
('P063', 'NYX Pro Multi-Purpose Buffing Brush', 150000, 30, 'Aplikator untuk berbagai penggunaan', 'K021', 'S006'),
('P064', 'Shu Uemura Eyelash Curler', 50000, 20, 'Pelentik bulu mata premium', 'K023', 'S007'),
('P065', 'Kevyn Aucoin The Eyelash Curler', 50000, 15, 'Pelentik bulu mata dengan desain ergonomis', 'K023', 'S008'),
('P066', 'Tweezerman Classic Lash Curler', 60000, 25, 'Pelentik bulu mata klasik', 'K023', 'S009'),
('P067', 'Somethinc Ceramic Skin Saviour Moisturizer Gel', 300000, 20, 'Moisturizer dengan hidrasi intens', 'K024', 'S010'),
('P068', 'Hada Labo Gokujyun Ultimate Moisturizing Milk', 160000, 30, 'Moisturizer dengan tekstur ringan', 'K024', 'S001'),
('P069', 'Dear Me Skin Barrier Water Cream', 280000, 40, 'Moisturizer untuk mengatasi skin barier', 'K024', 'S001'),
('P070', 'The Ordinary Hyaluronic Acid 2% + B5', 150000, 50, 'Serum dengan kandungan hyaluronic acid', 'K025', 'S001'),
('P071', 'SOMETHINC HYALuronic 9+ Advanced + B5 Serum', 131000, 15, 'Serum untuk kulit kering', 'K025', 'S002'),
('P072', 'SKINTIFIC 4D Hyaluronic Acid Hydrating Serum', 100000, 10, 'Serum kulit kering ini mengandung hyaluronic acid tinggi yang dapat menghidrasi secara mendalam', 'K025', 'S003'),
('P073', 'Pixi Glow Tonic', 350000, 30, 'Toner dengan kandungan glycolic acid', 'K026', 'S004'),
('P074', 'Avoskin Miraculous Refining Toner', 195000, 40, 'Toner dapat mengangkat sel-sel kulit mati, menyamarkan noda hitam, menghaluskan kulit, hingga meremajakan kulit wajah', 'K026', 'S005'),
('P075', 'SOMETHINC GLOW MAKER AHA BHA PHA Clarifying Treatment Toner', 100000, 20, 'Toner bagus untuk mengatasi jerawat, komedo hitam, dan komedo putih.', 'K026', 'S006'),
('P076', 'Somethinc Low pH Gentle Jelly Cleanser', 80000, 50, 'Pembersih wajah untuk kulit kering', 'K027', 'S007'),
('P077', 'Skintific 5X Ceramide Low PH Cleanser', 10000, 40, 'Pembersih wajah untuk menjaga skin barier', 'K027', 'S008'),
('P078', 'Cetaphil Gentle Skin Cleanser', 120000, 30, 'Pembersih wajah untuk kulit sensitif', 'K027', 'S009'),
('P079', 'EMINA Stuff Essence Sheet Mask', 20000, 15, 'Masker wajah untuk kulit lebih cerah, halus, kenyal, lembab, dan segar', 'K028', 'S010'),
('P080', 'Origins Clear Improvement Active Charcoal Mask', 40000, 20, 'Masker wajah dengan kandungan charcoal', 'K028', 'S006'),
('P081', 'Skintific 5X Ceramide Sooting Mask', 50000, 30, 'Masker wajah engandung lima macam ceramide, ectoin, dan tremella untuk mengembalikan hidrasi kulit. Sementara itu, kandungan probiotic complex-nya akan menyeimbangkan mikrobiome kulit', 'K028', 'S001'),
('P082', 'Somethinc AHA BHA PHA Peeling Solution', 130000, 40, 'Serum ini bisa membantu mengurangi komedo, membersihkan pori yang tersumbat, dan mengangkat sel kulit mati.', 'K029', 'S002'),
('P083', 'Avoskin Serus Miraculous Refining', 249000, 25, 'Eksfoliator dengan kandungan BHA', 'K029', 'S003'),
('P084', 'The Ordinary AHA 30% + BHA 2% Peeling Solution', 200000, 30, 'Eksfoliator dengan kombinasi AHA dan BHA', 'K029', 'S004'),
('P085', 'Pantene Pro-V Daily Moisture Renewal Shampoo', 30000, 50, 'Shampoo untuk hidrasi rambut', 'K030', 'S005'),
('P086', 'Head & Shoulders Classic Clean Shampoo', 40000, 60, 'Shampoo anti ketombe', 'K030', 'S006'),
('P087', 'ZINC Milk Shampoo', 33000, 40, 'Shampoo anti ketombe', 'K030', 'S007'),
('P088', 'Pantene Pro-V Daily Moisture Renewal Conditioner', 100000, 50, 'Kondisioner untuk hidrasi rambut', 'K031', 'S005'),
('P089', 'Head & Shoulders Classic Clean Conditioner', 80000, 60, 'Kondisioner anti ketombe', 'K031', 'S006'),
('P090', 'ZINC Milk Conditioner', 150000, 40, 'Kondisioner untuk melembutkan dan anti ketombe', 'K031', 'S007'),
('P091', 'Natur Hair Mask Nutritive Treatment with Olive Oil & Vitamin E', 20000, 30, 'Produk ini cocok untuk rambut yang mengalami kerusakan akibat rutinitas pewarnaan rambut.', 'K032', 'S001'),
('P092', 'Ellips Hair Mask Hair Repair', 40000, 25, 'Mengandung pro-keratin complex dan jojoba oil yang dapat merawat, menutrisi dan melindungi rambut yang rusak akibat proses kimiawi.', 'K032', 'S008'),
('P093', 'Makarizo Hair Repair Mask 45ml', 30000, 20, 'Masker rambut dengan deep conditioning', 'K032', 'S009'),
('P094', 'Tresemme Thermal Creations Heat Tamer', 120000, 40, 'Produk styling untuk melindungi dari panas', 'K033', 'S002'),
('P095', 'John Frieda Frizz Ease Extra Strength Serum', 200000, 30, 'Serum untuk mengatasi rambut mengembang', 'K033', 'S003'),
('P096', 'Oribe Dry Texturizing Spray', 400000, 20, 'Spray untuk menambah tekstur rambut', 'K033', 'S004'),
('P097', 'Dyson Supersonic Hair Dryer', 1000000, 10, 'Hair dryer dengan teknologi canggih', 'K034', 'S005'),
('P098', 'GHD Platinum+ Professional Styler', 1500000, 15, 'Catokan rambut dengan teknologi prediktif', 'K034', 'S006'),
('P099', 'Revlon One-Step Hair Dryer and Volumizer', 700000, 20, 'Alat untuk mengeringkan dan menambah volume rambut', 'K034', 'S007'),
('P100', 'Scunci No-Slip Grip Hair Ties', 50000, 100, 'Ikatan rambut yang tidak licin', 'K035', 'S008'),
('P101', 'Goody Ouchless Elastics', 40000, 120, 'Ikatan rambut yang tidak sakit saat ditarik', 'K035', 'S009'),
('P102', 'Invisibobble Original Traceless Hair Ring', 80000, 80, 'Ikatan rambut yang tidak meninggalkan bekas', 'K035', 'S010'),
('P103', 'Tweezerman Slant Tweezer', 20000, 30, 'Pinset dengan ujung miring', 'K040', 'S003'),
('P104', 'Anastasia Beverly Hills Scissors', 30000, 20, 'Gunting untuk merapikan alis', 'K040', 'S003'),
('P105', 'Sephora Collection Eyebrow Razor Set', 50000, 40, 'Set pisau cukur alis', 'K040', 'S001'),
('P106', 'OPI Nail Lacquer', 70000, 50, 'Cat kuku dengan berbagai warna', 'K036', 'S001'),
('P107', 'Essie Nail Polish', 80000, 60, 'Cat kuku dengan formula tahan lama', 'K036', 'S002'),
('P108', 'Sally Hansen Miracle Gel', 100000, 40, 'Cat kuku dengan efek gel', 'K036', 'S003'),
('P109', 'Cutex Ultra-Powerful Nail Polish Remover', 50000, 50, 'Pembersih cat kuku yang kuat', 'K037', 'S004'),
('P110', 'Sally Hansen Extra Strength Polish Remover', 40000, 60, 'Pembersih cat kuku dengan kekuatan ekstra', 'K037', 'S003'),
('P111', 'Zoya Remove Plus Nail Polish Remover', 70000, 40, 'Pembersih cat kuku yang lembut', 'K037', 'S005'),
('P112', 'Tweezerman Nail Clipper Set', 80000, 30, 'Set gunting kuku berkualitas tinggi', 'K038', 'S006'),
('P113', 'Revlon Compact Emery Boards', 30000, 50, 'Papan amplas kuku', 'K038', 'S007'),
('P114', 'Sally Hansen Instant Cuticle Remover', 50000, 40, 'Penghilang kutikula instan', 'K038', 'S003'),
('P115', 'Adidas Ultraboost', 1500000, 20, 'Sepatu lari dengan bantalan ekstra', 'K039', 'S008'),
('P116', 'Nike Air Max 270', 1800000, 15, 'Sepatu olahraga dengan kenyamanan maksimal', 'K039', 'S009'),
('P117', 'Vans Old Skool', 900000, 30, 'Sepatu kasual dengan desain klasik', 'K039', 'S010'),
('P118', 'Adorable Projects', 200000, 10, 'Tas tangan dengan desain elegan', 'K038', 'S011'),
('P119', 'Bodypack', 250000, 8, 'Tas tangan dengan ruang yang luas', 'K038', 'S011'),
('P120', 'Palomino', 350000, 5, 'Tas ikonik dengan desain klasik', 'K038', 'S011'),
('P121', 'Kacamta SHOAL', 200000, 20, 'Kacamata hitam dengan lensa UV', 'K039', 'S011'),
('P122', 'Jam tangan Woodka', 150000, 5, 'Jam tangan dengan desain mewah', 'K039', 'S011'),
('P123', 'Kalung Wods', 300000, 10, 'Kalung dengan desain yang unik', 'K039', 'S011'),
('P124', 'Funko Figure', 300000, 50, 'Figur aksi karakter', 'K040', 'S011'),
('P125', 'LEGO', 50000, 30, 'Set LEGO kecil', 'K040', 'S011'),
('P126', 'Lego porsche 911 gt3 rs black', 150000, 40, 'Mobil mainan', 'K040', 'S011'),
('P127', 'Wardah colorfit matte foundation', 0, 0, NULL, 'K004', 'S002'),
('P129', 'Maybelline fit me powder', 0, 0, NULL, 'K001', 'S003'),
('P130', 'Maybelline vinyl ink peachy', 0, 0, NULL, 'K001', 'S003');

--
-- Triggers `produk`
--
DELIMITER $$
CREATE TRIGGER `after_delete_produk` AFTER DELETE ON `produk` FOR EACH ROW BEGIN
    INSERT INTO produk_log (id_produk, activity, old_data, by_who) 
    VALUES (OLD.id_produk, 'DELETE', CONCAT('id_produk: ', OLD.id_produk, ', nama_produk: ', OLD.nama_produk, ', id_kategori: ', OLD.id_kategori, ', id_supplier: ', OLD.id_supplier), USER());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_insert_produk` AFTER INSERT ON `produk` FOR EACH ROW BEGIN
    INSERT INTO produk_log (id_produk, activity, new_data, by_who) 
    VALUES (NEW.id_produk, 'INSERT', CONCAT('id_produk: ', NEW.id_produk, ', nama_produk: ', NEW.nama_produk, ', id_kategori: ', NEW.id_kategori, ', id_supplier: ', NEW.id_supplier), USER());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_produk` AFTER UPDATE ON `produk` FOR EACH ROW BEGIN
    INSERT INTO produk_log (id_produk, activity, old_data, new_data, by_who) 
    VALUES (OLD.id_produk, 'UPDATE', CONCAT('id_produk: ', OLD.id_produk, ', nama_produk: ', OLD.nama_produk, ', id_kategori: ', OLD.id_kategori, ', id_supplier: ', OLD.id_supplier), CONCAT('id_produk: ', NEW.id_produk, ', nama_produk: ', NEW.nama_produk, ', id_kategori: ', NEW.id_kategori, ', id_supplier: ', NEW.id_supplier), USER());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_delete_produk` BEFORE DELETE ON `produk` FOR EACH ROW BEGIN
    INSERT INTO produk_log (id_produk, activity, old_data, by_who) 
    VALUES (OLD.id_produk, 'DELETE', CONCAT('id_produk: ', OLD.id_produk, ', nama_produk: ', OLD.nama_produk, ', id_kategori: ', OLD.id_kategori, ', id_supplier: ', OLD.id_supplier), USER());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_insert_produk` BEFORE INSERT ON `produk` FOR EACH ROW BEGIN
    INSERT INTO produk_log (id_produk, activity, new_data, by_who) 
    VALUES (NEW.id_produk, 'INSERT', CONCAT('id_produk: ', NEW.id_produk, ', nama_produk: ', NEW.nama_produk, ', id_kategori: ', NEW.id_kategori, ', id_supplier: ', NEW.id_supplier), USER());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_produk` BEFORE UPDATE ON `produk` FOR EACH ROW BEGIN
    INSERT INTO produk_log (id_produk, activity, old_data, new_data, by_who) 
    VALUES (OLD.id_produk, 'UPDATE', CONCAT('id_produk: ', OLD.id_produk, ', nama_produk: ', OLD.nama_produk, ', id_kategori: ', OLD.id_kategori, ', id_supplier: ', OLD.id_supplier), CONCAT('id_produk: ', NEW.id_produk, ', nama_produk: ', NEW.nama_produk, ', id_kategori: ', NEW.id_kategori, ', id_supplier: ', NEW.id_supplier), USER());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `produk_log`
--

CREATE TABLE `produk_log` (
  `id_produk` int NOT NULL,
  `activity` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `old_data` text COLLATE utf8mb4_general_ci,
  `new_data` text COLLATE utf8mb4_general_ci,
  `change_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `by_who` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk_log`
--

INSERT INTO `produk_log` (`id_produk`, `activity`, `old_data`, `new_data`, `change_time`, `by_who`) VALUES
(1, 'INSERT', NULL, 'id_produk: P127, nama_produk: Wardah colorfit matte foundation, id_kategori: K004, id_supplier: S002', '2024-07-13 03:45:24', 'root@localhost'),
(2, 'INSERT', NULL, 'id_produk: P127, nama_produk: Wardah colorfit matte foundation, id_kategori: K004, id_supplier: S002', '2024-07-13 03:45:24', 'root@localhost'),
(3, 'INSERT', NULL, 'id_produk: P128, nama_produk: Wardah colorfit velvet powder foundation, id_kategori: K004, id_supplier: S002', '2024-07-13 03:45:24', 'root@localhost'),
(4, 'INSERT', NULL, 'id_produk: P128, nama_produk: Wardah colorfit velvet powder foundation, id_kategori: K004, id_supplier: S002', '2024-07-13 03:45:24', 'root@localhost'),
(5, 'INSERT', NULL, 'id_produk: P129, nama_produk: Maybelline fit me powder, id_kategori: K001, id_supplier: S003', '2024-07-13 03:45:24', 'root@localhost'),
(6, 'INSERT', NULL, 'id_produk: P129, nama_produk: Maybelline fit me powder, id_kategori: K001, id_supplier: S003', '2024-07-13 03:45:24', 'root@localhost'),
(7, 'INSERT', NULL, 'id_produk: P130, nama_produk: Maybelline vinyl ink peachy, id_kategori: K001, id_supplier: S003', '2024-07-13 03:45:24', 'root@localhost'),
(8, 'INSERT', NULL, 'id_produk: P130, nama_produk: Maybelline vinyl ink peachy, id_kategori: K001, id_supplier: S003', '2024-07-13 03:45:24', 'root@localhost'),
(9, 'UPDATE', 'id_produk: P004, nama_produk: MAKE OVER Powerstay Total Cover Liquid Concealer, id_kategori: K002, id_supplier: S004', 'id_produk: P004, nama_produk: Pinkflash eyeshadow pk04, id_kategori: K002, id_supplier: S004', '2024-07-13 03:57:54', 'root@localhost'),
(10, 'UPDATE', 'id_produk: P004, nama_produk: MAKE OVER Powerstay Total Cover Liquid Concealer, id_kategori: K002, id_supplier: S004', 'id_produk: P004, nama_produk: Pinkflash eyeshadow pk04, id_kategori: K002, id_supplier: S004', '2024-07-13 03:57:54', 'root@localhost'),
(11, 'UPDATE', 'id_produk: P126, nama_produk: Carside, id_kategori: K040, id_supplier: S011', 'id_produk: P126, nama_produk: Lego porsche 911 gt3 rs black, id_kategori: K040, id_supplier: S011', '2024-07-13 04:05:12', 'root@localhost'),
(12, 'UPDATE', 'id_produk: P126, nama_produk: Carside, id_kategori: K040, id_supplier: S011', 'id_produk: P126, nama_produk: Lego porsche 911 gt3 rs black, id_kategori: K040, id_supplier: S011', '2024-07-13 04:05:12', 'root@localhost'),
(13, 'DELETE', 'id_produk: P128, nama_produk: Wardah colorfit velvet powder foundation, id_kategori: K004, id_supplier: S002', NULL, '2024-07-13 04:31:00', 'root@localhost'),
(14, 'DELETE', 'id_produk: P128, nama_produk: Wardah colorfit velvet powder foundation, id_kategori: K004, id_supplier: S002', NULL, '2024-07-13 04:31:00', 'root@localhost'),
(15, 'UPDATE', 'NULL', 'id_produk: P132, nama_produk: Wardah colorfit matt', '0000-00-00 00:00:00', '@rootlocalhost'),
(17, 'INSERT', 'NULL', 'id_produk: P130, nama_produk: Maybeline colorfit', '0000-00-00 00:00:00', '@localhost');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_supplier` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `no_telepon` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alamat` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama_supplier`, `no_telepon`, `email`, `alamat`) VALUES
('S001', 'Ocean Fresh', '087654326754', 'Ocean@fresh.com', 'Jln. Angkasa no.80'),
('S002', 'Radiant Beauty', '086654328765', 'Rose@collection005.com', 'Jln. Bintang no.66'),
('S003', 'Lizzie Parra Kreasi', '087754326755', 'Lizzie@parra2556.com', 'Jln. Mawar no.06'),
('S004', 'Mica Jaya Pratama', '086654321760', 'Mica@jayapratama.com', 'Jln. Kenangan no. 88'),
('S005', 'Keva Cosmetics', '084877653216', 'Keva@comest.com', 'Jln. Mangga no. 46'),
('S006', 'Elegance Essentials Inc', '0845332167554', 'Gloria@origita56.com', 'Jln. Tranggis no. 07'),
('S007', 'Victoria Care', '083345678904', 'Victoria@care23.com', 'Jln. Melati no. 107'),
('S008', 'Immortal Cosmedika', '083854673214', 'immortal@cosmedika.com', 'Jln. Manggis no. 38'),
('S009', 'Griff Prima Abadi', '086543227890', 'Griff@abadi.com', 'Jln. Anggrek no. 70'),
('S010', 'Lafonda Beaute', '087655432189', 'Lafonda@Beaute.com', 'Jln. Kamboja no. 40'),
('S011', 'Mainan & Aksesoris', '089034562189', 'Mainan.aksesoris.com', 'Jln. Bulan no.29'),
('S013', 'Luxe Cosmetics Suppliers', NULL, NULL, NULL),
('S014', 'DreamGlow Distributors', NULL, NULL, NULL),
('S015', 'BeautyHub International', NULL, NULL, NULL);

--
-- Triggers `supplier`
--
DELIMITER $$
CREATE TRIGGER `after_delete_supplier` AFTER DELETE ON `supplier` FOR EACH ROW BEGIN
    INSERT INTO supplier_log (id_supplier, activity, old_data, by_who) 
    VALUES (OLD.id_supplier, 'DELETE', CONCAT('id_supplier: ', OLD.id_supplier, ', nama_supplier: ', OLD.nama_supplier), USER());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_insert_supplier` AFTER INSERT ON `supplier` FOR EACH ROW BEGIN
    INSERT INTO supplier_log (id_supplier, activity, new_data, by_who) 
    VALUES (NEW.id_supplier, 'INSERT', CONCAT('id_supplier: ', NEW.id_supplier, ', nama_supplier: ', NEW.nama_supplier), USER());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_supplier` AFTER UPDATE ON `supplier` FOR EACH ROW BEGIN
    INSERT INTO supplier_log (id_supplier, activity, old_data, new_data, by_who) 
    VALUES (OLD.id_supplier, 'UPDATE', CONCAT('id_supplier: ', OLD.id_supplier, ', nama_supplier: ', OLD.nama_supplier), CONCAT('id_supplier: ', NEW.id_supplier, ', nama_supplier: ', NEW.nama_supplier), USER());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_delete_supplier` BEFORE DELETE ON `supplier` FOR EACH ROW BEGIN
    INSERT INTO supplier_log (id_supplier, activity, old_data, by_who) 
    VALUES (OLD.id_supplier, 'DELETE', CONCAT('id_supplier: ', OLD.id_supplier, ', nama_supplier: ', OLD.nama_supplier), USER());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_insert_supplier` BEFORE INSERT ON `supplier` FOR EACH ROW BEGIN
    INSERT INTO supplier_log (id_supplier, activity, new_data, by_who) 
    VALUES (NEW.id_supplier, 'INSERT', CONCAT('id_supplier: ', NEW.id_supplier, ', nama_supplier: ', NEW.nama_supplier), USER());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_supplier` BEFORE UPDATE ON `supplier` FOR EACH ROW BEGIN
    INSERT INTO supplier_log (id_supplier, activity, old_data, new_data, by_who) 
    VALUES (OLD.id_supplier, 'UPDATE', CONCAT('id_supplier: ', OLD.id_supplier, ', nama_supplier: ', OLD.nama_supplier), CONCAT('id_supplier: ', NEW.id_supplier, ', nama_supplier: ', NEW.nama_supplier), USER());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_log`
--

CREATE TABLE `supplier_log` (
  `id_supplier` int NOT NULL,
  `activity` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `old_data` text COLLATE utf8mb4_general_ci,
  `new_data` text COLLATE utf8mb4_general_ci,
  `change_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `by_who` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier_log`
--

INSERT INTO `supplier_log` (`id_supplier`, `activity`, `old_data`, `new_data`, `change_time`, `by_who`) VALUES
(1, 'INSERT', NULL, 'id_supplier: S012, nama_supplier: BeautyPlus Distributors', '2024-07-13 04:13:51', 'root@localhost'),
(2, 'INSERT', NULL, 'id_supplier: S012, nama_supplier: BeautyPlus Distributors', '2024-07-13 04:13:51', 'root@localhost'),
(3, 'INSERT', NULL, 'id_supplier: S013, nama_supplier: Luxe Cosmetics Suppliers', '2024-07-13 04:13:51', 'root@localhost'),
(4, 'INSERT', NULL, 'id_supplier: S013, nama_supplier: Luxe Cosmetics Suppliers', '2024-07-13 04:13:51', 'root@localhost'),
(5, 'INSERT', NULL, 'id_supplier: S014, nama_supplier: DreamGlow Distributors', '2024-07-13 04:13:51', 'root@localhost'),
(6, 'INSERT', NULL, 'id_supplier: S014, nama_supplier: DreamGlow Distributors', '2024-07-13 04:13:51', 'root@localhost'),
(7, 'INSERT', NULL, 'id_supplier: S015, nama_supplier: BeautyHub International', '2024-07-13 04:13:51', 'root@localhost'),
(8, 'INSERT', NULL, 'id_supplier: S015, nama_supplier: BeautyHub International', '2024-07-13 04:13:51', 'root@localhost'),
(9, 'UPDATE', 'id_supplier: S002, nama_supplier: Rose Collection', 'id_supplier: S002, nama_supplier: Radiant Beauty', '2024-07-13 04:16:57', 'root@localhost'),
(10, 'UPDATE', 'id_supplier: S002, nama_supplier: Rose Collection', 'id_supplier: S002, nama_supplier: Radiant Beauty', '2024-07-13 04:16:57', 'root@localhost'),
(11, 'UPDATE', 'id_supplier: S006, nama_supplier: Gloria Origita Cosmetics', 'id_supplier: S006, nama_supplier: Elegance Essentials Inc', '2024-07-13 04:22:41', 'root@localhost'),
(12, 'UPDATE', 'id_supplier: S006, nama_supplier: Gloria Origita Cosmetics', 'id_supplier: S006, nama_supplier: Elegance Essentials Inc', '2024-07-13 04:22:41', 'root@localhost'),
(13, 'DELETE', 'id_supplier: S012, nama_supplier: BeautyPlus Distributors', NULL, '2024-07-13 04:28:11', 'root@localhost'),
(14, 'DELETE', 'id_supplier: S012, nama_supplier: BeautyPlus Distributors', NULL, '2024-07-13 04:28:11', 'root@localhost');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_produk_log_horizontal`
-- (See below for the actual view)
--
CREATE TABLE `v_produk_log_horizontal` (
`id_produk` int
,`activity` varchar(10)
,`old_data` text
,`new_data` text
,`change_time` timestamp
,`by_who` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_produk_log_inside`
-- (See below for the actual view)
--
CREATE TABLE `v_produk_log_inside` (
`id_produk` int
,`activity` varchar(10)
,`old_data` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_produk_log_inside_cascaded`
-- (See below for the actual view)
--
CREATE TABLE `v_produk_log_inside_cascaded` (
`id_produk` int
,`activity` varchar(10)
,`old_data` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_produk_log_inside_local`
-- (See below for the actual view)
--
CREATE TABLE `v_produk_log_inside_local` (
`id_produk` int
,`activity` varchar(10)
,`old_data` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_produk_log_vertikal`
-- (See below for the actual view)
--
CREATE TABLE `v_produk_log_vertikal` (
`id_produk` int
,`activity` varchar(10)
);

-- --------------------------------------------------------

--
-- Structure for view `v_produk_log_horizontal`
--
DROP TABLE IF EXISTS `v_produk_log_horizontal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_produk_log_horizontal`  AS SELECT `produk_log`.`id_produk` AS `id_produk`, `produk_log`.`activity` AS `activity`, `produk_log`.`old_data` AS `old_data`, `produk_log`.`new_data` AS `new_data`, `produk_log`.`change_time` AS `change_time`, `produk_log`.`by_who` AS `by_who` FROM `produk_log` ;

-- --------------------------------------------------------

--
-- Structure for view `v_produk_log_inside`
--
DROP TABLE IF EXISTS `v_produk_log_inside`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_produk_log_inside`  AS SELECT `produk_log`.`id_produk` AS `id_produk`, `produk_log`.`activity` AS `activity`, `produk_log`.`old_data` AS `old_data` FROM `produk_log` ;

-- --------------------------------------------------------

--
-- Structure for view `v_produk_log_inside_cascaded`
--
DROP TABLE IF EXISTS `v_produk_log_inside_cascaded`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_produk_log_inside_cascaded`  AS SELECT `produk_log`.`id_produk` AS `id_produk`, `produk_log`.`activity` AS `activity`, `produk_log`.`old_data` AS `old_data` FROM `produk_log`WITH CASCADED CHECK OPTION  ;

-- --------------------------------------------------------

--
-- Structure for view `v_produk_log_inside_local`
--
DROP TABLE IF EXISTS `v_produk_log_inside_local`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_produk_log_inside_local`  AS SELECT `produk_log`.`id_produk` AS `id_produk`, `produk_log`.`activity` AS `activity`, `produk_log`.`old_data` AS `old_data` FROM `produk_log`WITH LOCAL CHECK OPTION  ;

-- --------------------------------------------------------

--
-- Structure for view `v_produk_log_vertikal`
--
DROP TABLE IF EXISTS `v_produk_log_vertikal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_produk_log_vertikal`  AS SELECT `produk_log`.`id_produk` AS `id_produk`, `produk_log`.`activity` AS `activity` FROM `produk_log` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_pembayaran`
--
ALTER TABLE `detail_pembayaran`
  ADD PRIMARY KEY (`id_detail_pembayaran`),
  ADD KEY `id_produk` (`id_produk`),
  ADD KEY `id_kategori` (`id_kategori`),
  ADD KEY `id_pembayaran` (`id_pembayaran`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `id_kategori` (`id_kategori`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Indexes for table `produk_log`
--
ALTER TABLE `produk_log`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `supplier_log`
--
ALTER TABLE `supplier_log`
  ADD PRIMARY KEY (`id_supplier`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `produk_log`
--
ALTER TABLE `produk_log`
  MODIFY `id_produk` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `supplier_log`
--
ALTER TABLE `supplier_log`
  MODIFY `id_supplier` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_pembayaran`
--
ALTER TABLE `detail_pembayaran`
  ADD CONSTRAINT `detail_pembayaran_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`),
  ADD CONSTRAINT `detail_pembayaran_ibfk_2` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`),
  ADD CONSTRAINT `detail_pembayaran_ibfk_3` FOREIGN KEY (`id_pembayaran`) REFERENCES `pembayaran` (`id_pembayaran`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`);

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`),
  ADD CONSTRAINT `produk_ibfk_2` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
