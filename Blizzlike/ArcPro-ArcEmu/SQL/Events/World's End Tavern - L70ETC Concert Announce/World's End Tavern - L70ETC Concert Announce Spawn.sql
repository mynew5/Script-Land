CREATE TABLE IF NOT EXISTS `active_event_id` (
  `active_event` int(10) unsigned NOT NULL,
  `name` text COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`active_event`)
);

DELETE FROM `active_event_id` WHERE `active_event`=51;
INSERT INTO `active_event_id` (`active_event`, `name`) VALUES (51,"World's End Tavern - L70ETC Concert Announce");

SET @SPID := 400340;
DELETE FROM `creature_spawns` WHERE `id` BETWEEN @SPID+1 AND @SPID+2;
INSERT INTO `creature_spawns` (`id`, `entry`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `movetype`, `displayid`, `faction`, `flags`, `bytes0`, `bytes1`, `bytes2`, `emote_state`, `npc_respawn_link`, `channel_spell`, `channel_target_sqlid`, `channel_target_sqlid_creature`, `standstate`, `death_state`, `mountdisplayid`, `slot1item`, `slot2item`, `slot3item`, `CanFly`, `phase`) VALUES
	(@SPID+1,28206,530,-1749.92,5134.53,-36.2611,1.85192,0,25209,35,2181300736,16777472,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
	(@SPID+2,19270,530,-1751.44,5167.03,-37.2049,4.73719,0,18689,1818,32768,16777472,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1);
