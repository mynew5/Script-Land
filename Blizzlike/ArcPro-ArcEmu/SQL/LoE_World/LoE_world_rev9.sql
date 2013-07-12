/**********************************************
 LoE World changeset   Rev. 9  
 14. April, 2013
**********************************************/

-- 28.2.2013 Thanks to Sirala
UPDATE creature_proto SET respawntime = 180000 WHERE entry=38023;

UPDATE creature_proto SET mindamage = 22 WHERE entry=37214;
UPDATE creature_proto SET maxdamage = 30 WHERE entry=37214;
UPDATE creature_proto SET attacktime = 2000 WHERE entry=37214;
UPDATE creature_proto SET respawntime = 180000 WHERE entry=37214;

UPDATE creature_proto SET minlevel = 16 WHERE entry= 37917;
UPDATE creature_proto SET maxlevel = 17 WHERE entry= 37917;
UPDATE creature_proto SET minhealth = 328 WHERE entry= 37917;
UPDATE creature_proto SET maxhealth = 356 WHERE entry= 37917;
UPDATE creature_proto SET mindamage = 44 WHERE entry= 37917;
UPDATE creature_proto SET maxdamage = 62 WHERE entry= 37917;
UPDATE creature_proto SET attacktime = 2000 WHERE entry= 37917;
UPDATE creature_proto SET faction = 14 WHERE entry= 37917;
UPDATE creature_proto SET respawntime = 180000 WHERE entry= 37917;


UPDATE creature_proto SET minlevel = 25 WHERE entry= 37984;
UPDATE creature_proto SET maxlevel = 26 WHERE entry= 37984;
UPDATE creature_proto SET minhealth = 713 WHERE entry= 37984;
UPDATE creature_proto SET maxhealth = 787 WHERE entry= 37984;
UPDATE creature_proto SET mindamage = 70 WHERE entry= 37984;
UPDATE creature_proto SET maxdamage = 98 WHERE entry= 37984;
UPDATE creature_proto SET attacktime = 2000 WHERE entry= 37984; 
UPDATE creature_proto SET faction = 14 WHERE entry= 37984;
UPDATE creature_proto SET respawntime = 180000 WHERE entry= 37984;


UPDATE creature_proto SET minlevel = 33 WHERE entry= 38006;
UPDATE creature_proto SET maxlevel = 34 WHERE entry= 38006;
UPDATE creature_proto SET minhealth = 1279 WHERE entry= 38006;
UPDATE creature_proto SET maxhealth = 1343 WHERE entry= 38006;
UPDATE creature_proto SET mindamage = 94 WHERE entry= 38006;
UPDATE creature_proto SET maxdamage = 128 WHERE entry= 38006;
UPDATE creature_proto SET attacktime = 2000 WHERE entry= 38006;
UPDATE creature_proto SET faction = 14 WHERE entry= 38006;
UPDATE creature_proto SET respawntime = 180000 WHERE entry= 38006;

UPDATE creature_proto SET minlevel = 44 WHERE entry= 38016;
UPDATE creature_proto SET maxlevel = 45 WHERE entry= 38016;
UPDATE creature_proto SET minhealth = 1848 WHERE entry= 38016;
UPDATE creature_proto SET maxhealth = 2218 WHERE entry= 38016;
UPDATE creature_proto SET mindamage = 144 WHERE entry= 38016;
UPDATE creature_proto SET maxdamage = 200 WHERE entry= 38016;
UPDATE creature_proto SET attacktime = 2000 WHERE entry= 38016;
UPDATE creature_proto SET faction = 14 WHERE entry= 38016;
UPDATE creature_proto SET respawntime = 180000 WHERE entry= 38016;

UPDATE creature_proto SET minlevel = 63 WHERE entry= 38030;
UPDATE creature_proto SET maxlevel = 64 WHERE entry= 38030;
UPDATE creature_proto SET minhealth = 4422 WHERE entry= 38030;
UPDATE creature_proto SET maxhealth = 5715 WHERE entry= 38030;
UPDATE creature_proto SET mindamage = 354 WHERE entry= 38030;
UPDATE creature_proto SET maxdamage = 548 WHERE entry= 38030;
UPDATE creature_proto SET attacktime = 2000 WHERE entry= 38030;
UPDATE creature_proto SET faction = 14 WHERE entry= 38030;
UPDATE creature_proto SET respawntime = 180000 WHERE entry= 38030;

