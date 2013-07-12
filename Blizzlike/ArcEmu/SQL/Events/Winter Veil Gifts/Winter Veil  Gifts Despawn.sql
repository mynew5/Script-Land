DELETE FROM `gameobject_spawns` WHERE `id` BETWEEN '550000' AND '550009';
DELETE FROM `gameobject_quest_starter` WHERE `id` IN ('180747', '180748', '180793', '180743', '180746');
DELETE FROM `gameobject_quest_finisher` WHERE `id` IN ('180747', '180748', '180793', '180743', '180746');

CREATE TABLE IF NOT EXISTS `active_event_id` (
  `active_event` int(10) unsigned NOT NULL,
  `name` text COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`active_event`)
);

DELETE FROM `active_event_id` WHERE `active_event`=8;