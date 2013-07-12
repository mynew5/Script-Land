CREATE TABLE IF NOT EXISTS `active_event_id` (
  `active_event` int(10) unsigned NOT NULL,
  `name` text COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`active_event`)
);

DELETE FROM `active_event_id` WHERE `active_event`=49;
INSERT INTO `active_event_id` (`active_event`, `name`) VALUES (49,"L70ETC Concert");

SET @SPID := 400300;
SET @GOID := 400300;
DELETE FROM `gameobject_spawns` WHERE `id` BETWEEN @GOID+1 AND @GOID+3;
INSERT INTO `gameobject_spawns` (`id`, `Entry`, `map`, `position_x`, `position_y`, `position_z`, `Facing`, `orientation1`, `orientation2`, `orientation3`, `orientation4`, `State`, `Flags`, `Faction`, `Scale`, `stateNpcLink`, `phase`, `overrides`) VALUES
	(@GOID+1,186300,530,-2224.98,5127.45,-19.7614,-0.174533,0,0,-0.0871558,0.996195,1,0,0,1,0,1,0),
	(@GOID+2,186393,530,-2200.26,5126.68,-20.2422,2.89725,0,0,0.992546,0.121868,1,0,0,1,0,1,0),
	(@GOID+3,186393,530,-2201.85,5119.5,-20.2284,2.94961,0,0,0.995396,0.095844,1,0,0,1,0,1,0);

DELETE FROM `creature_spawns` WHERE `id` BETWEEN @SPID+1 AND @SPID+10;
INSERT INTO `creature_spawns` (`id`, `entry`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `movetype`, `displayid`, `faction`, `flags`, `bytes0`, `bytes1`, `bytes2`, `emote_state`, `npc_respawn_link`, `channel_spell`, `channel_target_sqlid`, `channel_target_sqlid_creature`, `standstate`, `death_state`, `mountdisplayid`, `slot1item`, `slot2item`, `slot3item`, `CanFly`, `phase`) VALUES
	(@SPID+1,23721,530,-2197.05,5130.85,-20.4891,3.4576,0,19926,35,0,16777472,0,4097,10,0,0,0,0,0,0,0,5301,0,0,0,1),
	(@SPID+2,23721,530,-2200.36,5113.89,-20.2293,2.32662,0,19926,35,0,16777472,0,4097,10,0,0,0,0,0,0,0,5301,0,0,0,1),
	(@SPID+3,23721,530,-2215.1,5117.98,-20.106,0.230397,0,19926,35,0,16777472,0,4097,10,0,0,0,0,0,0,0,5301,0,0,0,1),
	(@SPID+4,23721,530,-2211.77,5131.87,-20.1147,5.22553,0,19926,35,0,16777472,0,4097,10,0,0,0,0,0,0,0,5301,0,0,0,1),
	(@SPID+5,23830,530,-2208.33,5123.95,-20.1186,2.94598,0,21955,35,33554944,16777472,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
	(@SPID+6,23619,530,-2219.29,5132.09,-16.5128,5.7224,0,21659,35,512,133120,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
	(@SPID+7,23623,530,-2228.03,5128.02,-12.9897,5.95488,0,21661,35,0,131584,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
	(@SPID+8,23624,530,-2221.76,5125.29,-16.5372,6.20225,0,21662,35,512,131584,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
	(@SPID+9,23625,530,-2219.62,5126.88,-16.5514,6.08525,0,21665,35,512,16777472,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
	(@SPID+10,23626,530,-2220.74,5121.65,-16.5147,6.02004,0,21666,35,512,131584,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1);
