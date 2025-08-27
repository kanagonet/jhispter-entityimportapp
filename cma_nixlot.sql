-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : ven. 22 août 2025 à 17:11
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cma_nixlot`
--

-- --------------------------------------------------------

--
-- Structure de la table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `location_lon` varchar(100) DEFAULT NULL,
  `location_lat` varchar(100) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `region` varchar(50) DEFAULT NULL,
  `township` varchar(100) DEFAULT NULL,
  `postalbox` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `addresses`
--

INSERT INTO `addresses` (`id`, `location_lon`, `location_lat`, `street`, `city`, `country`, `region`, `township`, `postalbox`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '12.345678', '5.678912', 'Avenue de la République', 'Douala', 'Cameroun', 'Littoral', 'Bonamoussadi', 'BP 1234', '2025-07-25 14:46:31', '2025-07-25 14:47:47', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `associations`
--

CREATE TABLE `associations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `association_type_id` int(10) UNSIGNED NOT NULL,
  `main_leader_name` varchar(100) DEFAULT NULL,
  `main_leader_telephone_number` varchar(20) DEFAULT NULL,
  `money_saving_scheme` varchar(255) DEFAULT NULL,
  `terms_of_savings` varchar(255) DEFAULT NULL,
  `service_satisfaction` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `associations`
--

