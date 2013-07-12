DELETE FROM `creature_spawns` WHERE `id` BETWEEN 434918 AND 435043;
DELETE FROM `gameobject_spawns` WHERE `id` BETWEEN 512889 AND 512951;

CREATE TABLE IF NOT EXISTS `active_event_id` (
  `active_event` int(10) unsigned NOT NULL,
  `name` text COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`active_event`)
);

DELETE FROM `active_event_id` WHERE `active_event`=43;