-- 17.3.2013
UPDATE creature_proto SET respawntime = 900000 WHERE entry= 1976;

set @spawnid = 14649;
UPDATE creature_spawns SET movetype=0 WHERE id=@spawnid;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, -8918.02, 622.21, 99.52, 6000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, -8918.13, 630.43, 99.52, 9000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 3, -8907.72, 628.38, 99.52, 8000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 4, -8885.15, 639.87, 99.52, 3000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 5, -8878.64, 640.18, 97.51, 8000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 6, -8864.16, 643.00, 96.15, 5000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 7, -8838.98, 646.70, 96.01, 4000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 8, -8850.38, 661.16, 97.19, 3000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 9, -8866.75, 650.12, 96.08, 9000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 10, -8878.27, 647.57, 96.03, 7000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 11, -8883.22, 645.33, 98.14, 4000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 12, -8885.00, 640.80, 99.52, 6000, 0, 0, 0, 0, 0, 0, 0);


UPDATE creature_proto SET faction=40 WHERE entry=584;
UPDATE creature_names SET rank=2 WHERE entry=584;
UPDATE creature_spawns SET faction=40 WHERE id=3020;

-- 1.4.2013
UPDATE creature_proto SET npcflags=8192 WHERE entry=29757;  -- f point
UPDATE creature_proto SET minlevel=80, maxlevel=80, minhealth=12600, maxhealth=12600, mindamage=834, maxdamage=1164, faction=534 WHERE entry=32430;
UPDATE creature_proto SET minlevel=80, maxlevel=80, minhealth=12600, maxhealth=12600, mindamage=834, maxdamage=1164, faction=14 WHERE entry=32154;
UPDATE creature_proto SET minlevel=48, maxlevel=50, minhealth=6600, maxhealth=6600, mindamage=400, maxdamage=600 WHERE entry=26081;

-- 2.4.2013
UPDATE creature_spawns SET phase=1 WHERE id=107652;
UPDATE creature_spawns SET phase=1 WHERE id>=103565 AND id <=103586;
UPDATE creature_spawns SET phase=1 WHERE id>=103539 AND id <=103564;

UPDATE npc_monstersay SET text0='Mages, frost ward is your friend!',text1='',text2='' WHERE entry=203;
-- UPDATE npc_monstersay SET text0='Magier, Frostschutz ist euer Freund!',text1='',text2='' WHERE entry=203;

REPLACE INTO loot_pickpocketing (entryid, itemid, normal10percentchance, mincount, maxcount) VALUES
(203, 16882, 32, 1, 1),
(203, 5376, 14, 1, 1),
(203, 4606, 10, 1, 1),
(203, 929, 5, 1, 1),
(203, 1705, 1.2, 1, 1),
(203, 1206, 0.5, 1, 1);

UPDATE creature_proto SET faction=37 WHERE entry=7271;
UPDATE creature_spawns SET faction=37 WHERE id=46208;


-- 5.4.2013 double spawns (anvil)

