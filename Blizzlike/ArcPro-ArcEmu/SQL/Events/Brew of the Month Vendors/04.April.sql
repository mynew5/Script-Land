DELETE FROM `creature_spawns` WHERE `id` IN (434316,434317); 
INSERT INTO `creature_spawns` (`id`, `entry`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `movetype`, `displayid`, `faction`, `flags`, `bytes0`, `bytes1`, `bytes2`, `emote_state`, `npc_respawn_link`, `channel_spell`, `channel_target_sqlid`, `channel_target_sqlid_creature`, `standstate`, `death_state`, `mountdisplayid`, `slot1item`, `slot2item`, `slot3item`, `CanFly`, `phase`) VALUES
	('434316',27812,0,'-4843.8','-861.921','501.914','4.87919','0','24982',774,'768','16843008','0','1','0','0','0','0','0','0','0','0','33161','0','0','0','1'),
	('434317',27812,1,'1475.8','-4210.23','43.1424','4.11898','0','24982',774,'768','16843008','0','1','0','0','0','0','0','0','0','0','33161','0','0','0','1');

CREATE TABLE IF NOT EXISTS `active_event_id` (
  `active_event` int(10) unsigned NOT NULL,
  `name` text COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`active_event`)
);

DELETE FROM `active_event_id` WHERE `active_event` IN (24,25,26,27,28,29,30,31,32,33,34,35);
INSERT INTO `active_event_id` (`active_event`, `name`) VALUES (27,"April");