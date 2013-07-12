DELETE FROM `creature_spawns` WHERE `id` BETWEEN 434401 AND 434403;
DELETE FROM `creature_quest_starter` WHERE `quest` IN (8193,8194,8221,8224,8225);
DELETE FROM `creature_quest_finisher` WHERE `quest` IN (8193,8194,8221,8224,8225);
DELETE FROM `gameobject_spawns` WHERE `id` BETWEEN '512587' AND '512638';

CREATE TABLE IF NOT EXISTS `active_event_id` (
  `active_event` int(10) unsigned NOT NULL,
  `name` text COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`active_event`)
);

DELETE FROM `active_event_id` WHERE `active_event`=18;
