DELETE FROM `gameobject_spawns` WHERE `id` BETWEEN '512639' AND '512657';
DELETE FROM `creature_spawns` WHERE `id` BETWEEN 434406 AND 434502;

CREATE TABLE IF NOT EXISTS `active_event_id` (
  `active_event` int(10) unsigned NOT NULL,
  `name` text COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`active_event`)
);

DELETE FROM `active_event_id` WHERE `active_event`=16;
