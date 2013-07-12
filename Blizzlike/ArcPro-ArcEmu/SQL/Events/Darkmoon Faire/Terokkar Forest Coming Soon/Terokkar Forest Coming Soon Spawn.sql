CREATE TABLE IF NOT EXISTS `active_event_id` (
  `active_event` int(10) unsigned NOT NULL,
  `name` text COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`active_event`)
);

DELETE FROM `active_event_id` WHERE `active_event`=48;
INSERT INTO `active_event_id` (`active_event`, `name`) VALUES (48,"Darkmoon Faire: Coming Soon Terokkar Forest");


SET @GOID := 400158;
DELETE FROM `gameobject_spawns` WHERE `id` BETWEEN @GOID+1 AND @GOID+8;
INSERT INTO `gameobject_spawns` (`id`, `Entry`, `map`, `position_x`, `position_y`, `position_z`, `Facing`, `orientation1`, `orientation2`, `orientation3`, `orientation4`, `State`, `Flags`, `Faction`, `Scale`, `stateNpcLink`, `phase`, `overrides`) VALUES
	(@GOID+1,180005,530,-2288.83,5202.74,-7.31422,2.53072,0,0,0.953716,0.300709,1,32,0,1,0,1,0),
	(@GOID+2,180005,530,-2298.22,5237.68,-7.31973,1.39626,0,0,0.642786,0.766046,1,32,0,1,0,1,0),
	(@GOID+3,180005,530,-2261.59,5256.38,-7.32221,-0.069812,0,0,-0.0348989,0.999391,1,32,0,1,0,1,0),
	(@GOID+4,180005,530,-2236.05,5231.09,-7.63396,-1.27409,0,0,-0.594823,0.803857,1,32,0,1,0,1,0),
	(@GOID+5,180045,530,-2277.49,5228.89,-9.97543,-1.88495,0,0,-0.809015,0.587788,1,32,0,1,0,1,0),
	(@GOID+6,180045,530,-2268.45,5238.19,-9.97545,-2.68781,0,0,-0.97437,0.22495,1,32,0,1,0,1,0),
	(@GOID+7,180045,530,-2261.48,5193.23,-10.0657,-0.139624,0,0,-0.0697553,0.997564,1,32,0,1,0,1,0),
	(@GOID+8,186253,530,-2237.73,5186.31,-11.069,-1.02974,0,0,-0.492422,0.870357,1,32,0,1.75,0,1,0);
