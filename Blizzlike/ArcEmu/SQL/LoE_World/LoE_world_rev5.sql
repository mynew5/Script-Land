/**********************************************
 LoE World changeset   Rev 5  
 11.11.2012
**********************************************/


-- 16.10 bug 840
-- gryphon master
UPDATE creature_spawns SET flags=258 WHERE id=58987; -- was 33280
UPDATE creature_spawns SET flags=258 WHERE id=58986; -- was 512

-- 20.10 bug 844
-- Vendor, may not blizz orig. but nice ;-)
UPDATE creature_proto SET npcflags=129 WHERE entry=383;
INSERT INTO vendors (entry, item, amount, max_amount, inctime, extended_cost) VALUES
(383, 6256, 1, 0, 0, 0),
(383, 6325, 1, 0, 0, 0),
(383, 6330, 1, 0, 0, 0),
(383, 6365, 1, 1, 86400000, 0),
(383, 6368, 1, 0, 0, 0),
(383, 6529, 1, 0, 0, 0),
(383, 6530, 1, 0, 0, 0),
(383, 6532, 1, 0, 0, 0),
(383, 6533, 1, 1, 86400000, 0);


set @spawnid = 2200;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, -9825.48, 193.66, 12.96, 9000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, -9824.76, 184.60, 12.06, 8000, 0, 0, 0, 0, 0, 0, 0);

set @spawnid = 2191;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 5, -9838.11, 191.56, 23.02, 8000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 6, -9828.58, 181.09, 22.38, 4000, 0, 0, 0, 0, 0, 0, 0);

set @spawnid = 2197;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, -9824.74, 193.83, 12.90, 6000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, -9827.62, 205.30, 14.59, 5000, 0, 0, 0, 0, 0, 0, 0);

set @spawnid = 2193;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;

-- 21.10 bug 806
UPDATE creature_spawns SET position_z=23.01 WHERE entry=14726 AND position_x LIKE 1794.68 AND position_y LIKE -4572.71 ;
UPDATE creature_spawns SET position_z=23.01 WHERE entry=2855 AND position_x LIKE 1813.26 AND position_y LIKE -4563.33 ;
UPDATE creature_spawns SET position_z=21.60 WHERE entry=3296 AND position_x LIKE 1829.26 AND position_y LIKE -4507.27 ;

set @spawnid = 79435;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, 175.10, 7904.87, 54.72, 1000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, 182.00, 7912.41, 47.96, 1000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 3, 189.88, 7921.32, 44.19, 1000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 4, 201.08, 7935.49, 42.89, 1000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 5, 213.25, 7949.22, 46.80, 1000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 6, 220.13, 7957.95, 52.68, 1000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 7, 223.08, 7962.65, 54.94, 1000, 0, 0, 0, 0, 0, 0, 0);

-- bug 751
set @spawnid = 20043;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, -982.76, -3861.67, 149.61, 6000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, -998.72, -3846.92, 149.13, 4000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 3, -989.15, -3847.77, 149.42, 8000, 0, 0, 0, 0, 0, 0, 0);

set @spawnid = 20022;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, -992.08, -3812.35, 140.26, 8000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, -997.27, -3822.39, 145.71, 4000, 0, 0, 0, 0, 0, 0, 0);

set @spawnid = 20044;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, -997.95, -3824.39, 146.20, 9000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, -1010.59, -3824.74, 145.56, 7000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 3, -1026.56, -3822.75, 141.37, 6000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 4, -1037.29, -3827.29, 139.49, 5000, 0, 0, 0, 0, 0, 0, 0);

-- bug 670
UPDATE creature_spawns SET position_x=7932.7, position_y=-7567.9, position_z=145.62, orientation=5.97 WHERE id=65024;

-- bug 674
set @spawnid = 65958;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, 6521.51, -7434.58, 73.06, 6000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, 6517.51, -7452.57, 73.06, 5000, 0, 0, 0, 0, 0, 0, 0);

