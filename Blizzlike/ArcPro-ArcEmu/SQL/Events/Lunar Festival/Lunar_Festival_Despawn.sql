DELETE FROM `creature_spawns` WHERE `id` BETWEEN '430000' AND '430229';
DELETE FROM `gameobject_spawns` WHERE `id` BETWEEN '540000' AND '541270';
DELETE FROM `npc_gossip_textid` WHERE `creatureid` IN (19169,19171,19148,19178,19172,20102,18927,19173,19175,19176,19177);

CREATE TABLE IF NOT EXISTS `active_event_id` (
  `active_event` int(10) unsigned NOT NULL,
  `name` text COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`active_event`)
);

DELETE FROM `active_event_id` WHERE `active_event`=1;
