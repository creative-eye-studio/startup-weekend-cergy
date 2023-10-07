-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 07 oct. 2023 à 08:20
-- Version du serveur : 8.0.31
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `_startup_weekend`
--

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20231003154928', '2023-10-03 15:49:42', 773),
('DoctrineMigrations\\Version20231006204024', '2023-10-07 06:49:29', 83);

-- --------------------------------------------------------

--
-- Structure de la table `emails_list`
--

DROP TABLE IF EXISTS `emails_list`;
CREATE TABLE IF NOT EXISTS `emails_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `global_settings`
--

DROP TABLE IF EXISTS `global_settings`;
CREATE TABLE IF NOT EXISTS `global_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `damping` double DEFAULT NULL,
  `scrollimg` double DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `global_settings`
--

INSERT INTO `global_settings` (`id`, `damping`, `scrollimg`, `logo`) VALUES
(0, 5, 0.2, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `menu`
--

INSERT INTO `menu` (`id`, `name`, `pos`) VALUES
(1, 'Menu principal', 0),
(2, 'Menu pied de page', 1);

-- --------------------------------------------------------

--
-- Structure de la table `menu_link`
--

DROP TABLE IF EXISTS `menu_link`;
CREATE TABLE IF NOT EXISTS `menu_link` (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu_id` int DEFAULT NULL,
  `page_id` int DEFAULT NULL,
  `post_id` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `menu_link_id` int DEFAULT NULL,
  `order_link` int NOT NULL,
  `cus_name` json DEFAULT NULL,
  `cus_link` json DEFAULT NULL,
  `blank` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FEE369BFCCD7E912` (`menu_id`),
  KEY `IDX_FEE369BFC4663E4` (`page_id`),
  KEY `IDX_FEE369BF4B89032C` (`post_id`),
  KEY `IDX_FEE369BF727ACA70` (`parent_id`),
  KEY `IDX_FEE369BF257F1FCF` (`menu_link_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `menu_link`
--

INSERT INTO `menu_link` (`id`, `menu_id`, `page_id`, `post_id`, `parent_id`, `menu_link_id`, `order_link`, `cus_name`, `cus_link`, `blank`) VALUES
(1, 1, 1, NULL, NULL, NULL, 1, '[\"Accueil\"]', NULL, NULL),
(2, 2, 2, NULL, NULL, NULL, 0, '[\"Mentions légales\"]', NULL, NULL),
(3, 2, 3, NULL, NULL, NULL, 0, '[\"Politique de confidentialité\"]', NULL, NULL),
(4, 1, 4, NULL, NULL, NULL, 2, '[\"Partenaires\"]', NULL, NULL),
(5, 1, 5, NULL, NULL, NULL, 3, '[\"FAQ\"]', NULL, NULL),
(6, 1, 6, NULL, NULL, NULL, 4, '[\"Accès et contact\"]', '[null]', 0);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pages_list`
--

DROP TABLE IF EXISTS `pages_list`;
CREATE TABLE IF NOT EXISTS `pages_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `page_name` json NOT NULL,
  `page_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blocked_page` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `page_content` json DEFAULT NULL,
  `page_meta_title` json DEFAULT NULL,
  `page_meta_desc` json NOT NULL,
  `main_page` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pages_list`
--

INSERT INTO `pages_list` (`id`, `page_name`, `page_url`, `page_id`, `blocked_page`, `status`, `page_content`, `page_meta_title`, `page_meta_desc`, `main_page`) VALUES
(1, '[\"Accueil\"]', 'index', 'accueil', 1, 1, '[\"&lt;!-- Heroscreen --&gt;\\r\\n&lt;section class=&quot;heroscreen position-relative&quot;&gt;\\r\\n  &lt;figure class=&quot;image position-absolute wd-100 ht-100&quot;&gt;\\r\\n    &lt;img src=&quot;../uploads/images/pages/home/bg-hero.jpg&quot; alt=&quot;Startup Weekend - Cergy Pontoise&quot; class=&quot;wd-100 ht-100 position-absolute&quot; /&gt;\\r\\n  &lt;/figure&gt;\\r\\n  &lt;div class=&quot;cover d-flex position-absolute wd-100 ht-100 padding-all-on-sm&quot;&gt;\\r\\n    &lt;h1 class=&quot;text-center&quot;&gt;\\r\\n      Startup Weekend Impact&lt;br /&gt;\\r\\n      Cergy Pontoise\\r\\n    &lt;/h1&gt;\\r\\n  &lt;/div&gt;\\r\\n&lt;/section&gt;\\r\\n\\r\\n&lt;!-- Texte de présentation --&gt;\\r\\n&lt;section class=&quot;panel bg-primary padding-all-on-sm&quot;&gt;\\r\\n  &lt;h2 class=&quot;text-center small&quot;&gt;\\r\\n    Préparez-vous à hacker l&#039;avenir à Cergy-Pontoise ! &lt;br /&gt;\\r\\n    Le Startup Weekend ultime pour les esprits créatifs et les geeks intrépides est de retour !\\r\\n  &lt;/h2&gt;\\r\\n&lt;/section&gt;\\r\\n\\r\\n&lt;!-- Panel 1 --&gt;\\r\\n&lt;section class=&quot;panel home1 container-fluid&quot;&gt;\\r\\n  &lt;div class=&quot;row&quot;&gt;\\r\\n\\t&lt;div class=&quot;text col-5 col-md-6 col-sm-12 padding-all-on-sm&quot;&gt;\\r\\n      &lt;h2&gt;\\r\\n        Startup Weekend Cergy-Pontoise : Devenez Acteurs de la Transition !\\r\\n      &lt;/h2&gt;\\r\\n      &lt;p class=&quot;text-justify&quot;&gt;\\r\\n        Le Startup Weekend de Cergy-Pontoise vous invite à devenir les &#039;Acteurs de la Transition&#039;. Rejoignez-nous pour deux jours d&#039;innovation, d&#039;idéation et de collaboration intense, où les startups durables prennent vie.\\r\\n      &lt;/p&gt;\\r\\n      &lt;p class=&quot;text-justify&quot;&gt;\\r\\n        Notre mission ? Transformer les idées en actions concrètes, en mettant l&#039;accent sur la durabilité. Rencontrez des mentors inspirants et des esprits créatifs. Ensemble, bâtissons un avenir meilleur.\\r\\n      &lt;/p&gt;\\r\\n      &lt;p&gt;\\r\\n        &lt;a class=&quot;btn-primary&quot; href=&quot;&quot;&gt;Participer&lt;/a&gt;\\r\\n      &lt;/p&gt;\\r\\n      &lt;p&gt;\\r\\n        &lt;a class=&quot;btn-primary&quot; href=&quot;&quot;&gt;Devenir partenaire&lt;/a&gt;\\r\\n      &lt;/p&gt;\\r\\n    &lt;/div&gt;\\r\\n    &lt;figure class=&quot;image col-7 col-md-6 col-sm-12 position-relative&quot;&gt;\\r\\n      &lt;img src=&quot;../uploads/images/pages/home/img-welcome.jpg&quot; alt=&quot;Startup Weekend - Cergy Pontoise&quot; class=&quot;wd-100 ht-100 position-absolute&quot; /&gt;\\r\\n    &lt;/figure&gt;\\r\\n  &lt;/div&gt;\\r\\n&lt;/section&gt;\\r\\n\\r\\n&lt;!-- Panel 2 --&gt;\\r\\n&lt;section class=&quot;panel home2 container-fluid padding-all-on-sm bg-light&quot;&gt;\\r\\n\\t&lt;div class=&quot;row text-center&quot;&gt;\\r\\n      &lt;div class=&quot;item col-4 col-xs-12&quot;&gt;\\r\\n        &lt;span class=&quot;icon&quot;&gt;\\r\\n        \\t&lt;img src=&quot;../uploads/images/pages/home/group-icon.svg&quot; alt=&quot;Accès 24 heures sur 24 pour les participants&quot; /&gt;\\r\\n        &lt;/span&gt;\\r\\n        &lt;p&gt;Ouvert 24h/24 pour 2 jours d&#039;immersion&lt;/p&gt;\\r\\n      &lt;/div&gt;\\r\\n      &lt;div class=&quot;item col-4 col-xs-12&quot;&gt;\\r\\n        &lt;span class=&quot;icon&quot;&gt;\\r\\n        \\t&lt;img src=&quot;../uploads/images/pages/home/euro-icon.svg&quot; alt=&quot;Accès gratuit aux étudiants&quot; /&gt;\\r\\n        &lt;/span&gt;\\r\\n        &lt;p&gt;Gratuit pour les étudiants&lt;/p&gt;\\r\\n      &lt;/div&gt;\\r\\n      &lt;div class=&quot;item col-4 col-xs-12&quot;&gt;\\r\\n        &lt;span class=&quot;icon&quot;&gt;\\r\\n        \\t&lt;img src=&quot;../uploads/images/pages/home/meal-icon.svg&quot; alt=&quot;Repas offert aux participants&quot; /&gt;\\r\\n        &lt;/span&gt;\\r\\n        &lt;p&gt;Repas inclus&lt;/p&gt;\\r\\n      &lt;/div&gt;\\r\\n  &lt;/div&gt;\\r\\n&lt;/section&gt;\"]', '[\"=> Startup Weekend Impact - Cergy-Pontoise\"]', '[\"\"]', 1),
(2, '[\"Mentions légales\"]', 'mentions-legales', 'mentions-legales', 1, 1, '[\"Contenu à ajouter\"]', '[\"Startup Weekend Impact - Mentions légales du site\"]', '[\"\"]', 0),
(3, '[\"Politique de confidentialité\"]', 'politique-confidentialite', 'politique-de-confidentialite', 1, 1, '[\"Contenu à ajouter\"]', '[\"Startup Weekend Impact - Politique de confidentialité\"]', '[\"\"]', 0),
(4, '[\"Partenaires\"]', 'partenaires', 'partenaires', 0, 1, '[\"&lt;section class=&quot;text-center padding-vertical-on-sm&quot;&gt;\\r\\n  &lt;h1 class=&quot;text-center margin-none&quot;&gt;Ils nous soutiennent&lt;/h1&gt;\\r\\n&lt;/section&gt;\\r\\n\\r\\n&lt;section class=&quot;panel bg-primary padding-all-on-sm&quot;&gt;\\r\\n  &lt;h2 class=&quot;text-center small margin-top-none&quot;&gt;Soutenez le 1er Startup Weekend Impact Cergy-Pontoise !&lt;br /&gt;\\r\\n    Devenez Partenaires !&lt;/h2&gt;\\r\\n  &lt;p class=&quot;text-center&quot;&gt;\\r\\n    &lt;a href=&quot;&quot; rel=&quot;noopener&quot; target=&quot;_blank&quot; class=&quot;btn-primary&quot;&gt;Nous rejoindre&lt;/a&gt;\\r\\n  &lt;/p&gt;\\r\\n&lt;/section&gt;\\r\\n\\r\\n&lt;section class=&quot;partners-list padding-all-no-sm container&quot;&gt;\\r\\n  &lt;div class=&quot;item&quot;&gt;\\r\\n    &lt;img src=&quot;../uploads/images/pages/partners/cergy-paris-univ.jpg&quot; alt=&quot;Cergy Paris Université&quot; /&gt;\\r\\n  &lt;/div&gt;\\r\\n  &lt;div class=&quot;item&quot;&gt;\\r\\n    &lt;img src=&quot;../uploads/images/pages/partners/pepite-france.jpg&quot; alt=&quot;Pépite France&quot; /&gt;\\r\\n  &lt;/div&gt;\\r\\n  &lt;div class=&quot;item&quot;&gt;\\r\\n    &lt;img src=&quot;../uploads/images/pages/partners/cy-entreprendre.jpg&quot; alt=&quot;CY Entreprendre&quot; /&gt;\\r\\n  &lt;/div&gt;\\r\\n  &lt;div class=&quot;item&quot;&gt;\\r\\n    &lt;img src=&quot;../uploads/images/pages/partners/logo-esiee.jpg&quot; alt=&quot;ESIEE-IT&quot; /&gt;\\r\\n  &lt;/div&gt;\\r\\n  &lt;div class=&quot;item&quot;&gt;\\r\\n    &lt;img src=&quot;../uploads/images/pages/partners/techstarts.jpg&quot; alt=&quot;Techstars&quot; /&gt;\\r\\n  &lt;/div&gt;\\r\\n  &lt;div class=&quot;item&quot;&gt;\\r\\n    &lt;img src=&quot;../uploads/images/pages/partners/mgen.jpg&quot; alt=&quot;MGEN&quot; /&gt;\\r\\n  &lt;/div&gt;\\r\\n  &lt;div class=&quot;item&quot;&gt;\\r\\n    &lt;img src=&quot;../uploads/images/pages/partners/cergy-agglo.jpg&quot; alt=&quot;Cergy-Pontoise Agglo&quot; /&gt;\\r\\n  &lt;/div&gt;\\r\\n&lt;/section&gt;\"]', '[\"Partenaires\"]', '[\"\"]', 0),
(5, '[\"FAQ\"]', 'faq', 'faq', 0, 1, '[\"&lt;section class=&quot;padding-vertical-on-sm bg-gray&quot;&gt;\\r\\n  &lt;h1 class=&quot;text-center margin-none&quot;&gt;Notre FAQ&lt;/h1&gt;\\r\\n&lt;/section&gt;\\r\\n&lt;section class=&quot;container margin-vertical-on-sm&quot;&gt;\\r\\n  &lt;div class=&quot;faq-block&quot;&gt;\\r\\n    &lt;h2&gt;Titre de la question&lt;/h2&gt;\\r\\n    &lt;p&gt;Contenu de la réponse&lt;/p&gt;\\r\\n  &lt;/div&gt;\\r\\n  &lt;div class=&quot;faq-block&quot;&gt;\\r\\n    &lt;h2&gt;Titre de la question&lt;/h2&gt;\\r\\n    &lt;p&gt;Contenu de la réponse&lt;/p&gt;\\r\\n  &lt;/div&gt;\\r\\n  &lt;div class=&quot;faq-block&quot;&gt;\\r\\n    &lt;h2&gt;Titre de la question&lt;/h2&gt;\\r\\n    &lt;p&gt;Contenu de la réponse&lt;/p&gt;\\r\\n  &lt;/div&gt;\\r\\n  &lt;div class=&quot;faq-block&quot;&gt;\\r\\n    &lt;h2&gt;Titre de la question&lt;/h2&gt;\\r\\n    &lt;p&gt;Contenu de la réponse&lt;/p&gt;\\r\\n  &lt;/div&gt;\\r\\n&lt;/section&gt;\"]', '[\"FAQ - Startup Weekend Impact\"]', '[\"\"]', 0),
(6, '[\"Accès et contact\"]', 'contact', 'contact', 0, 1, '[\"&lt;!-- Titre --&gt;\\r\\n&lt;section class=&quot;padding-vertical-on-sm&quot;&gt;\\r\\n  &lt;h1 class=&quot;text-center margin-none&quot;&gt;Accès et contact&lt;/h1&gt;\\r\\n&lt;/section&gt;\\r\\n\\r\\n&lt;!-- Accès --&gt;\\r\\n&lt;section class=&quot;acces panel padding-bottom-on-sm&quot;&gt;\\r\\n  &lt;div class=&quot;row&quot;&gt;\\r\\n    &lt;div class=&quot;col-6 col-sm-12&quot;&gt;\\r\\n      &lt;div class=&quot;padding-all-no-sm&quot;&gt;\\r\\n        &lt;h2 class=&quot;margin-top-none&quot;&gt;Comment venir à l&#039;évent ?&lt;/h2&gt;\\r\\n        &lt;p&gt;La Startup Weekend se déroule dans le locaux de ESIEE-IT au sein du Lab Innov.&lt;/p&gt;\\r\\n        &lt;p&gt;8 Rue Pierre de Coubertin&lt;br /&gt;\\r\\n          95300 Pontoise&lt;/p&gt;\\r\\n        &lt;p&gt;\\r\\n          &lt;a class=&quot;btn-primary&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot; href=&quot;https://www.google.com/maps/dir//ESIEE-IT+%C3%A9cole+d&#039;ing%C3%A9nieurs+et+de+l&#039;expertise+num%C3%A9rique,+8+Rue+Pierre+de+Coubertin,+95300+Pontoise/@49.0438794,2.0808018,17z/data=!3m1!5s0x47e6f51617534c67:0x452a03d3f901bb44!4m17!1m7!3m6!1s0x47e6f5167ed1fa4d:0x4ab1437024ece330!2sESIEE-IT+%C3%A9cole+d&#039;ing%C3%A9nieurs+et+de+l&#039;expertise+num%C3%A9rique!8m2!3d49.0438759!4d2.0833767!16s%2Fm%2F03h4_wp!4m8!1m0!1m5!1m1!1s0x47e6f5167ed1fa4d:0x4ab1437024ece330!2m2!1d2.0833767!2d49.0438759!3e3?hl=fr&amp;entry=ttu&quot;&gt;Voir l&#039;itinéraire&lt;/a&gt;\\r\\n        &lt;/p&gt;\\r\\n      &lt;/div&gt;\\r\\n    &lt;/div&gt;\\r\\n    &lt;div class=&quot;col-6 col-sm-12&quot;&gt;\\r\\n      &lt;figure id=&quot;map&quot; class=&quot;position-relative wd-100 ht-100&quot;&gt;\\r\\n      \\t&lt;img src=&quot;../uploads/images/pages/contact/map.png&quot; alt=&quot;Nous localiser sur Google Maps - 8 Rue Pierre de Coubertin 95300 Pontoise&quot; class=&quot;wd-100 ht-100&quot; /&gt;\\r\\n      &lt;/figure&gt;\\r\\n    &lt;/div&gt;\\r\\n  &lt;/div&gt;\\r\\n&lt;/section&gt;\"]', '[\"Accès et Contact - Startup Weekend Impact\"]', '[\"\"]', 0);

-- --------------------------------------------------------

--
-- Structure de la table `posts_list`
--

DROP TABLE IF EXISTS `posts_list`;
CREATE TABLE IF NOT EXISTS `posts_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `post_name` json NOT NULL,
  `post_content` json NOT NULL,
  `post_meta_title` json NOT NULL,
  `post_meta_desc` json DEFAULT NULL,
  `post_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `online` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_FE98C1A1F675F31B` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reset_password_request`
--

DROP TABLE IF EXISTS `reset_password_request`;
CREATE TABLE IF NOT EXISTS `reset_password_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `selector` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_7CE748AA76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `lastname`, `firstname`, `is_verified`) VALUES
(1, 'contact@creative-eye.fr', '[\"ROLE_ADMIN\"]', '$2y$13$6XrVzyu11DZPIIp.D6f..e9b5dsUm4aYVe/Jo0MLrnzsZPg8nGuey', 'RIFA', 'Kévin', 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `menu_link`
--
ALTER TABLE `menu_link`
  ADD CONSTRAINT `FK_FEE369BF257F1FCF` FOREIGN KEY (`menu_link_id`) REFERENCES `menu_link` (`id`),
  ADD CONSTRAINT `FK_FEE369BF4B89032C` FOREIGN KEY (`post_id`) REFERENCES `posts_list` (`id`),
  ADD CONSTRAINT `FK_FEE369BF727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `menu_link` (`id`),
  ADD CONSTRAINT `FK_FEE369BFC4663E4` FOREIGN KEY (`page_id`) REFERENCES `pages_list` (`id`),
  ADD CONSTRAINT `FK_FEE369BFCCD7E912` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`);

--
-- Contraintes pour la table `posts_list`
--
ALTER TABLE `posts_list`
  ADD CONSTRAINT `FK_FE98C1A1F675F31B` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
