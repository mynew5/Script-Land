SET @SPID := 400100;
SET @GOID := 400100;

DELETE FROM `creature_spawns` WHERE `id` BETWEEN @SPID+1 AND @SPID+8;
DELETE FROM `gameobject_spawns` WHERE `id` BETWEEN @GOID+1 AND @GOID+58;

CREATE TABLE IF NOT EXISTS `active_event_id` (
  `active_event` int(10) unsigned NOT NULL,
  `name` text COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`active_event`)
);

DELETE FROM `active_event_id` WHERE `active_event`=37;