-- bug 633
UPDATE creature_spawns SET flags=32768 WHERE entry=18123;

ALTER TABLE `weather` CHANGE `low_type` `low_type` INT( 11 ) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Low chance weather type';
ALTER TABLE `weather` CHANGE `med_type` `med_type` INT( 11 ) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Medium chance weather type';
ALTER TABLE `weather` CHANGE `high_type` `high_type` INT( 11 ) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'High chance weather type';
ALTER TABLE `weather` CHANGE `low_chance` `low_chance` INT( 11 ) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Must be < than med_chance';
ALTER TABLE `weather` CHANGE `med_chance` `med_chance` INT( 11 ) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Must be < than high_chance';

-- 26.10.2012
-- strange flags for snakes, was 268959846
UPDATE creature_names SET flags1=0, Type=1 WHERE entry=7566;
UPDATE creature_names SET flags1=0, Type=1 WHERE entry=7568;
UPDATE creature_names SET flags1=0, Type=1 WHERE entry=7569;

UPDATE gameobject_spawns SET position_x=-3597.18, position_z=19.1 WHERE id=452;

REPLACE INTO npc_gossip_textid (creatureid, textid) VALUES (8583, 10760);
UPDATE creature_proto SET npcflags=3 WHERE entry=8583;

ALTER TABLE `npc_monstersay` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
UPDATE npc_monstersay SET entry=13036 WHERE entry=13034;

-- 31.10 bug 856
REPLACE INTO gameobject_quest_starter (id, quest) VALUES (256, 256);
UPDATE gameobject_spawns SET Faction=35 WHERE id=65 AND entry=256;

-- bug dev93
set @spawnid = 65509;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;

set @spawnid = 65533;
UPDATE creature_spawns SET movetype=0 WHERE id=@spawnid;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, 6453.94, -6410.78, 45.91, 6000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, 6444.09, -6407.49, 48.68, 5000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 3, 6440.39, -6403.00, 48.68, 9000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 4, 6444.39, -6390.50, 55.18, 8000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 5, 6449.10, -6377.11, 53.01, 8000, 0, 0, 0, 0, 0, 0, 0);

set @spawnid = 65491;
UPDATE creature_spawns SET movetype=0 WHERE id=@spawnid;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, 6432.22, -6370.95, 55.18, 6000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, 6438.13, -6382.20, 55.18, 4000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 3, 6449.28, -6388.04, 55.18, 8000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 4, 6458.70, -6388.06, 55.18, 7000, 0, 0, 0, 0, 0, 0, 0);

-- bug dev57
UPDATE creature_spawns SET position_x=1916.7, position_y=-4136.6 WHERE id=60722;
UPDATE creature_spawns SET position_x=1925.1, position_y=-4135.7 WHERE id=60731;

