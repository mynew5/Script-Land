SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for guildhouses
-- ----------------------------
DROP TABLE IF EXISTS `guildhouses`;
CREATE TABLE `guildhouses` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `guildId` bigint(20) NOT NULL DEFAULT '0',
  `x` double NOT NULL,
  `y` double NOT NULL,
  `z` double NOT NULL,
  `map` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of guildhouses
-- ----------------------------
INSERT INTO `guildhouses` VALUES ('1', '13', '7368', '-1560', '163', '1', 'Trolldorf Dunkelküste');
INSERT INTO `guildhouses` VALUES ('2', '0', '-1840', '-4233', '2.14', '0', 'Zwergendorf Arathi');
INSERT INTO `guildhouses` VALUES ('3', '0', '-2681.399902', '-4787.209961', '16.1', '1', 'Insel Alcaz');
INSERT INTO `guildhouses` VALUES ('4', '11', '-8271.24', '-224.84', '266.999', '0', 'Wald von Elwynn');
INSERT INTO `guildhouses` VALUES ('5', '0', '-3030.2', '60.1', '189.5', '1', 'Mulgore Säule');
INSERT INTO `guildhouses` VALUES ('6', '0', '-11382.8', '-4798.6', '1.9', '1', 'Tanaris Insel 1');
INSERT INTO `guildhouses` VALUES ('7', '0', '-11778.3', '-4720.8', '2.7', '1', 'Tanaris Insel 2');
INSERT INTO `guildhouses` VALUES ('8', '0', '-4026.96', '-1419.7', '157.5', '0', 'Zwergendorf Sumpfland');
INSERT INTO `guildhouses` VALUES ('9', '0', '-2578.9', '8606.9', '183.5', '530', 'Nagrand fliegende Insel');
INSERT INTO `guildhouses` VALUES ('10', '14', '-1036.999', '1398.91', '54.3', '0', 'Gilneas');
INSERT INTO `guildhouses` VALUES ('11', '0', '4300.8', '-2760.8', '16.8', '0', 'Quel\'Thalas');
INSERT INTO `guildhouses` VALUES ('12', '0', '3520.4', '-4537.7', '197.5', '533', 'Alt Naxxramas aussen');
INSERT INTO `guildhouses` VALUES ('13', '0', '-193.8', '1625.9', '79.8', '0', 'Burg Schattenfang');
INSERT INTO `guildhouses` VALUES ('14', '0', '-1561.7', '581.3', '0.0002', '36', 'Unbekanntes Gebiet');
