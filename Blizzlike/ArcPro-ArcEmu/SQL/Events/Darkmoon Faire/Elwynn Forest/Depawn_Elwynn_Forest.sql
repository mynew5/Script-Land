DELETE FROM `creature_spawns` WHERE `id` BETWEEN '400078' AND '400104';
DELETE FROM `gameobject_spawns` WHERE `id` BETWEEN '505018' AND '505135';
DELETE FROM `creature_waypoints` WHERE `spawnid` IN (400098,400099);

CREATE TABLE IF NOT EXISTS `active_event_id` (
  `active_event` int(10) unsigned NOT NULL,
  `name` text COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`active_event`)
);

DELETE FROM `active_event_id` WHERE `active_event`=21;