-- by zdroid9770
INSERT INTO `items` (`entry`,`class`,`subclass`,`name1`,`displayid`,`quality`,`buyprice`,`sellprice`,`inventorytype`,`allowableclass`,`allowablerace`,`itemlevel`,`requiredlevel`,`RequiredSkill`,`RequiredSkillRank`,`maxcount`,`ContainerSlots`,`itemstatscount`,`stat_type1`,`stat_value1`,`stat_type2`,`stat_value2`,`stat_type3`,`stat_value3`,`stat_type4`,`stat_value4`,`stat_type5`,`stat_value5`,`stat_type6`,`stat_value6`,`stat_type7`,`stat_value7`,`stat_type8`,`stat_value8`,`stat_type9`,`stat_value9`,`stat_type10`,`stat_value10`,`ScaledStatsDistributionId`,`ScaledStatsDistributionFlags`,`dmg_min1`,`dmg_max1`,`dmg_type1`,`dmg_min2`,`dmg_max2`,`dmg_type2`,`armor`,`holy_res`,`fire_res`,`nature_res`,`frost_res`,`shadow_res`,`arcane_res`,`delay`,`range`,`spellid_1`,`spelltrigger_1`,`spellcharges_1`,`spellcooldown_1`,`spellcategory_1`,`spellcategorycooldown_1`,`spellid_2`,`spelltrigger_2`,`spellcharges_2`,`spellcooldown_2`,`spellcategory_2`,`spellcategorycooldown_2`,`spellid_3`,`spelltrigger_3`,`spellcharges_3`,`spellcooldown_3`,`spellcategory_3`,`spellcategorycooldown_3`,`spellid_4`,`spelltrigger_4`,`spellcharges_4`,`spellcooldown_4`,`spellcategory_4`,`spellcategorycooldown_4`,`spellid_5`,`spelltrigger_5`,`spellcharges_5`,`spellcooldown_5`,`spellcategory_5`,`spellcategorycooldown_5`,`bonding`,`description`,`itemset`,`MaxDurability`,`socket_color_1`,`socket_color_2`,`socket_color_3`,`socket_bonus`,`ReqDisenchantSkill`) VALUES (19054,15,2,'Red Dragon Orb' ,27454,1,0,0,0,-1,-1,20,-1,0,0,0,0, 0, 0,0.0,0,0.0,0,0.0,0,0.0,0,0.0,0,0.0,0,0.0,0,0.0,0,0.0,0,0.0,0,0,0.0,0.0,0,0.0,0.0,0,0,0,0,0,0,0,0,0.0,0,0,0,0,-1,0,-1,0,0,0,-1,0,-1,0,0,0,-1,0,-1,0,0,0,-1,0,-1,0,0,0,-1,0,-1,1,'' ,0,0,0,0,0,0,-1);
INSERT INTO `items` (`entry`,`class`,`subclass`,`name1`,`displayid`,`quality`,`buyprice`,`sellprice`,`inventorytype`,`allowableclass`,`allowablerace`,`itemlevel`,`requiredlevel`,`RequiredSkill`,`RequiredSkillRank`,`maxcount`,`ContainerSlots`,`itemstatscount`,`stat_type1`,`stat_value1`,`stat_type2`,`stat_value2`,`stat_type3`,`stat_value3`,`stat_type4`,`stat_value4`,`stat_type5`,`stat_value5`,`stat_type6`,`stat_value6`,`stat_type7`,`stat_value7`,`stat_type8`,`stat_value8`,`stat_type9`,`stat_value9`,`stat_type10`,`stat_value10`,`ScaledStatsDistributionId`,`ScaledStatsDistributionFlags`,`dmg_min1`,`dmg_max1`,`dmg_type1`,`dmg_min2`,`dmg_max2`,`dmg_type2`,`armor`,`holy_res`,`fire_res`,`nature_res`,`frost_res`,`shadow_res`,`arcane_res`,`delay`,`range`,`spellid_1`,`spelltrigger_1`,`spellcharges_1`,`spellcooldown_1`,`spellcategory_1`,`spellcategorycooldown_1`,`spellid_2`,`spelltrigger_2`,`spellcharges_2`,`spellcooldown_2`,`spellcategory_2`,`spellcategorycooldown_2`,`spellid_3`,`spelltrigger_3`,`spellcharges_3`,`spellcooldown_3`,`spellcategory_3`,`spellcategorycooldown_3`,`spellid_4`,`spelltrigger_4`,`spellcharges_4`,`spellcooldown_4`,`spellcategory_4`,`spellcategorycooldown_4`,`spellid_5`,`spelltrigger_5`,`spellcharges_5`,`spellcooldown_5`,`spellcategory_5`,`spellcategorycooldown_5`,`bonding`,`description`,`itemset`,`MaxDurability`,`socket_color_1`,`socket_color_2`,`socket_color_3`,`socket_bonus`,`ReqDisenchantSkill`) VALUES (23712,15,2,'White Tiger Cub' ,36470,4,0,0,0,-1,-1,1,-1,0,0,0,0, 0, 0,0.0,0,0.0,0,0.0,0,0.0,0,0.0,0,0.0,0,0.0,0,0.0,0,0.0,0,0.0,0,0,0.0,0.0,0,0.0,0.0,0,0,0,0,0,0,0,0,0.0,0,0,0,0,-1,0,-1,0,0,0,-1,0,-1,0,0,0,-1,0,-1,0,0,0,-1,0,-1,0,0,0,-1,0,-1,1,'' ,0,0,0,0,0,0,-1);
INSERT INTO `items` (`entry`,`class`,`subclass`,`name1`,`displayid`,`quality`,`buyprice`,`sellprice`,`inventorytype`,`allowableclass`,`allowablerace`,`itemlevel`,`requiredlevel`,`RequiredSkill`,`RequiredSkillRank`,`maxcount`,`ContainerSlots`,`itemstatscount`,`stat_type1`,`stat_value1`,`stat_type2`,`stat_value2`,`stat_type3`,`stat_value3`,`stat_type4`,`stat_value4`,`stat_type5`,`stat_value5`,`stat_type6`,`stat_value6`,`stat_type7`,`stat_value7`,`stat_type8`,`stat_value8`,`stat_type9`,`stat_value9`,`stat_type10`,`stat_value10`,`ScaledStatsDistributionId`,`ScaledStatsDistributionFlags`,`dmg_min1`,`dmg_max1`,`dmg_type1`,`dmg_min2`,`dmg_max2`,`dmg_type2`,`armor`,`holy_res`,`fire_res`,`nature_res`,`frost_res`,`shadow_res`,`arcane_res`,`delay`,`range`,`spellid_1`,`spelltrigger_1`,`spellcharges_1`,`spellcooldown_1`,`spellcategory_1`,`spellcategorycooldown_1`,`spellid_2`,`spelltrigger_2`,`spellcharges_2`,`spellcooldown_2`,`spellcategory_2`,`spellcategorycooldown_2`,`spellid_3`,`spelltrigger_3`,`spellcharges_3`,`spellcooldown_3`,`spellcategory_3`,`spellcategorycooldown_3`,`spellid_4`,`spelltrigger_4`,`spellcharges_4`,`spellcooldown_4`,`spellcategory_4`,`spellcategorycooldown_4`,`spellid_5`,`spelltrigger_5`,`spellcharges_5`,`spellcooldown_5`,`spellcategory_5`,`spellcategorycooldown_5`,`bonding`,`description`,`itemset`,`MaxDurability`,`socket_color_1`,`socket_color_2`,`socket_color_3`,`socket_bonus`,`ReqDisenchantSkill`) VALUES (19055,15,2,'Green Dragon Orb' ,6564,1,0,0,0,-1,-1,20,-1,0,0,0,0, 0, 0,0.0,0,0.0,0,0.0,0,0.0,0,0.0,0,0.0,0,0.0,0,0.0,0,0.0,0,0.0,0,0,0.0,0.0,0,0.0,0.0,0,0,0,0,0,0,0,0,0.0,0,0,0,0,-1,0,-1,0,0,0,-1,0,-1,0,0,0,-1,0,-1,0,0,0,-1,0,-1,0,0,0,-1,0,-1,1,'' ,0,0,0,0,0,0,-1);

