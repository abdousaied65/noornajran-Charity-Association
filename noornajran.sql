-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2022 at 10:23 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `noornajran`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_content`
--

CREATE TABLE `about_content` (
  `id` int(11) NOT NULL,
  `title` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `paragraph_one_title` text DEFAULT NULL,
  `paragraph_one_text` longtext DEFAULT NULL,
  `paragraph_two_title` text DEFAULT NULL,
  `paragraph_two_text` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `about_content`
--

INSERT INTO `about_content` (`id`, `title`, `description`, `paragraph_one_title`, `paragraph_one_text`, `paragraph_two_title`, `paragraph_two_text`, `created_at`, `updated_at`) VALUES
(1, 'اعرف من نحن', 'جمعية تطوعية (غير ربحية) تهدف إلى خدمة وتأهيل ذوي الإعاقة في جميع المجالات؛ في بيئة تعليمية محفزة ومجهزة بكافةالأدوات والوسائل المساعدة, وذلك على يد كوكبة من أخصائيات التربية الخاصة المتطوعات في مجال تدريب وتأهيل ذوي الإعاقة، كما تقدم الجمعية برامج تعديل السلوك الإنساني لذوي الإعاقة, وخدمات التدخل المبكر, مما يجعل الطفل قادراً على التكيف مع من حوله, وإكسابه مهارات اجتماعية لينمو ويندمج ويتكيف مع ذاته ومجتمعه، نقيم العديد من الشراكات المجتمعية؛ لتحقيق مبدأ التعاون والتكامل وإقامة علاقات فعالة مع كافة المستفيدين من الخدمات المجتمعية سواء في التعليم أو غيره من المؤسسات والجهات الرسمية،  وقد تأسست الجمعية تحت إشراف وزارة الموارد البشرية والتنمية الاجتماعية بترخيص رقم 1416 في يوم 6 ربيع أول 1441 الموافق 3 نوفمبر 2019.', 'رؤيتنا', 'معاق واثق ذاتياً, متمكن مهارياً, مؤهل سلوكياً', 'رسالتنا', 'جمعية نسائية متخصصة في تعليم وتدريب ذوي الإعاقة, وتهيئة بيئة مجتمعية محفزة من خلال أحدث الأساليب والتقنيات، بواسطة كوادر بشرية متمكنة', '2022-03-17 22:44:44', '2022-05-09 18:03:59');

-- --------------------------------------------------------

--
-- Table structure for table `beneficiaries`
--

CREATE TABLE `beneficiaries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `second_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `third_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fourth_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `record` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disability_id` int(11) NOT NULL,
  `nationality_id` int(11) NOT NULL,
  `id_pic` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `medical_report_pic` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `beneficiaries`
--

INSERT INTO `beneficiaries` (`id`, `first_name`, `second_name`, `third_name`, `fourth_name`, `email`, `phone_number`, `record`, `disability_id`, `nationality_id`, `id_pic`, `medical_report_pic`, `email_verified_at`, `password`, `role_name`, `Status`, `api_token`, `remember_token`, `created_at`, `updated_at`) VALUES
(9, 'بخيتة', 'عبدالله', 'فريد', 'العولقي', 'abdallahfahad186@gmail.com', '966562690906', '2126160759', 11, 33, 'uploads/id_pics/9/IMG-20210726-WA0001.jpg', 'uploads/medical_report_pics/9/Screenshot_٢٠٢٢٠٥١٨-٠٨٤٣٠٥_Gallery.jpg', NULL, '$2y$10$Y5LD9H4vDYI9mvCbTSuA..W2FxcucrfhplQHzfiXoMLKZXFSvkIaK', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-18 15:49:09', '2022-05-19 03:23:36'),
(10, 'علي', 'مهدي', 'علي', 'ال الحارث', 'Aljood174@gmail.com', '532600739', '1170074874', 16, 1, 'uploads/id_pics/10/IMG-20150308-WA0004.jpg', 'uploads/medical_report_pics/10/تقرير علي.pdf', NULL, '$2y$10$3mT9lVkA.A963hYMKr.esu5HECZte.lZttImZx4SI4lgnXiZc509K', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-18 16:06:56', '2022-05-19 03:25:27'),
(11, 'مانع', 'علي', 'سعود', 'ال مردف', 'naaaj2017@icloud.com', '966553848945', '1159328754', 11, 1, 'uploads/id_pics/11/EA0137AF-96E1-4AFD-A6A3-3F279E2FB3E1.jpeg', 'uploads/medical_report_pics/11/IMG_4231 2.pdf', NULL, '$2y$10$/628xFu8UFVD9a5akZfq5.mqSJ1aQuynCmMwFR7Oljtnd4S6m.7AS', 'مستفيد', 'تمت الموافقة', NULL, 'p8d3BCiaWQqCgeFYyhQSGpfjD8tmJDliMSs0ZYACn2sQaPxSlK9sti7QGnGJ', '2022-05-18 16:08:16', '2022-06-03 01:22:48'),
(12, 'محسن', 'حمد', 'علي', 'الكربي', 'mhsnh4025@gmail.com', '966534449313', '1053048417', 6, 1, 'uploads/id_pics/12/0FD0BD3A-DEC7-4294-A12B-F4BB7952E81F.png', 'uploads/medical_report_pics/12/ابو حمد.pdf', NULL, '$2y$10$SF.6W9jzD7wO6YMGQl/Si.tVNXXxa3biikxs1/HA5H0hWfI.f2D6O', 'مستفيد', 'تمت الموافقة', NULL, '8ctfwLsDl95liSewYF1sVCOFVaKiGt6DkFDLZqGRZOwwuMSxA3vDWCb50Jrn', '2022-05-18 16:10:22', '2022-05-19 05:15:53'),
(13, 'يوسف', 'عبدالله', 'يحي', 'ال شيبان', 'ylll6661@gmail.com', '966531526661', '1161427628', 11, 1, 'uploads/id_pics/13/B82F633A-7163-4CF4-BF19-6AC179867ABB.jpeg', 'uploads/medical_report_pics/13/مستندات ممسوحة ضوئيًا 2.pdf', NULL, '$2y$10$7I.Nusbt1XOff8ESGXcQJuh2RnpgaTYT8RPLf23Jl0p8TsVrAt35m', 'مستفيد', 'تمت الموافقة', NULL, 'OtPmHKkl2vLjFFXsDsp71q9scjkbdNiAIaW1FeTiFBnKfufWGSihpBSjbdEK', '2022-05-18 16:13:07', '2022-06-08 17:57:43'),
(14, 'محمد', 'فهد', 'محمد', 'العجمي', 'haya59599@gmail.com', '0555219039', '1192116786', 12, 1, 'uploads/id_pics/14/910269B2-EB19-45A3-97AB-E96991399D23.png', 'uploads/medical_report_pics/14/CamScanner 05-15-2022 08.40.pdf', NULL, '$2y$10$4tz6/hhxPM06WNOwi8rBM.N/JVHPJUQ710EiPf/jWzKewXdyZjjQS', 'مستفيد', 'تمت الموافقة', NULL, '0BKHxArQsTUhgekrUuv2dBgQxDW2Gx1kWNInYtTvciYSPrG7Y3uma3TIxAli', '2022-05-18 16:24:19', '2022-08-17 22:34:49'),
(15, 'مشعل', 'فرج', 'محمد', 'الفهاد', 'manal.fa000@gmail.com', '966532954319', '1164626374', 12, 1, 'uploads/id_pics/15/C0F0003D-7542-4609-9C60-489E0370D34E.jpeg', 'uploads/medical_report_pics/15/تقرير طبي.pdf', NULL, '$2y$10$XwznETdgEyaVo/hSArX2iOW8gOhiivWSpPK78liiTWWOWuyPrNA3.', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-18 16:32:47', '2022-05-19 04:00:21'),
(16, 'علي', 'فهد', 'محمد', 'اليامي', 'rannaj87@gmail.com', '966544466242', '1167599941', 8, 1, 'uploads/id_pics/16/٢٠٢١١٠٠٦_٢٠٠٧٠٩.jpg', 'uploads/medical_report_pics/16/Screenshot_٢٠٢٢٠١١٤-٠٠٠٩٤١_Office.jpg', NULL, '$2y$10$WGGryUMZ5L0APuZ/g/GPquo0WfZbaBPfibB.zclhsMEreLIp8yd8K', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-18 16:43:39', '2022-05-19 04:00:38'),
(17, 'فاطمة', 'فهد', 'عبدالله', 'ال سليم', 'Noufsaleh.najran@outlook.sa', '0507952215', '1191444304', 13, 1, 'uploads/id_pics/17/كرت العايلة.jpg', 'uploads/medical_report_pics/17/A3CCA617-68F7-42C8-893B-7BAAB95C136A-محول-مضغوط.pdf', NULL, '$2y$10$4vjYXsZt7.GW5vkJyKpSReKg5Kro7VvtPPoaMKnTIYeuFPaSxqnh6', 'مستفيد', 'تمت الموافقة', NULL, 'TnLtquuaGSPkauEgcKTWncV4M86bYDrcTkSt1JhDfAzlzMk5Bu6VY2pArBQg', '2022-05-18 17:34:48', '2022-06-07 17:58:42'),
(19, 'أحمد', 'إبراهيم', 'حسين', 'البكري', 'myshw23@hotmail.com', '966533259555', '1145326706', 12, 1, 'uploads/id_pics/19/13FA9844-A678-43A2-9870-25B81F674B17.jpeg', 'uploads/medical_report_pics/19/أحمد.pdf', NULL, '$2y$10$OFv8PAIEk.Njl973hVwBWOExFonf8NyoaWBynorZKziVa4uaH.HRu', 'مستفيد', 'تمت الموافقة', NULL, 'Fk7YPVxa4ZqTcBO5OTzeCdBoHkYcfJ8p8NsLnFAkaMvKoOZOAM6tLnjKdXu0', '2022-05-18 18:22:11', '2022-06-09 21:25:57'),
(20, 'علي', 'محمد', 'سعود', 'الحربي', 'cffvvm@gmail.com', '966551614313', '1172121558', 6, 1, 'uploads/id_pics/20/Screenshot_٢٠٢٢٠٥١٨-١٢٣١٠٢_Gallery.jpg', 'uploads/medical_report_pics/20/Screenshot_٢٠٢٢٠٥١٨-١٢٣١٠٢_Gallery.jpg', NULL, '$2y$10$77AIKd263GLBsPXW7C0/tOoMHwzeveMjsvBB4tVtsyVXy/vrnaBa6', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-18 19:40:37', '2022-05-19 04:03:05'),
(21, 'بلال', 'علي', 'مرشد', 'زبار', 'abu-shaja@hotmail.com', '966555618557', '2451354613', 11, 33, 'uploads/id_pics/21/F3659EA3-48A4-46E6-ACAC-B665DB9FE895.jpeg', 'uploads/medical_report_pics/21/بلا عنوان 3.pdf', NULL, '$2y$10$OoBjAstCNwbpXsyM7out0.W2eZclurKM7q3j0UCLanz7Hf4ij96c6', 'مستفيد', 'تمت الموافقة', NULL, 'WvHdayUJJyi7EoxpZyrhosWw22xmaiNcQpJaPSpl1Ol1yAkmwXOZCCCj39NG', '2022-05-18 19:53:00', '2022-05-19 04:19:16'),
(22, 'محمد', 'عبدالله', 'ورقش', 'حمدان', 'a.wargash@gmail.com', '966533033136', '2061097669', 12, 33, 'uploads/id_pics/22/هوية محمد عبدالله ورقش.jpg', 'uploads/medical_report_pics/22/تقرير طبي.pdf', NULL, '$2y$10$N98juzOhZJae9YQPfaLwmewyGg1BItj.v14q7wfH4VDQR40R4Q9fu', 'مستفيد', 'تمت الموافقة', NULL, 'rs6orfnamEcmxXyzNpFTVIdUZcy5d2WCJLDe0j9YHRVXQe8o8gZROLZGd5CG', '2022-05-18 19:54:45', '2022-06-09 16:41:58'),
(23, 'سعود', 'محمد', 'سعود', 'الحربي', 'alhrbyyswd0@gmail.com', '966553393124', '1177930763', 12, 1, 'uploads/id_pics/23/Screenshot_٢٠٢٢٠٥١٨-١٢٥٠١٢_Gallery.jpg', 'uploads/medical_report_pics/23/Screenshot_٢٠٢٢٠٥١٨-١٢٥٠١٢_Gallery.jpg', NULL, '$2y$10$MuUqbSUHyffA3hYccOzpOOW1YzY3KR1QwP7ULQJ7gNlZ5iNK1lDjW', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-18 19:56:05', '2022-05-19 04:19:14'),
(24, 'ديالا', 'مانع', 'عبدالله', 'ال زمانان', 'mahp20p20@hotmail.com', '599588404', '1192409033', 16, 1, 'uploads/id_pics/24/صورة.png', 'uploads/medical_report_pics/24/صورة 2 (PDF).pdf', NULL, '$2y$10$u7dxsjQ6239eHUnqyHu41u1HPuRNJGf9tqw3GeKOS0ZDSw5Hur2cW', 'مستفيد', 'تمت الموافقة', NULL, 'VxCO3zVA9FIfckJHzdetfUNodNkH0kkCHJFHPSS0xxpCEpT6OGkocJjlBlAA', '2022-05-18 20:04:42', '2022-05-19 04:18:57'),
(25, 'نورة', 'مانع', 'عبدالله', 'ال زمانان', 'mahp20p20@gmail.com', '532169461', '1181446566', 16, 1, 'uploads/id_pics/25/صورة.png', 'uploads/medical_report_pics/25/صورة 3 (PDF).pdf', NULL, '$2y$10$POVWEVwIybaZFpSPZtCZK.WZHFDmNW5ot6a5DTGwfiRgnj5Y/hLxi', 'مستفيد', 'تمت الموافقة', NULL, 'qgjp4isKTXbOOt9nwSl3c1oCOEDODK0jpSMWaumu3s5msn3OyLvsKkiwGizq', '2022-05-18 20:08:24', '2022-05-19 04:18:56'),
(26, 'وفاء', 'صالح', 'سعيد', 'الحارثي', 'mhsanksa1990@gmail.com', '0501209719', '1116400639', 14, 1, 'uploads/id_pics/26/IMG-20220424-WA0034.jpg', 'uploads/medical_report_pics/26/Screenshot_٢٠٢٢٠٥١٨-١٣٠٨١٠_WhatsApp.jpg', NULL, '$2y$10$ofhwNwIWkr7tlu5F0cri6esn/qMDTwlN2jS.0wgFH0.nm7F1lGAqi', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-18 20:08:46', '2022-05-19 04:18:58'),
(27, 'تميم', 'حسن', 'حسين', 'ال عباس', 'fa1981.ts@gmail.com', '966530972648', '1170017014', 12, 1, 'uploads/id_pics/27/4DB55E98-A4C4-4E83-B1B0-DA84BA027FF3.jpeg', 'uploads/medical_report_pics/27/IMG_2925.pdf', NULL, '$2y$10$HWMSSgLkEp8Z3hlrV94O/.oYBXkI/uvnDB2VR5KEC4gcE2D5m7vry', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-18 20:22:42', '2022-05-19 04:18:41'),
(28, 'موسى', 'حسين', 'احمد', 'المكرمي', 'hussen-m@hotmail.com', '966550507900', '1145150312', 1, 1, 'uploads/id_pics/28/هوية العيال جمعية نور.jpg', 'uploads/medical_report_pics/28/تقرير موسى مهارات المستقبل.pdf', NULL, '$2y$10$ykTQU6ruuzvkYEAdtgHut.921wT4EsacbDNJ.EJkccIgliNhADc0S', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-18 20:25:43', '2022-05-19 04:18:40'),
(29, 'مزون', 'احمد', 'عوض', 'الهمامي', 'Mazoon.504@gmail.com', '966506591186', '1158990141', 11, 1, 'uploads/id_pics/29/صورة (jpg).jpg', 'uploads/medical_report_pics/29/صورة 2 (PDF).pdf', NULL, '$2y$10$CuU/NK.oTMuc1UP0AbFzoOjM7f9TG4TopPf1jItje/BVlSoz73HFe', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-18 20:29:04', '2022-05-19 04:18:28'),
(30, 'جملاء', 'حسين', 'محمد', 'آل سليم', 'JamlaAlyame@gmail.com', '966530367028', '1089056871', 11, 1, 'uploads/id_pics/30/C4EEF1F6-268C-425A-ADDC-006AF5CAFE7D.jpeg', 'uploads/medical_report_pics/30/تقرير طبي جديد.pdf', NULL, '$2y$10$aKbsuo0mhDhgFNTd6.kzdO.HkscTZUYOB8Oz81jzRDXR35tXI35Pq', 'مستفيد', 'تمت الموافقة', NULL, 'KONQ0JycIObDq7BL5q45jMOsQEd9LKgVtpKtz9XGtVlLNsBAJbPQNOUeg5HP', '2022-05-18 20:48:05', '2022-07-28 12:08:24'),
(31, 'سعود', 'محمد', 'حمود', 'القفله', 'samehhh115@gmail.com', '966550580705', '1165403757', 16, 1, 'uploads/id_pics/31/Screenshot_20211028_190718_com.whatsapp.jpg', 'uploads/medical_report_pics/31/16528714350267797690171594552187.jpg', NULL, '$2y$10$kEhYI8iuSqkTPiVItAquzuEJQPFV7btVlIFBfgkAXOPr8ni.8Q/D.', 'مستفيد', 'تمت الموافقة', NULL, 'Lx4Ojfij2l4VoPNRBvuOiUvNNSWhD9zFss96DnAtsIq1Nm0S5O9KjBbMlTBF', '2022-05-18 20:58:56', '2022-06-13 01:03:54'),
(32, 'خديجه', 'فايز', 'محمد', 'ال خريم', 'fm5372@hotmail.com', '966553724434', '1190711661', 9, 1, 'uploads/id_pics/32/17E6EC71-2512-4F47-ACFB-AD453B9E23AD.jpeg', 'uploads/medical_report_pics/32/تقرير طبي خديجه.pdf', NULL, '$2y$10$mT.tWf/bJ2LCm.CFBww4n.DsVzxl2dYWKgIG26FQ3lhOYIzIszZz.', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-18 21:16:51', '2022-05-19 04:18:12'),
(33, 'علياء', 'داود', 'صالح', 'ال مطارد', 'nawaaalrakan@hotmail.com', '509255733', '1150016366', 16, 1, 'uploads/id_pics/33/F8E4EAF6-7FB8-4E5D-94A0-07C8FF9A54DC.png', 'uploads/medical_report_pics/33/الصورة التي تم حفظها.pdf', NULL, '$2y$10$MiizffCc57DQU1fJe0Uw.OldF4fQEAunaN5WVpDGvUipi3Ql4mCpy', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-18 21:39:31', '2022-05-19 04:18:11'),
(34, 'ريما', 'طامي', 'جابر', 'الوادعي', 'Ahodalwady@hotmail.com', '555569201', '1181227850', 13, 1, 'uploads/id_pics/34/DAC1069A-3AE0-4500-8543-A58EBD3C9256.jpeg', 'uploads/medical_report_pics/34/SCHOOL HEALTH CARD.pdf', NULL, '$2y$10$befLpZfT4dzVwhltUbT2/eTbLYgmt.51RYckxhN9N9nFLyxki5B4q', 'مستفيد', 'تمت الموافقة', NULL, 'ZSLTxGWvU6ZlxDFNJdf8eRCqJiXNqlVMOB6TtzCxemZFdBDuDoQIumnNUshh', '2022-05-18 21:55:30', '2022-05-19 04:17:56'),
(35, 'جابر', 'طامي', 'جابر', 'الوادعي', 'ttttt-1@hotmail.com', '555529061', '1187086168', 13, 1, 'uploads/id_pics/35/A2D82A88-16B8-426B-B0F8-47EFB1336A96.jpeg', 'uploads/medical_report_pics/35/SCHOOL HEALTH CARD.pdf', NULL, '$2y$10$/17dUBXKCdImVPmnzw4IwuFm2ixvQ1xgCr65zZnWt0x8PItPO06gm', 'مستفيد', 'تمت الموافقة', NULL, 'Hc1QTl7zN4Ggpikzce99c6wNtkYvpjiqE7IxBrnRx783GHxvd5vtTIgMeDxw', '2022-05-18 21:59:11', '2022-05-19 04:17:55'),
(36, 'ولايف', 'علي', 'محمد', 'مزيد', 'asaaed29000@gmail.com', '966501450648', '1144331301', 9, 1, 'uploads/id_pics/36/1652877460215294133491.jpg', 'uploads/medical_report_pics/36/1652877580043776678928.jpg', NULL, '$2y$10$6cD9fPGD3ugToBttl6ZQm.MsjUsL0Td3kAgsDAjVnkppkOEHOYGZy', 'مستفيد', 'تمت الموافقة', NULL, 'NWQ6glGCFmuPYd3nlsVwGPB1IIleK7WGNgyDtAUJnTEKtW1JPRcgDWVGKdnW', '2022-05-18 22:41:57', '2022-06-10 05:09:53'),
(37, 'أحمد', 'محمد', 'برير', 'البلة', 'mbreer8011@gmail.com', '966507313713', '2217335690', 12, 5, 'uploads/id_pics/37/IMG-20220518-WA0014.jpg', 'uploads/medical_report_pics/37/PDF تقرير احمد ٢.pdf', NULL, '$2y$10$BpnVZwH99whjUAVKAzWO2ucRTqnTIjOlc9gNTyjUjwjEsqHv.XyYm', 'مستفيد', 'تمت الموافقة', NULL, 'VJK8p3N6dmkawndIstQ9nj7J54puc9h8qX2ZoNAdbwDEWnHTcfjXpVEaXJlZ', '2022-05-18 22:52:03', '2022-05-19 04:17:39'),
(38, 'عبدالله', 'حسين', 'الحسن', 'المكرمي', 'Mansorhussain@hotmail.com', '966509084152', '1189888629', 11, 1, 'uploads/id_pics/38/71003A9B-F982-4CB6-8DF9-5F8F6CEE7353.png', 'uploads/medical_report_pics/38/تقرير طبي.pdf', NULL, '$2y$10$/3HjwOowsig0JC00a73kweP765Q0/kaElbxAExLaLyz2jBMR6zjO6', 'مستفيد', 'تمت الموافقة', NULL, 'xYsnfo89AQDDbmjSENbjN0mnKXoWTjq0HKfI0MXUEv5NJTgh3v0bTGhbZxrh', '2022-05-18 23:00:55', '2022-05-19 04:17:38'),
(39, 'اماني', 'صغير', 'يحيى', 'ال عباس', 'z.eiman2019@gmail.com', '966533811879', '1159292349', 11, 1, 'uploads/id_pics/39/IMG_1614.jpg', 'uploads/medical_report_pics/39/مستند PDF 2.pdf', NULL, '$2y$10$W1WVvm4GszBgRGizP7lzauWbbM.jOkO0CSoEeX8phI8AL6ab56Khi', 'مستفيد', 'تمت الموافقة', NULL, 'B13uiJeYhl2P8E7O0Gp0lACtT1gMnLihjKE044TxyGmq1pjWArSFo218N5cF', '2022-05-18 23:08:18', '2022-06-07 23:52:25'),
(40, 'يوسف', 'عادل', 'عبده', 'عبدالجليل', 'a_a_a_a033@hotmail.com', '552616205', '2026063020', 6, 33, 'uploads/id_pics/40/اقامة يوسف.jpg', 'uploads/medical_report_pics/40/تقرير يوسف.pdf', NULL, '$2y$10$bHe.n8weVfICzcUOdrIoKuZlIgt1mRHq4/OY97fp822ly3E.pni/m', 'مستفيد', 'تمت الموافقة', NULL, 'ffL1m0U3Hk6thpFbs694chnJufFCacfr3J6EuCyr3ftjrvwPKriwvIliTwCb', '2022-05-18 23:41:05', '2022-05-19 04:15:25'),
(41, 'حفصه', 'عبدالوهاب', 'عبدالواحد', '-', 'sabren.afg.120@gmail.com', '966580790637', '2231568227', 1, 71, 'uploads/id_pics/41/D26B35ED-C6DE-407A-8576-CD3924659A23.jpeg', 'uploads/medical_report_pics/41/Adobe Scan 18 May 2022.pdf', NULL, '$2y$10$gPcMDKHtQJ2HvbpcgYaU0u/uqpacpyVVx7gMBKbNAHou4XdwkgtlW', 'مستفيد', 'تمت الموافقة', NULL, '9Mlr7TlgvsVV24EeCFmzWbxVufiToEmTHBLnfmiLQBIMeKixrYjFKsPs3OTJ', '2022-05-18 23:43:56', '2022-05-19 04:16:38'),
(42, 'جمانه', 'قاسم', 'صلاح', 'نورالدين', 'ddody1891@gmail.com', '966562518320', '2458373848', 13, 33, 'uploads/id_pics/42/٢٠٢٢٠٣٢٣_١٨٢٥٤٥.jpg', 'uploads/medical_report_pics/42/Screenshot_٢٠٢٢٠٥١٨-١٧٠٤٥١_WhatsApp.jpg', NULL, '$2y$10$txQ.2HSoU8tcQtmhfJ4UMeUTa8CiqukjBq.hAeTG33i0osl7XXAKC', 'مستفيد', 'تمت الموافقة', NULL, 'M4n6XShRqBz8wpW3w15ZyI9ZjcqK4e1RGuO5TynlqFSYYesdKhazVDWEwU7H', '2022-05-19 00:11:30', '2022-06-13 14:35:20'),
(43, 'احمد', 'عادل', 'عبده', 'عبداجليل', 'adlaldby247@gmail.com', '536349931', '2026063020', 16, 33, 'uploads/id_pics/43/اقامة حمود.jpg', 'uploads/medical_report_pics/43/تقرير حمود.pdf', NULL, '$2y$10$iym10qtNIXjrZ2nBmXowuuy1wOz.I0tANOZCHyAFVwfUt0PM/i6Dq', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-19 00:20:39', '2022-05-19 04:15:23'),
(44, 'يوسف', 'سالم', 'جمعان', 'ابو هاملة', 'salim121233@hotmail.com', '966544078688', '1158088185', 12, 1, 'uploads/id_pics/44/كرت العائلة.jpg', 'uploads/medical_report_pics/44/التقرير وترجمته.pdf', NULL, '$2y$10$AQVMK6TOR6zCzDdz2VjujuZuBaNnI0fnOzOfbUFshIcoG2qQ/.MVy', 'مستفيد', 'تمت الموافقة', NULL, 'W2OjNMoMibfUHt7lX97ilh5s4uuTt1dffxLZGxhJPd0pj0y14ojtvfzwt7Vx', '2022-05-19 00:33:11', '2022-05-19 04:15:04'),
(45, 'ميهاف', 'صالح', 'سالم', 'ال ساري', 'sa0536559589c@gmail.com', '0536559589', '1182821775', 16, 1, 'uploads/id_pics/45/Screenshot_20220518-182140.jpg', 'uploads/medical_report_pics/45/تقرير ميمي الأخير التوحد.pdf', NULL, '$2y$10$Tkn0w/L5a23pwdwrMkfPieZEz5Z9279shIxCRg9mQyPLv9lOtIqCW', 'مستفيد', 'تمت الموافقة', NULL, 'TDaTaMEzoWjHsAuxMwbe0xyNPFstnXPKHPhmY9LvOEkWSp86mQ4u95Zev3X6', '2022-05-19 01:22:11', '2022-05-19 04:14:53'),
(46, 'كادي', 'صالح', 'سالم', 'ال ساري', 'sa0536559589c1@gmail.com', '0536432250', '1193136742', 16, 1, 'uploads/id_pics/46/Screenshot_20220518-182140.jpg', 'uploads/medical_report_pics/46/كادي اخر تحديث .pdf', NULL, '$2y$10$tKnyu4KGlQ9BfkY1w2iQrO9BbOhhk2FOvo5sssQtFmW.RfGTy2vTW', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-19 01:24:41', '2022-05-19 04:12:23'),
(47, 'حمد', 'احمد', 'محمد', 'العماري', 'Ahmed.m.s600@gmail.com', '966555728415', '2010857817', 13, 33, 'uploads/id_pics/47/IMG_٢٠٢٢٠٥١٨_١٩٠٣٣٧.jpg', 'uploads/medical_report_pics/47/تقرير 4.jpg', NULL, '$2y$10$.ExXbcNkoQXhUMziBCAhLOs/MUcYA/FU/eOzZABIgH2bqQF4gV2jG', 'مستفيد', 'تمت الموافقة', NULL, 'pHizUqpMcp83ixSK1gLZPpJGBE6AgSZtA6ogbGQucI6kCUMSGmjnjtqY6MPN', '2022-05-19 02:08:03', '2022-11-06 20:41:00'),
(48, 'عبدالله', 'راكان', 'عبدالله', 'ال عوض', 'zzwwhhh16@gmail.com', '966542798281', '1190174787', 12, 1, 'uploads/id_pics/48/Screenshot_٢٠٢٢٠٥١٨-١٩٠٥٣٥_WhatsApp.jpg', 'uploads/medical_report_pics/48/Screenshot_٢٠٢٢٠٥١٨-١٩٠٥٤١_WhatsApp.jpg', NULL, '$2y$10$tFWEB40emIqsgEmto8JlfO/lER/A/Zp3Q4pPjZtKQXO.kpuMkLLci', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-19 02:10:43', '2022-05-19 04:07:24'),
(49, 'مشعل', 'راشد', 'غنام', 'الدوسري', 'ayon_2003@hotmail.com', '966559099559', '1146600398', 1, 1, 'uploads/id_pics/49/بطاقة أحوال مشعل.pdf', 'uploads/medical_report_pics/49/تقرير طبي حديث لمشعل.pdf', NULL, '$2y$10$yxm/pUSwMQkDS1YTCWPmp.C73uEWIMqrQbwOwyFnP1UNKnMSqQAb2', 'مستفيد', 'تمت الموافقة', NULL, 'WoxBTLnRJqaFNU49LybOQlLMX2srfdqR5OBWDzg65bpTLFC7xwPWlvRSb6B2', '2022-05-19 02:20:07', '2022-06-14 01:28:24'),
(50, 'خالد', 'هيثم', 'صالح', 'المصعبي', 'haitham-050@hotmail.com', '966558880608', '2362215473', 11, 33, 'uploads/id_pics/50/3C119E39-6B83-4F83-A19E-6B7D8A0428DB.jpeg', 'uploads/medical_report_pics/50/1F714FAE-3767-43C0-8B88-B1F6A55D7790.pdf', NULL, '$2y$10$KVyLOqUW5Hj36MZRWVr2f.fkWBjDeKBVW9I4XBSqDvDxTxmULyLgm', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-19 02:29:00', '2022-05-19 04:07:05'),
(51, 'خالد', 'علي', 'حسين', 'معلاق', 'fgd.432156@yif.nm', '537587483', '1182028934', 10, 1, 'uploads/id_pics/51/1652891641947.jpg', 'uploads/medical_report_pics/51/تقرير 3.jpg', NULL, '$2y$10$JOgNVXMN0sfoGuyLv0G/teOaSxb2LQoC01gqXwXPznXZkbMoShBz6', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-19 02:35:40', '2022-05-19 04:09:42'),
(52, 'سارة', 'علي', 'حسين', 'معلاق', 'fgd.432156@yif.nm1', '554042622', '1123025031', 6, 1, 'uploads/id_pics/52/1652892064154.jpg', 'uploads/medical_report_pics/52/تقرير 2.jpg', NULL, '$2y$10$.4McwDMeIexGNbSAFlaTx.MRgvIIEUjW6Hc0QWjmxZpfOj.CO1EV6', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-19 02:41:35', '2022-05-19 04:08:47'),
(53, 'ليان', 'احمد', 'عبدالله', 'الوادعي', 'a0559115950@gmail.com', '966559115950', '1138935638', 11, 1, 'uploads/id_pics/53/97E2A222-6D9E-4790-A943-8D31401F6250.jpeg', 'uploads/medical_report_pics/53/Alrajhi-0.6634842009328393.pdf', NULL, '$2y$10$GiVDu/OZjB5mSjrZVipDqeapcr4lh8LVB5yR85Rs0lkanRD.EXU0i', 'مستفيد', 'تمت الموافقة', NULL, 'SKnHdCLqluy44PjdvKRi55KGyO9iqtFemMuqEwdg3XeSlsgBS1xJOpX1zgjz', '2022-05-19 02:43:35', '2022-06-09 22:32:40'),
(54, 'زينب', 'صادق', 'صغير', 'ال جعره', 'sadg053g@gmail.com', '966534167846', '1177441175', 16, 1, 'uploads/id_pics/54/IMG-20220324-WA0013.jpeg', 'uploads/medical_report_pics/54/٢٠٢٢٠٥١٨_١٩٤٣٣٧.jpg.PDF', NULL, '$2y$10$P2MLKWKlZI5UPQr1Nvs9M.uJ6u48RwGvSk1VhAPKy8mDSq9enSi3i', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-19 03:00:28', '2022-05-19 04:04:02'),
(55, 'علي', 'صادق', 'جرمان', 'ال جعره', 'alwadyhsyn582@gmail.com', '966534406527', '1177441084', 16, 1, 'uploads/id_pics/55/٢٠٢٢٠٣١٥_١٩٢٦٥٥.jpg', 'uploads/medical_report_pics/55/٢٠٢٢٠٥١٨_٢٠١٦٠١.jpg.PDF', NULL, '$2y$10$Dt7eZcVJcgNQC2cH03wOt.1e8/nYUha3qd.n.4TlRUkECJPzHSypm', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-19 03:56:24', '2022-05-19 04:03:37'),
(56, 'غيد', 'محمد', 'احمد', 'معوض', 'MawadM54@gmail.com', '966535407516', '1153692510', 8, 1, 'uploads/id_pics/56/image.jpg', 'uploads/medical_report_pics/56/Medical Reports.pdf', NULL, '$2y$10$wXMcH2xKlLHi41FqyhaEAOuvmHPrwZCVLYhhYTuL1a0.5iWkgDBBS', 'مستفيد', 'تمت الموافقة', NULL, '41P9YfnrFi16XpcpUpcjKISrH00ZmhzWwCZVgDmSjMMPRkMtZ7zXwqYxSG9e', '2022-05-19 03:58:46', '2022-05-19 04:03:26'),
(57, 'محمد', 'مانع', 'محمد', 'ال سنان', 's901shl@gmail.com', '966557532588', '1180109918', 10, 1, 'uploads/id_pics/57/image.jpg', 'uploads/medical_report_pics/57/134dd855-3224-4a4a-a720-f28d0b6b42be (PDF).pdf', NULL, '$2y$10$wZz7CNwsS9bNMfHg2FAfou8oM82If53ha.F0LFWfKsuD2QYSrZcSO', 'مستفيد', 'تمت الموافقة', NULL, 'NVHGIea8x6fGuFGRxt2KI8ai1Y8lPpnzic0gOMesK0DBzMlEfPQ167I4hg3T', '2022-05-19 04:00:33', '2022-05-19 04:03:17'),
(58, 'سمران', 'ياسر', 'سمران', 'آل سوسان', 'sfdahcj777@gmail.com', '966502288442', '1178731673', 13, 1, 'uploads/id_pics/58/IMG_٢٠٢٢٠٥١٨_٢١٢٧٢٧.jpg', 'uploads/medical_report_pics/58/IMG-20220518-WA0019.jpg', NULL, '$2y$10$qgdNvorXuIr2qEy52Oo5R.hFsWck/1JFWZ1utRvGlyi8dXMXzawKC', 'مستفيد', 'تمت الموافقة', NULL, 'Zl1lLEPYeKnNJyJ0LDtHwe5ySsZ2eMIcJG8iyawzH7bjb7umlTyOyvSWDvhU', '2022-05-19 04:27:52', '2022-06-06 17:56:51'),
(59, 'زهراء', 'محمد', 'هادي', 'الزبيري', 'as5483343@gmail.com', '966551047240', '2094227093', 11, 33, 'uploads/id_pics/59/IMG_٢٠٢٢٠٥١٨_٢١٥٦٠٣.jpg', 'uploads/medical_report_pics/59/التقرير الطبي', NULL, '$2y$10$but2DCw3FA8pZ3tQ4nC7Z.79NSfysklBfzp/fDZUK/jaMw9O9/IW6', 'مستفيد', 'تمت الموافقة', NULL, 'yw6aSS5nvvAn0hqT9zzpYwUyoTlBGQFEIAR19hsotp3Y4ujwfMcLtA0c7VSP', '2022-05-19 05:17:35', '2022-06-29 11:48:19'),
(60, 'حمزه', 'راشد', 'مهدي', 'ال هتيله', 'mnym26970@gmail.com', '966534807159', '1147619009', 11, 1, 'uploads/id_pics/60/Screenshot_20220518_220050_com.whatsapp.jpg', 'uploads/medical_report_pics/60/382014', NULL, '$2y$10$qZfJzmnZl/MfGWIBC676p.dbPwS/jieL6knqFt.cGSGNVdOSuEOia', 'مستفيد', 'تمت الموافقة', NULL, 'Sqexb2bxs2G7xaqFJHySURzp54aIsaQm92qwYpDlyc5aXBaqPZSaLl1CbD2F', '2022-05-19 05:29:26', '2022-06-12 01:21:32'),
(61, 'حمد', 'محمد', 'علي', 'ال سليمان', 'Alban-2011@hotmail.com', '966567999983', '1165704857', 1, 1, 'uploads/id_pics/61/AEB4017B-7B30-4D6F-828E-95831646AB37.jpeg', 'uploads/medical_report_pics/61/00084672.pdf', NULL, '$2y$10$bQyfi.JJIBcLtHzfXTq2TezKvhZD54o10C3deezBXs3FKyfh.e4YS', 'مستفيد', 'تمت الموافقة', NULL, '1PoB7ZKlVEPQgpYreTQCPorqThMwGdDd80sXm6CMS74W8nCtcOmXxGYVK7vW', '2022-05-19 06:03:43', '2022-06-10 05:51:19'),
(62, 'انفال', 'محمد', 'فرج', 'المحامض', 'mf9998@hotmail.com', '0531829998', '1196877979', 11, 1, 'uploads/id_pics/62/CF83C23A-14F9-41EB-BB7E-4FF13A6A7F2E.jpeg', 'uploads/medical_report_pics/62/4160انفال المهيمز .pdf', NULL, '$2y$10$1QclijsvthpDykaNk8V7HewBM5GMXi9W8UMr9X7pX4kGT5.9XnzP2', 'مستفيد', 'تمت الموافقة', NULL, '5Uj0XCPU57P5d0iqM2weohLQm6nk8czs1BdOQkLgaUIMxhGY59C1SVhaKY9s', '2022-05-19 06:18:47', '2022-05-21 08:01:59'),
(63, 'بشرى', 'محمد', 'عبدالله', 'قوحنه', 'BUSHRA@gmail.com', '966557718097', '2230829422', 6, 33, 'uploads/id_pics/63/IMG-20220518-WA0056.jpg', 'uploads/medical_report_pics/63/1652905807012..jpg', NULL, '$2y$10$4bxfDW8bx6PvFWmU6.bYgOBKz/oTtk6c1DKoyHRFK7aRtSZa2y.gu', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-19 06:33:27', '2022-05-21 08:14:48'),
(64, 'غدي', 'عبدالله', 'محمد', 'اليامي', 'ghadiyamy12@icloud.com', '966531326636', '1127998472', 11, 1, 'uploads/id_pics/64/88563BF3-E2CA-41ED-A0FE-220F914E4F7E.jpeg', 'uploads/medical_report_pics/64/6ed24f97-acb6-43da-be36-369cc8401fb8.pdf', NULL, '$2y$10$..3KAxS3s8hk7G2MnpD7pOm.HxEexGPnnewHS93AfCRTi9NeJCHV2', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-19 07:09:45', '2022-05-21 08:13:54'),
(65, 'شهد', 'هادي', 'محمد', 'اليامي', 'hadyalmbrwk@gmail.com', '554375139', '1148319724', 1, 1, 'uploads/id_pics/65/Screenshot_٢٠٢٢٠٥١٩-٠٠٤٩٥٠_Gallery.jpg', 'uploads/medical_report_pics/65/Screenshot_٢٠٢٢٠٥١٩-٠٠٥٠٤٧_Gallery.jpg', NULL, '$2y$10$ynnitg/GJi/YsYQTdYOxyuxPXuA.uT82j3fqk5woi7JSVuxDeX5LK', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-19 08:24:37', '2022-05-21 08:13:40'),
(66, 'فوزيه', 'محمد', 'علي', 'البارزي', 'fwf28100@hotmail.com', '966503181172', '1031599143', 8, 1, 'uploads/id_pics/66/F4DB2D75-7304-4F62-9DFA-4FEA56E6F63F.jpeg', 'uploads/medical_report_pics/66/CamScanner 05-19-2022 03.08.pdf', NULL, '$2y$10$8hel3y9GEtdDmhE4VY3EOep87n8RE5SlfQ6rsyPsIVZGeCfjHIlPO', 'مستفيد', 'تمت الموافقة', NULL, '1uYftvI1oVZH9AB7RgzUPXo0t3qSfXNbPDHg3U3jcKL8nIOgX6OsWcLEp1LI', '2022-05-19 10:12:00', '2022-05-21 08:11:41'),
(67, 'فرح', 'مبخوت', 'سالم', 'اليامي', 'Noorah2231nn@gmail.com', '966530419843', '1194476964', 9, 1, 'uploads/id_pics/67/96976E56-0AF6-4F02-B278-A97106F76EB4.jpeg', 'uploads/medical_report_pics/67/تقرير فرح.pdf', NULL, '$2y$10$HCSCp4B1.u4bchYJ2T081.FaKj7FMwbWXE6Z.oPMtwxNYrKRUwPyq', 'مستفيد', 'تمت الموافقة', NULL, 'sRLw39jfD5W9NXg5ztTLXV6QPEF5nCDQOzM29y9xoexDSATIuENTS4TZrhDV', '2022-05-19 10:14:50', '2022-06-13 11:50:46'),
(68, 'جوري', 'مقبل', 'فيحان', 'البقمي', 'alabir_a@icloud.com', '966553491258', '1184483178', 12, 1, 'uploads/id_pics/68/3A161226-251B-450C-A8A9-0834EAEF7F46.jpeg', 'uploads/medical_report_pics/68/1.pdf', NULL, '$2y$10$je0kor2/houRD/3FuheGcuuK7A4xBk7vk/Pb40UoMKI/Nw0/waLsO', 'مستفيد', 'تمت الموافقة', NULL, 'zrGGMTf4QOR6321uwj5Vp3Rl15qwlWREmvJ4WeBX2kLAH2ZDlchDQYLPte6w', '2022-05-19 10:55:53', '2022-06-08 02:16:27'),
(69, 'فاطمة', 'حسين', 'علي', 'المكرمي', 'makr9666@gmail.com', '966552750365', '1136202783', 1, 1, 'uploads/id_pics/69/٢٠٢٢٠٥١٩_٠٧١٨٥٠.jpg', 'uploads/medical_report_pics/69/٢٠٢٢٠٥١٩_٠٨٣٣٢٤.jpg', NULL, '$2y$10$he6HF.NCKDzjR.HTYFa8O.DhaMbEKXDTKR2biDPkCY44hipv6oUjy', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-19 15:36:47', '2022-05-21 08:11:07'),
(70, 'محمد', 'سعد', 'حويدر', 'المنصور', 'sms997@hotmail.com', '966556442494', '1183454873', 8, 1, 'uploads/id_pics/70/9817CD13-27D1-4272-9C44-2FFDF04AC3E6.jpeg', 'uploads/medical_report_pics/70/تقرير.pdf', NULL, '$2y$10$e84PIhg1tjyuoqKIklxSa.FQlbxNMJKtzT5agRTvHuWaq0XaPm8S6', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-19 16:29:40', '2022-05-21 08:10:56'),
(71, 'زهراء', 'سالم', 'عمير', 'بالحارث', 'salemomair@gmail.com', '966550048498', '1181879980', 9, 1, 'uploads/id_pics/71/zahra salem IP.pdf', 'uploads/medical_report_pics/71/zahra salem report.pdf', NULL, '$2y$10$l10uWIHRzIvRDtNC92FFiOyhOgZ8Jf2NEPyFg.HD0/ovAefpp0Quu', 'مستفيد', 'تمت الموافقة', NULL, '5mM2BfIFD6ojqh9vhZmpwjMtpVReM1ufd66ddcxT4Y7CObTls63XHYK7W2HN', '2022-05-19 17:48:14', '2022-05-21 08:10:39'),
(72, 'بشاير', 'رايد', 'محمد', 'آل ناجي', 'abu.ljyn4@gmail.com', '966501716843', '1156734210', 11, 1, 'uploads/id_pics/72/001.jpg', 'uploads/medical_report_pics/72/تقرير ب.pdf', NULL, '$2y$10$hqIl851H14cAacAFCEGn.eQfNWQJ.aZRYcFSyFF//y9zwvAadbpK6', 'مستفيد', 'تمت الموافقة', NULL, 'M9cWQ3yXnbkcKflNkYie1PGEISN6dNQ1HUTjaFgHtoBIra2nQ49VSe0FtdNQ', '2022-05-19 19:03:07', '2022-06-13 01:01:59'),
(73, 'صالح', 'مساعد', 'صالح', 'الحارثي', 'Abw.afra@hotmail.com', '966559806411', '1148809401', 12, 1, 'uploads/id_pics/73/7EE1F1BA-8295-4921-9C8B-21336D0FDC08.jpeg', 'uploads/medical_report_pics/73/Maternity & Children\'s Hospital-Najran.pdf', NULL, '$2y$10$R9IbWS3LPvLWYE5glnbMbuu7TFsFvfnUYXExZpZByQHnzTqV1olQC', 'مستفيد', 'تمت الموافقة', NULL, 'sEiA1oZLmHlq2GWIxnTGN5LMDIKHdXa2tQeTdjEvVnLQ5lNn9XbUgawrnsBm', '2022-05-19 19:54:17', '2022-05-21 08:08:34'),
(74, 'أحمد', 'سلطان', 'بن سعد', 'آل ساري', 'sami.mageed9@gmail.com', '966558225969', '1163490731', 16, 1, 'uploads/id_pics/74/Image_20220519_0002_page-0001.jpg', 'uploads/medical_report_pics/74/Image_20220519_0003.pdf', NULL, '$2y$10$O37rcX.22xzBvnlNahFmG.mkwiWxxhAJOfJymIWa2nbVp5dVVAtkK', 'مستفيد', 'تمت الموافقة', NULL, 'EZNjHiNZyrtDBt3ItGQj8GMph0B8HrOxFG4Rdz8zXwpveoHVw4u0R3RNrG4t', '2022-05-20 00:04:18', '2022-10-02 23:52:42'),
(75, 'صالح', 'سلطان', 'صالح', 'آل ساري', 'creativeforservices@gmail.com', '966559943759', '1174684470', 16, 1, 'uploads/id_pics/75/Image_20220519_0002_page-0001.jpg', 'uploads/medical_report_pics/75/Image_20220519_0004.pdf', NULL, '$2y$10$nBUiRlG5JA2ynLJkj3N6Oes8U/H7c65uohD/HY45/OV5LX6shoVh2', 'مستفيد', 'تمت الموافقة', NULL, 'Sm0OZVf9Agn6Orv4MHDj6tkoixr1XRdm0uddJi3MH1g7PjTkwcO5bE4qkaAn', '2022-05-20 00:08:22', '2022-10-02 23:56:57'),
(76, 'جوري', 'شافي', 'محمد', 'ال شملان', 'm0552344811@hotmail.com', '966551924252', '1147704827', 2, 1, 'uploads/id_pics/76/IMG-20220424-WA0008.jpg', 'uploads/medical_report_pics/76/IMG_٢٠٢٢٠٥١٩_٢٢٢٦٠٩.jpg', NULL, '$2y$10$08IBzSglFseDYZv8WZ/l2e/lm1qXub5VxoWQTHVVq6btSFSRVECDS', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-20 05:40:44', '2022-05-21 08:04:45'),
(78, 'خالد', 'محمد', 'صالح', 'الحارثي', 'smoo201432@gmail.com', '966553468320', '2402413773', 1, 33, 'uploads/id_pics/78/16529935730846602055740946030071.jpg', 'uploads/medical_report_pics/78/CamScanner 05-19-2022 23.42 (1).pdf', NULL, '$2y$10$NNz5YuHPyYthzKQ6HC6NEOmpL6J8DAAmzenDWNP1AtY.KVHSrOzSu', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-20 06:53:21', '2022-05-21 08:04:01'),
(79, 'حسين', 'ابراهيم', 'حسين', 'اليامي', 'rrarr25@hotmail.com', '966507143431', '1176616405', 11, 1, 'uploads/id_pics/79/24BE86DE-9D21-44B0-844B-398757CDC45F.jpeg', 'uploads/medical_report_pics/79/تقرير حسين.pdf', NULL, '$2y$10$odZY1e.k9bdkK8NaFqYY7ugQnNYOFfJMmUBnDD2b8I3uZjydXNx0m', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-20 09:15:28', '2022-05-21 08:02:58'),
(80, 'لمار', 'محمد', 'بشير', 'العنزي', 'nmm2016ww@gmail.com', '966503896229', '1175725769', 16, 1, 'uploads/id_pics/80/IMG_2529.jpg', 'uploads/medical_report_pics/80/تقرير لمار 2.pdf', NULL, '$2y$10$R/k8/yd3K8H08cZv87RheumiDolmkR2p4sKYPYAsdwkeIH9fte3/y', 'مستفيد', 'تمت الموافقة', NULL, 'fNgSALlf3HoPardiApaR5d7CNWCfhGnfSb0YxkTEL5953fz7nEIU8DwTz1Cr', '2022-05-20 23:10:58', '2022-05-21 08:02:45'),
(81, 'هادي', 'عزيز', 'علي', 'علي', 'mxmmmxmnnbvyj10@gmail.com', '966560944128', '2300485238', 11, 33, 'uploads/id_pics/81/2233.pdf', 'uploads/medical_report_pics/81/Doc1 (3).pdf', NULL, '$2y$10$wPwg0DlVzekXnAQmKnhanOz20VhFzmQxbG79Q9SO4iKCzTLxU3wMO', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-21 04:56:17', '2022-05-21 08:02:19'),
(82, 'حسن', 'فيصل', 'منصور', 'ال حارث', 'mmnn009g@gmail.com', '966501388905', '1143354288', 9, 1, 'uploads/id_pics/82/٢٠٢٢٠٥٢١_١٤٠٠١٦.jpg', 'uploads/medical_report_pics/82/Screenshot_٢٠٢٢٠٥٢١-١٤١٢١٤_Write on PDF.jpg', NULL, '$2y$10$ljeutL3/a8qMf9IKMLhVrO2dnP2Xu87CY04M7G8vdOq8Th2bYkgoi', 'مستفيد', 'تمت الموافقة', NULL, 'PlJye8diwHt6kI4Tbb3HlrmyUuACuQUvgZqNw52lwozScZNlPcD7K1YhjfB6', '2022-05-21 21:17:53', '2022-06-11 22:49:31'),
(83, 'عمار', 'رائد', 'عبدالله', 'الاحمري', 'NAM0038Z@GMAIL.COM', '0558618788', '1173389238', 10, 1, 'uploads/id_pics/83/232C8134-F4F8-4CC5-B914-FF9B0BB0EA20.jpeg', 'uploads/medical_report_pics/83/مستندات ممسوحة ضوئيًا 2.pdf', NULL, '$2y$10$X5pnDEAi1IPLIkjhxC30FuSxIxZBZd4WuCUq0t3dar4Y7/RAXi/oO', 'مستفيد', 'تمت الموافقة', NULL, 'HBogI1t0PccL3IkJsHSgiUOkhrxbeRJkf4vIBbgsilcEAnZpNOf9r8HkvqQk', '2022-05-22 02:26:16', '2022-05-22 04:13:16'),
(84, 'جود', 'أحمد', 'صالح', 'ناجي', 'inmng1t@gmail.com', '966500723037', '2455453502', 8, 33, 'uploads/id_pics/84/CamScanner ٠٥-٢١-٢٠٢٢ ٢٢.١٥.jpg', 'uploads/medical_report_pics/84/CamScanner ٠٥-٢١-٢٠٢٢ ٢٢.١٥.jpg', NULL, '$2y$10$Uj8P9FLtxIX5gJL3FT6que2DvdQmSXtp1ZN9J.eyh48BbI.E.sSAq', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-22 06:04:02', '2022-06-02 17:30:15'),
(85, 'ابراهيم', 'حسين', 'احمد', 'المكرمي', 'a1005155187@hotmail.com', '550507900', '1182703288', 1, 1, 'uploads/id_pics/85/هوية العيال جمعية نور.jpg', 'uploads/medical_report_pics/85/تقرير ابراهيم.jpg', NULL, '$2y$10$9HRPJliUCM1wzksRL5GSmupHZK//X7J.t6aT6G9sVlwdY.YpSrg9O', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-22 15:15:20', '2022-05-23 15:53:41'),
(86, 'علي', 'حسين', 'احمد', 'المكرمي', 'A1161692528@hotmail.com', '966537633993', '1161692528', 1, 1, 'uploads/id_pics/86/هوية العيال جمعية نور.jpg', 'uploads/medical_report_pics/86/علي حسين تقرير.jpg', NULL, '$2y$10$Xsr1jesjGgzXbPFn0GOD0O8Q5.L0FVZfygoL3IQHsd.FmEY9HPswu', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-22 15:22:42', '2022-05-23 15:53:31'),
(87, 'سعدى', 'مسفر', 'ظافر', 'ال الحارث', 'yamm222@icloud.com', '0557915303', '1031918350', 2, 1, 'uploads/id_pics/87/C3B528D3-67B5-46AE-AC6B-1D73692F6449.jpeg', 'uploads/medical_report_pics/87/صورة.pdf', NULL, '$2y$10$sGac4aCzZFIoK3BQ5qAQBujM1GYIJ0Cdz6NwjgWea/TbuB8j7CYo2', 'مستفيد', 'تمت الموافقة', NULL, 'hQmX83Dy07TA97lJtmfMuia9ay7Hzw91Ia48UwqaYTRwElx5CbkszLKL57V5', '2022-05-22 21:56:40', '2022-05-23 15:53:30'),
(88, 'ديالا', 'مهـدي', 'عبدالله', 'ال كزمان', 'kingdoom2015-@hotmail.com', '966559826366', '1185432513', 8, 1, 'uploads/id_pics/88/image.jpg', 'uploads/medical_report_pics/88/For Certified Translation.pdf', NULL, '$2y$10$nNLVFAF.TIwoof2A8fWYMu0hQErbrr/Drf38oZW4h49eMHHH2Ghre', 'مستفيد', 'تمت الموافقة', NULL, 'gmcrAC0ofXnc4uUWtUBaFskPjZZqwfntcKmHl9zQYbIoZV5GcAiQSWoH2PNz', '2022-05-23 22:54:47', '2022-06-10 00:33:37'),
(90, 'بشرى', 'محمد', 'عبدالله', 'قوحنه', 'BBB@gmail.com', '966594436372', '2230829422', 16, 33, 'uploads/id_pics/90/IMG-20220518-WA0011.jpg', 'uploads/medical_report_pics/90/تقرير طبي بشرى محمد.pdf', NULL, '$2y$10$kDiAPzTPiRk9hL6.ALpvd.mw4Co3/vKefJv1nGe6K0IZR3OmAvzRO', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-26 08:46:31', '2022-05-28 02:05:00'),
(91, 'لارا', 'ناصر', 'مهدي', 'النجراني', 'larasittah@gmail.com', '0559902041', '7114500249', 1, 1, 'uploads/id_pics/91/image.jpg', 'uploads/medical_report_pics/91/86B3A848-8B29-42A2-88DE-426D5CE591A0.pdf', NULL, '$2y$10$NQLqCB6fVaQ1tQN4n3s5AuajX4Umdo3BjZMxcxf0ydwvIuZ/JniQi', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-27 00:26:01', '2022-05-28 02:04:14'),
(92, 'حسين', 'محسن', 'عبدالله', 'الشريف', 'fAWSL2030@GMAIL.COM', '966536584061', '1132845023', 13, 1, 'uploads/id_pics/92/79aeffb6-a51e-4831-aef8-1067def50836.jpg', 'uploads/medical_report_pics/92/MCH - Arabic (1).PDF', NULL, '$2y$10$CEbXmK17AKoLYWM.aUMH9eWRVIZxOhhqy/8K/u8gTiA8YK5Nebu9y', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-28 09:22:42', '2022-05-30 16:35:29'),
(93, 'محمد', 'فواز', 'سالم', 'ال منصور', 'bash-m2011@hotmail.com', '966558296458', '1190135317', 13, 1, 'uploads/id_pics/93/image.jpg', 'uploads/medical_report_pics/93/MCH - English.pdf', NULL, '$2y$10$N..YU5b40idDRmXp5ztvT.vUGXi.14vFVDqAWyxVxVG0je2GeCu5W', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-05-31 00:12:30', '2022-05-31 17:00:54'),
(94, 'وفقه', 'علي', 'محمد', 'بالحارث', 'wfqah@outlook.com', '966535239282', '1038832638', 8, 1, 'uploads/id_pics/94/62FA2913-FB66-470D-A488-71A25BDD0BCA.jpeg', 'uploads/medical_report_pics/94/تقرير.pdf', NULL, '$2y$10$JMkTgeJPO4I0vJLJC1uYY.SuwpUZVFpuUSxw/YvQgIvnd21py2RpS', 'مستفيد', 'تمت الموافقة', NULL, 'zYg3yHmOynKGv5KpxhCpGV846FENaRaEizmeKlas2hz94JvGa1O5Y8YZOT5d', '2022-06-01 19:09:17', '2022-06-02 17:13:13'),
(96, 'زينب', 'هادي', 'مهدي', 'ال جمهور', 'fatimahmana@gmail.com', '966500668225', '1176629382', 1, 1, 'uploads/id_pics/96/51469A09-E8DC-4116-9470-46C367F158E4.png', 'uploads/medical_report_pics/96/تقرير شهر رمضان 2.pdf', NULL, '$2y$10$EwH477kbmB4Mykpq8Zxr1OIuwcnwCX24lm6dNJ8kO23CfLUyLAANi', 'مستفيد', 'تمت الموافقة', NULL, 'SrTuNAiEwo01OzpGXcpOrDU66xuNRhhaipq3kmsQZqX86bZYaymxoOR11aGX', '2022-06-02 17:24:00', '2022-06-02 17:24:29'),
(97, 'تميم', 'عمر', 'علي', 'ال ضاوي', 'o.aldhawi@yahoo.com', '966546783634', '1190909091', 12, 1, 'uploads/id_pics/97/سجل الاسره  ٢_page-0001.jpg', 'uploads/medical_report_pics/97/MCH - Arabic.pdf', NULL, '$2y$10$.BwNjv2vyC3T1MB2VGtQz.d27QQf9.fdASyvIuwqwMXafmvuPttyK', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-05 19:00:14', '2022-06-07 00:43:53'),
(101, 'عبدالله', 'فهد', 'محمد', 'الوادعي', 'wadha9999@hotmail.com', '966581221228', '1175848256', 12, 1, 'uploads/id_pics/101/80D3A8EA-D696-4A27-9317-8BB4FFF1F97B.jpeg', 'uploads/medical_report_pics/101/تقرير عبود الطبي.pdf', NULL, '$2y$10$Q8YsojOYPNEib1yYr7rw/e0wYAVQFOb0710hTd1.otfmevESTTGJO', 'مستفيد', 'تمت الموافقة', NULL, '4Nn8f9EQPkyO0ZajOI9dVFkTalYXc9C8HeSjBfBMMBnbPtS1TIT9t0K3AbrU', '2022-06-06 04:32:26', '2022-06-07 00:48:25'),
(104, 'محمد', 'علي', 'حسين', 'البكري', 'kh123kh00@gmail.com', '966531049790', '1166767788', 13, 1, 'uploads/id_pics/104/9B03338C-ED81-4C77-99EA-3731BA2FBE76.jpeg', 'uploads/medical_report_pics/104/687D7C43-3792-4D7C-9A9A-7A71C6A1CC82.pdf', NULL, '$2y$10$GPe1U/7w4g9RipSNe/cXS.IO7p.wGpd5963ohLl5UjY/fnCxq33CO', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-06 06:45:23', '2022-06-07 00:52:28'),
(106, 'بدر', 'محمد', 'احمد', 'ال قريع', 'dd141366@icloud.com', '966540230235', '1200412375', 11, 1, 'uploads/id_pics/106/image.jpg', 'uploads/medical_report_pics/106/1707-43-002937.pdf', NULL, '$2y$10$B.UIXP0iTRsZv3ITLP9mkespsNkV687kj7cCDvHdOLFcOSRk5IMOC', 'مستفيد', 'تمت الموافقة', NULL, 'xGzgDUOJ7f8HADagHnfXXUP7OhFjNl4qh9d8wqKlsz49NTn6IDDffADmScbp', '2022-06-06 17:20:42', '2022-06-07 01:08:46'),
(109, 'ابراهيم', 'حمد', 'محمد', 'العوف', 'mxd_2010@hotmail.com', '966555565952', '1150178570', 9, 1, 'uploads/id_pics/109/B576D0D2-0E86-4FBD-8D96-06B97902F953.jpeg', 'uploads/medical_report_pics/109/PHOTO-2022-06-05-08-36-24.jpg', NULL, '$2y$10$JREtW4spFpX9ejLGSxNDge0nCdZVGgA/kigIReqVV.x2mFnyRvcA.', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-06 20:28:00', '2022-06-07 01:12:06'),
(111, 'فاطمة', 'صالح', 'حسين', 'ال قريع', 'yyyggfd14345@gmail.com', '0558730049', '1081872010', 11, 1, 'uploads/id_pics/111/image.jpg', 'uploads/medical_report_pics/111/88165 .pdf', NULL, '$2y$10$gt0wGg3Y.0i.HzFZvhwNGOXP7Q60rUvRiT0cxSSInq2AIEUAI4Fqu', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-06 23:45:58', '2022-06-07 01:14:21'),
(112, 'ابراهيم', 'عايض', 'هادي', 'ال قريع', 'yyyggfd1434@gmail.com', '0554526883', '1138283379', 9, 1, 'uploads/id_pics/112/9BBF531C-F11D-427B-81A1-288E74C03933.jpeg', 'uploads/medical_report_pics/112/88169 .pdf', NULL, '$2y$10$wCI5jr8BDOiyEHuVqlxEYe8S.8bXqy65gqLVNsuBP/se8CaJ7aJhO', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-06 23:51:23', '2022-06-07 01:15:19'),
(115, 'حلا', 'عبدالله', 'صالح', 'اليامي', 'abdulla_alsale7@pm.me', '966571717000', '1170666695', 8, 1, 'uploads/id_pics/115/5F03E22F-9E2D-4986-962E-8965A6127AFE.jpeg', 'uploads/medical_report_pics/115/of Kingdom of Saudi Arabia.pdf', NULL, '$2y$10$OZFQ6Z/xi1eVYj8oFLQK8eUzsLw8.5hk1jNbRRa6wlDksp7hTUyMi', 'مستفيد', 'تمت الموافقة', NULL, 'wgHynkzo2lZ5UU1guuAUdlvUBCiq7H96zb1CA5lYyPSO7BDhOn9LFrS8zeDR', '2022-06-07 01:24:02', '2022-06-08 01:06:03'),
(116, 'مسعوده', 'عايض', 'هادي', 'ال قريع', 'ggg111222gg44@icloud.com', '966532665772', '1063720781', 17, 1, 'uploads/id_pics/116/image.jpg', 'uploads/medical_report_pics/116/Ministry of Health 2.pdf', NULL, '$2y$10$JB1OBRWerdbS.esZ8DbjOuCp1bTXNT71HV/WI/f0cB4.heNXsp802', 'مستفيد', 'تمت الموافقة', NULL, 'SD1Qa5VZSMDPC6xFSbRUKg9kCY4tkSBynAjBnGiSF5ajDCZpe9ippAWzOzx4', '2022-06-07 02:51:21', '2022-06-08 01:09:31'),
(117, 'علي', 'مصلح', 'علي', 'ال راكه', 'musleh2030405@gmail.com', '966552689530', '1176770517', 11, 1, 'uploads/id_pics/117/image.jpg', 'uploads/medical_report_pics/117/تقرير مدينة سلطان .pdf', NULL, '$2y$10$26xLfsc7dIh5g3mwazvOs.GQIFfJpuTR7y7.nXl4//hZ991EyKlDm', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-07 03:04:01', '2022-06-08 01:17:23'),
(118, 'تولين', 'سالم', 'حمد', 'ال شهي', 'awad.2006@windowslive.com', '966556756664', '1165904176', 10, 1, 'uploads/id_pics/118/89604A08-5304-4F20-9953-6F48815E4C70.jpeg', 'uploads/medical_report_pics/118/11722, 1104 AM.pdf', NULL, '$2y$10$XvtQNrpGQ.0drRStfzB7ke.8lhOSkJ/G.a9b4//hMJ4KPPM/KQUTK', 'مستفيد', 'تمت الموافقة', NULL, 'j0Fgxc28KVGjv1fslAqkTLJljYac1fxEeSebRsX0La6ow0x0LIs8l0Pr4HNa', '2022-06-07 05:32:58', '2022-06-08 01:19:03'),
(119, 'رزان', 'هادي', 'بخيت', 'ال فرج', 'hjitdk4@gmail.om', '530523764', '1147712622', 16, 1, 'uploads/id_pics/119/1654589269908.jpg', 'uploads/medical_report_pics/119/IMG_20220501_201809.jpg', NULL, '$2y$10$DneX5yyCOAuIQ1i/b1gNe.RO9lMIBKENZm5Zpwx1q8c..FbmPxoTK', 'مستفيد', 'تمت الموافقة', NULL, 'OHcZ1xtInbcKnDF6YM8cK53epwNcYoBfyQrhSiVSMvuoNshkaZTR2PPziivB', '2022-06-07 18:09:36', '2022-06-08 01:29:14'),
(120, 'ترف', 'سالم', 'مهدي', 'ال مشرف', 'rose727@windowslive.com', '966532124331', '1180648964', 16, 1, 'uploads/id_pics/120/كرت سالم 3.PNG', 'uploads/medical_report_pics/120/تقرير ترف الولاده.pdf', NULL, '$2y$10$Am0mnRQraXo.6Frq.W3pM.BB6yCAHrv0fy3UXdANS0W7mBhudqprO', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-07 19:17:52', '2022-06-08 01:30:02'),
(121, 'وصايف', 'محمد', 'علي', 'ال مفلح', 'rawabinaa711@gmail.com', '0508572817', '2508962335', 11, 33, 'uploads/id_pics/121/C567955D-87F0-482A-95D6-48CD4A2CAF64.jpeg', 'uploads/medical_report_pics/121/Scan ٠٦ ذو. ق ٤٣ · ٢٢·١٣·٠٨.pdf', NULL, '$2y$10$YF8fbIPLidnDrGS/diDZ/.TuktT1j9HgnepBois/g8hk.3xIBtORS', 'مستفيد', 'تمت الموافقة', NULL, 'GWUgRJWD0otuTF4JvJXU0AWHM8uDKEREH4kursFOpSRjtXsqmezkGRHfD9xJ', '2022-06-07 21:03:13', '2022-06-07 23:48:20'),
(122, 'نفلا', 'فهد', 'ظافر', 'اليامي', 'omnfala111@gmail.com', '966530521471', '1172414011', 10, 1, 'uploads/id_pics/122/1EB91080-AD71-4AA7-BE25-CA76853D2D1D.jpeg', 'uploads/medical_report_pics/122/4D5D65BC-C962-4ADE-A294-B5E78EAF5C75-محول.pdf', NULL, '$2y$10$T4/Rouwm.wsJBT1UM65nIeDBB8L/q8drxfQnwcTEU9sc2TKyFnMYO', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-07 22:22:34', '2022-06-08 01:31:01'),
(123, 'حواس', 'فهد', 'ظافر', 'اليامي', 'omnfala000@gmail.com', '966558072747', '1181769108', 10, 1, 'uploads/id_pics/123/94148181-1EB8-4B54-B4E9-2B52ABA2421C.jpeg', 'uploads/medical_report_pics/123/D2BBDC6F-F403-456A-9728-D1B2D6F6EA86-محول.pdf', NULL, '$2y$10$WtXo.BbcKT2hGeVTKoop..7DdEgTk6Ciy9l2cZv1GeWabwAOEPyxm', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-07 22:33:54', '2022-06-08 01:33:11'),
(124, 'علي', 'محمد', 'سعيد', 'العدينان', 'nor2022@gmail.com', '966553376335', '1043053279', 1, 1, 'uploads/id_pics/124/93FBF214-389E-409D-8A2F-AF70B697B004.png', 'uploads/medical_report_pics/124/تقرير..pdf', NULL, '$2y$10$lTI8jihaovWvguBdh/lcge90Fl3uGYORHUeS9kmhg9A6eu3.Be6lG', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-08 00:27:07', '2022-06-08 01:34:09'),
(125, 'حاتم', 'صالح', 'حسين', 'ال قريع', 'se1447@hotmail.com', '0506921192', '1143560660', 11, 1, 'uploads/id_pics/125/Screenshot_٢٠٢٢٠٦٠٦-٠٧٢٥٥٠_WhatsApp.jpg', 'uploads/medical_report_pics/125/IMG-20220606-WA0012.jpg', NULL, '$2y$10$lNqXw3JH/6LLA2mFGCxjM.Cmuq8zH3Cw1u0oVUj2Q84vpzOAnmYFS', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-08 00:38:50', '2022-06-09 23:51:12'),
(126, 'هبة الله', 'احمد', 'سعيد', 'عبد الفتاح', 'maysara233@yahoo.com', '966542989215', '2452112432', 9, 1, 'uploads/id_pics/126/IMG_٢٠٢٢٠٦٠٧_١٨٣٦٤٣.jpg', 'uploads/medical_report_pics/126/CamScanner ٠٦-٠٧-٢٠٢٢ ١٨.٤٦.pdf', NULL, '$2y$10$o7mWQOPrLf1lx9pLIu3use1zEh2inPCmwerHdROfKGee2epGjKw2S', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-08 02:01:51', '2022-06-10 09:38:10'),
(127, 'ازمان', 'علي', 'حسن', 'شبام', 'alyami.zakia@gmail.com', '966500313682', '2447837606', 13, 33, 'uploads/id_pics/127/٢٠٢٢٠٦٠٧_١٩٠٥٠٦.jpg', 'uploads/medical_report_pics/127/أمان علي حسن شبام.pdf.PDF', NULL, '$2y$10$SXntNe9lbjD.Qk72sBjp0ePazrEbRwLD3tmDCJbOPVv0hShiLMIPe', 'مستفيد', 'تمت الموافقة', NULL, 'CfjNeveTmUpGpURz8YavYonm0gESugJIrwho7LxeVRYxh2d08GCDa9mUOnYr', '2022-06-08 02:08:46', '2022-06-10 09:39:32'),
(128, 'حمزه', 'احمد', 'ناصر', 'ال ادريس', 'mex.asd7@gmail.com', '966580959240', '1175684842', 12, 1, 'uploads/id_pics/128/46E999D2-7AF1-4E05-936F-A23A85673348.jpeg', 'uploads/medical_report_pics/128/CamScanner 06-07-2022 19.14.pdf', NULL, '$2y$10$1sWBx6aaBJorXIfqLj.hbes8AmaKyPKJao0P6eMU/DrqAKq8Fgdx.', 'مستفيد', 'تمت الموافقة', NULL, 'PnG4AIFWggAkwxvTLo0WEuqxm0mD3QKWG7qrajFnmZhwtLV7FxtSGhdUH1x1', '2022-06-08 02:15:23', '2022-06-11 22:24:53'),
(132, 'محمد', 'احمد', 'عيظة', 'ال لعجم', '12ranaahmed@gmail.com', '0591058227', '1184197497', 9, 1, 'uploads/id_pics/132/1E632453-6892-4433-A3AF-7A91EE85E282.jpeg', 'uploads/medical_report_pics/132/818A8C5A-C157-43FA-BB1D-C298B4E9BBC6.pdf', NULL, '$2y$10$uhZrTHGZ5HbItldv5Nrhou1UBlGhmyrJ/YDvwYzACJ.S7B/XMBkYy', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-08 03:44:59', '2022-06-10 09:44:47'),
(133, 'نوال', 'عبدالله', 'حسن', 'العزي', '2020nawal@gmail.com', '966552285518', '2150443842', 9, 33, 'uploads/id_pics/133/٢٠٢٢٠٦٠٨_٠٠٤٢٢٦.jpg', 'uploads/medical_report_pics/133/جمعية نور نجران نوال العزي.pdf.PDF', NULL, '$2y$10$vL2ONNCvdkOOdQ0oP152n.DEGNY8V/TAlkMCd.TzuNz0FzpzAbRGu', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-08 07:52:20', '2022-06-10 09:45:13'),
(135, 'هيام', 'سام', 'حسين', 'الامير', 's.alameer5@gmail.com', '966500298601', '2391950751', 13, 33, 'uploads/id_pics/135/20220608_013532.jpg', 'uploads/medical_report_pics/135/20220608_013728.jpg', NULL, '$2y$10$HtlA9CUsji0niyJni4XlS.3YAJHxQ1kFXVEbHfid/OiiEkpd.6WHq', 'مستفيد', 'تمت الموافقة', NULL, 'p1Mhu5m05UfwomztrUPr6A7KwqwWGg285jnwpVTi9ankWILqYunj13KrpU15', '2022-06-08 08:38:50', '2022-06-10 09:46:27'),
(136, 'فهد', 'حسين', 'سعد', 'الصقور', 'awatfealsqwr66@gmail.com', '966532108695', '1191705845', 12, 1, 'uploads/id_pics/136/IMG-20220607-WA0016.jpg', 'uploads/medical_report_pics/136/pdf_٠تقرير فهد .pdf', NULL, '$2y$10$L8EqOmBU.OhTX2tDfIeS5e0R3uH9CR5ZzrZjBaYZN4OBTX8c/wEGu', 'مستفيد', 'تمت الموافقة', NULL, 'hM5lkUpJNfYjGC1vpDF3rnXpPRDk8WrUaKvy8b1wYJrFdvobwojIDhXDoUUM', '2022-06-08 15:11:27', '2022-06-10 09:47:23'),
(137, 'عبدالله', 'محمد', 'هادي', 'ال قريع', 'mm1234hhh@icloud.com', '0532176225', '1165491752', 11, 1, 'uploads/id_pics/137/KING SAUD 3.jpg', 'uploads/medical_report_pics/137/عبدالله .pdf', NULL, '$2y$10$7EqNAyXZvHltH2w7WDPDaOThCNDLkXUCPpcM0W0vUkQCxs.taeqzS', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-08 16:06:35', '2022-06-10 09:47:56'),
(139, 'حمد', 'احمد', 'حمد', 'ال زعرر', 'ahmed51334@gmail.com', '966561218858', '1156399238', 12, 1, 'uploads/id_pics/139/DCD241F5-D6EC-498F-8D00-6C6A81ECB249.jpeg', 'uploads/medical_report_pics/139/Ministry of Health.pdf', NULL, '$2y$10$gxwCjgku8L6RzeLHZQETneS1.cO4Tqq.KwW69XpUSxB9bt63umGta', 'مستفيد', 'تمت الموافقة', NULL, 'PnWt7wyNZftfiobJO2nK3zQ3l0US00v5KjUdNLfTz4UzMCJEGtWNXlNbuhlf', '2022-06-08 18:16:31', '2022-06-10 09:49:37'),
(140, 'ابراهيم', 'محمد', 'سعد', 'ال رشدان', 'yasmenh-2009@hotmail.com', '966538609670', '1088089386', 16, 1, 'uploads/id_pics/140/3509E753-3C9D-4565-942E-BBFB4FF9E20B.jpeg', 'uploads/medical_report_pics/140/FCEFD3A1-3CD5-41B5-884E-25395B0CA2E3.pdf', NULL, '$2y$10$nt617eUvkg69jLFF3L0ESuTb0ge23ffUkQQJsmHWpokV1fn1FsRD2', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-08 19:23:27', '2022-06-10 09:50:16'),
(142, 'سالم', 'أحمد', 'علي', 'ال فلكه', 'ameen_alfalakah@hotmail.com', '966557136283', '1145412100', 12, 1, 'uploads/id_pics/142/58B8A64C-693C-4D0F-B121-33DD977F2F5C.jpeg', 'uploads/medical_report_pics/142/تقرير سالم .pdf', NULL, '$2y$10$gfLCHRqI8/edE3zz3QfN4uKBO5ZjE62nCM7zdAa56n5iedWt/lq9e', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-08 23:18:43', '2022-06-10 09:51:38'),
(143, 'بيلسان', 'عبد الناصر', 'سعد', 'ال سراج', 'saad1513a@gmail.com', '966553590101', '1192026498', 8, 1, 'uploads/id_pics/143/16547004816726843669288225979138.jpg', 'uploads/medical_report_pics/143/٢٠١٩١٠١٦_١٣٤٨٠٨.jpg', NULL, '$2y$10$tZZagdqdG1iZvA/otIe31u0GwTUoSyAOFwC8c.xCOiM08/fo9IHLe', 'مستفيد', 'تمت الموافقة', NULL, 'ZHXN7nWPW3gzZxvFQXBQrsdExmMG60TsP9BTTeY4xm4LpbsDhtDJaZ71b8t7', '2022-06-09 01:02:34', '2022-06-10 09:53:56'),
(146, 'فاطمة', 'محمد', 'مهدي', 'الزبادين', 'memo11350@gmail.com', '533356092', '1190471944', 14, 1, 'uploads/id_pics/146/851659F9-09D7-4491-AE56-C00535286343.jpeg', 'uploads/medical_report_pics/146/Report.pdf', NULL, '$2y$10$j0nc.mwOulrPIjz1ZxuP..yKrTpuJcWYwM3k56/Py5v9j/c1hWMkG', 'مستفيد', 'تمت الموافقة', NULL, 'F46POJVUr3aLj6yHb16eNFGWGoULQZXj2I92Ap5u5ZCdrLOI89YQPMd9E4DF', '2022-06-09 02:38:59', '2022-06-10 09:59:36'),
(147, 'فارس', 'عوض', 'سعيد', 'الزهراني', 'zco208zz@gmail.com', '966507081038', '1192944815', 11, 1, 'uploads/id_pics/147/13D02FE4-4095-45A7-8991-4C681AEDFB6B.jpeg', 'uploads/medical_report_pics/147/Jun 8, 2022 Doc.pdf', NULL, '$2y$10$fqHsGFZsGY3jLSfWq11zAuC7HqFn.tgCvF0OH0ZKnEP4u.IBhbCrS', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-09 02:42:45', '2022-06-10 10:01:08'),
(149, 'سحاب', 'محمد', 'حسين', 'شعبي', 'mbarkymrhba@gmail.com', '966552216199', '1186001945', 12, 1, 'uploads/id_pics/149/16547119062204176461373040510761.jpg', 'uploads/medical_report_pics/149/16547119514268440985884714294494.jpg', NULL, '$2y$10$.YhL9336knS5HFhr94Pm/eCrWhMynnP9k3lTqXab994sweieKGDbW', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-09 04:16:58', '2022-06-10 10:02:42'),
(152, 'نجود', 'محمد', 'مسفر', 'ال عوض', 'Njood379@hotmail.com', '966553348379', '1089040388', 17, 1, 'uploads/id_pics/152/5E49F6E6-7C1D-41A6-98E3-C061F6DA8510.jpeg', 'uploads/medical_report_pics/152/الملاحظات.pdf', NULL, '$2y$10$xPBEJlqReZLQMzG3jFzbTOqIdeLv5BvqwI.stcv8xH1VE/gZUYY8W', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-09 07:51:42', '2022-06-10 10:07:29'),
(153, 'ليلى', 'محمد', 'مسفر', 'ال عوض', 'Looly379@hotmail.com', '966558047345', '1142318698', 15, 1, 'uploads/id_pics/153/CE9BFB75-8319-4E86-BBEC-27BC731059E8.jpeg', 'uploads/medical_report_pics/153/تقرير ليلى.pdf', NULL, '$2y$10$XX7DD2bwgxoDhIJBKX6Ah.2i2PNk.OSzmTTVZxI89TbbKCywM2bGy', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-09 08:04:26', '2022-06-10 10:10:06'),
(154, 'راكان', 'سالم', 'مسعود', 'ال رشدان', 'atttaakk1389@gmail.com', '966554987862', '1138858269', 16, 1, 'uploads/id_pics/154/C826EF58-83B1-481C-B3C7-D0B4C7C0F08D.jpeg', 'uploads/medical_report_pics/154/مستند PDF.pdf', NULL, '$2y$10$vqgYbZ.cIjRjuYwLtgBIl.FSqae4gXooTMPWsODCMrPMQUre5UFgC', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-09 16:37:41', '2022-06-10 10:10:48'),
(155, 'سلطان', 'بندر', 'فهيد', 'الحارثي', 'sool88566@gmail.com', '0508569171', '1152322853', 8, 1, 'uploads/id_pics/155/4D285455-B4FE-4B82-9EF1-F2F844EE5D4B.jpeg', 'uploads/medical_report_pics/155/Saved Photos.pdf', NULL, '$2y$10$HKVHmq9Qauf2q4AsLclwyu05L.5ejG/TUoKPQilUIGH2isi7NxRvC', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-09 17:22:18', '2022-06-10 10:12:10'),
(156, 'ترف', 'عوض', 'عبود', 'الوادعي', 'awwadabood@gmail.com', '966549955558', '1177946017', 12, 1, 'uploads/id_pics/156/Screenshot_20220608_161143.jpg', 'uploads/medical_report_pics/156/تقرير ترف.jpg', NULL, '$2y$10$CGOYL2xyXkiIGXq0TMhHUuN.mj82W8.EndwsHycLyJW3DgWcwM.8u', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-09 17:41:23', '2022-06-10 10:12:22'),
(157, 'العنود', 'حسين', 'منصر', 'ال صليع', 'hselea1@yahoo.com', '966503519683', '1114794546', 9, 1, 'uploads/id_pics/157/ALYAMI, ALANOOD HUSSAIN M.jpg', 'uploads/medical_report_pics/157/D52D6A66-5820-4587-8D65-8EE9DEB62105.pdf', NULL, '$2y$10$2v/i.n4S/C9i1bD50fZVg.aEA5ZVdVuWe8mMZZ7/Unc1.EX1Etz52', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-09 17:48:57', '2022-06-10 10:12:53'),
(159, 'مشاري', 'موسى', 'رجاءالله', 'الهذلي', 'Mosa140503@gmail.com', '966500082072', '1009957562', 8, 1, 'uploads/id_pics/159/image.jpg', 'uploads/medical_report_pics/159/CamScanner 11-22-2021 13.07.pdf', NULL, '$2y$10$4YGyrDCaSTnT4ljzb7UhMOuItHCvKjvzS.P1qG/GOe/J651krlzd2', 'مستفيد', 'تمت الموافقة', NULL, '2wnPebWNQmO0kVugQeyx3fKp4FaGYQCk3nWz6b7o4i2xVbES6UamOMsXia1l', '2022-06-09 19:54:43', '2022-06-10 10:13:49'),
(160, 'سعادة', 'بندر', 'فهيد', 'الحارثي', 'goog2030g@gmail.com', '0557761766', '1170148942', 8, 1, 'uploads/id_pics/160/4F2A0297-53C3-4D8F-920F-04EB9DD54E6A.jpeg', 'uploads/medical_report_pics/160/Saved Photos.pdf', NULL, '$2y$10$ScDDQDyqBuvwwL80G/0JluW1BGnOfkSr2/5zKfeWkyOqwcKfuGE4e', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-09 22:11:08', '2022-06-10 10:14:41');
INSERT INTO `beneficiaries` (`id`, `first_name`, `second_name`, `third_name`, `fourth_name`, `email`, `phone_number`, `record`, `disability_id`, `nationality_id`, `id_pic`, `medical_report_pic`, `email_verified_at`, `password`, `role_name`, `Status`, `api_token`, `remember_token`, `created_at`, `updated_at`) VALUES
(161, 'وسن', 'حسين', 'علي', 'ال سالم', 'gkvkckgkfk@gmail.com', '551072784', '1156760181', 1, 1, 'uploads/id_pics/161/IMG-20220325-WA0047.jpg', 'uploads/medical_report_pics/161/IMG-20220201-WA0015.jpg', NULL, '$2y$10$YACv5m77gHuBbqH/CXAAveX4lXNDn8WZ6GD3GUP5.oof3nFoFbYTC', 'مستفيد', 'تمت الموافقة', NULL, 'M5l4d7sg2QMt1JgtUPSKXbdLX3MOulRbZP2H8V2stN0dkO2qlDeXW43BZXtE', '2022-06-09 23:09:41', '2022-06-14 08:46:15'),
(163, 'علي', 'عبدالله', 'علي', 'ال قريع', 'dbhfsrf2000@icloud.com', '966554260062', '1166144830', 1, 1, 'uploads/id_pics/163/image.jpg', 'uploads/medical_report_pics/163/مستندات ممسوحة ضوئيًا.pdf', NULL, '$2y$10$3yFUmoh3M5sHmYXvn4WcSuP9zA7U00nG3ndLuRO.lQxRJwOcUdMwS', 'مستفيد', 'تمت الموافقة', NULL, 'H7IEd775pED9qv6nrDKx2dMNEVcJXBV5zHGlOmk0jCtgBuygvNuXPFFZ97dn', '2022-06-10 00:34:10', '2022-06-10 10:17:33'),
(164, 'وئام', 'منصور', 'صالح', 'النجراني', 'Faroho555@gmail.com', '0501309341', '1134245479', 9, 1, 'uploads/id_pics/164/IMG_20220609_183120.jpg', 'uploads/medical_report_pics/164/16547892504848506330814766483054.jpg', NULL, '$2y$10$8bWfzHqhK3qPqgzUzKAvJ.d9r4y1Ps.DXAxSmIbBvxoJMvKSt4UX.', 'مستفيد', 'تمت الموافقة', NULL, 'pmbJBzvWoL4clEBrk2moPkG2NRgL1EaR2mSqKSpM2lRSfTmYYA0NSJx4fKK9', '2022-06-10 01:41:27', '2022-06-10 10:18:03'),
(165, 'مها', 'محمد', 'مانع', 'ال زمانان', 'hajarajwan5@icloud.com', '966537088829', '1101288486', 9, 1, 'uploads/id_pics/165/image.jpg', 'uploads/medical_report_pics/165/تقرير مها.pdf', NULL, '$2y$10$ELihaKw6s9KV78xRXM4.mem8RwDyA0dgO7K5u3CjFhg/nQPo/4VH.', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-10 01:41:30', '2022-06-10 10:18:44'),
(166, 'هادي', 'سالم', 'هادي', 'الربيعي', 's0559351951@gmail.com', '0559351951', '1164210666', 11, 1, 'uploads/id_pics/166/C4C51798-721D-4629-9C2B-DA69EC4BA63B.jpeg', 'uploads/medical_report_pics/166/WebSite - www.khtwaat.com.pdf', NULL, '$2y$10$P5yOfIrZYQR1SXNboS0u7euNc665y2JUppiiIxqDwXF7idU7pJhTq', 'مستفيد', 'تمت الموافقة', NULL, 'CRtblAzbDLzeVMjI2MjKSS1YywepnUvwWHlE0PAwMd76Ax8TMJe1hugkkXJk', '2022-06-10 02:03:14', '2022-06-10 10:19:46'),
(167, 'حمد', 'علي', 'قينان', 'الصقور', 'sager.1405@hotmail.com', '966535007555', '1113608747', 1, 1, 'uploads/id_pics/167/بطاقة حمد .jpg', 'uploads/medical_report_pics/167/تقرير حمد.pdf', NULL, '$2y$10$Vd29PZCiStQKD296V2tFzO7Ux7EawSd1vsIjJSPK8AortVBYavJZa', 'مستفيد', 'تمت الموافقة', NULL, 'MK156p2YVHkzjxldaqMOvbLSGbrKKxxCgFYIRpW50vsX0N4fpTj5ymuo4NsX', '2022-06-10 02:36:16', '2022-06-10 10:28:33'),
(169, 'عبدالله', 'محمد', 'زميع', 'اليامي', 'gigfghhiu@gmail.com', '0501362403', '1016456111', 11, 1, 'uploads/id_pics/169/IMG_٢٠٢٢٠٦٠٩_٢١٣٤٣٠.jpg', 'uploads/medical_report_pics/169/IMG_٢٠٢٢٠٦٠٩_٢١٣٣٢٨.jpg', NULL, '$2y$10$BabyB.buBwKgsP4ywUASpeVx2nCZzg/jYy3Haf7gyPndHInBYYpRa', 'مستفيد', 'تمت الموافقة', NULL, 'zzc4og0n5dqoWEXQQ6mNbjsjuVgDCtQGlxy7dRxLhYsbteHcDCeNEw3F0NtP', '2022-06-10 04:33:19', '2022-06-14 02:46:54'),
(170, 'غصون', 'مرزوق', 'مسعود', 'آل ريحان', 'Maha5437@outlook.com', '966552071444', '1029050364', 13, 1, 'uploads/id_pics/170/16548004409032472205916911629652.jpg', 'uploads/medical_report_pics/170/تقرير غصون.jpg', NULL, '$2y$10$q7i8DJNwsEK4UeUraR4V/uq4upjofHcEqG7CBNyqNe9t7D6SGoYcG', 'مستفيد', 'تمت الموافقة', NULL, 'zQithXyTFemnxowK6WHxRrN39lyZedIIUI4wKp5UR1lBzSPzCSJiCtfWfyuj', '2022-06-10 04:50:55', '2022-06-12 00:39:47'),
(171, 'محمد', 'حسين', 'محمد', 'ال قفيلي', 'hus1428@gmail.com', '966508474443', '1155498239', 11, 1, 'uploads/id_pics/171/277AF2FE-C536-4913-9BBD-E43112DF51D8.jpeg', 'uploads/medical_report_pics/171/مستند جديد 2020-02-17 20.27.08.pdf', NULL, '$2y$10$0twVogooSVuT8VAy1imG0ezOr/xel4bo5G0ynTaV/GozWKP1uctKK', 'مستفيد', 'تمت الموافقة', NULL, 'jgBbcZeX3WGCmzueh2pgkQhzHpAnXp1kVHpAQBLzK9GxavIToLl5LoMyaoN6', '2022-06-10 04:57:11', '2022-06-10 10:29:07'),
(173, 'عبدالرحمن', 'مبارك', 'صالح', 'الهمامي', 'moh.gl888@gmail.com', '966557668981', '1118584406', 1, 1, 'uploads/id_pics/173/5D03D08C-FC74-4CF4-A893-0390F9310A92.jpeg', 'uploads/medical_report_pics/173/تقرير عبدالرحمن.pdf', NULL, '$2y$10$uG46UiGb73bAvoVYadnbEuYXL3ia/lAZ.6D99RRzp9Gt4KW/hIgdK', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-10 05:44:59', '2022-06-10 10:29:51'),
(175, 'عفراء', 'حمد', 'هادي', 'ال معجبة', 'Polnm45@icloud.com', '966504117802', '1120516180', 16, 1, 'uploads/id_pics/175/image.jpg', 'uploads/medical_report_pics/175/74c6512b-e8e8-4cb0-9f2c-0bcdc88a23e7.pdf', NULL, '$2y$10$reKeidDQsegASWXRrETFeejuvqtGI.7o/IjCTr4uD3v.NIMOKOj0u', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-10 07:31:03', '2022-06-10 10:31:36'),
(176, 'محمد', 'حمد', 'علي', 'ال سليمان', 'moon95516@gmail.com', '966506795516', '1184195525', 13, 1, 'uploads/id_pics/176/FA1796C4-0CBC-4B5D-800D-E7804668BB42.jpeg', 'uploads/medical_report_pics/176/httpswww.nu.edu.saarmashedp_p_id=Emashed_EmashedPortlet_INSTANCE_zJVGaTnAm5hz&p_p_lifecycle=2&p_p_state=normal&p_p_mode=vi.pdf', NULL, '$2y$10$/Ao2OLZyjTVbCEhkI3TC8ureUal1VMuKHKQEExhVwyV3aECpCHmGq', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-10 07:34:29', '2022-06-10 10:32:56'),
(177, 'سارة', 'حسن', 'حسين', 'ال بحري', 'Jemmy706@icloud.com', '966530263229', '1149889246', 12, 1, 'uploads/id_pics/177/3257E203-8961-4904-AB65-C23CE230DB64.jpeg', 'uploads/medical_report_pics/177/2021621.pdf', NULL, '$2y$10$hb2lwuMi5CBJleNDf0kdTeYAxuyadVwutJ.Gv2Rj544sO/Fi.1xi6', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-10 09:46:50', '2022-06-10 10:33:31'),
(179, 'مهدي', 'عايض', 'مهدي', 'ال مطلق', 'Ci_78@icloud.com', '551766819', '1172776625', 1, 1, 'uploads/id_pics/179/1B58C132-FB98-4A1D-BD33-D537ECE08253.jpeg', 'uploads/medical_report_pics/179/عرض الصور الحديثة.png', NULL, '$2y$10$lDuq4qWEWSr28/eSHlKFN.i/q.ousg4JZ1biwz7XoKbnvEmTwngIm', 'مستفيد', 'تمت الموافقة', NULL, 'RkfXMPoWqtPp692QQ9HvwrsIWNvmk81Gvfv1azGPLaKPBnT9Wky7u8uXMOZf', '2022-06-10 20:38:15', '2022-06-13 00:55:00'),
(180, 'افراح', 'مسعود', 'عبدالله', 'ال سنان', 'mabrok.11@icloud.com', '966563993986', '1088965791', 6, 1, 'uploads/id_pics/180/4F24DF0B-3C22-4235-BA23-48DBC6034022.jpeg', 'uploads/medical_report_pics/180/36AD73B3-DB93-47F6-B656-33164AE13CC2.pdf', NULL, '$2y$10$MYPBtj2oE5EcPu2OWOmCoevo9QZY62PX4iHM7LOFCLJkegprKRhzq', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-10 23:42:27', '2022-06-13 00:55:32'),
(181, 'عبدالرحمن', 'مسعود', 'عبدالله', 'ال سنان', 'Abody9123449@gmail.com', '966509558130', '1142264728', 16, 1, 'uploads/id_pics/181/0C9D0D76-10DE-4AEC-9120-E80B6EBFA829.jpeg', 'uploads/medical_report_pics/181/BEC79ACA-2B28-4865-AD0A-1B4F82BF8B39.pdf', NULL, '$2y$10$vz2gfzdS3RLhmx9JJ6uMle6WfuinMbaJBNwY4wvMbDZQWn1nMAe1a', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-10 23:57:27', '2022-06-13 00:56:02'),
(182, 'نسرين', 'محمد', 'هادي', 'العجي', 'mooon1140@outlook.sa', '966557634986', '1043307238', 11, 1, 'uploads/id_pics/182/249F0201-9F66-4F44-AB7C-32E865F43159.jpeg', 'uploads/medical_report_pics/182/تقرير طبي .pdf', NULL, '$2y$10$lxBI./jZiLjg5bnrDDDNhe912iHqOdk4drCuMga9PWxIrAd/cVlMW', 'مستفيد', 'تمت الموافقة', NULL, 'lUEsvyM9TodTvG36PTO6OUmx7PpSyUPku9Cy0VpqKeT1Cdu0BcXqSzNcposa', '2022-06-11 00:25:51', '2022-06-13 00:57:17'),
(183, 'رفعه', 'سبلان', 'صالح', 'ال دويس', 'ppuuqq2001@gmail.com', '0551746167', '1134618089', 8, 1, 'uploads/id_pics/183/16548730895626453287013248064510.jpg', 'uploads/medical_report_pics/183/IMG-20220610-WA0265.jpg', NULL, '$2y$10$N6ahiIEMHstgzrjMMCoIFeNPpyU4aDv6ZN5ZyIV7ICuWVmjcwD3OS', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-11 01:01:28', '2022-06-13 01:01:04'),
(184, 'محمد', 'حسن', 'علي', 'ال قراد', 'yli185672@gmail.com', '0506355554', '1180522852', 9, 1, 'uploads/id_pics/184/IMG-20220610-WA0009.jpg', 'uploads/medical_report_pics/184/تقرير محمد قراد.jpeg', NULL, '$2y$10$noXSX1Wp637ImCrCUJyXGuYSsbFUJR3H2QdN.0KNUB8j1EqTNswXq', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-11 03:44:14', '2022-06-13 01:04:02'),
(185, 'عبدالله', 'علي', 'حسين', 'ال عسكر', 'Hasienah711@gmail.com', '966551806850', '1160470611', 1, 1, 'uploads/id_pics/185/9FE27C38-46FF-462E-8D9E-5353BD675ABA.jpeg', 'uploads/medical_report_pics/185/ملاحظة جديدة.pdf', NULL, '$2y$10$xCq8U9YANxDD3jM0lHlpdOrtVQ5e3LQibGuox/GQ/v7t4hVFutszm', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-11 06:01:53', '2022-06-13 01:04:29'),
(186, 'مرام', 'حسين', 'علي', 'ال ساري', 'm0566488182@gmail.com', '0566488182', '1199747336', 10, 1, 'uploads/id_pics/186/Screenshot_٢٠٢٢٠٦١١-٠٣٥٤٣٧_WhatsApp.jpg', 'uploads/medical_report_pics/186/Screenshot_٢٠٢٢٠٦١١-٠٣٥٣٢٣_WhatsApp.jpg', NULL, '$2y$10$m29ajCx1C52z8lh1myZwBeEGFz3v7ICihPpnL.xTuGJDzjGxN5uAG', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-11 10:56:12', '2022-06-13 01:05:51'),
(187, 'مريم', 'سعيد', 'محمد', 'ال جواد', 'aliaaa909064@gmail.com', '0550931127', '1137502579', 16, 1, 'uploads/id_pics/187/6C357003-1B35-484C-94FF-C10FBFBC52EA.jpeg', 'uploads/medical_report_pics/187/‏لقطة شاشة ٢٠٢٢-٠٦-١١ في ١.٢٠.٣٨ م.pdf', NULL, '$2y$10$J3qWofgGpaZk5CpmR.zdD.cxrs/O5WjSOvbEG3TjcfKopnY4cNWeO', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-11 20:37:18', '2022-06-13 01:06:24'),
(188, 'مانع', 'سيف', 'مانع', 'ال فايد', 'm117810411@gmail.com', '558201270', '1178107411', 13, 1, 'uploads/id_pics/188/04A04997-3201-416E-87AC-BBAB030BA64D.jpeg', 'uploads/medical_report_pics/188/IMG_5451.pdf', NULL, '$2y$10$txjVPW8/oktcPwE20h1MWecaxvFTccurnwZhXzWP0onQ5fGQdG05.', 'مستفيد', 'تمت الموافقة', NULL, 'GhPAKWKs3iXmMBiB5JYugWsawzy9LrpuQm1uKNzrfkskPXNr8gZIeApeyhb6', '2022-06-11 20:40:04', '2022-06-13 01:08:19'),
(190, 'علياء', 'عبدالله', 'سعيد', 'ال جعره', 'qwer4321@gmail.com', '966557859559', '1145288344', 13, 1, 'uploads/id_pics/190/٢٠٢١٠٦١٢_١٥٢٤٤١.jpg', 'uploads/medical_report_pics/190/IMG-20220611-WA0024.jpg', NULL, '$2y$10$sC/tmndJ4lYBzDIusjQKXefYs3CYTYW/wl7Y.r.SPqZ0wfqYJeriK', 'مستفيد', 'تمت الموافقة', NULL, 'jK8KlCGi4TaQgmDLwfZ9ZNMWNS3DEsKiIv69jWEnPw4yxxVtIDdknUfqbUa5', '2022-06-11 21:10:03', '2022-06-13 01:12:26'),
(191, 'هادي', 'محمد', 'هادي', 'العجمي', 'Swt_77@icloud.com', '966506880988', '1161728801', 10, 1, 'uploads/id_pics/191/كرت العايله.jpg', 'uploads/medical_report_pics/191/تقرير جديد.pdf', NULL, '$2y$10$U3LL4hY8M678RRyA20aF5eK3MnRX.nb8zctBlGxXoaFfmp3OgRM3S', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-11 21:56:38', '2022-06-13 01:13:02'),
(192, 'رحمه', 'سعيد', 'حاضر', 'اليامي', 'ss1999as@hotmail.com', '966551541118', '1170275331', 11, 1, 'uploads/id_pics/192/8C589F6D-D129-4910-B885-B1773C3634FD.jpeg', 'uploads/medical_report_pics/192/تقرير رحمه .pdf', NULL, '$2y$10$XyULx4pp.5CXNRPRuykbhuiSE1IgRHsD6V22klZNFD4lZxpurxctK', 'مستفيد', 'تمت الموافقة', NULL, 'NcoGSMmoOmwOSrP6pNVsyBDp3DvunnHjtRoIs5Txaql8W4B4JtrFu7XuMLUo', '2022-06-11 22:39:48', '2022-06-13 01:13:25'),
(193, 'تركي', 'عبدالله', 'علي', 'السليمان', 'sasa12am@icloud.com', '0532559844', '1188595431', 11, 1, 'uploads/id_pics/193/05586F91-8E5E-479F-8683-34814F1BB392.jpeg', 'uploads/medical_report_pics/193/00130931 mr 2.pdf', NULL, '$2y$10$r2J8lYE.CryWpWRMEeKsIOcf1ur8CmG8cWZGsIl.ZeOE2FzStLH6K', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-11 22:54:45', '2022-06-13 01:13:44'),
(194, 'جابر', 'محمد', 'قرمان', 'ال خريم', 'ila708@icloud.com', '557331856', '1023612854', 11, 1, 'uploads/id_pics/194/79E67F12-1FB4-4977-BB35-E878C2391481.jpeg', 'uploads/medical_report_pics/194/SAUDI ARABIA.pdf', NULL, '$2y$10$1gdataTcv00hrFgQcnoWleuHc9fJYseH2LO9zZHxM49enN4vGUwb2', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-11 23:02:17', '2022-06-13 01:14:12'),
(195, 'بدريه', 'مبارك', 'صالح', 'ال منصور', 'ali.1406@icloud.com', '0557309273', '1061239149', 16, 1, 'uploads/id_pics/195/image.jpg', 'uploads/medical_report_pics/195/مستندات ممسوحة ضوئيًا.pdf', NULL, '$2y$10$L9s6Zpm9qe2Ko.j2xxeupu0C48n6JPDHN1xdgr1XjPbcKebaHUN/O', 'مستفيد', 'تمت الموافقة', NULL, 'NZ9IliSand8fWtjJ9SiVyOeVDyhE2Ozmfwer3j0IHwKx3ZJbuuZUhcAkM87x', '2022-06-12 00:28:23', '2022-06-13 01:14:38'),
(196, 'اسرار', 'خيري', 'فرحان', 'ال خيري', 'hudaalyami524@gmail.com', '532406451', '1151024960', 2, 1, 'uploads/id_pics/196/اسرار  بطاقة.JPG', 'uploads/medical_report_pics/196/اسرار1.pdf', NULL, '$2y$10$rqG25jY9Ku69fhYlgQjd8eVk8iwO22O1Rv5Pfv6HRmqoCKrG43eDm', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-12 01:11:09', '2022-06-13 01:15:03'),
(197, 'حسن', 'سيف', 'عايض', 'القحطاني', 'heia75111@gmail.com', '966551572191', '1183930419', 12, 1, 'uploads/id_pics/197/577C5A6E-B8D1-411C-B5B5-C2D913CE30D3.png', 'uploads/medical_report_pics/197/‏واتساب.pdf', NULL, '$2y$10$haKvgk6ZPx9OTjUu.o.TSuDVhcqdrlDLG2DSj69TQdpkC.93TCS1W', 'مستفيد', 'تمت الموافقة', NULL, 'CJjRR63LRxPYNNTlTMQ8NHHPLHXzbBnaAWjRQjJ7vd02AA3ijmHZfvu29Khm', '2022-06-12 01:35:50', '2022-06-13 01:15:57'),
(200, 'نوره', 'علي', 'كلفوت', 'كلفوت', 'bada44665@gmail.com', '966552116675', '1048390247', 8, 1, 'uploads/id_pics/200/B6031FA8-C788-40BC-AC40-B418F8DBFB16.jpeg', 'uploads/medical_report_pics/200/Kingdom of Saudi Arabia.pdf.pdf', NULL, '$2y$10$JLR6s0.mTD7P3gtGaBXoZOWoOzrjldo5n/AAUcmx9yjy1EG9AGvzq', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-12 03:27:20', '2022-06-13 01:19:40'),
(201, 'نوره', 'صالح', 'عبدالله', 'الحارثي', 'moh-202011@hotmail.com', '0535799305', '1031144031', 16, 1, 'uploads/id_pics/201/9B941A5E-B6B8-4FF3-AF7D-50486AD9F62E.jpeg', 'uploads/medical_report_pics/201/مستند (١).pdf', NULL, '$2y$10$O2vzBgQ/fiTTv6P6ZyvewueZULIKwsO01qd8RkgBI5fNVVcGOcTE2', 'مستفيد', 'تمت الموافقة', NULL, 'cUFbGEF0eDFeb5gTPZVfRc1qcBZYFWY50ia2VJpQ142gh0dn1ImjzaOIQxVa', '2022-06-12 05:01:23', '2022-06-13 01:20:27'),
(202, 'روابي', 'مبارك', 'مهدي', 'ال سليمان', 'gsibhsus@gmail.com', '0509624228', '1096997463', 16, 1, 'uploads/id_pics/202/16549762455343537965033448595524.jpg', 'uploads/medical_report_pics/202/16549762724767013535365903194344.jpg', NULL, '$2y$10$UViB.ypvheUOA92W/2l2v.gOBPx5oMDRe2TOS6v2Pgao9vYvF2966', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-12 05:38:55', '2022-06-13 01:21:03'),
(204, 'اروى', 'محمد', 'حمد', 'ال مطيف', 'mnea966@gmail.com', '0531295153', '1101677449', 6, 1, 'uploads/id_pics/204/007A22D7-CD84-4453-9B87-B523D23396EA.jpeg', 'uploads/medical_report_pics/204/Doc Oct 06 2020.pdf', NULL, '$2y$10$Tw0sN9EJfitaI9mibq.HIuegnZFnmVIGdOXypEZf7PmVHi0GXOBMi', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-12 06:30:45', '2022-06-13 01:21:54'),
(205, 'فاطمه', 'محمد', 'حمد', 'ال مطيف', 'Ali_yam88@hotmail.com', '0550131218', '1133812345', 6, 1, 'uploads/id_pics/205/291E32A0-DCE8-4EDE-A74E-9B84EBB1D57D.jpeg', 'uploads/medical_report_pics/205/Doc Oct 25 2020.pdf', NULL, '$2y$10$iBRsdSYYNNDlXr7yOi2SXuo1VLV6Wj2bYE17HBtbwGLHjFJACrBmW', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-12 06:40:22', '2022-06-13 01:22:35'),
(206, 'خديجه', 'محمد', 'حمد', 'ال مطيف', 'a0531403131@gmail.com', '0500324152', '1141013258', 6, 1, 'uploads/id_pics/206/DA662187-8F27-44AE-8FA2-3CCAD43EEEAC.jpeg', 'uploads/medical_report_pics/206/Doc Oct 25 2020 2.pdf', NULL, '$2y$10$1wquDbLn3ynmHchb1kAtAuaHKJOS3V/2pnVc3PkP5xOsXF0UAcq2O', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-12 06:45:58', '2022-06-13 01:23:08'),
(207, 'حمد', 'محمد', 'حمد', 'ال مطيف', 'rhalmtyf@gmail.com', '0530737471', '1086092473', 6, 1, 'uploads/id_pics/207/9C5A3D92-AE7B-447E-9824-F5CF7438315A.jpeg', 'uploads/medical_report_pics/207/Doc Oct 06 2020 4.pdf', NULL, '$2y$10$SA5dJLfaDT3rN94.ksB0M.ZJa2vc6wg9Y9dwIuNPojS6PZyFQ8jje', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-12 06:50:29', '2022-06-13 01:23:53'),
(210, 'نوره', 'فهد', 'مسفوه', 'ال مسفوه', 'abujood201314@gmail.com', '966536405254', '1192122610', 13, 1, 'uploads/id_pics/210/WhatsApp Image 2022-06-12 at 2.00.12 AM.jpeg', 'uploads/medical_report_pics/210/norah date in hospital.pdf', NULL, '$2y$10$nUc9H9cw.wKGtU9epBXrTeicD2AJS0b9rQZErZCIdJXFW7W2HtPkS', 'مستفيد', 'تمت الموافقة', NULL, 'DhSC2rBOVKQEJ3s78YgEtA5ciGpLiobvjd3soWWzKv2O16HvTIqFFgyJksjK', '2022-06-12 09:27:59', '2022-06-13 01:25:04'),
(211, 'نور', 'عصام', 'علي', 'بن يحيى', 'noorbinyehia@gmail.com', '0566834992', '2500848425', 12, 33, 'uploads/id_pics/211/IMG-20220323-WA0011.jpg', 'uploads/medical_report_pics/211/تقرير.pdf', NULL, '$2y$10$aP1zA.Brp/hfaZGFFP1Eg.TqZh5WYJnmdp217p/vniGEHrdVSf2sa', 'مستفيد', 'تمت الموافقة', NULL, 'R94xyKwKnqv5bTDAc6BgmesCSlbMMEIpXnm5pD9kdf02ZKAJezj3HPyHmfWt', '2022-06-12 11:34:21', '2022-09-09 10:03:38'),
(212, 'نسيم', 'محمد', 'هادي', 'ال عباس', 'salem.79611@gmail.com', '966537919611', '1087771638', 9, 1, 'uploads/id_pics/212/514D3EBC-FAB3-4CB2-B7A1-91581F47DF76.jpeg', 'uploads/medical_report_pics/212/تقرير نسيم.pdf', NULL, '$2y$10$oNvvY7WFpQUuC7yI4muC1.oMt0L48IzG1zj6mkqaTIkRPK2/810fC', 'مستفيد', 'تمت الموافقة', NULL, 'LPYlleMQ0Odx3RHKp5EulQVawl2M6fRB9oBo5ubfk9mCflUjQTvDf71UyvoY', '2022-06-12 18:34:16', '2022-06-13 01:27:09'),
(214, 'حمده', 'محمد', 'مانع', 'آل سليم', 'hhmdh2186@gmail.com', '0502014455', '1031888926', 11, 1, 'uploads/id_pics/214/36A1C9B4-387D-43CF-A210-3C89676FA358.jpeg', 'uploads/medical_report_pics/214/صورة.pdf', NULL, '$2y$10$DOQjOt3QgOzptE82JW2b9OdtvIxX.bVWDVVXBUkouR6/W5iSwNdEu', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-12 21:20:29', '2022-06-13 01:29:52'),
(215, 'علي', 'خرصان', 'شايع', 'ال سالم', 'woak5@icloud.com', '0596666859', '1156243782', 8, 1, 'uploads/id_pics/215/46C60055-F1EA-4742-B4DB-D91AE0C20E84.jpeg', 'uploads/medical_report_pics/215/CamScanner 06-12-2022 14.51.pdf', NULL, '$2y$10$lEQXgOHVMiH/PxvFQ.JtV.Jb.fx8xf/RHFj6.TW5mbu6aJoK69s22', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-12 21:52:22', '2022-06-13 01:30:23'),
(216, 'يوسف', 'خرصان', 'شايع', 'ال سالم', '123yamking.com@gmail.com', '0530990631', '1179792633', 8, 1, 'uploads/id_pics/216/DA04BE27-E404-4183-8AEF-AC1C2F608DB9.jpeg', 'uploads/medical_report_pics/216/CamScanner 06-12-2022 14.55.pdf', NULL, '$2y$10$mMOqaSs.OiGPIkG0DxksX.46HZbGoUA1dhWzZELLvHxCisZZmT9oS', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-12 21:57:18', '2022-06-13 01:30:48'),
(218, 'فوزية', 'محمد', 'علي', 'ال قحيشي', 'fwf287100@gmail.com', '0503181172', '1031599143', 8, 1, 'uploads/id_pics/218/FA81408D-DFAB-4C02-BCFA-7BA44719AB31.jpeg', 'uploads/medical_report_pics/218/CamScanner 05-19-2022 03.08.pdf', NULL, '$2y$10$IHQJmicwmcFOhLk4OSPWs.adqXM5PPlAJoYwtvwH.JIvmuyyaksAq', 'مستفيد', 'تمت الموافقة', NULL, 'WxWmbAEFvkhrfiNMEBNTy09I92ij9InmnyvtHAz4Bav5E6S7yVPyVFP8Tb7I', '2022-06-13 00:07:09', '2022-06-13 01:32:06'),
(219, 'أثير', 'مبارك', 'مرزوق', 'الصقور', 'sofi124525@gmail.com', '966557569919', '1127017042', 16, 1, 'uploads/id_pics/219/16550464573705131607055256201082.jpg', 'uploads/medical_report_pics/219/CamScanner 06-12-2022 17.50.pdf', NULL, '$2y$10$oqP2RfT.2fumP7/hAbDtaeyaaC5RKfeprpwMXU1h8kCodDO5g0w7q', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-13 01:08:14', '2022-06-13 01:32:28'),
(220, 'عبد الله', 'عبد العزيز', 'صالح', 'البعداني', 'omaodalh70@gmail.com', '0536480623', '2221341155', 16, 33, 'uploads/id_pics/220/IMG-20220612-WA0035.jpg', 'uploads/medical_report_pics/220/التقارير الطبيه.pdf.PDF', NULL, '$2y$10$26VoBHv9E/.yEvKZUvtXKeE4PJ.4u8uUeNXu81NgvKI2bN8UdhzPC', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-13 01:10:45', '2022-06-13 01:32:49'),
(221, 'ناصر', 'علي', 'مانع', 'القشانين', 'aligsfmo@gmail.com', '966506820470', '1150919411', 6, 1, 'uploads/id_pics/221/هوية ناصر.jpg', 'uploads/medical_report_pics/221/تقرير ناصر.pdf', NULL, '$2y$10$aNpT7sDHpNPPROUsR46zCewG6TyY7cquDv3oeSno1NNSD/akz6Pkm', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-13 01:11:46', '2022-06-13 01:33:24'),
(222, 'ثراء', 'مبارك', 'مرزوق', 'ال بختان', 'sm.am663@gmail.com', '966501385755', '1127017216', 16, 1, 'uploads/id_pics/222/16550467808641829484716953370570.jpg', 'uploads/medical_report_pics/222/CamScanner 06-12-2022 17.53.pdf', NULL, '$2y$10$A6pxn9wHtRTa2B4M8K.JSe4Sm9KE1ERM.UqRSrqIKhxph73DtdBSu', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-13 01:14:53', '2022-06-13 01:34:01'),
(224, 'ريم', 'على', 'مانع', 'اليامي', 'nooor0017@hotmail.com', '0551040889', '1123963785', 9, 1, 'uploads/id_pics/224/9E539B4B-7966-4AE0-B194-28C1F74624E4.jpeg', 'uploads/medical_report_pics/224/ملف تقرير الحاله .pdf', NULL, '$2y$10$h8OhOx2K1z7zRk8akcqNKem9.1HnBq.sKbg/J8/NjOK1VN4MbfPcW', 'مستفيد', 'تمت الموافقة', NULL, '62Axjle4dhTUavM5s7V9KBsnUmBG8rOs5yyCV04SBTPH3aP6ENgLlcB23NNc', '2022-06-13 02:28:36', '2022-06-14 05:31:40'),
(225, 'طيف', 'سعيد', 'صالح', 'الشرمان', 'zx20202a@icloud.com', '966553725694', '1198063446', 1, 1, 'uploads/id_pics/225/E1460680-0635-4F58-A7A7-F21CA6FB77FC.jpeg', 'uploads/medical_report_pics/225/Form 12 Jun 2022.pdf', NULL, '$2y$10$OSpmnBcJvLxp.CcKJqOUf.9nW4dqMgdMpKuhhmlZA21srv8gnm39u', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-13 03:22:56', '2022-06-14 02:42:56'),
(226, 'زهور', 'علي', 'قاسم', 'البكري', 'zagb6460@gmail.com', '0533206460', '1029228572', 8, 1, 'uploads/id_pics/226/0822508D-F227-4349-9CB6-729138E796FB.jpeg', 'uploads/medical_report_pics/226/King Saud University (034).pdf', NULL, '$2y$10$ah/evhSAYwlwFejXPHm8H.5UlhXITQsi4Q.ae/oAjIGvuwlD4CLWa', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-13 03:54:22', '2022-06-14 02:42:27'),
(227, 'حمد', 'احمد', 'محمد', 'ال مساوى', 'mshalahmed@hotmail.com', '966530894457', '1138482821', 11, 1, 'uploads/id_pics/227/صورة PNG 2.png', 'uploads/medical_report_pics/227/تقرير حمد ٢٢.pdf', NULL, '$2y$10$.GYRB1qGeHiSrh0lXQIX1OZcxvt0pjAFoRCNLsNvdigtLyXzMumLi', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-13 04:03:52', '2022-06-14 02:44:11'),
(228, 'صالح', 'حسين', 'محمد', 'اليامي', 'salih.11@icloud.com', '501071330', '1197095076', 1, 1, 'uploads/id_pics/228/FBF2725B-3F51-4F09-927C-F2428D78D04B.jpeg', 'uploads/medical_report_pics/228/تقرير صالح اليامي.png', NULL, '$2y$10$xfX2D50T.dO7.Gx8AHZEUOmAk8kZbskYIUINcgjD6Pe7HM03qKeeu', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-13 04:05:18', '2022-06-14 02:42:01'),
(229, 'سحر', 'احمد', 'محمد', 'ال مساوى', 'm.5i@outlook.com', '966536206332', '1075760676', 11, 1, 'uploads/id_pics/229/هوية ١.png', 'uploads/medical_report_pics/229/تقرير ٢ .pdf', NULL, '$2y$10$j1Nn1co9eNxV3CIKu5AOdOlOV/1Ip5PvF1HJPeIYw0GsmvFGs3rKy', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-13 04:07:18', '2022-06-14 02:40:14'),
(230, 'بشرى', 'عبدالله', 'يحي', 'ال شيبان', 'shrqhb6@gmail.com', '966532642930', '1191973682', 14, 1, 'uploads/id_pics/230/image.jpg', 'uploads/medical_report_pics/230/135646 Bushra. edit - signed.pdf', NULL, '$2y$10$pi0/pxTTLvimaxPrUrojL.e/x0YEvilMJE675Ap9H9wew/mo4wtDS', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-13 04:13:35', '2022-06-14 02:39:50'),
(231, 'مريم', 'محمد', 'علي', 'بالحارث', 'rmh76543@gmail.com', '966505583707', '1110775341', 6, 1, 'uploads/id_pics/231/٢٠٢٢٠٦١٢_٢١٤٨٢٣.jpg', 'uploads/medical_report_pics/231/٢٠٢٢٠٦١٢_٢١٤٩٣١.jpg', NULL, '$2y$10$dPyLQedAhZu2vb6VIiUlWeB0MX5wN.UlSFU8AiNACUI64o66/l4U6', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-13 04:51:17', '2022-06-14 02:39:21'),
(233, 'ساره', 'عبدالله', 'علي', 'القشانين', 'abdullahali5456@gmail.com', '0500412866', '1184497152', 9, 1, 'uploads/id_pics/233/6C2C99BE-D417-4B38-8941-11CA1D0CC05B.jpeg', 'uploads/medical_report_pics/233/ساره بنت سامية.pdf', NULL, '$2y$10$efkQedaLU9UAaj.7m6oOWeOUhvQMPvq03HiVfBVxQqlJK2fkzjphu', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-13 05:13:47', '2022-06-14 02:38:21'),
(234, 'راكان', 'أحمد', 'صالح', 'ال زبر', 'ahmadsaleh27f@gmail.com', '966536000995', '1158864767', 16, 1, 'uploads/id_pics/234/مرفق دعوة_0001.jpg', 'uploads/medical_report_pics/234/تقرير راكان.pdf', NULL, '$2y$10$UiJQXTp8h.Lwrrs7/n.EXe5LN.enLknA9qg07y79wHhqQJXssDoH6', 'مستفيد', 'تمت الموافقة', NULL, 'Fa5ke2a1dEPF0a1xAjakiK591kkv43V7rAoRBbSTXPSB8nDfGj4Cy1jyLxa0', '2022-06-13 05:16:10', '2022-06-14 02:37:59'),
(236, 'محمد', 'علي', 'احمد', 'البكري', 'alii022022@gmail.com', '0559278972', '1195048119', 14, 1, 'uploads/id_pics/236/b3448654-b9d8-47ff-ac38-8b0688aec91f.jpg', 'uploads/medical_report_pics/236/مستند (٢).pdf', NULL, '$2y$10$EauHEYQSBBizGHT9KrPoseMgE.EAyb/1QySc6yVW3BcUc84tAeWFi', 'مستفيد', 'تمت الموافقة', NULL, 'b8UOIROPhbAU40RPmjwekk5yq2LsGwKfnO9ae9t7TQPXNUjgjaO48wqM4w2M', '2022-06-13 06:32:34', '2022-06-14 02:37:11'),
(237, 'طيف', 'مبارك', 'محمد', 'ال شهي', 'asdaa5768@icloud.com', '0557978437', '1125982130', 11, 1, 'uploads/id_pics/237/507509b0-49d5-4796-a658-01cc23ab1a14.JPG', 'uploads/medical_report_pics/237/صورة 2 (PDF).pdf', NULL, '$2y$10$yBk4cxCQF7T.W2WOIY2xMe7ztqU0buZI4VzmqVZuNOY.e3y3liNgS', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-13 07:04:31', '2022-06-14 02:36:52'),
(238, 'ناصر', 'سعيد', 'محمد', 'ال سليم', 's.s.s.ncc4@hotmail.com', '966552355696', '1179498017', 1, 1, 'uploads/id_pics/238/1BF5EE88-51AB-4BFF-B0F7-FF847C95B694.jpeg', 'uploads/medical_report_pics/238/httpspatientcare.ngha.med.saresourcesItextMedicalReportROI181487281970901219330704256543.pdf.pdf', NULL, '$2y$10$YJAvcI9PYYDx8O806kmzUu4931NDOmv09t8.VHij6rHhxEC7btmza', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-13 08:04:01', '2022-06-14 02:36:22'),
(241, 'صالح', 'عقيل', 'محمد', 'اليامي', 'alyaa7117@gmail.com', '966558552205', '1187388903', 1, 1, 'uploads/id_pics/241/WhatsApp Image 2022-06-13 at 1.58.47 PM.jpeg', 'uploads/medical_report_pics/241/تقرير  صالح.pdf', NULL, '$2y$10$ONKIowgvBy75A/1HyZ8aV.zXaF2TxuQsRiMEz9VYRGvIEHOftu2WS', 'مستفيد', 'تمت الموافقة', NULL, 'YRSkOqM9uB9MymAYT7lDYx3byXa6i7kBqDc7JKyIo2M14rFpf5jdhDeixSHW', '2022-06-13 20:59:23', '2022-06-14 02:34:19'),
(242, 'علي', 'محمد', 'عقيل', 'اليامي', 'meen-gadi@hotmail.com', '966558552204', '1187388978', 1, 1, 'uploads/id_pics/242/WhatsApp Image 2022-06-13 at 1.58.47 PM.jpeg', 'uploads/medical_report_pics/242/تقرير علي عربي.pdf', NULL, '$2y$10$I/2zuxqGvhnabChXiAmvc.ftG/4xqKP/O/YnA7/vLQ1XSaDE1Lf1G', 'مستفيد', 'تمت الموافقة', NULL, 'ExTN9YhURtMdeFQ7ln15jql2ddkMUV8lytN59AgwZChY5LjKUk9F6I3PK9hJ', '2022-06-13 21:02:17', '2022-06-14 02:33:52'),
(243, 'فراس', 'مصطفى', 'سيف', 'الدعيس', 'omsaif821@gmail.com', '966556014517', '2450858242', 13, 33, 'uploads/id_pics/243/16551205144772070039230903274052.jpg', 'uploads/medical_report_pics/243/فراس بن مصطفى الدعيس.odt', NULL, '$2y$10$3U6.HW7EF0UWVlcwizZYzeEbJUYUjuAMrGcLA.Nkb4XPHYoiqZQv.', 'مستفيد', 'تمت الموافقة', NULL, 'N3gnfE5Dik8HeCHWuFphXEJlAtBofc48L0x7wJTzFRox7ZFkOa9Ci5zEtBUL', '2022-06-13 21:44:52', '2022-06-14 02:33:36'),
(244, 'ايلان', 'محسن', 'صالح', 'ال مخلص', 'n6560950@gmail.com', '505559161', '1148930454', 12, 1, 'uploads/id_pics/244/0BAA846B-8794-4A19-A4F6-313789D5E6EB.png', 'uploads/medical_report_pics/244/IMG_0305.pdf', NULL, '$2y$10$eiGNhnJ52mljZY/Q8UHz4O6yKPzQkphXPGgr1T6ifdXwwhwMUo.s2', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-13 23:52:34', '2022-06-14 02:32:48'),
(245, 'دعد', 'مانع', 'راشد', 'ال منجم', 'daad.oman@icloud.com', '966543663756', '1096579774', 8, 1, 'uploads/id_pics/245/C3616268-F3ED-498A-BD45-DF9E3B4BAEC6.jpeg', 'uploads/medical_report_pics/245/1022996738-20210811153536.pdf', NULL, '$2y$10$0jZbg0BRyOsq8G0tVI5BJeGFE0JD3KdMmmYPcKOj.aFgtODHaWGta', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-14 03:05:45', '2022-06-14 03:44:24'),
(247, 'عفراء', 'حمد', 'هادي', 'ال معجبة', 'Polnm45@lcloud.com', '0555732789', '1120516180', 6, 1, 'uploads/id_pics/247/16551405304288544763553463573464.jpg', 'uploads/medical_report_pics/247/IMG-20220613-WA0006.jpg', NULL, '$2y$10$lFIGbHeZuZ2073f3DwdQtuu/Rf9m6qvCg4mE.oRAurr1LUS.VN6K.', 'مستفيد', 'تمت الموافقة', NULL, 'I1sZxZv26pGZqjGNTvYjmpmIdxuoC00VKtSr2cYgyloSbrTVSZwikUrm5vsA', '2022-06-14 03:19:31', '2022-06-14 03:43:57'),
(248, 'مهدي', 'يحيى', 'صالح', 'ال سارحه', 'Gllllases@gmail.com', '0508240774', '1161082571', 9, 1, 'uploads/id_pics/248/E32E2E18-9323-45D8-893D-7148D09E78C7.jpeg', 'uploads/medical_report_pics/248/Maternity & Children\'s Hospital-Najran.pdf', NULL, '$2y$10$mbzWZk2Qjsg9AFSlIo1fzOqLF3rfV4rZcf2gFLAVW0RmL7W7P2mGO', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-14 03:25:21', '2022-06-14 03:43:20'),
(249, 'علي', 'ريشان', 'صالح', 'ال ريشان', 'rishanrs@yahoo.com', '966505864405', '1185517321', 13, 1, 'uploads/id_pics/249/كرت العائلة وجهين ريشان.jpeg', 'uploads/medical_report_pics/249/تقرير علي.pdf', NULL, '$2y$10$HQ5k67enlLq7rTumO34CEudZPEJ18YOANNyPLe/n7kw28eMDfd3Xa', 'مستفيد', 'تمت الموافقة', NULL, 'JGUxIWMtCMiKpsPsIPZBpufa4eAbw1Uevmqryezc7qXVXpbsA8FvgnJ1BPUp', '2022-06-14 03:25:40', '2022-06-14 03:43:38'),
(250, 'علي', 'عبدالله', 'سعيد', 'ال جعره', 'popular@gmail.com', '536690618', '1150675880', 12, 1, 'uploads/id_pics/250/٢٠٢٠٠٩٠٦_١٣٣٥٥٥.jpg', 'uploads/medical_report_pics/250/IMG-20220612-WA0123.jpg', NULL, '$2y$10$c5hFMlehmAhtc6dXAxlOhuqBEsz/perFlzGUaWl4yXD0BFthMdl1u', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-14 03:54:55', '2022-06-21 16:12:34'),
(252, 'رنيم', 'عبدالعزيز', 'ناصر', 'البعسي العولقي', 'azzez7788@gmail.com', '966503196399', '2297978286', 13, 33, 'uploads/id_pics/252/16551449223555856140910072075372.jpg', 'uploads/medical_report_pics/252/CamScanner ٠٦-١٣-٢٠٢٢ ٢١.٢٣.jpg', NULL, '$2y$10$f97bIzIE7F3GoSOJOE5I7..E1v.mU5mdXLh6cw0fpUETqrld2Fye.', 'مستفيد', 'تمت الموافقة', NULL, 'FoI5MvOvNnwb6OYZWcj3hOOX191ysZNCzCesLR2YyJkHiTtiEhvNlZNeTahY', '2022-06-14 04:29:40', '2022-06-21 18:05:59'),
(253, 'فارس', 'حسن', 'عوض', 'الهمامي', 'dhahnhalhmamy18@gmail.com', '0551648716', '1137653166', 12, 1, 'uploads/id_pics/253/IMG_20220612_132807_967.jpg', 'uploads/medical_report_pics/253/IMG_20220612_132559_744.jpg', NULL, '$2y$10$.Ay90Kbsm2lJIuzvqOdUwOQOO0j69rgJJhaUW6PHKH//DbRLCFcsK', 'مستفيد', 'تمت الموافقة', NULL, 'B5KdsKqeqyeQt3fVWuadU78E2iDELZvHnjq7QdulgdTiI18BEMEmSZzFgUfI', '2022-06-14 04:39:35', '2022-06-21 18:04:58'),
(254, 'يوسف', 'مطلق', 'علي', 'ال قمري', 'y.y911@hotmail.com', '538786404', '1084972148', 11, 1, 'uploads/id_pics/254/09A4884E-A9F3-4B61-BF5D-BF478FCB7081.png', 'uploads/medical_report_pics/254/covertedPDF.pdf', NULL, '$2y$10$3ufBWt4VIRQk/.moj.CbkuOXMLqVn4E0Xhd9vTWaFI8bzGZ2KFU9m', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-14 05:21:46', '2022-06-21 18:04:18'),
(255, 'فطوم', 'عبدالله', 'علي', 'القشانين', 'khatmhalqshanyn693@gmail.com', '0549891367', '1182649564', 1, 1, 'uploads/id_pics/255/16551495921008173402653704647490.jpg', 'uploads/medical_report_pics/255/Screenshot_٢٠٢٢٠٦١٣-٢٢٤٩٠٠_WhatsApp.jpg', NULL, '$2y$10$dueC8/uMhPu6iXbFIFZJfOaJFFe8DGjs4T70sRYqbSvwVbypJst6q', 'مستفيد', 'تمت الموافقة', NULL, 'nP54ojqGEQUmD0psMclQg9rh3z6t2PxZ13DHFKMjP2gcwwrEso3H1lBM3vlD', '2022-06-14 05:49:46', '2022-09-03 16:28:56'),
(258, 'ريناد', 'هادي', 'بخيت', 'ال فرج', 'gguu775599@gmail.com', '530384117', '1132916410', 16, 1, 'uploads/id_pics/258/IMG_٢٠٢٢٠٦١٣_١٧٠٨٥٧.jpg', 'uploads/medical_report_pics/258/Screenshot_٢٠٢٢٠٦١٤_٠٩٥٠٤٢.jpg', NULL, '$2y$10$03tBywHvEUCKRNz8kiCul.jqfHjjvpO2o4NuLBSoOTzXSVVE1o/xW', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-14 17:03:27', '2022-08-15 18:14:47'),
(261, 'محمد', 'احمد', 'محمد', 'النهاري', 'alnhreyhaifa@gmail.com', '966533412843', '2319711087', 9, 33, 'uploads/id_pics/261/F53E674F-5CFC-4AAF-9DDD-8B0F12A7558A.jpeg', 'uploads/medical_report_pics/261/CamScanner ٠٦-١١-٢٠٢٢ ١٧.١٣.pdf', NULL, '$2y$10$hLAQ154SeB14mL/9PkAGbOnZdcxjITOtX8/VCrWCl6dImar4ACvaO', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-14 21:07:23', '2022-06-21 17:53:49'),
(262, 'فهد', 'مبارك', 'حسين', 'اليامي', 'ryhbgdhj@gmail.com', '966559892308', '1192372116', 13, 1, 'uploads/id_pics/262/كرت العائلة فهد مبارك آل مهري.jpg', 'uploads/medical_report_pics/262/تقرير طبي جديد  فهد مبارك آل مهري.pdf', NULL, '$2y$10$x.Tora9m5.3Aek2avee2L./NQCzjF0CBb6gPE4P89IlVtiz3/ukJK', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-14 23:50:42', '2022-06-21 17:53:20'),
(263, 'عبدالله', 'محمد', 'مشعل', 'ال مشعل', 'Fahd1410fahdd@gmail.com', '558631410', '2357353024', 9, 33, 'uploads/id_pics/263/24c4f05b-b192-4019-a6b0-36cc14f63093.JPG', 'uploads/medical_report_pics/263/بلا عنوان 3.pdf', NULL, '$2y$10$fMuQLOfNmilvr41WSIB3z.lP.B3NcYJOvh5QdZZR3vTELmSJ3/xbu', 'مستفيد', 'تمت الموافقة', NULL, 'LTlsD1zbPbPGo2EQVaUL5KjKIx0RChC0jQjh9yLWVga8o5avPjqcoSD1k00h', '2022-06-15 02:47:58', '2022-06-21 17:52:46'),
(264, 'فاطمه', 'عبدالله', 'صالح', 'الحارث', 'faxl-4567@hotmail.com', '509363848', '1179313174', 14, 1, 'uploads/id_pics/264/688D2F5A-E9DA-41C2-BAD0-EA7CF9F8E4B3.jpeg', 'uploads/medical_report_pics/264/بلا عنوان 5.pdf', NULL, '$2y$10$NqC0TNOgOA65zv5qSwtCD./LxgHa.mbcN7BM2AVD.Xgp4Ki.hnFNO', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-15 04:02:04', '2022-06-21 17:52:18'),
(265, 'أمجد', 'غمدان', 'بدر', 'فارع', 'Maryoumah69@gmail.com', '0535434804', '0971567200', 12, 33, 'uploads/id_pics/265/WhatsApp Image 2022-06-15 at 10.21.46 AM (2).jpeg', 'uploads/medical_report_pics/265/WhatsApp Image 2022-06-15 at 10.26.47 AM (1).pdf', NULL, '$2y$10$6WBMEcjL1t2QwKSvj63YtesMm0X9KqvTDRdDscHJIvl2TCMB6JN..', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-15 17:53:40', '2022-06-21 17:51:37'),
(266, 'حسين', 'مشعل', 'محمد', 'الشريف', 'Hana.al_sharref@hotmail.com', '0556663547', '1172952143', 13, 1, 'uploads/id_pics/266/4B9F4D79-4EC0-4508-B318-769FDBCA2C05.jpeg', 'uploads/medical_report_pics/266/2 yowl Any 2 ASiat.pdf', NULL, '$2y$10$CHnnhvZ48ig1HuCpW4hyRe3irxOVzGrg71WadjRLjqiBgZ4VswBjO', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-15 19:11:01', '2022-06-21 17:50:48'),
(267, 'عبدالله', 'محمد', 'سعد', 'ال رشدان', 'bm471544@gmail.com', '966500808527', '1075835254', 16, 1, 'uploads/id_pics/267/117A5C64-876F-4748-8B9D-BA58800E5524.png', 'uploads/medical_report_pics/267/111111.pdf', NULL, '$2y$10$fvV0evJoAqnB0aeoWn.6UeP6pDacuvdz.eJgsEJM/z9lkJ.WJUdJa', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-15 21:28:31', '2022-07-02 22:38:40'),
(269, 'عبدالعزيز', 'سعيد', 'هادي', 'آل سعيد', 'xcxc216@gmail.com', '966552428826', '1191191160', 11, 1, 'uploads/id_pics/269/ABB63C14-6659-46DB-8BB0-72D95264BF33.jpeg', 'uploads/medical_report_pics/269/عزوز.pdf', NULL, '$2y$10$w9y7r337mCwrf3a9UlP42O..wcA5.Y2p9eEWe3sfQBObLbXtkI4DS', 'مستفيد', 'تمت الموافقة', NULL, '7KqJGBnyMclx6qSov3k76hyR3TR3HIbKNdGU6fQP5Izo0u9iMESyYYQRshaO', '2022-06-16 07:13:15', '2022-06-21 17:47:20'),
(270, 'احمد', 'عبدالله', 'سعيد', 'ال جعره', 'mnbv231@gmail.com', '966507916153', '1140541572', 12, 1, 'uploads/id_pics/270/IMG-20220616-WA0002.jpg', 'uploads/medical_report_pics/270/IMG-20220616-WA0001.jpg', NULL, '$2y$10$pMjs07zRicz932.vj/xvjuK.pfWMitluuTyz2pZx9MODycc8/FrDO', 'مستفيد', 'تمت الموافقة', NULL, 'N6Nwx2JfFrAUD8KA5CT7AFcWz8Cfc8UGnG2qJwhGglf1pjaTkzujgoSQgxDR', '2022-06-16 07:43:40', '2022-08-31 06:31:39'),
(271, 'عبير', 'علي', 'محمد', 'ال مطارد', 'aa0559398066@icloud.com', '966559398066', '1171810136', 6, 1, 'uploads/id_pics/271/7900AF4D-5267-49F5-B4B2-93030A0CC234.jpeg', 'uploads/medical_report_pics/271/تقرير عبير ال مطارد.pdf', NULL, '$2y$10$PHm9pgjXIQqdNdWULOwpQezp4PKJ.rwvXv4WXxlaGibTZWHQiHCvq', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-16 20:55:06', '2022-06-21 17:45:46'),
(272, 'يحي', 'علي', 'محمد', 'ال مطارد', 'mady5b@icloud.com', '966509398066', '1185448048', 16, 1, 'uploads/id_pics/272/CC8E128D-49FE-4EC9-BD07-04EBD9911250.jpeg', 'uploads/medical_report_pics/272/تقرير يحيى مطارد.pdf', NULL, '$2y$10$Rsgd1rB3T4aUzpoS0/RQ5eS6tfW/TULiZqudSRgsyW6jiNcdGIS8.', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-16 22:37:40', '2022-06-21 17:44:40'),
(273, 'سفره', 'عايض', 'علي', 'الحارثي', 'liop109@hotmail.com', '535799305', '1021250251', 16, 1, 'uploads/id_pics/273/1C3437A1-032C-425E-8CB0-BD474DC0CD8A.jpeg', 'uploads/medical_report_pics/273/بلا عنوان 6.pdf', NULL, '$2y$10$.KXnpi7fnj/qrdRdcG84tu8u/9qFqmMbDryxitIUp9aAJxnowW9ay', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-18 04:15:16', '2022-06-21 17:38:18'),
(274, 'غزيل', 'صالح', 'عبدالله', 'الحارثي', 'huiop098@hotmail.com', '0509363848', '1021250285', 16, 1, 'uploads/id_pics/274/686FC5A2-1C12-4219-A066-841A1273DA72.jpeg', 'uploads/medical_report_pics/274/بلا عنوان 7.pdf', NULL, '$2y$10$t.ikXSW1MVO7Nd.gnNQH..FVvzd1ZfyaECEcD2Ip5f8O8OCtgBey.', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-18 04:21:34', '2022-06-21 17:38:54'),
(275, 'فاطمه', 'صالح', 'عبدالله', 'الحارثي', 'yuita@hotmail.com', '0532339627', '1021250293', 16, 1, 'uploads/id_pics/275/15890939-4437-4A89-A617-06700F6DD359.jpeg', 'uploads/medical_report_pics/275/بلا عنوان 8.pdf', NULL, '$2y$10$1cEu54/Ih/6BN3lST4frAuEMVFTMQU3d5izZha34.SriAmU7ZN8Ue', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-18 04:28:13', '2022-06-21 17:43:16'),
(276, 'صالحه', 'صالح', 'عبدالله', 'الحارثي', 'yfdg135@hotmail.com', '0530134686', '1021250327', 16, 1, 'uploads/id_pics/276/F8C54312-1FD9-4E4C-8714-54E1F1362CB1.jpeg', 'uploads/medical_report_pics/276/بلا عنوان 9.pdf', NULL, '$2y$10$tJ4ZXJNjfSGdtpXu.H6.QO5HIOPEuJBVZ.IldFHZ3bGXYW/y0YChS', 'مستفيد', 'تمت الموافقة', NULL, '1r3fid61bcYp017bOEtR9Ge2fynjTZykIeVYL4yF6FeauF3UPyLuIcPQXJGo', '2022-06-18 04:32:47', '2022-06-21 17:42:05'),
(277, 'علي', 'حسين', 'علي', 'ال ذيبان', 'la46900@gmail.com', '966534024734', '1047545494', 17, 1, 'uploads/id_pics/277/f46ee33d-a37a-498e-a208-0188ee698ba3.jpg', 'uploads/medical_report_pics/277/101010.pdf', NULL, '$2y$10$n4GdTMz34ahq2t2QDkVLSOc4G1o1wHRVh6jpt6ly.ly2Gem50UmH6', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-19 00:09:58', '2022-06-21 17:36:44'),
(278, 'ناصر', 'مشعل', 'مسعود', 'اليامي', 'eetuu1265@gmail.com', '966553084183', '1083055069', 8, 1, 'uploads/id_pics/278/التقاط.PNG', 'uploads/medical_report_pics/278/ملف.pdf', NULL, '$2y$10$lJoWE0IGCg6jF3mCIhALuOzvlOBPjwFcRRZuaiNhXQT0aFsQODAXO', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-19 04:30:07', '2022-06-21 16:25:13'),
(279, 'سيف', 'مشعل', 'مسعود', 'اليامي', 'eetuuu1265@gmail.com', '966563929367', '1067995728', 8, 1, 'uploads/id_pics/279/التقاط..PNG', 'uploads/medical_report_pics/279/سيف.pdf', NULL, '$2y$10$IELDPmY2IIMj9g6wbcATCenLsq//Z0RQvZaexDktZZEjyIczMICHy', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-19 04:42:40', '2022-06-21 16:23:44'),
(280, 'صبا', 'مشعل', 'مسعود', 'اليامي', 'etuu1265@gmail.com', '966538929920', '1138185416', 6, 1, 'uploads/id_pics/280/التقاط1.PNG', 'uploads/medical_report_pics/280/صبا.pdf', NULL, '$2y$10$ikVdZR6fUsFdxMmCqsThaOZFnTq4alxrASs1sIgOo5K4uljq4vbra', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-19 04:48:08', '2022-06-21 16:21:29'),
(281, 'ايناس', 'مشعل', 'مسعود', 'اليامي', 'eetuu12365@gmail.com', '966559147491', '1151085915', 8, 1, 'uploads/id_pics/281/التقاط..PNG', 'uploads/medical_report_pics/281/ايناس.pdf', NULL, '$2y$10$a9wNW4kcpzVUkDFvRB4koutuXOydZXlbVn2PQTxBkJgjzTvKiOaaW', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-19 04:51:56', '2022-06-21 16:21:05'),
(282, 'سنا', 'مشعل', 'مسعود', 'اليامي', 'eetu1265@gmail.com', '966550413494', '1159075967', 8, 1, 'uploads/id_pics/282/التقاط..PNG', 'uploads/medical_report_pics/282/سناء.pdf', NULL, '$2y$10$h8WSzhR2GE/65FaH6w3nOOroOnak9L1c5I6R1tTZ7XMKje1YjG7MS', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-19 04:56:49', '2022-06-21 16:20:36'),
(283, 'محمد', 'مشعل', 'مسعود', 'اليامي', 'eetuu1365@gmail.com', '966503897675', '1164020701', 8, 1, 'uploads/id_pics/283/التقاط..PNG', 'uploads/medical_report_pics/283/محمد.pdf', NULL, '$2y$10$BU2k53.pbJhVeval1UlyneJWPkwhEToZ/JDVr.JFy9ETWSTc3irrC', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-19 04:59:58', '2022-06-21 16:20:01'),
(285, 'متعب', 'عايض', 'صالح', 'ال قريع', '665tww@gmail.com', '966554091725', '1180458026', 9, 1, 'uploads/id_pics/285/image.jpg', 'uploads/medical_report_pics/285/Maternity & Children\'s Hospital-Najran.pdf', NULL, '$2y$10$rIl2UQ3aC1Aw5g1W6GqwR.8Hl6JRCF2CMR0qKPM/yRPkVC/anhL2.', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-19 21:06:22', '2022-06-21 16:18:15'),
(286, 'الحسن', 'صالح', 'هادي', 'ال دغرير', 'mtd1500@hotmail.com', '966552696446', '1081672550', 1, 1, 'uploads/id_pics/286/78DD9992-6B22-4A3F-B2DF-400FADC53639.png', 'uploads/medical_report_pics/286/new doc 2018-02-06 19_22_01_20180206192316.pdf', NULL, '$2y$10$ZYmGqoVkZJIGmCzwNrZ59uWUcndbC8NS1JUE3rnDJqN16OPjvKJbq', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-20 04:29:39', '2022-06-21 16:17:47'),
(287, 'ليلى', 'عمر', 'علي', 'ال ضاوي', 'o.aldhawi@gmail.com', '966569663031', '1185436449', 13, 1, 'uploads/id_pics/287/سجل الاسره  ٢_page-0001.jpg', 'uploads/medical_report_pics/287/ليلى.pdf', NULL, '$2y$10$Lh5tGCqnx34W9zamEZZAn.WK/77aOWbxpJUTS66H//JYqYeXDz93.', 'مستفيد', 'تمت الموافقة', NULL, 'zRe2qPudzi0SqnzFw7eQrSfEe8XV5Zx5xEqqhPTScOcSnT9BjGn6KVrYzmY8', '2022-06-21 01:57:29', '2022-06-21 16:17:09'),
(288, 'حيدر', 'حسن', 'علي', 'اليماني', 'alrbbyyhassen@gameil.com', '0537666481', '2360758409', 1, 33, 'uploads/id_pics/288/7A4221AA-6141-4BD7-84FC-BFAE93F2DF94.jpeg', 'uploads/medical_report_pics/288/تقرير حيدر.pdf', NULL, '$2y$10$wjCzNd2xvPR51h4tOi9yw.T4LShhS8pQMWgGJgTR2Es2GudodlsXy', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-21 03:25:12', '2022-06-21 16:16:34'),
(291, 'حسين', 'محمد', 'علي', 'ال حمامه', 'alhawa97@hotmail.com', '966560661055', '1185931746', 13, 1, 'uploads/id_pics/291/547325A4-165F-4E24-BA4F-CE7340CEDFE3.jpeg', 'uploads/medical_report_pics/291/CamScanner 06-21-2022 20.24.pdf', NULL, '$2y$10$iI1ouFPY/Ysx1eoCXG5RNewegmYm173xThlC6gIKhd/f5WJNwERre', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-22 03:27:18', '2022-06-28 20:51:02'),
(292, 'فاطمه', 'عبد الحميد', 'محمد', 'موسى', 'abdulhamed122443@gmail.com', '0532465028', '2324380142', 11, 3, 'uploads/id_pics/292/اقامة.jpeg', 'uploads/medical_report_pics/292/تقرير المستشفي.pdf', NULL, '$2y$10$4avclHI/odQpzVFfYB5SFOr.XSqOSw6HcyBDDW1tzO11wr2ST9iyq', 'مستفيد', 'تمت الموافقة', NULL, 'JjY5FoxUSUHTJXqAZGKvCbnHaDw9JM5afHpkyah9DBqqTaJohYHnL4pCc4Ja', '2022-06-23 05:09:18', '2022-06-28 20:49:42'),
(294, 'فاطمه', 'صالح', 'عبدالله', 'الحارث', 'asd09876@hotmail.com', '0532339628', '1021250293', 16, 1, 'uploads/id_pics/294/4E1CA8B3-526C-469A-AE56-5B808280A241.jpeg', 'uploads/medical_report_pics/294/بلا عنوان 10.pdf', NULL, '$2y$10$WoDDub3s5pZl3LmJVHV8Ke6PqnG7/MIqECrI9QX81elFFhZf.ntgK', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-06-25 03:03:33', '2022-06-28 20:47:56'),
(295, 'اميره', 'ناصر', 'دومان', 'ال جفر', 'shjwnnasr40@gmail.com', '551607635', '1182352748', 9, 1, 'uploads/id_pics/295/image.jpg', 'uploads/medical_report_pics/295/L.pdf', NULL, '$2y$10$DrBSApnWGXKAaN63tsYx7eh52ir8Xuh9XuAAZWsZM3gbf3rE1orFi', 'مستفيد', 'تمت الموافقة', NULL, 'HWizNHTzcxoejHeNw3FD4cNmKUzzDQQoV7AeUJmkbnwAu8gEbzz1dM16fMYX', '2022-06-29 03:11:47', '2022-07-02 22:40:27'),
(297, 'حسن', 'حسين', 'أحمد', 'وازع الوايلي', 'iiiill002200lliiii@gmail.com', '966542909898', '2423314158', 13, 33, 'uploads/id_pics/297/Screenshot_٢٠٢٢٠٧٠١-١٤٣٣٣٠_WhatsApp.jpg', 'uploads/medical_report_pics/297/Screenshot_٢٠٢٢٠٧٠١-١٤٣٤٠٤_WhatsApp.jpg', NULL, '$2y$10$4hmPUECmaWwVa4RODZa3Yex/.E2Fd1LbURfD1VbgcrU3LJxc1P0xK', 'مستفيد', 'تمت الموافقة', NULL, 'wZmDjK4Skn1NdLcOIFZexzPmk6plF7tDRiybKDLQPIi5xsq64vMKN9OdQRFk', '2022-07-01 21:35:19', '2022-07-02 22:41:45'),
(298, 'فاطمة', 'حسن', 'حمد', 'ال مهذل', 'sh2017-77@hotmail.com', '966562669646', '1107939892', 9, 1, 'uploads/id_pics/298/72162F8A-9BF0-408E-8680-C85F0E13E5A6.png', 'uploads/medical_report_pics/298/تقرير فطوم .pdf', NULL, '$2y$10$Hd.cvQim7S.jwALXyj3dy.88szqeab4j5Xp2cO41xINODZoJGS8K6', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-07-04 05:25:17', '2022-08-07 07:29:11'),
(299, 'عبدالله', 'محمد', 'سعد', 'ال راشدان', 'msn.fff@hotmail.com', '0500808527', '1075835254', 16, 1, 'uploads/id_pics/299/C8F6378A-C04A-49D7-BA31-9D84CBF09483.png', 'uploads/medical_report_pics/299/111111.pdf', NULL, '$2y$10$MbTPv3ykeq7fvyabc18r3ug/imo1RFtb/b3/en/0SDtj/jM5BJlCS', 'مستفيد', 'تمت الموافقة', NULL, '1T5ApFXgnuK0mWygJTty37p7nGlQnvgvMtSkkJ8FmtJlPhSpHTo5GnNHndzg', '2022-07-04 09:35:15', '2022-08-13 10:29:34'),
(300, 'حمد', 'محمد', 'عايض', 'ال جعره', 'zzczzc653@gmail.com', '966501769590', '1167307972', 9, 1, 'uploads/id_pics/300/47AB40CC-A892-4664-959E-0A90492C7CE5.jpeg', 'uploads/medical_report_pics/300/0BC73C27-1041-4E5B-9D30-34492930FD25.pdf', NULL, '$2y$10$8aLyC11U5mxYfIooeyB6neylotOZfBsOjlCv5kipeUJVTdj/ezRQO', 'مستفيد', 'تمت الموافقة', NULL, 'ulvT9TMGsfbO57i7oiljNgBYb0XxiMOf7qmPCpEumvO3sNE05rq0l8fRhpTt', '2022-07-26 01:22:27', '2022-08-07 07:31:16'),
(301, 'افنان', 'بليغ', 'علي', 'ناجي', 'abufunani@gmail.com', '500705261', '2340704663', 8, 33, 'uploads/id_pics/301/اقامة افنان.jpeg', 'uploads/medical_report_pics/301/تقرير افنان.pdf', NULL, '$2y$10$dAtnLXjF0RI9p9/7iTMyxO3cHnsjEBjVNfGlcgZC.pDduWMNimp76', 'مستفيد', 'تمت الموافقة', NULL, 'yP1xdUeK9BQZYGMMFP215dcqkwBODb85VJ7PAYrPuwAMcTfpuiifRTVZTupY', '2022-07-26 16:56:52', '2022-08-07 07:31:44'),
(302, 'بسمة', 'فهد', 'علي', 'الدوسري', 'f_5456@hotmail.com', '0543542181', '1192484630', 16, 1, 'uploads/id_pics/302/c286f3b0-0559-4946-9990-fb7f549a5167.jpg', 'uploads/medical_report_pics/302/تقارير 07-03-2022 08.38 (1).pdf', NULL, '$2y$10$v/F4RuFG3Kx6B8L12FNBIuOIEAfNLnqcd6smsZz2F1zA3xERlvmpy', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-07-26 17:58:36', '2022-08-07 07:32:35'),
(303, 'محمد', 'سعيد', 'يحيى', 'آل الحارث', 'lacasadepapel347681@gmail.com', '966554563400', '1185343769', 13, 1, 'uploads/id_pics/303/Screenshot_٢٠٢٢٠٧٢٦_٢٢٤٦٤٨.jpg', 'uploads/medical_report_pics/303/Screenshot_٢٠٢٢٠٧٢٦_٢٢٤٨١٦.jpg', NULL, '$2y$10$vRDOAIOmpbHilM4QWgos5eVuV4ePg5kOe64iD66U9H/ajG/bXpS86', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-07-27 05:48:34', '2022-08-07 07:33:34'),
(304, 'حمزة', 'حمد', 'محمد', 'ال سوار', 'y7x7y@hotmail.com', '966553550589', '1164604413', 13, 1, 'uploads/id_pics/304/47B9B1E8-74DE-494F-9507-A0F972CD0798.jpeg', 'uploads/medical_report_pics/304/Welcome.pdf', NULL, '$2y$10$Tntn6Wdr6TB3iSyb8Ba9l.HZiyJxWNNDFOb6HQeWAxZpqI2SuR2qm', 'مستفيد', 'تمت الموافقة', NULL, 'HKttodLhwsWX8ZLkVALUdSSMuTO6xIkTciKURpnkxx4OJvaGQtS1ipzBnUVK', '2022-08-02 22:44:14', '2022-08-07 07:34:22'),
(305, 'فراس', 'حيدر', 'ابوشلعة', 'دايلي', 'salha.eur@gmail.com', '0581804818', '1194485619', 12, 1, 'uploads/id_pics/305/فراس رقم السجل المدني.jpeg', 'uploads/medical_report_pics/305/تقرير فراس دايلي.pdf', NULL, '$2y$10$QA5UTRn7LanDIRxgTJlAy.Xkt7m.LqckBd.Ybsv1Rxd0.BAKyJimy', 'مستفيد', 'تمت الموافقة', NULL, '3aZdl9sQmxlV4VqfdsdVBsagqX8aeok0vaShKwVEbW84I9Y1dlyDkeHKqrpu', '2022-08-13 01:54:31', '2022-08-15 17:39:39'),
(306, 'فايقه', 'مبارك', 'محمد', 'العولقي', 'a0501428672@gmail.com', '507042793', '2219382765', 8, 33, 'uploads/id_pics/306/IMG_20220103_175627.jpg', 'uploads/medical_report_pics/306/IMG-20220322-WA0027.jpeg', NULL, '$2y$10$sfjovGOttGsqhB22zOL89OVeamVJ5RUGIc6lVjh/jPYkJ/SYzXns6', 'مستفيد', 'تمت الموافقة', NULL, 'L6mLJ3d3lRrVmqLxfccSAZ6CyOXFeXqd07cHIMu7vgpszJYSzu589t2ZmjQ5', '2022-08-16 03:03:49', '2022-08-31 17:12:29'),
(307, 'فاطمة', 'عبدالله', 'علي', 'الوايلي', 'hmdah90.mda90@gmail.com', '0559879697', '2495883791', 8, 1, 'uploads/id_pics/307/688EC871-C502-4E9B-8CA7-86862FDDE5B9.png', 'uploads/medical_report_pics/307/877.pdf', NULL, '$2y$10$Kbw4/ynCxrRzU3ShWxzrGeqJ4g/g57xdAA8MEarUBitWREcBTp/pO', 'مستفيد', 'تمت الموافقة', NULL, 'CnTgUJdtdKRENLRcgap8B96vzVWHCdEMruSODLZNNMM77PufG1GEMLH7avrH', '2022-08-17 07:04:12', '2022-08-31 17:14:04'),
(308, 'عبد الله', 'خالد', 'عبد الهادي', 'الزقلي', 'khaldalzqly337@gmail.com', '966507298337', '1185837794', 6, 1, 'uploads/id_pics/308/Scan111 (1)_page-0001.jpg', 'uploads/medical_report_pics/308/Image_2151 (1).pdf', NULL, '$2y$10$Q.ci18g5/zOZNuWBsMg2XeJxu/MkxA8TjHQPU5xAmHCwk7XwpBzBK', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-08-17 17:59:44', '2022-08-31 17:17:46'),
(309, 'جود', 'أحمد', 'علي', 'الشهري', 'joodahmad@icloud.com', '553477949', '1173824820', 12, 1, 'uploads/id_pics/309/C02EDBC8-2B01-4900-96F4-B30603270E4F.jpeg', 'uploads/medical_report_pics/309/CamScanner 08-17-2022 18.44.pdf', NULL, '$2y$10$k0Sob3mBlL5FVsdO2dHntOMiMWRb/5fbchm/AkLTn6ouWAw.S6ADO', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-08-18 01:46:11', '2022-08-31 17:18:24'),
(310, 'عبدالله', 'علي', 'حسين', 'ال عسكر', 'alaskerfatima123@gmail.com', '966535336877', '1160470611', 11, 1, 'uploads/id_pics/310/29211EAD-A077-432E-BEC3-47060D5A4B8C.jpeg', 'uploads/medical_report_pics/310/ملاحظة جديدة.pdf', NULL, '$2y$10$DrxAf6UqvGFYmfZcT66NGO9zUuBcNnoRgNC2.ecAvu4VRiHHRxXXq', 'مستفيد', 'تمت الموافقة', NULL, 'SlTrJR17D9SVn4g5Fcw6ktkXGVoTMN5PtdwlcQDcN9llAP68vA0178mOGR3P', '2022-08-18 11:01:13', '2022-08-31 17:19:03'),
(311, 'فراس', 'خالد', 'سالمين', 'بن مخاشن', 'najjw08@gmail.com', '0505792679', '4092634338', 13, 33, 'uploads/id_pics/311/16610335261885390408723690679706.jpg', 'uploads/medical_report_pics/311/Image to PDF ٢٠٢٢٠٨٢١ ٠٠.٥١.٥٢ (1).pdf', NULL, '$2y$10$S4sL8.eKZXDA6KsMU9yOi.bnpmeYuL1zNweE3amhONykY4TnsBmJO', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-08-21 08:14:52', '2022-08-31 17:17:18'),
(312, 'ولاء', 'عبدالله', 'بكري', 'البكري', 'km2017.00@icloud.com', '559819278', '1178480149', 13, 1, 'uploads/id_pics/312/1DAE31C7-FE71-49CD-B511-8E314159201B.jpeg', 'uploads/medical_report_pics/312/التقرير الطبي .pdf', NULL, '$2y$10$yN2KIp6uYr2kSGBAOPeUFOhY/0we5foTuoRqX8M3AzUtf/gk/szXi', 'مستفيد', 'تمت الموافقة', NULL, 'IpnbOB0mM4QV41S6StTfR5tUSEdpZWJVmy75nKoXTmdxU5LFK5USb7MXIVyt', '2022-08-31 01:03:16', '2022-08-31 17:14:29'),
(313, 'العنود', 'علي', 'ظافر', 'ال فطيح', 'mobility@gmail.com', '966502142759', '1193697370', 12, 1, 'uploads/id_pics/313/IMG-20220825-WA0057.jpg', 'uploads/medical_report_pics/313/IMG-20220828-WA0119.jpeg', NULL, '$2y$10$9ghXp5w0QOtuFafi0MXHWuC2c.wlAjDy0OZf/T3wMSX/qubBGazLm', 'مستفيد', 'تمت الموافقة', NULL, 'FGvw1uykGrajg9bm1RfJXaswsBlr7knRSfCpxWzofUdvtg3Q9htNIuz7PG00', '2022-08-31 06:45:34', '2022-10-27 05:59:15'),
(314, 'ريم', 'علي', 'مانع', 'الصنبوح', 'rakan.009@icloud.com', '966551040889', '1123963785', 9, 1, 'uploads/id_pics/314/image.jpg', 'uploads/medical_report_pics/314/تقرير طبي.pdf', NULL, '$2y$10$9VcfuDbet5pmRBZYZNoGwO/RnGgGOE6SD53Qyh1ZyJlg4hCo9sKmK', 'مستفيد', 'تمت الموافقة', NULL, 'Szw0WaV1EquswUwj5sTLo7iY6VWYznlrk8Aq77NfaMiaPmIiDATtexrHoown', '2022-09-01 00:37:47', '2022-09-10 02:07:39'),
(315, 'عبدالله', 'عادل', 'احمد', 'الشريف', 'abdullah21220al@gmail.com', '537050801', '1162251639', 13, 1, 'uploads/id_pics/315/AD24188D-390C-4EAE-BF83-E9134DA89032.jpeg', 'uploads/medical_report_pics/315/٢٠٢٢-٠٩-٠٤ ٠٥.٣٦.pdf', NULL, '$2y$10$huTrNl1Mkza1YZ8.NKRwDud/8PgBJ5EoHw4yC0R/J9pYtntJdxQ5e', 'مستفيد', 'تمت الموافقة', NULL, 'v0ieQZYTmkDhB7xennlYEbGZrbrqOnUxY3nZ7oVdAXr8y7EkB9qZrhRiz0G1', '2022-09-05 00:47:37', '2022-09-09 00:46:30'),
(318, 'عبدالله', 'فريد', 'صالح', 'العولقي', 'SUP97249@GMAIL.COM', '966559920295', '2043027859', 11, 33, 'uploads/id_pics/318/هوية.jpg', 'uploads/medical_report_pics/318/تقرير.pdf', NULL, '$2y$10$UQfr7mNTJmVitbO71LxUMeCoy3OpOJED66/blFoFFMehKCvEgkMBG', 'مستفيد', 'تمت الموافقة', NULL, 'T3yOhgOhCIV9tAeq0vHqvpusTN6fK5bAtGmjFydshVs9l1Y2nr603XNk3tAz', '2022-09-10 23:43:45', '2022-09-17 17:57:30');
INSERT INTO `beneficiaries` (`id`, `first_name`, `second_name`, `third_name`, `fourth_name`, `email`, `phone_number`, `record`, `disability_id`, `nationality_id`, `id_pic`, `medical_report_pic`, `email_verified_at`, `password`, `role_name`, `Status`, `api_token`, `remember_token`, `created_at`, `updated_at`) VALUES
(319, 'ليلاس', 'يحي', 'علي', 'عبسي', 'yahay89@hotmail.com', '966502271700', '1192686085', 13, 1, 'uploads/id_pics/319/5BE76087-3C03-4971-9B96-E6FC2865CD74.jpeg', 'uploads/medical_report_pics/319/Ministry of Health.pdf', NULL, '$2y$10$sLbyBYYufKkHoqcYGn5Nt.P8nQbXIJ5NgWkBAyk/jmRXcP6fcM./K', 'مستفيد', 'تمت الموافقة', NULL, '9ysSDdLfeM0jZ6pXHCZaM7aOtxAQLRsalaj6NmxSikyXMBBGmKJVwVsrub20', '2022-09-12 02:11:27', '2022-09-17 00:46:20'),
(322, 'علي', 'عمر', 'مبخوت', 'النهدي', 'alyhmr54@gmail.com', '966581850837', '6078288434', 9, 33, 'uploads/id_pics/322/IMG-20220911-WA0012.jpg', 'uploads/medical_report_pics/322/IMG-20220915-WA0092.jpg', NULL, '$2y$10$MbsHGE7ydS2/Ta/MvbRWi.18poiCjAq8mwFiYqtUVeDxiNOJx/DEa', 'مستفيد', 'تمت الموافقة', NULL, '5RKhKSq0LRw4TMx6woEHh1B8776uzKwahsFt6DrgrfXnHRM7IvqTPLq0Y4yh', '2022-09-15 23:05:00', '2022-09-17 00:52:10'),
(325, 'سلمان', 'حمد', 'محمد', 'اليامي', 'mhmm110330@gmail.com', '966501675382', '1154001380', 12, 1, 'uploads/id_pics/325/٢٠٢٢٠٩١٨_١٧١٥١٩.jpg', 'uploads/medical_report_pics/325/التقرير الطبي.pdf', NULL, '$2y$10$A5iYfXycC1zAfVwsZ0UEfuxpIZuNpF8S4IQ8JnA09N.8a6vj78hmi', 'مستفيد', 'تمت الموافقة', NULL, '8xJArgtnkO31bh84KCWzb50BpkWt3hJu9ViJzikAYGkGMTLuySSXFX1PboTA', '2022-09-19 00:16:29', '2022-09-26 16:56:38'),
(326, 'سالم', 'صالح', 'سالم', 'ال ساري', 'sa0536559589c2@gmail.com', '0502337597', '1170323248', 6, 1, 'uploads/id_pics/326/1663688064245582139329941212303.jpg', 'uploads/medical_report_pics/326/MCH - English.pdf', NULL, '$2y$10$f6pf0ztRm6R5XdNu6NqyTu0Zs76WGIbU.1BMcPFgJJnp2RWSoyiUi', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-09-21 01:34:50', '2022-09-26 16:58:10'),
(327, 'عبدالله', 'محمد', 'عبدالله', 'بجلف', 'hauPr7953@gmail.com', '966561944072', '4136818434', 16, 33, 'uploads/id_pics/327/5004202C-4282-428F-BE25-2EF893DFD119.jpeg', 'uploads/medical_report_pics/327/image.pdf', NULL, '$2y$10$XQpHO4X.n7DwiUCyC119S.43bWgpQeH4L/DNA6MMWYmcnm9TSnu3O', 'مستفيد', 'تمت الموافقة', NULL, 'En4m7pCf7j4np6MEK2D1og3D3VKkqArDScpwF5Y7dxtwWmjmn5XSO5N4NqYg', '2022-09-22 01:28:28', '2022-09-26 16:58:52'),
(328, 'حور', 'علي', 'حمد', 'الربيعي', 's77y@outlook.sa', '0509476163', '1185100805', 1, 1, 'uploads/id_pics/328/ED37C3BA-0F46-4A75-8374-0D83E44BB0C1.jpeg', 'uploads/medical_report_pics/328/Medical Report - تقرير طبي.pdf', NULL, '$2y$10$VXofrAV0fS5ci/qef9WNSeAqcXb6DhSZ1M1U5KuP.WZhNdhZTo73K', 'مستفيد', 'تمت الموافقة', NULL, 'TR92RiWpfjSpRu6wSnUe4BVIoIdTMHk22p8dmch0Fsgu64yFNRJqnbPrjkqQ', '2022-09-25 05:34:13', '2022-09-26 16:59:41'),
(329, 'ندى', 'ناصر', 'مرزوق', 'ال فلكة', 'mahanasseralyami94@gmail.com', '966506385665', '1131657361', 6, 1, 'uploads/id_pics/329/image.jpg', 'uploads/medical_report_pics/329/AF28F811-3602-4A62-93E6-E5BF0B3D08C7.pdf', NULL, '$2y$10$GLSIUIoYVQiuDXLk6XU/getO/KhAKKT4Bkt0EOwehhjsilRBIdIJ.', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-09-25 22:01:53', '2022-09-26 17:06:37'),
(330, 'khalid', 'abdulaziz', 'dgiem', 'alanzi', 'nana7126@hotmail.com', '0551678378', '1193355094', 13, 1, 'uploads/id_pics/330/80D88B2C-3931-42E0-B83A-5701A22F22A2.jpeg', 'uploads/medical_report_pics/330/خلودي.pdf', NULL, '$2y$10$ednv7Ir3AoWlwkoNxWlI0envy9aTCldHXy0.esQ0ZW4.0gJjFDClW', 'مستفيد', 'تمت الموافقة', NULL, '62nyD7Ephkc165qABFRQpLPJBWNemZAfxvZMk7i7ucwT8IqOETwnGK3QN0wk', '2022-09-26 02:20:10', '2022-09-26 21:20:07'),
(332, 'فارس', 'علي', 'مانع', 'كرحان', 'ali_kr7an@hotmail.com', '966500366706', '1192552907', 13, 1, 'uploads/id_pics/332/5B5EDCA1-F0DC-4342-9A80-C271207F75A1.png', 'uploads/medical_report_pics/332/SN 02004107119712.pdf', NULL, '$2y$10$YyvePDaamrVBCbZeCfChwuHMt9iCnpWys91/ZEGpsAeNMaq6d35ra', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-09-26 19:27:24', '2022-10-08 00:45:34'),
(333, 'هادي', 'معدي', 'علي', 'اليامي', 'ryms1181@gmail.com', '0536050076', '1167221710', 12, 1, 'uploads/id_pics/333/كرت العايلة.jpg', 'uploads/medical_report_pics/333/تقرير هادي.pdf', NULL, '$2y$10$G50xSifnDXO/jQwh.TRxXeCl6LkLHZOh.uyCE2kcXV4soOaQo8od.', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-09-29 03:15:18', '2022-09-30 22:47:45'),
(334, 'Fatimah', 'Mana', 'Mouhammed', 'Alhutailah', 'toma2012.000@hotmail.com', '966530131291', '1082262633', 12, 1, 'uploads/id_pics/334/C2E96492-3034-4238-9843-59EE62E2785F.png', 'uploads/medical_report_pics/334/‏لقطة شاشة ٢٠٢١-١٢-٢٠ في ٣.٣٥.٤٦ م.pdf', NULL, '$2y$10$DM8e0i3xnofk5ADaPypelOzvta4lkjlUNT7z1ero4YDEjgSzCLhNq', 'مستفيد', 'تمت الموافقة', NULL, 'kUDf9bASIwlIr4TID8VGVLSSDKAJUQ9fNZAea1vDpRQXEOk2BzaSq3r3buDu', '2022-09-30 22:49:51', '2022-09-30 22:53:46'),
(335, 'رسيل', 'عبدالغفار', 'عبدالله', 'المعلوي', 'abdalgafar2010@hotmail.com', '966547151911', '1178400758', 17, 1, 'uploads/id_pics/335/IMG_1140.jpg', 'uploads/medical_report_pics/335/الهوية.pdf', NULL, '$2y$10$ELPrmbLlw63nHBF0dTW.mueP.65Dl91DKqC3i8.oN66oOIdGDnYN6', 'مستفيد', 'تمت الموافقة', NULL, 'LV7bLLotZWlxIgquF0Z8OXDpscY3nWklbJSbJ7kopq9dhO6ZWcl44jfL9zrb', '2022-10-01 22:12:31', '2022-10-04 08:04:09'),
(336, 'صالح', 'محمد', 'ناصر', 'المصعبي', 'x.33x@outlook.com', '966502211824', '2371354255', 11, 33, 'uploads/id_pics/336/Screenshot_20221004_211612.jpg', 'uploads/medical_report_pics/336/تقرير طبي.pdf', NULL, '$2y$10$GWtTVvhv8bgYTHg/SU8/6OWkOe4ptPz8h/bPrUI6o6ZYOS23O4ddy', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-10-05 04:34:31', '2022-10-05 16:33:45'),
(337, 'سلوى', 'يحيى', 'فهيد', 'ال سويدان', 'halib1420@gmail.com', '966556461922', '1136278940', 6, 1, 'uploads/id_pics/337/E30B55E2-C26D-44D5-923F-4A00DB035D8E.jpeg', 'uploads/medical_report_pics/337/تقرير سلوى .pdf', NULL, '$2y$10$SZ.gLKddxVIyeepnq7H5/.w0hTUvs2tNZ0c3jB5fTvY0G5BfBC2PK', 'مستفيد', 'تمت الموافقة', NULL, '2jxRUQdHFQM93xH5sITgpwkMDL9hvL7V6v1iB7vgzX4Ybp58UGnxweRLweye', '2022-10-11 20:38:38', '2022-10-12 00:17:26'),
(338, 'رفعه', 'سبلان', 'صالح', 'ال دويس', 'hajeralyami911@gmail.com', '0545280236', '1134618089', 8, 1, 'uploads/id_pics/338/1665610209941884709730943802128.jpg', 'uploads/medical_report_pics/338/Image to PDF ٢٠٢٢١٠١٣ ٠٠.١٩.٢٢.pdf', NULL, '$2y$10$vxlDhILg9m8HHikWzgibruEgmKf5BobmenoUdFsw.ZeZNZ8au86UG', 'مستفيد', 'تمت الموافقة', NULL, 'IlUdt8CCGwUJDFUCGsPYIAMWMrb09HbOLSjnzOXbAnPEvFD9ovfGZcPgLHja', '2022-10-13 07:31:34', '2022-10-23 03:04:17'),
(339, 'ليال', 'محمد', 'حمد', 'ال شريه', 'mal_shariah2002@yahoo.com', '966550141060', '1188103806', 11, 1, 'uploads/id_pics/339/16658534716286242004496809738135.jpg', 'uploads/medical_report_pics/339/16658534861349115329361002647318.jpg', NULL, '$2y$10$X7Y4L5w84wrOEzlRGnHZJuKDFOW8wSNn2cnziG5tEhJt.UZPKWwkG', 'مستفيد', 'تمت الموافقة', NULL, 'HvusruROxa6GZpv4dJDdXKMIu7uyJRg9sFpnJaSRyj5xXWFldIfpEAYMCCC9', '2022-10-16 03:05:10', '2022-10-23 03:00:52'),
(340, 'ياسر', 'موسى', 'محيا', 'المطيري', 'qnnq140413@gmail.com', '966545320108', '1198089805', 13, 1, 'uploads/id_pics/340/BADA5F02-1A7A-4233-AD4B-0FC4CA897EF1.jpeg', 'uploads/medical_report_pics/340/مستندات ممسوحة ضوئيًا.pdf', NULL, '$2y$10$gqkVCtFAKepMU1hkOQ769uoCoGpy3KiUJXyrjcA4vDiT8QSjROfeC', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-10-16 15:07:42', '2022-10-23 02:59:40'),
(341, 'احمد', 'الطيب', 'البشير', 'احمد', 'amna70177@gmail.com', '966537132394', '2432782379', 8, 5, 'uploads/id_pics/341/IMG_20221016_112617.jpg', 'uploads/medical_report_pics/341/1665908969869.jpg', NULL, '$2y$10$IBwMIkvrk73Jyy4.z4rD/uCMgg4/26qL13Qn7HShCgN5awOA3N9wW', 'مستفيد', 'تمت الموافقة', NULL, NULL, '2022-10-16 18:30:26', '2022-10-23 02:54:25'),
(342, 'مساعد', 'سالم', 'محمد', 'الهمامي', 'altysyr7@gmail.com', '966500963357', '2456879515', 6, 33, 'uploads/id_pics/342/الاقامة20221016_23005303.pdf', 'uploads/medical_report_pics/342/WhatsApp Image 2022-10-16 at 10.55.36 PM.pdf', NULL, '$2y$10$LWJsQSTkykwSjGuYQvpxneFD8qjzP5Ij/dVviYr71bAX5tYS7joz6', 'مستفيد', 'قيد المراجعة', NULL, 'eSYICQ26ReL31fKGKtBcqWBGUfYQN85wHAT3bItdyTfZPpRsnvJB5Rs1YL5W', '2022-10-17 06:01:23', '2022-10-17 06:01:23'),
(343, 'الاء', 'منتصر', 'محمد', 'عثمان', 'eltahirhabab2@gmail.com', '966533822671', '2453480051', 12, 5, 'uploads/id_pics/343/Screenshot_20221017_113350_com.gbwhatsapp.jpg', 'uploads/medical_report_pics/343/Screenshot_20221017_113951_com.huawei.browser.jpg', NULL, '$2y$10$QF.TbAgh0av46GvkyRy.yuTr68w9yap8l4PfD/QCEnvhU.m2i5mnq', 'مستفيد', 'قيد المراجعة', NULL, 'HI2M7t2RE7xC0KgQs9iMUHdBiPMlsDGu8y7H49vJvh3AaPWTGoS97wiKEV0y', '2022-10-17 18:43:12', '2022-10-17 18:43:12'),
(344, 'عساف', 'عبدالرحمن', 'احمد', 'الحكيمه', 'ishfjn@gmail.com', '508143334', '1197022328', 13, 1, 'uploads/id_pics/344/D13BE086-E160-4818-B78B-B2285BD9064F.jpeg', 'uploads/medical_report_pics/344/تقرير طبي عساف عبدالرحمن احمد الحكيمه.pdf', NULL, '$2y$10$LAPKD2RoCONED2RUNJ3omOnArTbqJPKz67LLBj2iDwNB3VK/pfa..', 'مستفيد', 'تمت الموافقة', NULL, 'bPM3JGJQGzAT03VP1R20mId4qdZQhn7J1t8DtiTcNL3KjIixoi61aPPr98Zq', '2022-10-17 19:58:23', '2022-10-23 02:50:24'),
(345, 'ظافر', 'حسين', 'مهدي', 'آل الحارث', 'a0509020070@gmail.com', '966533376556', '1173731041', 10, 1, 'uploads/id_pics/345/84AFF5C2-3523-4B7F-8843-48B5B50E3C56.jpeg', 'uploads/medical_report_pics/345/ملاحظة جديدة 3.pdf', NULL, '$2y$10$4XMSOXrEkvp5CAvakiHyHO.BSvbz7B7f4aqx/1lINPix3pQeAKGYq', 'مستفيد', 'تمت الموافقة', NULL, 'QZ1sPQ3oSswi6O8326dTG96OIanVRLrBeMF1gZtl8ZVtYCY1sAJFnx5MXZBX', '2022-10-18 05:10:48', '2022-10-23 02:47:16'),
(346, 'تركي', 'ناصر', 'سعيد', 'ال سلامه', 'naser.seed18@gmail.com', '966530228280', '2467559650', 13, 33, 'uploads/id_pics/346/16660361522502461250310997825545.jpg', 'uploads/medical_report_pics/346/التقرير الطبي', NULL, '$2y$10$p2Rh.1qreb/K5lYOp0GByOsGxuUsG/Brr895G7qopEBM9Ip33o942', 'مستفيد', 'قيد المراجعة', NULL, NULL, '2022-10-18 05:52:47', '2022-10-18 05:52:47'),
(348, 'مبارك', 'ابراهيم', 'مبارك', 'اليامي', 'M0502717401@gmail.com', '966502717401', '1033277623', 2, 1, 'uploads/id_pics/348/667F9D6F-A382-458B-913D-C351EF033F5B.png', 'uploads/medical_report_pics/348/ملاحظة جديدة.pdf', NULL, '$2y$10$MvvJZHgcRdBcNdub55F6wOXNoaCiuI8IU3IozSqn.dvCcqSLqYqYC', 'مستفيد', 'تمت الموافقة', NULL, 'iZi2dcoqjhOxz753USUwvgYjWeGaxUDzHCFToX20ys6dyVSlmpGqEn4F17AT', '2022-10-22 18:26:21', '2022-10-23 02:39:55'),
(349, 'احمد', 'منتصر', 'محمد', 'عثمان', 'Malazelhassan098803@gmail.com', '966553013706', '2453624245', 12, 1, 'uploads/id_pics/349/Screenshot_20221023_124501_com.gbwhatsapp.jpg', 'uploads/medical_report_pics/349/Screenshot_20221023_125056_com.huawei.browser.jpg', NULL, '$2y$10$rjLydvKVVodmFHsf7EZKROMKqwddS6tt/SYNJQSbsmPwBjhKfK0Ve', 'مستفيد', 'قيد المراجعة', NULL, 'dWu9xKlDFszBe6SXW6s2KveJwqpt7G9ra2NbyaZvrdlPLy6jLpHjFc5OWero', '2022-10-23 19:54:27', '2022-10-23 19:54:27'),
(350, 'حسين', 'علي', 'حسين', 'الدياني', 'sameer245026@gmail.com', '966538218451', '2377983933', 1, 33, 'uploads/id_pics/350/952F2459-9CE4-4627-B755-001D3370D46A.jpeg', 'uploads/medical_report_pics/350/حسين علي.pdf', NULL, '$2y$10$GKFGzlAegMCe9s1xOnOaPOHyxStxry9VXOKaw65Zx9M/3Re2L/jfe', 'مستفيد', 'تمت الموافقة', NULL, 'FvM81dwuwENv1GfEnOXntEBYfwYwXSn1BYZhcJ6GV3j1LDd9dpeN9eP7UzKh', '2022-10-23 20:27:48', '2022-11-08 06:09:34'),
(351, 'محمد', 'احمد', 'محمد', 'الهصيصي', 'googl5157@gmail.com', '966505723754', '2181478229', 8, 33, 'uploads/id_pics/351/95815466-3EFE-4FCB-9D84-ECE58AB38348.jpeg', 'uploads/medical_report_pics/351/صورة.pdf', NULL, '$2y$10$X0CJ9lfqFvtE7hGl5d4vGuN0F7Xqhpy37sxIFCc68/9ovRd8SIOp2', 'مستفيد', 'قيد المراجعة', NULL, '9dPuALrBH33cOm9R2IVXBQqylBzQCnehdUfyeNp6P6mwyoTVdxN24kuUn6c4', '2022-10-25 07:38:03', '2022-10-25 07:38:03'),
(352, 'فاطمه', 'ناجي', 'عوض', 'العولقي', 'adaaaad66@gmail.com', '0534778693', '2244521544', 9, 33, 'uploads/id_pics/352/IMG-20221028-WA0027.jpeg', 'uploads/medical_report_pics/352/IMG-20221028-WA0099.jpeg', NULL, '$2y$10$nNvAJ5MGSqWLxGPNCK/rKOgVQGwcRu3YjSfIOeWesmoVJCQFS6CVy', 'مستفيد', 'قيد المراجعة', NULL, 'X933UCpVztc4u7LhHBOhYpk7Mfz0segLyOgo19LvEt6yN34sfzavQjUayCrs', '2022-11-02 03:21:08', '2022-11-02 03:21:08'),
(353, 'نوره', 'محمد', 'جارالله', 'اليامي', 'a0554267521@icloud.com', '0554267521', '1053315253', 2, 1, 'uploads/id_pics/353/56F9F3D8-75A7-49F4-8DB1-43D56A489450.jpeg', 'uploads/medical_report_pics/353/25E8344D-8E00-427F-905A-4B4C5236936B.pdf', NULL, '$2y$10$qxdgAyVJJS9poaq46zDjxekXR46bYXxUmX0M2J1ntVWAmojgXERL6', 'مستفيد', 'قيد المراجعة', NULL, NULL, '2022-11-03 00:24:44', '2022-11-03 00:24:44'),
(354, 'نوره', 'محمد', 'جارالله', 'اليامي', 'hsnaalyamy636@gmail.com', '0503113831', '1053315253', 2, 1, 'uploads/id_pics/354/B12EB290-3663-45BA-A91D-BC522990CE3D.jpeg', 'uploads/medical_report_pics/354/25E8344D-8E00-427F-905A-4B4C5236936B.pdf', NULL, '$2y$10$EclU4LX5omi0d9.HlKMbdeSrUgGTQpMrV3r24Z6P6Q75eU3YYdyNO', 'مستفيد', 'قيد المراجعة', NULL, NULL, '2022-11-03 00:30:03', '2022-11-03 00:30:03'),
(355, 'ترف', 'عبدالله', 'سعيد', 'ال سليم', 'nn0530543009@gmail.com', '966530543009', '1185347356', 6, 1, 'uploads/id_pics/355/D3F4C68B-D64F-4EC8-9D12-FECA86010A87.jpeg', 'uploads/medical_report_pics/355/1185347356.pdf', NULL, '$2y$10$hU412Ok9AeYgpTorqsBiV.pAfztT2/US0WehC6H3kYcQ2kFn7WHKO', 'مستفيد', 'قيد المراجعة', NULL, 'oik4FgRAKBXcESrvdH3Xt9KMMpSokJYHGn2bnAGAuEl8X9L9KDaHAzd3MUk5', '2022-11-06 21:21:32', '2022-11-06 21:21:32'),
(356, 'محمد', 'احمد', 'محمد', 'صالح', 'soo_0oos@hotmail.com', '966505273754', '2181478229', 8, 33, 'uploads/id_pics/356/Screenshot_20221109_145002.jpg', 'uploads/medical_report_pics/356/IMG_20221109_145516.jpg', NULL, '$2y$10$2LBdbYOKTgKiOvMnSi5ZweawRvZYCyF2gjSxz0OLIG7OFSaKNPzT6', 'مستفيد', 'قيد المراجعة', NULL, '0b3gsDLWDXEUWRlT73EKXL7muHsGFwVBB1r8UDd6QRGQgn39HwAH8DzSINoK', '2022-11-09 22:02:36', '2022-11-09 22:02:36'),
(357, 'شهد', 'صالح', 'عيظة', 'الهمامي', 'hafsah4580@gmail.com', '966559326489', '1135667606', 9, 1, 'uploads/id_pics/357/C513BE0A-3E11-4099-80DC-9EA200E0859C.jpeg', 'uploads/medical_report_pics/357/CamScanner 11-11-2022 16.34.pdf', NULL, '$2y$10$oYPYdZdL3HOAtYLnQk0PguVP7gwM16eVoraGkjnEpIGvzjjXzQ5XG', 'مستفيد', 'قيد المراجعة', NULL, 'Q9BcghxcVH2qZH8IkRKYK3D4iCAe5ColftfB5qCaJ0ou4opkzqpGrgRFTIRy', '2022-11-11 23:42:49', '2022-11-11 23:42:49');

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary_password_resets`
--

CREATE TABLE `beneficiary_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `beneficiary_password_resets`
--

INSERT INTO `beneficiary_password_resets` (`email`, `token`, `created_at`) VALUES
('hussen-m@hotmail.com', '$2y$10$1Mu92mY15mbP9s0r4OD.FOF2RPaLHJYAycHGOEHiU3ek/itIJMRnG', '2022-05-22 15:26:04'),
('wfqah@outlook.com', '$2y$10$jpegzFEqsUz/mq/k6ZIKm.vCGFRy.j5nr7/.Rj0jchMIGo7qzlQUG', '2022-06-01 19:10:54'),
('sfdahcj777@gmail.com', '$2y$10$O3hjWZZ8M5CkUT35JSnQPO/8jhZ9cW7YJ/YbWMwin9Wx6vjRg3e26', '2022-06-06 17:52:43'),
('awad.2006@windowslive.com', '$2y$10$SPzaQibYNl2dkKS0NDQBa.1zHxwZGCUBb0Ja09N7eYMLV.rAte/iW', '2022-06-07 07:37:35'),
('rakan9112000@gmail.com', '$2y$10$yAAXlrTrrQPx4Yad9.qhBOBQb8ebaLhZB2fbD.TghQ4saRkdSZG66', '2022-06-09 02:17:07'),
('mbarkymrhba@gmail.com', '$2y$10$EIAJs6sOmSQ33YZqpJsKHecEmKqG7ciIKnhBqKwqg3/pgt70bKWmq', '2022-06-09 04:22:55'),
('mbreer8011@gmail.com', '$2y$10$4x3WOxUciko0pbHoE2Nc3ORwZB.4HI6.ZAqPrwU9C/VwWSJwADgNa', '2022-06-13 02:07:32'),
('alyami.zakia@gmail.com', '$2y$10$1J0BkdupOKMbbf10tzROkO5yXp.vMblD3HlV2vycDu5uSYPKV7u6O', '2022-06-13 21:33:00'),
('bm471544@gmail.com', '$2y$10$ZNuQdjen0AruRfuGe1LBXuJWnwGhS8T5kwMWrYPvKbp6OSl2Dsmzm', '2022-07-04 04:29:59'),
('rafah91132@gmail.com', '$2y$10$8DYSUUx8qS7jw0B835rPq.7aAvBtodD1ia.ccLQP8CkswvfgCDZUy', '2022-09-18 03:51:02'),
('kh123kh00@gmail.com', '$2y$10$DEDyANbX8JyQTug5UmMHOOuZQGwX/WoqfNmSSY5r97QpONeMXO726', '2022-10-19 02:34:47'),
('qwer4321@gmail.com', '$2y$10$14MmPkJzEsCSB5lgT9iZ6.Heerh36WhWqbZFNbrapn4T0U5iw9/Ui', '2022-10-27 06:00:27'),
('BUSHRA@gmail.com', '$2y$10$yOirUySPp93DkIQI/gWM2eLgGGD1elt0ynn1QVu7CFHkU38.8NTbi', '2022-11-07 23:14:26');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `phone`, `email`, `subject`, `message`, `status`, `created_at`, `updated_at`) VALUES
(2, 'جميله منصور عبدالله المكرمي', '966501790041', 'dew_770@hotmail.com', 'شكوى', 'السلام عليكم ورحمة الله وبركاته انا متطوعه لديكم بمبلغ 200 ريال واحاول التسجيل في موقع الجمعيه للحصول علي بطاقة العضويه والنظام يرفض يقول مسجل مسبقا واذا سجلت حساب جديد يقول انت لست مسجل لدينا لكم جزيل الشكر', 0, '2022-06-27 02:19:27', '2022-06-27 02:19:27');

-- --------------------------------------------------------

--
-- Table structure for table `disabilities`
--

CREATE TABLE `disabilities` (
  `id` int(11) NOT NULL,
  `disability` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `disabilities`
--

INSERT INTO `disabilities` (`id`, `disability`, `created_at`, `updated_at`) VALUES
(1, 'شلل دماغي', '2022-03-06 11:03:50', '2022-05-08 06:31:54'),
(2, 'إعاقة بصرية', '2022-03-06 11:03:56', '2022-05-08 06:31:32'),
(6, 'اعاقة عقلية', '2022-03-06 11:06:45', '2022-05-08 06:31:20'),
(8, 'إعاقة سمعية', '2022-04-02 15:35:59', '2022-04-02 15:35:59'),
(9, 'متلازمة داون', '2022-04-02 16:05:33', '2022-04-02 16:05:33'),
(10, 'صعوبات تعلم', '2022-05-08 06:32:18', '2022-05-08 06:32:18'),
(11, 'إعاقة حركية', '2022-05-08 06:32:34', '2022-05-08 06:32:34'),
(12, 'توحد', '2022-05-08 06:32:59', '2022-05-08 06:32:59'),
(13, 'اضطرابات نطق وتخاطب', '2022-05-08 06:33:17', '2022-05-18 05:50:01'),
(14, 'ضمور في النمو', '2022-05-18 05:48:04', '2022-05-18 05:48:04'),
(15, 'استسقاء دماغي', '2022-05-18 05:48:24', '2022-05-18 05:48:24'),
(16, 'إعاقات متعددة', '2022-05-18 05:49:24', '2022-05-18 05:49:24'),
(17, 'اضطرابات سلوكية', '2022-05-18 05:50:32', '2022-05-18 05:50:32');

-- --------------------------------------------------------

--
-- Table structure for table `experience_certificate`
--

CREATE TABLE `experience_certificate` (
  `id` int(11) NOT NULL,
  `volunteer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `experience_certificate`
--

INSERT INTO `experience_certificate` (`id`, `volunteer_id`, `created_at`, `updated_at`) VALUES
(2, 5, '2022-05-12 01:32:14', '2022-05-12 01:32:14'),
(3, 1, '2022-05-12 01:52:08', '2022-05-12 01:52:08'),
(4, 1, '2022-05-12 01:52:16', '2022-05-12 01:52:16'),
(5, 2, '2022-05-14 02:34:01', '2022-05-14 02:34:01'),
(6, 8, '2022-05-14 03:15:01', '2022-05-14 03:15:01'),
(7, 28, '2022-05-14 04:17:05', '2022-05-14 04:17:05'),
(8, 28, '2022-05-14 04:17:16', '2022-05-14 04:17:16'),
(9, 14, '2022-05-14 04:39:56', '2022-05-14 04:39:56'),
(10, 18, '2022-05-14 04:49:09', '2022-05-14 04:49:09'),
(11, 11, '2022-05-14 05:57:58', '2022-05-14 05:57:58'),
(12, 12, '2022-05-14 06:03:26', '2022-05-14 06:03:26'),
(13, 12, '2022-05-14 06:05:10', '2022-05-14 06:05:10'),
(14, 42, '2022-05-15 20:56:42', '2022-05-15 20:56:42'),
(15, 6, '2022-05-16 20:29:57', '2022-05-16 20:29:57'),
(16, 51, '2022-05-22 09:44:07', '2022-05-22 09:44:07'),
(17, 53, '2022-05-24 14:49:37', '2022-05-24 14:49:37'),
(18, 42, '2022-05-30 04:26:42', '2022-05-30 04:26:42'),
(19, 42, '2022-05-30 04:26:57', '2022-05-30 04:26:57'),
(20, 53, '2022-05-30 06:40:37', '2022-05-30 06:40:37'),
(21, 53, '2022-05-30 06:40:44', '2022-05-30 06:40:44'),
(22, 42, '2022-06-06 04:42:22', '2022-06-06 04:42:22'),
(23, 42, '2022-06-08 09:07:23', '2022-06-08 09:07:23'),
(24, 42, '2022-06-08 09:07:33', '2022-06-08 09:07:33'),
(25, 57, '2022-06-10 13:34:44', '2022-06-10 13:34:44'),
(26, 58, '2022-06-10 21:07:38', '2022-06-10 21:07:38'),
(27, 61, '2022-06-12 05:31:21', '2022-06-12 05:31:21'),
(30, 60, '2022-06-13 03:47:01', '2022-06-13 03:47:01'),
(31, 75, '2022-06-13 17:09:11', '2022-06-13 17:09:11'),
(32, 42, '2022-06-14 16:24:40', '2022-06-14 16:24:40'),
(33, 42, '2022-06-14 16:25:03', '2022-06-14 16:25:03'),
(34, 42, '2022-06-16 23:48:37', '2022-06-16 23:48:37'),
(35, 42, '2022-06-16 23:48:42', '2022-06-16 23:48:42'),
(36, 42, '2022-06-17 20:03:55', '2022-06-17 20:03:55'),
(37, 42, '2022-06-17 20:03:58', '2022-06-17 20:03:58'),
(38, 42, '2022-06-20 11:04:14', '2022-06-20 11:04:14'),
(39, 42, '2022-06-20 11:04:19', '2022-06-20 11:04:19'),
(40, 88, '2022-06-20 20:16:54', '2022-06-20 20:16:54'),
(41, 42, '2022-06-28 02:19:14', '2022-06-28 02:19:14'),
(42, 45, '2022-06-29 22:24:58', '2022-06-29 22:24:58'),
(43, 23, '2022-07-02 20:20:38', '2022-07-02 20:20:38'),
(44, 23, '2022-07-02 20:21:23', '2022-07-02 20:21:23'),
(45, 108, '2022-07-05 17:05:23', '2022-07-05 17:05:23'),
(46, 96, '2022-07-05 21:05:15', '2022-07-05 21:05:15'),
(47, 96, '2022-07-05 21:08:00', '2022-07-05 21:08:00'),
(48, 115, '2022-07-10 14:29:11', '2022-07-10 14:29:11'),
(49, 115, '2022-07-10 14:30:02', '2022-07-10 14:30:02'),
(50, 115, '2022-07-10 14:30:16', '2022-07-10 14:30:16'),
(51, 103, '2022-07-21 21:09:16', '2022-07-21 21:09:16'),
(52, 14, '2022-07-21 22:27:04', '2022-07-21 22:27:04'),
(53, 42, '2022-07-22 06:13:00', '2022-07-22 06:13:00'),
(54, 42, '2022-07-29 04:05:45', '2022-07-29 04:05:45'),
(55, 42, '2022-08-08 13:33:50', '2022-08-08 13:33:50'),
(56, 42, '2022-08-08 13:33:54', '2022-08-08 13:33:54'),
(57, 42, '2022-08-11 12:23:17', '2022-08-11 12:23:17'),
(58, 124, '2022-08-14 02:06:44', '2022-08-14 02:06:44'),
(59, 125, '2022-08-22 06:09:32', '2022-08-22 06:09:32'),
(60, 125, '2022-08-22 06:10:34', '2022-08-22 06:10:34'),
(61, 131, '2022-09-10 04:17:27', '2022-09-10 04:17:27'),
(62, 136, '2022-09-11 01:04:10', '2022-09-11 01:04:10'),
(63, 138, '2022-09-11 08:05:53', '2022-09-11 08:05:53'),
(64, 134, '2022-09-11 20:10:18', '2022-09-11 20:10:18'),
(65, 81, '2022-09-12 07:58:59', '2022-09-12 07:58:59'),
(66, 81, '2022-09-12 07:59:55', '2022-09-12 07:59:55'),
(67, 81, '2022-09-12 08:03:20', '2022-09-12 08:03:20'),
(68, 143, '2022-09-17 22:32:29', '2022-09-17 22:32:29'),
(69, 145, '2022-09-18 04:35:03', '2022-09-18 04:35:03'),
(70, 140, '2022-09-18 21:08:28', '2022-09-18 21:08:28'),
(71, 142, '2022-09-21 22:06:18', '2022-09-21 22:06:18'),
(72, 134, '2022-09-25 19:31:29', '2022-09-25 19:31:29'),
(73, 134, '2022-09-25 19:31:47', '2022-09-25 19:31:47'),
(74, 150, '2022-09-27 01:11:29', '2022-09-27 01:11:29'),
(75, 42, '2022-09-27 05:57:02', '2022-09-27 05:57:02'),
(76, 127, '2022-09-29 20:54:31', '2022-09-29 20:54:31'),
(77, 152, '2022-09-30 22:28:37', '2022-09-30 22:28:37'),
(78, 53, '2022-10-01 16:29:11', '2022-10-01 16:29:11'),
(81, 167, '2022-10-04 20:46:49', '2022-10-04 20:46:49'),
(82, 167, '2022-10-04 20:46:57', '2022-10-04 20:46:57'),
(83, 162, '2022-10-05 01:45:50', '2022-10-05 01:45:50'),
(84, 162, '2022-10-05 01:46:40', '2022-10-05 01:46:40'),
(85, 166, '2022-10-05 20:26:10', '2022-10-05 20:26:10'),
(86, 146, '2022-10-07 06:56:04', '2022-10-07 06:56:04'),
(87, 162, '2022-10-09 22:47:55', '2022-10-09 22:47:55'),
(88, 162, '2022-10-09 22:48:06', '2022-10-09 22:48:06'),
(89, 162, '2022-10-09 23:15:39', '2022-10-09 23:15:39'),
(90, 42, '2022-10-23 20:06:21', '2022-10-23 20:06:21'),
(91, 16, '2022-10-28 08:36:55', '2022-10-28 08:36:55'),
(92, 96, '2022-10-29 07:53:03', '2022-10-29 07:53:03'),
(93, 186, '2022-10-30 05:55:16', '2022-10-30 05:55:16'),
(94, 187, '2022-11-02 23:04:07', '2022-11-02 23:04:07'),
(95, 189, '2022-11-04 00:11:07', '2022-11-04 00:11:07'),
(96, 190, '2022-11-04 03:21:59', '2022-11-04 03:21:59'),
(97, 195, '2022-11-10 19:52:12', '2022-11-10 19:52:12');

-- --------------------------------------------------------

--
-- Table structure for table `experience_certificate_prints_number`
--

CREATE TABLE `experience_certificate_prints_number` (
  `id` int(11) NOT NULL,
  `volunteer_id` bigint(20) UNSIGNED NOT NULL,
  `prints_number` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `experience_certificate_prints_number`
--

INSERT INTO `experience_certificate_prints_number` (`id`, `volunteer_id`, `prints_number`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2022-05-11 15:11:12', '2022-05-12 01:52:16'),
(2, 2, 1, '2022-05-11 15:31:04', '2022-05-14 02:34:01'),
(4, 4, 0, '2022-05-12 00:27:44', '2022-05-12 00:27:44'),
(5, 5, 1, '2022-05-12 00:50:12', '2022-05-12 01:32:14'),
(6, 6, 1, '2022-05-12 14:28:03', '2022-05-16 20:29:57'),
(7, 7, 0, '2022-05-13 08:58:41', '2022-05-13 08:58:41'),
(8, 8, 1, '2022-05-14 00:53:04', '2022-05-14 03:15:01'),
(9, 9, 0, '2022-05-14 02:57:39', '2022-05-14 02:57:39'),
(10, 10, 0, '2022-05-14 03:26:26', '2022-05-14 03:26:26'),
(11, 11, 1, '2022-05-14 03:28:31', '2022-05-14 05:57:58'),
(12, 12, 2, '2022-05-14 03:31:05', '2022-05-14 06:05:10'),
(13, 13, 0, '2022-05-14 03:32:43', '2022-05-14 03:32:43'),
(14, 14, 2, '2022-05-14 03:34:15', '2022-07-21 22:27:04'),
(15, 15, 0, '2022-05-14 03:35:21', '2022-05-14 03:35:21'),
(16, 16, 1, '2022-05-14 03:35:40', '2022-10-28 08:36:55'),
(17, 17, 0, '2022-05-14 03:35:57', '2022-05-14 03:35:57'),
(18, 18, 1, '2022-05-14 03:39:36', '2022-05-14 04:49:09'),
(19, 19, 0, '2022-05-14 03:46:47', '2022-05-14 03:46:47'),
(20, 20, 0, '2022-05-14 03:47:46', '2022-05-14 03:47:46'),
(22, 22, 0, '2022-05-14 03:54:56', '2022-05-14 03:54:56'),
(23, 23, 2, '2022-05-14 03:55:25', '2022-07-02 20:21:23'),
(24, 24, 0, '2022-05-14 03:57:15', '2022-05-14 03:57:15'),
(26, 26, 0, '2022-05-14 04:03:33', '2022-05-14 04:03:33'),
(27, 27, 0, '2022-05-14 04:05:55', '2022-05-14 04:05:55'),
(28, 28, 2, '2022-05-14 04:13:40', '2022-05-14 04:17:16'),
(29, 29, 0, '2022-05-14 04:19:39', '2022-05-14 04:19:39'),
(30, 30, 0, '2022-05-14 04:32:10', '2022-05-14 04:32:10'),
(31, 31, 0, '2022-05-14 04:33:51', '2022-05-14 04:33:51'),
(32, 32, 0, '2022-05-14 04:35:35', '2022-05-14 04:35:35'),
(33, 33, 0, '2022-05-14 04:37:10', '2022-05-14 04:37:10'),
(34, 34, 0, '2022-05-14 04:38:30', '2022-05-14 04:38:30'),
(35, 35, 0, '2022-05-14 04:38:50', '2022-05-14 04:38:50'),
(36, 36, 0, '2022-05-14 04:45:27', '2022-05-14 04:45:27'),
(37, 37, 0, '2022-05-14 04:49:33', '2022-05-14 04:49:33'),
(38, 38, 0, '2022-05-14 05:07:02', '2022-05-14 05:07:02'),
(39, 39, 0, '2022-05-14 05:25:38', '2022-05-14 05:25:38'),
(40, 40, 0, '2022-05-14 05:31:50', '2022-05-14 05:31:50'),
(41, 41, 0, '2022-05-14 05:41:26', '2022-05-14 05:41:26'),
(42, 42, 22, '2022-05-14 06:03:15', '2022-10-23 20:06:21'),
(43, 43, 0, '2022-05-14 07:17:51', '2022-05-14 07:17:51'),
(44, 44, 0, '2022-05-14 08:14:47', '2022-05-14 08:14:47'),
(45, 45, 1, '2022-05-14 09:58:48', '2022-06-29 22:24:58'),
(46, 46, 0, '2022-05-14 13:17:31', '2022-05-14 13:17:31'),
(47, 47, 0, '2022-05-14 19:19:20', '2022-05-14 19:19:20'),
(48, 48, 0, '2022-05-14 23:01:23', '2022-05-14 23:01:23'),
(49, 49, 0, '2022-05-15 00:46:47', '2022-05-15 00:46:47'),
(50, 50, 0, '2022-05-15 23:08:36', '2022-05-15 23:08:36'),
(51, 51, 1, '2022-05-20 23:16:31', '2022-05-22 09:44:07'),
(52, 52, 0, '2022-05-22 02:56:54', '2022-05-22 02:56:54'),
(53, 53, 4, '2022-05-22 19:53:09', '2022-10-01 16:29:11'),
(54, 54, 0, '2022-05-24 15:51:26', '2022-05-24 15:51:26'),
(55, 55, 0, '2022-06-08 03:40:03', '2022-06-08 03:40:03'),
(56, 56, 0, '2022-06-08 04:34:13', '2022-06-08 04:34:13'),
(57, 57, 1, '2022-06-08 05:14:16', '2022-06-10 13:34:44'),
(58, 58, 1, '2022-06-08 07:35:57', '2022-06-10 21:07:38'),
(60, 60, 1, '2022-06-09 04:07:54', '2022-06-13 03:47:01'),
(61, 61, 1, '2022-06-09 05:43:23', '2022-06-12 05:31:21'),
(63, 63, 0, '2022-06-09 21:21:32', '2022-06-09 21:21:32'),
(64, 64, 0, '2022-06-11 04:20:59', '2022-06-11 04:20:59'),
(65, 65, 0, '2022-06-11 05:39:09', '2022-06-11 05:39:09'),
(66, 66, 0, '2022-06-11 05:45:54', '2022-06-11 05:45:54'),
(67, 67, 0, '2022-06-11 07:27:26', '2022-06-11 07:27:26'),
(68, 68, 0, '2022-06-11 08:04:58', '2022-06-11 08:04:58'),
(69, 69, 0, '2022-06-12 03:22:05', '2022-06-12 03:22:05'),
(70, 70, 0, '2022-06-12 04:07:12', '2022-06-12 04:07:12'),
(71, 71, 0, '2022-06-12 04:57:01', '2022-06-12 04:57:01'),
(74, 74, 0, '2022-06-12 09:43:03', '2022-06-12 09:43:03'),
(75, 75, 1, '2022-06-12 17:45:27', '2022-06-13 17:09:11'),
(76, 76, 0, '2022-06-12 21:41:01', '2022-06-12 21:41:01'),
(77, 77, 0, '2022-06-12 23:10:19', '2022-06-12 23:10:19'),
(78, 78, 0, '2022-06-12 23:14:22', '2022-06-12 23:14:22'),
(79, 79, 0, '2022-06-12 23:14:40', '2022-06-12 23:14:40'),
(80, 80, 0, '2022-06-12 23:26:47', '2022-06-12 23:26:47'),
(81, 81, 3, '2022-06-12 23:29:55', '2022-09-12 08:03:20'),
(82, 82, 0, '2022-06-12 23:59:53', '2022-06-12 23:59:53'),
(83, 83, 0, '2022-06-13 00:13:12', '2022-06-13 00:13:12'),
(85, 85, 0, '2022-06-13 02:51:30', '2022-06-13 02:51:30'),
(86, 86, 0, '2022-06-13 03:16:57', '2022-06-13 03:16:57'),
(88, 88, 1, '2022-06-13 03:42:15', '2022-06-20 20:16:54'),
(89, 89, 0, '2022-06-13 04:34:56', '2022-06-13 04:34:56'),
(91, 91, 0, '2022-06-13 13:41:45', '2022-06-13 13:41:45'),
(92, 92, 0, '2022-06-13 15:56:03', '2022-06-13 15:56:03'),
(93, 93, 0, '2022-06-13 22:28:34', '2022-06-13 22:28:34'),
(94, 94, 0, '2022-06-13 22:40:41', '2022-06-13 22:40:41'),
(95, 95, 0, '2022-06-13 22:54:49', '2022-06-13 22:54:49'),
(96, 96, 3, '2022-06-14 16:43:27', '2022-10-29 07:53:03'),
(98, 98, 0, '2022-06-15 04:49:12', '2022-06-15 04:49:12'),
(99, 99, 0, '2022-06-18 06:58:10', '2022-06-18 06:58:10'),
(100, 100, 0, '2022-06-21 05:18:54', '2022-06-21 05:18:54'),
(101, 101, 0, '2022-06-22 01:34:22', '2022-06-22 01:34:22'),
(102, 102, 0, '2022-06-22 16:36:08', '2022-06-22 16:36:08'),
(103, 103, 1, '2022-06-24 08:21:29', '2022-07-21 21:09:16'),
(104, 104, 0, '2022-06-24 22:08:49', '2022-06-24 22:08:49'),
(105, 105, 0, '2022-06-24 22:12:47', '2022-06-24 22:12:47'),
(106, 106, 0, '2022-06-24 23:12:18', '2022-06-24 23:12:18'),
(107, 107, 0, '2022-06-25 04:31:21', '2022-06-25 04:31:21'),
(108, 108, 1, '2022-06-26 16:48:33', '2022-07-05 17:05:23'),
(109, 109, 0, '2022-06-26 16:58:57', '2022-06-26 16:58:57'),
(110, 110, 0, '2022-06-26 23:35:02', '2022-06-26 23:35:02'),
(111, 111, 0, '2022-06-28 17:49:53', '2022-06-28 17:49:53'),
(112, 112, 0, '2022-06-28 19:16:24', '2022-06-28 19:16:24'),
(113, 113, 0, '2022-06-29 14:23:53', '2022-06-29 14:23:53'),
(114, 114, 0, '2022-06-30 02:42:08', '2022-06-30 02:42:08'),
(115, 115, 3, '2022-06-30 14:28:18', '2022-07-10 14:30:16'),
(116, 116, 0, '2022-07-02 23:29:47', '2022-07-02 23:29:47'),
(117, 117, 0, '2022-07-04 19:58:40', '2022-07-04 19:58:40'),
(118, 118, 0, '2022-07-20 11:38:18', '2022-07-20 11:38:18'),
(119, 119, 0, '2022-07-28 19:36:20', '2022-07-28 19:36:20'),
(120, 120, 0, '2022-08-01 16:12:46', '2022-08-01 16:12:46'),
(121, 121, 0, '2022-08-01 16:13:34', '2022-08-01 16:13:34'),
(122, 122, 0, '2022-08-04 06:25:44', '2022-08-04 06:25:44'),
(123, 123, 0, '2022-08-07 02:09:53', '2022-08-07 02:09:53'),
(124, 124, 1, '2022-08-07 17:58:22', '2022-08-14 02:06:44'),
(125, 125, 2, '2022-08-18 04:28:41', '2022-08-22 06:10:34'),
(126, 126, 0, '2022-08-27 02:19:01', '2022-08-27 02:19:01'),
(127, 127, 1, '2022-08-27 03:54:29', '2022-09-29 20:54:31'),
(128, 128, 0, '2022-08-27 19:59:55', '2022-08-27 19:59:55'),
(129, 129, 0, '2022-08-31 01:58:47', '2022-08-31 01:58:47'),
(131, 131, 1, '2022-09-05 04:18:49', '2022-09-10 04:17:27'),
(133, 133, 0, '2022-09-08 23:54:14', '2022-09-08 23:54:14'),
(134, 134, 3, '2022-09-10 00:22:45', '2022-09-25 19:31:47'),
(135, 135, 0, '2022-09-10 01:01:31', '2022-09-10 01:01:31'),
(136, 136, 1, '2022-09-11 00:09:37', '2022-09-11 01:04:10'),
(137, 137, 0, '2022-09-11 05:00:07', '2022-09-11 05:00:07'),
(138, 138, 1, '2022-09-11 07:44:15', '2022-09-11 08:05:53'),
(140, 140, 1, '2022-09-12 01:45:56', '2022-09-18 21:08:28'),
(141, 141, 0, '2022-09-12 04:42:22', '2022-09-12 04:42:22'),
(142, 142, 1, '2022-09-12 06:25:29', '2022-09-21 22:06:18'),
(143, 143, 1, '2022-09-12 12:34:35', '2022-09-17 22:32:29'),
(144, 144, 0, '2022-09-13 09:14:11', '2022-09-13 09:14:11'),
(145, 145, 1, '2022-09-13 16:20:23', '2022-09-18 04:35:03'),
(146, 146, 1, '2022-09-19 14:47:50', '2022-10-07 06:56:04'),
(147, 147, 0, '2022-09-20 06:09:25', '2022-09-20 06:09:25'),
(148, 148, 0, '2022-09-20 06:33:28', '2022-09-20 06:33:28'),
(150, 150, 1, '2022-09-26 03:13:04', '2022-09-27 01:11:29'),
(151, 151, 0, '2022-09-27 03:09:32', '2022-09-27 03:09:32'),
(152, 152, 1, '2022-09-27 04:32:07', '2022-09-30 22:28:37'),
(153, 153, 0, '2022-09-28 01:39:00', '2022-09-28 01:39:00'),
(154, 154, 0, '2022-09-29 01:43:24', '2022-09-29 01:43:24'),
(155, 155, 0, '2022-09-29 02:40:27', '2022-09-29 02:40:27'),
(156, 156, 0, '2022-09-29 13:49:34', '2022-09-29 13:49:34'),
(157, 157, 0, '2022-09-29 20:51:59', '2022-09-29 20:51:59'),
(158, 158, 0, '2022-10-03 02:28:58', '2022-10-03 02:28:58'),
(159, 159, 0, '2022-10-03 08:40:02', '2022-10-03 08:40:02'),
(160, 160, 0, '2022-10-03 19:27:30', '2022-10-03 19:27:30'),
(162, 162, 5, '2022-10-04 03:17:46', '2022-10-09 23:15:38'),
(164, 164, 0, '2022-10-04 04:30:17', '2022-10-04 04:30:17'),
(165, 165, 0, '2022-10-04 06:20:14', '2022-10-04 06:20:14'),
(166, 166, 1, '2022-10-04 08:54:31', '2022-10-05 20:26:10'),
(167, 167, 2, '2022-10-04 08:56:12', '2022-10-04 20:46:57'),
(169, 169, 0, '2022-10-05 04:28:14', '2022-10-05 04:28:14'),
(171, 171, 0, '2022-10-06 00:22:55', '2022-10-06 00:22:55'),
(172, 172, 0, '2022-10-06 00:46:56', '2022-10-06 00:46:56'),
(173, 173, 0, '2022-10-06 02:07:19', '2022-10-06 02:07:19'),
(174, 174, 0, '2022-10-06 23:35:58', '2022-10-06 23:35:58'),
(175, 175, 0, '2022-10-09 06:16:37', '2022-10-09 06:16:37'),
(176, 176, 0, '2022-10-11 02:53:55', '2022-10-11 02:53:55'),
(177, 177, 0, '2022-10-12 16:28:19', '2022-10-12 16:28:19'),
(179, 179, 0, '2022-10-15 04:32:39', '2022-10-15 04:32:39'),
(180, 180, 0, '2022-10-15 20:37:57', '2022-10-15 20:37:57'),
(181, 181, 0, '2022-10-16 01:27:37', '2022-10-16 01:27:37'),
(183, 183, 0, '2022-10-17 09:22:55', '2022-10-17 09:22:55'),
(184, 184, 0, '2022-10-22 05:07:16', '2022-10-22 05:07:16'),
(185, 185, 0, '2022-10-23 02:27:05', '2022-10-23 02:27:05'),
(186, 186, 1, '2022-10-25 04:49:40', '2022-10-30 05:55:16'),
(187, 187, 1, '2022-10-27 00:32:26', '2022-11-02 23:04:07'),
(188, 188, 0, '2022-10-29 02:52:48', '2022-10-29 02:52:48'),
(189, 189, 1, '2022-10-31 15:58:27', '2022-11-04 00:11:07'),
(190, 190, 1, '2022-10-31 17:47:01', '2022-11-04 03:21:59'),
(191, 191, 0, '2022-10-31 17:56:35', '2022-10-31 17:56:35'),
(192, 192, 0, '2022-11-02 21:25:52', '2022-11-02 21:25:52'),
(193, 193, 0, '2022-11-07 14:46:56', '2022-11-07 14:46:56'),
(194, 194, 0, '2022-11-07 22:37:04', '2022-11-07 22:37:04'),
(195, 195, 1, '2022-11-08 01:18:43', '2022-11-10 19:52:12'),
(196, 196, 0, '2022-11-08 07:39:55', '2022-11-08 07:39:55'),
(197, 197, 0, '2022-11-08 19:44:38', '2022-11-08 19:44:38'),
(198, 198, 0, '2022-11-09 17:16:54', '2022-11-09 17:16:54'),
(199, 199, 0, '2022-11-09 17:23:47', '2022-11-09 17:23:47'),
(200, 200, 0, '2022-11-09 18:04:56', '2022-11-09 18:04:56'),
(201, 201, 0, '2022-11-11 23:10:18', '2022-11-11 23:10:18');

-- --------------------------------------------------------

--
-- Table structure for table `experience_certificate_settings`
--

CREATE TABLE `experience_certificate_settings` (
  `id` int(11) NOT NULL,
  `print_after_period` varchar(255) DEFAULT NULL,
  `prints_number` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `experience_certificate_settings`
--

INSERT INTO `experience_certificate_settings` (`id`, `print_after_period`, `prints_number`, `created_at`, `updated_at`) VALUES
(1, '100', '20', '2022-05-11 15:24:31', '2022-05-11 15:24:31');

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `id` int(11) NOT NULL,
  `field` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fields`
--

INSERT INTO `fields` (`id`, `field`, `created_at`, `updated_at`) VALUES
(5, 'مجال الإدارة', '2022-03-06 21:54:47', '2022-05-08 06:35:36'),
(6, 'مجال الإعلام', '2022-03-06 21:55:00', '2022-05-08 06:35:25'),
(7, 'مجال التربية', '2022-04-02 15:37:01', '2022-05-08 06:35:01'),
(8, 'مجال علم النفس', '2022-05-08 06:34:49', '2022-05-08 06:34:49'),
(9, 'مجال العلاقات العامة', '2022-05-08 06:35:51', '2022-05-08 06:35:51'),
(10, 'مجال التصميم', '2022-05-12 00:13:52', '2022-05-12 00:13:52'),
(11, 'مجال خدمة العملاء', '2022-05-12 00:32:41', '2022-05-12 00:32:41'),
(12, 'مجال الأنشطة المجتمعية', '2022-05-14 03:56:48', '2022-05-14 03:56:48'),
(13, 'وظيفة مراسلة', '2022-05-21 08:17:34', '2022-05-21 08:17:34'),
(14, 'وظيفة سائق', '2022-05-21 08:17:45', '2022-05-21 08:17:45');

-- --------------------------------------------------------

--
-- Table structure for table `index_content`
--

CREATE TABLE `index_content` (
  `id` int(11) NOT NULL,
  `title` text DEFAULT NULL,
  `beneficiaries_text` longtext DEFAULT NULL,
  `volunteers_text` longtext DEFAULT NULL,
  `orders_text` longtext DEFAULT NULL,
  `jobs_text` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `index_content`
--

INSERT INTO `index_content` (`id`, `title`, `beneficiaries_text`, `volunteers_text`, `orders_text`, `jobs_text`, `created_at`, `updated_at`) VALUES
(1, 'خدمات جمعية نور نجران النسائية بين يديك', 'إستفد من خدماتنا المجانية', 'تطوع معنا', 'نسعد بخدمتكم', 'المكان المناسب لك', '2022-03-17 21:03:24', '2022-03-25 21:41:48');

-- --------------------------------------------------------

--
-- Table structure for table `informations`
--

CREATE TABLE `informations` (
  `id` int(11) NOT NULL,
  `address` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `terms` longtext DEFAULT NULL,
  `policy` longtext DEFAULT NULL,
  `facebook` text DEFAULT NULL,
  `instagram` text DEFAULT NULL,
  `twitter` text DEFAULT NULL,
  `telegram` text DEFAULT NULL,
  `snapchat` text DEFAULT NULL,
  `website` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `informations`
--

INSERT INTO `informations` (`id`, `address`, `email`, `phone_number`, `terms`, `policy`, `facebook`, `instagram`, `twitter`, `telegram`, `snapchat`, `website`, `created_at`, `updated_at`) VALUES
(1, 'المملكة العربية السعودية  شرق الضيافة  نجران 66271', 'noornajran.sa@gmail.com', '966556431127', 'شروط الاستخدام الخاصة بالمتطوعين والمستفيدين/\r\n- يتم إرفاق سند التحويل كشرط أساسي لتفعيل العضوية.\r\n- يمكن طلب تجديد العضوية لمدة سنة أو سنتين أو ثلاث سنوات.\r\n- يتم إرفاق صورة التقرير الطبي وصورة الهوية  كشرط أساسي لقبول المستفيدين.\r\n- يمكن للمستفيدين رفع الطلبات عن طريق أيقونة الطلبات.\r\n\r\nشروط الاستخدام الخاصة بالأخصائيين والباحثين عن عمل/\r\n- يمكن التقديم على الوظائف المطروحة من قبل الجمعية أو التقديم على طلب وظيفة بشكل عام.\r\n- يتم إرفاق السيرة الذاتية كشرط أساسي للتقديم على الوظائف.\r\n- يمكن للأخصائي كتابة تقرير وإرساله للمستفيد، ويمكن للمستفيد طباعة التقرير.', 'يتم استخدام البيانات والمعلومات الخاصة بكل من المستفيدين والمتطوعين والباحثين عن عمل والأخصائيين وفق سياسة الخصوصية وسرية المعلومات، حيث لا يتم استخدام المعلومات والبيانات والتقارير إلا لأغراض تقديم الخدمة والفرز والتسكين.\r\nكما لا يتم بأي شكل من الأشكال الإفصاح عن المعلومات والبيانات والتقارير، ويتم جمع المعلومات وفرزها وتعريفها بشكل إلكتروني وفق معرفّات خاصة تحت إشراف فريق مختص.', 'https://www.facebook.com/noor.najran', 'https://instagram.com/noornajran_sa?igshid=f0oy9qbvj3ue', 'https://twitter.com/noornajach?s=21', 'https://t.me/joinchat/AAAAAEStuMr99xDpw3jWaw', 'https://t.snapchat.com/QedWt6UZ', 'https://noornajran.sa', '2022-03-17 16:15:01', '2022-06-14 03:42:55');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `qualification_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `second_name` varchar(255) NOT NULL,
  `third_name` varchar(255) NOT NULL,
  `fourth_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `record` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `cv` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `field_id`, `qualification_id`, `first_name`, `second_name`, `third_name`, `fourth_name`, `email`, `record`, `phone_number`, `cv`, `created_at`, `updated_at`) VALUES
(1, 6, 5, 'امنه', 'حسين', 'حسين', 'مباركي', 'mbarkymrhba@gmail.com', '1052249131', '0552216199', 'uploads/cvs/1/IMG_٢٠٢٢٠١٠٦_٠٦٤٣٣٢.jpg', '2022-05-18 18:50:40', '2022-05-18 18:50:40'),
(2, 11, 5, 'امنه', 'حسين', 'حسين', 'مباركي', 'mbarkymrhba@gmail.com', '1052249131', '966552216199', 'uploads/cvs/2/IMG_٢٠٢٢٠١٠٢_١٤٣٤٠٤.jpg', '2022-05-18 18:59:21', '2022-05-18 18:59:21'),
(3, 9, 5, 'مشاعل', 'مهدي', 'محمد', 'اليامي', 'Shool1410@hotmail.com', '1066040617', '966558896116', 'uploads/cvs/3/Kingdom of Saudi Arabia.pdf', '2022-05-18 19:50:26', '2022-05-18 19:50:26'),
(4, 7, 2, 'محسن', 'حمد', 'علي', 'الكربي', 'mhsnh4025@gmail.com', '1053048417', '966534449313', 'uploads/cvs/4/صورة.pdf', '2022-05-19 05:14:24', '2022-05-19 05:14:26'),
(5, 8, 5, 'اسمهان', 'فارس', 'حمذ', 'ال منصور', 'asmahan6300@gmail.com', '1106504333', '966508303463', 'uploads/cvs/5/السيرة الذاتيه.pdf', '2022-05-22 17:45:25', '2022-05-22 17:45:25'),
(6, 5, 5, 'رفعه', 'سالم', 'محمد', 'بالحارث', 'roofs3@hotmail.com', '1087988794', '966556750426', 'uploads/cvs/6/السيرة الذاتية رفعه بالحارث ....pdf', '2022-05-22 17:59:17', '2022-05-22 17:59:17'),
(7, 8, 5, 'بتول', 'عامر', 'مقبل', 'ال مستنير', 'btool21_9@hotmail.com', '1106203423', '966555831704', 'uploads/cvs/7/السيره الذاتيه بتول .pdf', '2022-05-22 18:00:27', '2022-05-22 18:00:27'),
(8, 5, 5, 'هنوف', 'مانع', 'حمد', 'ال مردف', 'hnomana1122@hotmail.com', '1085192043', '966552942741', 'uploads/cvs/8/cv hanouf(١).pdf', '2022-05-22 18:05:26', '2022-05-22 18:05:26'),
(9, 5, 4, 'علي', 'مانع', 'صالح', 'ال مستنير', 'alimane10@hotmail.com', '1031882804', '966542700770', 'uploads/cvs/9/CamScanner 01-04-2021 15.21(1).pdf', '2022-05-22 18:29:10', '2022-05-22 18:29:10'),
(10, 13, 3, 'خيريه', 'موسى', 'احمد', 'القحطاني', 'oma7madk@gmail.com', '1071388639', '532882910', 'uploads/cvs/10/ملاحظة جديدة.pdf', '2022-05-22 19:20:50', '2022-05-22 19:20:50'),
(11, 5, 5, 'أماني', 'عبدالله', 'علي', 'ال زندان', 'a.0911@hotmail.com', '1063224883', '0535625299', 'uploads/cvs/11/IMG_5478.pdf', '2022-05-22 19:39:21', '2022-05-22 19:39:21'),
(12, 5, 5, 'خلود', 'عبدالله', 'محمد', 'القرني', 'kholodalqarni7@gmail.com', '1103986335', '966504181171', 'uploads/cvs/12/CV 2..pdf', '2022-05-22 20:16:18', '2022-05-22 20:16:21'),
(13, 5, 5, 'فاطمة', 'علي', 'محمد', 'ال مهري', 'shgrdy55@hotmail.com', '1098434937', '966538112450', 'uploads/cvs/13/سي في.pdf', '2022-05-22 20:17:27', '2022-05-22 20:17:27'),
(14, 7, 5, 'مريم', 'محمد', 'حسين', 'الحقوي', 'msmemoo1990@gmail.com', '1065696815', '966538681600', 'uploads/cvs/14/d870afdf-3c01-4829-b6fa-355288412e32 (PDF).pdf', '2022-05-22 20:51:39', '2022-05-22 20:51:39'),
(15, 7, 5, 'مريم', 'محمد', 'حسين', 'الحقوي', 'msmemoo1990@gmail.com', '1065696815', '966538681600', 'uploads/cvs/15/d870afdf-3c01-4829-b6fa-355288412e32 (PDF).pdf', '2022-05-22 20:51:39', '2022-05-22 20:51:39'),
(16, 5, 5, 'نعمة', 'ظافر', 'حسين', 'آل جعرة', 'nemeh36@icloud.com', '1087831887', '0505132294', 'uploads/cvs/16/temp70.pdf', '2022-05-22 21:47:27', '2022-05-22 21:47:27'),
(17, 5, 4, 'اميره', 'ظافر', 'حسين', 'آل جعره', 'shahad900@icloud.com', '1101290557', '966507550427', 'uploads/cvs/17/temp70.pdf', '2022-05-22 22:14:14', '2022-05-22 22:14:14'),
(18, 8, 5, 'امل', 'أحمد', 'صالح', 'النجراني', 'am5414995@gmail.com', '1096995947', '966551425479', 'uploads/cvs/18/سيرة ذاتيه 2 2.pdf', '2022-05-22 22:19:52', '2022-05-22 22:19:52'),
(19, 12, 4, 'جواهر', 'حسن', 'ظافر', 'ال بحري', 'jwwahar@gmail.com', '1107349480', '966562592967', 'uploads/cvs/19/السيرة الذاتية .pdf', '2022-05-22 22:23:39', '2022-05-22 22:23:39'),
(20, 8, 5, 'ساره', 'محمد', 'صالح', 'ال حوكاش', 'sarahmmss1997@gmail.com', '1093706396', '966507434475', 'uploads/cvs/20/سيرة ذاتية.pdf', '2022-05-22 22:27:46', '2022-05-22 22:27:46'),
(21, 5, 5, 'نوف', 'صالح', 'محمد', 'ال حويل', 'Noufsaleh.najran@outlook.sa', '1049934688', '966507952215', 'uploads/cvs/21/سيرتي الذاتية نوف.pdf', '2022-05-22 23:49:34', '2022-05-22 23:49:34'),
(22, 7, 6, 'امل', 'عزت', 'جوده', 'محمد', 'mostafahassan1970@gmail.com', '2101885362', '966507557850', 'uploads/cvs/22/IMG_20220418_000141_048.jpg', '2022-05-23 00:35:57', '2022-05-23 00:35:57'),
(23, 7, 6, 'امل', 'عزت', 'جوده', 'محمد', 'mostafahassan1970@gmail.com', '2101885362', '966507557850', 'uploads/cvs/23/IMG_20220418_000141_048.jpg', '2022-05-23 00:38:57', '2022-05-23 00:38:57'),
(24, 5, 5, 'ولاء', 'حسن', 'عبدالله', 'ال سالم', 'dropreemy@gmail.com', '1102407671', '0557368243', 'uploads/cvs/24/IMG_0182.pdf', '2022-05-23 01:37:27', '2022-05-23 01:37:27'),
(25, 12, 5, 'عمرانه', 'مثني', 'حسين', 'قاضي', 'Omranah2030h@gmail.com', '1039335730', '966562493891', 'uploads/cvs/25/السيرة .pdf', '2022-05-23 02:19:02', '2022-05-23 02:19:02'),
(26, 5, 5, 'عمرانه', 'مثني', 'حسين', 'قاضي', 'Omranah2030h@gmail.com', '1039335730', '966562493891', 'uploads/cvs/26/السيرة .pdf', '2022-05-23 02:22:08', '2022-05-23 02:22:08'),
(27, 5, 5, 'عمرانه', 'مثني', 'حسين', 'قاضي', 'Omranah2030h@gmail.com', '1039335730', '966562493891', 'uploads/cvs/27/السيرة .pdf', '2022-05-23 02:25:25', '2022-05-23 02:25:25'),
(28, 11, 5, 'إيمان', 'صالح', 'عبدالله', 'ال قضيع', 'lost_heart505@hotmail.com', '1067929990', '966555849423', 'uploads/cvs/28/ايمان 2.pdf', '2022-05-23 02:38:03', '2022-05-23 02:38:03'),
(29, 5, 5, 'إيمان', 'صالح', 'عبدالله', 'ال قضيع', 'hdldhdld0555849423@yahoo.com', '1067929990', '966555849423', 'uploads/cvs/29/ايمان 2.pdf', '2022-05-23 02:50:48', '2022-05-23 02:50:49'),
(30, 5, 5, 'نبيله', 'حمد', 'هادي', 'اليامي', 'nabeela2018n@gmail.com', '1105399545', '966555269084', 'uploads/cvs/30/صورة 3.pdf', '2022-05-23 09:34:27', '2022-05-23 09:34:27'),
(31, 5, 5, 'نبيله', 'حمد', 'هادي', 'اليامي', 'nabeela2018n@gmail.com', '1105399545', '966555269084', 'uploads/cvs/31/صورة 3.pdf', '2022-05-23 09:34:31', '2022-05-23 09:34:31'),
(32, 5, 5, 'العنود', 'صالح', 'حمد', 'ال دغرير', 'alanoudx.49@gmail.com', '1085366282', '966501409508', 'uploads/cvs/32/السيرة الذاتية.pdf123.pdf', '2022-05-23 11:02:34', '2022-05-23 11:02:34'),
(33, 5, 5, 'العنود', 'صالح', 'حمد', 'ال دغرير', 'alanoudx.49@gmail.com', '1085366282', '966501409508', 'uploads/cvs/33/السيرة الذاتية.pdf123.pdf', '2022-05-23 11:02:36', '2022-05-23 11:02:36'),
(34, 5, 5, 'رهام', 'علي', 'صالح', 'ال خريم', 'rhomali1112@gmail.com', '1099529297', '0557447651', 'uploads/cvs/34/CV. .pdf', '2022-05-23 11:30:38', '2022-05-23 11:30:38'),
(35, 5, 5, 'رهام', 'علي', 'صالح', 'ال خريم', 'rhomali1112@gmail.com', '1099529297', '0557447651', 'uploads/cvs/35/CV. .pdf', '2022-05-23 11:35:41', '2022-05-23 11:35:41'),
(36, 5, 4, 'ساره', 'مبارك', 'علي', 'المكاييل', 'qsghdfhe@gmail.com', '1078988779', '966553930975', 'uploads/cvs/36/CamScanner ٠٥-٢٣-٢٠٢٢ ٠٤.٤٥.pdf', '2022-05-23 11:58:18', '2022-05-23 11:58:18'),
(37, 5, 5, 'لينا', 'هادي', 'صالح', 'الجالي', 'linaaljali@gmail.com', '1089884769', '966502582309', 'uploads/cvs/37/9b9c8182-d8e5-451a-acfc-22dca60b1c0c.pdf', '2022-05-23 13:09:32', '2022-05-23 13:09:32'),
(38, 5, 5, 'لطيفه', 'فيصل', 'جابر', 'ابوساق', 'Jooooood2030@gmail.com', '1065624064', '966505818089', 'uploads/cvs/38/السيرة الذاتية لطيفه فيصل ابوساق.pdf', '2022-05-23 18:53:11', '2022-05-23 18:53:14'),
(39, 7, 5, 'نسيمه', 'سمير', 'يحيى', 'المكرمي', 'nnseem77@gmail.com', '1082314863', '966536264069', 'uploads/cvs/39/Screenshot_٢٠٢٢٠٥١٢-٢١٣٢٥٧_All Documents Reader (1).pdf', '2022-05-23 21:34:50', '2022-05-23 21:34:50'),
(40, 7, 5, 'عهود', 'عبدالله', 'محمد', 'الشريف', 'ahood_alshreef@outlook.sa', '1092501202', '966509554513', 'uploads/cvs/40/temp70.pdf', '2022-05-24 02:15:21', '2022-05-24 02:15:21'),
(41, 7, 5, 'رحاب', 'سالم', 'معيض', 'البشيري', 'rehabalz2030@hotmail.com', '1075258325', '966500937378', 'uploads/cvs/41/CamScanner ٠٥-٢٣-٢٠٢٢ ١٧.٥٥.pdf', '2022-05-24 02:16:48', '2022-05-24 02:16:48'),
(42, 5, 4, 'فوزية', 'فلاح', 'ضيف الله', 'ال شيبان', 'foooz718@gmai.com', '1060668678', '966532918894', 'uploads/cvs/42/شهاتي', '2022-05-24 17:05:42', '2022-05-24 17:05:42'),
(43, 5, 4, 'فوزية', 'فلاح', 'ضيف الله', 'ال شيبان', 'foooz718@gmai.com', '1060668678', '966532918894', 'uploads/cvs/43/شهاتي', '2022-05-24 17:06:53', '2022-05-24 17:06:53'),
(44, 5, 5, 'هيا', 'فرج', 'محمد', 'الفهاد', 'haya59599@gmail.com', '1120600414', '0555219039', 'uploads/cvs/44/CV.pdf', '2022-05-31 16:19:14', '2022-05-31 16:19:14'),
(45, 11, 4, 'سلوى', 'صالح', 'حسن', 'ال منصور', 'Sal45678z@icloud.com', '1070284565', '966501552810', 'uploads/cvs/45/سلوى ال منصور.pdf', '2022-06-01 03:21:12', '2022-06-01 03:21:12'),
(46, 5, 4, 'دليل', 'حسين', 'صالح', 'ال قراد', 'd1416d@icloud.com', '1058351659', '966530103168', 'uploads/cvs/46/مستند ممسوح ضوئيًا.pdf', '2022-06-02 00:34:35', '2022-06-02 00:34:37'),
(47, 5, 5, 'خلود', 'صالح', 'حسن', 'ال خريم', 'kookah2213@gmail.com', '1071201352', '966530898565', 'uploads/cvs/47/سيرة خلود (1).pdf', '2022-06-02 04:38:39', '2022-06-02 04:38:39'),
(48, 5, 5, 'مريم', 'محمد', 'منصور', 'اليامي', 'mreamalyami@gmail.com', '1100989498', '0551181485', 'uploads/cvs/48/‏واتساب.pdf', '2022-06-04 17:18:44', '2022-06-04 17:18:44'),
(49, 5, 5, 'مشاعل', 'مهدي', 'محمد', 'اليامي', 'Shool1410@hotmail.com', '1066040617', '966558896116', 'uploads/cvs/49/Whiteboard 6 Jun 2022.pdf', '2022-06-06 20:52:52', '2022-06-06 20:52:52'),
(50, 5, 5, 'مشاعل', 'مهدي', 'محمد', 'اليامي', 'Shool1410@hotmail.com', '1066040617', '966558896116', 'uploads/cvs/50/Whiteboard 6 Jun 2022.pdf', '2022-06-06 20:52:52', '2022-06-06 20:52:52'),
(51, 11, 3, 'نوره', 'حسين', 'صالح', 'ال قراد', 'noran0504724546@gmail.com', '1067810075', '966504724546', 'uploads/cvs/51/السيرة الذاتية.pdf', '2022-06-07 00:56:03', '2022-06-07 00:56:03'),
(52, 10, 5, 'مشاعل', 'مهدي', 'حمد', 'ال بلحارث', 'mshalalyamy918@gmail.com', '1085081345', '0556845149', 'uploads/cvs/52/IMG_20220606_183040.jpg', '2022-06-07 21:21:49', '2022-06-07 21:21:49'),
(53, 12, 5, 'شروق', 'مهدي', 'حمد', 'ال بلحارث', 'shroog.12233@gmail.com', '1071554461', '0530262038', 'uploads/cvs/53/image%3A219748', '2022-06-08 00:27:06', '2022-06-08 00:27:06'),
(54, 10, 5, 'شروق', 'مهدي', 'حمد', 'ال بلحارث', 'shroog.12233@gmail.com', '1071554461', '0530262038', 'uploads/cvs/54/image%3A219748', '2022-06-08 00:29:07', '2022-06-08 00:29:07'),
(55, 5, 5, 'تهاني', 'سليمان', 'سالم', 'الصيعري', 'sthany74@gmail.com', '1070815269', '0534633316', 'uploads/cvs/55/تهاني سليمان سالم الصيعري.pdf', '2022-06-08 01:37:45', '2022-06-08 01:37:45'),
(56, 5, 5, 'تهاني', 'سليمان', 'سالم', 'الصيعري', 'sthany74@gmail.com', '1070815269', '0534633316', 'uploads/cvs/56/تهاني سليمان سالم الصيعري.pdf', '2022-06-08 01:37:48', '2022-06-08 01:37:48'),
(57, 5, 5, 'تهاني', 'سليمان', 'سالم', 'الصيعري', 'sthany74@gmail.com', '1070815269', '0534633316', 'uploads/cvs/57/تهاني سليمان سالم الصيعري.pdf', '2022-06-08 01:37:53', '2022-06-08 01:37:53'),
(58, 5, 5, 'أماني', 'عبدالله', 'علي', 'ال زندان', 'a.0911@hotmail.com', '1063224883', '0535625299', 'uploads/cvs/58/IMG_5478.pdf', '2022-06-08 22:07:04', '2022-06-08 22:07:04'),
(59, 5, 4, 'منيره', 'محمد', 'صالح', 'ال زبر', 'mnyrhm801@gmail.com', '1105505265', '966505913984', 'uploads/cvs/59/منيره (PDF).pdf', '2022-06-09 06:47:54', '2022-06-09 06:47:54'),
(60, 5, 4, 'منيره', 'محمد', 'صالح', 'ال زبر', 'mnyrhm801@gmail.com', '1105505265', '966505913984', 'uploads/cvs/60/منيره (PDF).pdf', '2022-06-09 06:47:56', '2022-06-09 06:47:56'),
(61, 5, 5, 'هنووف', 'محمد', 'علي', 'بالحارث', 'hanoitk.sh@gmail.com', '1059347565', '966500637667', 'uploads/cvs/61/F1B49389-FD57-4EC4-BC95-9086832DF978.pdf', '2022-06-09 17:29:09', '2022-06-09 17:29:09'),
(62, 5, 5, 'هنووف', 'محمد', 'علي', 'بالحارث', 'hanoitk.sh@gmail.com', '1059347565', '966503637667', 'uploads/cvs/62/F1B49389-FD57-4EC4-BC95-9086832DF978.pdf', '2022-06-09 17:31:39', '2022-06-09 17:31:39'),
(63, 14, 3, 'احمد', 'محمد', 'صالح', 'العماري', 'Ahmed.m.s600@gmail.com', '2010857817', '966555728415', 'uploads/cvs/63/VID_20220609_114721.mp4', '2022-06-09 18:48:00', '2022-06-09 18:48:00'),
(64, 14, 3, 'احمد', 'محمد', 'صالح', 'العماري', 'Ahmed.m.s600@gmail.com', '2010857817', '966555728415', 'uploads/cvs/64/VID_20220609_114721.mp4', '2022-06-09 18:48:04', '2022-06-09 18:48:04'),
(65, 11, 5, 'مشاعل', 'مهدي', 'حمد', 'ال بلحارث', 'mshalalyamy918@gmail.com', '1085081345', '0556845149', 'uploads/cvs/65/IMG_20220606_183040.jpg', '2022-06-11 20:27:07', '2022-06-11 20:27:07'),
(68, 12, 5, 'مشاعل', 'مهدي', 'حمد', 'ال بلحارث', 'mshalalyamy918@gmail.com', '1085081345', '0556845149', 'uploads/cvs/68/IMG_20220606_183040.jpg', '2022-06-12 22:55:20', '2022-06-12 22:55:20'),
(69, 12, 5, 'مشاعل', 'مهدي', 'حمد', 'ال بلحارث', 'mshalalyamy918@gmail.com', '1085081345', '0556845149', 'uploads/cvs/69/IMG_20220606_183040.jpg', '2022-06-12 22:55:37', '2022-06-12 22:55:37'),
(70, 5, 3, 'نجاح', 'مانع', 'ناصر', 'ال عباس', 'jmhwrnjah@gmail.com', '١٠٣١٠٦٠٤٩٢', '0534023660', 'uploads/cvs/70/IMG_20220613_143203.jpg', '2022-06-13 21:43:37', '2022-06-13 21:43:37'),
(71, 7, 5, 'فاطمه', 'صالح', 'سهل', 'ال ضاعن', 'ar7777bo@gmail.com', '1059543288', '0533070335', 'uploads/cvs/71/فاطمه سيره.docx', '2022-06-14 02:51:51', '2022-06-14 02:51:51'),
(72, 7, 5, 'فاطمه', 'صالح', 'سهل', 'ال ضاعن', 'ar7777bo@gmail.com', '1059543288', '0533070335', 'uploads/cvs/72/فاطمه سيره.docx', '2022-06-14 02:51:53', '2022-06-14 02:51:53'),
(73, 9, 5, 'هند', 'حسين', 'علي', 'الجعره', 'Hind.aljarh@gmail.com', '1093490496', '966544588539', 'uploads/cvs/73/CV-Hind aljarh.pdf', '2022-06-14 03:19:13', '2022-06-14 03:19:13'),
(74, 5, 5, 'هند', 'حسين', 'علي', 'الجعره', 'Hind.aljarh@gmail.com', '1093490496', '966544588539', 'uploads/cvs/74/CV-Hind aljarh.pdf', '2022-06-14 03:25:37', '2022-06-14 03:25:37'),
(75, 5, 5, 'هند', 'حسين', 'علي', 'الجعره', 'Hind.aljarh@gmail.com', '1093490496', '966544588539', 'uploads/cvs/75/CV-Hind aljarh.pdf', '2022-06-14 03:25:40', '2022-06-14 03:25:40'),
(76, 11, 4, 'افراح', 'عبدالله', 'حسين', 'البديدي', 'a.210@outlook.sa', '1071922429', '966506397545', 'uploads/cvs/76/افراح عبدالله حسين البديدي (1).pdf', '2022-06-14 13:37:15', '2022-06-14 13:37:15'),
(77, 11, 4, 'افراح', 'عبدالله', 'حسين', 'البديدي', 'a.210@outlook.sa', '1071922429', '966506397545', 'uploads/cvs/77/افراح عبدالله حسين البديدي (1).pdf', '2022-06-14 13:37:18', '2022-06-14 13:37:18'),
(78, 12, 5, 'جواهر', 'حسين', 'عبدالله', 'ال سالم', 'jojoo1190@hotmail.com', '1094274980', '966536154088', 'uploads/cvs/78/23121416.pdf', '2022-06-14 14:58:20', '2022-06-14 14:58:20'),
(79, 7, 6, 'نوره', 'محمد', 'حسين', 'ال عوض', 'nnn8228222@gmail.com', '1051795308', '966558688503', 'uploads/cvs/79/CV- Norah.pdf', '2022-06-16 16:26:57', '2022-06-16 16:26:57'),
(80, 5, 5, 'سهام', 'محمد', 'حسين', 'ال عوض', 'kpride142@gmail.com', '1104013592', '966558484121', 'uploads/cvs/80/CV- SEHAM.pdf', '2022-06-16 16:36:58', '2022-06-16 16:36:58'),
(81, 11, 4, 'وجدان هادي ال منصور', 'هادي', 'حسين', 'ال منصور', 'K.t38@icloud.com', '1109907145', '0537560433', 'uploads/cvs/81/وجدان.pdf', '2022-06-16 18:06:40', '2022-06-16 18:06:40'),
(82, 13, 3, 'مها', 'حمد', 'محمد', 'قملان', 'maharr0089@gmil.com', '1111047534', '966550169280', 'uploads/cvs/82/CamScanner 08-17-2021 20.52_1_compressed_compressed.pdf', '2022-06-16 19:23:11', '2022-06-16 19:23:11'),
(83, 13, 3, 'مها', 'حمد', 'محمد', 'قملان', 'maharr0089@gmil.com', '1111047534', '966550169280', 'uploads/cvs/83/CamScanner 08-17-2021 20.52_1_compressed_compressed.pdf', '2022-06-16 19:23:16', '2022-06-16 19:23:16'),
(84, 7, 5, 'نجود', 'علي', 'راشد', 'الحداد', 'njoodjojo4@gmail.com', '1074891688', '966540003439', 'uploads/cvs/84/السيرة الذاتية نجود الجديدة.docx', '2022-06-16 23:57:35', '2022-06-16 23:57:35'),
(85, 7, 5, 'نجود', 'علي', 'راشد', 'الحداد', 'njoodjojo4@gmail.com', '1074891688', '966540003439', 'uploads/cvs/85/السيرة الذاتية نجود الجديدة.docx', '2022-06-16 23:57:37', '2022-06-16 23:57:37'),
(86, 10, 5, 'نورة', 'ظافر', 'محمد', 'اليامي', 'anorah0o0@outlook.com', '1090379502', '0536279891', 'uploads/cvs/86/مستندات ممسوحة ضوئيًا 2.pdf', '2022-06-17 09:29:35', '2022-06-17 09:29:35'),
(87, 10, 5, 'نورة', 'ظافر', 'محمد', 'اليامي', 'anorah0o0@outlook.com', '1090379502', '0536279891', 'uploads/cvs/87/نورة ظافر محمد اليامي.pdf', '2022-06-17 09:34:02', '2022-06-17 09:34:02'),
(88, 5, 5, 'مرفت', 'مسفر', 'علي', 'ال مسرع', 'Yas943@hotmail.com', '1066742337', '0557365481', 'uploads/cvs/88/‏لقطة شاشة ٢٠٢٠-١١-٣٠ في ٦.٢١.٣٢ م.pdf', '2022-06-17 12:13:25', '2022-06-17 12:13:25'),
(89, 5, 5, 'فاطمه', 'ناصر', 'ناجي', 'شيطه', 'ftmalnasser4@gmail.com', '1096119506', '0500233671', 'uploads/cvs/89/893F93BC-2428-4FF4-99F0-5E3D359E0043.pdf', '2022-06-20 05:58:23', '2022-06-20 05:58:23'),
(90, 7, 5, 'أحلام', 'حسين', 'ناصر', 'ال حريد', 'hlooom1174@yahoo.com', '1095942834', '966556427022', 'uploads/cvs/90/نسخة السيرة الذاتية.pdf', '2022-06-20 06:04:23', '2022-06-20 06:04:23'),
(91, 7, 5, 'أحلام', 'حسين', 'ناصر', 'ال حريد', 'hlooom1174@yahoo.com', '1095942834', '966556427022', 'uploads/cvs/91/نسخة السيرة الذاتية.pdf', '2022-06-20 06:04:27', '2022-06-20 06:04:27'),
(92, 8, 5, 'روان', 'سالم', 'فهيد', 'الصقور', 'rawan11028@gmail.com', '1102896840', '0552185800', 'uploads/cvs/92/روان سالم 2.pdf', '2022-06-25 20:29:50', '2022-06-25 20:29:50'),
(93, 5, 5, 'وضحى', 'محمد', 'علي', 'آل دويس', 'alyamiwadha7@gmail.com', '1081822478', '966502341642', 'uploads/cvs/93/وضحى محمد آل دويس (9).pdf', '2022-06-26 15:45:01', '2022-06-26 15:45:01'),
(94, 11, 5, 'فاطمه', 'مسفر', 'علي', 'آل لشعث', 'ffatiimah5@gmail.com', '1082475110', '502487578', 'uploads/cvs/94/195B94E9-08B9-4224-BB99-F3E020D0E10F.pdf', '2022-06-28 02:22:26', '2022-06-28 02:22:26'),
(95, 7, 3, 'ظبية', 'مفرح', 'مناحي', 'العايذي', 'Fadooodi144@gmail.com', '1104717499', '966530713041', 'uploads/cvs/95/IMG_4798.pdf', '2022-06-28 08:38:37', '2022-06-28 08:38:37'),
(96, 5, 4, 'هدى', 'محمد', 'صالح', 'ال دغرير', 'gmjmnddd202221@gmail.com', '1082620632', '0556716607', 'uploads/cvs/96/0565745106 - 0556716607 (1).pdf', '2022-07-02 02:00:42', '2022-07-02 02:00:42'),
(97, 9, 5, 'شهد', 'يوسف', 'عبدالله', 'ال عباس', 'shadabaas787@gmail.com', '1098911785', '0502512680', 'uploads/cvs/97/16FD4CD6-FF61-454C-82BE-1B3B7EF9D93A.pdf', '2022-07-21 23:33:50', '2022-07-21 23:33:50'),
(98, 7, 5, 'فريال', 'سعود', 'مهدي', 'الشيبان', 'f.s.m.alshaiban@gmail.com', '1054581333', '966545688383', 'uploads/cvs/98/سيرتي الذاتية ٢ -٢.pdf', '2022-07-28 16:30:59', '2022-07-28 16:30:59'),
(99, 7, 5, 'فريال', 'سعود', 'مهدي', 'الشيبان', 'f.s.m.alshaiban@gmail.com', '1054581333', '966545688383', 'uploads/cvs/99/سيرتي الذاتية ٢ -٢.pdf', '2022-07-28 16:34:05', '2022-07-28 16:34:05'),
(100, 9, 5, 'فريال', 'سعود', 'مهدي', 'الشيبان', 'f.s.m.alshaiban@gmail.com', '1054581333', '966545688383', 'uploads/cvs/100/سيرتي الذاتية ٢ -٢.pdf', '2022-07-28 16:35:09', '2022-07-28 16:35:09'),
(101, 11, 5, 'فريال', 'سعود', 'مهدي', 'الشيبان', 'f.s.m.alshaiban@gmail.com', '1054581333', '966545688383', 'uploads/cvs/101/سيرتي الذاتية ٢ -٢.pdf', '2022-07-28 16:35:50', '2022-07-28 16:35:50'),
(102, 12, 5, 'فريال', 'سعود', 'مهدي', 'الشيبان', 'f.s.m.alshaiban@gmail.com', '1054581333', '966545688383', 'uploads/cvs/102/سيرتي الذاتية ٢ -٢.pdf', '2022-07-28 16:36:30', '2022-07-28 16:36:30'),
(103, 12, 5, 'فريال', 'سعود', 'مهدي', 'الشيبان', 'f.s.m.alshaiban@gmail.com', '1054581333', '966545688383', 'uploads/cvs/103/سيرتي الذاتية ٢ -٢.pdf', '2022-07-28 16:36:33', '2022-07-28 16:36:33'),
(104, 7, 5, 'صالحة', 'عبده', 'ابراهيم', 'عر', 'salha.eur@gmail.com', '1113191330', '0581804818', 'uploads/cvs/104/السيرة الذاتية.pdf', '2022-08-13 01:59:01', '2022-08-13 01:59:01'),
(105, 5, 5, 'هيفاء', 'رجا', 'سلمان', 'ال فرحان', 'Love.gamaan@gmail.com', '1084590270', '966507845935', 'uploads/cvs/105/CV. Hayifa.pdf', '2022-08-29 01:51:19', '2022-08-29 01:51:19'),
(106, 7, 5, 'سحر', 'حسين', 'هادي', 'كزمان', 'amooll.123@hotmail.com', '1072488164', '0507547107', 'uploads/cvs/106/ملاحظة جديدة 11.pdf', '2022-08-30 19:09:38', '2022-08-30 19:09:38'),
(107, 5, 5, 'بدور', 'شاجع', 'حمد', 'الصقور', 'bdoor4350@gmail.com', '1095868186', '966556831014', 'uploads/cvs/107/CV Badoor.pdf', '2022-08-31 05:03:29', '2022-08-31 05:03:29'),
(108, 5, 5, 'مها', 'مهدي', 'مانع', 'ال سالم', 'maha.mm84@gmail.com', '1027449899', '966555752165', 'uploads/cvs/108/مها.pdf', '2022-09-04 23:34:02', '2022-09-04 23:34:02'),
(109, 9, 5, 'مها', 'مهدي', 'مانع', 'ال سالم', 'maha.mm84@gmail.com', '1027449899', '966555752165', 'uploads/cvs/109/مها.pdf', '2022-09-04 23:38:36', '2022-09-04 23:38:36'),
(110, 11, 5, 'مها', 'مهدي', 'مانع', 'ال سالم', 'maha.mm84@gmail.com', '1027449899', '966555752165', 'uploads/cvs/110/مها.pdf', '2022-09-04 23:43:00', '2022-09-04 23:43:00'),
(111, 7, 5, 'ذكرى', 'علي', 'احمد', 'الشريف', 'thekraa1419@gmail.com', '1116750231', '966543568212', 'uploads/cvs/111/‏لقطة شاشة ٢٠٢١-٠٩-٠٣ في ٦.٠٣.٥٣ م.pdf', '2022-09-09 01:26:44', '2022-09-09 01:26:44'),
(112, 7, 5, 'ذكرى', 'علي', 'احمد', 'الشريف', 'thekraa1419@gmail.com', '1116750231', '966543568212', 'uploads/cvs/112/‏لقطة شاشة ٢٠٢١-٠٩-٠٣ في ٦.٠٣.٥٣ م.pdf', '2022-09-09 01:26:46', '2022-09-09 01:26:46'),
(113, 5, 1, 'ثريا', 'مانع', 'علي', 'الربيعي', 'faiz.911.f@icloud.com', '1087794382', '0556730431', 'uploads/cvs/113/السيرة الذاتية.pdf', '2022-09-28 06:51:40', '2022-09-28 06:51:40'),
(114, 5, 5, 'نوف', 'صالح', 'محمد', 'ال حويل', 'Noufsaleh.najran@outlook.sa', '1049934688', '966507952215', 'uploads/cvs/114/جدييييد سيرة ذاتية.pdf', '2022-09-30 22:27:21', '2022-09-30 22:27:21'),
(115, 11, 5, 'أمجاد', 'وبران', 'راشد', 'آل ويران', 'aa7379698@gmail.com', '1081698415', '966530992528', 'uploads/cvs/115/CV. أمجاد آل خريم.pdf', '2022-10-07 12:23:16', '2022-10-07 12:23:16'),
(116, 11, 5, 'أمجاد', 'وبران', 'راشد', 'آل ويران', 'aa7379698@gmail.com', '1081698415', '966530992528', 'uploads/cvs/116/CV. أمجاد آل خريم.pdf', '2022-10-07 12:23:35', '2022-10-07 12:23:35'),
(117, 7, 5, 'أمجاد', 'وبران', 'راشد', 'آل وبران', 'aa7379698@gmail.com', '1081698415', '966530992528', 'uploads/cvs/117/CV. أمجاد آل خريم.pdf', '2022-10-11 17:17:26', '2022-10-11 17:17:26'),
(118, 5, 6, 'دلال', 'هادي', 'صالح', 'ال بالحارث', 'dloosh1417@hotmail.com', '1091268696', '966553120419', 'uploads/cvs/118/562160CE-477F-40C5-958A-8D6232FEF1EE.pdf', '2022-11-08 03:28:21', '2022-11-08 03:28:21'),
(119, 5, 6, 'منى', 'جمال', 'علي', 'ال مريح', 'moonja333@hotmail.com', '1089883506', '966535523002', 'uploads/cvs/119/Cv. Mona.pdf', '2022-11-08 15:04:48', '2022-11-08 15:04:48');

-- --------------------------------------------------------

--
-- Table structure for table `maillist`
--

CREATE TABLE `maillist` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `maillist`
--

INSERT INTO `maillist` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'My776044@gmail.com', '2022-05-14 03:54:58', '2022-05-14 03:54:58'),
(2, 'a439403563@gmail.com', '2022-05-14 03:55:16', '2022-05-14 03:55:16'),
(3, 'z.eiman2019@gmail.com', '2022-05-18 15:32:07', '2022-05-18 15:32:07'),
(4, 'naaaj2017@icloud.com', '2022-05-18 15:52:19', '2022-05-18 15:52:19'),
(5, 'shad0133@icloud.com', '2022-05-18 15:56:10', '2022-05-18 15:56:10'),
(6, 'ylll6661@gmail.com', '2022-05-18 16:10:00', '2022-05-18 16:10:00'),
(7, 'fa1981.ts@gmail.com', '2022-05-18 17:11:44', '2022-05-18 17:11:44'),
(8, 'nassem.a.1401@gmail.com', '2022-05-18 18:19:57', '2022-05-18 18:19:57'),
(9, 'a.wargash@gmail.com', '2022-05-18 19:55:08', '2022-05-18 19:55:08'),
(10, 'ahmedalajam20@gmail.com', '2022-05-18 21:11:51', '2022-05-18 21:11:51'),
(11, 'sahar22222@gmil.com', '2022-05-18 21:22:47', '2022-05-18 21:22:47'),
(12, 'kh123kh00@gmail.com', '2022-05-18 22:23:10', '2022-05-18 22:23:10'),
(13, 'asaaed29000@gmail.com', '2022-05-18 22:28:49', '2022-05-18 22:28:49'),
(14, 'm.bb1@icloud.com', '2022-05-19 02:17:40', '2022-05-19 02:17:40'),
(15, 'zzwwhhh16@gmail.com', '2022-05-19 04:06:03', '2022-05-19 04:06:03'),
(16, 'mhsnh4025@gmail.com', '2022-05-19 05:16:15', '2022-05-19 05:16:15'),
(17, 'as5483343@gmail.com', '2022-05-19 05:18:33', '2022-05-19 05:18:33'),
(18, 'Aa05023394267@icloud.com', '2022-05-19 11:52:44', '2022-05-19 11:52:44'),
(19, 'Ci_78@icloud.com', '2022-05-19 16:44:49', '2022-05-19 16:44:49'),
(20, 'salemomair@gmail.com', '2022-05-19 17:20:46', '2022-05-19 17:20:46'),
(21, 'Njood379@hotmail.com', '2022-05-22 16:18:13', '2022-05-22 16:18:13'),
(22, 'asmahan6300@gmail.com', '2022-05-22 17:36:28', '2022-05-22 17:36:28'),
(23, 'dfdfas540@icloud.com', '2022-05-22 17:59:35', '2022-05-22 17:59:35'),
(24, 'shahad9900@icloud.com', '2022-05-22 22:15:28', '2022-05-22 22:15:28'),
(25, 'jwwahar@gmail.com', '2022-05-22 22:21:04', '2022-05-22 22:21:04'),
(26, 'Omranah2030h@gmail.com', '2022-05-23 02:20:40', '2022-05-23 02:20:40'),
(27, 'rhomali1112@gmail.com', '2022-05-23 11:31:21', '2022-05-23 11:31:21'),
(28, 'rehabalz2030@hotmail.com', '2022-05-24 02:18:16', '2022-05-24 02:18:16'),
(29, 'd1416d@icloud.com', '2022-06-02 00:35:41', '2022-06-02 00:35:41'),
(30, 'noura.dhafer8@gmail.com', '2022-06-06 20:05:50', '2022-06-06 20:05:50'),
(31, 'mxd_2010@hotmail.com', '2022-06-06 20:14:31', '2022-06-06 20:14:31'),
(32, 'mbarkhalhmamy28@gmail.com', '2022-06-06 20:25:23', '2022-06-06 20:25:23'),
(33, 'noran0504724546@gmail.com', '2022-06-07 00:57:37', '2022-06-07 00:57:37'),
(34, 'h0559557478@gmail.com', '2022-06-07 02:46:32', '2022-06-07 02:46:32'),
(35, 'sabren.afg.120@gmail.com', '2022-06-07 18:19:19', '2022-06-07 18:19:19'),
(36, 'meemzx@icloud.com', '2022-06-07 18:34:48', '2022-06-07 18:34:48'),
(37, 'thotho6w6w@gmail.com', '2022-06-08 01:45:23', '2022-06-08 01:45:23'),
(38, 'gh.1420628@gmail.com', '2022-06-08 05:14:41', '2022-06-08 05:14:41'),
(39, 'entesar55n@gmail.com', '2022-06-08 07:39:58', '2022-06-08 07:39:58'),
(40, 'a.0911@hotmail.com', '2022-06-08 22:10:24', '2022-06-08 22:10:24'),
(41, 'public03slicers@icloud.com', '2022-06-09 04:43:20', '2022-06-09 04:43:20'),
(42, 'mma769798@gmail.com', '2022-06-09 08:45:40', '2022-06-09 08:45:40'),
(43, 'balslym350@gmail.com', '2022-06-09 18:30:08', '2022-06-09 18:30:08'),
(44, 'Ahmed.m.s600@gmail.com', '2022-06-09 18:39:05', '2022-06-09 18:39:05'),
(45, 'ahodalwady@hotmail.com', '2022-06-09 21:16:04', '2022-06-09 21:16:04'),
(46, 'ttttt_1@hotmail.com', '2022-06-09 21:19:35', '2022-06-09 21:19:35'),
(47, 'Sho0o0sh28@gmail.com', '2022-06-09 21:41:08', '2022-06-09 21:41:08'),
(48, 'f.swar2030@gmail.com', '2022-06-11 05:09:58', '2022-06-11 05:09:58'),
(49, 'ss1999as@hotmail.com', '2022-06-11 22:42:07', '2022-06-11 22:42:07'),
(50, 'g0551359814@icloud.com', '2022-06-11 22:55:30', '2022-06-11 22:55:30'),
(51, 'abw.afra@hotmail.com', '2022-06-11 23:31:56', '2022-06-11 23:31:56'),
(52, 'memo141259@hotmail.com', '2022-06-12 23:58:34', '2022-06-12 23:58:34'),
(53, 'najwanaseer383@gmail.com', '2022-06-13 00:28:18', '2022-06-13 00:28:18'),
(54, 'a0554267521@icloud.com', '2022-06-13 04:41:38', '2022-06-13 04:41:38'),
(55, 'ddody1891@gmail.com', '2022-06-13 14:37:27', '2022-06-13 14:37:27'),
(56, 'alyami.zakia@gmail.com', '2022-06-13 21:40:09', '2022-06-13 21:40:09'),
(57, 'ar7777bo@gmail.com', '2022-06-14 03:09:14', '2022-06-14 03:09:14'),
(58, 'rishanrs@yahoo.com', '2022-06-14 03:26:17', '2022-06-14 03:26:17'),
(59, 'azizfaraj1392@gmail.com', '2022-06-14 15:24:35', '2022-06-14 15:24:35'),
(60, 'Fahd1410fahdd@gmail.com', '2022-06-15 02:47:21', '2022-06-15 02:47:21'),
(61, 'K.t38@icloud.com', '2022-06-16 18:09:35', '2022-06-16 18:09:35'),
(62, 'ehsas404@icloud.com', '2022-06-17 02:04:35', '2022-06-17 02:04:35'),
(63, 'alkedasy999@hotmail.com', '2022-06-21 06:38:52', '2022-06-21 06:38:52'),
(64, 'gmjmnddd202221@gmail.com', '2022-06-30 18:04:54', '2022-06-30 18:04:54'),
(65, 'kokab1314@windowslive.com', '2022-07-03 23:36:52', '2022-07-03 23:36:52'),
(66, 'shadabaas787@gmail.com', '2022-07-21 23:34:53', '2022-07-21 23:34:53'),
(67, 'a0501428672@gmail.com', '2022-08-16 02:26:58', '2022-08-16 02:26:58'),
(68, 'khatmhalqshanyn693@gmail.com', '2022-09-03 16:58:43', '2022-09-03 16:58:43'),
(69, 'maha.mm84@gmail.com', '2022-09-04 23:36:26', '2022-09-04 23:36:26'),
(70, 'msa607685@gmail.com', '2022-09-11 20:11:15', '2022-09-11 20:11:15'),
(71, 'abdalgafar2010@hotmail.com', '2022-09-13 05:57:42', '2022-09-13 05:57:42'),
(72, 'mariam0547@hotmail.com', '2022-09-13 07:56:51', '2022-09-13 07:56:51'),
(73, 's77y@outlook.sa', '2022-09-25 05:15:43', '2022-09-25 05:15:43'),
(74, 'aalrobie@hotmail.com', '2022-09-25 05:18:43', '2022-09-25 05:18:43'),
(75, 'tentsnajran@gmail.com', '2022-10-02 05:15:05', '2022-10-02 05:15:05'),
(76, 'aa7379698@gmail.com', '2022-10-07 12:26:18', '2022-10-07 12:26:18'),
(77, 'wmsnz20@gmail.com', '2022-10-13 11:59:41', '2022-10-13 11:59:41'),
(78, 'noornajran.sa@gmail.com', '2022-10-16 05:27:09', '2022-10-16 05:27:09'),
(79, 'ishfjn@gmail.com', '2022-10-23 18:39:03', '2022-10-23 18:39:03'),
(80, 'googl5157@gmail.com', '2022-10-26 09:30:32', '2022-10-26 09:30:32'),
(81, 'n.alatwah11@gmail.com', '2022-10-31 15:36:49', '2022-10-31 15:36:49'),
(82, 'adaaaad66@gmail.com', '2022-11-02 03:28:00', '2022-11-02 03:28:00'),
(83, 'ssme7283@icloud.com', '2022-11-02 05:04:28', '2022-11-02 05:04:28'),
(84, 'nadiah.moh892@gmail.com', '2022-11-03 04:07:31', '2022-11-03 04:07:31'),
(85, 'awd1308@hotmail.com', '2022-11-08 02:57:55', '2022-11-08 02:57:55'),
(86, 'gogo109@gamil.com', '2022-11-08 15:32:38', '2022-11-08 15:32:38');

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\Supervisor', 1);

-- --------------------------------------------------------

--
-- Table structure for table `nationalities`
--

CREATE TABLE `nationalities` (
  `id` int(11) NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nationalities`
--

INSERT INTO `nationalities` (`id`, `nationality`, `created_at`, `updated_at`) VALUES
(1, 'سعودي', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(2, 'ألباني', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(3, 'مصري', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(4, 'برتغالي', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(5, 'سوداني', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(6, 'صيني', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(7, 'سوري', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(8, 'لبناني', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(9, 'قطري', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(10, 'موريتاني', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(11, 'اماراتي', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(12, 'نيجيري', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(13, 'عماني', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(14, 'أردني', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(15, 'بحريني', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(16, 'مغربي', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(17, 'بريطاني', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(18, 'كندي', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(19, 'امريكي', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(20, 'كاميروني', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(21, 'ليبي', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(22, 'تنزاني', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(23, 'جزائري', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(24, 'اريتيري', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(25, 'صومالي', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(26, 'سان كريستوفر نيفز', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(27, 'كويتي', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(28, 'تايلند', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(29, 'عراقي', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(30, 'أثيوبي', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(31, 'ألماني', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(32, 'ماليزي', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(33, 'يمني', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(34, 'مالي', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(35, 'هندي', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(36, 'بوركينا فاسو', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(37, 'يوناني', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(38, 'كيني', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(39, 'اندونيسي', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(40, 'بلوشي', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(41, 'إيراني', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(42, 'تركستاني', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(43, 'ايرلندي', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(44, 'اجنبي بجواز سعودي', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(45, 'إيطالي', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(46, 'سيريلانكي', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(47, 'بنغلادشي', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(48, 'استرالي', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(49, 'تركي', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(50, 'النيجر', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(51, 'تشادي', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(52, 'ابناء القبائل النازحة', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(53, 'تونسي', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(54, 'لاتيفيا', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(55, 'جيبوتي', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(56, 'جنوب أفريقيا', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(57, 'فلسطيني', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(58, 'ميانمار', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(59, 'روسي', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(60, 'نيبالي', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(61, 'روماني', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(62, 'النمسا', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(63, 'سنغالي', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(64, 'غينيا الاستوائية', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(65, 'فلبيني', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(66, 'أوزباكستان', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(67, 'فرنسي', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(68, 'ساحل العاج', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(69, 'ياباني', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(70, 'إثيوبي', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(71, 'أفغانستاني', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(72, 'أرجنتيني', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(73, 'باكستاني', '2022-03-17 05:00:00', '2022-03-17 05:00:00'),
(74, 'برازيلي', '2022-03-17 05:00:00', '2022-03-17 05:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `description` longtext NOT NULL,
  `brochure` longtext NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'مفعل',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `second_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `third_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fourth_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(252) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_type_id` int(11) NOT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disability_id` int(11) NOT NULL,
  `nationality_id` int(11) NOT NULL,
  `id_pic` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `medical_report_pic` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'قيد المراجعة',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `first_name`, `second_name`, `third_name`, `fourth_name`, `email`, `phone_number`, `order_type_id`, `quantity`, `disability_id`, `nationality_id`, `id_pic`, `medical_report_pic`, `Status`, `created_at`, `updated_at`) VALUES
(6, 'احمد', 'عبدالهادي', 'راشد', 'الزقلي', 'S4251532@ng.moe.gov.sa', '0532413867', 13, '4', 1, 1, 'uploads/orders/id_pics/6/IMG-20220310-WA0010.jpg', 'uploads/orders/medical_report_pics/6/IMG-20220310-WA0010.jpg', 'قيد المراجعة', '2022-06-07 18:18:35', '2022-06-07 18:18:35'),
(7, 'حفصه', 'عبدالوهاب', 'عبدالواحد', '-', 'sabren.afg.120@gmail.com', '966580790637', 25, '8', 1, 71, 'uploads/orders/id_pics/7/01982651-E293-4998-9003-D43F93BA3745.jpeg', 'uploads/orders/medical_report_pics/7/Adobe Scan 7 Jun 2022.pdf', 'قيد المراجعة', '2022-06-07 18:18:37', '2022-06-07 18:18:37'),
(8, 'احمد', 'عبدالهادي', 'راشد', 'الزقلي', 'S4251532@ng.moe.gov.sa', '0532413867', 13, '4', 1, 1, 'uploads/orders/id_pics/8/IMG-20220310-WA0010.jpg', 'uploads/orders/medical_report_pics/8/IMG-20220310-WA0010.jpg', 'قيد المراجعة', '2022-06-07 18:18:40', '2022-06-07 18:18:40'),
(9, 'احمد', 'عبدالهادي', 'راشد', 'الزقلي', 'S4251532@ng.moe.gov.sa', '0532413867', 13, '4', 1, 1, 'uploads/orders/id_pics/9/IMG-20220310-WA0010.jpg', 'uploads/orders/medical_report_pics/9/IMG-20220310-WA0010.jpg', 'قيد المراجعة', '2022-06-07 18:18:52', '2022-06-07 18:18:52'),
(10, 'جملاء', 'حسين', 'محمد', 'ال سليم', 'JamlaAlyame@gmail.com', '0530367028', 13, '1', 11, 1, 'uploads/orders/id_pics/10/840A9205-4697-46DB-BB29-66433AB112AE.jpeg', 'uploads/orders/medical_report_pics/10/تقرير طبي جديد.pdf', 'قيد المراجعة', '2022-06-07 18:31:14', '2022-06-07 18:31:14'),
(11, 'عبدالرحمن', 'مبارك', 'صالح', 'الهمامي', 'moh.gl825@gmail.com', '966504804860', 19, '10', 1, 1, 'uploads/orders/id_pics/11/image.jpg', 'uploads/orders/medical_report_pics/11/Ministry of Health.pdf', 'قيد المراجعة', '2022-06-07 22:56:08', '2022-06-07 22:56:08'),
(12, 'عبدالرحمن', 'مبارك', 'صالح', 'الهمامي', 'moh.gl825@gmail.com', '966504804860', 19, '10', 1, 1, 'uploads/orders/id_pics/12/image.jpg', 'uploads/orders/medical_report_pics/12/Ministry of Health.pdf', 'قيد المراجعة', '2022-06-07 22:57:10', '2022-06-07 22:57:10'),
(13, 'عبدالرحمن', 'مبارك', 'صالح', 'الهمامي', 'moh.gl825@gmail.com', '966504804860', 19, '10', 1, 1, 'uploads/orders/id_pics/13/image.jpg', 'uploads/orders/medical_report_pics/13/تقرير عبدالرحمن.pdf', 'قيد المراجعة', '2022-06-07 22:59:52', '2022-06-07 22:59:52'),
(14, 'نايف', 'مبارك', 'صالح', 'الهمامي', 'moh.gl825@gmail.com', '966504804860', 19, '10', 1, 1, 'uploads/orders/id_pics/14/image.jpg', 'uploads/orders/medical_report_pics/14/تقرير نايف.pdf', 'قيد المراجعة', '2022-06-07 23:01:33', '2022-06-07 23:01:33'),
(15, 'فرح', 'مبخوت', 'سالم', 'اليامي', 'rr20f00@gmail.com', '966530419843', 25, '60', 9, 1, 'uploads/orders/id_pics/15/4FDDD110-0C25-4717-87AF-F46E45E347B9.jpeg', 'uploads/orders/medical_report_pics/15/تقرير فرح.pdf', 'قيد المراجعة', '2022-06-08 02:19:54', '2022-06-08 02:19:54'),
(16, 'فرح', 'مبخوت', 'سالم', 'اليامي', 'rr20f00@gmail.com', '966530419843', 25, '60', 9, 1, 'uploads/orders/id_pics/16/4FDDD110-0C25-4717-87AF-F46E45E347B9.jpeg', 'uploads/orders/medical_report_pics/16/تقرير فرح.pdf', 'قيد المراجعة', '2022-06-08 02:19:57', '2022-06-08 02:19:57'),
(17, 'فرح', 'مبخوت', 'سالم', 'اليامي', 'rr20f00@gmil.com', '966530419843', 13, '8', 9, 1, 'uploads/orders/id_pics/17/6AD9E476-212F-40D5-91EB-F6AC2BFB7783.jpeg', 'uploads/orders/medical_report_pics/17/تقرير فرح.pdf', 'قيد المراجعة', '2022-06-08 11:30:34', '2022-06-08 11:30:34'),
(18, 'يوسف', 'سالم', 'جمعان', 'ابو هاملة', 'salim121233@hotmail.com', '966540431661', 16, '1', 12, 1, 'uploads/orders/id_pics/18/كرت العائلة1.jpg', 'uploads/orders/medical_report_pics/18/التقرير.pdf', 'قيد المراجعة', '2022-06-09 02:29:47', '2022-06-09 02:29:47'),
(19, 'احمد عادل علي عبد الجليل', 'عادل', 'عبد الجليل', 'الجليل', 'ghanmamlghanm@gmail.com', '0552616205', 17, '1', 1, 33, 'uploads/orders/id_pics/19/IMG_٢٠٢٢٠٦٠٩_١٥٢٨٠٤.jpg', 'uploads/orders/medical_report_pics/19/Kingdom Of Saudi Arabia.pdf', 'قيد المراجعة', '2022-06-10 00:00:24', '2022-06-10 00:00:24'),
(20, 'يوسف', 'عادل', 'عبدالجليل', 'الجليل', 'ghanmamlghanm@gmail.com', '0552616205', 19, '10', 6, 33, 'uploads/orders/id_pics/20/IMG-20220531-WA0103.jpg', 'uploads/orders/medical_report_pics/20/Maternity & Children\'s Hospital-Najran.pdf', 'قيد المراجعة', '2022-06-10 07:58:24', '2022-06-10 07:58:24'),
(21, 'يوسف', 'عادل', 'عبدالجليل', 'الجليل', 'ghanmamlghanm@gmail.com', '0552616205', 19, '10', 6, 33, 'uploads/orders/id_pics/21/IMG-20220531-WA0103.jpg', 'uploads/orders/medical_report_pics/21/Maternity & Children\'s Hospital-Najran.pdf', 'قيد المراجعة', '2022-06-10 07:58:25', '2022-06-10 07:58:25'),
(22, 'يوسف', 'عادل', 'عبدالجليل', 'الجليل', 'ghanmamlghanm@gmail.com', '0552616205', 19, '10', 6, 33, 'uploads/orders/id_pics/22/IMG-20220531-WA0103.jpg', 'uploads/orders/medical_report_pics/22/Maternity & Children\'s Hospital-Najran.pdf', 'قيد المراجعة', '2022-06-10 07:58:27', '2022-06-10 07:58:27'),
(23, 'يوسف', 'عادل', 'عبدالجليل', 'الجليل', 'ghanmamlghanm@gmail.com', '0552616205', 19, '10', 6, 33, 'uploads/orders/id_pics/23/IMG-20220531-WA0103.jpg', 'uploads/orders/medical_report_pics/23/Maternity & Children\'s Hospital-Najran.pdf', 'قيد المراجعة', '2022-06-10 07:58:29', '2022-06-10 07:58:29'),
(24, 'يوسف', 'عادل', 'عبدالجليل', 'الجليل', 'ghanmamlghanm@gmail.com', '0552616205', 19, '10', 6, 33, 'uploads/orders/id_pics/24/IMG-20220531-WA0103.jpg', 'uploads/orders/medical_report_pics/24/Maternity & Children\'s Hospital-Najran.pdf', 'قيد المراجعة', '2022-06-10 07:58:29', '2022-06-10 07:58:29'),
(25, 'يوسف', 'عادل', 'عبدالجليل', 'الجليل', 'ghanmamlghanm@gmail.com', '0552616205', 19, '10', 6, 33, 'uploads/orders/id_pics/25/IMG-20220531-WA0103.jpg', 'uploads/orders/medical_report_pics/25/Maternity & Children\'s Hospital-Najran.pdf', 'قيد المراجعة', '2022-06-10 07:58:38', '2022-06-10 07:58:38'),
(26, 'يوسف', 'عادل', 'عبدالجليل', 'الجليل', 'ghanmamlghanm@gmail.com', '0552616205', 19, '10', 6, 33, 'uploads/orders/id_pics/26/IMG-20220531-WA0103.jpg', 'uploads/orders/medical_report_pics/26/Maternity & Children\'s Hospital-Najran.pdf', 'قيد المراجعة', '2022-06-10 07:58:39', '2022-06-10 07:58:39'),
(27, 'يوسف', 'عادل', 'عبدالجليل', 'الجليل', 'ghanmamlghanm@gmail.com', '0552616205', 19, '10', 6, 33, 'uploads/orders/id_pics/27/IMG-20220531-WA0103.jpg', 'uploads/orders/medical_report_pics/27/Maternity & Children\'s Hospital-Najran.pdf', 'قيد المراجعة', '2022-06-10 07:58:41', '2022-06-10 07:58:41'),
(28, 'سالم', 'سعيد', 'سعيد', 'اليامى', 'aszd1210@gmail.com', '0508768919', 26, '1', 11, 1, 'uploads/orders/id_pics/28/سعيد1.pdf', 'uploads/orders/medical_report_pics/28/تقرير طبى2.pdf', 'قيد المراجعة', '2022-06-11 00:46:13', '2022-06-11 00:46:16'),
(29, 'وفقة', 'علي', 'محمد', 'بالحارث', 'wfqah@outlook.sa', '0535239282', 22, '2', 8, 1, 'uploads/orders/id_pics/29/82C03463-9C67-419F-AA13-56B0056934C6.jpeg', 'uploads/orders/medical_report_pics/29/تقرير.pdf', 'قيد المراجعة', '2022-06-11 22:41:30', '2022-06-11 22:41:30'),
(30, 'مانع', 'ضيف الله', 'محمد', 'الزبيد', 'mnoorsalh009@icloud.com', '0559111351', 15, '1', 1, 1, 'uploads/orders/id_pics/30/BB188825-C694-4913-92E3-D32121245C0F.png', 'uploads/orders/medical_report_pics/30/الصور التي تم حفظها 2.pdf', 'قيد المراجعة', '2022-06-12 23:17:36', '2022-06-12 23:18:21'),
(31, 'مانع', 'ضيف الله', 'محمد', 'الزبيد', 'mnoorsalh009@icloud.com', '0559111351', 15, '1', 1, 1, 'uploads/orders/id_pics/31/BB188825-C694-4913-92E3-D32121245C0F.png', 'uploads/orders/medical_report_pics/31/الصور التي تم حفظها 2.pdf', 'قيد المراجعة', '2022-06-12 23:18:30', '2022-06-12 23:19:06'),
(32, 'علياء', 'قبلان', 'محمد', 'الوعله', '0554305212aa@gmail.com', '966504538384', 16, '2', 1, 1, 'uploads/orders/id_pics/32/WhatsApp Image 2022-06-12 at 10.35.03 PM.jpeg', 'uploads/orders/medical_report_pics/32/تقرير طبي علياء .pdf', 'قيد المراجعة', '2022-06-13 05:43:33', '2022-06-13 05:43:33'),
(33, 'صالح', 'أحمد', 'صالح', 'ال زبر', 'ahmadsaleh27f@gmail.com', '966536000995', 25, '10', 16, 1, 'uploads/orders/id_pics/33/صالح..jpg', 'uploads/orders/medical_report_pics/33/صالح.pdf', 'قيد المراجعة', '2022-06-16 01:05:34', '2022-06-16 01:05:34'),
(34, 'عبدالعزيز', 'أحمد', 'صالح', 'ال زبر', 'ahmadsaleh27f@gmail.com', '966536000995', 25, '10', 16, 1, 'uploads/orders/id_pics/34/عبدالعزيز.jpg', 'uploads/orders/medical_report_pics/34/عبدالعزيز.pdf', 'قيد المراجعة', '2022-06-16 01:09:29', '2022-06-16 01:09:29'),
(35, 'فاطمه', 'محمد', 'علي', 'ال شريه', 'moh1398sh@gmil.com', '966551069455', 13, '1', 14, 1, 'uploads/orders/id_pics/35/IMG-20220810-WA0001.jpg', 'uploads/orders/medical_report_pics/35/تقرير فاطمه.PDF', 'قيد المراجعة', '2022-08-11 02:56:38', '2022-08-11 02:56:38'),
(36, 'يحي', 'محمد', 'مانع', 'المحامض', 'bdallhalmahamd6@gmail.com', '0555849975', 13, '8', 1, 1, 'uploads/orders/id_pics/36/B3D4BAD4-E7A7-49F0-94E8-63381EFEEA90.jpeg', 'uploads/orders/medical_report_pics/36/الصورة التي تم حفظها.pdf', 'قيد المراجعة', '2022-09-03 23:29:05', '2022-09-03 23:29:05'),
(37, 'يحي', 'محمد', 'مانع', 'المحامض', 'bdallhalmahamd6@gmail.com', '0555849975', 13, '8', 1, 1, 'uploads/orders/id_pics/37/B3D4BAD4-E7A7-49F0-94E8-63381EFEEA90.jpeg', 'uploads/orders/medical_report_pics/37/الصورة التي تم حفظها.pdf', 'قيد المراجعة', '2022-09-03 23:29:08', '2022-09-03 23:29:08'),
(38, 'يوسف', 'ظافر', 'منصور', 'ال حارث', 'al87zoha@gmail.com', '966537988556', 13, '1', 12, 1, 'uploads/orders/id_pics/38/CamScanner ٠١-٢٥-٢٠٢٢ ٠٩.١٦_page-0001.jpg', 'uploads/orders/medical_report_pics/38/تقرير طبي .pdf', 'قيد المراجعة', '2022-10-17 02:05:32', '2022-10-17 02:05:32'),
(39, 'عبدالله', 'صالح', 'مرزوق', 'ال فلكه', 'najrani2011@gmail.com', '0507023329', 19, '100', 14, 1, 'uploads/orders/id_pics/39/Screenshot_٢٠٢٢١٠١٧-٢١٢٩٣١_Word.jpg', 'uploads/orders/medical_report_pics/39/Screenshot_٢٠٢٢١٠١٧-٢١٢٩٣١_Word.jpg', 'قيد المراجعة', '2022-10-18 04:31:19', '2022-10-18 04:31:19'),
(40, 'محمد', 'احمد', 'محمد', 'الهصيصي', 'googl5157@gmail.com', '966505273754', 22, '2', 8, 33, 'uploads/orders/id_pics/40/6BBAC995-E6C6-4D56-B481-1FA2D87288DC.jpeg', 'uploads/orders/medical_report_pics/40/صورة.pdf', 'قيد المراجعة', '2022-10-26 09:33:51', '2022-10-26 09:33:51');

-- --------------------------------------------------------

--
-- Table structure for table `order_types`
--

CREATE TABLE `order_types` (
  `id` int(11) NOT NULL,
  `order_type` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_types`
--

INSERT INTO `order_types` (`id`, `order_type`, `created_at`, `updated_at`) VALUES
(13, 'حقائب تعليمية', '2022-05-23 15:43:25', '2022-05-23 15:43:25'),
(14, 'سرير طبي', '2022-05-23 15:45:09', '2022-05-23 15:45:09'),
(15, 'كرسي متحرك', '2022-05-23 15:45:27', '2022-05-23 15:45:27'),
(16, 'مقياس حرارة', '2022-05-23 15:45:40', '2022-05-23 15:45:40'),
(17, 'جهاز بخار', '2022-05-23 15:46:05', '2022-05-23 15:46:05'),
(18, 'جهاز البلغم', '2022-05-23 15:46:17', '2022-05-23 15:46:30'),
(19, 'حفاضات', '2022-05-23 15:47:01', '2022-05-23 15:47:01'),
(20, 'وقافة', '2022-05-23 15:47:29', '2022-05-23 15:47:29'),
(21, 'مشاية', '2022-05-23 15:47:37', '2022-05-23 15:47:37'),
(22, 'سماعات طبية', '2022-05-23 15:48:11', '2022-05-23 15:48:11'),
(23, 'جهاز قياس الأكسجين', '2022-05-23 15:50:07', '2022-05-23 15:50:07'),
(24, 'شرائح السكر', '2022-05-23 15:50:46', '2022-05-23 15:50:46'),
(25, 'حليب (مكمل غذائي)', '2022-05-23 15:51:28', '2022-05-23 15:51:28'),
(26, 'دراجة كهربائية', '2022-05-23 15:52:18', '2022-05-23 15:52:18');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `key`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'اضافة مشرف', 'supervisor', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(2, 'عرض مشرف', 'supervisor', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(3, 'تعديل مشرف', 'supervisor', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(4, 'حذف مشرف', 'supervisor', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(5, 'اضافة متطوع', 'volunteer', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(6, 'عرض متطوع', 'volunteer', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(7, 'تعديل متطوع', 'volunteer', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(8, 'حذف متطوع', 'volunteer', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(9, 'اضافة اخصائى', 'specialist', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(10, 'عرض اخصائى', 'specialist', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(11, 'تعديل اخصائى', 'specialist', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(12, 'حذف اخصائى', 'specialist', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(13, 'اضافة مستفيد', 'beneficiary', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(14, 'عرض مستفيد', 'beneficiary', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(15, 'تعديل مستفيد', 'beneficiary', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(16, 'حذف مستفيد', 'beneficiary', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(18, 'اضافة صلاحية', 'privilege', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(19, 'عرض صلاحية', 'privilege', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(20, 'تعديل صلاحية', 'privilege', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(21, 'حذف صلاحية', 'privilege', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(22, 'اضافة جنسية', 'nationality', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(23, 'عرض جنسية', 'nationality', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(24, 'تعديل جنسية', 'nationality', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(25, 'حذف جنسية', 'nationality', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(26, 'اضافة نوع اعاقة', 'disability', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(27, 'عرض نوع اعاقة', 'disability', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(28, 'تعديل نوع اعاقة', 'disability', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(29, 'حذف نوع اعاقة', 'disability', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(30, 'اضافة نوع طلب', 'orderType', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(31, 'عرض نوع طلب', 'orderType', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(32, 'تعديل نوع طلب', 'orderType', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(33, 'حذف نوع طلب', 'orderType', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(34, 'اضافة مجال', 'field', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(35, 'عرض مجال', 'field', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(36, 'تعديل مجال', 'field', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(37, 'حذف مجال', 'field', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(38, 'اضافة وظيفة', 'job', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(39, 'عرض وظيفة', 'job', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(40, 'تعديل وظيفة', 'job', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(41, 'حذف وظيفة', 'job', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(42, 'اضافة طلب', 'order', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(43, 'عرض طلب', 'order', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(44, 'تعديل طلب', 'order', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(45, 'حذف طلب', 'order', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(46, 'اضافة مؤهل', 'qualification', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(47, 'عرض مؤهل', 'qualification', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(48, 'تعديل مؤهل', 'qualification', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(49, 'حذف مؤهل', 'qualification', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(50, 'التحكم فى الموقع', 'settings', 'supervisor-web', '2022-03-17 04:28:44', '2022-03-17 04:28:44'),
(51, 'اضافة قائمة بريدية', 'maillist', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(52, 'عرض قائمة بريدية', 'maillist', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(53, 'تعديل قائمة بريدية', 'maillist', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(54, 'حذف قائمة بريدية', 'maillist', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(55, 'اضافة تقرير', 'report', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(56, 'عرض تقرير', 'report', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(57, 'تعديل تقرير', 'report', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42'),
(58, 'حذف تقرير', 'report', 'supervisor-web', '2022-03-04 14:29:42', '2022-03-04 14:29:42');

-- --------------------------------------------------------

--
-- Table structure for table `qualifications`
--

CREATE TABLE `qualifications` (
  `id` int(11) NOT NULL,
  `qualification` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `qualifications`
--

INSERT INTO `qualifications` (`id`, `qualification`, `created_at`, `updated_at`) VALUES
(1, 'ابتدائي', '2022-03-17 06:44:46', '2022-03-17 06:44:46'),
(2, 'متوسط', '2022-03-17 06:44:55', '2022-03-17 06:44:55'),
(3, 'ثانوي', '2022-03-17 06:45:04', '2022-03-17 06:45:04'),
(4, 'دبلوم متوسط', '2022-03-17 06:45:14', '2022-03-17 06:45:14'),
(5, 'جامعي', '2022-03-17 06:45:26', '2022-03-17 06:45:26'),
(6, 'ماجستير', '2022-03-17 06:45:39', '2022-03-17 06:45:39'),
(7, 'دكتوراه', '2022-03-17 06:45:46', '2022-03-17 06:45:46');

-- --------------------------------------------------------

--
-- Table structure for table `renewal_requests`
--

CREATE TABLE `renewal_requests` (
  `id` int(11) NOT NULL,
  `volunteer_id` bigint(20) UNSIGNED NOT NULL,
  `period` int(11) NOT NULL,
  `payment_pic` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'قيد المراجعة',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `renewal_requests`
--

INSERT INTO `renewal_requests` (`id`, `volunteer_id`, `period`, `payment_pic`, `status`, `created_at`, `updated_at`) VALUES
(6, 83, 1, 'uploads/payment_pics/6/B02B09CA-4A99-455E-B882-C2EE72C85E32.png', 'قيد المراجعة', '2022-06-13 01:13:03', '2022-06-13 01:13:03'),
(7, 83, 1, 'uploads/payment_pics/7/B02B09CA-4A99-455E-B882-C2EE72C85E32.png', 'قيد المراجعة', '2022-06-13 01:13:10', '2022-06-13 01:13:10'),
(8, 83, 1, 'uploads/payment_pics/8/CD6A623C-02CF-4CDB-91F5-8C19B8FDA6F8.jpeg', 'قيد المراجعة', '2022-06-13 01:22:52', '2022-06-13 01:22:52'),
(9, 70, 1, 'uploads/payment_pics/9/A298CBDB-6942-4A78-9E8C-07BD922181D4.jpeg', 'قيد المراجعة', '2022-06-13 02:16:01', '2022-06-13 02:16:01'),
(10, 70, 1, 'uploads/payment_pics/10/A298CBDB-6942-4A78-9E8C-07BD922181D4.jpeg', 'قيد المراجعة', '2022-06-13 02:16:03', '2022-06-13 02:16:03'),
(11, 70, 1, 'uploads/payment_pics/11/A298CBDB-6942-4A78-9E8C-07BD922181D4.jpeg', 'قيد المراجعة', '2022-06-13 02:16:09', '2022-06-13 02:16:09'),
(14, 16, 1, 'uploads/payment_pics/14/91ED61D7-CBC3-40C3-AC44-07B94CF2B13B.png', 'تمت الموافقة', '2022-10-28 08:38:15', '2022-10-30 03:36:18');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `report` longtext NOT NULL,
  `specialist_id` bigint(20) UNSIGNED NOT NULL,
  `beneficiary_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'مدير النظام', 'supervisor-web', '2021-08-23 01:40:49', '2021-08-23 01:40:49');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `arabic_name` text DEFAULT NULL,
  `english_name` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `logo` text DEFAULT NULL,
  `favicon` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `arabic_name`, `english_name`, `description`, `email`, `logo`, `favicon`, `created_at`, `updated_at`) VALUES
(1, 'جمعية نور نجران النسائية لخدمة ذوي الإعاقة', 'Noor Najran Women\'s Association To Serve People With Disabilities', 'جمعية تطوعية (غير ربحية) تهدف إلى خدمة وتأهيل ذوي الإعاقة في جميع المجالات ، تأسست الجمعية تحت إشراف وزارة الموارد البشرية والتنمية الاجتماعية بترخيص رقم 1416', 'noornajran.sa@gmail.com', 'uploads/logo/1/logo.png', 'uploads/favicon/1/favicon.png', '2022-03-17 03:44:18', '2022-05-09 18:07:33');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `image_path` text NOT NULL,
  `title` text NOT NULL,
  `text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id`, `image_path`, `title`, `text`, `created_at`, `updated_at`) VALUES
(2, 'uploads/slider/2/يوسف1.jpg', 'جمعية نور نجران النسائية', 'جمعية تطوعية (غير ربحية) تهدف إلى خدمة وتأهيل ذوي الإعاقة في جميع المجالات، برقم ترخيص 1416 تحت إشراف وزارة الموارد البشرية والتنمية الاجتماعية', '2022-03-11 04:29:44', '2022-05-19 03:36:32'),
(3, 'uploads/slider/3/11.jpg', 'جمعية نور نجران النسائية', 'وذلك على يد كوكبة من أخصائيات التربية الخاصة المتطوعات في مجال تدريب وتأهيل ذوي الإعاقة على مختلف أنواعها', '2022-03-11 04:29:53', '2022-05-19 03:40:34'),
(4, 'uploads/slider/4/حسن.jpg', 'جمعية نور نجران النسائية', 'في بيئة تعليمية محفزة ومجهزة بكافة الأدوات والوسائل المساعدة التي تساهم في الارتقاء بأطفالنا لتحقيق أقصى فائدة ممكنة', '2022-03-11 04:30:01', '2022-05-19 03:43:50'),
(6, 'uploads/slider/6/55.jpg', 'جمعية نور نجران النسائية', 'كما تقدم الجمعية برامج تعديل  السلوك الإنساني والاستشارات النفسية لذوي الإعاقة وذويهم، وخدمات التدخل المبكر', '2022-04-02 08:44:46', '2022-05-19 03:54:50'),
(7, 'uploads/slider/7/احمد.jpg', 'جمعية نور نجران النسائية', 'مما يجعل الطفل قادراً على التكيف مع من حوله, وإكسابه مهارات اجتماعية لينمو ويندمج ويتكيف مع ذاته ومجتمعه', '2022-05-19 03:55:16', '2022-05-19 03:55:16'),
(8, 'uploads/slider/8/66.jpg', 'جمعية نور نجران النسائية', 'مما يجعل الطفل قادراً على التكيف مع من حوله, وإكسابه مهارات اجتماعية لينمو ويندمج ويتكيف مع ذاته ومجتمعه', '2022-05-19 03:55:44', '2022-05-19 03:55:44');

-- --------------------------------------------------------

--
-- Table structure for table `specialists`
--

CREATE TABLE `specialists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `second_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `third_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fourth_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `specialists`
--

INSERT INTO `specialists` (`id`, `first_name`, `second_name`, `third_name`, `fourth_name`, `email`, `phone_number`, `email_verified_at`, `password`, `role_name`, `Status`, `api_token`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'نورة', 'حسن', 'جار الله', 'آل هجار', 'norahalhjar83@gmail.com', '0538682714', NULL, '$2y$10$A2YpYFrz205zAJH9bKjMtONbFCclgv/bRZzeaPFID5hcAPK6R7p/m', 'اخصائى', 'active', NULL, '3zcCcgkeebL5jzpwbTQzyxRLrsOUmTJ0W7d0AfgsVHWtOl1NKfi8qf7YQmZD', '2022-05-11 16:55:19', '2022-07-02 19:55:38'),
(2, 'جميله', 'محمد', 'علي', 'المزنعي', 'jmooooll40@hotmail.com', '0508855411', NULL, '$2y$10$aSV/w0A5io7TJPBpRqEGvuco6pLDJFyRwp4TAxS.3VR2L9IxT/MMe', 'اخصائى', 'active', NULL, 'a7KlqOYUXDbhBjyff3BCUPM6qzkdXJp6pxgiQHFtSACAdwfsI66ju6j1q9uD', '2022-05-11 17:02:02', '2022-05-12 01:32:35'),
(3, 'أحلام', 'يحيى', 'حمد', 'آل همام', 'ahlam.hamam2016@hotmail.com', NULL, NULL, '$2y$10$Mzt/Ctc3qH6QNsgghkT8H.oWKEEpX9x98w7pAz6MPhytiTs4Xp4lu', 'اخصائى', 'active', NULL, NULL, '2022-05-12 01:08:42', '2022-05-12 01:08:42'),
(4, 'يارا', 'محمد', 'عبدالله', 'آل منصور', 'rorom2030@gmail.com', NULL, NULL, '$2y$10$6tv.NJj8LTT1R4JSes5ijeUGKvrnYYSML1wSkUwJwhR2N6lRQOUZu', 'اخصائى', 'active', NULL, NULL, '2022-05-12 01:12:34', '2022-05-12 01:12:34'),
(5, 'رهف', 'مهدي', 'عبدالله', 'بالحارث', 'fahif.mahdi1@gmail.com', NULL, NULL, '$2y$10$zMA92yexbz8arusR.xdALuDYkChiitZjD7zPyR2cIU1xHTUuywMTe', 'اخصائى', 'active', NULL, NULL, '2022-05-12 01:15:55', '2022-05-12 01:15:55'),
(6, 'فاطمة', 'محمد', 'اسماعيل', 'عبدالله', 'fatimah7933@gmail.com', NULL, NULL, '$2y$10$fKUKYZQPY9U6EL7hVy5HUu.8jUTFv88hjx/8U9J5iUHknnogEVkwm', 'اخصائى', 'active', NULL, NULL, '2022-05-12 01:20:59', '2022-05-12 01:20:59'),
(7, 'زكيه', 'ناصر', 'هادي', 'آل حوكاش', 'zeeeez1417@gmail.com', NULL, NULL, '$2y$10$2Gcss1NclKxARwfDyGL1xe81p2MoAJjXWwR8y8M6lr4UGOv/sa7xO', 'اخصائى', 'active', NULL, NULL, '2022-05-12 01:23:08', '2022-05-12 01:23:08'),
(8, 'رهام', 'صالح', 'حسين', 'آل صمعه', 'rehamsalih704@gmail.com', NULL, NULL, '$2y$10$RYGmBvyRDLjvX71m.8Q.9.JeDekTdx3tgwoIcN7QM81fsYqbWyl5y', 'اخصائى', 'active', NULL, NULL, '2022-05-12 01:24:48', '2022-05-12 01:24:48'),
(9, 'معجبه', 'هادي', 'حمد', 'آل دويس', 'dawas636@icloud.com', NULL, NULL, '$2y$10$TOXObnmTV7yTj/Sr1wiEO.qZwNd0S1Oa5F3JgdIAv79W0ch5/COka', 'اخصائى', 'active', NULL, NULL, '2022-05-14 00:32:02', '2022-05-14 00:32:02'),
(10, 'ساره', 'مبارك', 'هادي', 'العجمي', 'alanood1998f@gmail.com', NULL, NULL, '$2y$10$a4Mh1trDm2dBWjTV/Tkv8OCF9RegFerehRInnLl9x/aBdjonHmsEG', 'اخصائى', 'active', NULL, NULL, '2022-05-14 02:41:57', '2022-05-14 02:41:57');

-- --------------------------------------------------------

--
-- Table structure for table `specialist_password_resets`
--

CREATE TABLE `specialist_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `submits`
--

CREATE TABLE `submits` (
  `id` int(11) NOT NULL,
  `offer_id` int(11) NOT NULL,
  `qualification_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `second_name` varchar(255) NOT NULL,
  `third_name` varchar(255) NOT NULL,
  `fourth_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `record` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `cv` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `supervisors`
--

CREATE TABLE `supervisors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `second_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `third_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fourth_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_pic` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supervisors`
--

INSERT INTO `supervisors` (`id`, `first_name`, `second_name`, `third_name`, `fourth_name`, `email`, `phone_number`, `profile_pic`, `email_verified_at`, `password`, `role_name`, `Status`, `api_token`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'جمعية', 'نور', 'نجران', 'النسائية', 'noornajran.sa@gmail.com', NULL, 'uploads/profiles/supervisors/1/صورة شعار الجمعية.jpg', '2021-08-23 01:40:49', '$2y$10$7iyPnKQd9rfsGGSu9O4zWuvp6qPlAvnciC3XwoKRCNqMTnnmqgKXS', 'مدير النظام', 'active', NULL, '9emYhSSSIcGb49nPHCqiNNGT7TYX59WZdhrpYXwMNIuzvVAsxzHSBUGGBnJj', '2021-08-23 01:40:49', '2022-05-09 16:46:14');

-- --------------------------------------------------------

--
-- Table structure for table `supervisor_password_resets`
--

CREATE TABLE `supervisor_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `volunteers`
--

CREATE TABLE `volunteers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `second_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `third_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fourth_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `record` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_id` int(11) NOT NULL,
  `transfer_pic` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cv` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'قيد المراجعة',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `volunteers`
--

INSERT INTO `volunteers` (`id`, `first_name`, `second_name`, `third_name`, `fourth_name`, `email`, `phone_number`, `record`, `field_id`, `transfer_pic`, `cv`, `start_date`, `end_date`, `password`, `role_name`, `Status`, `email_verified_at`, `api_token`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'لجين', 'عبدالله', 'عواش', 'الوادعي', 'lujain.333@hotmail.com', '966560244421', '1094517255', 5, 'uploads/volunteers/transfer_pics/1/C8EE5E6F-6888-4604-99D1-11762A135D43.jpeg', 'uploads/volunteers/cvs/1/سي في.pdf', '2022-05-11', '2023-05-11', '$2y$10$fDz97f/Kwzy9XAU37oZYTeEjEombQ798i2zRFexeFmbHn6ykH7ne.', 'متطوع', 'سارى', NULL, NULL, '4ia5MCd7rNcCynhOuvFRjAzI71t8wbPJATeL7rKXjn7C1KoB8V0dLGqiFKAH', '2022-05-11 15:11:12', '2022-05-11 15:12:19'),
(2, 'فاطمة', 'مانع', 'محمد', 'آل هتيلة', 'fatimahmana.2019@gmail.com', '0530131291', '1082262633', 5, 'uploads/volunteers/transfer_pics/2/7380C299-3520-4BE0-9C93-172F0D3E165C.png', 'uploads/volunteers/cvs/2/16838d95-1512-4e27-b9f0-05516092c0e6.pdf', '2022-05-11', '2023-05-11', '$2y$10$iJkzHHsokk56aF9hMVHCa.manYFIA0URx/hSTtme7qC4sOVaDn/5a', 'متطوع', 'سارى', NULL, NULL, 'OS7IzOOv3Co17MwK5XixXQQ0GNj7UxEdiT79dhxVirPUMl8rf5WBiE9ATuOM', '2022-05-11 15:31:04', '2022-05-14 02:34:48'),
(4, 'شاهره', 'صالح', 'محمد', 'ال لبيد', 'allbeedshah@GMAIL.COM', '966503079723', '1126986338', 10, 'uploads/volunteers/transfer_pics/4/E0C54E84-92CA-4E3A-8155-45882CEB4990.jpeg', 'uploads/volunteers/cvs/4/temp80.pdf', '2022-05-11', '2023-05-11', '$2y$10$ZaOCImJObgDQSLtLDZADZuV3nr7N0821LxW1w3PUQ4wxhGYnXGXAq', 'متطوع', 'سارى', NULL, NULL, 'MRl0pcEs9T06Uuay6JFJqz2SeHPGOf6ghm56mDQqaanKxTpjnHSYAUbyIIhp', '2022-05-12 00:27:44', '2022-05-12 00:44:24'),
(5, 'غادة', 'محمد', 'غالب', 'آل مستنير', 'tate4322@hotmail.com', '966556431127', '1062466212', 5, 'uploads/volunteers/transfer_pics/5/image.jpg', 'uploads/volunteers/cvs/5/نور نجران.pdf', '2022-05-11', '2023-05-11', '$2y$10$DR4JSM.o8bHGQfljiaCl2e3ep1OmSwRqhWUQRN/vqEB3emFSgvqoK', 'متطوع', 'سارى', NULL, NULL, '9NOMFAyW83sfKAkGzxdnnlncuSUpG6oehdzJR4jm1JRfCZHdZCplxWCA9usd', '2022-05-12 00:50:12', '2022-05-12 00:53:54'),
(6, 'نوال', 'صالح', 'حمد', 'ال فلكه', 'Noony222015@hotmail.com', '966535053686', '1089376303', 5, 'uploads/volunteers/transfer_pics/6/47BC4027-EBAF-4F37-9CC2-9897D1341F9A.png', 'uploads/volunteers/cvs/6/٢٠٢٢-٠٣-٠٥ ٠٥.٣٣.٥٦(3).pdf', '2022-05-13', '2023-05-13', '$2y$10$3QacYzLDsWfGFgUECQZSquoMbbhGs9txJt.tyOxKyI4choaDLNfOm', 'متطوع', 'سارى', NULL, NULL, 'aCTcn6Z3biTElY0Gcx7K4ms1bkthDZk0roAHpOyPCRnMsvahYo8ItZTmktTp', '2022-05-12 14:28:03', '2022-05-14 00:29:35'),
(7, 'نرمين', 'حمد', 'صالح', 'ال بالحارث', 'Nimee1991@hotmail.com', '966504537001', '1071316440', 5, 'uploads/volunteers/transfer_pics/7/476A67AE-6815-4D16-8649-9C7767503B00.jpeg', 'uploads/volunteers/cvs/7/السيره سارة.pdf.pdf.pdf', '2022-05-13', '2023-05-13', '$2y$10$NYcfHgMC5Dc7AAyUOw7SSOVK5jQ.0LacP.LSkcGEzSGWsavv0yOle', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-05-13 08:58:41', '2022-05-14 00:30:18'),
(8, 'مريم', 'فارس', 'محمد', 'ال دويس', 'meryamfares04@gmail.com', '563172324', '1097196446', 5, 'uploads/volunteers/transfer_pics/8/A182F4BA-783C-41C3-98EA-E35D502FC2DA.jpeg', 'uploads/volunteers/cvs/8/_.cv2022.pdf', '2022-05-13', '2023-05-13', '$2y$10$N0zVTukTHuuBJd0D3kZwO.ehH/cBuFvWBXjV8IyvDzd9PgnLV5abi', 'متطوع', 'سارى', NULL, NULL, 't34BQV4olIRePSKpmk5P6oFKTq5wmaHfHVsRXYfyUfwKis4q1Zt1njtKAGsL', '2022-05-14 00:53:04', '2022-07-21 05:00:51'),
(9, 'نسرين', 'محمد', 'هادي', 'العجي', 'mooon1140@outlook.sa', '557634986', '1043307238', 5, 'uploads/volunteers/transfer_pics/9/20954000-6C7D-4EA9-80EF-B082D2EEC9A2.png', 'uploads/volunteers/cvs/9/سيرة ذاتيه.pdf', '2022-05-13', '2023-05-13', '$2y$10$lqNCtQGk2ScKW2k0cO2WSeurWEul4FElrHCrV4itKcg2sLhyQx7bG', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-05-14 02:57:39', '2022-05-14 04:33:51'),
(10, 'أروى', 'صالح', 'علي', 'ال منصور', 'fafa.1250@icloud.com', '966551782584', '1089944159', 5, 'uploads/volunteers/transfer_pics/10/2ED7E775-38BD-41F5-B8BD-4BB6E2D58423.jpeg', 'uploads/volunteers/cvs/10/arwa.pdf', '2022-05-13', '2023-05-13', '$2y$10$KJD4vUyg9grgCeIzzBxJvOLqa3184E2bT0ORl.Dpi4I4/QzINHgju', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-05-14 03:26:26', '2022-05-14 04:11:09'),
(11, 'سلمى', 'حسين', 'صالح', 'آل مستنير', 'sa-7ussain@hotmail.com', '966557430847', '1076769700', 9, 'uploads/volunteers/transfer_pics/11/E9ADBB4A-93A6-4DA2-B3DF-BF64E26360E5.jpeg', 'uploads/volunteers/cvs/11/سيرة سلمى.pdf', '2022-05-13', '2023-05-13', '$2y$10$9lZILW6ShyKTyef0jEpKjO.Mi98ZliD2iTF1V8wMhvJErS0uX7CI.', 'متطوع', 'سارى', NULL, NULL, 'KxWNDZEmr2bz0StctGQHTBV1YJNJgmvGKBoRR6L8s2kKXvC0HEa4rS15agnv', '2022-05-14 03:28:31', '2022-05-14 04:12:06'),
(12, 'روان', 'سليم', 'علي', 'لسلوم', 'rawanlsloom@gmail.com', '966554935539', '1094560362', 5, 'uploads/volunteers/transfer_pics/12/D6AE1C8D-58A8-4996-AB7A-1B093878518B.png', 'uploads/volunteers/cvs/12/السيره الذاتيه ...pdf', '2022-05-13', '2023-05-13', '$2y$10$GBC1I.gjcwSPlBjhS1KOauhNp1RESg/COwKXlN0Em4fIsMN9nhtj2', 'متطوع', 'سارى', NULL, NULL, 'Mv9FUB4YnZxCo78Qc8nI0AhXSdilXLMzxJIzYg7KvkSaElAMqNLoESlFlg6A', '2022-05-14 03:31:05', '2022-05-14 06:03:49'),
(13, '‏أماني', 'عبدالله', 'يوسف', 'المكرمي', 'Minhali838@gmail.com', '0551080838', '1080880279', 5, 'uploads/volunteers/transfer_pics/13/965DF124-E161-4779-89C8-21DA7E3624C8.png', 'uploads/volunteers/cvs/13/‏سيفي .pdf', '2022-05-13', '2023-05-13', '$2y$10$v3yVGQDIb/7VqfWAr7aoXOI.eNuhaaAJ9dJD7RG9YeX.Vz5FQJPQ2', 'متطوع', 'سارى', NULL, NULL, 'Mjjt5Zlkv1l1WhrcsEJHw2DPDEbp0UyGrmc1eeJ8vMrHgQJ1ISHcu44H3fQ5', '2022-05-14 03:32:43', '2022-05-14 04:20:21'),
(14, 'سيناء', 'صالح', 'سعد', 'ال قنه', 'snaf2@windowslive.com', '966530220763', '1108472521', 5, 'uploads/volunteers/transfer_pics/14/IMG-20220426-WA0001.jpg', 'uploads/volunteers/cvs/14/السيرة الذاتية سيناء.pdf', '2022-05-13', '2023-05-13', '$2y$10$sOxWn348Wm3tllaGUnZ14uOZbWVoYjDKTl9lkJDcrgh8VA7R1vJ/i', 'متطوع', 'سارى', NULL, NULL, 'DsAU2zwlOIgWLlrc2r5b9XrPtxXTHdvx4bs8YNquFKo3HgV7OO911KlHvq0h', '2022-05-14 03:34:15', '2022-07-21 22:25:42'),
(15, 'اروى', 'مهدي', 'حمد', 'ال سالم', 'arwa212020@outlook.sa', '558034418', '1103455802', 5, 'uploads/volunteers/transfer_pics/15/EFEC060A-671F-46D0-A561-ED80E0C3031D.png', 'uploads/volunteers/cvs/15/أروى آل سالم.pdf', '2022-05-13', '2023-05-13', '$2y$10$l2lqC1tgPBAXvCltwWdft.sDFRtzqjUtPjAu1Eb8q5yo5/ovfbsp6', 'متطوع', 'سارى', NULL, NULL, 's7DC1i374JdwBpf2w3n000iiZRRp9XhHCwgWywzNrzzgGX8Ymf5h07weKnj1', '2022-05-14 03:35:21', '2022-05-14 04:36:30'),
(16, 'زكيه', 'ناصر', 'هادي', 'ال حوكاش', 'zeeeez1417@gmail.com', '508533849', '1091009512', 7, 'uploads/volunteers/transfer_pics/16/35319708-D4E9-4252-8665-BD7BD2B6E771.jpeg', 'uploads/volunteers/cvs/16/سيرة ذاتيه.pdf', '2022-10-29', '2023-10-29', '$2y$10$esFVxuh2P0pBrunRQAEQmetXtyW2HaQ.PQZO0xEvdzf9lG74sSCEa', 'متطوع', 'سارى', NULL, NULL, 'fP7VWr8D6JBH49VZWc10GRfVrPqrChrNN9mPRmlMShhZ95N7lmjYizjf1Nir', '2022-05-14 03:35:40', '2022-10-30 03:36:17'),
(17, 'إيمان', 'حمد', 'محمد', 'ال منجم', 'emaan38hamad@hotmail.com', '557031825', '1084279098', 5, 'uploads/volunteers/transfer_pics/17/Screenshot_20220513_203525_com.google.android.apps.docs.jpg', 'uploads/volunteers/cvs/17/السيرة الذاتية إيمان حمد ال منجم.pdf', '2022-05-13', '2023-05-13', '$2y$10$dcDKMwk715NTPj48tOR4.u3mSfyxw1G.dRIQY3acWT6hcm7t/9XuS', 'متطوع', 'سارى', NULL, NULL, 'whhll7ICCEWv0xY2LgTZI2qcjGjrIWbvtA0MYf8ycvlMG6B1qB2ZpTExdSYX', '2022-05-14 03:35:57', '2022-05-14 04:50:45'),
(18, 'يارا', 'محمد', 'عبدالله', 'ال منصور', 'rorom2030@gmail.com', '0536661089', '1084371119', 7, 'uploads/volunteers/transfer_pics/18/E6B20F57-2842-4338-BA37-94CD53FE8E52.jpeg', 'uploads/volunteers/cvs/18/197AF0F4-2118-4425-B8B0-7E2454A9D442.pdf', '2022-05-13', '2023-05-13', '$2y$10$LCCXqwFzmU3uozMrg5DlCuHXgjaDqKxuImWU3chLJa2Rzi/Ls30xm', 'متطوع', 'سارى', NULL, NULL, 'MyncIW41qLW7k2zn056Xmihr6vLA7w5YhbdaT5fCnAS1i8Nc4p37wLvJBN4p', '2022-05-14 03:39:36', '2022-05-14 04:48:53'),
(19, 'جميلة', 'محمد', 'علي', 'المزنعي', 'jmooooll40@gmail.com', '966508855411', '1061406763', 7, 'uploads/volunteers/transfer_pics/19/D2F0389B-67EC-48C5-9A31-B63F8E15B1ED.png', 'uploads/volunteers/cvs/19/CV.pdf', '2022-05-13', '2023-05-13', '$2y$10$/Gygux9UfobRl9Pp.7wZd.tb9gwMAwVn19.G/qdZlyx9e9pw5Iuqq', 'متطوع', 'سارى', NULL, NULL, 'tKJP76ckpMJbQMdcczTIDFhgFTrLCKgsxEJYUCQZmCmHYSXCKlAHHDq4Yt0M', '2022-05-14 03:46:44', '2022-05-14 04:12:38'),
(20, 'مراسيل', 'شريف', 'محمد', 'الصقور', 'meme.alsgoor1414@gmail.com', '536161021', '1083422384', 5, 'uploads/volunteers/transfer_pics/20/6229C60A-70E8-4665-8F38-7A77E5834914.jpeg', 'uploads/volunteers/cvs/20/السيرة الذاتية.pdf', '2022-05-13', '2023-05-13', '$2y$10$TaxfNyzdASah2H94quIGO.bxEy6uzpWH0/TxoA/LfnlxcyYucDZV2', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-05-14 03:47:46', '2022-05-14 04:35:17'),
(22, 'رهام', 'صالح', 'حسين', 'ال صمعه', 'rehamsalih704@gmail.com', '0590978874', '1151502828', 7, 'uploads/volunteers/transfer_pics/22/1902D778-5850-4532-9F5E-D25886925E9F.jpeg', 'uploads/volunteers/cvs/22/62CADE85-9D70-44AF-8B6A-A8DF44715D69.pdf', '2022-05-13', '2023-05-13', '$2y$10$Ncd/jJ4PByEEQDblPqCLqePt5dHirTIIx2qaMAFs7ZrxVYdN5X7H6', 'متطوع', 'سارى', NULL, NULL, 'yzHMkHCDefIxtHUVxG4MEtY6EJmik0KVurVgL7ANmxHOLGWtoknKEMCJ6vXu', '2022-05-14 03:54:56', '2022-05-14 04:21:03'),
(23, 'نورة', 'حسن', 'جارالله', 'ال هجار', 'norahalhjar83@gmail.com', '0538682714', '1082987023', 7, 'uploads/volunteers/transfer_pics/23/Screenshot_٢٠٢٢٠٥١٣-٢٠٥٢٤٢_alrajhi bank.jpg', 'uploads/volunteers/cvs/23/Emailing نورة حسن جار الله حمران ال هجارpdf_210827_014218.pdf', '2022-05-13', '2023-05-13', '$2y$10$zmB6TfGjWPhs9uxQ.3NprO0dyKGIWlOOyFswr7Av/QlAe4oHv3eNu', 'متطوع', 'سارى', NULL, NULL, 'bk4uzG0q0DHTuaeEeiEYttirTjeiIjEgJbHXU9wAsP3rC4pDCyErIg2QKJxD', '2022-05-14 03:55:25', '2022-07-02 20:21:10'),
(24, 'مايا', 'عبدالله', 'محمد', 'ال سعد', 'May6767m@hotmail.con', '966502059874', '1094863568', 7, 'uploads/volunteers/transfer_pics/24/C8594E2F-F759-49EF-9C01-EAECFFE91274.png', 'uploads/volunteers/cvs/24/مايا عبدالله.pdf', '2022-05-13', '2023-05-13', '$2y$10$9SsKZdJZwNV2OH1XRzXV.OC.Igt3ZMB/3/59XshXD/66gdOXZCTG2', 'متطوع', 'سارى', NULL, NULL, 'iTplj1LEvdXUzLGcEjM2eM3yj5jT0fIIYYERoFVilWyEHH5bCdxsxSANfgh5', '2022-05-14 03:57:15', '2022-05-14 04:13:06'),
(26, 'زهور', 'علي', 'قاسم', 'البكري', 'zozo112233445553@gmail.com', '0533206460', '1029228572', 5, 'uploads/volunteers/transfer_pics/26/0E73514C-8A85-435E-A8A3-A2F51F067A77.jpeg', 'uploads/volunteers/cvs/26/زهور علي قاسم البكري.pdf', '2022-05-13', '2023-05-13', '$2y$10$PVBmObAaGIDYz.zPsTz0pO8QK5mDlm/77xLzDAiwHJRxFHjcHmfCe', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-05-14 04:03:33', '2022-05-14 04:20:47'),
(27, 'افنان', 'علي', 'دباش', 'رجب', 'afn67890@gmail.com', '966502472691', '1096792526', 12, 'uploads/volunteers/transfer_pics/27/0B89B42F-123D-4E03-9A05-B0CC1F5DC682.jpeg', 'uploads/volunteers/cvs/27/أفنان علي دباش رجب.pdf', '2022-05-13', '2023-05-13', '$2y$10$wSsS6AxPFFIjv.rmev5/6uZ6K0sjqXx4LzvglPD8tg5rR/OuNq5tS', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-05-14 04:05:55', '2022-05-14 04:13:48'),
(28, 'الزهراء', 'عبدالله', 'حسين', 'الشريف', 'zhraabdallh1@gmail.com', '966530599608', '1103323919', 12, 'uploads/volunteers/transfer_pics/28/A7A9E1D9-A3C7-49A8-B83C-1CE9DC90CABB.jpeg', 'uploads/volunteers/cvs/28/{ السيره الذاتيه }.pdf', '2022-05-13', '2023-05-13', '$2y$10$x.A6gXtzh8YhBSDT37Fr..3INpvMU8Xo3PhR8tpHdbd/MNyTGZP1G', 'متطوع', 'سارى', NULL, NULL, 'OfDmIvpRLEtALbBMkWgd6WOR01TFSWzUxhkNfslr8QgAxQlB0MQ6B2u1sheU', '2022-05-14 04:13:40', '2022-05-14 04:14:19'),
(29, 'فاطمه', 'ضيف الله', 'يحيى', 'الشريف', 'fa6mx0@gmail.com', '966559115350', '1113627820', 8, 'uploads/volunteers/transfer_pics/29/998549A8-CFE5-4026-9604-91FB53BAAA06.jpeg', 'uploads/volunteers/cvs/29/Cv فاطمه .pdf', '2022-05-13', '2023-05-13', '$2y$10$liOcZw/ITTJ68yYKdmDLceIjEkbP2t/aOq0w40Pf9ANLIfxtNhgHa', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-05-14 04:19:39', '2022-05-14 04:20:34'),
(30, 'معجبه', 'هادي', 'حمد', 'آل دويس', 'dawas636@icloud.com', '0537134636', '1090519339', 7, 'uploads/volunteers/transfer_pics/30/387E78AF-5DB5-4DD0-B4A9-5E25E0D44DB3.jpeg', 'uploads/volunteers/cvs/30/Najran University.pdf', '2022-05-13', '2023-05-13', '$2y$10$kx.5Zs4TsPDwraw3pTlf0uRbWD6Hlb.QxTksFynOPHW5TqLyvkani', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-05-14 04:32:10', '2022-05-14 04:34:25'),
(31, 'منى', 'عليان', 'حسين', 'ال مصلوم', 'My776044@gmail.com', '0552240867', '1100906575', 5, 'uploads/volunteers/transfer_pics/31/image.jpg', 'uploads/volunteers/cvs/31/ روز.pdf', '2022-05-13', '2023-05-13', '$2y$10$qg5BXXwHytb3BsWbp1BrKOStcgXAnwKUG4ht2OaTJeX0zlBgWnqVG', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-05-14 04:33:51', '2022-05-14 04:34:19'),
(32, 'احلام', 'يحيى', 'حمد', 'الهمام', 'ahlam.hamam2016@hotmail.com', '0503111280', '1093321717', 7, 'uploads/volunteers/transfer_pics/32/8143F1DA-9B64-4A33-9C96-35016CD08521.png', 'uploads/volunteers/cvs/32/cv.pdf', '2022-05-13', '2023-05-13', '$2y$10$a25LzgiQ9Y3x5Io/dhepl.8iNZ8N3PeRXlyAixvnUPWVO9JABM46O', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-05-14 04:35:35', '2022-05-14 04:36:12'),
(33, 'سماح', 'قبلان', 'علي', 'ال فطيح', 'sammah2@hotmail.com', '966538980908', '1099305342', 9, 'uploads/volunteers/transfer_pics/33/6C9581D6-2DC8-4540-8B26-1033C3FCFB87.png', 'uploads/volunteers/cvs/33/السيرة الذاتية لسماح 2022.pdf', '2022-05-13', '2023-05-13', '$2y$10$J6LDTRmkf77AIZldHBdOqeC3KeKgPsqkYdAUHOg0jHZ2Cqa1HT9ty', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-05-14 04:37:10', '2022-05-14 04:40:09'),
(34, 'هنادي', 'منصّر', 'عساف', 'الشريف', 'hmalshareef3@gmail.com', '966500695702', '1090200849', 5, 'uploads/volunteers/transfer_pics/34/A242F244-0FC4-4938-928D-8ED1C1347631.png', 'uploads/volunteers/cvs/34/السيرة الذاتية هنادي  منصر الشريف .pdf', '2022-05-13', '2023-05-13', '$2y$10$Vr0snqXqJs30cKmP8IltRe0Nr4ZY8sEvHAvbndSaF96RvvMAbN4Qm', 'متطوع', 'سارى', NULL, NULL, '2byzj72GMjTZBCSKuZnlVIQ5ZpKYXEHnOkldQG0aeF3UuxgMmKv3ksVyCMtf', '2022-05-14 04:38:30', '2022-05-14 04:41:20'),
(35, 'فاطمة', 'محمد', 'إسماعيل', 'اليامي', 'Fatimah7933@gmail.com', '966559080314', '1016431304', 7, 'uploads/volunteers/transfer_pics/35/Screenshot_20220513-213407_Xodo Docs.jpg', 'uploads/volunteers/cvs/35/fatemeh cv.pdf', '2022-05-13', '2023-05-13', '$2y$10$/dk1qqFrqBeJ1rELa9CqUe8GSp0Qc.DsJYem8HYrTJAZSbVRXMVFO', 'متطوع', 'سارى', NULL, NULL, 'FrT9V1xtk1Jl5GgFmll9K6cdjGPVTrzyDIz5zYb08nLlb0UumjFk1gAJROx7', '2022-05-14 04:38:50', '2022-05-14 04:39:44'),
(36, 'احلام', 'يحيى', 'حمد', 'الهمام', 'hl.589698@gmail.com', '966503111280', '1093321717', 7, 'uploads/volunteers/transfer_pics/36/6F6C4A33-63E1-4D3A-A083-742B6A1FEB25.jpeg', 'uploads/volunteers/cvs/36/cv.pdf', '2022-05-14', '2023-05-14', '$2y$10$D3.1RVjUCYKeSOOefhZeuu6A070aLurLa149KMi.JHblN9nE9ik0q', 'متطوع', 'سارى', NULL, NULL, 'obPhNivLgaXnatHvHub408dEY4xZcPrjUz69JEtxe9wRILsIBlajJqvd6sfx', '2022-05-14 04:45:27', '2022-05-15 03:15:47'),
(37, 'غادة', 'أحمد', 'محمد', 'الغباري', 'ghadah9313@gmail.com', '966503783302', '1081581876', 9, 'uploads/volunteers/transfer_pics/37/IMG-20220513-WA0018.jpg', 'uploads/volunteers/cvs/37/2022_4_1_5f0c133e-017c-478e-8c28-162eee6b376d.pdf', '2022-05-14', '2023-05-14', '$2y$10$r9aPybEdBUf.X1KFoB.L0uQKvvimTjKtsjANZ1ayNdQhlzoQO.93a', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-05-14 04:49:33', '2022-05-15 03:15:39'),
(38, 'خلود', 'يوسف', 'سعيد', 'القاضي', 'kkkhhhh9090@icloud.com', '0552088589', '1123850834', 9, 'uploads/volunteers/transfer_pics/38/9EF69118-F6F8-4066-BDF8-E33D5CEEF242.png', 'uploads/volunteers/cvs/38/سيرة ذاتية.pdf', '2022-05-14', '2023-05-14', '$2y$10$gufYiOvwT92cM9ECALgEgOnwgTVM0A9S1qK3sq24pbIPsPV/Ilwzm', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-05-14 05:07:02', '2022-05-15 03:15:30'),
(39, 'فاطمه', 'محمد', 'احمد', 'الشريف', 'fatmahmohammed80@gmail.com', '0599554046', '1105254112', 12, 'uploads/volunteers/transfer_pics/39/A61C0717-96F4-4442-9833-0857D94256ED.png', 'uploads/volunteers/cvs/39/(Curriculumvita.pdf', '2022-05-14', '2023-05-14', '$2y$10$BJp1B0pKk7Gmh1MSAiSkoeQmrS4O3rM0IPi5JYPhYL1N/RrpcPg3a', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-05-14 05:25:38', '2022-05-15 03:15:21'),
(40, 'ساره', 'مبارك', 'هادي', 'العجمي', 'alanood1998f@gmail.com', '966538268099', '1101942066', 7, 'uploads/volunteers/transfer_pics/40/9FAFBB09-8194-4528-97F7-61F1D62225B1.jpeg', 'uploads/volunteers/cvs/40/سيرة ذاتيه ساره.pdf', '2022-05-14', '2023-05-14', '$2y$10$toeFy1Tfha3n0IuCn2jnBOEnSd3K70pNN3eeBrkB8Rvs1hVcFSJca', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-05-14 05:31:50', '2022-05-15 03:14:50'),
(41, 'ذكرى', 'علي', 'احمد', 'الشريف', 'thekraa1419@gmail.com', '966543568212', '1116750231', 12, 'uploads/volunteers/transfer_pics/41/FF1B4BC4-D683-434C-B8A5-7956914D1FCC.png', 'uploads/volunteers/cvs/41/‏لقطة شاشة ٢٠٢١-٠٩-٠٣ في ٦.٠٣.٥٣ م.pdf', '2022-05-14', '2023-05-14', '$2y$10$cTusofltp/W00revylvQPONb3A/7pYooF8IbW5lPKUPb6dmBD9/P2', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-05-14 05:41:26', '2022-05-15 03:14:44'),
(42, 'فاطمه', 'مسفر', 'علي', 'آل لشعث', 'ffatiimah5@gmail.com', '502487578', '1082475110', 12, 'uploads/volunteers/transfer_pics/42/2A6F8D67-39B9-4965-9DA5-440629D53B08.jpeg', 'uploads/volunteers/cvs/42/pdf_20220109_203106_٠٠٠٠.pdf', '2022-05-14', '2023-05-14', '$2y$10$VV8nflqTyXI7CDRcODNq5u8nGM//H.EV1BR35WaU1VP2Mmwu9d/rq', 'متطوع', 'سارى', NULL, NULL, 'NpucdE5P6WPIc2ngNfVjsXEkCQkWQsldlLsfUC2oKB43uCl7zs2QF1msaTbi', '2022-05-14 06:03:15', '2022-09-27 05:57:36'),
(43, 'رهف', 'مهدي', 'عبدالله', 'بالحارث', 'Rahif.mahdi1@gmail.com', '537454163', '1094450564', 7, 'uploads/volunteers/transfer_pics/43/D2EB3275-0948-4929-962C-D3972062380D.jpeg', 'uploads/volunteers/cvs/43/سيرة ذاتية رهف.pdf', '2022-05-14', '2023-05-14', '$2y$10$fedl7GdPmUxISNIleeTGDusAkYObEcF7ODIr.D4g7V4vX0Oes04Cq', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-05-14 07:17:51', '2022-05-15 03:14:14'),
(44, 'ساره', 'فارس', 'قميش', 'ال دغرير', 'amani.gomesh@gmail.com', '966533137230', '1109735702', 9, 'uploads/volunteers/transfer_pics/44/1CE5B8EA-531A-4D6C-B451-982F9683728A.jpeg', 'uploads/volunteers/cvs/44/٢٠٢٢-٠٥-١٤ ١٢.٤٧.٣٥.pdf', '2022-05-14', '2023-05-14', '$2y$10$zVDVy.lkJEXOETlnOkcDhOAeV3zzCHm3Fi9hbXp6Mc7V90dvC1nAC', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-05-14 08:14:47', '2022-05-15 03:14:07'),
(45, 'آمنه', 'أحمد', 'صالح', 'اليامي', 'gaklin.211@gmail.com', '966509500392', '1081340059', 5, 'uploads/volunteers/transfer_pics/45/Screenshot_20220514_025353_com.whatsapp.jpg', 'uploads/volunteers/cvs/45/سيرة آمنة أحمد.pdf', '2022-05-14', '2023-05-14', '$2y$10$YWK0zc.YGCTaKUVxjR1h6eHjFaJ9TPdO4zr2eVCSj/zyq3i9ZMeLK', 'متطوع', 'سارى', NULL, NULL, 'D14y92uqxWv6b6qsziNenMWsiuBJbl7o9iAiMTypG6a8sEjUIglPR6AR8IlE', '2022-05-14 09:58:48', '2022-06-12 23:48:28'),
(46, 'بتول', 'مسعود', 'صالح', 'ال مستنير', 'Weminsdat@gmail.com', '508787415', '1096624505', 5, 'uploads/volunteers/transfer_pics/46/680D56B8-3527-4906-8CA7-8F0EBC12B8F7.jpeg', 'uploads/volunteers/cvs/46/سيرة بتول حكلي .pdf', '2022-05-14', '2023-05-14', '$2y$10$YoKDrxeP7nYNWVWOidyxkutIjAaftRXRFcikRtNrgWy2B6KQP3USq', 'متطوع', 'سارى', NULL, NULL, 'Qf0SImW8TIVDB6a9nhO776EC69z6WvtyOnAVdqqWvT2ZYVO3caZXHU0nGBno', '2022-05-14 13:17:31', '2022-05-15 03:13:37'),
(47, 'البتول', 'مهدي', 'حسين', 'ال جعرة', 'Albtool995@hotmail.com', '966555993415', '1087246631', 7, 'uploads/volunteers/transfer_pics/47/626EE384-AED3-4C4C-B7C7-A16BB43C8409.jpeg', 'uploads/volunteers/cvs/47/السيرة الذاتية البتول.pdf', '2022-05-14', '2023-05-14', '$2y$10$YdU7gqfyMKKusuaO1pxfoOrDTIkgY74hTgSawirRqGnC8F23GXmm.', 'متطوع', 'سارى', NULL, NULL, 'BwKBGJ2wNGW8zw11jLPtEYUap6QDT3gQGm13QEYYsCdtM3StMU5UvwUpj8xm', '2022-05-14 19:19:20', '2022-07-02 17:46:44'),
(48, 'مرام', 'حمد', 'ظافر', 'الصقور', 'maram.199781@outlook.sa', '966509460197', '1095394738', 5, 'uploads/volunteers/transfer_pics/48/63CABD88-22C3-4C0D-AA77-DEFB0819833E.jpeg', 'uploads/volunteers/cvs/48/CV new.pdf', '2022-05-14', '2023-05-14', '$2y$10$7mRw/xMgS/FzJmCnmvRA0OiT5o67ZV12pOKdeAhb.BVceOIE1nIcm', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-05-14 23:01:23', '2022-05-15 03:12:56'),
(49, 'رهام', 'محمد', 'حسن', 'ال قدره', 'rreee218@gmail.com', '966553855975', '1065969006', 5, 'uploads/volunteers/transfer_pics/49/1413D7FD-E08A-48A7-9125-D9E8B5E8A5EE.jpeg', 'uploads/volunteers/cvs/49/سيرتي الجديدة 2022.pdf', '2022-05-14', '2023-05-14', '$2y$10$jsTo1sRIpca.H9ASHe3eWewlx5tIvyaqyOPn91SChJftlE60WffE.', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-05-15 00:46:47', '2022-05-15 03:12:45'),
(50, 'مي', 'حمد', 'ظافر', 'الصقور', 'm.alsagooor99@gmail.com', '966557004209', '1079861900', 6, 'uploads/volunteers/transfer_pics/50/سند تحويل.pdf', 'uploads/volunteers/cvs/50/CV2 (1).pdf', '2022-05-17', '2023-05-17', '$2y$10$P/teW3JMGUGUsDdWnCufseuBJX6tMM09132i8i/skN/KkUNpDiRF6', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-05-15 23:08:36', '2022-05-18 05:45:05'),
(51, 'سهام', 'ناصر', 'حسين', 'ال ساعد', 'seham336633@gmail.com', '0552131573', '1065867184', 5, 'uploads/volunteers/transfer_pics/51/6846B930-92E2-43AA-93A5-D5AC5746DE0C.jpeg', 'uploads/volunteers/cvs/51/سيرة.pdf', '2022-05-21', '2023-05-21', '$2y$10$KGBofMBzOKVLznoExAAZxe4GlU4jVbdqFJQt/w7NOgOPaT1s0G4Mi', 'متطوع', 'سارى', NULL, NULL, 'H5PDWAyBq7CijqQIBPU5phndSqoN29D7nn0QKIea4suYs4DbKnmC7Cqr9E1H', '2022-05-20 23:16:31', '2022-05-22 09:40:40'),
(52, 'مجاهد', 'مهدي', 'محمد', 'آل سليم', 'zcx57mml@gmail.com', '966554653646', '1104297948', 5, 'uploads/volunteers/transfer_pics/52/B30C9720-C53F-4BF2-91B8-20B7DFCD0F2E.jpeg', 'uploads/volunteers/cvs/52/C V.pdf', '2022-05-21', '2023-05-21', '$2y$10$tO6UqcY9OXEQXtALy0UJle6ziMl0ORdHd34R1E4C0XYV88WJushb6', 'متطوع', 'سارى', NULL, NULL, 'D0PhAaRcdKEuZebJWxBJnQIC8fQuqJuaSlZQ05cZfZuFXqpLaHWFMfe7LpJ6', '2022-05-22 02:56:54', '2022-05-22 04:13:29'),
(53, 'وافي', 'محمد', 'حمد', 'آل سليم', 'Tuo_2000@hotmail.com', '0556552078', '1036006052', 6, 'uploads/volunteers/transfer_pics/53/مستند جديد ٢٠٢٠-٠٩-١٥ ١٦.٥٢.٣٥_4.jpg', 'uploads/volunteers/cvs/53/وافي محمد (1).pdf', '2022-05-23', '2023-05-23', '$2y$10$9qEOxkKjZ/6.RJYnoJjNAeDN8wPqV2J8ZVlJFJ9Oenm7cksqznUyS', 'متطوع', 'سارى', NULL, NULL, 'xF5STKIVahBU9wRhfAKieHfoULIblCSLqKGLFxXrxr3fjRhTqUWMYvZ4Qjmk', '2022-05-22 19:53:09', '2022-05-23 15:44:17'),
(54, 'مهره', 'حسين', 'مسعود', 'ال حابس', 'a439403563@gmail.com', '531353866', '1030828550', 9, 'uploads/volunteers/transfer_pics/54/F288D082-F1D8-4DA4-A4ED-067362F34E06.jpeg', 'uploads/volunteers/cvs/54/New Note.pdf', '2022-05-27', '2023-05-27', '$2y$10$BPYhM79cpq/LmqNae4ezkukLX5PiTIs4Kukt9npIsUn902.rnHEBi', 'متطوع', 'سارى', NULL, NULL, 'JeT2gpqoeRKflGL86cDt33xarr7WFhYKTHygkIkBWgEC8lAK8s8BBdUtYVoE', '2022-05-24 15:51:26', '2022-05-28 02:03:24'),
(55, 'العنود', 'سالم', 'علي', 'آل حمامة', 'nodsalem70@gmail.com', '0556586655', '1094501465', 7, 'uploads/volunteers/transfer_pics/55/0BFCDDE0-D28E-47F1-92C6-9CF5CFCB5458.jpeg', 'uploads/volunteers/cvs/55/9D061EC6-4F8C-4F73-B1EF-CF74121BAB35.pdf', '2022-06-10', '2023-06-10', '$2y$10$dabBfmSergda/f9SELt3.uo740LHyMXntYNYB2UkhpG/rEvTILyBO', 'متطوع', 'سارى', NULL, NULL, 'KSLGnl42SFfjbx0v5Mj8YPRAt7VZQYowI4nDN7Nh2iH1C4Ac95spOWADPi9Q', '2022-06-08 03:40:03', '2022-06-13 04:27:28'),
(56, 'اسمهان', 'فارس', 'حمد', 'ال منصور', 'asmahan6300@gmail.com', '966508303463', '1106504333', 8, 'uploads/volunteers/transfer_pics/56/3098F212-248C-41F3-98FD-C7E45F6C26E9.jpeg', 'uploads/volunteers/cvs/56/السيرة الذاتيه.pdf', '2022-06-10', '2023-06-10', '$2y$10$pQ4r9ScFqZMtsgsYKExkUOOCBLrjTiNvpCOR1ZMwLZ.8GZ5N8QRKS', 'متطوع', 'سارى', NULL, NULL, 'lqSxNctx3pjJ0Bg0CtYl3MKv5g3yDkRdID76Kye8JqgqT7hJBtF0k8F8jKp0', '2022-06-08 04:34:13', '2022-06-10 09:20:55'),
(57, 'غيداء', 'محمد', 'مانع', 'ال جعرة', 'gh.1420628@gmail.com', '966557781267', '1105366858', 8, 'uploads/volunteers/transfer_pics/57/WhatsApp Image 2022-06-07 at 10.10.01 PM (1).jpeg', 'uploads/volunteers/cvs/57/سيرة.pdf', '2022-06-10', '2023-06-10', '$2y$10$dhOHBryVdr/MEW./ZMhreOWmvyG20LD/tgZ9hJN48OX/e3Io1SbjK', 'متطوع', 'سارى', NULL, NULL, 'tdqxEmZb8JALsiaYvBfNTVjE7n2mjEV152e2LZTnORS9dFM8NS7XpkH7N8tk', '2022-06-08 05:14:16', '2022-06-10 09:22:36'),
(58, 'انتصار', 'ناصر', 'صالح', 'ال جعره', 'entesar55n@gmail.com', '0502225241', '1106762915', 8, 'uploads/volunteers/transfer_pics/58/44FEC8A2-D1B7-4F22-8C63-6498812033D9.png', 'uploads/volunteers/cvs/58/انتصار سيرة ذاتية.pdf', '2022-06-10', '2023-06-10', '$2y$10$KmED.vsLaJ6nDuvGfiGzU.b9I9Znmcs36GAl7lOsUnE.n5tT47L7a', 'متطوع', 'سارى', NULL, NULL, 'oMkYWZJWkEDASt64kiEZsy9eB3ggh7fk27yveabJmBh8MrRKq4ZcPRkiilyM', '2022-06-08 07:35:57', '2022-06-10 21:06:43'),
(60, 'فائزة', 'محمد', 'صالح', 'آل مهري', 'gemt-frh@hotmail.com', '966557347531', '1035007440', 9, 'uploads/volunteers/transfer_pics/60/DC52A6D5-D67F-44F9-A18D-0A639DBEC910.png', 'uploads/volunteers/cvs/60/جمعية نور.pdf', '2022-06-10', '2023-06-10', '$2y$10$uzmd3BtESA5fWgLt.9SBvu9gVk.g8FbqjKDK/1I0AhuF406.6ZXI.', 'متطوع', 'سارى', NULL, NULL, 'gAYWxX1itxc3JQGNUHStLVICoetD59vgbATAkYQvtsJsXzH9Bj2xEsuAXyHi', '2022-06-09 04:07:54', '2022-06-10 09:29:13'),
(61, 'بشاير', 'فهيد', 'سالم', 'الصقور', 'abcab2090@hotmail.com', '0535526480', '1019968641', 5, 'uploads/volunteers/transfer_pics/61/2679EEA6-DB06-4501-9061-3053C3CE0EDE.png', 'uploads/volunteers/cvs/61/ الراححي .pdf', '2022-06-10', '2023-06-10', '$2y$10$90/5nf8SD0lCnhH3jdAsyOKzRfFI2cYr6APcq.UgI3N/yFW/Z9wFS', 'متطوع', 'سارى', NULL, NULL, 'sEvkg7PjAID9xnKHuHCRozTtNjPP3wmDyWepuTZIStDhehusYevUXJgHxM0X', '2022-06-09 05:43:23', '2022-06-10 09:29:47'),
(63, 'أحلام', 'حسن', 'عبدالله', 'ال بليه', 'ahlamhas.1aa1@gmail.com', '966553733706', '1104355977', 7, 'uploads/volunteers/transfer_pics/63/E05F6EF7-0BB4-4B16-831F-A801CFC73D85.png', 'uploads/volunteers/cvs/63/temp70.pdf', '2022-06-10', '2023-06-10', '$2y$10$LOuGFwgWCiqWkLosMkOrKeG6xI7BetTs2H6jFjOsgtojAisvHLTj2', 'متطوع', 'سارى', NULL, NULL, 'eKaH6waAcHCZXXR6qOAmk5q3OUuUBh2ZEBAZkNXv7lP0nIu40rmCnVmy3hYO', '2022-06-09 21:21:32', '2022-06-10 09:31:46'),
(64, 'حواء', 'محمد', 'صالح', 'سدران', 'alsedran62@gmail.com', '966560996776', '1063828956', 5, 'uploads/volunteers/transfer_pics/64/Screenshot_٢٠٢٢٠٦١٠-٢١١٥١٨_Drive.jpg', 'uploads/volunteers/cvs/64/Screenshot_٢٠٢٢٠٦١٠-٢١١٥١٨_Drive.jpg', '2022-06-12', '2023-06-12', '$2y$10$RYyjvLS58PSBLFNKWdfptO4piwSDrcG2c4o6UwYy7LoPPFQJ11VA.', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-06-11 04:20:59', '2022-06-12 23:54:33'),
(65, 'فايزه', 'علي', 'سالم', 'ال سوار', 'f.swar2030@gmail.com', '0530791554', '1019917028', 6, 'uploads/volunteers/transfer_pics/65/67BA0F23-ED37-49C3-8B84-8BA9B7D12135.png', 'uploads/volunteers/cvs/65/‏لقطة شاشة 2022-01-18 في 2.47.48 م.pdf', '2022-06-12', '2023-06-12', '$2y$10$rKoI/L6H2QErCECmeYom3eN.HW6nFqd57zA2wGmcGewPBMiWgWD1q', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-06-11 05:39:09', '2022-06-13 00:44:27'),
(66, 'حنان', 'محمد', 'حمد', 'ال سوار', 'Hannan-alswar@outlook.com', '0503425880', '1029711817', 9, 'uploads/volunteers/transfer_pics/66/85DAF907-9081-4590-BE29-5B0D5798E513.jpeg', 'uploads/volunteers/cvs/66/06(2).pdf', '2022-06-12', '2023-06-12', '$2y$10$Z7rHxm3FDs/8os6pZp/x7uL0L4O8IhhHq6AVZltU8zAgK27EH6bfS', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-06-11 05:45:54', '2022-06-13 00:44:56'),
(67, 'نهى', 'علي', 'هادي', 'ال ضويعن', 'nohaatmi@gmail.com', '0563874012', '1034021095', 7, 'uploads/volunteers/transfer_pics/67/6A5335ED-CEB3-4E3B-A19A-3176DAE2E03E.png', 'uploads/volunteers/cvs/67/ilovepdf_merged (11).pdf', '2022-06-12', '2023-06-12', '$2y$10$74sNI.b0tR4km1tP5wyttOErvJne.ncNV.idXoTpetfJkiym/aD3e', 'متطوع', 'سارى', NULL, NULL, 'OazNh57HRkKJbJirh4zCA8rJKzM7D2VbajucW8Exkn6h69Fwc7Uw9PUZswbC', '2022-06-11 07:27:26', '2022-06-13 00:45:13'),
(68, 'نوره', 'علي', 'معيض', 'ال مطلق', 'norahalmetlag@gmail.com', '0502988302', '1117813061', 7, 'uploads/volunteers/transfer_pics/68/14ADF989-E508-409C-BCD9-D06A7AA1C51B.png', 'uploads/volunteers/cvs/68/‎⁨سيرة ذاتية نورة مطلق⁩.pdf.pdf', '2022-06-12', '2023-06-12', '$2y$10$u2jF9JR9JbDyWIhn3z4Mg.th/CNGX1xAjcMXWEk2hOWFclH5SuQRC', 'متطوع', 'سارى', NULL, NULL, 'B5fcCotDHwfS16SaVKBq0Sg5V7EHBS0Ngvdqx6SbSd2WNdDyHML990ijWvo6', '2022-06-11 08:04:58', '2022-06-13 00:45:33'),
(69, 'خديجة', 'علي', 'صالح', 'ال حارث', 'xshasha_750@hotmail.com', '558886088', '1040522086', 5, 'uploads/volunteers/transfer_pics/69/تحوييل راجحي.jpg', 'uploads/volunteers/cvs/69/تحويل نور.pdf', '2022-06-12', '2023-06-12', '$2y$10$T7fkSNIQ7kEQvECXlaQzDudMYHIEzW8IQVavNIzJvq50cDOicCu2G', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-06-12 03:22:05', '2022-06-13 00:46:17'),
(70, 'أمجاد', 'عابد', 'سعيد', 'حريد', 'amjadabd003@gmail.com', '966507592418', '1104007644', 8, 'uploads/volunteers/transfer_pics/70/5C574F75-4CC3-4272-936F-8F007E170B8B.jpeg', 'uploads/volunteers/cvs/70/السيرة الذاتية.pdf', '2022-06-12', '2023-06-12', '$2y$10$10iwPkJ5xh0ocna6h19WRe3Rh3VHByBOKPqft3MPRumMyRpCHketG', 'متطوع', 'سارى', NULL, NULL, 'exQKq3S3yxC00lqDp922kgeGguFDP7ojxzGhdUfkTBCqzv2WGjWC5MVDCQAW', '2022-06-12 04:07:12', '2022-06-13 00:46:37'),
(71, 'روزى', 'محسن', 'مهدي', 'ال سدران', 'roooz1496@gmail.com', '500139193', '1051162301', 7, 'uploads/volunteers/transfer_pics/71/Screenshot_٢٠٢٢٠٦١١-٢١٥٥٢٧_Drive.jpg', 'uploads/volunteers/cvs/71/Screenshot_٢٠٢٢٠٦١١-٢١٥٥٢٧_Drive.jpg', '2022-06-12', '2023-06-12', '$2y$10$F0fwuzrDytJZzIt7l7y62e3ZIV7KdziI2VZAp.PxigEvRc0SWsAqi', 'متطوع', 'سارى', NULL, NULL, '8FqCEcghksGK8AiDWl7L79dx4YrNFnSh58PdfrROCdr1ruSoiSJsipf9KDUj', '2022-06-12 04:57:01', '2022-06-13 00:43:55'),
(74, 'تهاني', 'سليمان', 'سالم', 'الصيعري', 'tthh55ttn@gmail.com', '966534633316', '1070815269', 5, 'uploads/volunteers/transfer_pics/74/C7B64525-19C4-409C-A087-E84C4FEEF495.png', 'uploads/volunteers/cvs/74/تهاني سليمان سالم الصيعري.pdf', '2022-06-12', '2023-06-12', '$2y$10$iAIvc/IxAjbjyChBqDyQ.e8u8hqXklUdwqkPEx28/1T4mAhxI.Ix.', 'متطوع', 'سارى', NULL, NULL, '91CB1UzOPghkhbKMLxHAZY8nJM10yfUnTZ8p70vVh48EWb7MnsQsrbqpRsVy', '2022-06-12 09:43:03', '2022-06-13 18:10:35'),
(75, 'أمجاد', 'ساري', 'مبارك', 'ال فلكه', 'good-19f@hotmail.com', '966509208934', '1094843875', 5, 'uploads/volunteers/transfer_pics/75/236F0243-2141-4A31-AF69-1070D8836BF6.png', 'uploads/volunteers/cvs/75/أمجاد ساري مبارك ال فلكه.pdf', '2022-06-12', '2023-06-12', '$2y$10$AvPlG26CtYjYLIxYZcVRpuza7pf3R8o4omOWz4Avk4EEtnx/eWtZC', 'متطوع', 'سارى', NULL, NULL, 'znX3po2eLaUI7pG8HFwHJhaR5cudx4uxZsw5aOmTOtbbwReYEkHNEUZl7aYT', '2022-06-12 17:45:27', '2022-06-12 23:56:02'),
(76, 'محسنه', 'عبدالله', 'معيض', 'الصقور', 'ma.alsagoor@hotmail.com', '966501174228', '1029669999', 5, 'uploads/volunteers/transfer_pics/76/جمعية نور.jpg', 'uploads/volunteers/cvs/76/جمعية نور.jpg', '2022-06-12', '2023-06-12', '$2y$10$0VU72JdQi/OpGiXFUiFcO.2cgWwfD9mfekeE7cDjwz95bmawUEyue', 'متطوع', 'سارى', NULL, NULL, 'PURNf1Rty1YlpwF3uKxwjTsQkBt1cp0wips6ZLjELWfarTzjpiaSAm1vJOxw', '2022-06-12 21:41:01', '2022-09-19 06:28:54'),
(77, 'ندى', 'يحيى', 'علي', 'هزازي', 'nh18938@gmail.com', '966559960983', '1086311329', 8, 'uploads/volunteers/transfer_pics/77/04BAEB0D-BB00-40DE-9C47-1593C9B2BC7F.png', 'uploads/volunteers/cvs/77/سيرة ذاتية ندى هزازي.pdf', '2022-06-12', '2023-06-12', '$2y$10$.YWWGflS0jyCdfaunjeaF.o4evKm.82IrIAXgseudB6GVG14IOqla', 'متطوع', 'سارى', NULL, NULL, 'VXotyfTdDvzMqwwYhYWqRf2SC9Pv2K1FYs3k84Gl6pESAQXBpt3qMcFa0dPO', '2022-06-12 23:10:19', '2022-06-21 00:23:34'),
(78, 'فايزة', 'علي', 'فهد', 'الدوسري', 'abrar21911@gmail.com', '966501178774', '1016663898', 5, 'uploads/volunteers/transfer_pics/78/6B69C7A7-946A-4BF1-8DDD-4AC5AA7ECBBD.png', 'uploads/volunteers/cvs/78/صورة 2 (PDF).pdf', '2022-06-12', '2023-06-12', '$2y$10$q3A/45Jmay7xI6LoiLE4bumoB8iKTWUaKL/.fuokNJgVsq5IFewEG', 'متطوع', 'سارى', NULL, NULL, 'oYz3vJ1GT9jjZ5ZWibYP5R2Ob9ow2vaFFmXqYVUrpQK7xNpwXDL1otyRvlsg', '2022-06-12 23:14:22', '2022-06-12 23:55:02'),
(79, 'رحمة', 'محمد', 'علي', 'آل عقيل', 'rahma22-22@hotmail.com', '966506813666', '1040409755', 9, 'uploads/volunteers/transfer_pics/79/8A60AACD-783B-4B69-B1A0-E001FA942E9A.jpeg', 'uploads/volunteers/cvs/79/الايصال.pdf', '2022-06-12', '2023-06-12', '$2y$10$AAR1LBHQsqSBFTJX88w.HOXUBg/hiq6u5GlehEgQOGY1upKTN.bRW', 'متطوع', 'سارى', NULL, NULL, 'lvKiZkfmcbPaugryfW4LHD8YR8Cxxi43FH9lbWPyBY41lF2ChdIj8FFdJMUk', '2022-06-12 23:14:37', '2022-06-13 00:42:21'),
(80, 'منيره', 'مسفر', 'ناصر', 'ال فاضل', 'mnyrhmsfr9@gmail.com', '966558418504', '1099845479', 8, 'uploads/volunteers/transfer_pics/80/900E2E61-D8B4-4056-AD2F-DB9F2316E2CD.png', 'uploads/volunteers/cvs/80/٢٠٢٢-٠٥-٢٢ ٠٦.٢٢.١٢(1).pdf', '2022-06-12', '2023-06-12', '$2y$10$/XOsDM8E2wTA4sQ5k6Jc7unkWiR0wDq2NBmfc7z4nOyxIdUdnBjHG', 'متطوع', 'سارى', NULL, NULL, 'SE7OSp99l3ux5GSo2nUNagpmJvLYMGlmmnTsnC7bpl50UA4KrRluOyGxrgcl', '2022-06-12 23:26:47', '2022-06-13 00:41:36'),
(81, 'هند', 'سالم', 'احمد', 'آل شهي', 'ip_44888@icloud.com', '0556029155', '1051972857', 5, 'uploads/volunteers/transfer_pics/81/0CE1F065-CE18-441B-A5EB-F73FF4922812.png', 'uploads/volunteers/cvs/81/مستند بي اف.pdf', '2022-06-12', '2023-06-12', '$2y$10$xVhwUBogiBboph2nQV2D6eERk5pP4iXPIT3RRjZcpnsW4beLceVvG', 'متطوع', 'سارى', NULL, NULL, 'ho9KsBlqiuE7bUopeucP9oOGBuTZvI8HiLKcz7RoKFS3Yo6r0gVGHsAzCHWg', '2022-06-12 23:29:55', '2022-09-12 07:59:32'),
(82, 'نوره', 'هادي', 'جابر', 'الوادعي', 'nwrhalwady550@gmail.com', '0547096570', '1098354366', 7, 'uploads/volunteers/transfer_pics/82/0EF0EDD9-9DAD-4931-9584-C3E91CC84F19.png', 'uploads/volunteers/cvs/82/CamScanner 08-18-2020 22.25.06.pdf', '2022-06-12', '2023-06-12', '$2y$10$OHDgOGKZQKSgNtA8U1h5tOZKuxVyT.VLLh.91NNKS0v9VFBxVzkqK', 'متطوع', 'سارى', NULL, NULL, 'C4KHShiwDxxMbj6nKQuotTs0BxBWrPK1ZpI6lTUG1LRJ3TS0U0wJb4qZp2Wt', '2022-06-12 23:59:53', '2022-06-13 00:39:43'),
(83, 'مصلحه', 'محمد', 'سالم', 'اللبيدي', 'memo141259@hotmail.com', '966556341104', '1087959977', 7, 'uploads/volunteers/transfer_pics/83/269F610F-03C7-4A51-B74F-F61CA30ECD54.png', 'uploads/volunteers/cvs/83/temp70.pdf', '2022-06-12', '2023-06-12', '$2y$10$cvQKeByigWyMlZauG.GBDOQN5xKTnt7g9VktDpehiaPVhKXXD9Klq', 'متطوع', 'سارى', NULL, NULL, 'mMiiM4hREnZO9QZNFaYg0pTSWtn6yiVlngNuu5AzvxignIH8s2wJTQEOwu5l', '2022-06-13 00:13:12', '2022-06-13 00:42:36'),
(85, 'مها', 'حسين', 'حسن', 'ال دويس', 'ob918@icloud.com', '966536942006', '1078500715', 7, 'uploads/volunteers/transfer_pics/85/WhatsApp Image 2022-06-12 at 7.50.44 PM.jpeg', 'uploads/volunteers/cvs/85/222.pdf', '2022-06-13', '2023-06-13', '$2y$10$CQgvSXNa0MSG8CZSMb6i2eJe7j8XJXkwJfu.CamPwWxpscWzvGnHO', 'متطوع', 'سارى', NULL, NULL, '6xfb52oLTojATgwgzEusnvAQKkW6t1cijNlEm7EJBVWrzao7cfVbY9oNsJso', '2022-06-13 02:51:30', '2022-06-20 06:25:05'),
(86, 'نجوى', 'ناصر', 'عبدالله', 'ال مسفوة', 'najwa208nasr@gmail.com', '966532865867', '1089474041', 7, 'uploads/volunteers/transfer_pics/86/Screenshot_٢٠٢٢٠٦١٢-٠٠٤٨٥٣_1.jpg', 'uploads/volunteers/cvs/86/سيرة ذاتية نجوى.pdf', '2022-06-13', '2023-06-13', '$2y$10$wyYkEaeZEmpApwVLHTCwouA.xafZQE66X9h2BSfSOZfp4ZMr3MkAK', 'متطوع', 'سارى', NULL, NULL, '2oxkLCRv9XcAtlrG9W9l74MQnWA4eYlz2WBvq3thSMS9QuHMA9rtm3a4oi8L', '2022-06-13 03:16:57', '2022-06-14 02:18:54'),
(88, 'بتلاء', 'ظافر', 'صالح', 'ال مهري', 'batlaaldafer1@gmail.com', '966530107167', '1094500079', 5, 'uploads/volunteers/transfer_pics/88/55808C73-A562-4EC7-A1EB-81BC9CA4090A.png', 'uploads/volunteers/cvs/88/بلا عنوان.pdf', '2022-06-13', '2023-06-13', '$2y$10$Tha3q6E0/KbB3e6ede9R6.xuqtOYiqbPmDo8vWm9xOOnSU8CWKDVu', 'متطوع', 'سارى', NULL, NULL, 'cDJ9tmKdatiNEo292ZziyathfYZCpybkiOUlOhUR4WfTnc3ljCrSmMrqM2XJ', '2022-06-13 03:42:15', '2022-06-14 02:20:10'),
(89, 'أسماء', 'عبدالله', 'يحيى', 'آل عباس', 'azmm1998@hotmail.com', '966537146530', '1097273450', 8, 'uploads/volunteers/transfer_pics/89/8D12D831-32E4-4556-AAB7-5011141F62C9.png', 'uploads/volunteers/cvs/89/اسماء عبدالله.pdf', '2022-06-13', '2023-06-13', '$2y$10$FtdJfos4rrk7hVOlQUTKDuCkl1xSoU8ifFWOfJJAWc3Y6pjkUwq9K', 'متطوع', 'سارى', NULL, NULL, 'LduTgYhoRKB6MUXcW1XDdWWB4lAYMOo5Bcxp37X9wnxqpXmNjv1tlycMoBdh', '2022-06-13 04:34:56', '2022-06-14 02:21:33'),
(91, 'شيماء', 'صالح', 'محمد', 'ال قير', 'shaimagiar98@gmail.com', '966501276940', '1102957279', 8, 'uploads/volunteers/transfer_pics/91/C553C44A-E630-4563-97FE-1DAA27C9AE70.jpeg', 'uploads/volunteers/cvs/91/المستند١.pdf', '2022-06-13', '2023-06-13', '$2y$10$gvQz5JxaaxtpholWBxN4d.bgyg27gvSpiRXTLI4jWItFsySTBtmVG', 'متطوع', 'سارى', NULL, NULL, 'YoEdfcfb5wBcNfgQL7wCFIgiWE7sclYnaYDEzfYW9Y63YTtZNDUoQqFNGksh', '2022-06-13 13:41:45', '2022-06-14 02:23:07'),
(92, 'امل', 'فواز', 'فارس', 'الجفر', 'amlfawaz11@gmail.com', '966532910311', '1109324614', 8, 'uploads/volunteers/transfer_pics/92/B7F95822-39CF-4E17-8EC6-45D63D6EAE2E.png', 'uploads/volunteers/cvs/92/Amal Aljafr CV.pdf', '2022-06-13', '2023-06-13', '$2y$10$RGiTZIQagNfdfLGUkRWspuqgnMvraeRvl5CE7AwsGAN/QowcjPFcO', 'متطوع', 'سارى', NULL, NULL, 'HyIQcAGXZBWmfUUiTFBQgSqv2v5c2jZiIhgDwgKXQrkE7KAf6jEWopM6LGgf', '2022-06-13 15:56:03', '2022-06-14 02:21:01'),
(93, 'غدير', 'محمد', 'غالب', 'ال مستنير', 'Gadeer62@hotmail.com', '0503286262', '1030291825', 5, 'uploads/volunteers/transfer_pics/93/Screenshot_20220613_143539.jpg', 'uploads/volunteers/cvs/93/Screenshot_20220613_143539.jpg', '2022-06-13', '2023-06-13', '$2y$10$mxy2KxuJFnWZOO2y3eSSIO8p80HcW4HMOHBd5vOf1vOZT5MvxQ2Be', 'متطوع', 'سارى', NULL, NULL, 'd81i2b2J0A01JETpzSJPL5qg2AdXkWkX1HqJoTui4GN1IMSChIbwmbbvdbh7', '2022-06-13 22:28:34', '2022-06-14 02:18:15'),
(94, 'رزقه', 'سعد', 'مانع', 'آل عباس', 'r.s.alabbas@gmail.com', '966554842025', '1023946666', 5, 'uploads/volunteers/transfer_pics/94/2D5DD170-E8E3-4515-99D6-951D33941ED1.png', 'uploads/volunteers/cvs/94/CamScanner ٠٦-١٢-٢٠٢٢ ١٤.٢٧.pdf', '2022-06-13', '2023-06-13', '$2y$10$Z.LjYhFTvfwCxNyV8seC3OE3Y2Wo88e0/O5xmp0N8Esz/VggI1waO', 'متطوع', 'سارى', NULL, NULL, 's7mKAky3tGfNpJj6gjyWXWsPw2ItcZbrr3CXbLHdDkapXX5QUICMKUqUCKs9', '2022-06-13 22:40:41', '2022-06-14 02:17:08'),
(95, 'أمل', 'أحمد', 'صالح', 'النجراني', 'am5414995@gmail.com', '0551425479', '1096995947', 8, 'uploads/volunteers/transfer_pics/95/F528551B-D180-436B-8064-C16E64CB41E4.png', 'uploads/volunteers/cvs/95/سيرة ذاتيه 2 2.pdf', '2022-06-13', '2023-06-13', '$2y$10$ORjXMkXbDkseZGt5IQmjiuUeHVOO5dAZboAkWE/82PhrrQnjuV7nm', 'متطوع', 'سارى', NULL, NULL, 'iRa68wZ11RUKqWvJguiljIPuu4wEF5PcriG4MBRM8nHJjOJWFe5M4u8nGvQz', '2022-06-13 22:54:49', '2022-06-14 02:16:08'),
(96, 'كوكب', 'ابراهيم', 'علي', 'ال موته', 'kokab1314@windowslive.com', '966505542216', '1025787589', 5, 'uploads/volunteers/transfer_pics/96/0201184B-4582-4EF4-8129-292FCDF9AD7B.png', 'uploads/volunteers/cvs/96/كوكب.pdf', '2022-06-21', '2023-06-21', '$2y$10$qZN5ACRkj0iS12ZYIrIeHOTiHMsPTI2lzFvpr42LjGojDYkCSf2uS', 'متطوع', 'سارى', NULL, NULL, 'Fv5XTiS4uTpQk9fAt2v2o07gbL4xznCVtTu6qlSNTvGpqrC3GvaLU2vErXnw', '2022-06-14 16:43:27', '2022-07-05 21:06:38'),
(98, 'أمل', 'علي', 'عبدالله', 'ال غرزان', 'saleh14142010@hotmail.com', '966535221558', '1037686852', 5, 'uploads/volunteers/transfer_pics/98/1C8E1BE3-C83D-4ACF-B5A5-118AC97DD045.png', 'uploads/volunteers/cvs/98/المرفقات.pdf', '2022-06-21', '2023-06-21', '$2y$10$IMSTJ1sYuzaSY/bY1Nh6buL.B2MX21y.MCyF8X5jvLYSOaoEASQ3m', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-06-15 04:49:12', '2022-06-21 16:03:09'),
(99, 'فوزية', 'مهدي', 'حسين', 'آل شهي', 'alnamervip0992@gmail.com', '966504886434', '1037130877', 12, 'uploads/volunteers/transfer_pics/99/4BD78E9A-2BDA-44F9-A6C4-114DFD900093.png', 'uploads/volunteers/cvs/99/Transaction-Receipt.pdf', '2022-06-21', '2023-06-21', '$2y$10$S7kI8KYbCAqe4WuDOLYWOOK6n2xQyOb0pkYmfPKnyV7uNnGc9K9JG', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-06-18 06:58:10', '2022-06-21 15:59:55'),
(100, 'إيمان', 'احمد', 'علي', 'الزقلي', 'A1029072939@gmail.com', '966509347389', '1070983570', 9, 'uploads/volunteers/transfer_pics/100/9182924C-3D28-4217-98C9-2B3EEFDC54B7.png', 'uploads/volunteers/cvs/100/شهادة الدبلوم.pdf', '2022-06-21', '2023-06-21', '$2y$10$pirQbgiT9XeQbB91hv3CUOCJIDPRF.bgAxkhJO5Wv.KXIiOHKPS5S', 'متطوع', 'سارى', NULL, NULL, 'WhrBqmSYMmymAc2f6iG1vyroJbJCgVaa8upi0naeQhSOcTplrVPuGMFcEBXe', '2022-06-21 05:18:54', '2022-06-21 15:59:12'),
(101, 'عفاف', 'أحمد', 'محمد', 'المصباحي', 'Aftoonh@gmail.com', '966535871625', '2293444184', 7, 'uploads/volunteers/transfer_pics/101/Screenshot_٢٠٢٢٠٦٢١_١٧٣٩٣٣.jpg', 'uploads/volunteers/cvs/101/cv.عفاف المصباحي (1).pdf', '2022-06-21', '2023-06-21', '$2y$10$Kr1KmY1mlmpgCugWovNv8uTzrZ2Tl/CS53k8j5HI/aYhf6uQwHNhm', 'متطوع', 'سارى', NULL, NULL, 'gswfy5evBcPYxf71r4zVGEfEZGQNYOqANOZPSRlmNmlKIVg67cF6FDvALqnI', '2022-06-22 01:34:22', '2022-06-22 06:28:17'),
(102, 'ريم', 'سعد', 'سعيد', 'ال سعد', 'reemh4456@gmail.com', '966501243482', '1101532651', 7, 'uploads/volunteers/transfer_pics/102/42052E2C-8FCB-445C-8D9D-965E81E3C65A.png', 'uploads/volunteers/cvs/102/3331216a-40b1-4371-8b43-62cb4a25a700.pdf', '2022-06-28', '2023-06-28', '$2y$10$LljQDK8jXxIppKiW41l/6u3r9cGaZipctxXXTamxfiJs6R6VWu.rS', 'متطوع', 'سارى', NULL, NULL, 'NdJ8pMxhz9N2lwyN2z3YUvxH9R42kR9jBHIvJVzCwrRxebDBhGYRlFvbFQyv', '2022-06-22 16:36:08', '2022-06-28 20:47:01'),
(103, 'وفاء', 'أحمد', 'يحي', 'مصارط', 'myshw23@hotmail.com', '966533259555', '1099180364', 12, 'uploads/volunteers/transfer_pics/103/5E80BBB3-E0D0-4204-BCDC-F4AB762CBBE0.jpeg', 'uploads/volunteers/cvs/103/ملف السيره الذاتيه المرتبط بملف الانجاز.pdf', '2022-06-28', '2023-06-28', '$2y$10$fUnkvHlLyNyQNpG0uQwIcOSQuQ4iOlFUBHgdNphbfFkAGJmu5OsE.', 'متطوع', 'سارى', NULL, NULL, 'cDSotcAtOuNB0YzphTNWHCtge43JWXUSY8NQsw66mY5EBLX827CJlwlBeymR', '2022-06-24 08:21:29', '2022-06-28 20:29:35'),
(104, 'جميلة', 'منصور', 'عبدالله', 'المكرمي', 'dew_770@hotmail.com', '966501790041', '1016852921', 12, 'uploads/volunteers/transfer_pics/104/ايصال الجمعيه بصيغة pg.jpeg', 'uploads/volunteers/cvs/104/السيرة الذاتيه.pdf', '2022-06-28', '2023-06-28', '$2y$10$hJZ6NVJsMNv9yc84cutRVOYVuaZ77rihTu.0Oq7TMQnYOJGrKGnHK', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-06-24 22:08:49', '2022-06-28 20:36:39'),
(105, 'فاطمه', 'صالح', 'سهل', 'ال ضاعن', 'ar7777bo@gmail.com', '966533070335', '1059543288', 5, 'uploads/volunteers/transfer_pics/105/IMG_20220624_145944~2.jpg', 'uploads/volunteers/cvs/105/16560726224786875484249964186019.jpg', '2022-06-28', '2023-06-28', '$2y$10$AmiE4wbvN6ghA0WbI1Um1.gtGCkK8WiA7P5/ZgitnjgGBucU658GS', 'متطوع', 'سارى', NULL, NULL, 'cg1j5TNSTydxN81ms2gbx4mpFDn2R8El5cx5GDnM4bKXGfyO8XwevIgruHHC', '2022-06-24 22:12:44', '2022-07-28 06:34:26'),
(106, 'ساره', 'حمد', 'مهدي', 'ال جالي', 'sarajali0@icloud.com', '966530725100', '1106284043', 8, 'uploads/volunteers/transfer_pics/106/A1269923-7E7C-4EDE-BF2D-F71DE2AAB29C.jpeg', 'uploads/volunteers/cvs/106/8F0F0D6D-A4AB-4374-A1F1-C93C35A64130.pdf', '2022-06-25', '2023-06-25', '$2y$10$PLyPSyuks/RYHZj5XbC/sumT.LM8xwECpaPA/Va2cgJviQYEFrEnu', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-06-24 23:12:18', '2022-06-25 21:39:12'),
(107, 'منيره', 'زايد', 'ظافر', 'القحطاني', 'mnerah1397@gmail.com', '966535774257', '1117959922', 12, 'uploads/volunteers/transfer_pics/107/FC60C8CE-BD1C-45CC-A4A6-8C67DC9566CB.jpeg', 'uploads/volunteers/cvs/107/فتح ملف انجاز - منيرة القحطاني.pdf', '2022-06-28', '2023-06-28', '$2y$10$Bq/Zu45DMQzJMElpT6KdGOO/7R02H7v6Hc/77fz1pflWOG62HigcC', 'متطوع', 'سارى', NULL, NULL, 'oY3U2ZTHWPnImHBx5IRb8MlfIYksqU5NmT25UObquoVa5ff31m8Y7qmIc7Cg', '2022-06-25 04:31:15', '2022-06-28 20:46:09'),
(108, 'فايزه', 'احمد', 'يحيى', 'البكري', 'fay47704@gmail.com', '966530985028', '1029427133', 5, 'uploads/volunteers/transfer_pics/108/F975D1AD-D0D8-4E36-8083-52C91A9C9BF6.jpeg', 'uploads/volunteers/cvs/108/مستند ممسوح ضوئيًا.pdf', '2022-06-28', '2023-06-28', '$2y$10$VvXYT9b6Lb8kYs5WciqLdezDY4HwnYapVWrJ.KQlniijLW4c6SKj2', 'متطوع', 'سارى', NULL, NULL, 'Sy4YLuhXNmQ0NAkuP2qiDeZiibCkGSJ8rH2HAtMuh73ONHbGqC54i39e0AU1', '2022-06-26 16:48:33', '2022-06-28 20:45:28'),
(109, 'قرفه', 'حسين', 'احمد', 'البكري', 'gerfaha1234@gmail.com', '966551142259', '1031072935', 5, 'uploads/volunteers/transfer_pics/109/EF33D2AA-4255-431E-86B5-61A1567299D7.png', 'uploads/volunteers/cvs/109/مستند ممسوح ضوئيًا.pdf', '2022-06-28', '2023-06-28', '$2y$10$xLf6vsPUZOwoLKMUcX05MOD7Si7M4SbZZS1eZxM7prBfJO1cSAa/e', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-06-26 16:58:57', '2022-06-28 20:44:48'),
(110, 'رحمه', 'عبدالله', 'حسين', 'ال سالم', 'ra.alsalem1@hotmail.com', '966556713639', '1035581030', 5, 'uploads/volunteers/transfer_pics/110/9A21EEB8-2699-4DCE-BE47-268EED817236.png', 'uploads/volunteers/cvs/110/نص.pdf', '2022-06-28', '2023-06-28', '$2y$10$DUN/68tc2LZDrkkp2nkoF.qLUzu5EXS4C3JxqhNutk7yaqsErZUGq', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-06-26 23:35:02', '2022-06-28 20:44:20'),
(111, 'حصه', 'هليل', 'محمد', 'العنزي', 'am.brhomi@gmail.com', '0556278936', '1005003163', 5, 'uploads/volunteers/transfer_pics/111/IMG-20220628-WA0020.jpg', 'uploads/volunteers/cvs/111/سيرة ذاتية .pdf', '2022-06-28', '2023-06-28', '$2y$10$.bcPq0Fs.ow71d5F/Tlj2um65ODY4gMO/z6HU72u36xqTpsuleMBe', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-06-28 17:49:50', '2022-06-28 20:42:04'),
(112, 'سلمى', 'سعد', 'سعيد', 'اليامي', 'salmmma979@gmail.com', '0551389475', '1060508148', 6, 'uploads/volunteers/transfer_pics/112/439939.jpg', 'uploads/volunteers/cvs/112/سيرة سلمي .pdf', '2022-06-28', '2023-06-28', '$2y$10$sa7EtIUVLx4Gn8J89L29cO544482lGBFxTpSeBgvx1Kq8E3E/UBrC', 'متطوع', 'سارى', NULL, NULL, 'OiKZv9knZTMUXdQJr2e1jL1WKXbfx1eBXQqhHiAv0H4aJ1MBPHL6OgL1GwZr', '2022-06-28 19:16:24', '2022-06-28 20:39:27'),
(113, 'سالمه', 'احمد', 'سعيد', 'الزهراني', 'sdallh501@gmail.com', '966557210429', '1058211333', 5, 'uploads/volunteers/transfer_pics/113/9E53713A-D86E-4DC4-8CEE-F781E51E102A.png', 'uploads/volunteers/cvs/113/download_1656475628266 2.pdf', '2022-07-02', '2023-07-02', '$2y$10$mu12lJpizyjG2HtIeWMhe.aAIe06PsZvXDnm0.8KoV5ZLfNAjCsqe', 'متطوع', 'سارى', NULL, NULL, 'gLAmDU3ULpz3UxZRSuI4zPQaasjHuh1Nkpr4V0wqfRLJaESvt3WKGscFrJD8', '2022-06-29 14:23:53', '2022-07-02 22:44:49'),
(114, 'نوف', 'حمد', 'حسن', 'آل شريه', 'alyamynwf929@gmail.com', '966509008786', '1017917905', 10, 'uploads/volunteers/transfer_pics/114/IMG_1124.PNG', 'uploads/volunteers/cvs/114/IMG_1127.pdf', '2022-07-02', '2023-07-02', '$2y$10$XB97eQOHPeBrrReLebEUS..puhs4/uoP25OC0BDR4gQgLfl5f/fpW', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-06-30 02:42:08', '2022-07-02 22:45:31'),
(115, 'رابيه', 'محمد', 'علي', 'آل شريه', 'rabyahalsharyah.321@gmail.com', '966532864330', '1069989935', 5, 'uploads/volunteers/transfer_pics/115/BCE61B18-A5EC-4F53-95F3-9B99269D655F.jpeg', 'uploads/volunteers/cvs/115/صورة 2 (PDF).pdf', '2022-07-02', '2023-07-02', '$2y$10$8Bb.qaNqcG9A7lueU6GU7u4BR3Utq2PmageOTXdXD6mE6TaXETKyC', 'متطوع', 'سارى', NULL, NULL, 'id7fKrXw1RPrjh2Vx83jwrzV1AkaFXfw3HxbXLlHnbvdBVWToUWuILb0bEzo', '2022-06-30 14:28:18', '2022-07-02 22:46:41'),
(116, 'فابزة', 'حمد', 'يحيى', 'ال زمانان', 'faz6965@gmail.com', '966500204148', '1046435499', 7, 'uploads/volunteers/transfer_pics/116/صورة 3 (PDF).pdf', 'uploads/volunteers/cvs/116/صورة 2 (PDF).pdf', '2022-07-02', '2022-07-02', '$2y$10$RZgHpS9xAObb5Aduma564unIzvYjQA3KV9fED0JeEizmVny.agkHy', 'متطوع', 'قيد المراجعة', NULL, NULL, 'cPWjcGrcX0oeRWmSHBkJox3QPnM2BJMPCH0jqTM40gIDGTj98dakOqmwjYXK', '2022-07-02 23:29:47', '2022-07-02 23:29:47'),
(117, 'بسمه', 'جفيش', 'غانم', 'ال جفيش', 'sea_2021@icloud.com', '532601221', '1118700606', 7, 'uploads/volunteers/transfer_pics/117/22A92669-A619-4F7E-9004-E7F5A2C00FBE.png', 'uploads/volunteers/cvs/117/New Note.pdf', '2022-08-01', '2023-08-01', '$2y$10$3EerOvUBWEjAfsayo74oVuMCmLViQTGFDEQB36AqdxM6eph5SosnS', 'متطوع', 'سارى', NULL, NULL, 'ssMlDQQk7PVkRWAloUlFDiL3TG8kEyU1CIXxAQBSHDbNhjGPuOIDZckKAywd', '2022-07-04 19:58:39', '2022-08-01 09:12:00'),
(118, 'ريما', 'مبارك', 'حسين', 'بني هميم', 'hadi1078566@gmail.com', '966509351347', '1094560529', 5, 'uploads/volunteers/transfer_pics/118/4A4FB8EA-058D-4A5F-B972-6317902AC414.png', 'uploads/volunteers/cvs/118/reema cv.pdf', '2022-08-01', '2023-08-01', '$2y$10$x8CYqkqD3XZH9TtSUb6vH.eYAjyw/INLmKDwA8htYr.zXaVEQzRMK', 'متطوع', 'سارى', NULL, NULL, 'rnB1CW5pWmulZDK99F6KNFncQkbnx5IROjnWG1VDvZ1nTQCcnj6E4d2P3GS4', '2022-07-20 11:38:18', '2022-08-01 09:16:16'),
(119, 'منيره', 'عوض', 'عبدالله', 'ال ذيبان', 'abomahdi15t9@hotmail.commba777u1', '966552576150', '1042830883', 5, 'uploads/volunteers/transfer_pics/119/2BF3C5E0-40A3-478E-BBBA-A49431D461AF.png', 'uploads/volunteers/cvs/119/download_1658950237538.pdf', '2022-08-01', '2023-08-01', '$2y$10$ms9AWtdEYXA.r.IKI9NvT.gtLBhnJZ2Rk5Twqjv0tIPB9okkCHvd6', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-07-28 19:36:20', '2022-08-01 09:17:09'),
(120, 'مسعده', 'مهدي', 'دكام', 'آل ضاوي', 'Malak.11.22@hotmail.com', '0535043277', '1092764461', 5, 'uploads/volunteers/transfer_pics/120/65EF238A-742A-486B-BC91-B8AFDBAC607A.png', 'uploads/volunteers/cvs/120/653ec5bb67404cdf478c444b61641c4a2714b725.pdf', '2022-08-07', '2023-08-07', '$2y$10$i50ABDP34PwSzRvQvorxlO1SwCSf0g5FFZOTn.D.u9IVyi3Qn5.pe', 'متطوع', 'سارى', NULL, NULL, 'KZA26BxTHtyCkLnaP4eTbC4pYwINrmojbNa8YMBeNIahqufvmD0mXAaiVtsJ', '2022-08-01 16:12:46', '2022-08-07 07:04:18'),
(121, 'لطيفه', 'فيصل', 'جابر', 'ابوساق', 'jooooood2030@gmail.com', '0505818089', '1065624064', 5, 'uploads/volunteers/transfer_pics/121/Screenshot_٢٠٢٢٠٨٠١-٠٩٠٨١٧_Messages.jpg', 'uploads/volunteers/cvs/121/السيرة الذاتية لطيفه فيصل ابوساق.pdf', '2022-08-07', '2023-08-07', '$2y$10$J5hVXrR3clxneCpOeJn3t.OIwZV2.vt4MvfccNLprhdQ6liBOm.KW', 'متطوع', 'سارى', NULL, NULL, 'p3uzpWCPBR5IphX2ny3yzK12GZsZdRmSz3lWzQKW82SDycFDGPEe3yyBg9e9', '2022-08-01 16:13:31', '2022-08-07 07:12:09'),
(122, 'عنود', 'مسعود', 'مانع', 'ال عباس', 'anoud1319a@gmail.com', '966554782990', '1091490035', 7, 'uploads/volunteers/transfer_pics/122/Screenshot_20220803_232318_com.whatsapp.jpg', 'uploads/volunteers/cvs/122/سيرة ذاتية عنود مسعود.pdf', '2022-08-07', '2023-08-07', '$2y$10$JSNohQ5AaNOCZLrQKusxRui9J10p0Wdxd16sV2Ja6Pbgjp/iaPVB2', 'متطوع', 'سارى', NULL, NULL, 'Sj5Ngc24FiHa94sCqmhrcotSBkdtdCh0OFFHBQQjV8jNmNQvUcPPZQ8QKRgj', '2022-08-04 06:25:44', '2022-08-07 07:12:21'),
(123, 'فاطمة', 'يحيى', 'مشبب', 'آل جعرة', 'Fatoo19991999@gmail.com', '966555334746', '1105512824', 8, 'uploads/volunteers/transfer_pics/123/IMG-20220806-WA0031.jpg', 'uploads/volunteers/cvs/123/فاطمه يحي مشبب ال جعره.pdf', '2022-08-07', '2023-08-07', '$2y$10$GUmDH8R.oiEJc.cT0CBCBOdW2LejYGlJWF9vZmw4Mdg7wVquUc9F6', 'متطوع', 'سارى', NULL, NULL, 'Wbcn9eM0sIupKiciXOuZQ0zfREYCyglPc8aOKe4cg2VSbc6PuYS8FnT2mYjx', '2022-08-07 02:09:53', '2022-08-07 07:16:03'),
(124, 'هنوف', 'محمد', 'علي', 'بالحارث', 'hanoitk.sh@gmail.com', '966550363766', '1059347565', 5, 'uploads/volunteers/transfer_pics/124/936B84D9-4325-41D6-8FC9-FA961F5AC493.jpeg', 'uploads/volunteers/cvs/124/cv1 هنوف .pdf', '2022-08-13', '2023-08-13', '$2y$10$bNQO.FCKJga5WhgcoNrTjuQhwB1KD5gMLHsASBDDYZ6LEFpiGHxAq', 'متطوع', 'سارى', NULL, NULL, 'vc6Jx1X2kKi1kMFQwJWpYhkCT6LWuFNRZAhL9d9vODuABseuQWCU1jICB0BN', '2022-08-07 17:58:22', '2022-08-13 10:11:38');
INSERT INTO `volunteers` (`id`, `first_name`, `second_name`, `third_name`, `fourth_name`, `email`, `phone_number`, `record`, `field_id`, `transfer_pic`, `cv`, `start_date`, `end_date`, `password`, `role_name`, `Status`, `email_verified_at`, `api_token`, `remember_token`, `created_at`, `updated_at`) VALUES
(125, 'بتول', 'عامر', 'مقبل', 'ال مستنير', 'btool21_9@hotmail.com', '966555831705', '1106203423', 8, 'uploads/volunteers/transfer_pics/125/F37CE47B-8B0B-4272-934D-71D5D7632261.png', 'uploads/volunteers/cvs/125/CV Btool.pdf', '2022-08-21', '2023-08-21', '$2y$10$kBjpWNn6OPjFKZi0whZrwO/8NXb4r.461k9vBEp7XvsuEJFZVQkEu', 'متطوع', 'سارى', NULL, NULL, 'u0dkLTIV1Veg1M55o0rSDGx6aw2jY8dd4mS6CJgoeViPucHCrqd65sBRLA4k', '2022-08-18 04:28:41', '2022-08-22 06:11:42'),
(126, 'راقع', 'مشبب', 'محمد', 'القحطاني', 'dhome020@hotmail.com', '966505957505', '1079776728', 5, 'uploads/volunteers/transfer_pics/126/1D4E8762-D817-4B16-A318-1E25BC7F22AA.png', 'uploads/volunteers/cvs/126/سيرة ذاتية راقع.pdf', '2022-08-31', '2023-08-31', '$2y$10$vwEPrdHiehjTbWtO/SGNuOUn9xGX6v/p3lN94UJkdhvLkjp75f8RK', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-08-27 02:19:01', '2022-08-31 17:09:58'),
(127, 'سارة', 'فارس', 'قميش', 'ال دغرير', 'alialfarid576@gmail.com', '533137230', '1109735702', 5, 'uploads/volunteers/transfer_pics/127/WhatsApp Image 2022-08-26 at 8.41.39 PM.jpeg', 'uploads/volunteers/cvs/127/Doc1.pdf', '2022-08-31', '2023-08-31', '$2y$10$7bJrjojbBoRb1pPmz7S6tuErii8xvf.9jy4FwnEs1UR7Lg5.20JGC', 'متطوع', 'سارى', NULL, NULL, 'moFyZiPPiFckFdVPzlaDROBYqvVc7eH7Xc53qdb8Dhj51ivBbKQPVPfjzNnc', '2022-08-27 03:54:29', '2022-09-29 20:45:18'),
(128, 'وصايف', 'عبدالوهاب', 'عباس', 'الشريف', 'wasaifabdulwahab1994@gmail.com', '966557873633', '1082946219', 7, 'uploads/volunteers/transfer_pics/128/AE4828E8-49CC-4F0F-BB1D-BBA8DFDE86A3.png', 'uploads/volunteers/cvs/128/CVwasaif Alshrif.pdf', '2022-08-31', '2023-08-31', '$2y$10$dXouNy9YaZIiv9ADQx1fL.naqC5ZVkTGnjW4qrL6WdT8oSLv22iX.', 'متطوع', 'سارى', NULL, NULL, 'QanrSy4K0HKmraSOWEV5SJnGQujX64nNYpqexKwQEotlQGxGa2f4x9n5Fyva', '2022-08-27 19:59:54', '2022-08-31 17:10:49'),
(129, 'جوري', 'عبدالرحمن', 'منصر', 'الشريف', 'jorialshareef@icloud.com', '0564927527', '1135204723', 5, 'uploads/volunteers/transfer_pics/129/F2E9E465-B120-40CF-94D7-3A401D18159C.jpeg', 'uploads/volunteers/cvs/129/المستند.pdf', '2022-08-31', '2023-08-31', '$2y$10$03ldwH1YuNhveJritrnnoOu.rB3lGOAPA1mZ5c3amGVtJYxourLJ2', 'متطوع', 'سارى', NULL, NULL, 'WrfMcykieQYLVl6gukDltLALI3nbtELS1XStIBMtkF3wM2KsE0VANhx7n2Sm', '2022-08-31 01:58:47', '2022-09-01 03:30:24'),
(131, 'مها', 'عبدالله', 'مشبب', 'عسيري', 'mahakhaled23@icloud.com', '0537188563', '1094035076', 7, 'uploads/volunteers/transfer_pics/131/B287904C-51E6-4510-84BC-02B5E897EE42.png', 'uploads/volunteers/cvs/131/‏الأعمال.pdf', '2022-09-08', '2023-09-08', '$2y$10$lxG3lMpmG4BTyGPqUgqHN.HDVmxgI5wwyNBID6vuEPm0OMpHGDsSm', 'متطوع', 'سارى', NULL, NULL, 'f5XVSls7KtG7vcqOTpNcrsJyYEO23huFzWhXRwxgCaP42Z82L6xblAENioxB', '2022-09-05 04:18:49', '2022-09-10 04:17:05'),
(133, 'فايزة', 'عبدالله', 'حمد', 'ال منصور', 'fayazh_678@hotmail.com', '966559320501', '1105672800', 5, 'uploads/volunteers/transfer_pics/133/503F429F-2346-4DAA-B885-39452F247B0F.png', 'uploads/volunteers/cvs/133/السيرة الذاتية .pdf', '2022-09-08', '2023-09-08', '$2y$10$u6WvW1zpdIgy4fys8cjAje7VMSWF3ogDpfpQrPqq0x4WB17XIDH.i', 'متطوع', 'سارى', NULL, NULL, 'B48IZ4T3IpbGloFdxFP5ZRcEt4VAQJHzXhwvdUwbxc45D0ycLOdbaolvTnOe', '2022-09-08 23:54:14', '2022-09-09 00:44:21'),
(134, 'ساره', 'مبارك', 'علي', 'المكاييل', 'msa607685@gmail.com', '0553930975', '1078988779', 12, 'uploads/volunteers/transfer_pics/134/Screenshot_٢٠٢٢٠٩٠٩_١٧٢٠٢٦.jpg', 'uploads/volunteers/cvs/134/Screenshot_٢٠٢٢٠٩٠٩_١٧١١٣٨.jpg', '2022-09-10', '2023-09-10', '$2y$10$atPFnIVEJ3EonIR5Rt26me77cbed8mZCBnTXAo7f/8pk7bJS9ZPhW', 'متطوع', 'سارى', NULL, NULL, 'etbwgynZOthF0x5zSEMJmfBBKKAYuoQTzqP5KjC93upWorAlLePni2OLPPkA', '2022-09-10 00:22:45', '2022-09-11 20:10:54'),
(135, 'هدى', 'صالح', 'حمد', 'ال الحارث', 'Huda.alhareth@icloud.com', '966538415416', '1090045178', 7, 'uploads/volunteers/transfer_pics/135/9A278F4A-CF8C-4CFF-B89A-1C245D796C05.jpeg', 'uploads/volunteers/cvs/135/HUDA (CV).pdf', '2022-09-10', '2023-09-10', '$2y$10$FDlmWlezmgsgZ7Hixy3iBOpm/BJU4ogoxUJjo7H5b8h/wWTNjqxtW', 'متطوع', 'سارى', NULL, NULL, 'pW75RqC5d91WscAA5jEpfPq9YHRzJLDovNNIWloYV5KUMu70PIYi0aIe0pXG', '2022-09-10 01:01:31', '2022-09-10 21:32:39'),
(136, 'ايمان', 'عايض', 'احمد', 'عسيري', 'asirieman83@gmail.com', '0507952692', '1096428386', 7, 'uploads/volunteers/transfer_pics/136/87E81ABA-020E-4D01-9D81-902F0492965D.png', 'uploads/volunteers/cvs/136/السير الذاتية ايمان.pdf', '2022-09-10', '2023-09-10', '$2y$10$IPWVfYCT8U49OozlZZ2yAeVHhassoJ1A39AlH.1p0Uvl74AEDmZRG', 'متطوع', 'سارى', NULL, NULL, 'aV53xSbKFuMrmDzF6ST3TsuMHw0qUUiL6bINsKauSnGEgWbN5bpc9Wobm4Md', '2022-09-11 00:09:37', '2022-09-11 00:19:37'),
(137, 'ريزة', 'حمد', 'محمد', 'ال عكران', 'reezahalm110@gmail.com', '532066879', '1095005565', 7, 'uploads/volunteers/transfer_pics/137/4D079D3A-AEEA-48A6-A5B2-9BC14D6ED5B9.png', 'uploads/volunteers/cvs/137/cv ريزة_1.pdf', '2022-09-10', '2023-09-10', '$2y$10$PvEA2CuYFPkDCpM1gA1wEOUcYZx7ehuB1mUqLcfm4.PWi6E6idK9G', 'متطوع', 'سارى', NULL, NULL, '6FQu3t9RKSf1phF3HpAhjdsNKFXgyezfNSEEQPMpOdzl2BaxUSOATFC9v8QN', '2022-09-11 05:00:07', '2022-09-11 05:05:09'),
(138, 'بتول', 'حسين', 'محمد', 'ال منصور', 'beto0o2015@hotmail.com', '966534149739', '1095603351', 7, 'uploads/volunteers/transfer_pics/138/5596E364-1020-4BA0-BDF8-9B60B154A2DB.png', 'uploads/volunteers/cvs/138/بتول حسين محمد ال منصور .pdf', '2022-09-11', '2023-09-11', '$2y$10$dpIX1wzVBiPrqQMVj4QWg.6QxNro6swoP2k2doOxVnU13OSrYQjyW', 'متطوع', 'سارى', NULL, NULL, 'KaKvlA5xdOU1hFBJxBqDEmN7s95kjStizjY58bsRaE3NDS0FRF7DqKv58Fxd', '2022-09-11 07:44:15', '2022-09-11 07:49:56'),
(140, 'نوال', 'مسفر', 'هادي', 'ال سليم', 'nwalalslym908@gmail.com', '559574999', '1090752427', 8, 'uploads/volunteers/transfer_pics/140/28FAC6CD-28C0-44B2-8E41-06AF3A2B3DE7.png', 'uploads/volunteers/cvs/140/CV-Nawal Al Salim.pdf', '2022-09-16', '2023-09-16', '$2y$10$CVqVs/erDj/kCo.F8n0NSOlS7/11lgxBO7E7x5u/OGHKPxXJv/0Hu', 'متطوع', 'سارى', NULL, NULL, 'IbVr7y9LCdGPDqkxmNw3dR290yIzVvS7LDyx1qBhvJLNzRVwM90LGfDZ1olo', '2022-09-12 01:45:56', '2022-09-17 00:38:30'),
(141, 'عزيزة', 'علي', 'محمد', 'ال جعرة', 'azizahalimj@gmail.com', '0505479390', '1098305251', 8, 'uploads/volunteers/transfer_pics/141/download_1662920631898.png', 'uploads/volunteers/cvs/141/سيرة.pdf.pdf', '2022-09-16', '2023-09-16', '$2y$10$mQXq1ybTdxnc2qKttkvZj.xgxB/ZxDRRlU6w1px3H82mPYKshLMNi', 'متطوع', 'سارى', NULL, NULL, 'cIjUWws8LaswvSapqVKax4OEGGAhQLUaY4KPKTH5qnzSvTHr2Qegah6TMtsN', '2022-09-12 04:42:22', '2022-09-17 00:38:53'),
(142, 'منال', 'علي', 'محمد', 'اليامي', 'manalalyami19999@gmail.com', '966559287354', '1102213277', 8, 'uploads/volunteers/transfer_pics/142/28D59442-3D9D-4827-92BA-531DD51AFCE5.png', 'uploads/volunteers/cvs/142/CV.pdf', '2022-09-16', '2023-09-16', '$2y$10$7N5wzCsJlZYBrbcJg9oMTecreOf6ypg9iohTfN8mCk6DSklIN7xq2', 'متطوع', 'سارى', NULL, NULL, 'H70KHMBnwBYKKqUE7vcICF4ZIxsVYRDEKK7p9STpeRjqyTj6zqiTXScheL5V', '2022-09-12 06:25:29', '2022-09-17 00:39:25'),
(143, 'آيه', 'محمد', 'حسن', 'لسلوم', 'A.Y.A1111@hotmail.com', '966537909809', '1082314855', 7, 'uploads/volunteers/transfer_pics/143/76BC063A-17AB-4168-B4DC-CD1FD82215CB.png', 'uploads/volunteers/cvs/143/بلا عنوان 1.pdf', '2022-09-16', '2023-09-16', '$2y$10$NjB7mtXaDIOy5P66x6xHL.vSLI2.DGs3AmySjwc4T1ta2yf6gsmr2', 'متطوع', 'سارى', NULL, NULL, 'Tvj9yQa4QeooZnMbFm1PxQF5EeIITeIJhiX3aUq1nzWkSt3tsLYntFQ8t6bh', '2022-09-12 12:34:35', '2022-09-17 00:40:25'),
(144, 'أحمد', 'محمد', 'إسماعيل', 'اليامي', 'eng.ahmedalyami@gmail.com', '966500958103', '1016431346', 12, 'uploads/volunteers/transfer_pics/144/bill.jpg', 'uploads/volunteers/cvs/144/سيرة للجمعية.pdf', '2022-09-16', '2023-09-16', '$2y$10$jjVsXGgSt9HcEaodspO7D.4y13tIcApEuzQszemBpfZaAtGsvAh7W', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-09-13 09:14:11', '2022-09-17 00:42:21'),
(145, 'نوره', 'حسين', 'سعد', 'ال دغيش', 'school.3377@hotmail.com', '0539178600', '1033175009', 5, 'uploads/volunteers/transfer_pics/145/C5C917E0-FD85-434D-B9B5-602EE4C9ACEB.png', 'uploads/volunteers/cvs/145/مستندات ممسوحة ضوئيًا.pdf', '2022-09-16', '2023-09-16', '$2y$10$ODXINRhhiqxsqywUyaz93.KjOuBpd.Ud6FryEMXPADk10NgpLX.zC', 'متطوع', 'سارى', NULL, NULL, 'B8IMuCNmIujMSJO6Y5mhFH1kBYm2aOYGiJgXrDkmou8QMGoLnoFJo4iGFpzl', '2022-09-13 16:20:23', '2022-09-17 00:42:46'),
(146, 'امل', 'محمد', 'جويرالله', 'ال عدينان', 'asmahmealyami1122@hotmail.com', '966508025773', '1058305887', 5, 'uploads/volunteers/transfer_pics/146/ايصال-امل-محمد-ال-عدينان.png', 'uploads/volunteers/cvs/146/СМ امل محمد ال عدينان.pdf', '2022-09-26', '2023-09-26', '$2y$10$p1M9dinNa0pnRCtgloQZIuAzLJ5LSczf17BjxeKfD3sQu4EtHU7ou', 'متطوع', 'سارى', NULL, NULL, 'oKYX4m6COfeQhPzN6HdF8M30z3LGE3kksvSQyNa41at2sp8tYNQltWwxKoqI', '2022-09-19 14:47:50', '2022-10-07 06:54:49'),
(147, 'علي', 'صالح', 'حسين', 'بالحارث', 'ali136613@hotmail.com', '569327222', '1052663265', 5, 'uploads/volunteers/transfer_pics/147/86CCB9DA-4BC6-46A5-A291-FAC3E4138A9C.jpeg', 'uploads/volunteers/cvs/147/6E8C3A81-194B-4672-9912-8EDEFD17D9B6.pdf', '2022-09-26', '2023-09-26', '$2y$10$o70sJQyERSCAqNWgJwm9jeeChpzjXlqgmXm3gCYZvEEiSiq7PkVvK', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-09-20 06:09:25', '2022-09-26 16:53:50'),
(148, 'نايف', 'غانم', 'صالح', 'القشانين', 'yam-911@hotmail.com', '966548044555', '1025732395', 12, 'uploads/volunteers/transfer_pics/148/5CC366B8-CEC5-4537-A265-DC8029218231.jpeg', 'uploads/volunteers/cvs/148/‏لقطة شاشة ٢٠٢٢-٠٩-١٩ في ١١.٣١.٣٥ م.pdf', '2022-09-26', '2023-09-26', '$2y$10$7Eox4ck3efOEU1KwvxVHJeCcVRdhV1Nb2XoCVLcO1/MaTVX0DO6.q', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-09-20 06:33:28', '2022-09-26 16:54:01'),
(150, 'حواء', 'محمد', 'صالح', 'سدران', 'hwasdran@gmail.com', '560996776', '1063828956', 5, 'uploads/volunteers/transfer_pics/150/٢٠٢٢٠٩٢٥_٢٠١٠٠٢.jpg', 'uploads/volunteers/cvs/150/٢٠٢٢٠٩٢٥_٢٠١٠٠٢.jpg', '2022-09-26', '2023-09-26', '$2y$10$xxSupcFKYBkbs3huZZ9Dj.ooS.oYJ86cx4VrI4EZzBp8BgX0MJfca', 'متطوع', 'سارى', NULL, NULL, 'L8YCuOuISIXZnXpIDKuIQXPGjkkxlBPJdbAnlj6pxilAe5WllLiLMn5JvVPp', '2022-09-26 03:13:04', '2022-09-26 16:55:35'),
(151, 'عبير', 'راشد', 'حسين', 'ال هتيلة', 'abeer1122aa@icloud.com', '0502615844', '1099143495', 7, 'uploads/volunteers/transfer_pics/151/IMG_6233 2.jpg', 'uploads/volunteers/cvs/151/عبير ال هتيلة.pdf', '2022-09-26', '2022-09-26', '$2y$10$pdANjeIWIh0W5QKnoHvtNOXziWq3v1f2RybuZEHFCBL6tPN64WhLm', 'متطوع', 'قيد المراجعة', NULL, NULL, NULL, '2022-09-27 03:09:32', '2022-09-27 03:09:32'),
(152, 'نوف', 'صالح', 'محمد', 'ال حويل', 'Noufsaleh.najran@outlook.sa', '966507952215', '1049934688', 7, 'uploads/volunteers/transfer_pics/152/E41DE74A-F923-4F6F-B8DE-E37A8359721C.png', 'uploads/volunteers/cvs/152/جدييييد سيرة ذاتية.pdf', '2022-09-28', '2023-09-28', '$2y$10$FRoi6YxQStb48uyCpFC50eIpIf6cuDHKLpmgaaqh2ILO.QmTetHAG', 'متطوع', 'سارى', NULL, NULL, '4d0aBX0ykrs157lpVtJzeuYIcZJ87dmegk6TGvLAwLmLQEIWKEBfFWrCfunb', '2022-09-27 04:32:07', '2022-09-29 01:25:11'),
(153, 'رابيه', 'حسين', 'فهيد', 'الصقور', 'peace7194@gmail.com', '966598878078', '1086703103', 7, 'uploads/volunteers/transfer_pics/153/902058BA-44BD-4866-9C62-8956150D6027.png', 'uploads/volunteers/cvs/153/cv..pdf', '2022-09-28', '2023-09-28', '$2y$10$nb.75JBjXGVHsEpCTJt5tupG2RspmSwIGf147bkj7li5kVQYzkdNm', 'متطوع', 'سارى', NULL, NULL, 'opYgUGjFBgDDI1gPaDzymzLgJnlqYcC6b5zuzpjEaQPkK0mvTpQKknA75KT9', '2022-09-28 01:39:00', '2022-09-29 01:25:30'),
(154, 'عبدالله', 'عساف', 'حسين', 'الشريف', 'aabduallah1992@icloud.com', '966559796362', '1076707726', 9, 'uploads/volunteers/transfer_pics/154/5606FFD0-F67A-4ADB-991B-9DC6302178F5.png', 'uploads/volunteers/cvs/154/Cv Abduallah _sport.pdf', '2022-09-30', '2023-09-30', '$2y$10$vVVRvI/CuqbMlI89TYLtQOi3hKgnEa34WXNBuF3PdCKqMGuwRYiI.', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-09-29 01:43:24', '2022-09-30 22:50:38'),
(155, 'فاطمة', 'صالح', 'هادي', 'آل هتيلة', 'Fsaleh8900@icloud.com', '532273694', '1105156580', 8, 'uploads/volunteers/transfer_pics/155/275D9ECB-B4D3-45D7-A24D-EEF0B218FB6F.png', 'uploads/volunteers/cvs/155/فاطمة صالح .pdf', '2022-09-30', '2023-09-30', '$2y$10$PpNhmlUMKZCJ/duh3wvFAOiUNaJ/YDlbFF9ZM7nFTRQmBJboU7GFq', 'متطوع', 'سارى', NULL, NULL, 'cFC38bFSmse1zlWM0X55L9hWDzMJpTiZL3aPatUqmhPMK8PiVH1OJY8f5tg9', '2022-09-29 02:40:27', '2022-09-30 22:51:14'),
(156, 'منى', 'مانع', 'محمد', 'ال شيبان', 'Mn00sh88@hotmail.com', '966502299488', '1065122937', 7, 'uploads/volunteers/transfer_pics/156/CB71186F-7CEA-4AC7-B65C-CCBCC4FCF8CF.jpeg', 'uploads/volunteers/cvs/156/Cv1.pdf', '2022-09-30', '2023-09-30', '$2y$10$uOMNCpeXGw0T4edFTBGFNeOKUgcSdlSkSUE5ouY6dLuSu2tFbXA3u', 'متطوع', 'سارى', NULL, NULL, 'UEF4TJc4NJI7fKiGMigvQCLcNMqSHlL5IY5KVqvvOWhRj21do2bTM5tjsDsM', '2022-09-29 13:49:34', '2022-09-30 22:51:59'),
(157, 'عبير', 'عبدالله', 'علي', 'ال ساري', 'abeeran1900@gmail.com', '966507441002', '1080907841', 7, 'uploads/volunteers/transfer_pics/157/Screenshot_20220929_135050_com.alahli.mobile.android.jpg', 'uploads/volunteers/cvs/157/السيره الذاتيه.pdf', '2022-09-30', '2023-09-30', '$2y$10$ctq.k8b0Z.3Uwot5Kc5fLuiRzecOglHkowkS/ZsXgqaqfiYX.GwB.', 'متطوع', 'سارى', NULL, NULL, '7m4A1FBiGpGlPvyYbisR9HfUY3adsvVCHzvA7sO9zTcOqYQMXZ6SfPQuV1lP', '2022-09-29 20:51:59', '2022-09-30 22:52:33'),
(158, 'روان', 'يحيى', 'محمد', 'ال مهري', 'alr89566@gmail.com', '966508549727', '1097749970', 7, 'uploads/volunteers/transfer_pics/158/364A605A-07E8-4CC8-A20F-E2132F8D6F1F.png', 'uploads/volunteers/cvs/158/IMG_6333.pdf', '2022-10-04', '2023-10-04', '$2y$10$1wDxYKuyMAk.W2JBImYtQeC07DyS6EOtSzGd4In2OVYD0fn2VbIeK', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-10-03 02:28:58', '2022-10-04 07:54:20'),
(159, 'فاطمة', 'محمد', 'سالم', 'ال مطير', 'tentsnajran@gmail.com', '966542041151', '1098661885', 7, 'uploads/volunteers/transfer_pics/159/16CCC113-30E5-4544-881A-37C308B2CE04.jpeg', 'uploads/volunteers/cvs/159/سيرة ذاتية فاطمة محمد.pdf', '2022-10-04', '2023-10-04', '$2y$10$FD8i5TnFgHF3RzlPpYIePehGPbOV2EkdeEqEidrpHMO3VHXlFJqxC', 'متطوع', 'سارى', NULL, NULL, 'JtpYzIlesUekSqfuqBdJsNbRy3bxDTKb4zs5WVdkyhR1HcVMjtajOk4JmIlm', '2022-10-03 08:40:02', '2022-10-04 07:54:50'),
(160, 'رفعه', 'حمد', 'علي', 'ال قعيمان', 'alyasoob.lulu@hotmail.com', '966509153336', '1028269429', 7, 'uploads/volunteers/transfer_pics/160/12B96BBC-E76E-4C50-9E6C-34EA4FED34F2.png', 'uploads/volunteers/cvs/160/مستند جديد 2022-05-13.pdf', '2022-10-04', '2023-10-04', '$2y$10$auvDFQ9mG5NH6yE4dAYUk.cBFKyX6IQ.YXyWNb05wraSkjWQ7G.hq', 'متطوع', 'سارى', NULL, NULL, 'FtcG2W7G0yUMNZtNktxDMLO4hRxEWHFEL3rkDcAExV2WWu4yXa4IVOBA0Qpn', '2022-10-03 19:27:30', '2022-10-04 07:56:32'),
(162, 'بدور', 'سعيد', 'مهدي', 'آل سوار', 'bdooralbdoor295@gmail.com', '966555060461', '1024132084', 5, 'uploads/volunteers/transfer_pics/162/414A4D14-1EDC-47D1-93F8-87FE1B312D0A.jpeg', 'uploads/volunteers/cvs/162/CamScanner 10-03-2022 19.25.pdf', '2022-10-04', '2023-10-04', '$2y$10$16zk/ppxm/EzE3okhtVd0Oxq2bs4GGlHaAGK8j79F1O7XqfqTYgya', 'متطوع', 'سارى', NULL, NULL, 'WAFmDZuT31uZKyCamZrLDoMNfY1EMRuUhvzRlmKr0alDCN7ul3w72g3DT4zF', '2022-10-04 03:17:46', '2022-10-05 01:45:39'),
(164, 'نوره', 'علي', 'صالح', 'ال قريشه', 'N1994ra@gmail.com', '0536278682', '1086612817', 7, 'uploads/volunteers/transfer_pics/164/6808886E-25AF-4EEE-85D3-2E249B8BAF6A.png', 'uploads/volunteers/cvs/164/السيره -الذاتيه.pdf', '2022-10-03', '2022-10-03', '$2y$10$OHhub58Kuvf06NrLctpUSukogqQD./flWayOIrpsiLhGFOCpbu8du', 'متطوع', 'قيد المراجعة', NULL, NULL, NULL, '2022-10-04 04:30:17', '2022-10-04 04:30:17'),
(165, 'محسنة', 'عبيان', 'محمد', 'آل غانم', 'ctman.ng@gmail.com', '556200572', '1123699736', 7, 'uploads/volunteers/transfer_pics/165/6D07C12E-2033-47F0-8DB0-C15D9F2D0E0C.jpeg', 'uploads/volunteers/cvs/165/محسنه.pdf', '2022-10-04', '2023-10-04', '$2y$10$5qr7pEtRzXPSzGQEZg43QOsIUuQy4eZ./gb7phD0xe2.Gvsq9MREW', 'متطوع', 'سارى', NULL, NULL, '9mqtVu4buvKrQlnFkKPCuz6E8nrGjCqsAwCyQsNOBIvnxAtcIxZeGFAVkezX', '2022-10-04 06:20:14', '2022-10-04 07:57:52'),
(166, 'لمى', 'حسن', 'راشد', 'ال منصور', 'Lama_h.s@hotmail.com', '966502554689', '1097652133', 7, 'uploads/volunteers/transfer_pics/166/714BDBE7-24C3-4F62-BFF0-EF525DDB431C.png', 'uploads/volunteers/cvs/166/السي في.pdf', '2022-10-04', '2023-10-04', '$2y$10$QA9e3Y1KvqBZot.JOrJBhe6yYMPo.AAW6JPjwf0BSf/XZoBc4ERZu', 'متطوع', 'سارى', NULL, NULL, 'hs2Rmo2lGe4cjQQ5KJtP0zQpbzgo0SiuuehfFYP2CvULtdS7mOOcivNFFQ9L', '2022-10-04 08:54:31', '2022-10-04 20:29:44'),
(167, 'ريم', 'محمد', 'قاسم', 'عامر', 'aall9099@icloud.com', '0533626747', '2206549871', 7, 'uploads/volunteers/transfer_pics/167/08CE257B-6E4E-470E-ABCF-3FDD30288301.jpeg', 'uploads/volunteers/cvs/167/شهادتي .pdf', '2022-10-04', '2023-10-04', '$2y$10$oQCdG1GKmN3/Uu8JtUjSOOEi9vhNY1qiRbUFigDGC3dsWhs12XCoC', 'متطوع', 'سارى', NULL, NULL, 'jIJfo59Ue7tFu5pSwfFyVKS9J93wXXaLDXH5rewXLJK1Q0sU5Z7W3o6Onhy7', '2022-10-04 08:56:09', '2022-10-04 20:30:13'),
(169, 'نورة', 'محمد', 'علي', 'العطشان', 'nmaa121314@gmail.com', '535700867', '1027056314', 5, 'uploads/volunteers/transfer_pics/169/946CE067-E2D3-46AE-A86E-DE4B47705D28.jpeg', 'uploads/volunteers/cvs/169/مستندات ممسوحة ضوئيًا.pdf', '2022-10-04', '2023-10-04', '$2y$10$a496pHhZLxFVLdgZebnKUOvNpmpHNNPvsH7kHazVi/gytolRoqVPW', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-10-05 04:28:14', '2022-10-05 05:08:07'),
(171, 'رشا', 'محمد', 'علي', 'اليامي', 'Rashamohammed1980@icloud.com', '0537525776', '1039247935', 7, 'uploads/volunteers/transfer_pics/171/06AD1204-8068-4645-875F-F8EE88CD1B25.png', 'uploads/volunteers/cvs/171/‏لقطة شاشة ٢٠٢٢-٠١-٢٧ في ٦.١٠.٥٤ م.pdf', '2022-10-07', '2023-10-07', '$2y$10$AQEuCBDqO6osG/mfEs.pAe/tHVhqAwnuzvzvbDT1O4NInUSc7j3ue', 'متطوع', 'سارى', NULL, NULL, 'JAsbPUluTnydyum4JeWLZNTpofqXuI75Ll9uJnOOzYbgzj7RGcypbWWtYPyi', '2022-10-06 00:22:55', '2022-10-08 00:31:46'),
(172, 'أمل', 'عبدالله', 'سعد', 'عسيري', 'am-7437@hotmail.com', '502362301', '1074067776', 12, 'uploads/volunteers/transfer_pics/172/3813120C-3EC6-4626-AFF2-3BC3F8289030.png', 'uploads/volunteers/cvs/172/Amal CV.pdf', '2022-10-07', '2023-10-07', '$2y$10$6akeGcS7Zn8MyqBp1y.F1ewsqjMEbBjxqYGVfrkXAwZJhWHuPUMEW', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-10-06 00:46:56', '2022-10-08 00:32:06'),
(173, 'نادية', 'محمد', 'علي', 'اا قريشة', 'nadiah.moh892@gmail.com', '0551411556', '1027243938', 5, 'uploads/volunteers/transfer_pics/173/نور.jpg', 'uploads/volunteers/cvs/173/السيرة الذاتية .pdf', '2022-10-07', '2023-10-07', '$2y$10$aUqAMTjDn1X223WFdpiZm.qRGEz8LOdP8JMb2XHkU4cSHTsh.iN42', 'متطوع', 'سارى', NULL, NULL, 'EBplW5DFzv2mxPVjv6hVqYb5BfV1VhRD0w7aaJXe9lrbStMbiVpsFJBtahNg', '2022-10-06 02:07:19', '2022-11-03 04:06:46'),
(174, 'هدى', 'حسين', 'علي', 'بلحارث', 'Huda.asa211@gmail.com', '0505950146', '1082906130', 7, 'uploads/volunteers/transfer_pics/174/6AA1262C-19AF-42E0-B7E1-983B823D0507.png', 'uploads/volunteers/cvs/174/Kingdom of Saudi Arabia.pdf', '2022-10-07', '2023-10-07', '$2y$10$xB0gvbmsq4T2/vu5ayScqOwbW2J27lXIfZ/x1ke3h/5Uz6ia7DDjK', 'متطوع', 'سارى', NULL, NULL, '0m8fJ8yfIfPgnThI9Q9xQUY3pis3lRcQG8yBAu8YBhkQiBwohlSE3TItqqxw', '2022-10-06 23:35:58', '2022-10-20 02:54:53'),
(175, 'فايقة', 'فهيد', 'سالم', 'الصقور', 'faygah.fheed@gmail.com', '966582912805', '1019968658', 5, 'uploads/volunteers/transfer_pics/175/‎⁨فايقة فهيد سالم-1⁩.jpg', 'uploads/volunteers/cvs/175/فايقة.pdf', '2022-10-10', '2023-10-10', '$2y$10$64EwnbCztoR0EGlCJP.n1uMvYKBKr5SPuaPEJmJyX4jpSWrOGbAQ.', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-10-09 06:16:37', '2022-10-11 05:58:02'),
(176, 'وضحى', 'مانع', 'صالح', 'ال زمانان', 'wmsnz20@gmail.com', '966550527729', '1092664075', 7, 'uploads/volunteers/transfer_pics/176/7E503B91-8015-4BC8-A37C-4D1F7AD5BC7E.png', 'uploads/volunteers/cvs/176/CV wadha 1.pdf', '2022-10-10', '2023-10-10', '$2y$10$Ms5IzlnmpuJ265bFY4cKrug6fMjNYIE1ZelBQ.Y/aKgXMFHqkG0tm', 'متطوع', 'سارى', NULL, NULL, 'GiRCoCT09M8nHMChgRiEiSFONLpYnRd0idjwbsnoN3nKLT5GgtulJV97ROIv', '2022-10-11 02:53:55', '2022-10-11 05:58:39'),
(177, 'فوزية', 'محمد', 'علي', 'ال حوكاش', 'msalh4460@gmail.com', '0509084727', '1031864588', 5, 'uploads/volunteers/transfer_pics/177/Screenshot_20221012_082438_com.google.android.apps.docs.jpg', 'uploads/volunteers/cvs/177/سيرة ذاتية - فوزية ال حوكاش.pdf', '2022-10-17', '2023-10-17', '$2y$10$Vw1Co7RrqHqMKjguztTNUetTaw2I8ZvwFGKypGswZXrjob0LIG4L.', 'متطوع', 'سارى', NULL, NULL, 'E66QnMo7d4D4b58W8wDPdmynuihGykQgTG1UCgsmuAnlXGB6wyLRC2JIPl5o', '2022-10-12 16:28:19', '2022-10-17 09:13:12'),
(179, 'حنان', 'سالم', 'مهدي', 'القعود', 'hanansalemq93@gmail.com', '0500142937', '1036443420', 5, 'uploads/volunteers/transfer_pics/179/83A103A7-CAE6-45C2-8030-14D858B9CD7E.png', 'uploads/volunteers/cvs/179/سيرة ذاتية محدثة.pdf', '2022-10-17', '2023-10-17', '$2y$10$m15ip7ruv3mqo6SnwR8dredkqK.9Ap5Ybwe9Cm9yxxuU/F5kojzkO', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-10-15 04:32:39', '2022-10-17 09:15:20'),
(180, 'غاده', 'حمد', 'عاي', 'ال دويس', 'alya1231409@gmail.com', '508580017', '1074572999', 8, 'uploads/volunteers/transfer_pics/180/F8C903F4-DEDE-40C9-8554-BC93E6F35A70.jpeg', 'uploads/volunteers/cvs/180/سيرة ذاتية عليا.pdf', '2022-10-17', '2023-10-17', '$2y$10$HZ/B9YW9/5qPsm8LdFKxruVZ8JWZlEXUgWpJ1W4JNCB554pYAn.zi', 'متطوع', 'سارى', NULL, NULL, 't74nkJFbShx5dYhsGCYXRXtQyu4l2gUZgCXu566qsZ0WcUvrK7nSKDboKhKJ', '2022-10-15 20:37:57', '2022-10-17 09:14:46'),
(181, 'صفية', 'حسن', 'عبدالله', 'القحطاني', 'alhajri2300@gmail.com', '966509280288', '1028389425', 12, 'uploads/volunteers/transfer_pics/181/4EC0FA2C-DDB6-455E-B1A5-CC42829D2F8F.jpeg', 'uploads/volunteers/cvs/181/cv.Noof_١٤٣٨١٢٠١٠٠١٥٤٤.pdf', '2022-10-17', '2023-10-17', '$2y$10$PtUoh5mXBY2NMKl87BibjOruKOzONkFphiauZCslOH5WoaAcIWWYC', 'متطوع', 'سارى', NULL, NULL, 'mgHPt8wtqF9Nd5xr4JpnHp6AnUd4lWSnCyPizqCC4iIb7HSYbxOPWkjDlf9p', '2022-10-16 01:27:37', '2022-10-17 09:15:55'),
(183, 'الوليد', 'ناصر', 'ناصر', 'الوتيد', 'gfdssryhjjv@dfyhhotmailcom', '966509700003', '1065929273', 5, 'uploads/volunteers/transfer_pics/183/BE2A1F49-A038-4D4A-B04D-E4AE35BFEFC8.jpeg', 'uploads/volunteers/cvs/183/سيفي غ.pdf', '2022-10-17', '2023-10-17', '$2y$10$I056WZWN9ViUQWGxjaoTLOZa1KD/sd2Y5PMQpdRI0C14PUgGeZf2G', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-10-17 09:22:55', '2022-10-17 09:26:01'),
(184, 'رحمه', 'صالح', 'مانع', 'اليامي', 'wwwxxvvv777@gmail.com', '966559735704', '1022267270', 5, 'uploads/volunteers/transfer_pics/184/D3BA936C-398D-4982-8D0E-FDD5364B4576.png', 'uploads/volunteers/cvs/184/ايصال جمعية نور النسائيه.pdf', '2022-10-22', '2023-10-22', '$2y$10$pq/HeD0HVQ9punblCT8xq.KloSZBJlHKyicM53fxrSxBLviH5v4K6', 'متطوع', 'سارى', NULL, NULL, '70NVWyJrKbG0nzQ8v7DwJtg1hUrA20ev9rXNaR0Hl4tlFmezVM72oE7E9Jvl', '2022-10-22 05:07:16', '2022-10-23 02:36:05'),
(185, 'قينه', 'عبدالله', 'محمد', 'بالحارث', 'rlen82606@gmail.com', '0555261642', '1049615691', 9, 'uploads/volunteers/transfer_pics/185/E03C163E-C13A-439A-AFB1-269E0D1E8EDE.png', 'uploads/volunteers/cvs/185/صورة.pdf', '2022-10-22', '2023-10-22', '$2y$10$wkN91cVL0uYzV8MehjcaEe1RIo9t1RBoIWOi88wOPlPiMRw0Wupi6', 'متطوع', 'سارى', NULL, NULL, 'rcG4FG0K9TLYZKnwQWsCQ5AeqtX2R92iIAnSjPr8XRzKzepnVh5AW8TDjFOs', '2022-10-23 02:26:59', '2022-10-23 02:36:33'),
(186, 'فاطمه', 'الحين', 'علي', 'المكرمي', 'abdmns55@gmail.com', '966534024334', '1026917144', 5, 'uploads/volunteers/transfer_pics/186/Screenshot_٢٠٢٢١٠٢٤-٢١٤٨٥٨_Office.jpg', 'uploads/volunteers/cvs/186/Screenshot_٢٠٢٢١٠٢٤-٢١٤٨٥٨_Office.jpg', '2022-10-29', '2023-10-29', '$2y$10$raiOPPcgvsiPg8RZvUCQCOsTzIw.6ZgpXhv.iKheqZ7xaxGgPlEqa', 'متطوع', 'سارى', NULL, NULL, '9YzpqpSfFsGFAUJKeceCMPmLrqCfgbXNSn0h5EJWfPtRGGfyVBahUHLNJmEQ', '2022-10-25 04:49:40', '2022-10-30 03:35:28'),
(187, 'عزيه', 'احسن', 'منصور', 'المكرمي', 'azzyah19@gmail.con', '554561119', '0158185586', 5, 'uploads/volunteers/transfer_pics/187/B03B68AF-0424-462E-8056-0F6C0BA0F78C.jpeg', 'uploads/volunteers/cvs/187/CamScanner 10-26-2022 16.53.pdf', '2022-10-29', '2023-10-29', '$2y$10$L46z2w1BOkirkhX.zxYaLOdRe/0Z4QtBNn9HliMbxbWjAFhzwYXsi', 'متطوع', 'سارى', NULL, NULL, '1t0FO2eCSSAFeBLD4L98hRFAkkxfJ9a10ljkg0RXNvdIEX0MbQFFZlUzgHxw', '2022-10-27 00:32:26', '2022-10-30 03:38:03'),
(188, 'نبيله', 'ابراهيم', 'علي', 'ال موته', 'om.saleh0909@outlook.sa', '966555724996', '1025787597', 5, 'uploads/volunteers/transfer_pics/188/5EED089D-8E41-46AB-9873-349D14907D6F.jpeg', 'uploads/volunteers/cvs/188/Transaction-Receipt.pdf', '2022-10-29', '2023-10-29', '$2y$10$T8ZOyhUb9ygbYlyAG6jZa.q5lkfL8bNlMPiJ6CedkkZ9qwncplxtG', 'متطوع', 'سارى', NULL, NULL, 'RZAoykuayjlCAwW07sWT0lPW5p8Vkee1YkdVnOqpLp5mTcRnkkby0taKBAZD', '2022-10-29 02:52:48', '2022-10-30 03:38:27'),
(189, 'نوره', 'سالم', 'محمد', 'ال عطوه', 'n.alatwah11@gmail.com', '966506001751', '1018793164', 8, 'uploads/volunteers/transfer_pics/189/BEDF8A12-5815-4080-BB1D-70A3807E10FD.png', 'uploads/volunteers/cvs/189/transfer-receipt.pdf', '2022-11-03', '2023-11-03', '$2y$10$Z4T7qqQBZKjbTVn2HPwGVeLI.sEIGCT9jnKhfNAbe/6VXd8LRKW4m', 'متطوع', 'سارى', NULL, NULL, 'Av4iZX4Gk5SS3ypTwN3QlXFzQGp2zqxoFXc2rssng2Gc8OotSNSIgRw1TfqQ', '2022-10-31 15:58:27', '2022-11-04 00:11:40'),
(190, 'مباركه', 'محمد', 'ناصر', 'ال ساعد', 'Almemo5250@gmail.com', '966553516717', '1018717429', 5, 'uploads/volunteers/transfer_pics/190/098E2831-E2E8-4566-BA38-B6572A4F7E17.jpeg', 'uploads/volunteers/cvs/190/سيره ذاتيه مباركه.pdf', '2022-11-03', '2023-11-03', '$2y$10$CvZD06FeVCKc2JPIAzbU.OS/g0yblY5g3Mbi6EhhU62HRMbTGlljm', 'متطوع', 'سارى', NULL, NULL, 'oEwJyCK3HdXyviYa8MZ08hfl99go3IWmye03f3YruYzuSO3E1bv1IpfCGhoF', '2022-10-31 17:47:01', '2022-11-03 21:08:09'),
(191, 'اميره', 'مهدي', 'علي', 'ال حيدر', 'ameerah.0474@gmail.com', '0557906995', '1024524058', 5, 'uploads/volunteers/transfer_pics/191/75D31E34-87EB-444B-8825-997F08221D75.jpeg', 'uploads/volunteers/cvs/191/شهادة دروب العمل عن بعد .pdf', '2022-11-03', '2023-11-03', '$2y$10$HBSzAOaDUzEVyGVsEh2uOuLzFxclhtdPwpxZQO.j8flzv5x870Mme', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-10-31 17:56:35', '2022-11-03 21:08:35'),
(192, 'فاطمة', 'ظافر', 'علي', 'ال الحارث', 'love.666666@hotmail.com', '966550549888', '1047213309', 9, 'uploads/volunteers/transfer_pics/192/سند1.pdf', 'uploads/volunteers/cvs/192/سيرة ذاتية فاطمه ظافر ال الحارث.pdf', '2022-11-03', '2023-11-03', '$2y$10$.Y5qJTahRb9Twd.m33Nraeubuv6OIsW8OuUDhF.46gw5tDP/6lGZy', 'متطوع', 'سارى', NULL, NULL, 'Wak2hTRvAHYX5G5q8ZOIrYgHa6HPRpN6to7Zwh5SaXtXsWQ0rgVBy5Riipu3', '2022-11-02 21:25:52', '2022-11-03 21:37:38'),
(193, 'فاطمه', 'ظافر', 'علي', 'رجا', 'rjafatmt93@gmail.com', '966507337204', '1033745140', 5, 'uploads/volunteers/transfer_pics/193/Screenshot_٢٠٢٢١١٠٦-١٦٣٣٣٦_Drive.jpg', 'uploads/volunteers/cvs/193/المستند.pdf', '2022-11-07', '2023-11-07', '$2y$10$fD2wS9C9Bpun8ExY9XdcaOjm4IgTz6tTst1EPx2qj5k2l4KN.VD0q', 'متطوع', 'سارى', NULL, NULL, 'W2QbdrzDxghO9YgsSrU45MJjRGJ8Lnb6FllerhED8xWZTIrmClgTefE8S3mu', '2022-11-07 14:46:56', '2022-11-08 05:22:04'),
(194, 'ابتسام', 'ناصر', 'حسن', 'ال فاضل', 'basmah9298@icloud.com', '966560930308', '1035263100', 5, 'uploads/volunteers/transfer_pics/194/A86A4BA0-9565-4587-AB81-D6F487D369AB.png', 'uploads/volunteers/cvs/194/CamScanner 11-07-2022 15.33.pdf', '2022-11-07', '2023-11-07', '$2y$10$Pr6r4sZtnY26L8fFVsQPf.N50UsU2UugdwsNO0PD0k7KcURBzocxC', 'متطوع', 'سارى', NULL, NULL, NULL, '2022-11-07 22:37:04', '2022-11-08 05:22:45'),
(195, 'العنود', 'علي', 'مهدي', 'ال بالحارث', 'accc12233@hotmail.com', '966530375622', '1043741972', 5, 'uploads/volunteers/transfer_pics/195/FF9D8D2B-9D01-4F1C-AFB2-9ED69119F5E8.png', 'uploads/volunteers/cvs/195/السيره الذاتيه.pdf', '2022-11-07', '2023-11-07', '$2y$10$aOpQlgv4c.i/B32HVCwXaeiBQ8zIc95v0srkDZLvMMY9pHHeIqgtK', 'متطوع', 'سارى', NULL, NULL, 'phzJljFfeXnZ9GILCKBosmf1Coiy17FsaZ73gpgX4R96wqdusoQMyq35IBPq', '2022-11-08 01:18:43', '2022-11-08 05:23:15'),
(196, 'عوض', 'صالح', 'علي', 'آل شيبه', 'awd1308@hotmail.com', '966506793335', '1061673909', 9, 'uploads/volunteers/transfer_pics/196/E554FB82-DC46-4DAA-8959-FA3E6C56EE3D.jpeg', 'uploads/volunteers/cvs/196/سيرة ذاتية20.pdf', '2022-11-07', '2022-11-07', '$2y$10$ZMm5iPkGzOFQA1XuhLU4BuqbXHQK6UVcG/5zzc.gkm7GgoRBidJiq', 'متطوع', 'قيد المراجعة', NULL, NULL, NULL, '2022-11-08 07:39:55', '2022-11-08 07:39:55'),
(197, 'سارة', 'حمد', 'هادي', 'آل عقيل', 'sarah_hamd12@hotmail.com', '966556724912', '1025751932', 5, 'uploads/volunteers/transfer_pics/197/19D2405B-5D13-4051-8318-85469C676A27.jpeg', 'uploads/volunteers/cvs/197/سي في قرفهA09A-AD57FFCB560A.pdf', '2022-11-08', '2022-11-08', '$2y$10$85uF0ylrRu/4jfgy3y66/.Hl8ri4toM.hl3FHRbuF64ZpMp1YLlcS', 'متطوع', 'قيد المراجعة', NULL, NULL, NULL, '2022-11-08 19:44:38', '2022-11-08 19:44:38'),
(198, 'حياة', 'فايز', 'علي', 'ال مهري', 'hayah7997@icloud.com', '966559388907', '1041680313', 5, 'uploads/volunteers/transfer_pics/198/B90BF865-8444-4A43-BE8D-61AB7E722E5D.png', 'uploads/volunteers/cvs/198/6.pdf', '2022-11-09', '2022-11-09', '$2y$10$KKJrMFzz577m3S4o/rG48.xqmtC0GM6wrTClCdD.K224PXR8sCF7a', 'متطوع', 'قيد المراجعة', NULL, NULL, NULL, '2022-11-09 17:16:54', '2022-11-09 17:16:54'),
(199, 'حياة', 'فايز', 'علي', 'ال مهري', 'almhryhyah@gmail.com', '966505659002', '1041680313', 5, 'uploads/volunteers/transfer_pics/199/8C1BDC3A-37AD-4338-87A6-2715C87114A7.png', 'uploads/volunteers/cvs/199/6.pdf', '2022-11-09', '2022-11-09', '$2y$10$zMUkkLxuFf2HI4gVfJ3wWeNJ11i5vZWOY.1tFhVRyYPeJ2m5VzQwW', 'متطوع', 'قيد المراجعة', NULL, NULL, NULL, '2022-11-09 17:23:47', '2022-11-09 17:23:47'),
(200, 'قينه', 'هادي', 'علي', 'ال مرقان', 'gogo109nlm@gamil.com', '0558620765', '1022012130', 7, 'uploads/volunteers/transfer_pics/200/C5179775-9904-4A9D-BD31-A25E43D52354.jpeg', 'uploads/volunteers/cvs/200/السيرة الذاتية لقينة مرقان.pdf', '2022-11-09', '2022-11-09', '$2y$10$CarCv1IKxqjP0dR.6vtKPu2SmieeBQx0YHcT0OulLEr5WNcgWS99m', 'متطوع', 'قيد المراجعة', NULL, NULL, NULL, '2022-11-09 18:04:56', '2022-11-09 18:04:56'),
(201, 'إبراهيم', 'محمد', 'إبراهيم', 'عواجي', 'awajiibrahaim@gmail.com', '966567896621', '1028797254', 5, 'uploads/volunteers/transfer_pics/201/سداد جمعية نور 2.png', 'uploads/volunteers/cvs/201/السيرة الذاتية أ- إبراهيم عواجي.pdf', '2022-11-11', '2022-11-11', '$2y$10$CK80sGfev3ubN2asZXKlM.OEmXObC.UaX7k9EH35810wjdWwGWf5W', 'متطوع', 'قيد المراجعة', NULL, NULL, NULL, '2022-11-11 23:10:18', '2022-11-11 23:10:18');

-- --------------------------------------------------------

--
-- Table structure for table `volunteer_password_resets`
--

CREATE TABLE `volunteer_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_content`
--
ALTER TABLE `about_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `beneficiaries`
--
ALTER TABLE `beneficiaries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD UNIQUE KEY `admins_api_token_unique` (`api_token`),
  ADD KEY `disability_id` (`disability_id`),
  ADD KEY `nationality_id` (`nationality_id`);

--
-- Indexes for table `beneficiary_password_resets`
--
ALTER TABLE `beneficiary_password_resets`
  ADD KEY `admin_password_resets_email_index` (`email`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `disabilities`
--
ALTER TABLE `disabilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `experience_certificate`
--
ALTER TABLE `experience_certificate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `volunteer_id_41` (`volunteer_id`);

--
-- Indexes for table `experience_certificate_prints_number`
--
ALTER TABLE `experience_certificate_prints_number`
  ADD PRIMARY KEY (`id`),
  ADD KEY `volunteer_id_40` (`volunteer_id`);

--
-- Indexes for table `experience_certificate_settings`
--
ALTER TABLE `experience_certificate_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `index_content`
--
ALTER TABLE `index_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `informations`
--
ALTER TABLE `informations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_id` (`field_id`),
  ADD KEY `qualification_id` (`qualification_id`);

--
-- Indexes for table `maillist`
--
ALTER TABLE `maillist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `nationalities`
--
ALTER TABLE `nationalities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_type_id` (`order_type_id`),
  ADD KEY `nationality_id_2` (`nationality_id`),
  ADD KEY `disability_id_2` (`disability_id`);

--
-- Indexes for table `order_types`
--
ALTER TABLE `order_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qualifications`
--
ALTER TABLE `qualifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `renewal_requests`
--
ALTER TABLE `renewal_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `volunteer_id_12` (`volunteer_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `beneficiary_id` (`beneficiary_id`),
  ADD KEY `specialist_id` (`specialist_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specialists`
--
ALTER TABLE `specialists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD UNIQUE KEY `admins_api_token_unique` (`api_token`);

--
-- Indexes for table `specialist_password_resets`
--
ALTER TABLE `specialist_password_resets`
  ADD KEY `admin_password_resets_email_index` (`email`);

--
-- Indexes for table `submits`
--
ALTER TABLE `submits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offer_id` (`offer_id`),
  ADD KEY `qualification_id_2` (`qualification_id`);

--
-- Indexes for table `supervisors`
--
ALTER TABLE `supervisors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD UNIQUE KEY `admins_api_token_unique` (`api_token`);

--
-- Indexes for table `supervisor_password_resets`
--
ALTER TABLE `supervisor_password_resets`
  ADD KEY `admin_password_resets_email_index` (`email`);

--
-- Indexes for table `volunteers`
--
ALTER TABLE `volunteers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD UNIQUE KEY `admins_api_token_unique` (`api_token`),
  ADD KEY `field_id_2` (`field_id`);

--
-- Indexes for table `volunteer_password_resets`
--
ALTER TABLE `volunteer_password_resets`
  ADD KEY `admin_password_resets_email_index` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_content`
--
ALTER TABLE `about_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `beneficiaries`
--
ALTER TABLE `beneficiaries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=358;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `disabilities`
--
ALTER TABLE `disabilities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `experience_certificate`
--
ALTER TABLE `experience_certificate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `experience_certificate_prints_number`
--
ALTER TABLE `experience_certificate_prints_number`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT for table `experience_certificate_settings`
--
ALTER TABLE `experience_certificate_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `index_content`
--
ALTER TABLE `index_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `informations`
--
ALTER TABLE `informations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `maillist`
--
ALTER TABLE `maillist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `nationalities`
--
ALTER TABLE `nationalities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `order_types`
--
ALTER TABLE `order_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `qualifications`
--
ALTER TABLE `qualifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `renewal_requests`
--
ALTER TABLE `renewal_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `specialists`
--
ALTER TABLE `specialists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `submits`
--
ALTER TABLE `submits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supervisors`
--
ALTER TABLE `supervisors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `volunteers`
--
ALTER TABLE `volunteers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `beneficiaries`
--
ALTER TABLE `beneficiaries`
  ADD CONSTRAINT `disability_id` FOREIGN KEY (`disability_id`) REFERENCES `disabilities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nationality_id` FOREIGN KEY (`nationality_id`) REFERENCES `nationalities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `experience_certificate`
--
ALTER TABLE `experience_certificate`
  ADD CONSTRAINT `volunteer_id_41` FOREIGN KEY (`volunteer_id`) REFERENCES `volunteers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `experience_certificate_prints_number`
--
ALTER TABLE `experience_certificate_prints_number`
  ADD CONSTRAINT `volunteer_id_40` FOREIGN KEY (`volunteer_id`) REFERENCES `volunteers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `field_id` FOREIGN KEY (`field_id`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `qualification_id` FOREIGN KEY (`qualification_id`) REFERENCES `qualifications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `disability_id_2` FOREIGN KEY (`disability_id`) REFERENCES `disabilities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nationality_id_2` FOREIGN KEY (`nationality_id`) REFERENCES `nationalities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_type_id` FOREIGN KEY (`order_type_id`) REFERENCES `order_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `renewal_requests`
--
ALTER TABLE `renewal_requests`
  ADD CONSTRAINT `volunteer_id_12` FOREIGN KEY (`volunteer_id`) REFERENCES `volunteers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `beneficiary_id` FOREIGN KEY (`beneficiary_id`) REFERENCES `beneficiaries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `specialist_id` FOREIGN KEY (`specialist_id`) REFERENCES `specialists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `submits`
--
ALTER TABLE `submits`
  ADD CONSTRAINT `offer_id` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `qualification_id_2` FOREIGN KEY (`qualification_id`) REFERENCES `qualifications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `volunteers`
--
ALTER TABLE `volunteers`
  ADD CONSTRAINT `field_id_2` FOREIGN KEY (`field_id`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
