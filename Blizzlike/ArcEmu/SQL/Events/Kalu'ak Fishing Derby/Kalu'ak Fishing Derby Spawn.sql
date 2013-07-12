CREATE TABLE IF NOT EXISTS `active_event_id` (
  `active_event` int(10) unsigned NOT NULL,
  `name` text COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`active_event`)
);

DELETE FROM `active_event_id` WHERE `active_event`=20;
INSERT INTO `active_event_id` (`active_event`, `name`) VALUES (20,"Kalu\'ak Fishing Derby");

DELETE FROM `creature_spawns` WHERE `id`=434400; 
INSERT INTO `creature_spawns` (`id`, `entry`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `movetype`, `displayid`, `faction`, `flags`, `bytes0`, `bytes1`, `bytes2`, `emote_state`, `npc_respawn_link`, `channel_spell`, `channel_target_sqlid`, `channel_target_sqlid_creature`, `standstate`, `death_state`, `mountdisplayid`, `slot1item`, `slot2item`, `slot3item`, `CanFly`, `phase`) VALUES
	('434400',38294,571,'5698.75','615.661','646.675','0.924065','0','23657',35,'0','16777472','0','1','0','0','0','0','0','0','0','0','34784','0','0','0','1');

DELETE FROM `creature_quest_starter` WHERE `quest` IN (24806,24803);
INSERT INTO `creature_quest_starter` (`id`, `quest`) VALUES
	(38294,24806),
	(38294,24803);

DELETE FROM `creature_quest_finisher` WHERE `quest` IN (24806,24803);
INSERT INTO `creature_quest_finisher` (`id`, `quest`) VALUES
	(38294,24806),
	(38294,24803);

UPDATE `creature_proto` SET `npcflags`=2 WHERE `entry`=38294;
