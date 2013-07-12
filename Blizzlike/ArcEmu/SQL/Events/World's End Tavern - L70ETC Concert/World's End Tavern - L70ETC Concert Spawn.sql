CREATE TABLE IF NOT EXISTS `active_event_id` (
  `active_event` int(10) unsigned NOT NULL,
  `name` text COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`active_event`)
);

DELETE FROM `active_event_id` WHERE `active_event`=50;
INSERT INTO `active_event_id` (`active_event`, `name`) VALUES (50,"World's End Tavern - L70ETC Concert");

SET @SPID := 400320;
DELETE FROM `creature_spawns` WHERE `id` BETWEEN @SPID+1 AND @SPID+6;
INSERT INTO `creature_spawns` (`id`, `entry`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `movetype`, `displayid`, `faction`, `flags`, `bytes0`, `bytes1`, `bytes2`, `emote_state`, `npc_respawn_link`, `channel_spell`, `channel_target_sqlid`, `channel_target_sqlid_creature`, `standstate`, `death_state`, `mountdisplayid`, `slot1item`, `slot2item`, `slot3item`, `CanFly`, `phase`) VALUES
	(@SPID+1,23623,530,-1749.92,5134.53,-36.2611,1.85192,0,21661,35,0,131584,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
	(@SPID+2,23625,530,-1749.28,5138.05,-36.2611,1.826,0,21665,35,512,16777472,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
	(@SPID+3,23626,530,-1752.7,5136.19,-36.2612,1.80244,0,21666,35,512,131584,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
	(@SPID+4,23624,530,-1755.31,5133.44,-36.2612,1.77574,0,21662,35,512,131584,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
	(@SPID+5,23619,530,-1745.25,5136.43,-36.2613,1.99015,0,21659,35,512,133120,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
	(@SPID+6,23830,530,-1750.52,5136.14,-36.178,2.07694,0,21955,35,33554944,16777472,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1);
