CREATE DATABASE  IF NOT EXISTS `mazi` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mazi`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: mazi
-- ------------------------------------------------------
-- Server version	5.6.12-log

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
-- Table structure for table `booklets`
--

DROP TABLE IF EXISTS `booklets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booklets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bid` int(11) DEFAULT NULL COMMENT 'Book ID',
  `uid` int(11) NOT NULL COMMENT 'Author ID',
  `content` text NOT NULL,
  `btitle` varchar(250) NOT NULL COMMENT 'Book Title',
  `bsubtitle` varchar(250) NOT NULL COMMENT 'Book Subtitle',
  `cates` int(11) DEFAULT NULL COMMENT 'System Categories of pobooksst',
  `bcates` int(11) DEFAULT NULL COMMENT 'Categories of books',
  `tags` int(11) DEFAULT NULL COMMENT 'System tag of books',
  `btags` int(11) DEFAULT NULL COMMENT 'Tag of books',
  `metadescription` text,
  `metakeywords` text,
  `description` varchar(300) NOT NULL COMMENT 'Description',
  `detail` text COMMENT 'Book Detail',
  `attention` int(11) NOT NULL DEFAULT '0' COMMENT 'Amount of attention',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT 'Amount of clicks',
  `likes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Amount of likes',
  `is_show` int(11) NOT NULL DEFAULT '0' COMMENT 'Show in front pages',
  `is_top` int(11) NOT NULL DEFAULT '0' COMMENT 'Show on top in front pages',
  `img_src` varchar(200) DEFAULT NULL COMMENT 'List of picture address',
  `price` decimal(10,2) DEFAULT NULL COMMENT 'Default price',
  `discount` decimal(10,2) DEFAULT NULL COMMENT 'Discount price',
  `is_discount` int(11) NOT NULL DEFAULT '0' COMMENT '1:Discount price 2:Default price',
  `seller_id` int(11) NOT NULL COMMENT 'Seller ID',
  `sales` int(11) DEFAULT '0' COMMENT 'Sales count',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Books from users.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booklets`
--

LOCK TABLES `booklets` WRITE;
/*!40000 ALTER TABLE `booklets` DISABLE KEYS */;
/*!40000 ALTER TABLE `booklets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `pid` int(11) NOT NULL,
  `pcates` int(11) NOT NULL,
  `units` int(11) NOT NULL,
  `carts_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Carts from users.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cates`
--

DROP TABLE IF EXISTS `cates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rght` int(11) DEFAULT NULL,
  `link_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cates`
--

