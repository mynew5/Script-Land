DELETE FROM `creature_quest_starter` WHERE `quest` IN(25199,25212,25229,25283,25285,25287,25289,25295,25393,25500);
DELETE FROM `creature_quest_finisher` WHERE `quest` IN(25199,25212,25229,25283,25285,25287,25289,25295,25393,25500);
DELETE FROM `gameobject_spawns` WHERE `id` BETWEEN '596000' AND '596061';
DELETE FROM `creature_spawns` WHERE `id` BETWEEN 434000 AND 434074;

CREATE TABLE IF NOT EXISTS `active_event_id` (
  `active_event` int(10) unsigned NOT NULL,
  `name` text COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`active_event`)
);

DELETE FROM `active_event_id` WHERE `active_event`=15;
