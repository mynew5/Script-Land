/**********************************************
 LoE World changeset   Rev. 6  
 11.12.2012
**********************************************/

-- 14.11.2012
ALTER TABLE `quest_poi` CHANGE `questId` `questId` SMALLINT( 5 ) UNSIGNED NOT NULL COMMENT 'Quest ID';
ALTER TABLE `quest_poi` CHANGE `poiId` `poiId` TINYINT( 3 ) UNSIGNED NOT NULL COMMENT 'Refers to quest_poi_points';
ALTER TABLE `quest_poi` CHANGE `objIndex` `objIndex` TINYINT( 2 ) NOT NULL DEFAULT '0' COMMENT 'Objective ID';
ALTER TABLE `quest_poi` CHANGE `mapId` `mapId` SMALLINT( 3 ) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Map ID';
ALTER TABLE `quest_poi` CHANGE `mapAreaId` `mapAreaId` SMALLINT( 3 ) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Area ID';
ALTER TABLE `quest_poi` CHANGE `floorId` `floorId` TINYINT( 1 ) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Floor';
ALTER TABLE `quest_poi` CHANGE `unk3` `unk3` TINYINT( 1 ) UNSIGNED NOT NULL DEFAULT '0';
ALTER TABLE `quest_poi` CHANGE `unk4` `unk4` TINYINT( 1 ) UNSIGNED NOT NULL DEFAULT '0';

-- 15.11.2012
-- remove hallows'end loot
DELETE FROM loot_creatures WHERE itemid=33117;
DELETE FROM loot_creatures WHERE itemid=34068;
DELETE FROM loot_creatures WHERE itemid=29575;
DELETE FROM loot_creatures WHERE itemid=20400;

UPDATE gameobject_spawns SET Facing=-2.021631 WHERE id=26139; -- was +1.5

-- 18.11
UPDATE creature_spawns SET position_x=2281.3, position_y=5118.7, position_z=0.18, orientation=5.17 WHERE id=111986;

