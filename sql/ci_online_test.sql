-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Mar 2020 pada 10.34
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ci_online_test`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_prodi`
--

CREATE TABLE `data_prodi` (
  `id` int(11) NOT NULL,
  `id_prodi` int(11) NOT NULL,
  `nama_prodi` varchar(50) NOT NULL,
  `passing_grade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `data_prodi`
--

INSERT INTO `data_prodi` (`id`, `id_prodi`, `nama_prodi`, `passing_grade`) VALUES
(1, 1, 'D3 Pajak', 170),
(2, 2, 'D3 Akuntansi', 150),
(3, 3, 'D3 Kebendaharaan Negara', 160),
(4, 4, 'D3 Penilai', 160),
(5, 5, 'D3 Kepabeanan dan Cukai', 165),
(6, 6, 'D3 Manajemen Asset', 150),
(7, 7, 'D1 Pajak', 146),
(8, 8, 'D1 Kebendaharaan Negara', 146),
(9, 9, 'D1 Kepabeanan dan Cukai', 146);

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `id_dosen` int(11) NOT NULL,
  `nip` char(12) NOT NULL,
  `nama_dosen` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `matkul_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`id_dosen`, `nip`, `nama_dosen`, `email`, `matkul_id`) VALUES
(6, '00000001', 'TO1 TBI', 'tbi@tbi.com', 1),
(7, '00000002', 'TO1 TPA', 'tpa@tpa.com', 2),
(8, '00000003', 'TO1 TWK', 'twk@twk.com', 3),
(9, '00000004', 'TO1 TIU', 'tiu@tiu.com', 4),
(10, '00000005', 'TO1 TKP', 'tkp@tkp.com', 5),
(11, '00000006', 'TO 2 TPA', 'tpa2@tpa2.com', 7);

--
-- Trigger `dosen`
--
DELIMITER $$
CREATE TRIGGER `edit_user_dosen` BEFORE UPDATE ON `dosen` FOR EACH ROW UPDATE `users` SET `email` = NEW.email, `username` = NEW.nip WHERE `users`.`username` = OLD.nip
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `hapus_user_dosen` BEFORE DELETE ON `dosen` FOR EACH ROW DELETE FROM `users` WHERE `users`.`username` = OLD.nip
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'dosen', 'Pembuat Soal dan ujian'),
(3, 'mahasiswa', 'Peserta Ujian');

-- --------------------------------------------------------

--
-- Struktur dari tabel `h_tryout`
--

CREATE TABLE `h_tryout` (
  `id` int(11) NOT NULL,
  `id_tryout` int(11) NOT NULL,
  `id_mahasiswa` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nilai_tpa` int(11) NOT NULL,
  `nilai_tbi` int(11) NOT NULL,
  `nilai_twk` int(11) NOT NULL,
  `nilai_tiu` int(11) NOT NULL,
  `nilai_tkp` int(11) NOT NULL,
  `total_tpa_tbi` int(11) NOT NULL,
  `total_skd` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `h_tryout`
--

INSERT INTO `h_tryout` (`id`, `id_tryout`, `id_mahasiswa`, `nama`, `nilai_tpa`, `nilai_tbi`, `nilai_twk`, `nilai_tiu`, `nilai_tkp`, `total_tpa_tbi`, `total_skd`) VALUES
(47, 1, 12, 'Peserta Tryout', 117, 57, 75, 125, 151, 0, 0),
(48, 1, 7, 'Bara', 12, 5, 5, 20, 22, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `h_ujian`
--

CREATE TABLE `h_ujian` (
  `id` int(11) NOT NULL,
  `ujian_id` int(11) NOT NULL,
  `id_tryout` int(11) NOT NULL,
  `mahasiswa_id` int(11) NOT NULL,
  `list_soal` longtext NOT NULL,
  `list_jawaban` longtext NOT NULL,
  `jml_benar` int(11) NOT NULL,
  `jml_salah` int(11) NOT NULL,
  `jml_kosong` int(11) NOT NULL,
  `nilai` decimal(10,2) NOT NULL,
  `nilai_tkp` int(11) NOT NULL,
  `nilai_bobot` decimal(10,2) NOT NULL,
  `tgl_mulai` datetime NOT NULL,
  `tgl_selesai` datetime NOT NULL,
  `status` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `h_ujian`
--

INSERT INTO `h_ujian` (`id`, `ujian_id`, `id_tryout`, `mahasiswa_id`, `list_soal`, `list_jawaban`, `jml_benar`, `jml_salah`, `jml_kosong`, `nilai`, `nilai_tkp`, `nilai_bobot`, `tgl_mulai`, `tgl_selesai`, `status`) VALUES
(112, 19, 1, 12, '31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,76', '31:C:N,32:C:N,33:B:N,34:A:N,35::N,36::N,37::N,38::N,39::N,40::N,41::N,42::N,43::N,44::N,45::N,46::N,47::N,48::N,49::N,50::N,51::N,52::N,53::N,54::N,55::N,56::N,57::N,58::N,59::N,60::N,61::N,62::N,63::N,64::N,65::N,66::N,67::N,68::N,69::N,70::N,71::N,72::N,73::N,74::N,76::N', 3, 1, 41, '11.00', 0, '100.00', '2020-03-27 16:21:30', '2020-03-27 17:01:30', 'N'),
(113, 12, 1, 12, '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30', '1:B:N,2:A:N,3:C:N,4::N,5::N,6::N,7::N,8::N,9::N,10::N,11::N,12::N,13::N,14::N,15::N,16::N,17::N,18::N,19::N,20::N,21::N,22::N,23::N,24::N,25::N,26::N,27::N,28::N,29::N,30::N', 2, 1, 27, '7.00', 0, '100.00', '2020-03-27 16:22:55', '2020-03-27 16:42:55', 'N'),
(114, 19, 1, 7, '31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,76', '31:C:N,32:C:N,33::N,34::N,35::N,36::N,37:A:N,38::N,39::N,40::N,41::N,42::N,43::N,44::N,45::N,46::N,47::N,48::N,49::N,50::N,51::N,52::N,53::N,54::N,55::N,56::N,57::N,58::N,59::N,60::N,61::N,62::N,63::N,64::N,65::N,66::N,67::N,68::N,69::N,70::N,71::N,72::N,73::N,74::N,76::N', 3, 0, 42, '12.00', 0, '100.00', '2020-03-27 16:24:10', '2020-03-27 17:04:10', 'N'),
(115, 12, 1, 7, '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30', '1:B:N,2:C:N,3::N,4::N,5::N,6::N,7::N,8:C:N,9::N,10::N,11::N,12::N,13::N,14::N,15::N,16::N,17::N,18::N,19::N,20::N,21::N,22::N,23::N,24::N,25::N,26::N,27::N,28::N,29::N,30::N', 1, 2, 27, '2.00', 0, '100.00', '2020-03-27 16:24:34', '2020-03-27 16:44:34', 'N'),
(116, 16, 1, 7, '82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116', '82::N,83:A:N,84:A:N,85::N,86::N,87::N,88::N,89::N,90::N,91::N,92::N,93::N,94::N,95::N,96::N,97::N,98::N,99::N,100::N,101::N,102::N,103::N,104::N,105::N,106::N,107::N,108::N,109::N,110::N,111::N,112::N,113::N,114::N,115::N,116::N', 1, 1, 33, '3.00', 0, '100.00', '2020-03-27 16:51:27', '2020-03-27 17:21:27', 'N'),
(117, 17, 1, 7, '117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146', '117:B:N,118:C:N,119:B:N,120:D:N,121::N,122::N,123::N,124::N,125::N,126::N,127::N,128::N,129::N,130::N,131::N,132::N,133::N,134::N,135::N,136::N,137::N,138::N,139::N,140::N,141::N,142::N,143::N,144::N,145::N,146::N', 4, 0, 26, '16.00', 0, '100.00', '2020-03-27 16:51:42', '2020-03-27 17:21:42', 'N'),
(118, 21, 1, 7, '147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181', '147:D:N,148:D:N,149:A:N,150:D:N,151:D:N,152::N,153::N,154::N,155::N,156::N,157::N,158::N,159::N,160::N,161::N,162::N,163::N,164::N,165::N,166::N,167::N,168::N,169::N,170::N,171::N,172::N,173::N,174::N,175::N,176::N,177::N,178::N,179::N,180::N,181::N', 3, 2, 30, '10.00', 22, '100.00', '2020-03-27 16:52:15', '2020-03-27 17:32:15', 'N');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `id_jurusan` int(11) NOT NULL,
  `nama_jurusan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `nama_jurusan`) VALUES
(1, 'Tryout Online');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan_matkul`
--

CREATE TABLE `jurusan_matkul` (
  `id` int(11) NOT NULL,
  `matkul_id` int(11) NOT NULL,
  `jurusan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `jurusan_matkul`
--

INSERT INTO `jurusan_matkul` (`id`, `matkul_id`, `jurusan_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(30) NOT NULL,
  `jurusan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `nama_kelas`, `jurusan_id`) VALUES
