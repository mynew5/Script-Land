DELETE FROM `gameobject_spawns` WHERE `id` BETWEEN '110000' AND '110633';
DELETE FROM `creature_spawns` WHERE `id` BETWEEN '710000' AND '710106';
DELETE FROM `creature_quest_starter` WHERE `id` IN ('18927', '19148', '19171', '19172', '19173', '20102', '19169', '19175', '19176', '19177', '19178', '32798', '32799');
DELETE FROM `creature_quest_finisher` WHERE `id` IN ('32798', '32799');

CREATE TABLE IF NOT EXISTS `active_event_id` (
  `active_event` int(10) unsigned NOT NULL,
  `name` text COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`active_event`)
);

DELETE FROM `active_event_id` WHERE `active_event`=2;
