DELETE FROM `creature_spawns` WHERE `id` BETWEEN 434534 AND 434661;
DELETE FROM `gameobject_spawns` WHERE `id` BETWEEN '512658' AND '512744';

CREATE TABLE IF NOT EXISTS `active_event_id` (
  `active_event` int(10) unsigned NOT NULL,
  `name` text COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`active_event`)
);

DELETE FROM `active_event_id` WHERE `active_event`=40;