(1, 'USM PKN STAN', 1),
(2, 'UTBK', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas_dosen`
--

CREATE TABLE `kelas_dosen` (
  `id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `dosen_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `kelas_dosen`
--

INSERT INTO `kelas_dosen` (`id`, `kelas_id`, `dosen_id`) VALUES
(1, 1, 6),
(2, 1, 8),
(3, 1, 7),
(4, 1, 11),
(5, 1, 9),
(6, 1, 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id_mahasiswa` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nim` char(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `sekolah` varchar(50) NOT NULL,
  `pilihan_1` int(11) NOT NULL,
  `pilihan_2` int(11) NOT NULL,
  `pilihan_3` int(11) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `kelas_id` int(11) NOT NULL COMMENT 'kelas&jurusan'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`id_mahasiswa`, `nama`, `nim`, `email`, `sekolah`, `pilihan_1`, `pilihan_2`, `pilihan_3`, `jenis_kelamin`, `kelas_id`) VALUES
(4, 'Coba', '77778888', 'coba@coba.com', '0', 0, 0, 0, 'L', 1),
(7, 'Jalu Satria', 'jalusatriiaa', 'pratamasatria500@gmail.com', 'SMAN 1 Jawa', 2, 4, 9, 'L', 1),
(8, 'Ozora', 'ozora', 'ozora@email.com', '0', 0, 0, 0, 'L', 1),
(9, 'Jalu Pratama', 'njir', 'jalusatria14@gmail.com', '0', 0, 0, 0, 'L', 1),
(10, 'matamu', 'matamu', 'matamu@gmail.com', '0', 0, 0, 0, 'L', 1),
(11, 'Member', 'member', 'member@gmail.com', '0', 0, 0, 0, 'L', 1),
(12, 'Jalu Satria Pratama', 'pratamajr', 'jalusatria17@gmail.com', 'SMA N 1 Seyegan', 4, 7, 8, 'L', 1),
(14, 'Bug', 'bug', 'bug@bug.com', '0', 0, 0, 0, 'L', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `matkul`
--

CREATE TABLE `matkul` (
  `id_matkul` int(11) NOT NULL,
  `nama_matkul` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `matkul`
--

INSERT INTO `matkul` (`id_matkul`, `nama_matkul`) VALUES
(1, 'TBI01'),
(2, 'TPA01'),
(3, 'TWK01'),
(4, 'TIU01'),
(5, 'TKP01'),
(6, 'SKD01'),
(7, 'TPA02'),
(8, 'TBI02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_tryout`
--

CREATE TABLE `m_tryout` (
  `id` int(11) NOT NULL,
  `id_tryout` int(11) NOT NULL,
  `nama_tryout` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `m_tryout`
--

INSERT INTO `m_tryout` (`id`, `id_tryout`, `nama_tryout`) VALUES
(1, 1, 'Tryout-01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_ujian`
--

CREATE TABLE `m_ujian` (
  `id_ujian` int(11) NOT NULL,
  `dosen_id` int(11) NOT NULL,
  `matkul_id` int(11) NOT NULL,
  `tryout_id` int(11) NOT NULL,
  `nama_ujian` varchar(200) NOT NULL,
  `jumlah_soal` int(11) NOT NULL,
  `waktu` int(11) NOT NULL,
  `jenis` enum('acak','urut') NOT NULL,
  `tgl_mulai` datetime NOT NULL,
  `terlambat` datetime NOT NULL,
  `token` varchar(5) NOT NULL,
  `jumlah_opsi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `m_ujian`
--

INSERT INTO `m_ujian` (`id_ujian`, `dosen_id`, `matkul_id`, `tryout_id`, `nama_ujian`, `jumlah_soal`, `waktu`, `jenis`, `tgl_mulai`, `terlambat`, `token`, `jumlah_opsi`) VALUES
(12, 6, 1, 1, 'TBI1', 30, 20, 'urut', '2020-03-21 14:11:02', '2020-03-31 14:11:04', 'UZFQZ', 4),
(16, 8, 3, 1, 'TWK1', 35, 30, 'urut', '2020-03-23 07:18:03', '2020-03-31 07:18:05', 'EWULO', 5),
(17, 9, 4, 1, 'TIU1', 30, 30, 'urut', '2020-03-23 07:19:04', '2020-03-30 07:19:06', 'NTBVE', 5),
(19, 7, 2, 1, 'TPA1', 45, 40, 'urut', '2020-03-23 09:11:35', '2020-03-31 09:11:36', 'FVTIQ', 4),
(20, 11, 7, 2, 'TBI2', 3, 40, 'urut', '2020-03-23 09:45:36', '2020-03-31 09:45:37', 'RWIIS', 5),
(21, 10, 5, 1, 'TKP1', 35, 40, 'urut', '2020-03-23 14:10:33', '2020-03-31 14:10:34', 'IMEAS', 5),
(23, 11, 7, 2, 'TPA2', 3, 40, 'urut', '2020-03-26 22:06:41', '2020-03-31 22:06:42', 'CBTZE', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_soal`
--

CREATE TABLE `tb_soal` (
  `id_soal` int(11) NOT NULL,
  `dosen_id` int(11) NOT NULL,
  `matkul_id` int(11) NOT NULL,
  `bobot` int(11) NOT NULL,
  `poin_a` int(11) NOT NULL,
  `poin_b` int(11) NOT NULL,
  `poin_c` int(11) NOT NULL,
  `poin_d` int(11) NOT NULL,
  `poin_e` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `tipe_file` varchar(50) NOT NULL,
  `soal` longtext NOT NULL,
  `opsi_a` longtext NOT NULL,
  `opsi_b` longtext NOT NULL,
  `opsi_c` longtext NOT NULL,
  `opsi_d` longtext NOT NULL,
  `opsi_e` longtext NOT NULL,
  `file_a` varchar(255) NOT NULL,
  `file_b` varchar(255) NOT NULL,
  `file_c` varchar(255) NOT NULL,
  `file_d` varchar(255) NOT NULL,
  `file_e` varchar(255) NOT NULL,
  `jawaban` varchar(5) NOT NULL,
  `created_on` int(11) NOT NULL,
  `updated_on` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_soal`
--

INSERT INTO `tb_soal` (`id_soal`, `dosen_id`, `matkul_id`, `bobot`, `poin_a`, `poin_b`, `poin_c`, `poin_d`, `poin_e`, `file`, `tipe_file`, `soal`, `opsi_a`, `opsi_b`, `opsi_c`, `opsi_d`, `opsi_e`, `file_a`, `file_b`, `file_c`, `file_d`, `file_e`, `jawaban`, `created_on`, `updated_on`) VALUES
(1, 6, 1, 1, 0, 0, 0, 0, 0, '', '', '<p>Ahmad run so fast to ... the bus.</p>', '<p>taking over</p>', '<p>take over</p>', '<p>take a look</p>', '<p>take after</p>', '', '', '', '', '', '', 'D', 1584630701, 1584630701),
(2, 6, 1, 1, 0, 0, 0, 0, 0, '', '', '<p>Kirana is my special girlfriend, I promise her\r\n... her next month.</p>', '<p>to marry</p>', '<p>marrying</p>', '<p>to married</p>', '<p>to be married</p>', '', '', '', '', '', '', 'A', 1584636100, 1584636705),
(3, 6, 1, 1, 0, 0, 0, 0, 0, '', '', '<p>He ... at home today because he has been\r\ngrounded by his mother.</p>', '<p>could be</p>', '<p>may be</p>', '<p>must be</p>', '<p>can be</p>', '', '', '', '', '', '', 'C', 1584636148, 1584636148),
(4, 6, 1, 1, 0, 0, 0, 0, 0, '', '', '<p>I think that he worked too slow ... he could\r\nfinish the assignment before deadline.</p>', '<p>if only</p>', '<p>would rather</p>', '<p>as though</p>', '<p>because</p>', '', '', '', '', '', '', 'C', 1584637864, 1584637864),
(5, 6, 1, 1, 0, 0, 0, 0, 0, '', '', '<p>They were ... in a basketball championship\r\nby our team, our team is the best team in\r\neastern district.</p>', '<p>outmatching</p>', '<p>defeating</p>', '<p>outmatched</p>', '<p>defeat</p>', '', '', '', '', '', '', 'C', 1584637922, 1584637922),
(6, 6, 1, 1, 0, 0, 0, 0, 0, '', '', '<p>Her wedding dresses ... by Oscar Lawalata.\r\nHe is a famous designer.</p>', '<p>will designed</p>', '<p>will design</p>', '<p>is designing</p>', '<p>will be designed</p>', '', '', '', '', '', '', 'D', 1584637967, 1584637967),
(7, 6, 1, 1, 0, 0, 0, 0, 0, '', '', '<p>You won’t be able to win this match ... you\r\ndo a lot of practice.</p>', '<p>if</p>', '<p>unless</p>', '<p>because</p>', '<p>as</p>', '', '', '', '', '', '', 'B', 1584638025, 1584638025),
(8, 6, 1, 1, 0, 0, 0, 0, 0, '', '', '<p>John’s score on the test is the highest in the\r\nclass, because...</p>', '<p>he should study last night</p>', '<p>he should have studied last night</p>', '<p>he must have studied last night</p>', '<p>he must had to study last night</p>', '', '', '', '', '', '', 'C', 1584638068, 1584638068),
(9, 6, 1, 1, 0, 0, 0, 0, 0, '', '', '<p>Sragen has not yet ratified the amandement,\r\nand...</p>', '<p>several others city hasn’t either</p>', '<p>neither has some city also have not\r\neither</p>', '<p>some other city also have not either</p>', '<p>neither have several other city</p>', '', '', '', '', '', '', 'D', 1584638104, 1584638104),
(10, 6, 1, 1, 0, 0, 0, 0, 0, '', '', '<p>Malang reles heavily on income from fruit\r\ncrops, and...</p>', '<p>bogor also</p>', '<p>bogor too</p>', '<p>bogor is as well</p>', '<p>so does Bogor</p>', '', '', '', '', '', '', 'D', 1584638135, 1584638135),
(11, 6, 1, 1, 0, 0, 0, 0, 0, '', '', '<p><u>The teacher said that...</u></p>', '<p>the student can turn over their reports on\r\nMonday</p>', '<p>the reports on Monday could be\r\nreceived from the students by him</p>', '<p>the students cuold hand in their report\r\non Monday</p>', '<p>the students will on Monday the reports\r\nturn in</p>', '', '', '', '', '', '', 'C', 1584638193, 1584638193),
(12, 6, 1, 1, 0, 0, 0, 0, 0, '', '', '<p>He ... to get some cards for his birthday, but\r\nnone arrived.</p>', '<p>promised</p>', '<p>expected</p>', '<p>assumed</p>', '<p>supposed</p>', '', '', '', '', '', '', 'B', 1584638219, 1584638219),
(13, 6, 1, 1, 0, 0, 0, 0, 0, '', '', '<p>What ... did you get for English test?</p>', '<p>Figure</p>', '<p>Mark</p>', '<p>number</p>', '<p>sign</p>', '', '', '', '', '', '', 'B', 1584638244, 1584638244),
(14, 6, 1, 1, 0, 0, 0, 0, 0, '', '', '<p>The living room was ... that I had to move to\r\nanother room to continue my reading.</p>', '<p>much noisy</p>', '<p>too noisy</p>', '<p>so noisy</p>', '<p>very noisy</p>', '', '', '', '', '', '', 'B', 1584638270, 1584638270),
(15, 6, 1, 1, 0, 0, 0, 0, 0, '', '', '<p><s></s>The government will make the\r\nbussinessman ... his loan.</p>', '<p>pays</p>', '<p>pay</p>', '<p>would pay</p>', '<p>to pay</p>', '', '', '', '', '', '', 'D', 1584638300, 1584638300),
(16, 6, 1, 1, 0, 0, 0, 0, 0, '4b22ec8c98893b75bd681eba4e4ab12e.png', 'image/png', '<p><strong>Error Recognition</strong></p><p>He <u>knows </u>to repair <u>the </u>carburator without <u>taking </u>the whole car <u>apart</u></p>', '<p>knows</p>', '<p>the</p>', '<p>taking</p>', '<p>apart</p>', '', '', '', '', '', '', 'A', 1584638440, 1584775141),
(17, 6, 1, 1, 0, 0, 0, 0, 0, 'f3f564dfebc6ef7503b67c49f4adbdb2.png', 'image/png', '<p>Finally, Janet is used to <u>cook </u>on an electric stove<u> after having </u>a gas <u>one </u><u>for so long.</u></p>', '<p>cook</p>', '<p>after having</p>', '<p>one</p>', '<p>for so long</p>', '', '', '', '', '', '', 'A', 1584638487, 1584774303),
(18, 6, 1, 1, 0, 0, 0, 0, 0, 'bf2b7db6a97589ff0172ba91e6879119.png', 'image/png', '<p>The <u>progress </u><u>made </u><u>in space</u> travel <u>for </u>the early 1960s is remarkable.</p>', '<p>progress</p>', '<p>made</p>', '<p>in space</p>', '<p>for</p>', '', '', '', '', '', '', 'D', 1584638517, 1584774371),
(19, 6, 1, 1, 0, 0, 0, 0, 0, '20c80257991a7e9e14eceae238323bdf.png', 'image/png', '<p><u>The main </u>office of the factory can <u>be found </u><u>in </u>maple street <u>in </u>London.</p>', '<p>The main</p>', '<p>befound</p>', '<p>in</p>', '<p>in</p>', '', '', '', '', '', '', 'C', 1584638552, 1584774430),
(20, 6, 1, 1, 0, 0, 0, 0, 0, 'a90d51d668130df427a2434e61a5a868.png', 'image/png', '<p><u>The </u>governor <u>has </u>not decided <u>how to</u> deal with the new problems <u>already</u>.</p>', '<p>the</p>', '<p>has</p>', '<p>how to</p>', '<p>already</p>', '', '', '', '', '', '', 'D', 1584638590, 1584774471),
(21, 6, 1, 1, 0, 0, 0, 0, 0, '2901366e0c30c1226abfbc7b9cc64594.png', 'image/png', '<p>Sandra has <u>not rarely</u> missed <u>a play</u> or concert <u>since</u> she <u>was a child.</u></p>', '<p>not rarely</p>', '<p>a play</p>', '<p>since</p>', '<p>was a child</p>', '', '', '', '', '', '', 'A', 1584638613, 1584774534),
(22, 6, 1, 1, 0, 0, 0, 0, 0, 'f83159d2a97bfec169748c9b8847d9eb.png', 'image/png', '<p>Do you get extra payment if you work ...?</p>', '<p>overlap</p>', '<p>overtime</p>', '<p>continuosly</p>', '<p>overlong</p>', '', '', '', '', '', '', 'B', 1584638635, 1584774618),
(23, 6, 1, 1, 0, 0, 0, 0, 0, 'f68c5a4faf824e57d153fca5abca48d8.png', 'image/png', '<p>I have just ... an account with the Mandiri.</p>', '<p>opened</p>', '<p>made</p>', '<p>entered</p>', '<p>registered</p>', '', '', '', '', '', '', 'B', 1584638659, 1584774649),
(24, 6, 1, 1, 0, 0, 0, 0, 0, '7ae611cfb5bbe13190ffe881d1bf9fcb.png', 'image/png', '<p><strong>Reading </strong>    </p><p>A little more than a hundred years ago, a\r\nscientist in Medford, Massachusetts was trying to\r\nhelp local industry. Instead of helping local\r\nindustry, however, he caused a major problem\r\nwitha the local environment.\r\n</p><p>    The scientist thought that it would be a\r\ngood idea to try to develop tke silk-making industry\r\nin Medford. He knew that the silk industry in Asia\r\nwas successful because of the silkworm, a\r\ncatterpilar that ate only mulberry leaves. Mulberry\r\ntrees did not grow in Medford, so the scientist\r\ndecided to work on developing a type of silkmaking\r\nworm that would eat the type of tree leaves\r\nin Medford.</p><p>    His plan was to create a worm that was a\r\ncross between the silkworm and another type of\r\nimported worm that would eat the types of leaves\r\naround Medford. Unfortunately, his plan did not\r\nturn out as he wanted. He was not able to come up\r\nwith a silk-producing worm. However, the worms\r\nthat he imported did like to eat the leaves of trees\r\naround Medford.</p><p><br></p><p>The situation in this passage took place\r\napproximately...</p>', '<p>a decade ago</p>', '<p>two decades ago</p>', '<p>a century ago</p>', '<p>two centuries ago</p>', '', '', '', '', '', '', 'C', 1584638863, 1584773466),
(25, 6, 1, 1, 0, 0, 0, 0, 0, '', '', '<p><em></em>The word major in paragraph 1 could be\r\nreplaced by...</p>', '<p>Military</p>', '<p>Huge</p>', '<p>Solvable</p>', '<p>Minuscule</p>', '', '', '', '', '', '', 'B', 1584638907, 1584638907),
(26, 6, 1, 1, 0, 0, 0, 0, 0, '', '', '<p>It can be inferred from the passage that the\r\nsilk-making industry...</p>', '<p>never got started</p>', '<p>produced lower quality silk</p>', '<p>is still being developed</p>', '<p>became quite successful</p>', '', '', '', '', '', '', 'A', 1584638950, 1584638950),
(27, 6, 1, 1, 0, 0, 0, 0, 0, '', '', '<p>The expression <strong>a cross between</strong> in\r\nparagraph 3 could be replaced by...</p>', '<p>an enemy of</p>', '<p>a combination of</p>', '<p>a predecessor of</p>', '<p>an invention of</p>', '', '', '', '', '', '', 'B', 1584639000, 1584639000),
(28, 6, 1, 1, 0, 0, 0, 0, 0, '', '', '<p>Finally, the scientist considered ...a new type\r\nof worm.</p>', '<p>to create</p>', '<p>creates</p>', '<p>Created</p>', '<p>Creating</p>', '', '', '', '', '', '', 'D', 1584639035, 1584639035),
(29, 6, 1, 1, 0, 0, 0, 0, 0, 'ffdfcc0432559e9129286c649668bdd4.png', 'image/png', '<p>I <u>have </u><u>spent </u>three <u>weeks </u>in Japan <u>last </u>Desember.</p>', '<p>have</p>', '<p>spent</p>', '<p>weeks</p>', '<p>last</p>', '', '', '', '', '', '', 'A', 1584639255, 1584774181),
(30, 6, 1, 1, 0, 0, 0, 0, 0, 'b9aab1690be11108257e13c2fac6cb04.png', 'image/png', '<p>The hammerhead shark is <u>usual </u>found in <u>warm </u><u>temperate </u><u>waters</u>.</p>', '<p>Usual</p>', '<p>Warm</p>', '<p>Temperate</p>', '<p>waters</p>', '', '', '', '', '', '', 'A', 1584639269, 1584774098),
(31, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>DITENGGAK = </p>', '<p>Disepak keatas</p>', '<p>Dipotong melintang</p>', '<p>Ditelan bulat-bulat</p>', '<p>Diminum sedikit-sedikit</p>', '', '', '', '', '', '', 'C', 1584646115, 1584646115),
(32, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>KISI-KISI = </p>', '<p>Alat penangkap ikan</p>', '<p>Alat hitung</p>', '<p>Terali</p>', '<p>Pola kerja</p>', '', '', '', '', '', '', 'C', 1584646151, 1584646151),
(33, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>SUTRADARA = </p>', '<p>Pemimpin acara</p>', '<p>Pengatur skenario</p>', '<p>Penulis naskah</p>', '<p>Pengarah adegan</p>', '', '', '', '', '', '', 'D', 1584646194, 1584646194),
(34, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p><u>DIKOTOMI = </u></p>', '<p>Dibagi dua</p>', '<p>Dua kepala</p>', '<p>Kembar dua</p>', '<p>Dwi fungsi</p>', '', '', '', '', '', '', 'A', 1584646223, 1584646223),
(35, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>BONGSOR  >&lt; .. </p>', '<p>Menumpuk</p>', '<p>Tertua</p>', '<p>Kerdil</p>', '<p>Susut</p>', '', '', '', '', '', '', 'C', 1584646330, 1584646330),
(36, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>DEDUKSI >&lt; ... </p>', '<p>Induksi</p>', '<p>Konduksi</p>', '<p>Reduksi</p>', '<p>Transduksi</p>', '', '', '', '', '', '', 'A', 1584646359, 1584646359),
(37, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>NOMADEN >&lt; ...</p>', '<p>Menetap</p>', '<p>Mapan</p>', '<p>Anomali</p>', '<p>Tak teratur</p>', '', '', '', '', '', '', 'A', 1584646384, 1584646384),
(38, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>SUMBANG >&lt; ... </p>', '<p>Kokoh</p>', '<p>Tepat</p>', '<p>Laras</p>', '<p>Mirip</p>', '', '', '', '', '', '', 'B', 1584646424, 1584646424),
(39, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>BATA : TANAH LIAT</p>', '<p>Batu : Pasir</p>', '<p>Kertas : Buku</p>', '<p>Bunga : Buah</p>', '<p>Beton : Semen</p>', '', '', '', '', '', '', 'D', 1584646461, 1584646461),
(40, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>PANAS : API</p>', '<p>Hujan : Awan</p>', '<p>Abu : Arang</p>', '<p>Terang : Matahari</p>', '<p>Dingin : Beku</p>', '', '', '', '', '', '', 'C', 1584646497, 1584646497),
(41, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>METEOROLOGI : CUACA</p>', '<p>Antropologi : Fosil</p>', '<p>Patologi : Penyakit</p>', '<p>Pedagogik : Sekolah</p>', '<p>Astronomi : Fisika</p>', '', '', '', '', '', '', 'C', 1584646535, 1584648513),
(42, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>RAMBUT : GUNDUL</p>', '<p>Bulu : Cabut</p>', '<p>Botak : Kepala</p>', '<p>Pakaian : Bugil</p>', '<p>Lantai : Licin</p>', '', '', '', '', '', '', 'C', 1584646560, 1584646560),
(43, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>Soal 13 – 17 berdasarkan bacaan berikut.</p><p xss=removed>Teknologi Komputer dan Masa Depan</p><p xss=removed>Oleh Djoko Wirjawan</p><p>    Kecepatan Komputer mengolah informasi sangat ditentukan oleh prosesornya. Dalam teknologi digital\r\nsilicon (konvensional), untuk meningkatkan kecepatan prosesor, kecepatan transistor dalam chip prosesor\r\nharus ditingkatkan. Upaya meningkatkan kecepatan transistor ini tidak mungkin dilakukan terus-menerus\r\ntanpa batas karena suatu saat pasti akan mencapai maksimum, yaitu ketika ukuran transistor sudah tidak\r\ndapat diperkecil lagi. Pada keadaan ini perlu ditemukan teknologi baru, misalnya teknologi kuantum untuk\r\nmeningkatkan kecepatan prosesor.</p><p>    Istilah kuantum (quantum) belakangan ini mulai popular dan sering digunakan dalam berbagai konsep yang memperkenalkan paradigm baru, quantum learning, quantum teaching, quantum business, dan sebagainya. Kiranya tidak berlebihan jika dikatakan bahwa istilah kuantum pertama kali diperkenalkan oleh Max Planck, seorang fisikawan Jerman, dalam teori kuantum, cahaya untuk menjelasakan radiasi benda hitam. Secara tidak langsung teori inilah yang melahirkan fisika kuantum yang memperoleh efek dominan pada sistem skala atomik.</p><p>    Sejalan dengan perkembangan ilmu fisika dan informasi , belakangan ini telah dimulai dikembangkan\r\nkomputansi kuantum yang menggunakan prinsip-prinsip fisika kuantum. Komputansi kuantum ini nantinya\r\ndiharapkan dapat melahirkan teknologi kuantum yang memungkinkan terobosan teknologi untuk mewujudkan\r\ncomputer masa depan (komputer kuantum) yang bekerja dengan cara yang sqama sekali berbeda dengan\r\nkomputer konvensional yang dikenal saat ini. (Dikutip dari harian Kompas, 27 Mei 2001, halaman 22)</p><p><br></p><p>Kata kuantum yang terdapat dalam teks di\r\natas bermakana …</p>', '<p>Banyaknya jumlah sesuatu.</p>', '<p>Kecepatan.</p>', '<p>Lompatan.</p>', '<p>Energi yang tidak dapat dipecah-pecah\r\nlagi.</p>', '', '', '', '', '', '', 'B', 1584646740, 1584646740),
(44, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>Max Planck seorang fisikawan Jerman yang\r\nsecara tidak langsung melahirkan teori…</p>', '<p>Komputansi kuantum</p>', '<p>Tekologi kuantum</p>', '<p>Cahaya kuantum</p>', '<p>Fisika kuantum</p>', '', '', '', '', '', '', 'D', 1584646787, 1584646787),
(45, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>Sistem komputer yang menggunakan\r\nteknologi digital silicon seperti yang ada pada\r\nkomputer yang biasa kita gunakan sekarang ini\r\ndalam hal kecepatan pengolahan informasi\r\npada komputer masa mendatang tidak lagi\r\ndiharapkan maksimum karena…</p>', '<p>transistornya sudah lemah.</p>', '<p>transistor tidak dapat ditingkatkan lagi\r\nkemampuannya.</p>', '<p>kecepatan prosesor dalam memproses\r\ninformasi sudah maksimum.</p>', '<p>ukuran transistornya sudah tidak dapat\r\ndiperkecil.</p>', '', '', '', '', '', '', 'D', 1584646819, 1584646819),
(46, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>    Untuk meningkatkan kecepatan prosesor\r\npada masa yang akan datang diperlukan\r\nteknologi baru yang disebut teknologi komputer\r\nquantum, yang cara kerjanya sama sekali\r\nberbeda dengan computer konvensional saat\r\nini.\r\nPernyataan di atas terdapat dalam paragraf…</p>', '<p>Pertama</p>', '<p>Kedua</p>', '<p>Ketiga</p>', '<p>Pertama dan ketiga</p>', '', '', '', '', '', '', 'D', 1584646851, 1584646851),
(47, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p><s></s>Harapan penulis dari teks di atas tertuang\r\npada …</p>', '<p>Paragraph 1</p>', '<p>Paragraph 2</p>', '<p>Paragraph 3</p>', '<p>Judul teks</p>', '', '', '', '', '', '', 'C', 1584646882, 1584646882),
(48, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>Jika mesin pembuat sosis dapat membuat\r\n3000 sosis dalam satu jam, berapa banyak\r\nsosis yang dapat dibuat dalam 45 menit?</p>', '<p>2250</p>', '<p>2400</p>', '<p>2500</p>', '<p>2550</p>', '', '', '', '', '', '', 'A', 1584646971, 1584646971),
(49, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>Apabila n dibagi 14 sisanya 10, berapakah\r\nsisanya jika n dibagi dengan 7 …</p>', '<p>2</p>', '<p>3</p>', '<p>4</p>', '<p>5</p>', '', '', '', '', '', '', 'B', 1584646996, 1584647005),
(50, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>Saat ini, Dinar berusia tiga kali usia Doni dan\r\nDoni lima tahun lebih muda dari Dinar. Jika 5\r\ntahun kemudian Dinar berusia dua kali usia\r\nDoni, berapa usia Doni sekarang?</p>', '<p>12</p>', '<p>6</p>', '<p>5</p>', '<p>3</p>', '', '', '', '', '', '', 'C', 1584647022, 1584647022),
(51, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>Disebuah kebun binatang, perbandingan singa\r\nlaut dan penguin adalah 4 : 11, jumlah penguin\r\n84 lebih banyak dari singa laut, berapa jumlah\r\nsinga laut?</p>', '<p>65</p>', '<p>56</p>', '<p>52</p>', '<p>48</p>', '', '', '', '', '', '', 'D', 1584647053, 1584647053),
(52, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>Tahun lalu keuntungan kafe ‘Waroeng Daoen’\r\nRp.20.000.000,-. Tahun ini keuntungannya\r\nnaik menjadi Rp.25.000.000,-. Jika presentasi\r\nkenaikannya sama, berapakah keuntungan\r\nkafe ‘Waroeng Daoen’ tahun depan?</p>', '<p>Rp.25.000.000,-</p>', '<p>Rp.27.500.000,-</p>', '<p>Rp.31.250.000,-</p>', '<p>Rp.32.500.000,-</p>', '', '', '', '', '', '', 'C', 1584647092, 1584647092),
(53, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>Untuk mencetak majalah, 1000 eksemplar\r\npertama diperlukan biaya Rp. X per exemplar\r\ndan Rp. Y untuk mencetak setiap exemplar\r\nberikutnya. Jika Z adalah lebih besar dari\r\n1000, berapakah biaya untuk mencetak\r\nmajalah sebanyak Z exemplar ?</p>', '<p>1000(Z-Y) + XY</p>', '<p>1000(Z-Y) + XZ</p>', '<p>1000(X-Y) + YZ</p>', '<p>1000X + XY</p>', '', '', '', '', '', '', 'C', 1584647137, 1584647137),
(54, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>Pada suatu orkestra, setiap pemusik\r\nmemainkan satu alat musik. Jika 1/5 pemusik\r\nmemainkan alat musik gesek, dan jumlah\r\npemusik yang memainkan alat musik tiup 2/3\r\nlebih banyak dari yang memainkan alat musik\r\ngesek. Berapa banyak pemain yang tidak\r\nmemainkan baik alat musik gesek maupun\r\ntiup?</p>', '<p>2/5</p>', '<p>7/15</p>', '<p>8/15</p>', '<p>2/3</p>', '', '', '', '', '', '', 'B', 1584647175, 1584647175),
(55, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>Kartu Bridge berisi x kartu berwarna hitam dan\r\ny kartu berwarna merah, dan a, b, c, d berturutturut\r\nkartu wajik, sekop, keriting, dan hati.\r\nMaka persamaan yang benar adalah …</p>', '<p>x=a+b</p>', '<p>y=c+d</p>', '<p>x=b+c</p>', '<p>y=c+d</p>', '', '', '', '', '', '', 'C', 1584647242, 1584647242),
(56, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>5 – 7 – 10 – 12 – 15 –</p>', '<p>17 – 20</p>', '<p>13 – 9</p>', '<p>18 – 20</p>', '<p>16 – 14</p>', '', '', '', '', '', '', 'A', 1584647285, 1584647285),
(57, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>2 – 5 – 7 – 3 – 6 – 8 – 4 –</p>', '<p>6 –7</p>', '<p>7 –9</p>', '<p>7 –8</p>', '<p>6 – 8</p>', '', '', '', '', '', '', 'B', 1584647312, 1584647312),
(58, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>50 – 40 – 31 – 23 – 16 –</p>', '<p>11</p>', '<p>10</p>', '<p>9</p>', '<p>8</p>', '', '', '', '', '', '', 'B', 1584647347, 1584647347),
(59, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>a – m – n – b – o – p – c –</p>', '<p>e</p>', '<p>p</p>', '<p>q</p>', '<p>r</p>', '', '', '', '', '', '', 'C', 1584647413, 1584647413),
(60, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>d – f – h – j – l –</p>', '<p>k – l</p>', '<p>m –n</p>', '<p>n – p</p>', '<p>m – o</p>', '', '', '', '', '', '', 'C', 1584647443, 1584647443),
(61, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>Jika nama nama kota yang dilalui oleh jalur\r\npantura dari Pekalongan sampai Pati\r\ndiurutkan dan dijadikan nama nama jalan\r\ndalam suatu kompleks perumahan, maka\r\nnama jalan setelah Jalan Demak adalah ...</p>', '<p>Jalan Semarang</p>', '<p>Jalan Kudus</p>', '<p>Jalan Purwodadi</p>', '<p>Jalan Jepara</p>', '', '', '', '', '', '', 'B', 1584647492, 1584647492),
(62, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>Semua penyelam adalah perenang\r\n</p><p>Sementara penyelam adalah pelaut</p>', '<p>Sementara pelaut adalah penyelam</p>', '<p>Sementara perenang bukan penyelam</p>', '<p>Sementara penyelam bukan pelaut</p>', '<p>Sementara penyelam bukan perenang</p>', '', '', '', '', '', '', 'C', 1584647526, 1584647526),
(63, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>Semua manusia tidak bertanduk</p><p>\r\nSemua kucing tidak memamah biak</p>', '<p>Manusia tidak memamah biak</p>', '<p>Kucing tidak bertanduk</p>', '<p>Manusia dan kucing tidak memamah biak\r\ndan tidak bertanduk</p>', '<p>Tidak dapat ditarik kesimpulan</p>', '', '', '', '', '', '', 'D', 1584647560, 1584647560),
(64, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>Sementara sarjana adalah dosen\r\n</p><p>Semua dosen harus meneliti</p>', '<p>Sementara peneliti bukan dosen</p>', '<p>Sementara dosen tidak meneliti</p>', '<p>Sementara sarjana bukan dosen</p>', '<p>Semua sarjana harus meneliti</p>', '', '', '', '', '', '', 'C', 1584647607, 1584647607),
(65, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>Semua seniman kreatif\r\n</p><p>Sementara ilmuwan tidak kreatif</p>', '<p>Sementara ilmuwan bukan seniman</p>', '<p>Tidak ada seniman yang ilmuwan</p>', '<p>Semua ilmuwan tidak kreatif</p>', '<p>Sementara ilmuwan kreatif</p>', '', '', '', '', '', '', 'D', 1584647636, 1584647636),
(66, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>Fira akan pergi mengunjungi enam orang temannya, yaitu Ira, Julia, Kartika, Lia, Mila ,dan Santi. Dari keenam\r\ntemannya tersebut diketahui bahwa Santi dikunjungi tidak di awal maupun di akhir. Kartika tidak dikunjungi\r\nsebelum atau sesudah Ira dan Julia. Lia dikunjungi segera setelah Kartika.</p><p><br></p><p>Dari keterangan di atas,manakah yang paling\r\nmungkin merupakan urutan teman yang dikunjungi\r\nFira?</p>', '<p>Ira, Kartika, Lia, Santi, Mila, Julia</p>', '<p>Kartika, Lia, Ira, Julia, Santi, Mila</p>', '<p>Kartika, Lia, Ira, Julia, Mila, Santi</p>', '<p>Kartika, Mila, Ira,Julia, Lia, Santi</p>', '', '', '', '', '', '', 'B', 1584647698, 1584647698),
(67, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>Selain Santi, siapakah yang paling tidak\r\nmungkin untuk dikunjungi untuk terakhir kalinya?</p>', '<p>Ira</p>', '<p>Mila</p>', '<p>Kartika</p>', '<p>Julia</p>', '', '', '', '', '', '', 'C', 1584647732, 1584647732),
(68, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>Jika Ira dan Julia mendapat kunjungan kedua\r\ndan ketiga, siapakah yang akan dikunjungi\r\nuntuk terakhir kalinya?</p>', '<p>Santi</p>', '<p>Kartika</p>', '<p>Mila</p>', '<p>Lia</p>', '', '', '', '', '', '', 'D', 1584647756, 1584647756),
(69, 7, 2, 1, 0, 0, 0, 0, 0, '', '', '<p>Jika Mila mendapat kunjungan pertama, dan\r\nKartika mendapat kunjungan ketiga, siapakah\r\nyang akan mendapatkan kunjungan kedua?</p>', '<p>Santi</p>', '<p>Ira</p>', '<p>Julia</p>', '<p>Lia</p>', '', '', '', '', '', '', 'A', 1584647779, 1584647779),
(70, 7, 2, 1, 0, 0, 0, 0, 0, '8b528c12d437ce31356f0dc1fdd203dd.png', 'image/png', '', '<p>A</p>', '<p>B</p>', '<p>C</p>', '<p>D</p>', '', '', '', '', '', '', 'A', 1584647907, 1584647907),
(71, 7, 2, 1, 0, 0, 0, 0, 0, '965cf1c2c6ca8f1c5ac8f6c2ac905243.png', 'image/png', '', '<p>A</p>', '<p>B</p>', '<p>C</p>', '<p>D</p>', '', '', '', '', '', '', 'B', 1584647940, 1584647940),
(72, 7, 2, 1, 0, 0, 0, 0, 0, 'fee5f819a486e3e00258a2ed5b9cf038.png', 'image/png', '', '<p>A</p>', '<p>B</p>', '<p>C</p>', '<p>D</p>', '', '', '', '', '', '', 'C', 1584647976, 1584647976),
(73, 7, 2, 1, 0, 0, 0, 0, 0, '37d41cbce7e269fcee6f990f337c52db.png', 'image/png', '', '<p>A</p>', '<p>B</p>', '<p>C</p>', '<p>D</p>', '', '', '', '', '', '', 'D', 1584647999, 1584647999),
(74, 7, 2, 1, 0, 0, 0, 0, 0, '084791b4e6b040bfd131177d795c41b8.png', 'image/png', '', '<p>A</p>', '<p>B</p>', '<p>C</p>', '<p>D</p>', '<p>E</p>', '', '', '', '', '', 'A', 1584648040, 1584648172),
(76, 7, 2, 1, 0, 0, 0, 0, 0, 'ee0e517917b2ef9b9d2b1bdc342aaf0e.png', 'image/png', '', '<p>A</p>', '<p>B</p>', '<p>C</p>', '<p>D</p>', '', '', '', '', '', '', 'B', 1584648084, 1584648084),
(77, 11, 7, 1, 0, 0, 0, 0, 0, '', '', '<p>RENDEZVOUS = </p>', '<p>Perjanjian</p>', '<p>Perikatan</p>', '<p>Pertemuan</p>', '<p>Persetujuan</p>', '', '', '', '', '', '', 'C', 1584721898, 1584721898),
(78, 11, 7, 1, 0, 0, 0, 0, 0, '', '', '<p>ANALGESIK = </p>', '<p>MAKANAN</p>', '<p>MINUMAN</p>', '<p>OBAT</p>', '<p>VAKSIN</p>', '', '', '', '', '', '', 'C', 1584765860, 1584765860),
(79, 11, 7, 1, 0, 0, 0, 0, 0, '', '', '<p>KONKURS = </p>', '<p>PERLOMBAAN</p>', '<p>PERTEMUAN</p>', '<p>PERJANJIAN</p>', '<p>PERIKATAN</p>', '', '', '', '', '', '', 'A', 1584766112, 1584766112),
(82, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p>Pengamalan Pancasila sebagai dasar Negara mengandung keharusankeharusan\r\ndan Larangan-larangan yang harus dilaksanakanoleh setiap warga\r\nNegara tanpa terkecuali. Norma dasar yang harus kita perhatikan dalam\r\nmengamalkan Pancasila sebagai dasar Negara adalah…</p>', '<p>Ketetapan MPR</p>', '<p>Pembukaan UUD 1945</p>', '<p>Batang tubuh UUD</p>', '<p>UU</p>', '<p>Ketentuan Hukum</p>', '', '', '', '', '', 'B', 1584885018, 1584885018),
(83, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p>Adanya konsekuensi yang sangat mendasar, adalah Pancasila sebagai….</p>', '<p>Dasar Negara</p>', '<p>Moral pembangunan bangsa</p>', '<p>Sumber nilai</p>', '<p>Ideologi terbuka</p>', '<p>Paradigma pembangunan</p>', '', '', '', '', '', 'E', 1584885051, 1584885051),
(84, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p>Yang menjadi kausal final dari Pancasila adalah….</p>', '<p>Piagam Jakarta</p>', '<p>Bangsa Indonesia</p>', '<p>Warga Negara Indonesia</p>', '<p>BPUPKI</p>', '<p>PPKI</p>', '', '', '', '', '', 'A', 1584885128, 1584885128),
(85, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p>Yang diatur oleh Hukum Dasar Negara adalah..</p><ol><li>Susunan organisasi suatu Negara</li><li>Membatasi tugas dan wewenang badan-badan Negara</li><li>Menjaga/mengatur hubungan vertical antara badan-badan Negara</li><li>Menjaga/ mengatur hubungan horizontal antara badan-badan Negara</li></ol>', '<p>1 Dan 3 Benar</p>', '<p>2 dan 4 Benar</p>', '<p>1, 2, dan 3 Benar</p>', '<p>Hanya 4 yang Benar</p>', '<p>Semua Jawaban Benar</p>', '', '', '', '', '', 'E', 1584885274, 1584885274),
(86, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p>Perbedaan antara wilayah territorial suatu Negara dengan wilayah exstra\r\nterritorial adalah…</p>', '<p>Merupakan wilayah tambahan</p>', '<p>Merupakan wilayah bebas</p>', '<p>Secara nyata berada di wilayah Negara lain</p>', '<p>Berada di dalam maupun diluar wilayah Negara</p>', '<p>Meliputi darat, laut, dan udara.</p>', '', '', '', '', '', 'B', 1584885309, 1584885345),
(87, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p>Telah beberapa kali pemerintahan secara bertahap menaikan harga BBM, tarif\r\nlistrik dan telepon dengan berbagai pertimbangan, satu diantaranya adalah…</p>', '<p>Mengatur pengeluaran Negara</p>', '<p>Menjaga stabilitas ekonomi</p>', '<p>Mengurangi subsidi oleh pemerintah.</p>', '<p>Meningkatkan kinerja BUMN</p>', '<p>Menjaga inflasi</p>', '', '', '', '', '', 'C', 1584885374, 1584885374),
(88, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p>Salah satu pidato yang terkenal dari Martin Luther King Jr. pada tahun 1960-\r\nan berjudul “I have a Dream”. Pidato itu berisi tentang ….</p>', '<p>Tuntutan persamaan hak warga kulit hitam di AS.</p>', '<p>Tuntutan hak pilih untuk warga kulit hitam.</p>', '<p>Tuntutan untuk member kesempatan kepada warga kulit hitam agar bisa\r\nduduk di palemen .</p>', '<p>Peringatan kepada seluruh warga AS tentang bahaya nuklir dalam perang\r\ndingin.</p>', '<p>Nasihat bagi perdamaian dunia.</p>', '', '', '', '', '', 'C', 1584885444, 1584885444),
(89, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p>Manusia pada dasarnya berpotensi untuk berperilaku baik, dan bisa menjadi\r\nmanusia ideal, jika ia dididik sesuai dengan norma dan nilai yang berlaku di\r\nmasyarakat. Pernyataan tersebut merupakan asas dari ....</p>', '<p>potensialitas</p>', '<p>moralitas</p>', '<p>dinamika</p>', '<p>sosialitas</p>', '<p>Realitas</p>', '', '', '', '', '', 'B', 1584885496, 1584885496),
(90, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p>Negara adalah alat masyarakat untuk mengatur hubungan antara manusia dalam masyarakat\r\ntersebut. Pernyataan ini merupakan pengertian negara ditinjau dari segi negara sebagai:</p>', '<p>Organisasi politik.</p>', '<p>Organisasi kesusilaan.</p>', '<p>Organisasi integralistik.</p>', '<p>Organisasi kekuasaan.</p>', '<p>Organisasi kemasyarakatan.</p>', '', '', '', '', '', 'D', 1584885788, 1584885788),
(91, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p>Unsur-unsur berdirinya negara secara konstitutif adalah ?...</p>', '<p>rakyat, penduduk, dan wilayah.</p>', '<p>wilayah, pemerintah dan pengakuan secara de facto.</p>', '<p>rakyat, pemerintah dan pengakuan secara de facto.</p>', '<p>rakyat, wilayah dan pemerintah yang berdaulat.</p>', '<p>rakyat, warga negara dan pemerintah yang berdaulat.</p>', '', '', '', '', '', 'D', 1584885820, 1584885820),
(92, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p>Perbedaan bentuk negara kesatuan dengan negara serikat terletak pada ...</p>', '<p>jabatan kepala negara.</p>', '<p>sistem pemerintahannya.</p>', '<p>jumlah UUD yang dimiliki.</p>', '<p>hak untuk mengatur daerahnya (ke dalam).</p>', '<p>kedaulatan keluar dipegang oleh pemerintah pusat.</p>', '', '', '', '', '', 'D', 1584885876, 1584885876),
(93, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p>Pengakuan de jure berarti pengakuan negara lain terhadap negara Indonesia secara resmi\r\nmenurut hukum misalnya ...</p>', '<p>17 Agustus 1945, terbentuknya negara Indonesia</p>', '<p>10 Juli 1947, pengakuan kedaulatan Republik Indonesia oleh Mesir.</p>', '<p>10 Juli 1947, terbentuknya negara Republik Indonesia Serikat oleh Belanda.</p>', '<p>27 Desember 1949, pengakuan Kedaulatan Republik Indonesia oleh Belanda</p>', '<p>10 Agustus 1945, pengakuan Kedaulatan Republik Indonesia oleh Arab Saudi.</p>', '', '', '', '', '', 'D', 1584885918, 1584885918),
(94, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p>Menurut Aristoteles pengertian politik adalah ...</p>', '<p>upaya untuk memperoleh sesuatu yang dikehendaki.</p>', '<p>pembuatan kebijaksanaan umum untuk masyarakat.</p>', '<p>kemahiran dalam bidang kenegaraan.</p>', '<p>pengambilan keputusan.</p>', '<p>meliputi seni dan ilmu.</p>', '', '', '', '', '', 'B', 1584885943, 1584885943),
(95, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p>Alasan pemerintah pusat memberi kekuasaan kepada daerah dengan asas tugas pembantuan\r\nadalah ...</p>', '<p>agar daerah turut serta membantu tugas pemerintah pusat.</p>', '<p>pemerintah pusat tidak dapat menyelesaikan semua urusan daerah.</p>', '<p>pemerintah daerah lebih berhasil melaksanakan pembangunan daerahnya</p>', '<p>pemerintah pusat kurang dapat bertanggung jawab atas daerahnya</p>', '<p>pemerintah daerah lebih bertanggung jawab atas daerahnya.</p>', '', '', '', '', '', 'B', 1584885989, 1584885989),
(96, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p>Banyak pendapat yang mengungkapkan bahwa masuknya Islam ke Indonesia\r\nselain abad ke-11 dan 13 adalah abad ke ke 7-8. Bukti yang memperkuat\r\npendapat tersebut adalah kenyataan historis bahwa ...</p>', '<p>angka yang tertera pada nisan Sultan Malik Al Saleh menunjukkan abad ke-7.</p>', '<p>Ditemukan makam Fatimah binti Maimun di Leran, Gresik.</p>', '<p>Marcopolo berpendapat agama Islam banyak berkembang di Sumatera\r\nsemenjak jatuhnya Sriwijaya.</p>', '<p>kawasan nusantara dan masyarakat nusantara telah menjalin hubungan\r\ndagang dengan India, Cina, Arab (Persia).</p>', '<p>penduduk nusantara sebagian besar masih berada pada tingkat rohani yang\r\nrendah.</p>', '', '', '', '', '', 'D', 1584886051, 1584886051),
(97, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p>Sumber dan bukti yang menunjukkan Perlak sebagai Kerajaan Islam pertama di\r\nIndonesia adalah ...</p>', '<p>ramainya pedagang di kerajaan Perlak.</p>', '<p>Perlak sebagai salah satu bandar perdagangan terpenting sekitar abad ke-3\r\nM.</p>', '<p>ditemukannya naskah tua bahasa Melayu dan bukti peninggalan bersejarah.</p>', '<p>catatan Ibnu Batuta.</p>', '<p>ditemukannya catatan dan cerita tentang kerajaan Perlak.</p>', '', '', '', '', '', 'C', 1584886084, 1584886084),
(98, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p>Pada tanggal 14 November 1945, pemerintah mengeluarkan maklumat\r\npemerintah yang isinya tentang perubahan pemerintahan ...</p>', '<p>presidensiil menjadi pemerintahan diktator.</p>', '<p>presidensiil menjadi pemerintahan demokrasi parlementer.</p>', '<p>presidensiil menjadi pemerintahan demokrasi liberal</p>', '<p>diktator menjadi pemerintahan demokrasi liberal</p>', '<p>diktator menjadi pemerintahan parlementer</p>', '', '', '', '', '', 'B', 1584886121, 1584886121),
(99, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p>Pelayaran dan perdagangan antar pulau di Nusantara pada abad ke15 - 17 akan\r\nmempercepat proses integrasi bangsa Indonesia karena ...</p>', '<p>mampu melahirkan dan mengembangkan kehidupan maritim bagi bangsa\r\nIndonesia.</p>', '<p>masing-masing kerajaan yang ada, membuka perwakilan dagangnya di\r\nkerajaan lain.</p>', '<p>mewujudkan kebersamaan bagi kehidupan para pedagang dari berbagai\r\nsuku.</p>', '<p>berhasil mewujudkan kebersamaan dalam melawan monopoli orang lain.</p>', '<p>pelayaran dan perdagangan dilaksanakan oleh para pedagang Islam.</p>', '', '', '', '', '', 'C', 1584886189, 1584886189),
(100, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p>Faktor utama pendorong lahirnya pergerakan nasional Indonesia adalah ...</p>', '<p>pengaruh kemenangan Rusia terhadap Jepang tahun 1904-1905</p>', '<p>peranan kaum bangsawan yang memperjuangkan kepentingan rakyat.</p>', '<p>kondisi politik, ekonomi, dan sosial budaya yang diskriminatif pada masa\r\nBelanda.</p>', '<p>adanya pembelaan untuk memperbaiki nasib bangsa oleh Multatuli.</p>', '<p>angin kebebasan melalui politik pintu terbuka.</p>', '', '', '', '', '', 'C', 1584886223, 1584886223),
(101, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p>Seorang tokoh yang menggulirkan program perestroika untuk meningkatkan\r\nperekonomian Uni Sovyet adalah...</p>', '<p>Lenin</p>', '<p>Stalin</p>', '<p>Mikhail Gorbachev</p>', '<p>Leonid Breznev</p>', '<p>Konstantin Chernenko</p>', '', '', '', '', '', 'C', 1584886260, 1584886260),
(102, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p>Setelah Perang Dunia Iberakhir, perasaan anti kolonialisme dan imperialisme\r\nsemakin kuat dikalangan rakyat Indonesia. Hal ini menyebabkan terjadinya\r\nperubahan taktik pergerakan nasional Indonesia, yaitu...</p>', '<p>bercorak kooperatif.</p>', '<p>lebih bersikap moderat.</p>', '<p>bersikap netral untuk mendapatkan simpati dari negara-negara lain.</p>', '<p>bersikap radikal dengan taktik nonkooperasi.</p>', '<p>partai-partai mulai bekerjasama dengan pemerintah Belanda untuk\r\nmemperjuangkan kepentingan rakyat.</p>', '', '', '', '', '', 'D', 1584886292, 1584886292),
(103, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p>Latar belakang diterapkannya Tanam Paksa di Indonesia oleh Van De Bosch\r\nterutama adalah untuk.....</p>', '<p>menghentikan krisis ekonomi.</p>', '<p>mengenalkan jenis tanaman baru.</p>', '<p>meningkatkan hasil pertanian.</p>', '<p>mengisi khas negara yang kosong.</p>', '<p>meningkatkan perdagangan</p>', '', '', '', '', '', 'D', 1584886322, 1584886322),
(104, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p>Masa penjajahan Jepang merupakan puncak dari penderitan rakyat Indonesia\r\nsebagai bangsa yang dijajah. Namun, secara nasionalisme menimbulkan ikatan\r\npersaudaraan yang cukup kuat. Hal ini disebabkan oleh....</p>', '<p>para pemuda Indonesia diberi pelatihan militer untuk mempertahankan\r\nIndonesia.</p>', '<p>penderitaan rakyat akibat romusha.</p>', '<p>kehidupan rakyat yang semakin maju.</p>', '<p>partai-partai yang ada bersedia bekerjasama dengan pemerintah Jepang</p>', '<p>penggunaan bahasa Indonesia sebagai bahasa resmi.</p>', '', '', '', '', '', 'E', 1584886421, 1584886421),
(105, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p>Dalam bersahabat, sebaiknya kita bersikap luwes. Kata luwes pada kalimat\r\ntersebut mempunyai makna ...</p>', '<p>berpandangan luas</p>', '<p>mudah menyesuaikan diri</p>', '<p>mudah memaklumi</p>', '<p>berpegang pada prinsip pribadi</p>', '<p>Tidak mudah terpengaruh</p>', '', '', '', '', '', 'B', 1584886466, 1584886466),
(106, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p>Kalimat majemuk campuran dengan anak kalimat sebagai keterangan tempat\r\nterdapat pada ...</p>', '<p>Gambar itu berbingkai kayu ramin yang berasal dari Kalimantan.</p>', '<p>Adik menyirami bunga di halaman dan ayah membenahi meja di rumah yang\r\nsedang diperbaiki oleh seorang tukang kayu itu.</p>', '<p>Wawan mengerjakan PR dan ibu memasak sayur ketika ayah membersihkan\r\nsepeda.</p>', '<p>Walaupun uangnya tidak banyak, adikku menginginkan sepeda dan sepatu\r\nyang bagus.</p>', '<p>Teman saya yang sampai sekarang belum pernah datang ke rumah bertanyatanya\r\nalamat saya kepada orang lain yang ditemuinya di jalan.</p>', '', '', '', '', '', 'B', 1584886548, 1584886548),
(107, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p>Di antara kalimat-kalimat di bawah ini yang berupa kalimat pasif adalah</p>', '<p>Bolot menghibur pemirsa televisi dengan cara melawak.</p>', '<p>Anton kirimkan surat itu ke Jakarta.</p>', '<p>Setelah membangun jalan tembus, Yogyakarta berusaha membangun\r\njembatan layang.</p>', '<p>Ayah saya berdagang sapi di pasar.</p>', '<p>Ketika bus itu dikemudikan sopir dengan kecepatan tinggi, banyak\r\npenumpang berteriak histeris.</p>', '', '', '', '', '', 'B', 1584886626, 1584886626),
(108, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p><u></u>Penggunaan kata ulang secara tepat menurut norma bahasa Indonesia\r\nterdapat pada ...</p>', '<p>Sebelum membuat topi, ibu mengukur-ukur kepala adik agar hasilnya tidak\r\nkekecilan ataupun kebesaran.</p>', '<p>Andi mengikat-ngikatkan tali itu pada pohon agar dombanya tidak pergi jauh.</p>', '<p>Pada musim dingin ini kakek selalu terbatuk-batuk.</p>', '<p>Para tamu itu saling bersalam-salaman di halaman.</p>', '<p>Semua baju-baju yang sudah dicuci langsung diseterika adik.</p>', '', '', '', '', '', 'A', 1584886655, 1584886655),
(109, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p>Berapa kali U U D 1945 di-amandemen ... </p>', '<p>1 Kali</p>', '<p>2 kali</p>', '<p>3 Kali</p>', '<p>4 Kali</p>', '<p>5 Kali</p>', '', '', '', '', '', 'D', 1584886811, 1584886811),
(110, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p>Pasal berapa saja UUD 1945 pertama kali di-amandemen ... </p>', '<p>Pasal 5, 7, 9, 13, 14, 15, 17, 20 dan 21. </p>', '<p>Pasal 5, 7, 9, 13, 14, 15, 17, 20 dan 22. </p>', '<p>Pasal 5, 7, 9, 13, 14, 15, 17, 20 dan 23. </p>', '<p>Pasal 5, 7, 9, 13, 14, 15, 17, 20 dan 24. </p>', '<p>Pasal 5, 7, 9, 13, 14, 15, 18, 20 dan 24. </p>', '', '', '', '', '', 'A', 1584886849, 1584886849),
(111, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p>Macam dan harga mata uang ditetapkan dalam UUD 1945 pasal. .. </p>', '<p>23A</p>', '<p>23B</p>', '<p>23C</p>', '<p>23D</p>', '<p>24</p>', '', '', '', '', '', 'B', 1584886897, 1584886897),
(112, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p>Setiap warga negara berhak mendapat pendidikan. Hal ini tercantum dalam UUD 1945 pasal. .. </p>', '<p>31 ayat 1 </p>', '<p>31 ayat 2</p>', '<p>31 ayat 3</p>', '<p>31 ayat 4</p>', '<p>31 ayat 5</p>', '', '', '', '', '', 'A', 1584886934, 1584886934),
(113, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p>Berkenaan dengan perubahan isi dari UUD 1945, sebenarnya telah diatur oleh TAP MPR No. IV/MPR/1983 tentang ... </p>', '<p>lnterpelasi </p>', '<p>Budget </p>', '<p>Mosi tidak percaya </p>', '<p>Referendum </p>', '<p>Audikatif</p>', '', '', '', '', '', 'D', 1584886987, 1584886987),
(114, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p>Siapa yang berwenang memberi grasi dan rahabilitasi .... </p>', '<p>Presiden </p>', '<p>DPR </p>', '<p>MPR </p>', '<p>DPD</p>', '<p>Semua jawaban benar </p>', '', '', '', '', '', 'A', 1584887023, 1584887023),
(115, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p>Dalam kehidupan bernegara, Pancasila berperan sebagai... </p>', '<p>Dasar negara </p>', '<p>Dasar kenegaraan </p>', '<p>Dasar beragama </p>', '<p>Dasar ketatanegaraan </p>', '<p>Dasar kedaulatan</p>', '', '', '', '', '', 'A', 1584887086, 1584887086),
(116, 8, 3, 1, 0, 0, 0, 0, 0, '', '', '<p>Berkenaan dengan Pancasila sebagai falsafah bangsa Indonesia, maka terdapat beberapa teori di Negara lain yang dapat menjelaskan perbedaan yang mencolok terhadap ideologi suatu Negara. Falsafah Negara-negara Eropa Barat dan Amerika cenderung menganut paham individualistic yang dikemukakan oleh ... </p>', '<p>Thomas Hobbes </p>', '<p>Marx </p>', '<p>Spinoza </p>', '<p>Karl</p>', '<p>Semua jawaban salah </p>', '', '', '', '', '', 'A', 1584887173, 1584887173),
(117, 9, 4, 1, 0, 0, 0, 0, 0, '', '', '<p>Rabat = </p>', '<p>Tambahan gaji</p>', '<p>Potongan harga</p>', '<p>Keutungan</p>', '<p>Pembayaran kembali</p>', '<p>Jera mengulangi</p>', '', '', '', '', '', 'B', 1584887278, 1584887278),
(118, 9, 4, 1, 0, 0, 0, 0, 0, '', '', '<p>DIKOTOMI = </p>', '<p>Kepala dua</p>', '<p>Biji dua</p>', '<p>Dibagi dua</p>', '<p>Dibagi rata</p>', '<p>Berkaki dua</p>', '', '', '', '', '', 'C', 1584887309, 1584887309),
(119, 9, 4, 1, 0, 0, 0, 0, 0, '', '', '<p>ASUMSI = </p>', '<p>Tuduhan</p>', '<p>Perkiraan</p>', '<p>Kesimpulan</p>', '<p>Nilai</p>', '<p>Persamaan</p>', '', '', '', '', '', 'B', 1584887344, 1584887344),
(120, 9, 4, 1, 0, 0, 0, 0, 0, '', '', '<p>Pemugaran = </p>', '<p>Pemeliharaan</p>', '<p>Pengusiran</p>', '<p>Pembongkaran</p>', '<p>Perbaikan</p>', '<p>Penghancuran</p>', '', '', '', '', '', 'D', 1584887371, 1584887371),
(121, 9, 4, 1, 0, 0, 0, 0, 0, '', '', '<p>Sekuler >&lt; </p>', '<p>Ilmiah</p>', '<p>Duniawi</p>', '<p>Modern</p>', '<p>Keagamaan</p>', '<p>Tradisionil</p>', '', '', '', '', '', 'D', 1584887408, 1584887408),
(122, 9, 4, 1, 0, 0, 0, 0, 0, '', '', '<p>Mandiri >&lt;</p>', '<p>Intimasi</p>', '<p>Interaksi</p>', '<p>Korelasi</p>', '<p>Dependen</p>', '<p>Invalid</p>', '', '', '', '', '', 'D', 1584887449, 1584887481),
(123, 9, 4, 1, 0, 0, 0, 0, 0, '', '', '<p>Epilog >&lt;</p>', '<p>Dialog</p>', '<p>Hipolog</p>', '<p>Monolog</p>', '<p>Analog</p>', '<p>Prolog</p>', '', '', '', '', '', 'E', 1584887472, 1584887472),
(124, 9, 4, 1, 0, 0, 0, 0, 0, '', '', '<p>Sporadis >&lt;</p>', '<p>Jarang</p>', '<p>Kadang-kadang</p>', '<p>Sering</p>', '<p>Laten</p>', '<p>Berhenti</p>', '', '', '', '', '', 'C', 1584887508, 1584887508),
(125, 9, 4, 1, 0, 0, 0, 0, 0, '', '', '<p>Elang = Nuri</p>', '<p>Kucing = Merpati</p>', '<p>Hiu = Koki</p>', '<p>Paus = Singa</p>', '<p>Kera = Buaya</p>', '<p>Merpati = Belalang</p>', '', '', '', '', '', 'B', 1584887543, 1584887543),
(126, 9, 4, 1, 0, 0, 0, 0, 0, '', '', '<p>Desa = Ladang</p>', '<p>Tulisan = Pensil</p>', '<p>Padi = Sawah</p>', '<p>Perumahan = Kota</p>', '<p>Hutan = Pohon</p>', '<p>Resep = Juru Masak</p>', '', '', '', '', '', 'D', 1584887587, 1584887587),
(127, 9, 4, 1, 0, 0, 0, 0, 0, '', '', '<p>Pegawai = Bekerja</p>', '<p>Psikologi = Psikolog</p>', '<p>Meneliti = Ilmuwan</p>', '<p>Guru = Siswa</p>', '<p>Pelajar = Belajar</p>', '<p>Bekerja = Karyawan</p>', '', '', '', '', '', 'D', 1584887639, 1584887639),
(128, 9, 4, 1, 0, 0, 0, 0, 0, '', '', '<p>Delman = Kusir</p>', '<p>Motor = Nelayan</p>', '<p>Mobil = Supir</p>', '<p>Kapal = Masinis</p>', '<p>Pilot = Helicopter</p>', '<p>Copilot = Pesawat</p>', '', '', '', '', '', 'B', 1584887667, 1584887667),
(129, 9, 4, 1, 0, 0, 0, 0, 0, '', '', '<p>3,10,15,26,35, ….., …..</p>', '<p>50 dan 63</p>', '<p>50 dan 65</p>', '<p>45 dan 60</p>', '<p>55 dan 75</p>', '<p>56 dan 75</p>', '', '', '', '', '', 'A', 1584887750, 1584887750),
(130, 9, 4, 1, 0, 0, 0, 0, 0, '', '', '<p>EZ, FZ, …,…… IZ, JZ, KZ.</p>', '<p>LZ dan HZ</p>', '<p>KZ dan HZ</p>', '<p>GZ dan lZ</p>', '<p>GZ dan HZ</p>', '<p>JZ dan PZ</p>', '', '', '', '', '', 'D', 1584887779, 1584887779),
(131, 9, 4, 1, 0, 0, 0, 0, 0, '', '', '<p>ACEGI, ZXVTR, BDFHJ, ……</p>', '<p>XWVUT</p>', '<p>XVTRP</p>', '<p>WUSQU</p>', '<p>YWUSQ</p>', '<p>UVWXY</p>', '', '', '', '', '', 'D', 1584887802, 1584887802),
(132, 9, 4, 1, 0, 0, 0, 0, 0, '', '', '<p>22, 36,52,70,...., ……</p>', '<p>90 dan 112</p>', '<p>80 dan 113</p>', '<p>81 dan 114</p>', '<p>100 dan 112</p>', '<p>100 dan 114</p>', '', '', '', '', '', 'A', 1584887830, 1584887830),
(133, 9, 4, 1, 0, 0, 0, 0, 0, '', '', '<p>3,7,13,21, …, ….</p>', '<p>49 dan 56</p>', '<p>63 dan 70</p>', '<p>31 dan 43</p>', '<p>31 dan 49</p>', '<p>77 dan 114</p>', '', '', '', '', '', 'C', 1584887936, 1584887936),
(134, 9, 4, 1, 0, 0, 0, 0, 0, '', '', '<p>Tabungan Anis lebih banyak daripada jumlah tabungan Benny dan Kinar. Tabungan Benny\r\nlebih banyak daripada tabungan Kinar. Tabungan Dian\r\ntabungan Anis, Benny, dan Kinar.</p>', '<p>Tabungan Anis lebih banyak daripada tabungan Dian.</p>', '<p>Jumlah tabungan Dian dan Kinar sama dengan jumlah tabungan Anis dan Benny.</p>', '<p>Tabungan Dian merupakan penjumlahan tabungan Anis, Benny, dan Kinar</p>', '<p>Yang mempunyai tabungan paling banyak adalah Anis.</p>', '<p>Kinar mempunyai tabungan paling sedikit.</p>', '', '', '', '', '', 'E', 1584887994, 1584887994),
(135, 9, 4, 1, 0, 0, 0, 0, 0, '', '', '<p>Pengurus koperasi seharusnya berjiwa sosial. Sebagian ketua RT pernah menjadi pengurus\r\nkoperasi.</p>', '<p>Ketua RT itu selalu berjiwa sosial.</p>', '<p>Semua orang yang pernah menjadi ketua RT adalah pengurus koperasi.</p>', '<p>Sebagian pengurus koperasi ingin menjadi ketua RT.</p>', '<p>Semua pengurus koperasi berjiwa sosial.</p>', '<p>Sebagian ketua RT seharusnya berjiwa sosial.</p>', '', '', '', '', '', 'E', 1584888074, 1584888074),
(136, 9, 4, 1, 0, 0, 0, 0, 0, '', '', '<p>Semua bayi minum ASI. Sebagian bayi diberi makanan tambahan.</p>', '<p>Semua bayi minum ASI dan diberi makanan tambahan.</p>', '<p>Bayi yang minum ASI biasanya diberi makanan tambahan.</p>', '<p>Sebagian bayi minum ASI dan diberi makanan tambahan.</p>', '<p>Bayi yang diberi makanan tambahan harus minum ASI.</p>', '<p>Semua bayi minum ASI, dan tidak diberi makanan tambahan.</p>', '', '', '', '', '', 'C', 1584888101, 1584888101),
(137, 9, 4, 1, 0, 0, 0, 0, 0, '', '', '<p>Keluarga Saipul mempunyai 5 orang anak. Zani lahir sebelum Wana. Wana lahir\r\nYan, tetapi sebelum Alex. Yan lahir sesudah Zani. Vira lahir sesudah Alex.</p>', '<p>Wana lebih tua daripada Yan</p>', '<p>Yan lebih muda daripada Alex</p>', '<p>Vira paling tua</p>', '<p>Zani paling tua</p>', '<p>Yan paling tua</p>', '', '', '', '', '', 'D', 1584888127, 1584888135),
(138, 9, 4, 1, 0, 0, 0, 0, 0, '', '', '<p>Data usia beberapa siswa sebuah sekolah adalah sebagai berikut K lebih tua daripada W\r\ndan O lebih muda daripada M\r\nJika O lebih muda daripada W, manakah yang berikut ini tidak bisa benar?</p>', '<p>K lebih muda daripada O</p>', '<p>M lebih muda daripada W</p>', '<p>M lebih muda daripada K</p>', '<p>W lebih muda daripada M</p>', '<p>W lebih tua daripada M</p>', '', '', '', '', '', 'A', 1584888170, 1584888170),
(139, 9, 4, 1, 0, 0, 0, 0, 0, '', '', '<p>Natsir mendapat nilai 81 untuk Makro Ekonomi, 89 untuk Mikro Ekonomi, 78 untuk\r\nEkonomi Pembangunan, dan 86 untuk Matematika Ekonomi. Bila Natsir ingin\r\nmendapatkan rata-rata nilainya sebesar 84, maka berapakah nilai yang harus\r\ndiperoleh untuk pelajaran Pengantar Ekonomi?</p>', '<p>88</p>', '<p>85</p>', '<p>86</p>', '<p>84</p>', '<p>90</p>', '', '', '', '', '', 'C', 1584888218, 1584888218),
(140, 9, 4, 1, 0, 0, 0, 0, 0, '', '', '<p>Bela membeli baju dengan harga diskon 15?ri Rp80.000,00. Karena ia sedang\r\nberulang tahun, ia mendapat diskon tambahan sebesar 25?ri harga awal setelah\r\ndikurangi diskon 15% di awal. Berapakah harga yang harus di\r\nkasir?</p>', '<p>p48.000,00.</p>', '<p>Rp51.000,00.</p>', '<p>Rp50.000,00.</p>', '<p>Rp55.000,00.</p>', '<p>Rp41.000,00.</p>', '', '', '', '', '', 'B', 1584888254, 1584888254),
(141, 9, 4, 1, 0, 0, 0, 0, 0, '', '', '<p>Didik adalah seorang tukang cat kerajinan papan catur. Dalam 5\r\nmengecat 25?ri papan berwarna hitam. Berapa lamakah ia mengecat sampai\r\nselesai keseluruhan papan catur? (Keterangan: sebuah papan catur terdiri atas 64\r\nkotak)</p>', '<p>20 menit.</p>', '<p>40 menit.</p>', '<p>50 menit.</p>', '<p>80 menit.</p>', '<p>30 menit.</p>', '', '', '', '', '', 'B', 1584888290, 1584888290),
(142, 9, 4, 1, 0, 0, 0, 0, 0, '', '', '<p>Kakak beradik bernama Nia, Nanik. dan Noeng. Nanik 9 tahun lebih tua dari Nia.\r\nNur 2 tahun lebih tua dari Nanik. Apabila usia mereka dijumlah, akan mendapatkan\r\nangka 95. Berapakah usia Nia sekarang?</p>', '<p>26.</p>', '<p>35.</p>', '<p>15.</p>', '<p>24.</p>', '<p>25.</p>', '', '', '', '', '', 'E', 1584888321, 1584888321),
(143, 9, 4, 1, 0, 0, 0, 0, 0, '', '', '<p>2a + b = 10, b = 4 <br><br>maka nilai a adalah...</p>', '<p>5</p>', '<p>4</p>', '<p>3</p>', '<p>2</p>', '<p>1</p>', '', '', '', '', '', 'C', 1584888728, 1584888728),
(144, 9, 4, 1, 0, 0, 0, 0, 0, '', '', '<p>2 + 5 + 10 x 5 = </p>', '<p>57</p>', '<p>85</p>', '<p>77</p>', '<p>10</p>', '<p>5</p>', '', '', '', '', '', 'A', 1584888815, 1584888815),
(145, 9, 4, 1, 0, 0, 0, 0, 0, '', '', '<p>Empat orang membangun jembatan untuk sungai dan selesai dalam 15 hari. Jika jembatan ingin diselesaikan dalam 6 hari, maka berapa orang yang diperlukan untuk menyelesaikannya? </p>', '<p>12 orang</p>', '<p>10 orang</p>', '<p>8 orang</p>', '<p>6 orang</p>', '<p>4 orang</p>', '', '', '', '', '', 'B', 1584888879, 1584888879),
(146, 9, 4, 1, 0, 0, 0, 0, 0, '', '', '<p>Jika x = berat total p kotak yang masing-masing beratnya q kg. Jika y = berat total q kotak yang masing-masing beratnya p kg, maka…. </p>', '<p>x > y </p>', '<p>x < y>', '<p>x = y </p>', '<p>2x = 2y </p>', '<p> X dan yang tidak dapat ditentukan </p>', '', '', '', '', '', 'C', 1584888924, 1584888924),
(147, 10, 5, 1, 2, 4, 1, 5, 3, '', '', '<p>Kinerja organisasi berjalan cukup efisien, namun pimpinan terkesan mengontrol situasi dengan sangat ketat. Sikap saya adalah … </p>', '<p>Tidak bertindak apapun, cukup dengan mengikuti jalannya arus </p>', '<p>Mengusahakan keterlibatan pegawai dalam pengambilan keputusan </p>', '<p>Mengabaikan saja </p>', '<p>Melakukan apa saja yang dapat dikerjakan utuk membuat pegawai merasa penting dan dilibatkan. </p>', '<p>Mengingatkan pentingnya batas waktu dan tugas kepada atasan. </p>', '', '', '', '', '', 'D', 1584942807, 1584942807);
INSERT INTO `tb_soal` (`id_soal`, `dosen_id`, `matkul_id`, `bobot`, `poin_a`, `poin_b`, `poin_c`, `poin_d`, `poin_e`, `file`, `tipe_file`, `soal`, `opsi_a`, `opsi_b`, `opsi_c`, `opsi_d`, `opsi_e`, `file_a`, `file_b`, `file_c`, `file_d`, `file_e`, `jawaban`, `created_on`, `updated_on`) VALUES
(148, 10, 5, 1, 1, 5, 4, 3, 2, '', '', '<p>Saya mengajukan suatu usulan untuk atasan saya namun usulan tersebut menurut atasan saya kurang tepat. Sikap saya adalah . </p>', '<p>Merasa sangat kecewa </p>', '<p>Mencoba mencari alternatif usulan lain yang lebih tepat untuk diajukan lagi </p>', '<p>Merasa kecewa tetapi berusaha melupakan penolakan tersebut </p>', '<p>Bersikeras memberikan alasan dan pembenaran atas usulan tersebut sampai dapat meyakinkan atasan saya </p>', '<p>Membiarkan saja </p>', '', '', '', '', '', 'B', 1584942937, 1584942937),
(149, 10, 5, 1, 5, 2, 1, 3, 4, '', '', '<p>Saya ditugaskan di front office untuk melayani tamu pimpinan. Pada saat pimpinan saya tidak berada di tempat dan ada tamu pimpinan yang memerlukan keputusan segera, sedangkan atasan tidak dapat dihubungi, maka sikap saya adalah …. </p>', '<p>Mengambil keputusan meskipun tanpa petunjuk atasan selama tidak bertentangan dengan kebijakan umum pimpinan </p>', '<p>Tidak berani mengambil keputusan tanpa petunjuk atasan saya </p>', '<p>Ragu ragu dalam mengambil keputusan tanpa petunjuk atasan saya </p>', '<p>Menunda nunda pengambilan keputusan tanpa petunjuk atasan saya </p>', '<p>Mengambil keputusan tanpa petunjuk atasan karena keadaan sangat mendesak </p>', '', '', '', '', '', 'A', 1584943032, 1584943032),
(150, 10, 5, 1, 5, 1, 2, 4, 3, '', '', '<p>Pimpinan kantor menggelar rapat kerja membahas penyusunan rencana kerja untuk tahun anggaran depan. Setiap pegawai diharapkan mempersiapkan usulan untuk kegiatan tahun depan. Respon saya… </p>', '<p>Berminat mengajukan suatu ide kegiatan yang akan dilaksanakan meskipun nantinya ide tersebut tidak diterima </p>', '<p>Tidak berminat sama sekali untuk mengajukan suatu ide kegiatan </p>', '<p>Akan mengajukan suatu ide kegiatan jika diminta oleh pimpinan </p>', '<p>Mungkin berminat untuk mengajukan suatu ide kegiatan yang akan dilaksanakan tergantung situasi dan kondisi </p>', '<p>Ragu ragu untuk mengajukan suatu ide kegiatan karena akan kecewa jika tidak diterima </p>', '', '', '', '', '', 'A', 1584943074, 1584943074),
(151, 10, 5, 1, 1, 2, 4, 5, 3, '', '', '<p>Hari ini rekan kerja di kantor Anda ayahnya sakit keras dan rekan anda tak punya biaya untuk membawanya ke Rumah Sakit. </p>', '<p> Saya menasehatinya untuk lain kali mencari fasilitas Jamkesmas </p>', '<p>Saya menganjurkannya untuk mengikuti asuransi kesehatan </p>', '<p>Saya memberinya bantuan semampu saya </p>', '<p>Saya mengkoordinir rekan-rekan lain untuk turut membantu </p>', '<p>Saya melaporkan kepada atasan tentang hal ini </p>', '', '', '', '', '', 'D', 1584943122, 1584943122),
(152, 10, 5, 1, 1, 3, 5, 4, 2, '', '', '<p>Ayah sahabat anda mengalami serangan jantung dan masuk Rumah Sakit. </p>', '<p>Saya percaya dokter RS mampu menangani dengan baik </p>', '<p>Saya akan menjenguknya ketika ada waktu yang benar-benar longgar </p>', '<p>Saya akan menjenguknya </p>', '<p>Saya menanyakan apakah kondisinya memang parah </p>', '<p>Saya berharap semoga lekas sembuh </p>', '', '', '', '', '', 'C', 1584943164, 1584943164),
(153, 10, 5, 1, 3, 5, 4, 1, 2, '', '', '<p>Seorang kawan di kantor sering meminta untuk diajari hal-hal seputar pekerjaan yang belum diketahuinya, maka saya.. </p>', '<p>Mengajarinya cukup sekali saja </p>', '<p>Mengajari dan menyarankannya membaca buku yang dapat membantu peningkatan professional perkerjaan. </p>', '<p>Mengajari kalau memang saya memiliki waktu yang sangat longgar </p>', '<p>Memintanya agar belajar mandiri </p>', '<p>Memintanya dengan tegas agar belajar sendiri, karena itulah inti tanggungjawab </p>', '', '', '', '', '', 'B', 1584943217, 1584943217),
(154, 10, 5, 1, 5, 3, 4, 2, 1, '', '', '<p>Jika saya bepergian dengan bis kota, </p>', '<p>Saya selalu mengajak bicara orang yang duduk di samping saya </p>', '<p>Saya takut mengajak bicara orang yang duduk di samping saya </p>', '<p>Saya ingin orang yang duduk di samping saya mengajak saya bicara </p>', '<p> Saya diam saja </p>', '<p>Saya tak mau mengajak bicara karena itu bukan urusan saya </p>', '', '', '', '', '', 'A', 1584943263, 1584943263),
(155, 10, 5, 1, 4, 5, 3, 2, 1, '', '', '<p>Saya dipercayakan mengelola kegiatan yang belum dipublikasikan dan masih harus dijaga keharasiaannya. Ketika saya berada di antara teman teman dekat dikantor, saya… </p>', '<p>Suka menerima masukan demi masukan dalam rangka pengembangan tugas baru saya </p>', '<p>Tetap menjaga kerahasiaan meskipun teman-teman mendesak bertanya </p>', '<p>Hanya menceritakan sebagian kecil saja demi pertemanan </p>', '<p> Akan merasa gelisah dan kurang senang bila mereka mulai membicarakan tugas baru saya </p>', '<p>Akan marah jika ditanya tentang tugas baru </p>', '', '', '', '', '', 'B', 1584943326, 1584943326),
(156, 10, 5, 1, 4, 5, 1, 2, 3, '', '', '<p>Ketika saudara dekat saya meminta bantuan saya untuk melakukan sesuatu yang cenderung melanggar hukum, maka tindakan saya : </p>', '<p>enolak dengan keras </p>', '<p>Menolak dan menjelaskan alasannya </p>', '<p>Melakukannya untuk yang pertama dan terakhir kalinya </p>', '<p> Karena dia saudara dekat saya, maka saya melakukannya kali ini saja </p>', '<p>Mempertimbangkan risikonya baru melakukannya kalau memungkinkan saya </p>', '', '', '', '', '', 'B', 1584943380, 1584943380),
(157, 10, 5, 1, 4, 3, 2, 5, 1, '', '', '<p>Jika rekan kerja saya berlaku tidak fair dalam rangka berkompetisi untuk kenaikan pangkat, maka saya…. </p>', '<p>Menegurnya </p>', '<p>Tidak menegurnya karena khawatir salah faham </p>', '<p>Diam-diam melaporkan kepada atasan sehingga saya berpeluang menangkompetisi </p>', '<p>Menegurnya, dan kalau dia tidak bersedia memperbaiki maka saya laporkan pada atasan </p>', '<p>Mendiamkannya </p>', '', '', '', '', '', 'D', 1584943429, 1584943429),
(158, 10, 5, 1, 5, 2, 3, 1, 4, '', '', '<p>Draft laporan yang dibuat oleh tim kerja saya ditolak oleh atasan karena dianggap kurang layak. Sikap saya adalah … </p>', '<p>Segera melakukan perbaikan draft laporan tersebut dan mengajukan kembali </p>', '<p>Menyalahkan rekan sejawat yang sama sama mengerjakannya </p>', '<p> Menerima penolakan tetapi tidak melakukan tindak lanjut  </p>', '<p>Berusaha mencari alasan seperti sedikitnya waktu untuk mengerjakannya </p>', '<p>Menerima penolakan tersebut dan berusaha memperbaiki seadanya. </p>', '', '', '', '', '', 'A', 1584946233, 1584946233),
(159, 10, 5, 1, 4, 3, 5, 1, 2, '', '', '<p>Dalam suatu kelompok kerja, biasanya anggota kelompok terdiri dari berbagai latar belakang budaya, dan saya merasa… </p>', '<p>Sebagian orang menerima saya jika saya dapat mengikuti aturan dalam kelompok. </p>', '<p>Perlu berhati-hati akan apa yang bisa saya katakan atau saya perbuat didalam kelompok kerja. </p>', '<p>Benar-benar aman menjadi diri sendiri, dan saya tidak pernah berkonflik dengan anggota kerja yang lain. </p>', '<p>Tidak pernah menjadi diri sendiri dalam kelompok kerja. </p>', '<p>Tidak cukup berani untuk menjadi diri sendiri dalam kelompok kerja. </p>', '', '', '', '', '', 'C', 1584946282, 1584946282),
(160, 10, 5, 1, 3, 5, 2, 1, 4, '', '', '<p>Ketua panitia kegiatan harus membuat laporan pertanngungjawaban. Sebagai ketua, maka </p>', '<p>Saya menugaskan pembuatan laporan kepada anak buah </p>', '<p>Saya bersama anak buah menyusun laporan </p>', '<p>Saya sendiri yang menyusun laporan sebab tak ingin ada kesalahan yang dibuat oleh anak buah </p>', '<p>Laporan harus dibuat oleh sekretaris </p>', '<p>Tim khusus harus dibentuk untuk membuat laporan tersebut tanpa melibatkan saya sebagai ketua panitia. </p>', '', '', '', '', '', 'B', 1584946339, 1584946339),
(161, 10, 5, 1, 1, 3, 4, 2, 5, '', '', '<p>Jika dalam suatu rapat, rekan kantor memiliki pendapat yang berbeda, padahal Anda lah yang menjadi pemimpin rapat, maka : </p>', '<p>Saya teguh mempertahankan pendapat saya </p>', '<p>Beda pendapat bukanlah masalah serius </p>', '<p>Saya pertimbangkan pendapat tersebut </p>', '<p>Melihat dulu siapa dia </p>', '<p>Menanyakan sebab dan alasan pendapatnya tersebut dan mempertimbangkannya jika memang pendapatnya itu ide yang baik. </p>', '', '', '', '', '', 'E', 1584946394, 1584946394),
(162, 10, 5, 1, 4, 1, 3, 5, 2, '', '', '<p>Dalam rapat staf dan pimpinan, pendapat saya dikritik keras oleh peserta rapat lainnya. Respon saya adalah … </p>', '<p>Mencoba sekuat tenaga mempertahankan pendapat saya </p>', '<p>Menyerang semua peserta yang mengeritik pendapat saya </p>', '<p>Mencoba mempelajari kritikan tersebut dan berbalik mengkritik dengan tajam </p>', '<p>Menerima kritikan tersebut sebagai masukan </p>', '<p>Diam saja </p>', '', '', '', '', '', 'D', 1584946434, 1584946434),
(163, 10, 5, 1, 2, 1, 4, 5, 3, '', '', '<p>Jika bawahan saya melakukan tugasnya dengan sangat baik, maka saya </p>', '<p>Puas, namun tak perlu memuji karena hal itu akan membuatnya sombong </p>', '<p>Tak pernah memuji </p>', '<p>Memuji setinggi-tingginya agar dia senang dan bersemangat </p>', '<p>Memuji secara proporsional </p>', '<p>Terkadang memuji </p>', '', '', '', '', '', 'D', 1584946504, 1584946504),
(164, 10, 5, 1, 5, 4, 3, 2, 1, '', '', '<p> Dalam setiap pekerjaan pasti memiliki job description masing-masing, dan saya telah melakukan sesuai dengan job description tersebut. Kinerja saya adalah…. </p>', '<p> Ditengah-tengah kesibukan pekerjaan, saya tetap mau membantu teman menyelesaikan pekerjaannya yang tertunda </p>', '<p>Saya akan membantu kawan saya yang lain jika diminta. </p>', '<p>Saya mau mempelajari hal lain diluar deskripsi jabatan saya. </p>', '<p>Saya hanya akan melakukan pekerjaan diluar deskripsi jabatan jika diminta oleh atasan. </p>', '<p>Enggan berkontribusi lebih dari apa yang telah dikerjakan saat ini. </p>', '', '', '', '', '', 'A', 1584946580, 1584946580),
(165, 10, 5, 1, 5, 3, 4, 1, 2, '', '', '<p>Saya diutus untuk menghadiri seminar menggantikan atasan saya. Pada saat yang bersamaan saya sedang mengerjakan laporan yang tidak terlalu mendesak. Sikap saya adalah…. </p>', '<p>Saya akan selesaikan terlebih dahulu laporan tersebut, sebab bisa saja diminta oleh atasan sewaktu-waktu. </p>', '<p>Laporan tersebut akan menjadi merepotkan kalau tertunda.  </p>', '<p>Saya akan menghadiri seminar tersebut agar dapat menghindar dari tugas laporan. </p>', '<p>Saya akan menghadiri seminar tersebut karena laporan belum harus segera diserahkan kepada atasan. </p>', '<p>Saya bisa menghadiri seminar dan mengerjakan laporannya nanti saja. </p>', '', '', '', '', '', 'A', 1584946621, 1584946621),
(166, 10, 5, 1, 2, 3, 5, 2, 4, '', '', '<p>Bila ada rekan kerja yang salah memanggil nama saya, apa yang akan saya lakukan… </p>', '<p>Saya sedikit tersinggung, karena nama adalah kehormatan seseorang </p>', '<p>Saya tak boleh tersinggung </p>', '<p>Saya mengingatkannya dengan baik-baik </p>', '<p>Saya mengingatkannya dengan keras agar tidak diulang </p>', '<p>Itu tidak menjadi masalah </p>', '', '', '', '', '', 'C', 1584946676, 1584946676),
(167, 10, 5, 1, 2, 1, 3, 5, 4, '', '', '<p>Reko kali ini lupa belum mengembalikan bolpoin yang dipinjamnya, yang saya lakukan adalah… </p>', '<p>Saya akan menegurnya dengan keras agar tidak terulang lagi </p>', '<p> Saya membiarkannya terlebih dulu sebab ini yang pertama kalinya dia lupa </p>', '<p>Saya mengikhlaskan bolpoin tersebut, toh harganya murah </p>', '<p>Saya mengingatkannya </p>', '<p>Saya menyindirnya agar ingat kelalaiannya </p>', '', '', '', '', '', 'D', 1584946717, 1584946717),
(168, 10, 5, 1, 2, 4, 3, 1, 5, '', '', '<p>Saya memiliki buku cerita favorit dan buku cerita tersebut dihilangkan oleh teman dekat saya. Reaksi saya adalah….. </p>', '<p>Saya marah pada teman saya </p>', '<p>Saya memintanya untuk mengganti buku cerita tersebut karena buku itu favorit saya. </p>', '<p>Saya sangat menyukai buku cerita tersebut, namun buku cerita itu sudah hilang. </p>', '<p>Saya memusuhinya dan melarangnya meminjam buku cerita saya lagi. </p>', '<p>Saya memintanya untuk mengganti dan mengatakan padanya untuk lebih berhati-hati jika dia meminjam buku cerita saya lagi. </p>', '', '', '', '', '', 'E', 1584946759, 1584946759),
(169, 10, 5, 1, 4, 3, 5, 2, 1, '', '', '<p>Saya sudah berusaha untuk memperbaiki kelemahan diri, tetapi belum juga menampakkan hasilnya. Sehingga saya, …. </p>', '<p>menerimanya dengan terpaksa. </p>', '<p>menerimanya, meski tentu saja dengan sedikit kekecewaan </p>', '<p>menerimanya dengan lapang dada </p>', '<p>membenci diri saya sendiri. </p>', '<p>meratapi diri sendiri. </p>', '', '', '', '', '', 'C', 1584946798, 1584946798),
(170, 10, 5, 1, 3, 2, 5, 1, 4, '', '', '<p>Di lingkungan kerja saya yang baru, yang harus saya lakukan adalah…. </p>', '<p>Saya perlu waktu untuk mengenal rekan-rekan kerja </p>', '<p> Saya menunggu rekan kerja yang ingin berkenalan </p>', '<p>Saya langsung mampu akrab dengan rekan kerja </p>', '<p>Jika saya membutuhkan bantuan baru saya akan berkenalan </p>', '<p>Jika ada yang ingin berkenalan tentunya saya senang sekali </p>', '', '', '', '', '', 'C', 1584946896, 1584946896),
(171, 10, 5, 1, 1, 4, 2, 3, 5, '', '', '<p>Berpindah-pindah pekerjaan adalah hal yang wajar… </p>', '<p>Saya tidak berpendapat bahwa karyawan harus setia terhadap perusahaannya </p>', '<p>Saya meyakini nilai-nilai yang mengatakan bahwa loyalitas terhadap pekerjaan adalah sikap yang terpuji </p>', '<p>Pekerjaan saya saat ini tidak dapat menjamin masa depan saya. </p>', '<p>Saya meyakini bahwa loyalitas itu penting, sehingga saya merasakan pentingnya tanggung jawab moral karyawan. </p>', '<p>Saya menyukai pekerjaan saya, tetapi jika ada pekerjaan yang lebih baik saya tidak ragu untuk pindah </p>', '', '', '', '', '', 'E', 1584946941, 1584946941),
(172, 10, 5, 1, 4, 1, 2, 5, 3, '', '', '<p>Saya baru saja dimutasikan ke unit lain yang sama sekali baru bagi saya. Sikap saya adalah… </p>', '<p>Berusaha memahami mekanisme kerja unit melalui arsip dan aturan kebijakan </p>', '<p>Jarang masuk karena belum jelas apa yang harus dikerjakan </p>', '<p>Duduk duduk saja sambil menunggu perintah atasan  </p>', '<p>Berusaha mempelajari dan memahami mekanisme kerja unit melalui rekan sejawat </p>', '<p> Mengamati proses pekerjaan yang dilakukan rekan sejawat </p>', '', '', '', '', '', 'D', 1584946986, 1584946986),
(173, 10, 5, 1, 3, 1, 2, 4, 5, '', '', '<p>Setiap hari, saya masuk kantor paling cepat dibandingkan pegawai lainnya. Yang saya lakukan setelah tiba adalah … </p>', '<p>Masuk ke ruangan dan membaca koran </p>', '<p>Santai di luar gedung kantor untuk menikmati udara pagi </p>', '<p>Masuk ke ruangan dan mengobrol dengan rekan sejawat </p>', '<p>Masuk ke ruangan dan membuat rencana kerja </p>', '<p>Masuk ke ruangan dan memulai pekerjaan yang tertunda kemarin. </p>', '', '', '', '', '', 'E', 1584947054, 1584947054),
(174, 10, 5, 1, 1, 2, 3, 3, 5, '', '', '<p>Saya diminta untuk lembur kerja sedangkan saya sudah berjanji kepada anak saya untuk mengantarnya ke pesta ulang tahun sahabatnya. Sikap saya…. </p>', '<p>Pulang dengan diam diam, tanpa sepengetahuan pimpinan </p>', '<p>Berpura pura sakit agar dapat diizinkan untuk segera pulang </p>', '<p>Menghubungi anak saya menjelaskan agar naik taksi saja </p>', '<p>Bekerja lembur, karena yakin anak saya pasti memaklumi </p>', '<p>Meminta izin pimpinan mengantar anak saya kemudian kembali ke kantor untuk bekerja lembur </p>', '', '', '', '', '', 'E', 1584947101, 1584947101),
(175, 10, 5, 1, 5, 4, 3, 2, 1, '', '', '<p> Ada pekerjaan yang terbengkalai karena orang yang seharusnya bertanggung jawab pindah kerja, maka saya… </p>', '<p>Langsung mengerjakan pekerjaan tersebut karena jika terbengkalai terlalu lama akan mengganggu proses kerja </p>', '<p>Langsung mengerjakan pekerjaan tersebut, dan baru akan memberitahu atasan setelah pekerjaan tersebut selesai </p>', '<p>Melakukan hanya apa yang dikatakan oleh atasan tidak lebih dan tidak kurang </p>', '<p> Menyarankan orang lain yang menurut saya kompeten untuk mengerjakan pekerjaan tersebut  </p>', '<p>Menyarankan dan merekomendasikan hal-hal yang diperlukan untuk menyelesaikan pekerjaan tersebut, tetapi tidak bertindak sebelum disetujui oleh atasan </p>', '', '', '', '', '', 'A', 1584947143, 1584947143),
(176, 10, 5, 1, 5, 1, 4, 3, 2, '', '', '<p>Atasan anda menetapkan target tugas harus selesai pada deadline tanggal 27 bulan ini, maka </p>', '<p>Saya akan selesaikan tepat pada tanggal 27 </p>', '<p>Kalau tugas lain menumpuk, saya akan minta ijin untuk menyelesaikan barang satu atau dua hari sesudah deadline </p>', '<p>Saya mencoba menyelesaikan tanggal 26 jika memungkinkan </p>', '<p>Saya meminta tolong rekan lain agar tidak terlambat deadline </p>', '<p>Saya menegosiasikan deadline yang ditetapkan atasan tersebut dengan baikbaik agar tidak terlalu memberatkan </p>', '', '', '', '', '', 'A', 1584947200, 1584947200),
(177, 10, 5, 1, 0, 5, 3, 1, 4, '', '', '<p>Bulan depan ada kesempatan untuk ikut kompetisi dalam bidang yang saya senangi, maka saya </p>', '<p> Tidak ikut kompetisi </p>', '<p>Mempersiapkan diri guna memenangkan persaingan </p>', '<p>Ikut jika ada kemungkinan saya menang. </p>', '<p>Tidak ikut saja daripada kalah </p>', '<p> Saya ikut, karena saya pasti memenangkan persaingan </p>', '', '', '', '', '', 'B', 1584947248, 1584947248),
(178, 10, 5, 1, 1, 2, 3, 4, 5, '', '', '<p>Dari sekian pegawai di kantor, saya merasa beban tugas terberat ada pada saya ditambah lagi dengan adanya deadline. Sikap saya… </p>', '<p>Mengerjakan semua tugas sambil menggerutu dan marah-marah </p>', '<p>Mengerjakan semua tugas setengah-setengah saja, yang penting sudah dianggap bertanggung-jawab </p>', '<p>Hanya mengerjakan pekerjaan yang saya senangi </p>', '<p>Mengkonsumsi obat suplemen untuk mendongkrak tenaga saya dalam menyelesaikan semua tugas </p>', '<p>Mengerjakan semua tugas dengan senang hati dan berusaha memenuhi target </p>', '', '', '', '', '', 'E', 1584947286, 1584947286),
(179, 10, 5, 1, 1, 2, 3, 4, 5, '', '', '<p>Hampir semua pegawai di kantor instansi saya meminta uang tanda terimakasih atas pengurusan surat ijin tertentu. Namun menurut peraturan kantor, hal itu tidaklah diperbolehkan, maka saya ….. </p>', '<p>Ikut melakukannya karena bagaimanapun juga kawan-kawan kantor juga melakukannya </p>', '<p>Melakukannya hanya jika terpaksa membutuhkan uang tambahan untuk keperluan keluarga, sebab gaji kantor memang kecil </p>', '<p>Terkadang saja melakukan hal tersebut </p>', '<p>Berusaha semampunya untuk tidak melakukannya </p>', '<p>Tidak ingin melakukannya sama sekali. </p>', '', '', '', '', '', 'E', 1584947334, 1584947334),
(180, 10, 5, 1, 1, 3, 4, 5, 2, '', '', '<p>Anda adalah seorang karyawan apotek. Seorang pembeli ingin membeli obatobatan tertentu yang harus menggunakan resep dokter karena bisa membahayakan kesehatan. Dia tidak mempunyai resep itu. Namun pembeli tersebut memaksa ingin membelinya dan dia memberikan sejumlah uang kepada Anda agar mau memberikan obat tersebut. Apa yang Anda lakukan ? </p>', '<p> Saya memberikan obat tersebut kepadanya, toh tak ada yang tahu </p>', '<p>Saya ragu-ragu keputusan apa yang saya ambil </p>', '<p>Saya berkonsultasi kepada rekan sejawat dulu </p>', '<p> Saya menolaknya dengan mantap </p>', '<p>Saya menerima uang tersebut dan memberikan obatnya </p>', '', '', '', '', '', 'E', 1584947378, 1584947378),
(181, 10, 5, 1, 3, 1, 4, 5, 2, '', '', '<p>Atasan Anda melakukan rekayasa laporan keuangan kantor, maka Anda </p>', '<p>Dalam hati tidak menyetujui hal tersebut </p>', '<p>Hal tersebut sering terjadi di kantor manapun </p>', '<p>Mengingatkan dan melaporkan kepada yang berwenang </p>', '<p>Tidak ingin terlibat dalam proses rekayasa tersebut </p>', '<p>Hal semacam itu memang sudah menjadi tradisi yang tidak baik di Indonesia </p>', '', '', '', '', '', 'D', 1584947417, 1584947417);

-- --------------------------------------------------------

--
-- Struktur dari tabel `to_tbi`
--

CREATE TABLE `to_tbi` (
  `id` int(11) NOT NULL,
  `id_mahasiswa` int(11) NOT NULL,
  `id_tryout` int(11) NOT NULL,
  `nilai_tbi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `to_tbi`
--

INSERT INTO `to_tbi` (`id`, `id_mahasiswa`, `id_tryout`, `nilai_tbi`) VALUES
(1, 7, 2, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `to_tpa`
--

CREATE TABLE `to_tpa` (
  `id` int(11) NOT NULL,
  `id_mahasiswa` int(11) NOT NULL,
  `id_tryout` int(11) NOT NULL,
  `nilai_tpa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `to_tpa`
--

INSERT INTO `to_tpa` (`id`, `id_mahasiswa`, `id_tryout`, `nilai_tpa`) VALUES
(7, 7, 2, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'Administrator', '$2y$12$tGY.AtcyXrh7WmccdbT1rOuKEcTsKH6sIUmDr0ore1yN4LnKTTtuu', 'admin@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1585458166, 1, 'Admin', 'Istrator', 'ADMIN', '0'),
(10, '::1', '00000001', '$2y$10$gwkr/JvO6gIwUta8e4o4Au5PxlFTVDYYZCFCb2Aoeka/uGIVwIWwG', 'tbi@tbi.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1584630937, 1584978824, 1, 'TRYOUT01', 'TRYOUT01', NULL, NULL),
(11, '::1', '00000002', '$2y$10$pcXvZG60tNaArvoF9H2hiuddtBBzCusxlnDn2GzdPE4kwp9jddYCm', 'tpa@tpa.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1584645928, 1584929445, 1, 'TRYOUT01', 'TRYOUT01', NULL, NULL),
(15, '::1', '00000006', '$2y$10$woEiKFMZr76mXiv92AtufeX2u9Yokxwv9NKNU9MTZ93VLNgsjxeVK', 'tpa2@tpa2.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1584721653, 1585235180, 1, 'TO', 'TPA', NULL, NULL),
(25, '::1', '00000003', '$2y$10$wyx.oUIQtrjMTMHNmxNNW.2m5kdpKzjQqFFl9XeeFaQISxSYMPnGS', 'twk@twk.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1584866891, 1584922172, 1, 'TRYOUT01', 'TRYOUT01', NULL, NULL),
(26, '::1', '00000004', '$2y$10$s6mbiHaW39r5d29q5Z4MB.KZ1aRyIUhg/bj9Qkbgm3zK54fV1oGdS', 'tiu@tiu.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1584881803, 1584922732, 1, 'TO1', 'TIU', NULL, NULL),
(27, '::1', '00000005', '$2y$10$sb9//p3JBPFLps3pQ2ALp.hCz0uY/Hj/0QT5TlVg4clMMhclGD97W', 'tkp@tkp.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1584882438, 1584979989, 1, 'TO1', 'TKP', NULL, NULL),
(28, '::1', 'pratamajr', '$2y$10$PUe.CT7uGPe9u1Tf4p3f2eoGqT1Ui/tpsPKVX0lHV9ZjAMNplPsNq', 'jalusatria17@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1584893573, 1585490626, 1, 'Jalu', 'Pratama', NULL, NULL),
(29, '::1', 'jalusatriiaa', '$2y$10$TM8WfN5byXf3fd4z/XV6lu/LhStFMVGnhEBk/xywMbAChI10Dt7Fi', 'jalusatria14@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1584979112, 1585480522, 1, 'Jalu', 'Jalu', NULL, NULL),
(30, '::1', 'bug', '$2y$10$.u4Jj4QmMdMJFomIjE6yHe8jBBwTdlIE4k4xD8f8gFUQNSshZWpOO', 'bug@bug.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1584979157, 1585062966, 1, 'Bug', 'Bug', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(3, 1, 1),
(12, 10, 2),
(13, 11, 2),
(17, 15, 2),
(27, 25, 2),
(28, 26, 2),
(29, 27, 2),
(30, 28, 3),
(31, 29, 3),
(32, 30, 3);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `data_prodi`
--
ALTER TABLE `data_prodi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id_dosen`),
  ADD UNIQUE KEY `nip` (`nip`),
  ADD KEY `email` (`email`),
  ADD KEY `matkul_id` (`matkul_id`),
  ADD KEY `id_dosen` (`id_dosen`,`nip`,`nama_dosen`,`email`,`matkul_id`),
  ADD KEY `email_2` (`email`),
  ADD KEY `email_3` (`email`) USING BTREE;

--
-- Indeks untuk tabel `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `h_tryout`
--
ALTER TABLE `h_tryout`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `h_ujian`
--
ALTER TABLE `h_ujian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ujian_id` (`ujian_id`),
  ADD KEY `mahasiswa_id` (`mahasiswa_id`),
  ADD KEY `h_ujian_ibfk_3` (`id_tryout`);

--
-- Indeks untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indeks untuk tabel `jurusan_matkul`
--
ALTER TABLE `jurusan_matkul`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jurusan_id` (`jurusan_id`),
  ADD KEY `matkul_id` (`matkul_id`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`),
  ADD KEY `jurusan_id` (`jurusan_id`);

--
-- Indeks untuk tabel `kelas_dosen`
--
ALTER TABLE `kelas_dosen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelas_id` (`kelas_id`),
  ADD KEY `dosen_id` (`dosen_id`);

--
-- Indeks untuk tabel `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_mahasiswa`),
  ADD UNIQUE KEY `nim` (`nim`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `kelas_id` (`kelas_id`);

--
-- Indeks untuk tabel `matkul`
--
ALTER TABLE `matkul`
  ADD PRIMARY KEY (`id_matkul`);

--
-- Indeks untuk tabel `m_tryout`
--
ALTER TABLE `m_tryout`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tryout_id` (`id_tryout`);

--
-- Indeks untuk tabel `m_ujian`
--
ALTER TABLE `m_ujian`
  ADD PRIMARY KEY (`id_ujian`),
  ADD KEY `matkul_id` (`matkul_id`),
  ADD KEY `dosen_id` (`dosen_id`),
  ADD KEY `tryout_id` (`tryout_id`);

--
-- Indeks untuk tabel `tb_soal`
--
ALTER TABLE `tb_soal`
  ADD PRIMARY KEY (`id_soal`),
  ADD KEY `matkul_id` (`matkul_id`),
  ADD KEY `dosen_id` (`dosen_id`);

--
-- Indeks untuk tabel `to_tbi`
--
ALTER TABLE `to_tbi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `to_tpa`
--
ALTER TABLE `to_tpa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`),
  ADD UNIQUE KEY `uc_email` (`email`) USING BTREE;

--
-- Indeks untuk tabel `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `data_prodi`
--
ALTER TABLE `data_prodi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `dosen`
--
ALTER TABLE `dosen`
  MODIFY `id_dosen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `h_tryout`
--
ALTER TABLE `h_tryout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT untuk tabel `h_ujian`
--
ALTER TABLE `h_ujian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id_jurusan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `jurusan_matkul`
--
ALTER TABLE `jurusan_matkul`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `kelas_dosen`
--
ALTER TABLE `kelas_dosen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id_mahasiswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `matkul`
--
ALTER TABLE `matkul`
  MODIFY `id_matkul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `m_tryout`
--
ALTER TABLE `m_tryout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `m_ujian`
--
ALTER TABLE `m_ujian`
  MODIFY `id_ujian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `tb_soal`
--
ALTER TABLE `tb_soal`
  MODIFY `id_soal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT untuk tabel `to_tbi`
--
ALTER TABLE `to_tbi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `to_tpa`
--
ALTER TABLE `to_tpa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `dosen_ibfk_1` FOREIGN KEY (`matkul_id`) REFERENCES `matkul` (`id_matkul`);

--
-- Ketidakleluasaan untuk tabel `h_ujian`
--
ALTER TABLE `h_ujian`
  ADD CONSTRAINT `h_ujian_ibfk_1` FOREIGN KEY (`ujian_id`) REFERENCES `m_ujian` (`id_ujian`),
  ADD CONSTRAINT `h_ujian_ibfk_2` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswa` (`id_mahasiswa`),
  ADD CONSTRAINT `h_ujian_ibfk_3` FOREIGN KEY (`id_tryout`) REFERENCES `m_ujian` (`tryout_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `jurusan_matkul`
--
ALTER TABLE `jurusan_matkul`
  ADD CONSTRAINT `jurusan_matkul_ibfk_1` FOREIGN KEY (`jurusan_id`) REFERENCES `jurusan` (`id_jurusan`),
  ADD CONSTRAINT `jurusan_matkul_ibfk_2` FOREIGN KEY (`matkul_id`) REFERENCES `matkul` (`id_matkul`);

--
-- Ketidakleluasaan untuk tabel `kelas_dosen`
--
ALTER TABLE `kelas_dosen`
  ADD CONSTRAINT `kelas_dosen_ibfk_1` FOREIGN KEY (`dosen_id`) REFERENCES `dosen` (`id_dosen`),
  ADD CONSTRAINT `kelas_dosen_ibfk_2` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id_kelas`);

--
-- Ketidakleluasaan untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_2` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id_kelas`);

--
-- Ketidakleluasaan untuk tabel `m_tryout`
--
ALTER TABLE `m_tryout`
  ADD CONSTRAINT `m_tryout_ibfk_1` FOREIGN KEY (`id_tryout`) REFERENCES `m_ujian` (`tryout_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `m_ujian`
--
ALTER TABLE `m_ujian`
  ADD CONSTRAINT `m_ujian_ibfk_1` FOREIGN KEY (`dosen_id`) REFERENCES `dosen` (`id_dosen`),
  ADD CONSTRAINT `m_ujian_ibfk_2` FOREIGN KEY (`matkul_id`) REFERENCES `matkul` (`id_matkul`);

--
-- Ketidakleluasaan untuk tabel `tb_soal`
--
ALTER TABLE `tb_soal`
  ADD CONSTRAINT `tb_soal_ibfk_1` FOREIGN KEY (`matkul_id`) REFERENCES `matkul` (`id_matkul`),
  ADD CONSTRAINT `tb_soal_ibfk_2` FOREIGN KEY (`dosen_id`) REFERENCES `dosen` (`id_dosen`);

--
-- Ketidakleluasaan untuk tabel `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