-- bug 952
REPLACE INTO creature_spawns (id, entry, map, position_x, position_y, position_z, orientation, movetype, displayid, faction, flags, bytes0, bytes1, bytes2, emote_state, npc_respawn_link, channel_spell, channel_target_sqlid, channel_target_sqlid_creature, standstate, death_state, mountdisplayid, slot1item, slot2item, slot3item, CanFly, `phase`) VALUES
(141697, 8667, 1, -7940.200, -3292.640, 63.720, 5.59596, 0, 8715, 91, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(141696, 8667, 1, -7887.400, -3218.350, 72.857, 0.341645, 0, 8715, 91, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(141695, 8667, 1, -7856.400, -3134.320, 75.807, 1.65326, 0, 8715, 91, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(141694, 8667, 1, -7775.650, -3088.090, 64.278, 0.0353403, 0, 8715, 91, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(141693, 8667, 1, -7709.970, -3172.080, 62.776, 5.54884, 0, 8715, 91, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(141692, 8667, 1, -7558.900, -3227.340, 32.830, 6.17325, 0, 8715, 91, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(141691, 8667, 1, -7511.290, -3335.370, 21.010, 4.84201, 0, 8715, 91, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(141690, 8667, 1, -7520.670, -3463.240, 24.492, 4.88128, 0, 8715, 91, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(141689, 8667, 1, -7536.120, -3575.740, 10.624, 3.1534, 0, 8715, 91, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(141688, 8667, 1, -7610.140, -3732.210, 16.463, 3.76602, 0, 8715, 91, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(141687, 8667, 1, -7672.470, -3798.890, 19.838, 3.78172, 0, 8715, 91, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(141686, 8667, 1, -7761.730, -3771.650, 38.157, 2.98454, 0, 8715, 91, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(141685, 8667, 1, -7833.630, -3744.080, 49.948, 2.89029, 0, 8715, 91, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(141684, 8667, 1, -7984.710, -3666.260, 70.488, 2.09311, 0, 8715, 91, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);

UPDATE quests SET RequiredQuest1=5513, IsRepeatable=0 WHERE entry=5517;
DELETE FROM npc_gossip_textid WHERE creatureid=1201;

-- 21.11 bug 965
UPDATE creature_proto SET faction=978 WHERE entry=18009; 
UPDATE creature_spawns SET faction=978 WHERE id=74729; 
UPDATE creature_proto SET faction=978 WHERE entry=18010; 
UPDATE creature_spawns SET faction=978 WHERE id=74730; 
UPDATE creature_proto SET faction=978 WHERE entry=20028; 
UPDATE creature_spawns SET faction=978 WHERE id=83364; 
UPDATE creature_proto SET faction=978 WHERE entry=18908; 
UPDATE creature_spawns SET faction=978 WHERE id=79423;

UPDATE creature_proto SET npcflags=0 WHERE entry=2499; 

-- Pilgrims Bounty
UPDATE creature_proto SET faction=83 WHERE entry=34654; 
UPDATE creature_proto SET faction=83 WHERE entry=34787; 
UPDATE creature_proto SET faction=83 WHERE entry=34713; 
UPDATE creature_proto SET faction=83 WHERE entry=34685;
UPDATE creature_proto SET faction=83 WHERE entry=34679;
UPDATE creature_proto SET faction=83 WHERE entry=34768;
UPDATE creature_proto SET faction=83 WHERE entry=34683;
UPDATE creature_proto SET faction=83 WHERE entry=34712;
UPDATE creature_proto SET faction=83 WHERE entry=34677;
UPDATE creature_proto SET faction=83 WHERE entry=34678;
UPDATE creature_proto SET faction=83 WHERE entry=34684;
UPDATE creature_proto SET faction=83 WHERE entry=34714;
UPDATE creature_proto SET faction=83 WHERE entry=35341;
UPDATE creature_proto SET faction=83 WHERE entry=35342;
UPDATE creature_proto SET faction=83 WHERE entry=35343;

-- not yet used in arcemu
CREATE TABLE IF NOT EXISTS weather_season (
  `group` tinyint(4) NOT NULL COMMENT 'Weather seasion',
  active tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Only one season can be active',
  `comment` text NOT NULL COMMENT 'Personal comments',
  KEY active (active)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO weather_season (`group`, active, `comment`) VALUES
(0, 1, 'Spring'),
(1, 0, 'Summer'),
(2, 0, 'Autumn'),
(3, 0, 'Winter');

-- 5.12.2012
UPDATE quests SET RequiredOneOfQuest='9982 9983', RequiredQuest1=0 WHERE entry=9991;

-- 7.12.2012
ALTER TABLE `db_version` CHANGE `game_version` `game_version` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '';
DELETE FROM vendors WHERE item=49177; -- account bound item

-- Pilgrim's bounty
UPDATE `creature_proto` SET `npcflags` = `npcflags`|1|2 WHERE `entry` IN (18927,19148,19169,19171,19172,19173,19175,19176,19177,19178,20102,34644,34653,34654,34675,34676,34677,34678,34679,34744);
UPDATE `creature_proto` SET `npcflags` = `npcflags`|128 WHERE `entry` IN (35343,35337,35338,35342,35341);
UPDATE `creature_proto` SET `npcflags` = `npcflags`|128|1 WHERE `entry` IN (34685,34684,34683,34682,34681,34645,34783);
UPDATE `creature_proto` SET `npcflags` = `npcflags`|64|16|2|1 WHERE `entry` IN (34708,34710,34712,34713,34714,34711);
UPDATE `creature_proto` SET `npcflags` = `npcflags`|64|16|1 WHERE `entry` IN (34785,34786);
UPDATE `creature_proto` SET `npcflags` = `npcflags`|16777216 WHERE `entry` IN (34812,34822,34823,34819,34824);

UPDATE `creature_proto` SET `minhealth`=2, `maxhealth`=2, `armor`=17 WHERE `entry`=32820;
UPDATE `creature_proto` SET `minhealth`=112, `maxhealth`=112, `armor`=14, `mana`=120 WHERE `entry` IN(34812,34822,34823,34819,34824);
UPDATE `creature_proto` SET `minlevel`=40, `maxlevel`=40, `minhealth`=1524, `maxhealth`=1524, `armor`=1979 WHERE `entry` IN (34786,34785,34711,34714,34713,34712,34710,34708,35340,35341,35342,35338,35337,35343,34787,34685,34684,34683,34682,34681,34645,34783,34675,34676,34677,34678,34679,34744,34644,34768);
UPDATE `creature_proto` SET `minlevel`=60, `maxlevel`=60, `minhealth`=42, `maxhealth`=42, `armor`=3750 WHERE `entry` IN (19177,20102);
UPDATE `creature_proto` SET `minlevel`=80, `maxlevel`=80, `minhealth`=5342, `maxhealth`=5342, `armor`=9730 WHERE `entry` IN (19177,20102);

UPDATE `creature_proto` SET `vehicleid`=321, `rooted`=1 WHERE `entry` IN (34823,34822,34819,34812,34824);
UPDATE `creature_proto` SET `vehicleid`=320, `rooted`=1 WHERE `entry`=32823;
UPDATE `creature_proto` SET `vehicleid`=323, `rooted`=1 WHERE `entry`=32830;
UPDATE `creature_proto` SET `vehicleid`=325, `rooted`=1 WHERE `entry`=32840;

DELETE FROM `vehicle_accessories` WHERE `creature_entry` IN (32823,32830,32840);
INSERT INTO `vehicle_accessories` (`creature_entry`,`accessory_entry`,`seat`) VALUES
	-- Bountiful Table
	(32823,34812,0), -- The Cranberry Chair
	(32823,34823,1), -- The Stuffing Chair
	(32823,34819,2), -- The Pie Chair (complete)
	(32823,34824,3), -- The Sweet Potato Chair
	(32823,34822,4), -- The Turkey Chair
	(32823,32830,5), -- Food Holder
	(32823,32840,6), -- Plate Holder
	-- Food Holder
	(32830,32824,0), -- [PH] Pilgrim's Bounty Table - Turkey
	(32830,32827,1), -- [PH] Pilgrim's Bounty Table - Cranberry Sauce
	(32830,32831,2), -- [PH] Pilgrim's Bounty Table - Stuffing
	(32830,32825,3), -- [PH] Pilgrim's Bounty Table - Yams
	(32830,32829,4), -- [PH] Pilgrim's Bounty Table - Pie
	-- Plte Holder
	(32840,32839,0), -- Plate Holder Plate
	(32840,32839,1), -- Plate Holder Plate
	(32840,32839,2), -- Plate Holder Plate
	(32840,32839,3), -- Plate Holder Plate
	(32840,32839,4); -- Plate Holder Plate
	
UPDATE `creature_proto` SET `auras` = '61793' WHERE `entry`=34823;
UPDATE `creature_proto` SET `auras` = '61794' WHERE `entry`=34822;
UPDATE `creature_proto` SET `auras` = '61795' WHERE `entry`=34819;
UPDATE `creature_proto` SET `auras` = '61796' WHERE `entry`=34812;
UPDATE `creature_proto` SET `auras` = '61796' WHERE `entry`=34824;
UPDATE `creature_proto` SET `auras` = '33209' WHERE `entry`=19178;

UPDATE `creature_names` SET `male_displayid`=29205 WHERE `entry` IN (34812,34822,34823,34819,34824);


SET @PASS_PIE = 66260;
SET @PASS_TURKEY = 66250;
SET @PASS_POTATO = 66262;
SET @PASS_STUFFING = 66259;
SET @PASS_CRANBERRY = 66261;
SET @FEAST_PIE = 61787;
SET @FEAST_TURKEY = 61784;
SET @FEAST_POTATO = 61786;
SET @FEAST_STUFFING = 61788;
SET @FEAST_CRANBERRY = 61785;
SET @RIDE_VEHICLE = 65403;

UPDATE `creature_proto` SET `spell1`=@PASS_CRANBERRY, `spell2`=@FEAST_TURKEY, `spell3`=@FEAST_STUFFING, `spell4`=@FEAST_POTATO, `spell5`=@FEAST_PIE, `spell8`=@RIDE_VEHICLE WHERE `entry`=34823; -- The Cranberry Chair
UPDATE `creature_proto` SET `spell1`=@PASS_PIE, `spell2`=@FEAST_TURKEY, `spell3`=@FEAST_CRANBERRY, `spell4`=@FEAST_POTATO, `spell5`=@FEAST_STUFFING, `spell8`=@RIDE_VEHICLE WHERE `entry`=34822; -- The Pie Chair
UPDATE `creature_proto` SET `spell1`=@PASS_POTATO, `spell2`=@FEAST_TURKEY, `spell3`=@FEAST_CRANBERRY, `spell4`=@FEAST_POTATO, `spell5`=@FEAST_PIE, `spell8`=@RIDE_VEHICLE WHERE `entry`=34824; -- The Sweet Potato Chair
UPDATE `creature_proto` SET `spell1`=@PASS_STUFFING, `spell2`=@FEAST_TURKEY, `spell3`=@FEAST_CRANBERRY, `spell4`=@FEAST_POTATO, `spell5`=@FEAST_PIE, `spell8`=@RIDE_VEHICLE WHERE `entry`=34819; -- The Stuffing Chair
UPDATE `creature_proto` SET `spell1`=@PASS_TURKEY, `spell2`=@FEAST_CRANBERRY, `spell3`=@FEAST_STUFFING, `spell4`=@FEAST_POTATO, `spell5`=@FEAST_PIE, `spell8`=@RIDE_VEHICLE  WHERE `entry`=34812; -- The Turkey Chair

DELETE FROM `trainer_spells` WHERE `entry` IN (34708,34710,34712,34713,34714,34711,34785,34786);
INSERT INTO `trainer_spells` (`entry`,`cast_spell`,`learn_spell`,`spellcost`,`reqspell`,`reqskill`,`reqskillvalue`,`reqlevel`,`deletespell`) VALUES
	(34708,0,2539,'50',0,185,10,0,0),
	(34708,0,2541,'100',0,185,50,0,0),
	(34708,0,2544,'200',0,185,75,0,0),
	(34708,0,2546,'150',0,185,80,0,0),
	(34708,2551,0,'100',0,0,0,0,0),
	(34708,3412,0,'500',0,185,50,0,0),
	(34708,0,6499,'100',0,185,50,0,0),
	(34708,0,6500,'300',0,185,125,0,0),
	(34708,18261,0,'25000',0,185,200,0,0),
	(34708,0,21175,'4000',0,185,200,0,0),
	(34708,0,37836,'10',0,185,1,0,0),
	(34708,54257,0,'1000',0,185,125,0,0),
	(34710,0,2539,'50',0,185,10,0,0),
	(34710,0,2541,'100',0,185,50,0,0),
	(34710,0,2544,'200',0,185,75,0,0),
	(34710,0,2546,'150',0,185,80,0,0),
	(34710,2551,0,'100',0,0,0,0,0),
	(34710,3412,0,'500',0,185,50,0,0),
	(34710,0,6499,'100',0,185,50,0,0),
	(34710,0,6500,'300',0,185,125,0,0),
	(34710,18261,0,'25000',0,185,200,0,0),
	(34710,0,21175,'4000',0,185,200,0,0),
	(34710,0,37836,'10',0,185,1,0,0),
	(34710,54257,0,'1000',0,185,125,0,0),
	(34711,0,2539,'50',0,185,10,0,0),
	(34711,0,2541,'100',0,185,50,0,0),
	(34711,0,2544,'200',0,185,75,0,0),
	(34711,0,2546,'150',0,185,80,0,0),
	(34711,0,6499,'100',0,185,50,0,0),
	(34711,0,6500,'300',0,185,125,0,0),
	(34711,0,21175,'4000',0,185,200,0,0),
	(34711,0,37836,'10',0,185,1,0,0),
	(34712,0,2539,'50',0,185,10,0,0),
	(34712,0,2541,'100',0,185,50,0,0),
	(34712,0,2544,'200',0,185,75,0,0),
	(34712,0,2546,'150',0,185,80,0,0),
	(34712,2551,0,'100',0,0,0,0,0),
	(34712,3412,0,'500',0,185,50,0,0),
	(34712,0,6499,'100',0,185,50,0,0),
	(34712,0,6500,'300',0,185,125,0,0),
	(34712,18261,0,'25000',0,185,200,0,0),
	(34712,0,21175,'4000',0,185,200,0,0),
	(34712,0,37836,'10',0,185,1,0,0),
	(34712,54257,0,'1000',0,185,125,0,0),
	(34713,0,2539,'50',0,185,10,0,0),
	(34713,0,2541,'100',0,185,50,0,0),
	(34713,0,2544,'200',0,185,75,0,0),
	(34713,0,2546,'150',0,185,80,0,0),
	(34713,2551,0,'100',0,0,0,0,0),
	(34713,3412,0,'500',0,185,50,0,0),
	(34713,0,6499,'100',0,185,50,0,0),
	(34713,0,6500,'300',0,185,125,0,0),
	(34713,18261,0,'25000',0,185,200,0,0),
	(34713,0,21175,'4000',0,185,200,0,0),
	(34713,0,37836,'10',0,185,1,0,0),
	(34713,54257,0,'1000',0,185,125,0,0),
	(34714,0,2539,'50',0,185,10,0,0),
	(34714,0,2541,'100',0,185,50,0,0),
	(34714,0,2544,'200',0,185,75,0,0),
	(34714,0,2546,'150',0,185,80,0,0),
	(34714,0,6499,'100',0,185,50,0,0),
	(34714,0,6500,'300',0,185,125,0,0),
	(34714,0,21175,'4000',0,185,200,0,0),
	(34714,0,37836,'10',0,185,1,0,0),
	(34785,0,2539,'50',0,185,10,0,0),
	(34785,0,2541,'100',0,185,50,0,0),
	(34785,0,2544,'200',0,185,75,0,0),
	(34785,0,2546,'150',0,185,80,0,0),
	(34785,0,6499,'100',0,185,50,0,0),
	(34785,0,6500,'300',0,185,125,0,0),
	(34785,0,21175,'4000',0,185,200,0,0),
	(34785,0,37836,'10',0,185,1,0,0),
	(34786,0,2539,'50',0,185,10,0,0),
	(34786,0,2541,'100',0,185,50,0,0),
	(34786,0,2544,'200',0,185,75,0,0),
	(34786,0,2546,'150',0,185,80,0,0),
	(34786,0,6499,'100',0,185,50,0,0),
	(34786,0,6500,'300',0,185,125,0,0),
	(34786,0,21175,'4000',0,185,200,0,0),
	(34786,0,37836,'10',0,185,1,0,0);

DELETE FROM `trainer_defs` WHERE `entry` IN (34708,34710,34712,34713,34714,34711,34785,34786);
INSERT INTO `trainer_defs` (`entry`,`required_skill`,`required_skillvalue`,`req_class`,`RequiredRace`,`RequiredReputation`,`RequiredReputationValue`,`trainer_type`,`trainer_ui_window_message`,`can_train_gossip_textid`,`cannot_train_gossip_textid`) VALUES
	(34708,0,0,0,0,0,0,2,'Can I teach you how to turn the meat you find on beasts into a feast?',0,0),
	(34710,0,0,0,0,0,0,2,'Can I teach you how to turn the meat you find on beasts into a feast?',0,0),
	(34712,0,0,0,0,0,0,2,'Can I teach you how to turn the meat you find on beasts into a feast?',0,0),
	(34713,0,0,0,0,0,0,2,'Can I teach you how to turn the meat you find on beasts into a feast?',0,0),
	(34714,0,0,0,0,0,0,2,'Can I teach you how to turn the meat you find on beasts into a feast?',0,0),
	(34711,0,0,0,0,0,0,2,'Can I teach you how to turn the meat you find on beasts into a feast?',0,0),
	(34785,0,0,0,0,0,0,2,'Can I teach you how to turn the meat you find on beasts into a feast?',0,0),
	(34786,0,0,0,0,0,0,2,'Can I teach you how to turn the meat you find on beasts into a feast?',0,0);

-- 8.12.2012
UPDATE loot_items SET normal10percentchance=100 WHERE entryid=24336 AND itemid=24335;
UPDATE loot_items SET normal10percentchance=100 WHERE entryid=24336 AND itemid=23682;

-- 8.12.2012
-- für Quest 9467 Draenei/Schamane Ruf des Feuers
-- Prpblem: Man erhält eine Fackel, mit der man aber den Strohmann nicht anzünden kann
-- Cheat: Spawn the quest NPC
REPLACE INTO creature_spawns (id, entry, map, position_x, position_y, position_z, orientation, movetype, displayid, faction, flags, bytes0, bytes1, bytes2, emote_state, npc_respawn_link, channel_spell, channel_target_sqlid, channel_target_sqlid_creature, standstate, death_state, mountdisplayid, slot1item, slot2item, slot3item, CanFly, `phase`) VALUES
(199000, 17206, 530, -5025.320, -10955.100, 18.785, 3.73064, 0, 12231, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);

-- 9.12.2012
-- Pilgrim's Bounty
-- Problem: Spells are not working
-- Cheat: Remove some quest requirements
-- alli:
UPDATE quests SET ReqKillMobOrGOCount1=0 WHERE entry=14023 ;  -- was 5
UPDATE quests SET ReqKillMobOrGOId1=0 WHERE entry=14023 ;  -- was 34737
UPDATE quests SET ReqKillMobOrGOCount1=0 WHERE entry=14024 ;  -- was 5
UPDATE quests SET ReqKillMobOrGOId1=0 WHERE entry=14024 ;  -- was 34740
UPDATE quests SET ReqKillMobOrGOCount1=0 WHERE entry=14028 ;  -- was 5
UPDATE quests SET ReqKillMobOrGOId1=0 WHERE entry=14028 ;  -- was 34741
UPDATE quests SET ReqKillMobOrGOCount1=0 WHERE entry=14033 ;  -- was 5
UPDATE quests SET ReqKillMobOrGOId1=0 WHERE entry=14033 ;  -- was 34739
UPDATE quests SET ReqKillMobOrGOCount1=0 WHERE entry=14035 ;  -- was 5
UPDATE quests SET ReqKillMobOrGOId1=0 WHERE entry=14035 ;  -- was 34738
-- horde:
UPDATE quests SET ReqKillMobOrGOCount1=0 WHERE entry=14037 ;  -- was 5
UPDATE quests SET ReqKillMobOrGOId1=0 WHERE entry=14037 ;  -- was 34737
UPDATE quests SET ReqKillMobOrGOCount1=0 WHERE entry=14040 ;  -- was 5
UPDATE quests SET ReqKillMobOrGOId1=0 WHERE entry=14040 ;  -- was 34740
UPDATE quests SET ReqKillMobOrGOCount1=0 WHERE entry=14047 ;  -- was 5
UPDATE quests SET ReqKillMobOrGOId1=0 WHERE entry=14047 ;  -- was 34738
UPDATE quests SET ReqKillMobOrGOCount1=0 WHERE entry=14041 ;  -- was 5
UPDATE quests SET ReqKillMobOrGOId1=0 WHERE entry=14041 ;  -- was 34741
UPDATE quests SET ReqKillMobOrGOCount1=0 WHERE entry=14043 ;  -- was 5
UPDATE quests SET ReqKillMobOrGOId1=0 WHERE entry=14043 ;  -- was 34739

-- 11.12.2012
-- Problem: Creatures are not lootable
-- Cheat: Set type to 0
UPDATE creature_names SET type=0 WHERE entry=32820;  -- was 8
UPDATE creature_names SET type=0 WHERE entry=23979;  -- was 8


-- Set LoE db version
UPDATE db_version SET revision=6 WHERE db_name='LoE World';