LOCK TABLES `cates` WRITE;
/*!40000 ALTER TABLE `cates` DISABLE KEYS */;
/*!40000 ALTER TABLE `cates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `parent_id` int(20) DEFAULT NULL,
  `content` varchar(45) NOT NULL COMMENT 'Content of comments',
  `iid` int(20) NOT NULL COMMENT 'Item ID',
  `itype` int(11) NOT NULL COMMENT 'Item type',
  `creator_id` int(11) DEFAULT NULL COMMENT 'Comments creator ID',
  `email` varchar(100) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL COMMENT 'Website of Commentee',
  `is_show` int(11) NOT NULL COMMENT 'Show in front pages',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='comments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_notes`
--

DROP TABLE IF EXISTS `learning_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL COMMENT 'Memo Set ID',
  `uid` int(11) NOT NULL COMMENT 'Author ID',
  `content` text NOT NULL,
  `title` varchar(40) DEFAULT NULL COMMENT 'Title of memos',
  `subtitle` varchar(40) DEFAULT NULL COMMENT 'Subtitle of memos',
  `cates` int(11) DEFAULT NULL COMMENT 'System Categories of memos',
  `tags` int(11) DEFAULT NULL COMMENT 'System tag of memos',
  `metadescription` text,
  `metakeywords` text,
  `description` varchar(300) NOT NULL COMMENT 'Description',
  `detail` text COMMENT 'Book Detail',
  `attention` int(11) NOT NULL DEFAULT '0' COMMENT 'Amount of attention',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT 'Amount of clicks',
  `likes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Amount of likes',
  `price` decimal(10,2) DEFAULT NULL COMMENT 'Default price',
  `discount` decimal(10,2) DEFAULT NULL COMMENT 'Discount price',
  `is_discount` int(11) NOT NULL DEFAULT '0' COMMENT '1:Discount price 2:Default price',
  `seller_id` int(11) NOT NULL COMMENT 'Seller ID',
  `sales` int(11) DEFAULT '0' COMMENT 'Sales count',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Memos from users.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_notes`
--

LOCK TABLES `learning_notes` WRITE;
/*!40000 ALTER TABLE `learning_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `learning_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mazi_blogs`
--

DROP TABLE IF EXISTS `mazi_blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mazi_blogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `uid` int(11) NOT NULL COMMENT 'Creator ID',
  `content` text NOT NULL,
  `title` varchar(250) NOT NULL COMMENT 'Title',
  `subtitle` varchar(128) DEFAULT NULL COMMENT 'Abstract',
  `cates` int(11) DEFAULT NULL COMMENT 'System Categories of posts',
  `tags` int(11) DEFAULT NULL COMMENT 'System tag of posts',
  `metadescription` text,
  `metakeywords` text,
  `description` varchar(300) NOT NULL COMMENT 'Description',
  `detail` text COMMENT 'Book Detail',
  `attention` int(11) NOT NULL DEFAULT '0' COMMENT 'Amount of attention',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT 'Amount of clicks',
  `likes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Amount of likes',
  `is_show` int(11) NOT NULL DEFAULT '0' COMMENT 'Show in front pages',
  `is_top` int(11) NOT NULL DEFAULT '0' COMMENT 'Show on top in front pages',
  `img_src` varchar(200) DEFAULT NULL COMMENT 'List of picture address',
  `price` decimal(10,2) DEFAULT NULL COMMENT 'Default price',
  `discount` decimal(10,2) DEFAULT NULL COMMENT 'Discount price',
  `is_discount` int(11) NOT NULL DEFAULT '0' COMMENT '1:Discount price 2:Default price',
  `seller_id` int(11) NOT NULL COMMENT 'Seller ID',
  `sales` int(11) DEFAULT '0' COMMENT 'Sales count',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Posts from users.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mazi_blogs`
--

LOCK TABLES `mazi_blogs` WRITE;
/*!40000 ALTER TABLE `mazi_blogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mazi_blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mazi_users`
--

DROP TABLE IF EXISTS `mazi_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mazi_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL COMMENT 'Group ID',
  `account` varchar(45) DEFAULT NULL COMMENT 'Account Name',
  `password` varchar(64) DEFAULT NULL COMMENT 'Password',
  `role` tinytext COMMENT 'Each role have one permission sets.',
  `name` varchar(45) DEFAULT '' COMMENT 'Name',
  `email` varchar(64) DEFAULT '',
  `status` tinyint(4) DEFAULT NULL COMMENT '1:Normal,2:Disable,3:Delete.',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='Admin Account';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mazi_users`
--

LOCK TABLES `mazi_users` WRITE;
/*!40000 ALTER TABLE `mazi_users` DISABLE KEYS */;
INSERT INTO `mazi_users` VALUES (1,NULL,NULL,'123',NULL,'','123@123',NULL,'2013-12-19 03:00:37','2013-12-19 03:00:37'),(2,NULL,NULL,'123',NULL,'','123',NULL,'2013-12-19 03:03:11','2013-12-19 03:03:11'),(3,NULL,NULL,'123123',NULL,'','123123',NULL,'2013-12-19 03:07:07','2013-12-19 03:07:07'),(4,NULL,NULL,'123',NULL,'','123123123',NULL,'2013-12-19 03:07:29','2013-12-19 03:07:29'),(5,NULL,NULL,'123123123',NULL,'','123123123123',NULL,'2013-12-19 03:07:50','2013-12-19 03:07:50'),(6,NULL,NULL,'11',NULL,'','11',NULL,'2013-12-19 03:09:52','2013-12-19 03:09:52'),(7,NULL,NULL,'qq',NULL,'','qq',NULL,'2013-12-19 03:12:10','2013-12-19 03:12:10'),(8,NULL,NULL,'1111',NULL,'','111',NULL,'2013-12-19 03:12:43','2013-12-19 03:12:43'),(9,NULL,NULL,'123123',NULL,'','111232',NULL,'2013-12-19 03:14:50','2013-12-19 03:14:50'),(10,NULL,NULL,'213123',NULL,'','111232213213',NULL,'2013-12-19 03:15:05','2013-12-19 03:15:05'),(11,NULL,NULL,'12',NULL,'','11123221321323',NULL,'2013-12-19 03:15:37','2013-12-19 03:15:37');
/*!40000 ALTER TABLE `mazi_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mazi_users_detail`
--

DROP TABLE IF EXISTS `mazi_users_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mazi_users_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `gender` tinyint(4) DEFAULT '1' COMMENT '1:Male,2:Female',
  `mobile` bigint(11) DEFAULT NULL COMMENT 'Mobile Phone',
  `remark` varchar(125) DEFAULT '',
  `follower_id` int(11) NOT NULL,
  `followee_id` int(11) NOT NULL,
  `follow_time` int(11) NOT NULL,
  `country` int(32) NOT NULL,
  `province` int(32) NOT NULL,
  `city` int(32) NOT NULL,
  `county` int(32) NOT NULL,
  `street` varchar(32) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `follower_id` (`follower_id`,`followee_id`),
  KEY `followee_id` (`followee_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='User Account';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mazi_users_detail`
--

LOCK TABLES `mazi_users_detail` WRITE;
/*!40000 ALTER TABLE `mazi_users_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `mazi_users_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mname` varchar(20) DEFAULT NULL COMMENT 'Media name',
  `mlocation` varchar(40) DEFAULT NULL COMMENT 'Media file location',
  `mdescription` varchar(200) DEFAULT NULL COMMENT 'Media description',
  `mnotes` varchar(200) DEFAULT NULL COMMENT 'Media notes',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='media';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `pid` int(11) NOT NULL,
  `pcates` int(11) NOT NULL,
  `units` int(11) NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `carts_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Orders from user to user.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(20) DEFAULT NULL COMMENT 'Page name',
  `pcates` int(20) DEFAULT NULL COMMENT 'Page categories',
  `ptitle` varchar(40) DEFAULT NULL COMMENT 'Page title',
  `psubtitle` varchar(40) DEFAULT NULL COMMENT 'Subtitle of page',
  `metadescription` text,
  `metakeywords` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='pages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='permissions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(20) DEFAULT NULL COMMENT 'Plugin name',
  `plocation` varchar(40) DEFAULT NULL COMMENT 'Plugin file location',
  `pdescription` varchar(200) DEFAULT NULL COMMENT 'Plugin description',
  `pnotes` varchar(200) DEFAULT NULL COMMENT 'Plugin notes',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='plugins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_notes`
--

DROP TABLE IF EXISTS `project_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL COMMENT 'Journals Set ID',
  `uid` int(11) NOT NULL COMMENT 'Author ID',
  `content` text NOT NULL,
  `title` varchar(40) DEFAULT NULL COMMENT 'Title of memos',
  `subtitle` varchar(40) DEFAULT NULL COMMENT 'Subtitle of memos',
  `cates` int(11) DEFAULT NULL COMMENT 'System Categories of journals',
  `tags` int(11) DEFAULT NULL COMMENT 'System tag of journals',
  `metadescription` text,
  `metakeywords` text,
  `description` varchar(300) NOT NULL COMMENT 'Description',
  `detail` text COMMENT 'Journals Detail',
  `attention` int(11) NOT NULL DEFAULT '0' COMMENT 'Amount of attention',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT 'Amount of clicks',
  `likes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Amount of likes',
  `price` decimal(10,2) DEFAULT NULL COMMENT 'Default price',
  `discount` decimal(10,2) DEFAULT NULL COMMENT 'Discount price',
  `is_discount` int(11) NOT NULL DEFAULT '0' COMMENT '1:Discount price 2:Default price',
  `seller_id` int(11) NOT NULL COMMENT 'Seller ID',
  `sales` int(11) DEFAULT '0' COMMENT 'Sales count',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Journals from users.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_notes`
--

LOCK TABLES `project_notes` WRITE;
/*!40000 ALTER TABLE `project_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(40) NOT NULL COMMENT 'Setting name',
  `svalue` varchar(40) NOT NULL COMMENT 'Setting value',
  `sdescription` varchar(200) DEFAULT NULL COMMENT 'Setting description',
  `snotes` varchar(200) DEFAULT NULL COMMENT 'Setting notes',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='settings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tname` varchar(20) DEFAULT NULL,
  `tcount` int(20) DEFAULT NULL COMMENT 'Amount of this tag',
  `ptag` varchar(20) DEFAULT NULL COMMENT 'Parent tag id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tags from users.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `themes`
--

DROP TABLE IF EXISTS `themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `themes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thname` varchar(20) DEFAULT NULL COMMENT 'Theme name',
  `thlocation` varchar(40) DEFAULT NULL COMMENT 'Theme file location',
  `thdescription` varchar(200) DEFAULT NULL COMMENT 'Theme description',
  `thnotes` varchar(200) DEFAULT NULL COMMENT 'Theme notes',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='themes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `themes`
--

LOCK TABLES `themes` WRITE;
/*!40000 ALTER TABLE `themes` DISABLE KEYS */;
/*!40000 ALTER TABLE `themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tools`
--

DROP TABLE IF EXISTS `tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tname` varchar(20) DEFAULT NULL COMMENT 'Tool name',
  `tlocation` varchar(40) DEFAULT NULL COMMENT 'Tool file location',
  `tdescription` varchar(200) DEFAULT NULL COMMENT 'Tool description',
  `tnotes` varchar(200) DEFAULT NULL COMMENT 'Tool notes',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='tools';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tools`
--

LOCK TABLES `tools` WRITE;
/*!40000 ALTER TABLE `tools` DISABLE KEYS */;
/*!40000 ALTER TABLE `tools` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-25 15:25:46
