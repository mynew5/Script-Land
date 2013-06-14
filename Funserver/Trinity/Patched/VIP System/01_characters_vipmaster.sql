CREATE TABLE `vip_items` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` mediumint(6) DEFAULT '0',
  `charname` varchar(32) DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;