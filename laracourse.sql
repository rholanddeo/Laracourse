-- -------------------------------------------------------------
-- TablePlus 5.9.6(546)
--
-- https://tableplus.com/
--
-- Database: laracourse
-- Generation Time: 2024-04-22 17:00:02.0380
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `courses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courses_code_unique` (`code`),
  UNIQUE KEY `courses_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `materis` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint unsigned NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `materis_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `categories` (`id`, `name`, `slug`) VALUES
(1, 'Web Development', 'web-development'),
(2, 'Graphic Design', 'graphic-design'),
(3, 'Digital Marketing', 'digital-marketing'),
(4, 'UI/UX Designer', 'uiux-designer'),
(5, 'Digital Skills', 'digital-skills');

INSERT INTO `courses` (`id`, `category_id`, `code`, `slug`, `name`, `description`, `duration`, `created_at`, `updated_at`) VALUES
(1, 4, 'CRS-1', 'crs-1', 'Id exercitationem fugiat autem fuga est iste.', 'Ipsam incidunt doloremque illum provident tempora officiis aut. Rerum quae sed molestias. Sed omnis quam provident dolor.', 6, '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(2, 4, 'CRS-2', 'crs-2', 'Expedita vitae ipsum earum ea ea aut assumenda voluptate.', 'Doloribus quos laboriosam amet tenetur illo. Molestiae dolor suscipit voluptates.', 7, '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(3, 1, 'CRS-3', 'crs-3', 'Quaerat quos repudiandae quibusdam unde dolorum et quaerat.', 'Saepe provident ut eum omnis natus. Cum pariatur nulla error autem cum et sunt. Velit iste aut dolor. Ut adipisci autem ut distinctio voluptatum.', 3, '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(4, 2, 'CRS-4', 'crs-4', 'Mollitia aut quasi quod minima corrupti nemo numquam vitae.', 'Culpa consequatur atque sed atque enim omnis. Ducimus fuga architecto maiores autem a quo reiciendis. Est repellat maxime rerum velit. Quia laborum inventore qui tenetur et sed inventore. Quia consequatur quo corrupti ipsum eligendi.', 7, '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(5, 5, 'CRS-5', 'crs-5', 'Libero suscipit fuga et deserunt suscipit et non.', 'Reprehenderit enim quis quas exercitationem dolor itaque harum. Repellat iusto hic voluptas rerum eligendi minus tenetur architecto. Quia esse voluptatem placeat aut qui.', 7, '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(6, 2, 'CRS-6', 'crs-6', 'Vitae perspiciatis quibusdam incidunt dolor esse.', 'Laudantium ea nobis quisquam qui tempore. Doloremque doloribus velit est. Cupiditate nulla facilis distinctio et beatae quia.', 8, '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(7, 1, 'CRS-7', 'crs-7', 'Repellat corrupti atque sint.', 'Dolor rerum dolore omnis aut et. Dolorum pariatur laboriosam culpa tempore quia cupiditate.', 3, '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(8, 4, 'CRS-8', 'crs-8', 'Omnis velit et et assumenda delectus inventore est.', 'Tempora ut sit sit molestiae quia nobis atque. Repellendus autem dolorum consectetur magni temporibus quia reprehenderit. Sit enim tempore quo iste.', 6, '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(9, 4, 'CRS-9', 'crs-9', 'Est ut atque dignissimos eos consequatur ab corporis recusandae.', 'Ut sunt voluptates laudantium aliquam sunt. Asperiores sunt itaque ullam inventore inventore ullam voluptas. Vitae incidunt consectetur et ratione. Porro molestiae expedita saepe quis aliquid dolore.', 5, '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(10, 3, 'CRS-10', 'crs-10', 'Eveniet iste est sint et voluptatem.', 'Aut voluptatem officia neque enim qui est. Esse totam quisquam non molestiae.', 5, '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(11, 5, 'CRS-11', 'crs-11', 'Odit quibusdam qui ullam et omnis tempore et.', 'Voluptatem qui quia nihil iusto fugiat maiores. Qui cupiditate porro minima repudiandae alias autem quidem. Rerum et natus eum modi.', 3, '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(12, 5, 'CRS-12', 'crs-12', 'Delectus est amet quis id suscipit et atque.', 'Vel dolor alias id qui incidunt laboriosam soluta sint. Ea quia dolores ipsum commodi. Iste omnis nobis velit odit perspiciatis.', 1, '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(13, 4, 'CRS-13', 'crs-13', 'Facere quia enim iusto.', 'Alias nihil distinctio veritatis sequi similique laboriosam exercitationem debitis. Vel ab tempora eaque excepturi porro tenetur. Culpa voluptas numquam nam consequatur.', 8, '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(14, 5, 'CRS-14', 'crs-14', 'Porro voluptatibus architecto in ut ut laborum sunt.', 'Deleniti laudantium veritatis aspernatur dolorem fuga. Et debitis minima vel. Commodi est cumque nisi et. A sunt eligendi et est quia suscipit deleniti.', 6, '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(15, 1, 'CRS-15', 'crs-15', 'Et ab consequatur et sed ea natus molestias.', 'Quam soluta illo iste optio ducimus autem. Ad ut maiores et. Ad alias debitis libero occaecati.', 2, '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(16, 1, 'CRS-16', 'crs-16', 'Ut cum maxime omnis culpa.', 'Aperiam fugit necessitatibus illum quis. Maiores ipsam iste quis rerum. Distinctio pariatur rem ut sit.', 5, '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(17, 2, 'CRS-17', 'crs-17', 'Ab pariatur veritatis minima voluptatibus quas.', 'Ut qui placeat quae a sint incidunt. Ab praesentium iusto enim aspernatur natus. Eaque necessitatibus sint et.', 3, '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(18, 2, 'CRS-18', 'crs-18', 'Repudiandae quo qui maxime illum.', 'Ut et asperiores deleniti porro ipsa assumenda nemo. Quae voluptas sunt delectus libero. Corporis expedita similique non rerum nesciunt. Rerum delectus qui labore nulla qui.', 7, '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(19, 3, 'CRS-19', 'crs-19', 'Suscipit neque porro corporis nostrum.', 'Corrupti error nulla sed assumenda distinctio sed. Repudiandae similique accusantium hic occaecati. Adipisci et ipsam corrupti aut temporibus. Dolor in deserunt esse libero possimus soluta autem quia.', 1, '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(20, 3, 'CRS-20', 'crs-20', 'Et consequuntur similique animi rerum.', 'Aut alias numquam commodi rerum. Ullam eligendi magni ut laudantium. Aut facilis id quam sequi blanditiis.', 6, '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(21, 2, 'eefefae', 'eefefae', 'eafaefaef', 'efsefsefesf', 12, '2024-04-22 03:57:31', '2024-04-22 03:57:31'),
(23, 1, 'efrgrgefe', 'efrgrgefe', 'rsgsrgsrgs', 'esfsregrsg', 12, '2024-04-22 09:38:05', '2024-04-22 09:41:14');

INSERT INTO `materis` (`id`, `course_id`, `subject`, `slug`, `content`, `link`, `created_at`, `updated_at`) VALUES
(1, 16, 'MTR-1', 'mtr-1', 'Assumenda fuga quas modi et porro temporibus sunt quia. Veritatis exercitationem corporis nostrum ratione architecto. Distinctio ratione architecto quaerat reprehenderit. Enim dolorem dolorem sit voluptatibus voluptatem ut.', 'http://www.wintheiser.com/autem-occaecati-aut-dolor-suscipit', '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(2, 16, 'MTR-2', 'mtr-2', 'Ipsum esse voluptas ipsam. Dolore doloribus vero autem porro sit. Totam sed repudiandae possimus velit et.', 'https://www.kutch.com/enim-consequatur-recusandae-distinctio-molestiae-debitis-illum-ipsum', '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(3, 3, 'MTR-3', 'mtr-3', 'Et voluptatem quisquam quo aliquid. Atque nihil nemo voluptatum eveniet qui officiis et. Delectus ut est voluptatem exercitationem nulla quae rerum.', 'http://www.johnson.biz/quia-magni-delectus-omnis-mollitia-et.html', '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(4, 8, 'MTR-4', 'mtr-4', 'Numquam nulla rerum magni suscipit sed suscipit. Occaecati corrupti commodi modi atque iste. Qui modi vitae et. Voluptatem ea nihil sit a et.', 'https://www.gottlieb.com/quibusdam-voluptas-voluptas-occaecati-sunt-et', '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(5, 7, 'MTR-5', 'mtr-5', 'Aut nihil nulla voluptas molestiae sequi sed qui. Quidem molestias et itaque et ut. Enim est reprehenderit consequatur ut vitae ducimus.', 'http://von.biz/quia-ratione-ut-vitae-est-corporis-hic-consequuntur.html', '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(6, 15, 'MTR-6', 'mtr-6', 'Et quo itaque quis maiores. Enim cupiditate qui voluptatum optio rerum qui. Atque itaque commodi quae.', 'http://herzog.net/', '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(7, 13, 'MTR-7', 'mtr-7', 'Ex voluptatem molestiae facilis impedit eius doloremque accusantium. Est repudiandae earum et odio.', 'http://donnelly.com/quasi-atque-enim-corrupti-corrupti-error-omnis.html', '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(8, 9, 'MTR-8', 'mtr-8', 'Dolore repellendus ipsum aut repudiandae dolores. Id hic eum suscipit assumenda odio.', 'https://www.rogahn.org/expedita-libero-quis-quisquam-cupiditate', '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(9, 11, 'MTR-9', 'mtr-9', 'Doloribus dicta cumque adipisci quidem dolor ut deleniti. Et quo aperiam recusandae consequuntur ea eum et. Ut qui quia laboriosam.', 'http://champlin.info/', '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(10, 16, 'MTR-10', 'mtr-10', 'Vel laboriosam doloribus dolores quasi id. Ad ratione soluta fugiat dolor. Dolor quia unde in ut voluptatem assumenda.', 'http://ledner.com/et-veritatis-ratione-architecto-deleniti-exercitationem-impedit-nam.html', '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(11, 12, 'MTR-11', 'mtr-11', 'Quia minima deserunt rerum sequi quis officiis id. Aut dolorem adipisci fugit deserunt molestias tempora tempora. Atque nihil aut sed perferendis. In culpa nesciunt accusantium reprehenderit accusamus ducimus.', 'http://crist.com/cupiditate-dolore-voluptas-quia-impedit', '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(12, 6, 'MTR-12', 'mtr-12', 'Possimus commodi sunt reiciendis voluptatum dignissimos sit ipsum quibusdam. Adipisci ullam ea quidem nam ad autem amet. Enim non ipsam adipisci quidem nam tempore. Ducimus labore voluptates nulla aut.', 'https://walker.com/occaecati-dolores-harum-illo-quisquam.html', '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(13, 5, 'MTR-13', 'mtr-13', 'Ut ut deserunt placeat officiis dolorem. Est nostrum hic vel id sapiente tempore. Eos ut aliquid enim doloremque nostrum. Iste voluptatem eum officiis. Quam esse ex delectus corrupti odit voluptas.', 'https://www.blick.com/enim-dolorum-officia-molestias', '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(14, 6, 'MTR-14', 'mtr-14', 'Quae perspiciatis accusantium deleniti. Ex ratione hic consequatur eos ut et. Molestias possimus pariatur temporibus eaque. Nostrum distinctio iure quidem aut.', 'http://www.purdy.com/', '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(15, 14, 'MTR-15', 'mtr-15', 'Voluptas officia sapiente repellendus qui. Eveniet eos incidunt ex et eaque iusto alias dolor. Sit vel reprehenderit laboriosam omnis id cum. Omnis sunt in dicta aliquam sit itaque.', 'https://www.mckenzie.info/aut-ut-voluptates-ab-praesentium-et', '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(16, 15, 'MTR-16', 'mtr-16', 'Atque fugit dolorem eveniet dignissimos et ut quibusdam repellendus. Aliquam et voluptatibus praesentium in. Molestiae voluptatibus eos quos voluptatem nihil.', 'https://www.mante.com/et-quis-nesciunt-non-similique-cum-dolorum', '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(17, 14, 'MTR-17', 'mtr-17', 'Illum minima eum voluptas saepe quia molestiae. Sunt voluptatem accusamus non aut rem magni. Fugiat at facere possimus aliquid. Nihil quia voluptatibus ullam id vero. Et voluptatem aut illum et soluta non.', 'http://www.gorczany.info/', '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(18, 15, 'MTR-18', 'mtr-18', 'Numquam eos fugiat ea dolorem. Tempora repellendus et qui ipsum fuga. Blanditiis ipsam eaque sapiente consequatur ratione minus molestiae.', 'http://www.fisher.info/impedit-sunt-aliquam-pariatur.html', '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(19, 16, 'MTR-19', 'mtr-19', 'Qui et dolorem maxime accusamus sunt vitae mollitia. Minima asperiores non est dicta sit molestias.', 'http://howell.net/et-iste-commodi-excepturi-non-amet-fugit', '2024-04-21 14:25:56', '2024-04-21 14:25:56'),
(20, 17, 'MTR-20', 'mtr-20', 'Aliquam et qui ut dolorem maiores. Quam sit dolor iste magni. Sit in dolorem atque tempora praesentium autem. Et facere hic quae saepe odio et nihil omnis.', 'http://muller.com/eligendi-fugiat-temporibus-sed-assumenda-consectetur-amet-eum', '2024-04-21 14:25:56', '2024-04-21 14:25:56');

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_07_11_081352_create_categories_table', 1),
(6, '2023_07_11_082343_create_courses_table', 1),
(7, '2023_07_12_115153_create_materis_table', 1);

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$10$iUU4PbYSdGG4GD3VfQxmEuLr9e9rkg66NQkg4ZVQB3oxnCivso0Uy', NULL, '2024-04-21 14:26:19', '2024-04-21 14:26:19'),
(2, 'udin', 'udin@mail.com', NULL, '$2y$10$MCewsM0KFDFzgRjLHG9C/.SoyQ2UWrvgU4DX/1bf61jebVrx8k7Uy', NULL, '2024-04-22 05:21:18', '2024-04-22 05:21:18'),
(3, 'test', 'test@mail.com', NULL, '$2y$10$8uDhS0dhF3J9A2U1hRI2gOj5u/iDRXqiKM9JVIf1f15A.Vf6Lj.6a', NULL, '2024-04-22 05:42:11', '2024-04-22 05:42:11'),
(4, 'aefaefaef', 'adaefaef@mail.com', NULL, '$2y$10$K.65Lh972wpfWs93JHFg/urA3Ku967LnBejWPNaV6jldolo/4OSLK', NULL, '2024-04-22 05:48:41', '2024-04-22 05:48:41'),
(10, 'udinss', 'udin@gmail.com', NULL, '$2y$10$6SZJkQBwMwIM5uASPbHYUuAAvrbbZ2.em8sxtRVGDUsunu0JqtLr.', NULL, '2024-04-22 06:28:17', '2024-04-22 08:59:25'),
(12, 'test', 'test@iji.com', NULL, '$2y$10$0owzjk3ifeb3jb0Y9sS.wuWZIwU6AD6C0Z6wEuHnn485iGSVy5oqy', NULL, '2024-04-22 09:03:39', '2024-04-22 09:03:39'),
(13, 'siapppp', 'siappp@siap.siap', NULL, '$2y$10$qGOYltENY1mlp9HnuP9MB.HzPYsWzrLKcjAx7nICwG/ObvjVJvvpm', NULL, '2024-04-22 09:04:27', '2024-04-22 09:04:27'),
(14, 'aefewfef', 'aefaefaef@aefsefe.efef', NULL, '$2y$10$PmGpFJJlDP3rf1wsWDOzt.FG5N2V9vBcBkPgOAfFRVu3ODipM0CzS', NULL, '2024-04-22 09:04:49', '2024-04-22 09:29:47'),
(15, 'efaefaefef', 'aefaefaefaef@ijijijief.ijnin', NULL, '$2y$10$qTPD4/MhNPB9Oct/hORphOrtuUMnjqHqAmzRFIyDA4NLjUhz/2XsK', NULL, '2024-04-22 09:30:22', '2024-04-22 09:30:22');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;