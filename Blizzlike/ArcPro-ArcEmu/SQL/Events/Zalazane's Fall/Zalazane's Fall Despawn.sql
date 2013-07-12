DELETE FROM `creature_spawns` WHERE `id` BETWEEN '410000' AND '410141';
DELETE FROM `gameobject_spawns` WHERE `id` BETWEEN 5900079 AND 5900156;

CREATE TABLE IF NOT EXISTS `active_event_id` (
  `active_event` int(10) unsigned NOT NULL,
  `name` text COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`active_event`)
);

DELETE FROM `active_event_id` WHERE `active_event`=9;
