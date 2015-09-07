/*
SQLyog Ultimate v8.3 
MySQL - 5.0.41-community-nt : Database - propertyproject
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`propertyproject` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `propertyproject`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL auto_increment,
  `uname` varchar(10) NOT NULL default '',
  `pwd` varchar(30) NOT NULL default '',
  `pic` varchar(40) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uname` (`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

insert  into `admin`(`id`,`uname`,`pwd`,`pic`) values (1,'admin','9v3/5IyQjesPTDvTbAMucg==','me.jpg');

/*Table structure for table `enquery` */

DROP TABLE IF EXISTS `enquery`;

CREATE TABLE `enquery` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `contact` decimal(10,0) NOT NULL,
  `msg` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `enquery` */

insert  into `enquery`(`id`,`name`,`mail`,`contact`,`msg`) values (1,'rahul','rahulmishra70cool@gmail.com','9827936806','what is the charge of registration?');

/*Table structure for table `mail` */

DROP TABLE IF EXISTS `mail`;

CREATE TABLE `mail` (
  `id` int(11) NOT NULL auto_increment,
  `tou` varchar(30) NOT NULL default '',
  `fromu` varchar(30) NOT NULL default '',
  `subject` varchar(50) NOT NULL default '',
  `msg` text NOT NULL,
  `maildate` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mail` */

insert  into `mail`(`id`,`tou`,`fromu`,`subject`,`msg`,`maildate`) values (1,'vishwajeetkumar40@gmail.com','rajneeshmishra70@gmail.com','testing','hiiiiiii.......','2015-04-29 23:39:16'),(2,'surbhi.rathi2092@gmail.com','rajneeshmishra70@gmail.com','testing','hiiiiii....','2015-05-05 13:44:13'),(3,'surbhi.rathi2092@gmail.com','rajneeshmishra70@gmail.com','testing','hiiiii.........','2015-05-05 16:11:22'),(4,'surbhi.rathi2092@gmail.com','rajneeshmishra70@gmail.com','testing','you can get all information of property and it\'s owner and no charge apply on you.\r\n','2015-05-05 16:18:02'),(5,'surbhi.rathi2092@gmail.com','rajneeshmishra70@gmail.com','testing','hiiiiii','2015-05-05 16:22:02'),(6,'surbhi.rathi2092@gmail.com','rajneeshmishra70@gmail.com','testing','hiiiii....','2015-05-05 16:26:41'),(7,'surbhi.rathi2092@gmail.com','rajneeshmishra70@gmail.com','testing','hiiii.........','2015-05-05 16:28:49'),(8,'rahulmishra70cool@gmail.com','rajneeshmishra70@gmail.com','testing','hiiiii','2015-05-05 16:48:42');

/*Table structure for table `postproperty` */

DROP TABLE IF EXISTS `postproperty`;

CREATE TABLE `postproperty` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `contact` decimal(10,0) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `type` varchar(20) NOT NULL,
  `area` varchar(30) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `rate` varchar(20) NOT NULL,
  `service` text NOT NULL,
  `pic` varchar(40) NOT NULL default '',
  `status` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `mail` (`mail`),
  CONSTRAINT `postproperty_ibfk_1` FOREIGN KEY (`mail`) REFERENCES `registration` (`mail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `postproperty` */

insert  into `postproperty`(`id`,`name`,`contact`,`mail`,`type`,`area`,`city`,`state`,`rate`,`service`,`pic`,`status`) values (1,'Durgesh Gupta','9804521547','durgesh@gmail.com','Buy','ghandi nagar','bhopal','Madhya Pradesh','Above 20 Lacks','bungalow','DSCN0394.JPG',0),(2,'Durgesh Gupta','9804521547','durgesh@gmail.com','Rent','palasiya','indore','Madhya Pradesh','Below 5 Lack','3 BHK Flate  ','ff0.jpg',1),(3,'Durgesh Gupta','9804521547','durgesh@gmail.com','Buy','bus Stand','bhopal','Madhya Pradesh','10 - 20 Lack','3 BHK Flate','DSCN0394.JPG',0),(4,'Gaurav Thakur','9658724106','gaurav@gmail.com','Rent','Indorama','Indorama','Madhya Pradesh','Below 5 Lack','flate','ff1.jpg',1),(5,'Gaurav Thakur','9658724106','gaurav@gmail.com','Buy','near Station','bhopal','Madhya Pradesh','5 - 10 Lack','flate','IMG_20131020_122609.jpg',0),(6,'Gaurav Thakur','9658724106','gaurav@gmail.com','Sell','vijay nagar','indore','Madhya Pradesh','10 - 20 Lack','bungalow','rr0.jpg',1),(7,'Pawan Mishra','9651339229','pawanmishra@gmail.com','Sell','foolbag','jhansi','Uttar Pradesh','Above 20 Lacks','bungalow','rr5.jpg',1),(8,'Pawan mishra','9651339229','pawanmishra@gmail.com','Sell','saket nagar','kanpur','Uttar Pradesh','10 - 20 Lack','bangalow','rr9.jpg',1),(9,'Pawan Mishra','9651339229','pawanmishra@gmail.com','Sell','Bhawar kua','indore','Madhya Pradesh','10 - 20 Lack','3 BHK Flate','f1.jpg',1),(10,'Divya Puraswani','8269034672','divyapuraswani@gmail.com','Sell','sindhi colony','indore','Madhya Pradesh','10 - 20 Lack','bungalow','rr6.jpg',1);

/*Table structure for table `registration` */

DROP TABLE IF EXISTS `registration`;

CREATE TABLE `registration` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `gender` varchar(7) NOT NULL,
  `mail` varchar(30) NOT NULL default '',
  `pwd` varchar(30) NOT NULL default '',
  `contact` decimal(10,0) NOT NULL,
  `state` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `status` int(10) unsigned NOT NULL default '0',
  `pic` varchar(40) NOT NULL default '',
  `authcode` varchar(20) NOT NULL,
  PRIMARY KEY  (`mail`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `registration` */

insert  into `registration`(`id`,`name`,`gender`,`mail`,`pwd`,`contact`,`state`,`city`,`status`,`pic`,`authcode`) values (7,'Apurva Meher','female','ameher@gmail.com','jPoigrF94KWYwBD18BCefQ==','7839062481','Madhya Pradesh','Bhopal',1,'female.jpg','Z54uVHaqY**B'),(6,'Divya Puraswani','female','divyapuraswani@gmail.com','jPoigrF94KWYwBD18BCefQ==','8269034672','Madhya Pradesh','indore',1,'IMG-20150227-WA0006.jpg','wt5Dq7JXQE@G'),(1,'Durgesh Gupta','male','durgesh@gmail.com','jPoigrF94KWYwBD18BCefQ==','9804521547','Madhya Pradesh','jabalpur',1,'DSCN0394.JPG','vAA6pRMSS*EN'),(2,'Gaurav Thakur','male','gaurav@gmail.com','jPoigrF94KWYwBD18BCefQ==','9658724106','Madhya Pradesh','rau',1,'IMG_20131020_122609.jpg','u3bZ8wX5Cwtc'),(4,'Karan Chitre','male','karan@gmail.com','jPoigrF94KWYwBD18BCefQ==','8269547306','Madhya Pradesh','indore',1,'male.jpg','ZpDrrEXeWwhv'),(10,'Pawan Mishra','male','pawanmishra@gmail.com','jPoigrF94KWYwBD18BCefQ==','9651339229','Uttar Pradesh','Jhansi',1,'001.jpg','xtqp@zFdAxwf'),(5,'Rajkumar Verma','male','rajverma@gmail.com','jPoigrF94KWYwBD18BCefQ==','9827506315','Madhya Pradesh','shivpuri',0,'male.jpg','ns@F$5dye3$G'),(3,'Rakesh Sevak','male','rakesh@gmail.com','jPoigrF94KWYwBD18BCefQ==','8269537810','Rajasthan','Bodigama',1,'male.jpg','5ESm$wh9yJ7m'),(9,'Surabhi Rathi','female','surabhirathi@gmail.com','jPoigrF94KWYwBD18BCefQ==','8269034682','Madhya Pradesh','Nimach',1,'female.jpg','8JMkjRzyHHFh'),(8,'usha Phulwani','female','ushaphulwani91@gmail.com','jPoigrF94KWYwBD18BCefQ==','9827654106','Chattisgarh','raypur',0,'female.jpg','afYUyy@xusxS');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
