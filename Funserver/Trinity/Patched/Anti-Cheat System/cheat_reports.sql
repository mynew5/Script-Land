/*
SQLyog Enterprise - MySQL GUI
MySQL - 5.1.41 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

create table `cheat_reports` (
	`id` double ,
	`guid` double ,
	`name` varchar (300),
	`latency` double ,
	`mapid` int ,
	`position_x` float ,
	`position_y` float ,
	`position_z` float ,
	`report` varchar (300),
	`time` datetime 
); 