UPDATE `items` SET `spelltrigger_2`=6 WHERE `entry`=19054;
UPDATE `items` SET `spellid_1`=55884, `spellcharges_1`=-1 WHERE `entry`=19054;
UPDATE `items` SET `spellid_2`=23530 WHERE `entry`=19054;
UPDATE `items` SET `description`='Teaches you how to summon this companion.' WHERE `entry`=19054;
UPDATE `items` SET `flags`=32832, `Unique`=0, `maxcount`=1 WHERE `entry`=19054;

UPDATE `items` SET `spellid_1`=55884, `spelltrigger_2`=6 WHERE `entry`=19055;
UPDATE `items` SET `spellcharges_1`=-1 WHERE `entry`=19055;
UPDATE `items` SET `spellid_2`=23531 WHERE `entry`=19055;
UPDATE `items` SET `description`='Teaches you how to summon this companion.' WHERE `entry`=19055;
UPDATE `items` SET `flags`=32832, `Unique`=0, `maxcount`=1 WHERE `entry`=19055;

UPDATE `items` SET `spellid_1`=55884, `spellcharges_1`=-1, `spellid_2`=30152, `spelltrigger_2`=6 WHERE  `entry`=23712;
UPDATE `items` SET `description`='Teaches you how to summon this companion.' WHERE `entry`=23712;
UPDATE `items` SET `lock_material`=-1, `bagfamily`=4096 WHERE `entry`=23712;
UPDATE `items` SET `flags`=32832 WHERE `entry`=23712;

