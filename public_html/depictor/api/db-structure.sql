# ************************************************************
# Sequel Ace SQL dump
# Version 3038
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: localhost (MySQL 5.7.32)
# Database: wikitools
# Generation Time: 2021-08-24 12:02:23 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table depictor_files
# ------------------------------------------------------------

DROP TABLE IF EXISTS `depictor_files`;

CREATE TABLE `depictor_files` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mid` varchar(64) DEFAULT NULL,
  `qid` varchar(64) DEFAULT NULL,
  `category` varchar(255) DEFAULT '',
  `status` enum('depicted','not-depicted','user-skipped','prominently-depicted') DEFAULT NULL,
  `timestamp` varchar(32) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table depictor_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `depictor_items`;

CREATE TABLE `depictor_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `qid` varchar(64) DEFAULT NULL,
  `status` enum('done') DEFAULT NULL,
  `timestamp` varchar(32) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