DELETE FROM gameobject_spawns WHERE id=54322;
DELETE FROM gameobject_spawns WHERE id=54326;
DELETE FROM gameobject_spawns WHERE id=54328;
DELETE FROM gameobject_spawns WHERE id=54329;
DELETE FROM gameobject_spawns WHERE id=54330;
DELETE FROM gameobject_spawns WHERE id=54339;
DELETE FROM gameobject_spawns WHERE id=54340;
DELETE FROM gameobject_spawns WHERE id=54343;
DELETE FROM gameobject_spawns WHERE id=54352;
DELETE FROM gameobject_spawns WHERE id=54356;
DELETE FROM gameobject_spawns WHERE id=54360;
DELETE FROM gameobject_spawns WHERE id=54361;
DELETE FROM gameobject_spawns WHERE id=54366;
DELETE FROM gameobject_spawns WHERE id=54367;
DELETE FROM gameobject_spawns WHERE id=54369;
DELETE FROM gameobject_spawns WHERE id=54370;
DELETE FROM gameobject_spawns WHERE id=54372;
DELETE FROM gameobject_spawns WHERE id=54377;
DELETE FROM gameobject_spawns WHERE id=54381;
DELETE FROM gameobject_spawns WHERE id=54388;
DELETE FROM gameobject_spawns WHERE id=54389;
DELETE FROM gameobject_spawns WHERE id=54391;
DELETE FROM gameobject_spawns WHERE id=54395;
DELETE FROM gameobject_spawns WHERE id=54399;
DELETE FROM gameobject_spawns WHERE id=54401;
DELETE FROM gameobject_spawns WHERE id=54404;
DELETE FROM gameobject_spawns WHERE id=54407;
DELETE FROM gameobject_spawns WHERE id=54408;
DELETE FROM gameobject_spawns WHERE id=54409;
DELETE FROM gameobject_spawns WHERE id=54412;
DELETE FROM gameobject_spawns WHERE id=54415;
DELETE FROM gameobject_spawns WHERE id=54417;
DELETE FROM gameobject_spawns WHERE id=54420;
DELETE FROM gameobject_spawns WHERE id=54423;
DELETE FROM gameobject_spawns WHERE id=54426;
DELETE FROM gameobject_spawns WHERE id=54427;
DELETE FROM gameobject_spawns WHERE id=54429;
DELETE FROM gameobject_spawns WHERE id=54434;
DELETE FROM gameobject_spawns WHERE id=54435;
DELETE FROM gameobject_spawns WHERE id=54436;
DELETE FROM gameobject_spawns WHERE id=54438;
DELETE FROM gameobject_spawns WHERE id=54439;
DELETE FROM gameobject_spawns WHERE id=54442;
DELETE FROM gameobject_spawns WHERE id=54443;
DELETE FROM gameobject_spawns WHERE id=54459;
DELETE FROM gameobject_spawns WHERE id=54461;
DELETE FROM gameobject_spawns WHERE id=54462;
DELETE FROM gameobject_spawns WHERE id=54464;
DELETE FROM gameobject_spawns WHERE id=54467;
DELETE FROM gameobject_spawns WHERE id=54468;
DELETE FROM gameobject_spawns WHERE id=54470;
DELETE FROM gameobject_spawns WHERE id=54471;
DELETE FROM gameobject_spawns WHERE id=54472;
DELETE FROM gameobject_spawns WHERE id=54477;
DELETE FROM gameobject_spawns WHERE id=54480;
DELETE FROM gameobject_spawns WHERE id=54482;
DELETE FROM gameobject_spawns WHERE id=54483;
DELETE FROM gameobject_spawns WHERE id=54485;
DELETE FROM gameobject_spawns WHERE id=54487;
DELETE FROM gameobject_spawns WHERE id=54488;
DELETE FROM gameobject_spawns WHERE id=54491;

-- 7.4.2013
DELETE FROM ai_agents WHERE entry=521;
UPDATE creature_proto SET npcflags=3 WHERE entry = 7572; 

-- 14.4.2013 some fixes for dk by Aaron
REPLACE INTO npc_gossip_textid (creatureid, textid) VALUES (28406, 100);
DELETE FROM spelltargetconstraints WHERE SpellID=52264;
UPDATE quests SET ReqCastSpellId1=54586 WHERE entry=12842; 
UPDATE quests SET ReqCastSpellId1=58111 WHERE entry=12720; 

-- By Sirala, über den Bänken schwebende NPCs auf der Prügelinsel
UPDATE creature_spawns SET position_z= 3.754  WHERE id=43374;
UPDATE creature_spawns SET position_z= 3.730  WHERE id=43378;
UPDATE creature_spawns SET position_z= 3.224  WHERE id=43381;
UPDATE creature_spawns SET position_z= 3.438  WHERE id=43382;
UPDATE creature_spawns SET position_z= 4.641  WHERE id=43383;


-- Set LoE db version
UPDATE db_version SET revision=9 WHERE db_name='LoE World' OR db_name='LoE Sunrise World';

