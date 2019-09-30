/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 10.1.36-MariaDB : Database - sim_msi
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sim_msi` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `sim_msi`;

/*Table structure for table `admins` */

DROP TABLE IF EXISTS `admins`;

CREATE TABLE `admins` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `admins` */

insert  into `admins`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values 
(1,'admin','likuisa13@gmail.com','2019-09-30 09:30:37','',NULL,'2019-09-30 09:30:42','2019-09-30 09:30:43');

/*Table structure for table `bpjs` */

DROP TABLE IF EXISTS `bpjs`;

CREATE TABLE `bpjs` (
  `id_bpjs` int(11) NOT NULL AUTO_INCREMENT,
  `id_karyawan` bigint(20) DEFAULT NULL,
  `no_bpjs_kis` varchar(50) DEFAULT NULL,
  `status_bpjs` enum('Perusahaan','Pemerintah') DEFAULT NULL,
  `no_bpjs_ket` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_bpjs`),
  KEY `bpjs_ibfk_1` (`id_karyawan`),
  CONSTRAINT `bpjs_ibfk_1` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawans` (`id_karyawan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `bpjs` */

insert  into `bpjs`(`id_bpjs`,`id_karyawan`,`no_bpjs_kis`,`status_bpjs`,`no_bpjs_ket`,`created_at`,`updated_at`) values 
(1,334,'0000645536204','Pemerintah','16058291341','2019-08-16 06:19:44','2019-08-16 06:19:44'),
(17,347,'1434534','Perusahaan','22222212121',NULL,NULL);

/*Table structure for table `k3s` */

DROP TABLE IF EXISTS `k3s`;

