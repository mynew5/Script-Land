DELETE FROM `gameobject_spawns` WHERE `id` BETWEEN '505136' AND '505271';
DELETE FROM `creature_spawns` WHERE `id` BETWEEN '400132' AND '400161';
DELETE FROM `creature_formations` WHERE `spawn_id`=400151;
DELETE FROM `creature_waypoints` WHERE `spawnid` IN (400157,400139,400142,400161);

CREATE TABLE IF NOT EXISTS `active_event_id` (
  `active_event` int(10) unsigned NOT NULL,
  `name` text COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`active_event`)
);

DELETE FROM `active_event_id` WHERE `active_event`=22;
