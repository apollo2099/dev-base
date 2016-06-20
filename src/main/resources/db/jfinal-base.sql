/*
SQLyog v10.2 
MySQL - 5.6.21-log : Database - jfinal_base
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jfinal_base` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `jfinal_base`;

/*Table structure for table `blog` */

DROP TABLE IF EXISTS `blog`;

CREATE TABLE `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Data for the table `blog` */

insert  into `blog`(`id`,`title`,`content`) values (1,'JFinal Demo Title here','JFinal Demo Content here22228888888888888'),(2,'test 1','test 1'),(3,'test 2','test 2'),(4,'test 3','test 3'),(5,'test 4','test 4'),(6,'test','test'),(7,'44444','444444'),(8,'rrrrrrrr','rrrrrr'),(9,'ttt','tttee'),(12,'1222','11111'),(13,'666','666'),(14,'JFinal Demo Title here','JFinal Demo Content here'),(15,'test 16','test 1'),(16,'2','tttt'),(17,'1','11111'),(18,'12222222222222','3333333333'),(19,'23333333334444','44444444444444444444444444444444444444444'),(20,'111','11111'),(21,'eee','eeeeee'),(22,'666666666666','666666666'),(23,'333','3333'),(24,'66666666666666','666666666666666'),(25,'tt','ssss'),(26,'66666664444','44444'),(27,'122222222','2222'),(28,'222','33333'),(29,'22','3333'),(30,'ttt','ssss'),(31,'tesss','agsds');

/*Table structure for table `sys_button` */

DROP TABLE IF EXISTS `sys_button`;

CREATE TABLE `sys_button` (
  `button_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL COMMENT '子菜单名称',
  `button_name` varchar(64) NOT NULL COMMENT '按钮名称',
  `button_url` varchar(255) NOT NULL COMMENT '按钮路径',
  `status` int(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`button_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_button` */

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(64) NOT NULL COMMENT '菜单名称',
  `menu_url` varchar(255) DEFAULT NULL COMMENT '菜单URL',
  `parent_id` int(11) DEFAULT NULL COMMENT '父菜单ID',
  `menu_order` int(11) DEFAULT NULL COMMENT '菜单顺序',
  `menu_icon` varchar(32) DEFAULT NULL COMMENT '菜单图标',
  `description` varchar(255) DEFAULT NULL,
  `status` int(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_menu` */

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(64) NOT NULL COMMENT '角色名称',
  `removable` int(3) NOT NULL DEFAULT '0' COMMENT '可被删除 0=不行 1=可以',
  `allocatable` int(3) DEFAULT '1' COMMENT '可被分配 0=不行 1=可以',
  `description` varchar(255) DEFAULT NULL,
  `status` int(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role` */

/*Table structure for table `sys_role_resource` */

DROP TABLE IF EXISTS `sys_role_resource`;

CREATE TABLE `sys_role_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT '0',
  `resource_id` int(11) NOT NULL DEFAULT '0',
  `resource_type` int(3) NOT NULL DEFAULT '0' COMMENT '资源类型：1-分类； 2-菜单；3-按钮',
  PRIMARY KEY (`id`),
  KEY `role_id_idx` (`role_id`),
  KEY `resource_id_idx` (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限和资源（菜单+按钮）';

/*Data for the table `sys_role_resource` */

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(64) NOT NULL COMMENT '登录名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `last_login` varchar(255) DEFAULT NULL COMMENT '上次登录时间',
  `ip` varchar(32) DEFAULT NULL COMMENT 'IP',
  `status` varchar(32) DEFAULT NULL COMMENT '状态',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`login_name`,`password`,`name`,`last_login`,`ip`,`status`,`description`) values (1,'admin','admin','admin','',NULL,'1',NULL);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色';

/*Data for the table `sys_user_role` */


CREATE TABLE `sys_log` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) DEFAULT '' COMMENT '日志标题',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) DEFAULT NULL COMMENT '操作方式',
  `params` text COMMENT '操作提交的数据',
  `exception` text COMMENT '异常信息',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志表';