CREATE TABLE `k3s` (
  `id_k3` int(11) NOT NULL AUTO_INCREMENT,
  `waktu` datetime DEFAULT NULL,
  `id_karyawan` bigint(20) DEFAULT NULL,
  `akibat` enum('M','CT','STB','CR') DEFAULT NULL,
  `cidera` varchar(50) DEFAULT NULL,
  `sumber` varchar(50) DEFAULT NULL,
  `tipe` varchar(50) DEFAULT NULL,
  `bagian_tubuh` varchar(50) DEFAULT NULL,
  `kerugian` varchar(100) DEFAULT NULL,
  `penyebab` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_k3`),
  KEY `k3_ibfk_1` (`id_karyawan`),
  CONSTRAINT `k3s_ibfk_1` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawans` (`id_karyawan`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `k3s` */

insert  into `k3s`(`id_k3`,`waktu`,`id_karyawan`,`akibat`,`cidera`,`sumber`,`tipe`,`bagian_tubuh`,`kerugian`,`penyebab`,`created_at`,`updated_at`) values 
(1,'2019-08-21 06:01:00',339,'CR','luka tertusuk jarum jahit','mesin jahit','-','jari telunjuk kanan','-','Kurang konsentrasi',NULL,NULL),
(4,'2019-08-07 13:00:00',334,'STB','Lutut','Tergelincir','-','Lutut Sebelah Kanan',NULL,'Kurang Konsentrasi',NULL,NULL),
(6,'2019-07-03 09:25:00',338,'STB','Luka tertusuk jarum jahit','Mesin Jahit',NULL,'Jari Tengah Kanan',NULL,'Kurang Konsentrasi','2019-08-22 06:58:59','2019-08-22 06:58:59');

/*Table structure for table `karyawans` */

DROP TABLE IF EXISTS `karyawans`;

CREATE TABLE `karyawans` (
  `id_karyawan` bigint(20) NOT NULL,
  `nama_karyawan` varchar(50) DEFAULT NULL,
  `tgl_masuk` date DEFAULT NULL,
  `bagian` varchar(50) DEFAULT NULL,
  `seksi` varchar(50) DEFAULT NULL,
  `posisi` varchar(50) DEFAULT NULL,
  `status_peg` enum('KONTRAK','TETAP') DEFAULT NULL,
  `no_k1` varchar(20) DEFAULT NULL,
  `k1_awal` date DEFAULT NULL,
  `k1_akhir` date DEFAULT NULL,
  `no_k2` varchar(20) DEFAULT NULL,
  `k2_awal` date DEFAULT NULL,
  `k2_akhir` date DEFAULT NULL,
  `no_ktp` varchar(20) DEFAULT NULL,
  `pendidikan` varchar(20) DEFAULT NULL,
  `tempat_lahir` varchar(20) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jk` enum('L','P') DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `anak` int(11) DEFAULT '0',
  `pasangan` varchar(50) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `telp` varchar(20) DEFAULT NULL,
  `hp` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `agama` varchar(20) DEFAULT NULL,
  `sts` enum('aktif','tidak aktif') DEFAULT 'aktif',
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_karyawan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `karyawans` */

insert  into `karyawans`(`id_karyawan`,`nama_karyawan`,`tgl_masuk`,`bagian`,`seksi`,`posisi`,`status_peg`,`no_k1`,`k1_awal`,`k1_akhir`,`no_k2`,`k2_awal`,`k2_akhir`,`no_ktp`,`pendidikan`,`tempat_lahir`,`tgl_lahir`,`jk`,`status`,`anak`,`pasangan`,`alamat`,`telp`,`hp`,`email`,`agama`,`sts`,`updated_at`,`created_at`) values 
(334,'ARI DWUI CAHYANI','2016-09-19','PRODUKSI','VARIASI','OPERATOR','KONTRAK','221/MSI/PRD/2016','2016-09-19','2018-09-18','328/SPK-II/08/2018','2018-09-19','2019-09-18','3401107006970001','SMP','KULON PROGO','1997-06-30','P','K',1,'JOKO IRNAWANTO','PENJALIN DONOMULYO NANGGULAN KULON PROGO','085879622291','085201031507',NULL,NULL,'aktif','2019-08-15 06:03:46','2019-08-15 06:03:46'),
(337,'EVA MAWARNI RISTIYANTI','2016-09-26','PRODUKSI','CUTTING','OPERATOR','KONTRAK','223/MSI/PRD/2016','2016-09-26','2018-09-25','330/SPK-II/08/2018','2018-09-26','2019-09-25','3402086607920002','SMK','BANTUL','1992-07-26','P','K',1,'JunyANTO','MANDING DAWANG SABDODADI BANTUL','08985144730','0',NULL,NULL,'aktif','2019-08-15 06:03:46','2019-08-15 06:03:46'),
(338,'KARYATI','2016-09-26','PRODUKSI','CUTTING','OPERATOR','KONTRAK','224/MSI/PRD/2016','2016-09-26','2018-09-25','331/SPK-II/08/2018','2018-09-26','2019-09-25','3402045105850003','SMA','BANTUL','1985-05-11','P','K',2,'GIYANTO','DUKUH SELOHARJO PUNDONG BANTUL','0','0',NULL,NULL,'aktif','2019-08-15 06:03:46','2019-08-15 06:03:46'),
(339,'SUSIANI','2016-09-26','PRODUKSI','CUTTING','OPERATOR','KONTRAK','225/MSI/PRD/2016','2016-09-26','2018-09-25','332/SPK-II/08/2018','2018-09-26','2019-09-25','3402096105850001','SMK','BANTUL','1985-05-21','P','K',2,'SUMARYANTO','SUMBER RT 01 SUMBERAGUNG JETIS BANTUL','087845806844','0',NULL,NULL,'aktif','2019-08-15 06:03:46','2019-08-15 06:03:46'),
(340,'WAHYU NINGSIH','2016-09-26','PRODUKSI','CUTTING','OPERATOR','KONTRAK','226/MSI/PRD/2016','2016-09-26','2018-09-25','333/SPK-II/08/2018','2018-09-26','2019-09-25','3402044802860003','SMK','BANTUL','1986-02-08','P','K',1,'YULIANTO','NAMBANGAN RT 02 SELOHARJO PUNDONG BANTUL','087839099290','0',NULL,NULL,'aktif','2019-08-15 06:03:46','2019-08-15 06:03:46'),
(341,'SARJIYANTI','2016-09-26','PRODUKSI','CUTTING','OPERATOR','KONTRAK','227/MSI/PRD/2016','2016-09-26','2018-09-25','334/SPK-II/08/2018','2018-09-26','2019-09-25','3402045905820003','SMA','BANTUL','1982-05-19','P','K',2,'SUNARYO','JELAPAN SELOHARJO PUNDONG BANTUL','088808993405','0',NULL,NULL,'aktif','2019-08-15 06:03:46','2019-08-15 06:03:46'),
(342,'ARISTIN AMBARARUM','2016-09-26','PRODUKSI','CUTTING','OPERATOR','KONTRAK','228/MSI/PRD/2016','2016-09-26','2018-09-25','335/SPK-II/08/2018','2018-09-26','2019-09-25','3402086610960001','SMK','BANTUL','1996-09-24','P','T',0,NULL,'MANDING DAWANG SABDODADI BANTUL','089633576692','0',NULL,NULL,'aktif','2019-08-15 06:03:46','2019-08-15 06:03:46'),
(343,'AGUSTINA DWI KURNIATI','2016-09-16','PRODUKSI','VARIASI','OPERATOR','KONTRAK','229/MSI/PRD/2016','2016-09-16','2018-09-15','336/SPK-II/08/2018','2018-09-16','2019-09-15','3402175808980002','SMK','BANTUL','1998-08-18','P','T',0,NULL,'KALAKAN RT 002 ARGOREJO SEDAYU BANTUL','085799137467','08164895914',NULL,NULL,'aktif','2019-08-15 06:03:46','2019-08-15 06:03:46'),
(345,'ISWADI','2016-10-26','UMUM','OB','OB','KONTRAK','230/MSI/PRD/2016','2016-10-26','2018-10-25','376/SPK-II/09/2018','2018-10-26','2019-10-25','3402172205830001',NULL,'BANTUL','1983-05-22','L','K',2,'ISMARYANI','SUNGAPAN DUKUH ARGODADI SEDAYU BANTUL','0','0',NULL,NULL,'aktif','2019-08-15 06:03:46','2019-08-15 06:03:46'),
(347,'NINING WARJANI','2016-10-03','PRODUKSI','VARIASI','OPERATOR','KONTRAK','231/MSI/PRD/2016','2016-10-03','2018-10-02','377/SPK-II/09/2018','2018-10-03','2019-10-02','3402176805840001','SMK','BANTUL','1984-05-28','P','K',3,'SIGIT TEJA SUSENA','SUNGAPAN DUKUH RT 68 ARGODADI SEDAYU BANTUL','087845813861','087838547300',NULL,NULL,'aktif','2019-08-15 06:03:46','2019-08-15 06:03:46'),
(348,'RINA WIJIASTUTI','2016-10-03','PRODUKSI','VARIASI','OPERATOR','KONTRAK','232/MSI/PRD/2016','2016-10-03','2018-10-02','378/SPK-II/09/2018','2018-10-03','2019-10-02','3402174311880001','SMK','BANTUL','1988-11-03','P','K',2,'PARJO HENDRIYANTO','JATEN ARGOSARI SEDAYU BANTUL','085643007315','085643008191',NULL,NULL,'aktif','2019-08-15 06:03:46','2019-08-15 06:03:46'),
(349,'NUR PUJIASTUTI','2016-10-03','PRODUKSI','MACHI','OPERATOR','KONTRAK','233/MSI/PRD/2016','2016-10-03','2018-10-02','379/SPK-II/09/2018','2018-10-03','2019-10-02','3402075411960001','SMA','BANTUL','1996-11-14','P','T',0,NULL,'IROYUDAN GUWOSARI PAJANGAN BANTUL','089621278676','0',NULL,NULL,'aktif','2019-08-15 06:03:46','2019-08-15 06:03:46'),
(350,'WIWID ROMADHONI','2016-10-03','PRODUKSI','OBRAS','OPERATOR','KONTRAK','234/MSI/PRD/2016','2016-10-03','2018-10-02','380/SPK-II/09/2018','2018-10-03','2019-10-02','3402075001970001','SMA','BANTUL','1997-01-10','P','T',0,NULL,'IROYUDAN GUWOSARI PAJANGAN BANTUL','089616387231','083869367075',NULL,NULL,'aktif','2019-08-15 06:03:46','2019-08-15 06:03:46'),
(1140,'Dwiki','2019-08-11','it','staff it','it system','KONTRAK','122','2019-08-13','2019-08-21',NULL,NULL,NULL,'2313','D2','Purbalingga','2019-08-05','L','Belum Menikah',0,'-','ooooooooo','219','31231','likuisa13@gmail.com','Islam','aktif',NULL,NULL);

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',2),
(3,'2019_08_14_071318_create_karyawans_table',2),
(4,'2019_08_19_065421_aset',2),
(5,'2019_08_19_081028_create_mutasis_table',3),
(6,'2019_08_20_035249_create_resigns_table',3),
(7,'2019_08_22_022715_create_k3s_table',3),
(8,'2019_08_22_084238_create_obats_table',3),
(9,'2019_08_22_084408_create_obat_masuks_table',3),
(10,'2019_08_22_084422_create_obat_keluars_table',3),
(11,'2019_09_30_011626_create_admins_table',3);

/*Table structure for table `mutasis` */

DROP TABLE IF EXISTS `mutasis`;

CREATE TABLE `mutasis` (
  `id_mutasi` int(11) NOT NULL AUTO_INCREMENT,
  `id_karyawan` bigint(20) NOT NULL,
  `bagian_asal` varchar(50) DEFAULT NULL,
  `seksi_asal` varchar(50) DEFAULT NULL,
  `posisi_asal` varchar(50) DEFAULT NULL,
  `bagian_tujuan` varchar(50) DEFAULT NULL,
  `seksi_tujuan` varchar(50) DEFAULT NULL,
  `posisi_tujuan` varchar(50) DEFAULT NULL,
  `tgl_mutasi` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_mutasi`),
  KEY `id_karyawan` (`id_karyawan`),
  CONSTRAINT `mutasis_ibfk_1` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawans` (`id_karyawan`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `mutasis` */

insert  into `mutasis`(`id_mutasi`,`id_karyawan`,`bagian_asal`,`seksi_asal`,`posisi_asal`,`bagian_tujuan`,`seksi_tujuan`,`posisi_tujuan`,`tgl_mutasi`,`created_at`,`updated_at`) values 
(2,337,'PRODUKSI','CUTTING','OPERATOR','PRODUKSI','CUTTING','STAFF','2019-08-13',NULL,NULL);

/*Table structure for table `obat_keluars` */

DROP TABLE IF EXISTS `obat_keluars`;

CREATE TABLE `obat_keluars` (
  `id_keluar` int(11) NOT NULL AUTO_INCREMENT,
  `tgl_keluar` date DEFAULT NULL,
  `id_karyawan` bigint(11) NOT NULL,
  `id_obat` int(11) NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `keluhan` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_keluar`),
  KEY `obat_keluar_ibfk_1` (`id_karyawan`),
  KEY `obat_keluar_ibfk_2` (`id_obat`),
  CONSTRAINT `obat_keluars_ibfk_2` FOREIGN KEY (`id_obat`) REFERENCES `obats` (`id_obat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `obat_keluars_ibfk_3` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawans` (`id_karyawan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `obat_keluars` */

/*Table structure for table `obat_masuks` */

DROP TABLE IF EXISTS `obat_masuks`;

CREATE TABLE `obat_masuks` (
  `id_masuk` int(11) NOT NULL AUTO_INCREMENT,
  `id_obat` int(11) NOT NULL,
  `tgl_masuk` date DEFAULT NULL,
  `sumber` varchar(50) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_masuk`),
  KEY `obat_masuk_ibfk_1` (`id_obat`),
  CONSTRAINT `obat_masuks_ibfk_1` FOREIGN KEY (`id_obat`) REFERENCES `obats` (`id_obat`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `obat_masuks` */

/*Table structure for table `obats` */

DROP TABLE IF EXISTS `obats`;

CREATE TABLE `obats` (
  `id_obat` int(11) NOT NULL AUTO_INCREMENT,
  `nama_obat` varchar(50) DEFAULT NULL,
  `jenis_obat` varchar(50) DEFAULT NULL,
  `stok` double DEFAULT '0',
  `satuan` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_obat`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `obats` */

insert  into `obats`(`id_obat`,`nama_obat`,`jenis_obat`,`stok`,`satuan`,`created_at`,`updated_at`) values 
(1,'Paracetamol','Tablet',0,'Butir',NULL,NULL),
(5,'Betadine','Cair',0,'Botol',NULL,NULL);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

insert  into `password_resets`(`email`,`token`,`created_at`) values 
('likuisa13@gmail.com','$2y$10$6n1LUfo9AaUlqwQ1f3n/2.TSvV2pYe/29vsUrrx.dI2ewXjVoYoPK','2019-09-30 07:05:49');

/*Table structure for table `resigns` */

DROP TABLE IF EXISTS `resigns`;

CREATE TABLE `resigns` (
  `id_resign` int(11) NOT NULL AUTO_INCREMENT,
  `id_karyawan` bigint(20) DEFAULT NULL,
  `tgl_resign` date DEFAULT NULL,
  `jenis_resign` enum('Kabur','Mengundurkan Diri','Meninggal','Pensiun') DEFAULT NULL,
  `keterangan` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_resign`),
  KEY `resigns_ibfk_1` (`id_karyawan`),
  CONSTRAINT `resigns_ibfk_1` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawans` (`id_karyawan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `resigns` */

insert  into `resigns`(`id_resign`,`id_karyawan`,`tgl_resign`,`jenis_resign`,`keterangan`,`created_at`,`updated_at`) values 
(3,334,'2018-05-21','Kabur','Tidak betah','2019-08-20 08:23:28','2019-08-20 08:23:28'),
(5,338,'2019-08-02','Kabur','Tanpa keterangan',NULL,NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `email_verified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `password` varchar(150) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values 
(1,'Dwiki Likuisa','likuisa13@gmail.com','2019-09-30 13:59:27','$2y$10$r3Mm6QouvzWhzWri8Lgu.uJNIPc8qdj1AgtrfuDo3KfsQsfivjmhO',NULL,'2019-09-30 06:59:27','2019-09-30 06:59:27');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
