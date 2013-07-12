DELETE FROM `creature_spawns` WHERE `id` BETWEEN 434503 AND 434533;
DELETE FROM `creature_quest_starter` WHERE `quest` IN (12752,12782,12783,12784,12811,12753,12772,12775,12777,12808);
DELETE FROM `creature_quest_finisher` WHERE `quest` IN (12752,12782,12783,12784,12811,12753,12772,12775,12777,12808);

CREATE TABLE IF NOT EXISTS `active_event_id` (
  `active_event` int(10) unsigned NOT NULL,
  `name` text COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`active_event`)
);

DELETE FROM `active_event_id` WHERE `active_event`=17;
