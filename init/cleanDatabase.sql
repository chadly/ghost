CREATE DATABASE `ghost` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ghost`;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accesstokens`
--

DROP TABLE IF EXISTS `accesstokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accesstokens` (
  `id` varchar(24) NOT NULL,
  `token` varchar(191) NOT NULL,
  `user_id` varchar(24) NOT NULL,
  `client_id` varchar(24) NOT NULL,
  `issued_by` varchar(24) DEFAULT NULL,
  `expires` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accesstokens_token_unique` (`token`),
  KEY `accesstokens_user_id_foreign` (`user_id`),
  KEY `accesstokens_client_id_foreign` (`client_id`),
  CONSTRAINT `accesstokens_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `accesstokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accesstokens`
--

LOCK TABLES `accesstokens` WRITE;
/*!40000 ALTER TABLE `accesstokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `accesstokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_fields`
--

DROP TABLE IF EXISTS `app_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_fields` (
  `id` varchar(24) NOT NULL,
  `key` varchar(50) NOT NULL,
  `value` text,
  `type` varchar(50) NOT NULL DEFAULT 'html',
  `app_id` varchar(24) NOT NULL,
  `relatable_id` varchar(24) NOT NULL,
  `relatable_type` varchar(50) NOT NULL DEFAULT 'posts',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_fields_app_id_foreign` (`app_id`),
  CONSTRAINT `app_fields_app_id_foreign` FOREIGN KEY (`app_id`) REFERENCES `apps` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_fields`
--

LOCK TABLES `app_fields` WRITE;
/*!40000 ALTER TABLE `app_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_settings`
--

DROP TABLE IF EXISTS `app_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_settings` (
  `id` varchar(24) NOT NULL,
  `key` varchar(50) NOT NULL,
  `value` text,
  `app_id` varchar(24) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_settings_key_unique` (`key`),
  KEY `app_settings_app_id_foreign` (`app_id`),
  CONSTRAINT `app_settings_app_id_foreign` FOREIGN KEY (`app_id`) REFERENCES `apps` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_settings`
--

LOCK TABLES `app_settings` WRITE;
/*!40000 ALTER TABLE `app_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apps`
--

DROP TABLE IF EXISTS `apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apps` (
  `id` varchar(24) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `version` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'inactive',
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `apps_name_unique` (`name`),
  UNIQUE KEY `apps_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apps`
--

LOCK TABLES `apps` WRITE;
/*!40000 ALTER TABLE `apps` DISABLE KEYS */;
/*!40000 ALTER TABLE `apps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brute`
--

DROP TABLE IF EXISTS `brute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brute` (
  `key` varchar(191) NOT NULL,
  `firstRequest` bigint(20) NOT NULL,
  `lastRequest` bigint(20) NOT NULL,
  `lifetime` bigint(20) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brute`
--

LOCK TABLES `brute` WRITE;
/*!40000 ALTER TABLE `brute` DISABLE KEYS */;
/*!40000 ALTER TABLE `brute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_trusted_domains`
--

DROP TABLE IF EXISTS `client_trusted_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_trusted_domains` (
  `id` varchar(24) NOT NULL,
  `client_id` varchar(24) NOT NULL,
  `trusted_domain` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_trusted_domains_client_id_foreign` (`client_id`),
  CONSTRAINT `client_trusted_domains_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_trusted_domains`
--

LOCK TABLES `client_trusted_domains` WRITE;
/*!40000 ALTER TABLE `client_trusted_domains` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_trusted_domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` varchar(24) NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `redirection_uri` varchar(2000) DEFAULT NULL,
  `client_uri` varchar(2000) DEFAULT NULL,
  `auth_uri` varchar(2000) DEFAULT NULL,
  `logo` varchar(2000) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'development',
  `type` varchar(50) NOT NULL DEFAULT 'ua',
  `description` varchar(2000) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clients_name_unique` (`name`),
  UNIQUE KEY `clients_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES ('59edd20709465823fcfce568','e1245f1c-0c76-495c-853a-d78c462f3803','Ghost Admin','ghost-admin','2271e4c6c212',NULL,NULL,NULL,NULL,'enabled','ua',NULL,'2017-10-23 11:27:03','1','2017-10-23 11:27:03','1'),('59edd20709465823fcfce569','01b1a5e1-e111-4672-9c6b-c8b937fec83a','Ghost Frontend','ghost-frontend','d81221e57cd2',NULL,NULL,NULL,NULL,'enabled','ua',NULL,'2017-10-23 11:27:03','1','2017-10-23 11:27:03','1'),('59edd20709465823fcfce56a','1725d333-36c2-4ba0-9c00-25334351cfc6','Ghost Scheduler','ghost-scheduler','5a0b3f08bc36',NULL,NULL,NULL,NULL,'enabled','web',NULL,'2017-10-23 11:27:03','1','2017-10-23 11:27:03','1'),('59edd20709465823fcfce56b','bf676393-9261-4af0-97e6-a1f4ee8f39e6','Ghost Backup','ghost-backup','0a7e5bc3fa1f',NULL,NULL,NULL,NULL,'enabled','web',NULL,'2017-10-23 11:27:03','1','2017-10-23 11:27:03','1');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invites`
--

DROP TABLE IF EXISTS `invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invites` (
  `id` varchar(24) NOT NULL,
  `role_id` varchar(24) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `token` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `expires` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invites_token_unique` (`token`),
  UNIQUE KEY `invites_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invites`
--

LOCK TABLES `invites` WRITE;
/*!40000 ALTER TABLE `invites` DISABLE KEYS */;
/*!40000 ALTER TABLE `invites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `currentVersion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'1-create-tables.js','init','1.15'),(2,'2-create-fixtures.js','init','1.15'),(3,'1-custom-template-post.js','1.13','1.15'),(4,'2-theme-permissions.js','1.13','1.15'),(5,'1-post-excerpt.js','1.3','1.15'),(6,'1-codeinjection-post.js','1.4','1.15'),(7,'1-og-twitter-post.js','1.5','1.15'),(8,'1-add-backup-client.js','1.7','1.15'),(9,'1-add-permissions-redirect.js','1.9','1.15');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` varchar(24) NOT NULL,
  `name` varchar(50) NOT NULL,
  `object_type` varchar(50) NOT NULL,
  `action_type` varchar(50) NOT NULL,
  `object_id` varchar(24) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES ('59edd20709465823fcfce570','Export database','db','exportContent',NULL,'2017-10-23 11:27:03','1','2017-10-23 11:27:03','1'),('59edd20709465823fcfce571','Import database','db','importContent',NULL,'2017-10-23 11:27:03','1','2017-10-23 11:27:03','1'),('59edd20709465823fcfce572','Delete all content','db','deleteAllContent',NULL,'2017-10-23 11:27:03','1','2017-10-23 11:27:03','1'),('59edd20709465823fcfce573','Send mail','mail','send',NULL,'2017-10-23 11:27:03','1','2017-10-23 11:27:03','1'),('59edd20709465823fcfce574','Browse notifications','notification','browse',NULL,'2017-10-23 11:27:03','1','2017-10-23 11:27:03','1'),('59edd20709465823fcfce575','Add notifications','notification','add',NULL,'2017-10-23 11:27:03','1','2017-10-23 11:27:03','1'),('59edd20709465823fcfce576','Delete notifications','notification','destroy',NULL,'2017-10-23 11:27:03','1','2017-10-23 11:27:03','1'),('59edd20709465823fcfce577','Browse posts','post','browse',NULL,'2017-10-23 11:27:03','1','2017-10-23 11:27:03','1'),('59edd20709465823fcfce578','Read posts','post','read',NULL,'2017-10-23 11:27:03','1','2017-10-23 11:27:03','1'),('59edd20709465823fcfce579','Edit posts','post','edit',NULL,'2017-10-23 11:27:03','1','2017-10-23 11:27:03','1'),('59edd20709465823fcfce57a','Add posts','post','add',NULL,'2017-10-23 11:27:03','1','2017-10-23 11:27:03','1'),('59edd20709465823fcfce57b','Delete posts','post','destroy',NULL,'2017-10-23 11:27:03','1','2017-10-23 11:27:03','1'),('59edd20709465823fcfce57c','Browse settings','setting','browse',NULL,'2017-10-23 11:27:03','1','2017-10-23 11:27:03','1'),('59edd20809465823fcfce57d','Read settings','setting','read',NULL,'2017-10-23 11:27:04','1','2017-10-23 11:27:04','1'),('59edd20809465823fcfce57e','Edit settings','setting','edit',NULL,'2017-10-23 11:27:04','1','2017-10-23 11:27:04','1'),('59edd20809465823fcfce57f','Generate slugs','slug','generate',NULL,'2017-10-23 11:27:04','1','2017-10-23 11:27:04','1'),('59edd20809465823fcfce580','Browse tags','tag','browse',NULL,'2017-10-23 11:27:04','1','2017-10-23 11:27:04','1'),('59edd20809465823fcfce581','Read tags','tag','read',NULL,'2017-10-23 11:27:04','1','2017-10-23 11:27:04','1'),('59edd20809465823fcfce582','Edit tags','tag','edit',NULL,'2017-10-23 11:27:04','1','2017-10-23 11:27:04','1'),('59edd20809465823fcfce583','Add tags','tag','add',NULL,'2017-10-23 11:27:04','1','2017-10-23 11:27:04','1'),('59edd20809465823fcfce584','Delete tags','tag','destroy',NULL,'2017-10-23 11:27:04','1','2017-10-23 11:27:04','1'),('59edd20809465823fcfce585','Browse themes','theme','browse',NULL,'2017-10-23 11:27:04','1','2017-10-23 11:27:04','1'),('59edd20809465823fcfce586','Edit themes','theme','edit',NULL,'2017-10-23 11:27:04','1','2017-10-23 11:27:04','1'),('59edd20809465823fcfce587','Activate themes','theme','activate',NULL,'2017-10-23 11:27:04','1','2017-10-23 11:27:04','1'),('59edd20809465823fcfce588','Upload themes','theme','add',NULL,'2017-10-23 11:27:04','1','2017-10-23 11:27:04','1'),('59edd20809465823fcfce589','Download themes','theme','read',NULL,'2017-10-23 11:27:04','1','2017-10-23 11:27:04','1'),('59edd20809465823fcfce58a','Delete themes','theme','destroy',NULL,'2017-10-23 11:27:04','1','2017-10-23 11:27:04','1'),('59edd20809465823fcfce58b','Browse users','user','browse',NULL,'2017-10-23 11:27:04','1','2017-10-23 11:27:04','1'),('59edd20809465823fcfce58c','Read users','user','read',NULL,'2017-10-23 11:27:04','1','2017-10-23 11:27:04','1'),('59edd20809465823fcfce58d','Edit users','user','edit',NULL,'2017-10-23 11:27:04','1','2017-10-23 11:27:04','1'),('59edd20809465823fcfce58e','Add users','user','add',NULL,'2017-10-23 11:27:04','1','2017-10-23 11:27:04','1'),('59edd20809465823fcfce58f','Delete users','user','destroy',NULL,'2017-10-23 11:27:04','1','2017-10-23 11:27:04','1'),('59edd20809465823fcfce590','Assign a role','role','assign',NULL,'2017-10-23 11:27:04','1','2017-10-23 11:27:04','1'),('59edd20909465823fcfce591','Browse roles','role','browse',NULL,'2017-10-23 11:27:05','1','2017-10-23 11:27:05','1'),('59edd20909465823fcfce592','Browse clients','client','browse',NULL,'2017-10-23 11:27:05','1','2017-10-23 11:27:05','1'),('59edd20909465823fcfce593','Read clients','client','read',NULL,'2017-10-23 11:27:05','1','2017-10-23 11:27:05','1'),('59edd20909465823fcfce594','Edit clients','client','edit',NULL,'2017-10-23 11:27:05','1','2017-10-23 11:27:05','1'),('59edd20909465823fcfce595','Add clients','client','add',NULL,'2017-10-23 11:27:05','1','2017-10-23 11:27:05','1'),('59edd20909465823fcfce596','Delete clients','client','destroy',NULL,'2017-10-23 11:27:05','1','2017-10-23 11:27:05','1'),('59edd20909465823fcfce597','Browse subscribers','subscriber','browse',NULL,'2017-10-23 11:27:05','1','2017-10-23 11:27:05','1'),('59edd20909465823fcfce598','Read subscribers','subscriber','read',NULL,'2017-10-23 11:27:05','1','2017-10-23 11:27:05','1'),('59edd20909465823fcfce599','Edit subscribers','subscriber','edit',NULL,'2017-10-23 11:27:05','1','2017-10-23 11:27:05','1'),('59edd20909465823fcfce59a','Add subscribers','subscriber','add',NULL,'2017-10-23 11:27:05','1','2017-10-23 11:27:05','1'),('59edd20909465823fcfce59b','Delete subscribers','subscriber','destroy',NULL,'2017-10-23 11:27:05','1','2017-10-23 11:27:05','1'),('59edd20909465823fcfce59c','Browse invites','invite','browse',NULL,'2017-10-23 11:27:05','1','2017-10-23 11:27:05','1'),('59edd20909465823fcfce59d','Read invites','invite','read',NULL,'2017-10-23 11:27:05','1','2017-10-23 11:27:05','1'),('59edd20909465823fcfce59e','Edit invites','invite','edit',NULL,'2017-10-23 11:27:05','1','2017-10-23 11:27:05','1'),('59edd20909465823fcfce59f','Add invites','invite','add',NULL,'2017-10-23 11:27:05','1','2017-10-23 11:27:05','1'),('59edd20909465823fcfce5a0','Delete invites','invite','destroy',NULL,'2017-10-23 11:27:05','1','2017-10-23 11:27:05','1'),('59edd20909465823fcfce5a1','Download redirects','redirect','download',NULL,'2017-10-23 11:27:05','1','2017-10-23 11:27:05','1'),('59edd20909465823fcfce5a2','Upload redirects','redirect','upload',NULL,'2017-10-23 11:27:05','1','2017-10-23 11:27:05','1');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions_apps`
--

DROP TABLE IF EXISTS `permissions_apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions_apps` (
  `id` varchar(24) NOT NULL,
  `app_id` varchar(24) NOT NULL,
  `permission_id` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions_apps`
--

LOCK TABLES `permissions_apps` WRITE;
/*!40000 ALTER TABLE `permissions_apps` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions_apps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions_roles`
--

DROP TABLE IF EXISTS `permissions_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions_roles` (
  `id` varchar(24) NOT NULL,
  `role_id` varchar(24) NOT NULL,
  `permission_id` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions_roles`
--

LOCK TABLES `permissions_roles` WRITE;
/*!40000 ALTER TABLE `permissions_roles` DISABLE KEYS */;
INSERT INTO `permissions_roles` VALUES ('59edd20a09465823fcfce5a4','59edd20709465823fcfce56c','59edd20709465823fcfce570'),('59edd20a09465823fcfce5a5','59edd20709465823fcfce56c','59edd20709465823fcfce571'),('59edd20a09465823fcfce5a6','59edd20709465823fcfce56c','59edd20709465823fcfce572'),('59edd20a09465823fcfce5a7','59edd20709465823fcfce56c','59edd20709465823fcfce573'),('59edd20a09465823fcfce5a8','59edd20709465823fcfce56c','59edd20709465823fcfce574'),('59edd20a09465823fcfce5a9','59edd20709465823fcfce56c','59edd20709465823fcfce575'),('59edd20a09465823fcfce5aa','59edd20709465823fcfce56c','59edd20709465823fcfce576'),('59edd20a09465823fcfce5ab','59edd20709465823fcfce56c','59edd20709465823fcfce577'),('59edd20a09465823fcfce5ac','59edd20709465823fcfce56c','59edd20709465823fcfce578'),('59edd20a09465823fcfce5ad','59edd20709465823fcfce56c','59edd20709465823fcfce579'),('59edd20a09465823fcfce5ae','59edd20709465823fcfce56c','59edd20709465823fcfce57a'),('59edd20a09465823fcfce5af','59edd20709465823fcfce56c','59edd20709465823fcfce57b'),('59edd20b09465823fcfce5b0','59edd20709465823fcfce56c','59edd20709465823fcfce57c'),('59edd20b09465823fcfce5b1','59edd20709465823fcfce56c','59edd20809465823fcfce57d'),('59edd20b09465823fcfce5b2','59edd20709465823fcfce56c','59edd20809465823fcfce57e'),('59edd20b09465823fcfce5b3','59edd20709465823fcfce56c','59edd20809465823fcfce57f'),('59edd20b09465823fcfce5b4','59edd20709465823fcfce56c','59edd20809465823fcfce580'),('59edd20b09465823fcfce5b5','59edd20709465823fcfce56c','59edd20809465823fcfce581'),('59edd20b09465823fcfce5b6','59edd20709465823fcfce56c','59edd20809465823fcfce582'),('59edd20b09465823fcfce5b7','59edd20709465823fcfce56c','59edd20809465823fcfce583'),('59edd20b09465823fcfce5b8','59edd20709465823fcfce56c','59edd20809465823fcfce584'),('59edd20b09465823fcfce5b9','59edd20709465823fcfce56c','59edd20809465823fcfce585'),('59edd20b09465823fcfce5ba','59edd20709465823fcfce56c','59edd20809465823fcfce586'),('59edd20b09465823fcfce5bb','59edd20709465823fcfce56c','59edd20809465823fcfce587'),('59edd20b09465823fcfce5bc','59edd20709465823fcfce56c','59edd20809465823fcfce588'),('59edd20b09465823fcfce5bd','59edd20709465823fcfce56c','59edd20809465823fcfce589'),('59edd20b09465823fcfce5be','59edd20709465823fcfce56c','59edd20809465823fcfce58a'),('59edd20b09465823fcfce5bf','59edd20709465823fcfce56c','59edd20809465823fcfce58b'),('59edd20b09465823fcfce5c0','59edd20709465823fcfce56c','59edd20809465823fcfce58c'),('59edd20b09465823fcfce5c1','59edd20709465823fcfce56c','59edd20809465823fcfce58d'),('59edd20b09465823fcfce5c2','59edd20709465823fcfce56c','59edd20809465823fcfce58e'),('59edd20b09465823fcfce5c3','59edd20709465823fcfce56c','59edd20809465823fcfce58f'),('59edd20b09465823fcfce5c4','59edd20709465823fcfce56c','59edd20809465823fcfce590'),('59edd20b09465823fcfce5c5','59edd20709465823fcfce56c','59edd20909465823fcfce591'),('59edd20c09465823fcfce5c6','59edd20709465823fcfce56c','59edd20909465823fcfce592'),('59edd20c09465823fcfce5c7','59edd20709465823fcfce56c','59edd20909465823fcfce593'),('59edd20c09465823fcfce5c8','59edd20709465823fcfce56c','59edd20909465823fcfce594'),('59edd20c09465823fcfce5c9','59edd20709465823fcfce56c','59edd20909465823fcfce595'),('59edd20c09465823fcfce5ca','59edd20709465823fcfce56c','59edd20909465823fcfce596'),('59edd20c09465823fcfce5cb','59edd20709465823fcfce56c','59edd20909465823fcfce597'),('59edd20c09465823fcfce5cc','59edd20709465823fcfce56c','59edd20909465823fcfce598'),('59edd20c09465823fcfce5cd','59edd20709465823fcfce56c','59edd20909465823fcfce599'),('59edd20c09465823fcfce5ce','59edd20709465823fcfce56c','59edd20909465823fcfce59a'),('59edd20c09465823fcfce5cf','59edd20709465823fcfce56c','59edd20909465823fcfce59b'),('59edd20c09465823fcfce5d0','59edd20709465823fcfce56c','59edd20909465823fcfce59c'),('59edd20c09465823fcfce5d1','59edd20709465823fcfce56c','59edd20909465823fcfce59d'),('59edd20c09465823fcfce5d2','59edd20709465823fcfce56c','59edd20909465823fcfce59e'),('59edd20c09465823fcfce5d3','59edd20709465823fcfce56c','59edd20909465823fcfce59f'),('59edd20c09465823fcfce5d4','59edd20709465823fcfce56c','59edd20909465823fcfce5a0'),('59edd20c09465823fcfce5d5','59edd20709465823fcfce56c','59edd20909465823fcfce5a1'),('59edd20c09465823fcfce5d6','59edd20709465823fcfce56c','59edd20909465823fcfce5a2'),('59edd20c09465823fcfce5d7','59edd20709465823fcfce56d','59edd20709465823fcfce577'),('59edd20c09465823fcfce5d8','59edd20709465823fcfce56d','59edd20709465823fcfce578'),('59edd20c09465823fcfce5d9','59edd20709465823fcfce56d','59edd20709465823fcfce579'),('59edd20c09465823fcfce5da','59edd20709465823fcfce56d','59edd20709465823fcfce57a'),('59edd20c09465823fcfce5db','59edd20709465823fcfce56d','59edd20709465823fcfce57b'),('59edd20c09465823fcfce5dc','59edd20709465823fcfce56d','59edd20709465823fcfce57c'),('59edd20c09465823fcfce5dd','59edd20709465823fcfce56d','59edd20809465823fcfce57d'),('59edd20c09465823fcfce5de','59edd20709465823fcfce56d','59edd20809465823fcfce57f'),('59edd20c09465823fcfce5df','59edd20709465823fcfce56d','59edd20809465823fcfce580'),('59edd20c09465823fcfce5e0','59edd20709465823fcfce56d','59edd20809465823fcfce581'),('59edd20c09465823fcfce5e1','59edd20709465823fcfce56d','59edd20809465823fcfce582'),('59edd20c09465823fcfce5e2','59edd20709465823fcfce56d','59edd20809465823fcfce583'),('59edd20c09465823fcfce5e3','59edd20709465823fcfce56d','59edd20809465823fcfce584'),('59edd20d09465823fcfce5e4','59edd20709465823fcfce56d','59edd20809465823fcfce58b'),('59edd20d09465823fcfce5e5','59edd20709465823fcfce56d','59edd20809465823fcfce58c'),('59edd20d09465823fcfce5e6','59edd20709465823fcfce56d','59edd20809465823fcfce58d'),('59edd20d09465823fcfce5e7','59edd20709465823fcfce56d','59edd20809465823fcfce58e'),('59edd20d09465823fcfce5e8','59edd20709465823fcfce56d','59edd20809465823fcfce58f'),('59edd20d09465823fcfce5e9','59edd20709465823fcfce56d','59edd20809465823fcfce590'),('59edd20d09465823fcfce5ea','59edd20709465823fcfce56d','59edd20909465823fcfce591'),('59edd20d09465823fcfce5eb','59edd20709465823fcfce56d','59edd20909465823fcfce592'),('59edd20d09465823fcfce5ec','59edd20709465823fcfce56d','59edd20909465823fcfce593'),('59edd20d09465823fcfce5ed','59edd20709465823fcfce56d','59edd20909465823fcfce594'),('59edd20d09465823fcfce5ee','59edd20709465823fcfce56d','59edd20909465823fcfce595'),('59edd20d09465823fcfce5ef','59edd20709465823fcfce56d','59edd20909465823fcfce596'),('59edd20d09465823fcfce5f0','59edd20709465823fcfce56d','59edd20909465823fcfce59a'),('59edd20d09465823fcfce5f1','59edd20709465823fcfce56d','59edd20909465823fcfce59c'),('59edd20d09465823fcfce5f2','59edd20709465823fcfce56d','59edd20909465823fcfce59d'),('59edd20d09465823fcfce5f3','59edd20709465823fcfce56d','59edd20909465823fcfce59e'),('59edd20d09465823fcfce5f4','59edd20709465823fcfce56d','59edd20909465823fcfce59f'),('59edd20d09465823fcfce5f5','59edd20709465823fcfce56d','59edd20909465823fcfce5a0'),('59edd20d09465823fcfce5f6','59edd20709465823fcfce56d','59edd20809465823fcfce585'),('59edd20d09465823fcfce5f7','59edd20709465823fcfce56e','59edd20709465823fcfce577'),('59edd20d09465823fcfce5f8','59edd20709465823fcfce56e','59edd20709465823fcfce578'),('59edd20d09465823fcfce5f9','59edd20709465823fcfce56e','59edd20709465823fcfce57a'),('59edd20e09465823fcfce5fa','59edd20709465823fcfce56e','59edd20709465823fcfce57c'),('59edd20e09465823fcfce5fb','59edd20709465823fcfce56e','59edd20809465823fcfce57d'),('59edd20e09465823fcfce5fc','59edd20709465823fcfce56e','59edd20809465823fcfce57f'),('59edd20e09465823fcfce5fd','59edd20709465823fcfce56e','59edd20809465823fcfce580'),('59edd20e09465823fcfce5fe','59edd20709465823fcfce56e','59edd20809465823fcfce581'),('59edd20e09465823fcfce5ff','59edd20709465823fcfce56e','59edd20809465823fcfce583'),('59edd20e09465823fcfce600','59edd20709465823fcfce56e','59edd20809465823fcfce58b'),('59edd20e09465823fcfce601','59edd20709465823fcfce56e','59edd20809465823fcfce58c'),('59edd20e09465823fcfce602','59edd20709465823fcfce56e','59edd20909465823fcfce591'),('59edd20e09465823fcfce603','59edd20709465823fcfce56e','59edd20909465823fcfce592'),('59edd20e09465823fcfce604','59edd20709465823fcfce56e','59edd20909465823fcfce593'),('59edd20e09465823fcfce605','59edd20709465823fcfce56e','59edd20909465823fcfce594'),('59edd20e09465823fcfce606','59edd20709465823fcfce56e','59edd20909465823fcfce595'),('59edd20e09465823fcfce607','59edd20709465823fcfce56e','59edd20909465823fcfce596'),('59edd20e09465823fcfce608','59edd20709465823fcfce56e','59edd20909465823fcfce59a'),('59edd20e09465823fcfce609','59edd20709465823fcfce56e','59edd20809465823fcfce585');
/*!40000 ALTER TABLE `permissions_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions_users`
--

DROP TABLE IF EXISTS `permissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions_users` (
  `id` varchar(24) NOT NULL,
  `user_id` varchar(24) NOT NULL,
  `permission_id` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions_users`
--

LOCK TABLES `permissions_users` WRITE;
/*!40000 ALTER TABLE `permissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` varchar(24) NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `title` varchar(2000) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `mobiledoc` longtext,
  `html` longtext,
  `amp` longtext,
  `plaintext` longtext,
  `feature_image` varchar(2000) DEFAULT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `page` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(50) NOT NULL DEFAULT 'draft',
  `locale` varchar(6) DEFAULT NULL,
  `visibility` varchar(50) NOT NULL DEFAULT 'public',
  `meta_title` varchar(2000) DEFAULT NULL,
  `meta_description` varchar(2000) DEFAULT NULL,
  `author_id` varchar(24) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `published_by` varchar(24) DEFAULT NULL,
  `custom_excerpt` varchar(2000) DEFAULT NULL,
  `codeinjection_head` text,
  `codeinjection_foot` text,
  `og_image` varchar(2000) DEFAULT NULL,
  `og_title` varchar(300) DEFAULT NULL,
  `og_description` varchar(500) DEFAULT NULL,
  `twitter_image` varchar(2000) DEFAULT NULL,
  `twitter_title` varchar(300) DEFAULT NULL,
  `twitter_description` varchar(500) DEFAULT NULL,
  `custom_template` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES ('59edd20509465823fcfce560','d6d888c9-af02-4ead-8595-c7338ce9b999','Setting up your own Ghost theme','themes','{\"version\":\"0.3.1\",\"markups\":[],\"atoms\":[],\"cards\":[[\"card-markdown\",{\"cardName\":\"card-markdown\",\"markdown\":\"Creating a totally custom design for your publication\\n\\nGhost comes with a beautiful default theme called Casper, which is designed to be a clean, readable publication layout and can be easily adapted for most purposes. However, Ghost can also be completely themed to suit your needs. Rather than just giving you a few basic settings which act as a poor proxy for code, we just let you write code.\\n\\nThere are a huge range of both free and premium pre-built themes which you can get from the [Ghost Theme Marketplace](http://marketplace.ghost.org), or you can simply create your own from scratch.\\n\\n[![marketplace](https://casper.ghost.org/v1.0.0/images/marketplace.jpg)](http://marketplace.ghost.org)\\n\\n> Anyone can write a completely custom Ghost theme, with just some solid knowledge of HTML and CSS\\n\\nGhost themes are written with a templating language called handlebars, which has a bunch of dynamic helpers to insert your data into template files. Like `{{author.name}}`, for example, outputs the name of the current author.\\n\\nThe best way to learn how to write your own Ghost theme is to have a look at [the source code for Casper](https://github.com/TryGhost/Casper), which is heavily commented and should give you a sense of how everything fits together.\\n\\n- `default.hbs` is the main template file, all contexts will load inside this file unless specifically told to use a different template.\\n- `post.hbs` is the file used in the context of viewing a post.\\n- `index.hbs` is the file used in the context of viewing the home page.\\n- and so on\\n\\nWe\'ve got [full and extensive theme documentation](http://themes.ghost.org/docs/about) which outlines every template file, context and helper that you can use.\\n\\nIf you want to chat with other people making Ghost themes to get any advice or help, there\'s also a **#themes** channel in our [public Slack community](https://slack.ghost.org) which we always recommend joining!\"}]],\"sections\":[[10,0]]}','<div class=\"kg-card-markdown\"><p>Creating a totally custom design for your publication</p>\n<p>Ghost comes with a beautiful default theme called Casper, which is designed to be a clean, readable publication layout and can be easily adapted for most purposes. However, Ghost can also be completely themed to suit your needs. Rather than just giving you a few basic settings which act as a poor proxy for code, we just let you write code.</p>\n<p>There are a huge range of both free and premium pre-built themes which you can get from the <a href=\"http://marketplace.ghost.org\">Ghost Theme Marketplace</a>, or you can simply create your own from scratch.</p>\n<p><a href=\"http://marketplace.ghost.org\"><img src=\"https://casper.ghost.org/v1.0.0/images/marketplace.jpg\" alt=\"marketplace\"></a></p>\n<blockquote>\n<p>Anyone can write a completely custom Ghost theme, with just some solid knowledge of HTML and CSS</p>\n</blockquote>\n<p>Ghost themes are written with a templating language called handlebars, which has a bunch of dynamic helpers to insert your data into template files. Like <code>{{author.name}}</code>, for example, outputs the name of the current author.</p>\n<p>The best way to learn how to write your own Ghost theme is to have a look at <a href=\"https://github.com/TryGhost/Casper\">the source code for Casper</a>, which is heavily commented and should give you a sense of how everything fits together.</p>\n<ul>\n<li><code>default.hbs</code> is the main template file, all contexts will load inside this file unless specifically told to use a different template.</li>\n<li><code>post.hbs</code> is the file used in the context of viewing a post.</li>\n<li><code>index.hbs</code> is the file used in the context of viewing the home page.</li>\n<li>and so on</li>\n</ul>\n<p>We\'ve got <a href=\"http://themes.ghost.org/docs/about\">full and extensive theme documentation</a> which outlines every template file, context and helper that you can use.</p>\n<p>If you want to chat with other people making Ghost themes to get any advice or help, there\'s also a <strong>#themes</strong> channel in our <a href=\"https://slack.ghost.org\">public Slack community</a> which we always recommend joining!</p>\n</div>',NULL,'Creating a totally custom design for your publication\n\nGhost comes with a beautiful default theme called Casper, which is designed to\nbe a clean, readable publication layout and can be easily adapted for most\npurposes. However, Ghost can also be completely themed to suit your needs.\nRather than just giving you a few basic settings which act as a poor proxy for\ncode, we just let you write code.\n\nThere are a huge range of both free and premium pre-built themes which you can\nget from the Ghost Theme Marketplace [http://marketplace.ghost.org], or you can\nsimply create your own from scratch.\n\n  [http://marketplace.ghost.org]\n\nAnyone can write a completely custom Ghost theme, with just some solid knowledge\nof HTML and CSS\n\nGhost themes are written with a templating language called handlebars, which has\na bunch of dynamic helpers to insert your data into template files. Like \n{{author.name}}, for example, outputs the name of the current author.\n\nThe best way to learn how to write your own Ghost theme is to have a look at \nthe\nsource code for Casper [https://github.com/TryGhost/Casper], which is heavily\ncommented and should give you a sense of how everything fits together.\n\n * default.hbs  is the main template file, all contexts will load inside this\n   file unless specifically told to use a different template.\n * post.hbs  is the file used in the context of viewing a post.\n * index.hbs  is the file used in the context of viewing the home page.\n * and so on\n\nWe\'ve got full and extensive theme documentation\n[http://themes.ghost.org/docs/about]  which outlines every template file,\ncontext and helper that you can use.\n\nIf you want to chat with other people making Ghost themes to get any advice or\nhelp, there\'s also a #themes  channel in our public Slack community\n[https://slack.ghost.org]  which we always recommend joining!','https://casper.ghost.org/v1.0.0/images/design.jpg',0,0,'published',NULL,'public',NULL,NULL,'5951f5fca366002ebd5dbef7','2017-10-23 11:27:01','1','2017-10-23 11:27:01','1','2017-10-23 11:27:01','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('59edd20609465823fcfce561','36347527-3756-415d-9df4-ffb731f79478','Advanced Markdown tips','advanced-markdown','{\"version\":\"0.3.1\",\"markups\":[],\"atoms\":[],\"cards\":[[\"card-markdown\",{\"cardName\":\"card-markdown\",\"markdown\":\"There are lots of powerful things you can do with the Ghost editor\\n\\nIf you\'ve gotten pretty comfortable with [all the basics](/the-editor/) of writing in Ghost, then you may enjoy some more advanced tips about the types of things you can do with Markdown!\\n\\nAs with the last post about the editor, you\'ll want to be actually editing this post as you read it so that you can see all the Markdown code we\'re using.\\n\\n\\n## Special formatting\\n\\nAs well as bold and italics, you can also use some other special formatting in Markdown when the need arises, for example:\\n\\n+ ~~strike through~~\\n+ ==highlight==\\n+ \\\\*escaped characters\\\\*\\n\\n\\n## Writing code blocks\\n\\nThere are two types of code elements which can be inserted in Markdown, the first is inline, and the other is block. Inline code is formatted by wrapping any word or words in back-ticks, `like this`. Larger snippets of code can be displayed across multiple lines using triple back ticks:\\n\\n```\\n.my-link {\\n    text-decoration: underline;\\n}\\n```\\n\\nIf you want to get really fancy, you can even add syntax highlighting using [Prism.js](http://prismjs.com/).\\n\\n\\n## Full bleed images\\n\\nOne neat trick which you can use in Markdown to distinguish between different types of images is to add a `#hash` value to the end of the source URL, and then target images containing the hash with special styling. For example:\\n\\n![walking](https://casper.ghost.org/v1.0.0/images/walking.jpg#full)\\n\\nwhich is styled with...\\n\\n```\\nimg[src$=\\\"#full\\\"] {\\n    max-width: 100vw;\\n}\\n```\\n\\nThis creates full-bleed images in the Casper theme, which stretch beyond their usual boundaries right up to the edge of the window. Every theme handles these types of things slightly differently, but it\'s a great trick to play with if you want to have a variety of image sizes and styles.\\n\\n\\n## Reference lists\\n\\n**The quick brown [fox][1], jumped over the lazy [dog][2].**\\n\\n[1]: https://en.wikipedia.org/wiki/Fox \\\"Wikipedia: Fox\\\"\\n[2]: https://en.wikipedia.org/wiki/Dog \\\"Wikipedia: Dog\\\"\\n\\nAnother way to insert links in markdown is using reference lists. You might want to use this style of linking to cite reference material in a Wikipedia-style. All of the links are listed at the end of the document, so you can maintain full separation between content and its source or reference.\\n\\n\\n## Creating footnotes\\n\\nThe quick brown fox[^1] jumped over the lazy dog[^2].\\n\\n[^1]: Foxes are red\\n[^2]: Dogs are usually not red\\n\\nFootnotes are a great way to add additional contextual details when appropriate. Ghost will automatically add footnote content to the very end of your post.\\n\\n\\n## Full HTML\\n\\nPerhaps the best part of Markdown is that you\'re never limited to just Markdown. You can write HTML directly in the Ghost editor and it will just work as HTML usually does. No limits! Here\'s a standard YouTube embed code as an example:\\n\\n<iframe width=\\\"560\\\" height=\\\"315\\\" src=\\\"https://www.youtube.com/embed/Cniqsc9QfDo?rel=0&amp;showinfo=0\\\" frameborder=\\\"0\\\" allowfullscreen></iframe>\\n\"}]],\"sections\":[[10,0]]}','<div class=\"kg-card-markdown\"><p>There are lots of powerful things you can do with the Ghost editor</p>\n<p>If you\'ve gotten pretty comfortable with <a href=\"/the-editor/\">all the basics</a> of writing in Ghost, then you may enjoy some more advanced tips about the types of things you can do with Markdown!</p>\n<p>As with the last post about the editor, you\'ll want to be actually editing this post as you read it so that you can see all the Markdown code we\'re using.</p>\n<h2 id=\"specialformatting\">Special formatting</h2>\n<p>As well as bold and italics, you can also use some other special formatting in Markdown when the need arises, for example:</p>\n<ul>\n<li><s>strike through</s></li>\n<li><mark>highlight</mark></li>\n<li>*escaped characters*</li>\n</ul>\n<h2 id=\"writingcodeblocks\">Writing code blocks</h2>\n<p>There are two types of code elements which can be inserted in Markdown, the first is inline, and the other is block. Inline code is formatted by wrapping any word or words in back-ticks, <code>like this</code>. Larger snippets of code can be displayed across multiple lines using triple back ticks:</p>\n<pre><code>.my-link {\n    text-decoration: underline;\n}\n</code></pre>\n<p>If you want to get really fancy, you can even add syntax highlighting using <a href=\"http://prismjs.com/\">Prism.js</a>.</p>\n<h2 id=\"fullbleedimages\">Full bleed images</h2>\n<p>One neat trick which you can use in Markdown to distinguish between different types of images is to add a <code>#hash</code> value to the end of the source URL, and then target images containing the hash with special styling. For example:</p>\n<p><img src=\"https://casper.ghost.org/v1.0.0/images/walking.jpg#full\" alt=\"walking\"></p>\n<p>which is styled with...</p>\n<pre><code>img[src$=&quot;#full&quot;] {\n    max-width: 100vw;\n}\n</code></pre>\n<p>This creates full-bleed images in the Casper theme, which stretch beyond their usual boundaries right up to the edge of the window. Every theme handles these types of things slightly differently, but it\'s a great trick to play with if you want to have a variety of image sizes and styles.</p>\n<h2 id=\"referencelists\">Reference lists</h2>\n<p><strong>The quick brown <a href=\"https://en.wikipedia.org/wiki/Fox\" title=\"Wikipedia: Fox\">fox</a>, jumped over the lazy <a href=\"https://en.wikipedia.org/wiki/Dog\" title=\"Wikipedia: Dog\">dog</a>.</strong></p>\n<p>Another way to insert links in markdown is using reference lists. You might want to use this style of linking to cite reference material in a Wikipedia-style. All of the links are listed at the end of the document, so you can maintain full separation between content and its source or reference.</p>\n<h2 id=\"creatingfootnotes\">Creating footnotes</h2>\n<p>The quick brown fox<sup class=\"footnote-ref\"><a href=\"#fn1\" id=\"fnref1\">[1]</a></sup> jumped over the lazy dog<sup class=\"footnote-ref\"><a href=\"#fn2\" id=\"fnref2\">[2]</a></sup>.</p>\n<p>Footnotes are a great way to add additional contextual details when appropriate. Ghost will automatically add footnote content to the very end of your post.</p>\n<h2 id=\"fullhtml\">Full HTML</h2>\n<p>Perhaps the best part of Markdown is that you\'re never limited to just Markdown. You can write HTML directly in the Ghost editor and it will just work as HTML usually does. No limits! Here\'s a standard YouTube embed code as an example:</p>\n<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Cniqsc9QfDo?rel=0&amp;showinfo=0\" frameborder=\"0\" allowfullscreen></iframe>\n<hr class=\"footnotes-sep\">\n<section class=\"footnotes\">\n<ol class=\"footnotes-list\">\n<li id=\"fn1\" class=\"footnote-item\"><p>Foxes are red <a href=\"#fnref1\" class=\"footnote-backref\">↩︎</a></p>\n</li>\n<li id=\"fn2\" class=\"footnote-item\"><p>Dogs are usually not red <a href=\"#fnref2\" class=\"footnote-backref\">↩︎</a></p>\n</li>\n</ol>\n</section>\n</div>',NULL,'There are lots of powerful things you can do with the Ghost editor\n\nIf you\'ve gotten pretty comfortable with all the basics [/the-editor/]  of\nwriting in Ghost, then you may enjoy some more advanced tips about the types of\nthings you can do with Markdown!\n\nAs with the last post about the editor, you\'ll want to be actually editing this\npost as you read it so that you can see all the Markdown code we\'re using.\n\nSpecial formatting\nAs well as bold and italics, you can also use some other special formatting in\nMarkdown when the need arises, for example:\n\n * strike through\n * highlight\n * *escaped characters*\n\nWriting code blocks\nThere are two types of code elements which can be inserted in Markdown, the\nfirst is inline, and the other is block. Inline code is formatted by wrapping\nany word or words in back-ticks, like this. Larger snippets of code can be\ndisplayed across multiple lines using triple back ticks:\n\n.my-link {\n    text-decoration: underline;\n}\n\n\nIf you want to get really fancy, you can even add syntax highlighting using \nPrism.js [http://prismjs.com/].\n\nFull bleed images\nOne neat trick which you can use in Markdown to distinguish between different\ntypes of images is to add a #hash  value to the end of the source URL, and then\ntarget images containing the hash with special styling. For example:\n\n\n\nwhich is styled with...\n\nimg[src$=\"#full\"] {\n    max-width: 100vw;\n}\n\n\nThis creates full-bleed images in the Casper theme, which stretch beyond their\nusual boundaries right up to the edge of the window. Every theme handles these\ntypes of things slightly differently, but it\'s a great trick to play with if you\nwant to have a variety of image sizes and styles.\n\nReference lists\nThe quick brown fox [https://en.wikipedia.org/wiki/Fox], jumped over the lazy \ndog [https://en.wikipedia.org/wiki/Dog].\n\nAnother way to insert links in markdown is using reference lists. You might want\nto use this style of linking to cite reference material in a Wikipedia-style.\nAll of the links are listed at the end of the document, so you can maintain full\nseparation between content and its source or reference.\n\nCreating footnotes\nThe quick brown fox[1]  jumped over the lazy dog[2].\n\nFootnotes are a great way to add additional contextual details when appropriate.\nGhost will automatically add footnote content to the very end of your post.\n\nFull HTML\nPerhaps the best part of Markdown is that you\'re never limited to just Markdown.\nYou can write HTML directly in the Ghost editor and it will just work as HTML\nusually does. No limits! Here\'s a standard YouTube embed code as an example:\n\n\n--------------------------------------------------------------------------------\n\n 1. Foxes are red ↩︎\n    \n    \n 2. Dogs are usually not red ↩︎','https://casper.ghost.org/v1.0.0/images/advanced.jpg',0,0,'published',NULL,'public',NULL,NULL,'5951f5fca366002ebd5dbef7','2017-10-23 11:27:02','1','2017-10-23 11:27:02','1','2017-10-23 11:27:02','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('59edd20609465823fcfce562','f25f783d-6aac-4d95-b89f-27bf83a6c119','Making your site private','private-sites','{\"version\":\"0.3.1\",\"markups\":[],\"atoms\":[],\"cards\":[[\"card-markdown\",{\"cardName\":\"card-markdown\",\"markdown\":\"Sometimes you might want to put your site behind closed doors\\n\\nIf you\'ve got a publication that you don\'t want the world to see yet because it\'s not ready to launch, you can hide your Ghost site behind a simple shared pass-phrase.\\n\\nYou can toggle this preference on at the bottom of Ghost\'s General Settings\\n\\n![private](https://casper.ghost.org/v1.0.0/images/private.png)\\n\\nGhost will give you a short, randomly generated pass-phrase which you can share with anyone who needs access to the site while you\'re working on it. While this setting is enabled, all search engine optimisation features will be switched off to help keep the site off the radar.\\n\\nDo remember though, this is *not* secure authentication. You shouldn\'t rely on this feature for protecting important private data. It\'s just a simple, shared pass-phrase for very basic privacy.\"}]],\"sections\":[[10,0]]}','<div class=\"kg-card-markdown\"><p>Sometimes you might want to put your site behind closed doors</p>\n<p>If you\'ve got a publication that you don\'t want the world to see yet because it\'s not ready to launch, you can hide your Ghost site behind a simple shared pass-phrase.</p>\n<p>You can toggle this preference on at the bottom of Ghost\'s General Settings</p>\n<p><img src=\"https://casper.ghost.org/v1.0.0/images/private.png\" alt=\"private\"></p>\n<p>Ghost will give you a short, randomly generated pass-phrase which you can share with anyone who needs access to the site while you\'re working on it. While this setting is enabled, all search engine optimisation features will be switched off to help keep the site off the radar.</p>\n<p>Do remember though, this is <em>not</em> secure authentication. You shouldn\'t rely on this feature for protecting important private data. It\'s just a simple, shared pass-phrase for very basic privacy.</p>\n</div>',NULL,'Sometimes you might want to put your site behind closed doors\n\nIf you\'ve got a publication that you don\'t want the world to see yet because\nit\'s not ready to launch, you can hide your Ghost site behind a simple shared\npass-phrase.\n\nYou can toggle this preference on at the bottom of Ghost\'s General Settings\n\n\n\nGhost will give you a short, randomly generated pass-phrase which you can share\nwith anyone who needs access to the site while you\'re working on it. While this\nsetting is enabled, all search engine optimisation features will be switched off\nto help keep the site off the radar.\n\nDo remember though, this is not  secure authentication. You shouldn\'t rely on\nthis feature for protecting important private data. It\'s just a simple, shared\npass-phrase for very basic privacy.','https://casper.ghost.org/v1.0.0/images/locked.jpg',0,0,'published',NULL,'public',NULL,NULL,'5951f5fca366002ebd5dbef7','2017-10-23 11:27:02','1','2017-10-23 11:27:02','1','2017-10-23 11:27:03','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('59edd20609465823fcfce563','65038df5-8658-4824-820c-2903d624b884','Managing Ghost users','managing-users','{\"version\":\"0.3.1\",\"markups\":[],\"atoms\":[],\"cards\":[[\"card-markdown\",{\"cardName\":\"card-markdown\",\"markdown\":\"Ghost has a number of different user roles for your team\\n\\n\\n### Authors\\n\\nThe base user level in Ghost is an author. Authors can write posts, edit their own posts, and publish their own posts. Authors are **trusted** users. If you don\'t trust users to be allowed to publish their own posts, you shouldn\'t invite them to Ghost admin.\\n\\n\\n### Editors\\n\\nEditors are the 2nd user level in Ghost. Editors can do everything that an Author can do, but they can also edit and publish the posts of others - as well as their own. Editors can also invite new authors to the site.\\n\\n\\n### Administrators\\n\\nThe top user level in Ghost is Administrator. Again, administrators can do everything that Authors and Editors can do, but they can also edit all site settings and data, not just content. Additionally, administrators have full access to invite, manage or remove any other user of the site.\\n\\n\\n### The Owner\\n\\nThere is only ever one owner of a Ghost site. The owner is a special user which has all the same permissions as an Administrator, but with two exceptions: The Owner can never be deleted. And in some circumstances the owner will have access to additional special settings if applicable — for example, billing details, if using Ghost(Pro).\\n\\n---\\n\\nIt\'s a good idea to ask all of your users to fill out their user profiles, including bio and social links. These will populate rich structured data for posts and generally create more opportunities for themes to fully populate their design. \"}]],\"sections\":[[10,0]]}','<div class=\"kg-card-markdown\"><p>Ghost has a number of different user roles for your team</p>\n<h3 id=\"authors\">Authors</h3>\n<p>The base user level in Ghost is an author. Authors can write posts, edit their own posts, and publish their own posts. Authors are <strong>trusted</strong> users. If you don\'t trust users to be allowed to publish their own posts, you shouldn\'t invite them to Ghost admin.</p>\n<h3 id=\"editors\">Editors</h3>\n<p>Editors are the 2nd user level in Ghost. Editors can do everything that an Author can do, but they can also edit and publish the posts of others - as well as their own. Editors can also invite new authors to the site.</p>\n<h3 id=\"administrators\">Administrators</h3>\n<p>The top user level in Ghost is Administrator. Again, administrators can do everything that Authors and Editors can do, but they can also edit all site settings and data, not just content. Additionally, administrators have full access to invite, manage or remove any other user of the site.</p>\n<h3 id=\"theowner\">The Owner</h3>\n<p>There is only ever one owner of a Ghost site. The owner is a special user which has all the same permissions as an Administrator, but with two exceptions: The Owner can never be deleted. And in some circumstances the owner will have access to additional special settings if applicable — for example, billing details, if using Ghost(Pro).</p>\n<hr>\n<p>It\'s a good idea to ask all of your users to fill out their user profiles, including bio and social links. These will populate rich structured data for posts and generally create more opportunities for themes to fully populate their design.</p>\n</div>',NULL,'Ghost has a number of different user roles for your team\n\nAuthors\nThe base user level in Ghost is an author. Authors can write posts, edit their\nown posts, and publish their own posts. Authors are trusted  users. If you don\'t\ntrust users to be allowed to publish their own posts, you shouldn\'t invite them\nto Ghost admin.\n\nEditors\nEditors are the 2nd user level in Ghost. Editors can do everything that an\nAuthor can do, but they can also edit and publish the posts of others - as well\nas their own. Editors can also invite new authors to the site.\n\nAdministrators\nThe top user level in Ghost is Administrator. Again, administrators can do\neverything that Authors and Editors can do, but they can also edit all site\nsettings and data, not just content. Additionally, administrators have full\naccess to invite, manage or remove any other user of the site.\n\nThe Owner\nThere is only ever one owner of a Ghost site. The owner is a special user which\nhas all the same permissions as an Administrator, but with two exceptions: The\nOwner can never be deleted. And in some circumstances the owner will have access\nto additional special settings if applicable — for example, billing details, if\nusing Ghost(Pro).\n\n\n--------------------------------------------------------------------------------\n\nIt\'s a good idea to ask all of your users to fill out their user profiles,\nincluding bio and social links. These will populate rich structured data for\nposts and generally create more opportunities for themes to fully populate their\ndesign.','https://casper.ghost.org/v1.0.0/images/team.jpg',0,0,'published',NULL,'public',NULL,NULL,'5951f5fca366002ebd5dbef7','2017-10-23 11:27:02','1','2017-10-23 11:27:02','1','2017-10-23 11:27:04','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('59edd20609465823fcfce564','336a7880-35ec-415f-a61d-865704ee90e6','Organising your content with tags','using-tags','{\"version\":\"0.3.1\",\"markups\":[],\"atoms\":[],\"cards\":[[\"card-markdown\",{\"cardName\":\"card-markdown\",\"markdown\":\"Ghost has a single, powerful organisational taxonomy, called tags.\\n\\nIt doesn\'t matter whether you want to call them categories, tags, boxes, or anything else. You can think of Ghost tags a lot like Gmail labels. By tagging posts with one or more keyword, you can organise articles into buckets of related content.\\n\\n\\n## Basic tagging\\n\\nWhen you write a post, you can assign tags to help differentiate between categories of content. For example, you might tag some posts with `News` and other posts with `Cycling`, which would create two distinct categories of content listed on `/tag/news/` and `/tag/cycling/`, respectively.\\n\\nIf you tag a post with both `News` *and* `Cycling` - then it appears in both sections.\\n\\nTag archives are like dedicated home-pages for each category of content that you have. They have their own pages, their own RSS feeds, and can support their own cover images and meta data.\\n\\n\\n## The primary tag\\n\\nInside the Ghost editor, you can drag and drop tags into a specific order. The first tag in the list is always given the most importance, and some themes will only display the primary tag (the first tag in the list) by default. So you can add the most important tag which you want to show up in your theme, but also add a bunch of related tags which are less important.\\n\\n==**News**, Cycling, Bart Stevens, Extreme Sports==\\n\\nIn this example, **News** is the primary tag which will be displayed by the theme, but the post will also still receive all the other tags, and show up in their respective archives.\\n\\n\\n## Private tags\\n\\nSometimes you may want to assign a post a specific tag, but you don\'t necessarily want that tag appearing in the theme or creating an archive page. In Ghost, hashtags are private and can be used for special styling.\\n\\nFor example, if you sometimes publish posts with video content - you might want your theme to adapt and get rid of the sidebar for these posts, to give more space for an embedded video to fill the screen. In this case, you could use private tags to tell your theme what to do.\\n\\n==**News**, Cycling, #video==\\n\\nHere, the theme would assign the post publicly displayed tags of `News`, and `Cycling` - but it would also keep a private record of the post being tagged with `#video`.\\n\\nIn your theme, you could then look for private tags conditionally and give them special formatting:\\n\\n```\\n{{#post}}\\n    {{#has tag=\\\"#video\\\"}}\\n        ...markup for a nice big video post layout...\\n    {{else}}\\n        ...regular markup for a post...\\n    {{/has}}\\n{{/post}}\\n```\\n\\nYou can find documentation for theme development techniques like this and many more over on Ghost\'s extensive [theme documentation](https://themes.ghost.org/).\"}]],\"sections\":[[10,0]]}','<div class=\"kg-card-markdown\"><p>Ghost has a single, powerful organisational taxonomy, called tags.</p>\n<p>It doesn\'t matter whether you want to call them categories, tags, boxes, or anything else. You can think of Ghost tags a lot like Gmail labels. By tagging posts with one or more keyword, you can organise articles into buckets of related content.</p>\n<h2 id=\"basictagging\">Basic tagging</h2>\n<p>When you write a post, you can assign tags to help differentiate between categories of content. For example, you might tag some posts with <code>News</code> and other posts with <code>Cycling</code>, which would create two distinct categories of content listed on <code>/tag/news/</code> and <code>/tag/cycling/</code>, respectively.</p>\n<p>If you tag a post with both <code>News</code> <em>and</em> <code>Cycling</code> - then it appears in both sections.</p>\n<p>Tag archives are like dedicated home-pages for each category of content that you have. They have their own pages, their own RSS feeds, and can support their own cover images and meta data.</p>\n<h2 id=\"theprimarytag\">The primary tag</h2>\n<p>Inside the Ghost editor, you can drag and drop tags into a specific order. The first tag in the list is always given the most importance, and some themes will only display the primary tag (the first tag in the list) by default. So you can add the most important tag which you want to show up in your theme, but also add a bunch of related tags which are less important.</p>\n<p><mark><strong>News</strong>, Cycling, Bart Stevens, Extreme Sports</mark></p>\n<p>In this example, <strong>News</strong> is the primary tag which will be displayed by the theme, but the post will also still receive all the other tags, and show up in their respective archives.</p>\n<h2 id=\"privatetags\">Private tags</h2>\n<p>Sometimes you may want to assign a post a specific tag, but you don\'t necessarily want that tag appearing in the theme or creating an archive page. In Ghost, hashtags are private and can be used for special styling.</p>\n<p>For example, if you sometimes publish posts with video content - you might want your theme to adapt and get rid of the sidebar for these posts, to give more space for an embedded video to fill the screen. In this case, you could use private tags to tell your theme what to do.</p>\n<p><mark><strong>News</strong>, Cycling, #video</mark></p>\n<p>Here, the theme would assign the post publicly displayed tags of <code>News</code>, and <code>Cycling</code> - but it would also keep a private record of the post being tagged with <code>#video</code>.</p>\n<p>In your theme, you could then look for private tags conditionally and give them special formatting:</p>\n<pre><code>{{#post}}\n    {{#has tag=&quot;#video&quot;}}\n        ...markup for a nice big video post layout...\n    {{else}}\n        ...regular markup for a post...\n    {{/has}}\n{{/post}}\n</code></pre>\n<p>You can find documentation for theme development techniques like this and many more over on Ghost\'s extensive <a href=\"https://themes.ghost.org/\">theme documentation</a>.</p>\n</div>',NULL,'Ghost has a single, powerful organisational taxonomy, called tags.\n\nIt doesn\'t matter whether you want to call them categories, tags, boxes, or\nanything else. You can think of Ghost tags a lot like Gmail labels. By tagging\nposts with one or more keyword, you can organise articles into buckets of\nrelated content.\n\nBasic tagging\nWhen you write a post, you can assign tags to help differentiate between\ncategories of content. For example, you might tag some posts with News  and\nother posts with Cycling, which would create two distinct categories of content\nlisted on /tag/news/  and /tag/cycling/, respectively.\n\nIf you tag a post with both News  and  Cycling  - then it appears in both\nsections.\n\nTag archives are like dedicated home-pages for each category of content that you\nhave. They have their own pages, their own RSS feeds, and can support their own\ncover images and meta data.\n\nThe primary tag\nInside the Ghost editor, you can drag and drop tags into a specific order. The\nfirst tag in the list is always given the most importance, and some themes will\nonly display the primary tag (the first tag in the list) by default. So you can\nadd the most important tag which you want to show up in your theme, but also add\na bunch of related tags which are less important.\n\nNews, Cycling, Bart Stevens, Extreme Sports\n\nIn this example, News  is the primary tag which will be displayed by the theme,\nbut the post will also still receive all the other tags, and show up in their\nrespective archives.\n\nPrivate tags\nSometimes you may want to assign a post a specific tag, but you don\'t\nnecessarily want that tag appearing in the theme or creating an archive page. In\nGhost, hashtags are private and can be used for special styling.\n\nFor example, if you sometimes publish posts with video content - you might want\nyour theme to adapt and get rid of the sidebar for these posts, to give more\nspace for an embedded video to fill the screen. In this case, you could use\nprivate tags to tell your theme what to do.\n\nNews, Cycling, #video\n\nHere, the theme would assign the post publicly displayed tags of News, and \nCycling  - but it would also keep a private record of the post being tagged with\n #video.\n\nIn your theme, you could then look for private tags conditionally and give them\nspecial formatting:\n\n{{#post}}\n    {{#has tag=\"#video\"}}\n        ...markup for a nice big video post layout...\n    {{else}}\n        ...regular markup for a post...\n    {{/has}}\n{{/post}}\n\n\nYou can find documentation for theme development techniques like this and many\nmore over on Ghost\'s extensive theme documentation [https://themes.ghost.org/].','https://casper.ghost.org/v1.0.0/images/tags.jpg',0,0,'published',NULL,'public',NULL,NULL,'5951f5fca366002ebd5dbef7','2017-10-23 11:27:02','1','2017-10-23 11:27:02','1','2017-10-23 11:27:05','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('59edd20609465823fcfce565','0eba3b47-3126-4e86-ba2d-0d9957b01568','Using the Ghost editor','the-editor','{\"version\":\"0.3.1\",\"markups\":[],\"atoms\":[],\"cards\":[[\"card-markdown\",{\"cardName\":\"card-markdown\",\"markdown\":\"Ghost uses a language called **Markdown** to format text.\\n\\nWhen you go to edit a post and see special characters and colours intertwined between the words, those are Markdown shortcuts which tell Ghost what to do with the words in your document. The biggest benefit of Markdown is that you can quickly apply formatting as you type, without needing to pause.\\n\\nAt the bottom of the editor, you\'ll find a toolbar with basic formatting options to help you get started as easily as possible. You\'ll also notice that there\'s a **?** icon, which contains more advanced shortcuts.\\n\\nFor now, though, let\'s run you through some of the basics. You\'ll want to make sure you\'re editing this post in order to see all the Markdown we\'ve used.\\n\\n\\n## Formatting text\\n\\nThe most common shortcuts are of course, **bold** text, _italic_ text, and [hyperlinks](https://example.com). These generally make up the bulk of any document. You can type the characters out, but you can also use keyboard shortcuts.\\n\\n* `CMD/Ctrl + B` for Bold\\n* `CMD/Ctrl + I` for Italic\\n* `CMD/Ctrl + K` for a Link\\n* `CMD/Ctrl + H` for a Heading (Press multiple times for h2/h3/h4/etc)\\n\\nWith just a couple of extra characters here and there, you\'re well on your way to creating a beautifully formatted story.\\n\\n\\n## Inserting images\\n\\nImages in Markdown look just the same as links, except they\'re prefixed with an exclamation mark, like this:\\n\\n`![Image description](/path/to/image.jpg)`\\n\\n![Computer](https://casper.ghost.org/v1.0.0/images/computer.jpg)\\n\\nMost Markdown editors don\'t make you type this out, though. In Ghost you can click on the image icon in the toolbar at the bottom of the editor, or you can just click and drag an image from your desktop directly into the editor. Both will upload the image for you and generate the appropriate Markdown.\\n\\n_**Important Note:** Ghost does not currently have automatic image resizing, so it\'s always a good idea to make sure your images aren\'t gigantic files **before** uploading them to Ghost._\\n\\n\\n## Making lists\\n\\nLists in HTML are a formatting nightmare, but in Markdown they become an absolute breeze with just a couple of characters and a bit of smart automation. For numbered lists, just write out the numbers. For bullet lists, just use `*` or `-` or `+`. Like this:\\n\\n1. Crack the eggs over a bowl\\n2. Whisk them together\\n3. Make an omelette\\n\\nor\\n\\n- Remember to buy milk\\n- Feed the cat\\n- Come up with idea for next story\\n\\n\\n## Adding quotes\\n\\nWhen you want to pull out a particularly good excerpt in the middle of a piece, you can use `>` at the beginning of a paragraph to turn it into a Blockquote. You might\'ve seen this formatting before in email clients.\\n\\n> A well placed quote guides a reader through a story, helping them to understand the most important points being made\\n\\nAll themes handles blockquotes slightly differently. Sometimes they\'ll look better kept shorter, while other times you can quote fairly hefty amounts of text and get away with it. Generally, the safest option is to use blockquotes sparingly.\\n\\n\\n## Dividing things up\\n\\nIf you\'re writing a piece in parts and you just feel like you need to divide a couple of sections distinctly from each other, a horizontal rule might be just what you need. Dropping `---` on a new line will create a sleek divider, anywhere you want it.\\n\\n---\\n\\nThis should get you going with the vast majority of what you need to do in the editor, but if you\'re still curious about more advanced tips then check out the [Advanced Markdown Guide](/advanced-markdown/) - or if you\'d rather learn about how Ghost taxononomies work, we\'ve got a overview of [how to use Ghost tags](/using-tags/).\"}]],\"sections\":[[10,0]]}','<div class=\"kg-card-markdown\"><p>Ghost uses a language called <strong>Markdown</strong> to format text.</p>\n<p>When you go to edit a post and see special characters and colours intertwined between the words, those are Markdown shortcuts which tell Ghost what to do with the words in your document. The biggest benefit of Markdown is that you can quickly apply formatting as you type, without needing to pause.</p>\n<p>At the bottom of the editor, you\'ll find a toolbar with basic formatting options to help you get started as easily as possible. You\'ll also notice that there\'s a <strong>?</strong> icon, which contains more advanced shortcuts.</p>\n<p>For now, though, let\'s run you through some of the basics. You\'ll want to make sure you\'re editing this post in order to see all the Markdown we\'ve used.</p>\n<h2 id=\"formattingtext\">Formatting text</h2>\n<p>The most common shortcuts are of course, <strong>bold</strong> text, <em>italic</em> text, and <a href=\"https://example.com\">hyperlinks</a>. These generally make up the bulk of any document. You can type the characters out, but you can also use keyboard shortcuts.</p>\n<ul>\n<li><code>CMD/Ctrl + B</code> for Bold</li>\n<li><code>CMD/Ctrl + I</code> for Italic</li>\n<li><code>CMD/Ctrl + K</code> for a Link</li>\n<li><code>CMD/Ctrl + H</code> for a Heading (Press multiple times for h2/h3/h4/etc)</li>\n</ul>\n<p>With just a couple of extra characters here and there, you\'re well on your way to creating a beautifully formatted story.</p>\n<h2 id=\"insertingimages\">Inserting images</h2>\n<p>Images in Markdown look just the same as links, except they\'re prefixed with an exclamation mark, like this:</p>\n<p><code>![Image description](/path/to/image.jpg)</code></p>\n<p><img src=\"https://casper.ghost.org/v1.0.0/images/computer.jpg\" alt=\"Computer\"></p>\n<p>Most Markdown editors don\'t make you type this out, though. In Ghost you can click on the image icon in the toolbar at the bottom of the editor, or you can just click and drag an image from your desktop directly into the editor. Both will upload the image for you and generate the appropriate Markdown.</p>\n<p><em><strong>Important Note:</strong> Ghost does not currently have automatic image resizing, so it\'s always a good idea to make sure your images aren\'t gigantic files <strong>before</strong> uploading them to Ghost.</em></p>\n<h2 id=\"makinglists\">Making lists</h2>\n<p>Lists in HTML are a formatting nightmare, but in Markdown they become an absolute breeze with just a couple of characters and a bit of smart automation. For numbered lists, just write out the numbers. For bullet lists, just use <code>*</code> or <code>-</code> or <code>+</code>. Like this:</p>\n<ol>\n<li>Crack the eggs over a bowl</li>\n<li>Whisk them together</li>\n<li>Make an omelette</li>\n</ol>\n<p>or</p>\n<ul>\n<li>Remember to buy milk</li>\n<li>Feed the cat</li>\n<li>Come up with idea for next story</li>\n</ul>\n<h2 id=\"addingquotes\">Adding quotes</h2>\n<p>When you want to pull out a particularly good excerpt in the middle of a piece, you can use <code>&gt;</code> at the beginning of a paragraph to turn it into a Blockquote. You might\'ve seen this formatting before in email clients.</p>\n<blockquote>\n<p>A well placed quote guides a reader through a story, helping them to understand the most important points being made</p>\n</blockquote>\n<p>All themes handles blockquotes slightly differently. Sometimes they\'ll look better kept shorter, while other times you can quote fairly hefty amounts of text and get away with it. Generally, the safest option is to use blockquotes sparingly.</p>\n<h2 id=\"dividingthingsup\">Dividing things up</h2>\n<p>If you\'re writing a piece in parts and you just feel like you need to divide a couple of sections distinctly from each other, a horizontal rule might be just what you need. Dropping <code>---</code> on a new line will create a sleek divider, anywhere you want it.</p>\n<hr>\n<p>This should get you going with the vast majority of what you need to do in the editor, but if you\'re still curious about more advanced tips then check out the <a href=\"/advanced-markdown/\">Advanced Markdown Guide</a> - or if you\'d rather learn about how Ghost taxononomies work, we\'ve got a overview of <a href=\"/using-tags/\">how to use Ghost tags</a>.</p>\n</div>',NULL,'Ghost uses a language called Markdown  to format text.\n\nWhen you go to edit a post and see special characters and colours intertwined\nbetween the words, those are Markdown shortcuts which tell Ghost what to do with\nthe words in your document. The biggest benefit of Markdown is that you can\nquickly apply formatting as you type, without needing to pause.\n\nAt the bottom of the editor, you\'ll find a toolbar with basic formatting options\nto help you get started as easily as possible. You\'ll also notice that there\'s a\n ?  icon, which contains more advanced shortcuts.\n\nFor now, though, let\'s run you through some of the basics. You\'ll want to make\nsure you\'re editing this post in order to see all the Markdown we\'ve used.\n\nFormatting text\nThe most common shortcuts are of course, bold  text, italic  text, and \nhyperlinks [https://example.com]. These generally make up the bulk of any\ndocument. You can type the characters out, but you can also use keyboard\nshortcuts.\n\n * CMD/Ctrl + B  for Bold\n * CMD/Ctrl + I  for Italic\n * CMD/Ctrl + K  for a Link\n * CMD/Ctrl + H  for a Heading (Press multiple times for h2/h3/h4/etc)\n\nWith just a couple of extra characters here and there, you\'re well on your way\nto creating a beautifully formatted story.\n\nInserting images\nImages in Markdown look just the same as links, except they\'re prefixed with an\nexclamation mark, like this:\n\n![Image description](/path/to/image.jpg)\n\n\n\nMost Markdown editors don\'t make you type this out, though. In Ghost you can\nclick on the image icon in the toolbar at the bottom of the editor, or you can\njust click and drag an image from your desktop directly into the editor. Both\nwill upload the image for you and generate the appropriate Markdown.\n\nImportant Note:  Ghost does not currently have automatic image resizing, so it\'s\nalways a good idea to make sure your images aren\'t gigantic files before \nuploading them to Ghost.\n\nMaking lists\nLists in HTML are a formatting nightmare, but in Markdown they become an\nabsolute breeze with just a couple of characters and a bit of smart automation.\nFor numbered lists, just write out the numbers. For bullet lists, just use *  or\n -  or +. Like this:\n\n 1. Crack the eggs over a bowl\n 2. Whisk them together\n 3. Make an omelette\n\nor\n\n * Remember to buy milk\n * Feed the cat\n * Come up with idea for next story\n\nAdding quotes\nWhen you want to pull out a particularly good excerpt in the middle of a piece,\nyou can use >  at the beginning of a paragraph to turn it into a Blockquote. You\nmight\'ve seen this formatting before in email clients.\n\nA well placed quote guides a reader through a story, helping them to understand\nthe most important points being made\n\nAll themes handles blockquotes slightly differently. Sometimes they\'ll look\nbetter kept shorter, while other times you can quote fairly hefty amounts of\ntext and get away with it. Generally, the safest option is to use blockquotes\nsparingly.\n\nDividing things up\nIf you\'re writing a piece in parts and you just feel like you need to divide a\ncouple of sections distinctly from each other, a horizontal rule might be just\nwhat you need. Dropping ---  on a new line will create a sleek divider, anywhere\nyou want it.\n\n\n--------------------------------------------------------------------------------\n\nThis should get you going with the vast majority of what you need to do in the\neditor, but if you\'re still curious about more advanced tips then check out the \nAdvanced Markdown Guide [/advanced-markdown/]  - or if you\'d rather learn about\nhow Ghost taxononomies work, we\'ve got a overview of how to use Ghost tags\n[/using-tags/].','https://casper.ghost.org/v1.0.0/images/writing.jpg',0,0,'published',NULL,'public',NULL,NULL,'5951f5fca366002ebd5dbef7','2017-10-23 11:27:02','1','2017-10-23 11:27:02','1','2017-10-23 11:27:06','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('59edd20609465823fcfce566','8dda6339-03e6-4235-96ac-01981d8675bb','Welcome to Ghost','welcome','{\"version\":\"0.3.1\",\"markups\":[],\"atoms\":[],\"cards\":[[\"card-markdown\",{\"cardName\":\"card-markdown\",\"markdown\":\"Hey! Welcome to Ghost, it\'s great to have you :)\\n\\nWe know that first impressions are important, so we\'ve populated your new site with some initial **Getting Started** posts that will help you get familiar with everything in no time. This is the first one!\\n\\n\\n### There are a few things that you should know up-front:\\n\\n1. Ghost is designed for ambitious, professional publishers who want to actively build a business around their content. That\'s who it works best for. If you\'re using Ghost for some other purpose, that\'s fine too - but it might not be the best choice for you.\\n\\n2. The entire platform can be modified and customized to suit your needs, which is very powerful, but doing so **does** require some knowledge of code. Ghost is not necessarily a good platform for beginners or people who just want a simple personal blog.\\n\\n3. For the best experience we recommend downloading the [Ghost Desktop App](https://ghost.org/downloads/) for your computer, which is the best way to access your Ghost site on a desktop device.\\n\\nGhost is made by an independent non-profit organisation called the Ghost Foundation. We are 100% self funded by revenue from our [Ghost(Pro)](https://ghost.org/pricing) service, and every penny we make is re-invested into funding further development of free, open source technology for modern journalism.\\n\\nThe main thing you\'ll want to read about next is probably: [the Ghost editor](/the-editor/).\\n\\nOnce you\'re done reading, you can simply delete the default **Ghost** user from your team to remove all of these introductory posts!\"}]],\"sections\":[[10,0]]}','<div class=\"kg-card-markdown\"><p>Hey! Welcome to Ghost, it\'s great to have you :)</p>\n<p>We know that first impressions are important, so we\'ve populated your new site with some initial <strong>Getting Started</strong> posts that will help you get familiar with everything in no time. This is the first one!</p>\n<h3 id=\"thereareafewthingsthatyoushouldknowupfront\">There are a few things that you should know up-front:</h3>\n<ol>\n<li>\n<p>Ghost is designed for ambitious, professional publishers who want to actively build a business around their content. That\'s who it works best for. If you\'re using Ghost for some other purpose, that\'s fine too - but it might not be the best choice for you.</p>\n</li>\n<li>\n<p>The entire platform can be modified and customized to suit your needs, which is very powerful, but doing so <strong>does</strong> require some knowledge of code. Ghost is not necessarily a good platform for beginners or people who just want a simple personal blog.</p>\n</li>\n<li>\n<p>For the best experience we recommend downloading the <a href=\"https://ghost.org/downloads/\">Ghost Desktop App</a> for your computer, which is the best way to access your Ghost site on a desktop device.</p>\n</li>\n</ol>\n<p>Ghost is made by an independent non-profit organisation called the Ghost Foundation. We are 100% self funded by revenue from our <a href=\"https://ghost.org/pricing\">Ghost(Pro)</a> service, and every penny we make is re-invested into funding further development of free, open source technology for modern journalism.</p>\n<p>The main thing you\'ll want to read about next is probably: <a href=\"/the-editor/\">the Ghost editor</a>.</p>\n<p>Once you\'re done reading, you can simply delete the default <strong>Ghost</strong> user from your team to remove all of these introductory posts!</p>\n</div>',NULL,'Hey! Welcome to Ghost, it\'s great to have you :)\n\nWe know that first impressions are important, so we\'ve populated your new site\nwith some initial Getting Started  posts that will help you get familiar with\neverything in no time. This is the first one!\n\nThere are a few things that you should know up-front:\n 1. Ghost is designed for ambitious, professional publishers who want to\n    actively build a business around their content. That\'s who it works best\n    for. If you\'re using Ghost for some other purpose, that\'s fine too - but it\n    might not be the best choice for you.\n    \n    \n 2. The entire platform can be modified and customized to suit your needs, which\n    is very powerful, but doing so does  require some knowledge of code. Ghost\n    is not necessarily a good platform for beginners or people who just want a\n    simple personal blog.\n    \n    \n 3. For the best experience we recommend downloading the Ghost Desktop App\n    [https://ghost.org/downloads/]  for your computer, which is the best way to\n    access your Ghost site on a desktop device.\n    \n    \n\nGhost is made by an independent non-profit organisation called the Ghost\nFoundation. We are 100% self funded by revenue from our Ghost(Pro)\n[https://ghost.org/pricing]  service, and every penny we make is re-invested\ninto funding further development of free, open source technology for modern\njournalism.\n\nThe main thing you\'ll want to read about next is probably: the Ghost editor\n[/the-editor/].\n\nOnce you\'re done reading, you can simply delete the default Ghost  user from\nyour team to remove all of these introductory posts!','https://casper.ghost.org/v1.0.0/images/welcome.jpg',0,0,'published',NULL,'public',NULL,NULL,'5951f5fca366002ebd5dbef7','2017-10-23 11:27:02','1','2017-10-23 11:27:02','1','2017-10-23 11:27:07','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_tags`
--

DROP TABLE IF EXISTS `posts_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts_tags` (
  `id` varchar(24) NOT NULL,
  `post_id` varchar(24) NOT NULL,
  `tag_id` varchar(24) NOT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `posts_tags_post_id_foreign` (`post_id`),
  KEY `posts_tags_tag_id_foreign` (`tag_id`),
  CONSTRAINT `posts_tags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `posts_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_tags`
--

LOCK TABLES `posts_tags` WRITE;
/*!40000 ALTER TABLE `posts_tags` DISABLE KEYS */;
INSERT INTO `posts_tags` VALUES ('59edd20e09465823fcfce60a','59edd20509465823fcfce560','59edd20609465823fcfce567',0),('59edd20e09465823fcfce60b','59edd20609465823fcfce561','59edd20609465823fcfce567',0),('59edd20e09465823fcfce60c','59edd20609465823fcfce562','59edd20609465823fcfce567',0),('59edd20e09465823fcfce60d','59edd20609465823fcfce563','59edd20609465823fcfce567',0),('59edd20e09465823fcfce60e','59edd20609465823fcfce564','59edd20609465823fcfce567',0),('59edd20e09465823fcfce60f','59edd20609465823fcfce565','59edd20609465823fcfce567',0),('59edd20e09465823fcfce610','59edd20609465823fcfce566','59edd20609465823fcfce567',0);
/*!40000 ALTER TABLE `posts_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refreshtokens`
--

DROP TABLE IF EXISTS `refreshtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refreshtokens` (
  `id` varchar(24) NOT NULL,
  `token` varchar(191) NOT NULL,
  `user_id` varchar(24) NOT NULL,
  `client_id` varchar(24) NOT NULL,
  `expires` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refreshtokens_token_unique` (`token`),
  KEY `refreshtokens_user_id_foreign` (`user_id`),
  KEY `refreshtokens_client_id_foreign` (`client_id`),
  CONSTRAINT `refreshtokens_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `refreshtokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refreshtokens`
--

LOCK TABLES `refreshtokens` WRITE;
/*!40000 ALTER TABLE `refreshtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `refreshtokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` varchar(24) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('59edd20709465823fcfce56c','Administrator','Administrators','2017-10-23 11:27:03','1','2017-10-23 11:27:03','1'),('59edd20709465823fcfce56d','Editor','Editors','2017-10-23 11:27:03','1','2017-10-23 11:27:03','1'),('59edd20709465823fcfce56e','Author','Authors','2017-10-23 11:27:03','1','2017-10-23 11:27:03','1'),('59edd20709465823fcfce56f','Owner','Blog Owner','2017-10-23 11:27:03','1','2017-10-23 11:27:03','1');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_users` (
  `id` varchar(24) NOT NULL,
  `role_id` varchar(24) NOT NULL,
  `user_id` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
INSERT INTO `roles_users` VALUES ('59edd20a09465823fcfce5a3','59edd20709465823fcfce56e','5951f5fca366002ebd5dbef7'),('59edd20f09465823fcfce611','59edd20709465823fcfce56f','1');
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` varchar(24) NOT NULL,
  `key` varchar(50) NOT NULL,
  `value` text,
  `type` varchar(50) NOT NULL DEFAULT 'core',
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribers`
--

DROP TABLE IF EXISTS `subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscribers` (
  `id` varchar(24) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `post_id` varchar(24) DEFAULT NULL,
  `subscribed_url` varchar(2000) DEFAULT NULL,
  `subscribed_referrer` varchar(2000) DEFAULT NULL,
  `unsubscribed_url` varchar(2000) DEFAULT NULL,
  `unsubscribed_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscribers_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribers`
--

LOCK TABLES `subscribers` WRITE;
/*!40000 ALTER TABLE `subscribers` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscribers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` varchar(24) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` text,
  `feature_image` varchar(2000) DEFAULT NULL,
  `parent_id` varchar(191) DEFAULT NULL,
  `visibility` varchar(50) NOT NULL DEFAULT 'public',
  `meta_title` varchar(2000) DEFAULT NULL,
  `meta_description` varchar(2000) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES ('59edd20609465823fcfce567','Getting Started','getting-started',NULL,NULL,NULL,'public',NULL,NULL,'2017-10-23 11:27:02','1','2017-10-23 11:27:02','1');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` varchar(24) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `ghost_auth_access_token` varchar(32) DEFAULT NULL,
  `ghost_auth_id` varchar(24) DEFAULT NULL,
  `password` varchar(60) NOT NULL,
  `email` varchar(191) NOT NULL,
  `profile_image` varchar(2000) DEFAULT NULL,
  `cover_image` varchar(2000) DEFAULT NULL,
  `bio` text,
  `website` varchar(2000) DEFAULT NULL,
  `location` text,
  `facebook` varchar(2000) DEFAULT NULL,
  `twitter` varchar(2000) DEFAULT NULL,
  `accessibility` text,
  `status` varchar(50) NOT NULL DEFAULT 'active',
  `locale` varchar(6) DEFAULT NULL,
  `visibility` varchar(50) NOT NULL DEFAULT 'public',
  `meta_title` varchar(2000) DEFAULT NULL,
  `meta_description` varchar(2000) DEFAULT NULL,
  `tour` text,
  `last_seen` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(24) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_slug_unique` (`slug`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('1','Ghost','ghost-user',NULL,NULL,'$2a$10$6HKoZimRHs.4ZZ6K4JeWounHoF30n7etfB/m9uZWZNBZ4XzjYyCwW','ghost@example.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'inactive',NULL,'public',NULL,NULL,NULL,NULL,'2017-10-23 11:27:05','1','2017-10-23 11:27:05','1'),('5951f5fca366002ebd5dbef7','Ghost','ghost',NULL,NULL,'$2a$10$0QFK5hHVkv6EgtJ2eEazmOyNbMrfZPLMNesYD724sNXxBmdK69SZK','ghost-author@example.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active',NULL,'public',NULL,NULL,NULL,NULL,'2017-10-23 11:27:06','1','2017-10-23 11:27:06','1');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-26  2:10:25