INSERT INTO `associations` (`id`, `name`, `association_type_id`, `main_leader_name`, `main_leader_telephone_number`, `money_saving_scheme`, `terms_of_savings`, `service_satisfaction`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Association Jeune Dynamique', 2, 'Marie Koffi', '694086823', 'Mensuel', '5000 par membre', 'Bonne', '2025-07-25 11:44:43', '2025-07-25 11:47:06', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `association_types`
--

CREATE TABLE `association_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `association_types`
--

INSERT INTO `association_types` (`id`, `name`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'AJFA', '1', '2025-07-25 11:40:35', '2025-07-25 11:40:35', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `dob` datetime DEFAULT NULL,
  `pob` datetime DEFAULT NULL,
  `telephone_number` varchar(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `marital_status` enum('SINGLE','MARRIED','WIDOWED','DIVORCED') NOT NULL DEFAULT 'SINGLE',
  `education_level_id` int(10) UNSIGNED NOT NULL,
  `live_with_parents` enum('0','1') NOT NULL DEFAULT '0',
  `gender` enum('M','F') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `customer_associations`
--

CREATE TABLE `customer_associations` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `association_id` int(10) UNSIGNED NOT NULL,
  `role` varchar(100) DEFAULT NULL,
  `active_member` enum('0','1') NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `customer_identifications`
--

CREATE TABLE `customer_identifications` (
  `id` int(11) NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `identification_type_id` int(10) UNSIGNED NOT NULL,
  `id_number` varchar(50) NOT NULL,
  `country_of_issuance` varchar(100) NOT NULL,
  `issuance_date` date NOT NULL,
  `expiration_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `education_levels`
--

CREATE TABLE `education_levels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `education_levels`
--

INSERT INTO `education_levels` (`id`, `name`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Baccalaureat', '0', '2025-07-25 14:35:45', '2025-07-25 14:35:45', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `financial_information`
--

CREATE TABLE `financial_information` (
  `id` int(10) UNSIGNED NOT NULL,
  `profession` varchar(100) NOT NULL,
  `estimated_income_per_month` varchar(50) DEFAULT NULL,
  `any_asset` enum('0','1') NOT NULL DEFAULT '0',
  `asset_rough_worth` varchar(50) DEFAULT NULL,
  `asset_type` varchar(50) DEFAULT NULL,
  `any_insurance` enum('0','1') NOT NULL DEFAULT '0',
  `insurance_description` varchar(255) DEFAULT NULL,
  `money_earn_medium` varchar(50) DEFAULT NULL,
  `any_project_to_invest` enum('1','0') NOT NULL DEFAULT '0',
  `invested_amount_in_project` varchar(50) DEFAULT NULL,
  `is_extra_fund_needed` enum('0','1') NOT NULL DEFAULT '0',
  `extra_fund_amount` varchar(50) DEFAULT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `health_information`
--

CREATE TABLE `health_information` (
  `id` int(10) UNSIGNED NOT NULL,
  `any_health_issue` enum('0','1') NOT NULL DEFAULT '0',
  `common_family_disease` varchar(100) DEFAULT NULL,
  `main_health_issue` varchar(100) DEFAULT NULL,
  `medical_bill_payment_method` varchar(100) DEFAULT NULL,
  `household_main_health_issue` varchar(100) DEFAULT NULL,
  `medical_bill_expense_per_year` varchar(50) DEFAULT NULL,
  `hospital_preference` varchar(100) DEFAULT NULL,
  `hospital_preference_reason` varchar(255) DEFAULT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `identification_types`
--

CREATE TABLE `identification_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `identification_types`
--

INSERT INTO `identification_types` (`id`, `name`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Carte nationale d\'identité', '0', '2025-07-25 14:26:38', '2025-07-25 14:27:47', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_07_19_150741_create_customers_table', 1),
(6, '2025_07_19_150746_create_addresses_table', 1),
(7, '2025_07_19_150751_create_roles_table', 1),
(8, '2025_07_19_150755_create_referrals_table', 1),
(9, '2025_07_19_150759_create_referral_types_table', 1),
(10, '2025_07_19_150802_create_education_levels_table', 1),
(11, '2025_07_19_150807_create_customer_identifications_table', 1),
(12, '2025_07_19_150811_create_identification_types_table', 1),
(13, '2025_07_19_150815_create_health_information_table', 1),
(14, '2025_07_19_150820_create_financial_information_table', 1),
(15, '2025_07_19_150824_create_associations_table', 1),
(16, '2025_07_19_150828_create_association_types_table', 1),
(17, '2025_07_19_150833_create_customer_associations_table', 1),
(18, '2025_07_19_153721_add_email_verified_at_to_users_table', 1),
(19, '2025_07_19_161629_add_is_active_to_roles_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `referrals`
--

CREATE TABLE `referrals` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `telephone_number` varchar(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `cohabitation` enum('0','1') NOT NULL DEFAULT '0',
  `referral_type_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `referrals`
--

INSERT INTO `referrals` (`id`, `first_name`, `last_name`, `telephone_number`, `email`, `city`, `country`, `cohabitation`, `referral_type_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Kouayep', 'Jocelyn', '694087654', 'marie@example.com', 'Douala', 'Cameroun', '0', 1, '2025-07-25 14:10:00', '2025-07-25 14:16:19', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `referral_types`
--

CREATE TABLE `referral_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `referral_types`
--

INSERT INTO `referral_types` (`id`, `name`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Dounou alain', '0', '2025-07-25 12:01:23', '2025-07-25 12:05:00', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'primary key',
  `title` varchar(25) NOT NULL COMMENT 'Title of the role',
  `slug` varchar(50) DEFAULT NULL COMMENT 'slug version of the title ',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `title`, `slug`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'customer', 'customer', 1, '2025-07-20 09:33:25', '2025-07-20 09:33:25', NULL),
(2, 'admin', 'admin', 1, '2025-07-20 09:34:50', '2025-07-20 09:34:50', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'row id',
  `username` varchar(50) NOT NULL DEFAULT '0' COMMENT 'username',
  `first_name` varchar(50) NOT NULL DEFAULT '0' COMMENT 'first_name',
  `last_name` varchar(50) NOT NULL DEFAULT '0' COMMENT 'last_name',
  `role_id` int(10) UNSIGNED NOT NULL COMMENT 'user role',
  `email` varchar(255) NOT NULL COMMENT 'user email address',
  `password` varchar(255) NOT NULL COMMENT 'user encrypted secret password',
  `verified_status` enum('PENDING','VERIFIED') NOT NULL DEFAULT 'PENDING' COMMENT 'user verified status',
  `last_login` datetime DEFAULT NULL COMMENT 'user last login',
  `is_active` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'user active status',
  `verify_token` varchar(255) DEFAULT NULL COMMENT 'verification of the token sent to the user',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `recover_key` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `first_name`, `last_name`, `role_id`, `email`, `password`, `verified_status`, `last_login`, `is_active`, `verify_token`, `created_at`, `updated_at`, `deleted_at`, `recover_key`) VALUES
(1, 'jeandupont', 'Jean', 'Dupont', 1, 'jean@example.com', '$2y$10$.yjFhUvLc0kdByJXcVXmMuLsjb6iuQBwXUKYIi.XgbpDgWmn1nw6m', 'PENDING', NULL, '0', 'yibpSkFr6p4jEgzU5jUr7eZfU1Rnky4kxgGsqrEaJSIurpk2NscnrMEcx5oh', '2025-07-20 10:01:03', '2025-07-20 10:01:03', NULL, NULL),
(2, 'jocelynkouayep', 'Jocelyn', 'Kouayep', 1, 'kouayeptankiojocelyn@gmail.com', '$2y$10$gZYIW4/cbuCiRxHYnVoYsOAk8HFAI1A6TzErL4JKIA/tJ50EiNVxW', 'VERIFIED', '2025-07-25 16:59:25', '1', 'lSJvwPbF720OUDfguQ8gPhtID0VAo6eavcOIoTcVQjcdUflF1N2DBk9FV5oc', '2025-07-20 10:16:00', '2025-07-25 14:59:25', NULL, NULL),
(3, 'jasonwanko', 'Jason', 'Wanko', 1, 'wanko@gmail.com', '$2y$10$KIpaukVbMkv1ppwHyOHg3OnF8.rJ0kjEp6qlnp1QODcRnEyEL.l7i', 'PENDING', NULL, '0', 'FOEiq10DSnygz53CoQzQNhAmPUUTP7bk2GCT0R5iH4h5n1S1xFkUAXzc140U', '2025-07-25 09:19:02', '2025-07-25 09:19:02', NULL, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `associations`
--
ALTER TABLE `associations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `association_type_id` (`association_type_id`);

--
-- Index pour la table `association_types`
--
ALTER TABLE `association_types`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `customer_associations`
--
ALTER TABLE `customer_associations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `association_id` (`association_id`);

--
-- Index pour la table `customer_identifications`
--
ALTER TABLE `customer_identifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `identification_type_id` (`identification_type_id`);

--
-- Index pour la table `education_levels`
--
ALTER TABLE `education_levels`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `financial_information`
--
ALTER TABLE `financial_information`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Index pour la table `health_information`
--
ALTER TABLE `health_information`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Index pour la table `identification_types`
--
ALTER TABLE `identification_types`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `referral_type_id` (`referral_type_id`);

--
-- Index pour la table `referral_types`
--
ALTER TABLE `referral_types`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UN_role_slug` (`slug`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `first_name` (`first_name`),
  ADD UNIQUE KEY `last_name` (`last_name`),
  ADD UNIQUE KEY `un_accounts_email` (`email`),
  ADD KEY `FK_users_role` (`role_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `associations`
--
ALTER TABLE `associations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `association_types`
--
ALTER TABLE `association_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `customer_associations`
--
ALTER TABLE `customer_associations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `customer_identifications`
--
ALTER TABLE `customer_identifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `education_levels`
--
ALTER TABLE `education_levels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `financial_information`
--
ALTER TABLE `financial_information`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `health_information`
--
ALTER TABLE `health_information`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `identification_types`
--
ALTER TABLE `identification_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `referral_types`
--
ALTER TABLE `referral_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'primary key', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'row id', AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
