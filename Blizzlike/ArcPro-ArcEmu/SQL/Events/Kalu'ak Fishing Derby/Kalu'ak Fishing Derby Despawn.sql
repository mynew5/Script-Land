DELETE FROM `creature_spawns` WHERE `id`=434400; 
DELETE FROM `creature_quest_starter` WHERE `quest` IN (24806,24803);
DELETE FROM `creature_quest_finisher` WHERE `quest` IN (24806,24803);

CREATE TABLE IF NOT EXISTS `active_event_id` (
  `active_event` int(10) unsigned NOT NULL,
  `name` text COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`active_event`)
);

DELETE FROM `active_event_id` WHERE `active_event`=20;