-- 9.11. 
UPDATE quests SET RequiredQuest1=0 WHERE entry=9409;  -- was 9369
UPDATE quests SET RequiredOneOfQuest='9369 9280' WHERE entry=9409; 

REPLACE INTO creature_quest_finisher (id, quest) VALUES (16502, 9799);

-- 10.11
set @questid = 9291;
UPDATE quests SET Objectives	='Speak with Zalduun again when you feel that you are ready to begin your training.' WHERE entry=@questid;
UPDATE quests SET Details		='It gives me great hope for our future that you come seeking my wisdom. While I have my hands full here with our injured, I am not so busy that I cannot spare a moment to aid you in your first steps as a $C. To walk in the Light is the highest of callings, and one that I am certain you are more than ready to undertake! Speak with me again when you feel that you are ready to begin your training.' WHERE entry=@questid;

set @questid = 9290;
UPDATE quests SET Objectives	='Speak with Valaatu again when you feel that you are ready to begin your training.' WHERE entry=@questid;
UPDATE quests SET Details		='I am pleased that you have come seeking my knowledge. We have much to do if your magical skills are to be honed. For over a hundred years I have taught the arcane, frost and fire magics, and I can feel them just as strongly on this world. Would you like me to impart some of what I know to you?' WHERE entry=@questid;

set @questid = 9421;
UPDATE quests SET Objectives	='Speak with Firmanvaar again when you feel that you are ready to begin your training.' WHERE entry=@questid;
UPDATE quests SET Details		='I am Firmanvaar and you are wise to seek me out. It is my calling to provide instruction to $C, especially those who are just beginning to learn.$B$BShamanism is only now being relearned amongst the $R, $N. You are brave to follow its path as it is not popular amongst your kind.$B$BI will be here when you feel you are ready for further training.' WHERE entry=@questid;

set @questid = 9289;
UPDATE quests SET Objectives	='Speak with Kore again when you feel that you are ready to begin your training.' WHERE entry=@questid;
UPDATE quests SET Details		='It is good that you seek my guidance. For centuries I have taught young $R warriors, so I may know a thing or two on how you should begin. I see in you the makings of a great $C, but only if you listen carefully to what I have to teach.$B$BAre you ready to learn, young $C?' WHERE entry=@questid;

set @questid = 9288;
UPDATE quests SET Objectives	='Speak with Keilnei again when you feel that you are ready to begin your training.' WHERE entry=@questid;
UPDATE quests SET Details		='I\'m glad that you have come to me. For quite some time now I have been responsible for the training of our young $cs, a responsibility that I intend to continue on this new world. I\'ve had my eye upon you for a while now and it would be my honor to help train you in the ways of the $c.$BShall we begin?' WHERE entry=@questid;

set @questid = 9287;
UPDATE quests SET Objectives	='Speak with Aurelon again when you feel that you are ready to begin your training.' WHERE entry=@questid;
UPDATE quests SET Details		='I am heartened by your initiative to speak with me. In the past I was responsible for the training of young paladins as they entered our order. This is a duty and privilege that I humbly take up once more. Your name has been mentioned as one who seeks to do good in the name of the Light. It would be my honor to guide you in your first steps as a paladin.$B$BShall we begin?' WHERE entry=@questid;


-- Set LoE db version
UPDATE db_version SET revision=5 WHERE db_name='LoE World';

