CREATE TABLE IF NOT EXISTS `active_event_id` (
  `active_event` int(10) unsigned NOT NULL,
  `name` text COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`active_event`)
);

DELETE FROM `active_event_id` WHERE `active_event`=19;
INSERT INTO `active_event_id` (`active_event`, `name`) VALUES (19,"Fishing Extravaganza Announce");

DELETE FROM `creature_spawns` WHERE `id` BETWEEN 434404 AND 434405;
INSERT INTO `creature_spawns` (`id`, `entry`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `movetype`, `displayid`, `faction`, `flags`, `bytes0`, `bytes1`, `bytes2`, `emote_state`, `npc_respawn_link`, `channel_spell`, `channel_target_sqlid`, `channel_target_sqlid_creature`, `standstate`, `death_state`, `mountdisplayid`, `slot1item`, `slot2item`, `slot3item`, `CanFly`, `phase`) VALUES
	('434404',15116,1,'1612.98','-4427.43','11.4343','2.76668','0','15237',1074,'0','16777472','0','1','0','0','0','0','0','0','0','0','12850','0','0','0','1'),
	('434405',15119,0,'-4964.69','-936.287','501.743','5,44543','0','15238',55,'0','16777472','0','1','0','0','0','0','0','0','0','0','12850','0','0','0','1');

DELETE FROM `creature_quest_starter` WHERE `quest` IN (8228,8229);
INSERT INTO `creature_quest_starter` (`id`, `quest`) VALUES
	(15116,8228),
	(15119,8229);

DELETE FROM `creature_quest_finisher` WHERE `quest` IN (8228,8229);
INSERT INTO `creature_quest_finisher` (`id`, `quest`) VALUES
	(15116,8228),
	(15119,8229);

DELETE FROM `npc_gossip_textid` WHERE `creatureid` IN (15119,15116);
INSERT INTO `npc_gossip_textid` (`creatureid`,`textid`) VALUES
	(15119,7712),
	(15116,7677);
