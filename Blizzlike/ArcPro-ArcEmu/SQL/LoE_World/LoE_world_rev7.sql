/**********************************************
 LoE World changeset   Rev 7  
 26.1.2013
**********************************************/

-- 11.12.2012
-- Delete unnecessary loot in critter
DELETE FROM loot_creatures WHERE entryid=2110;

--  Lunar event NPC
DELETE FROM creature_spawns WHERE id=136582;

-- Set it back to 8, bug is now corrected in the core
UPDATE creature_names SET type=8 WHERE entry=32820;
UPDATE creature_names SET type=8 WHERE entry=23979;

ALTER TABLE `quest_poi` CHANGE `mapAreaId` `mapAreaId` SMALLINT( 3 ) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Zone ID';
ALTER TABLE `quest_poi` CHANGE `floorId` `floorId` TINYINT( 1 ) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Area ID';
ALTER TABLE `quest_poi_points` CHANGE `x` `x` INT( 11 ) NOT NULL DEFAULT '0';
ALTER TABLE `quest_poi_points` CHANGE `y` `y` INT( 11 ) NOT NULL DEFAULT '0';
ALTER TABLE `quest_poi_points` CHANGE `poiId` `poiId` TINYINT( 3 ) UNSIGNED NOT NULL DEFAULT '0';

-- 20.12.2012
UPDATE `areatriggers` SET `name` = 'PX-238 Winter Wondervolt' WHERE `entry`=4026;

-- 23.12.2012 Historian Karnik
REPLACE INTO `creature_spawns` (`id`, `entry`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `movetype`, `displayid`, `faction`, `flags`, `bytes0`, `bytes1`, `bytes2`, `emote_state`, `npc_respawn_link`, `channel_spell`, `channel_target_sqlid`, `channel_target_sqlid_creature`, `standstate`, `death_state`, `mountdisplayid`, `slot1item`, `slot2item`, `slot3item`, `CanFly`, `phase`) VALUES
(141698, 2916, 0, -4630.900, -1324.060, 503.382, 1.69279, 0, 3595, 55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);

-- 24.12.2012  vendor
REPLACE INTO `vendors` (`entry`, `item`, `amount`, `max_amount`, `inctime`, `extended_cost`) VALUES
('23064', '34262', '1', '0', '0', '0'),
('23064', '34261', '1', '0', '0', '0'),
('23064', '34413', '1', '0', '0', '0'),
('13435', '34262', '1', '0', '0', '0'),
('13435', '34319', '1', '0', '0', '0'),
('13435', '34413', '1', '0', '0', '0'),
('13429', '34262', '1', '0', '0', '0'),
('13429', '34261', '1', '0', '0', '0'),
('13429', '34413', '1', '0', '0', '0'),
('13420', '34262', '1', '0', '0', '0'),
('13420', '34261', '1', '0', '0', '0'),
('13420', '34413', '1', '0', '0', '0'),
('13432', '34262', '1', '0', '0', '0'),
('13432', '34261', '1', '0', '0', '0'),
('13432', '34413', '1', '0', '0', '0'),
('23010', '34262', '1', '0', '0', '0'),
('23010', '34319', '1', '0', '0', '0'),
('23010', '34413', '1', '0', '0', '0'),
('13433', '34262', '1', '0', '0', '0'),
('13433', '34319', '1', '0', '0', '0'),
('13433', '34413', '1', '0', '0', '0');

-- 25.12.2012
UPDATE auctionhouse SET ahgroup=6 WHERE ahgroup=2;

-- 1.1.2013

DELETE FROM creature_quest_starter WHERE id=14725 AND quest=7792;
DELETE FROM creature_quest_starter WHERE id=14725 AND quest=7798;
DELETE FROM creature_quest_finisher WHERE id=14725 AND quest=7792;
DELETE FROM creature_quest_finisher WHERE id=14725 AND quest=7798;
REPLACE INTO creature_quest_starter (id, quest) VALUES (14725, 10352);
REPLACE INTO creature_quest_starter (id, quest) VALUES (14725, 10354);
REPLACE INTO creature_quest_finisher (id, quest) VALUES (14725, 10352);
REPLACE INTO creature_quest_finisher (id, quest) VALUES (14725, 10354);

DELETE FROM creature_quest_starter WHERE id=20604 AND quest=10352;
DELETE FROM creature_quest_starter WHERE id=20604 AND quest=10354;
DELETE FROM creature_quest_finisher WHERE id=20604 AND quest=10352;
DELETE FROM creature_quest_finisher WHERE id=20604 AND quest=10354;
REPLACE INTO creature_quest_starter (id, quest) VALUES (20604, 7792);
REPLACE INTO creature_quest_starter (id, quest) VALUES (20604, 7798);
REPLACE INTO creature_quest_finisher (id, quest) VALUES (20604, 7792);
REPLACE INTO creature_quest_finisher (id, quest) VALUES (20604, 7798);

set @questid = 7791;
UPDATE quests SET Objectives	= 'We are currently accepting donations for wool cloth. A donation of sixty pieces of wool cloth will net you full recognition by Stormwind for your generous actions. Our stores are such on wool that we would only need sixty pieces from you total; we should be able to acquire enough from others in the realm to support our drive.' WHERE entry=@questid;

set @questid = 7807;
UPDATE quests SET Objectives	= 'We are currently accepting donations for wool cloth. A donation of sixty pieces of wool cloth will net you full recognition by Gnomeregan for your generous actions. Our stores are such on wool that we would only need sixty pieces from you total; we should be able to acquire enough from others in the realm to support our drive.' WHERE entry=@questid;

set @questid = 10352;
UPDATE quests SET Objectives	= 'We are currently accepting donations for wool cloth. A donation of sixty pieces of wool cloth will net you full recognition by Gnomeregan for your generous actions. Our stores are such on wool that we would only need sixty pieces from you total; we should be able to acquire enough from others in the realm to support our drive.' WHERE entry=@questid;

set @questid = 7792;
UPDATE quests SET Objectives	= 'We are currently accepting donations for wool cloth. A donation of sixty pieces of wool cloth will net you full recognition by our people for your generous actions.' WHERE entry=@questid;

set @questid = 7802;
UPDATE quests SET Objectives	= 'We are currently accepting donations for wool cloth. A donation of sixty pieces of wool cloth will net you full recognition by Ironforge for your generous actions. Our stores are such on wool that we would only need sixty pieces from you total; we should be able to acquire enough from others in the realm to support our drive.' WHERE entry=@questid;
UPDATE quests SET IncompleteText= 'If you have the sixty pieces of wool cloth on you and are ready to donate them, I''m able to take them from you now.' WHERE entry=@questid;

set @questid = 7793;
UPDATE quests SET Objectives	= 'As with most other fabrics, our stocks of silk are at an all-time low. Our stores are such that we''d only need sixty pieces of silk from you total; we should be able to reach our goal with the support of others.$B$BA benevolent gift such as silk, might I add, would certainly increase your local standing in the community!' WHERE entry=@questid;
UPDATE quests SET IncompleteText= 'If you have the sixty pieces of silk cloth on you and are ready to donate them, I''m able to take them from you now.' WHERE entry=@questid;

set @questid = 7808;
UPDATE quests SET Objectives	= 'As with most other fabrics, our stocks of silk are at an all-time low. Our stores are such that we''d only need sixty pieces of silk from you total; we should be able to reach our goal with the support of others.$B$BA benevolent gift such as silk, might I add, would certainly increase your local standing in the community!' WHERE entry=@questid;
UPDATE quests SET IncompleteText= 'If you have the sixty pieces of silk cloth on you and are ready to donate them, I''m able to take them from you now.' WHERE entry=@questid;

set @questid = 7803;
UPDATE quests SET Objectives	= 'As with most other fabrics, our stocks of silk are at an all-time low. Our stores are such that we''d only need sixty pieces of silk from you total; we should be able to reach our goal with the support of others.$B$BA benevolent gift such as silk, might I add, would certainly increase your local standing in the community!' WHERE entry=@questid;
UPDATE quests SET IncompleteText= 'If you have the sixty pieces of silk cloth on you and are ready to donate them, I''m able to take them from you now.' WHERE entry=@questid;

set @questid = 10354;
UPDATE quests SET Objectives	= 'As with most other fabrics, our stocks of silk are at an all-time low. Our stores are such that we''d only need sixty pieces of silk from you total; we should be able to reach our goal with the support of others.$B$BA benevolent gift such as silk, might I add, would certainly increase your local standing in the community!' WHERE entry=@questid;
UPDATE quests SET IncompleteText= 'If you have the sixty pieces of silk cloth on you and are ready to donate them, I''m able to take them from you now.' WHERE entry=@questid;

set @questid = 7798;
UPDATE quests SET Objectives	= 'As with most other fabrics, our stocks of silk are at an all-time low. Our stores are such that we''d only need sixty pieces of silk from you total; we should be able to reach our goal with the support of others.$B$BA benevolent gift such as silk, might I add, would certainly increase your local standing in the community!' WHERE entry=@questid;
UPDATE quests SET IncompleteText= 'If you have the sixty pieces of silk cloth on you and are ready to donate them, I''m able to take them from you now.' WHERE entry=@questid;

set @questid = 7794;
UPDATE quests SET Objectives	= 'Mageweave is running low, and we could use your help to replenish our stocks! By counting on the community as a whole, we would only need a donation of 60 pieces of mageweave cloth from you to enable us to reach our goal. Such generosity would not go unnoticed by Stormwind, I assure you!' WHERE entry=@questid;
UPDATE quests SET IncompleteText= 'If you have the sixty pieces of mageweave cloth on you and are ready to donate them, I''m able to take them from you now.' WHERE entry=@questid;

set @questid = 7804;
UPDATE quests SET Objectives	= 'Mageweave is running low, and we could use your help to replenish our stocks! By counting on the community as a whole, we would only need a donation of 60 pieces of mageweave cloth from you to enable us to reach our goal. Such generosity would not go unnoticed by Ironforge, I assure you!' WHERE entry=@questid;
UPDATE quests SET IncompleteText= 'If you have the sixty pieces of mageweave cloth on you and are ready to donate them, I''m able to take them from you now.' WHERE entry=@questid;

set @questid = 7809;
UPDATE quests SET Objectives	= 'Mageweave is running low, and we could use your help to replenish our stocks! By counting on the community as a whole, we would only need a donation of 60 pieces of mageweave cloth from you to enable us to reach our goal. Such generosity would not go unnoticed by Gnomeregan, I assure you!' WHERE entry=@questid;
UPDATE quests SET IncompleteText= 'If you have the sixty pieces of mageweave cloth on you and are ready to donate them, I''m able to take them from you now.' WHERE entry=@questid;

set @questid = 7799;
UPDATE quests SET Objectives	= 'Mageweave is running low, and we could use your help to replenish our stocks! By counting on the community as a whole, we would only need a donation of 60 pieces of mageweave cloth from you to enable us to reach our goal. Such generosity would not go unnoticed by Darnassus, I assure you!' WHERE entry=@questid;

set @questid = 10356;
UPDATE quests SET Objectives	= 'Mageweave is running low, and we could use your help to replenish our stocks! By counting on the community as a whole, we would only need a donation of 60 pieces of mageweave cloth from you to enable us to reach our goal. Such generosity would not go unnoticed, I assure you!' WHERE entry=@questid;

set @questid = 7795;
UPDATE quests SET Objectives	= '$n, you''ve been a tremendous contributor to our cloth drive. As we work hard to replenish our reserves, one form of cloth remains critically low - runecloth. We are in absolutely dire need of it, and we hope that you will be able to help us as you have in the past!$b$bIf you are willing, please bring me what runecloth you can spare.' WHERE entry=@questid;
UPDATE quests SET IncompleteText= 'We''ll initially accept a single donation of sixty, and then we''ll go from there.' WHERE entry=@questid;

-- 8.1.2013 Thanks to Sirala
UPDATE quests SET RequiredRaces=690 WHERE entry=6963;
UPDATE quests SET RequiredRaces=690, IsRepeatable=2 WHERE entry=6983;
UPDATE quests SET RequiredRaces=690 WHERE entry=6984;
UPDATE quests SET RequiredRaces=690 WHERE entry=8746;
UPDATE quests SET RequiredRaces=1101 WHERE entry=8762;
UPDATE quests SET RequiredRaces=1101 WHERE entry=8763;
UPDATE quests SET CompletionText='The machine lets off a little rumble and a small amount of steam as it starts working.  It is not too long thereafter until it stops, heralded by another small jet of steam erupting from it.  A door hatch opens, revealing a batch of preserved holly!' WHERE entry=8763;

-- 9.1.2013
-- Once more, was not working correct in changeset 4
UPDATE creature_spawns SET position_z=27.24 WHERE entry=3296 AND position_x=1387.28 AND position_y=-4379.89 ;
UPDATE creature_spawns SET position_z=27.24 WHERE entry=3296 AND position_x=1384.62 AND position_y=-4358.56 ;
UPDATE creature_spawns SET position_z=18.94 WHERE entry=3296 AND position_x=1518.15 AND position_y=-4425.35 ;
UPDATE creature_spawns SET position_z=16.88 WHERE entry=3296 AND position_x=1523.92 AND position_y=-4429.44 ;
UPDATE creature_spawns SET position_z=5.54 WHERE entry=5597 AND position_x=1568.65 AND position_y=-4386.24 ;
UPDATE creature_spawns SET position_z=7.17 WHERE entry=14720 AND position_x=1566.89 AND position_y=-4395.2 ;
UPDATE creature_spawns SET position_z=6.70 WHERE entry=3296 AND position_x=1576.2 AND position_y=-4394.43 ;
UPDATE creature_spawns SET position_z=1.22 WHERE entry=3296 AND position_x=1557.74 AND position_y=-4364.25 ;
UPDATE creature_spawns SET position_z=1.34 WHERE entry=3296 AND position_x=1561.79 AND position_y=-4360.5 ;
UPDATE creature_spawns SET position_z=10.13 WHERE entry=3296 AND position_x=1596.65 AND position_y=-4388.67 ;
UPDATE creature_spawns SET position_z=9.85 WHERE entry=5603 AND position_x=1594.38 AND position_y=-4378.3 ;
UPDATE creature_spawns SET position_z=9.80 WHERE entry=13842 AND position_x=1607.92 AND position_y=-4376.44 ;
UPDATE creature_spawns SET position_z=12.55 WHERE entry=3296 AND position_x=1615.63 AND position_y=-4376.11 ;
UPDATE creature_spawns SET position_z=11.95 WHERE entry=3320 AND position_x=1622.9 AND position_y=-4369.06 ;
UPDATE creature_spawns SET position_z=11.96 WHERE entry=3309 AND position_x=1627.32 AND position_y=-4376.07 ;
UPDATE creature_spawns SET position_z=11.94 WHERE entry=3318 AND position_x=1632.39 AND position_y=-4381.97 ;
UPDATE creature_spawns SET position_z=4.52 WHERE entry=3314 AND position_x=1634.23 AND position_y=-4347.62 ;
UPDATE creature_spawns SET position_z=3.33 WHERE entry=3312 AND position_x=1618.96 AND position_y=-4307.28 ;
UPDATE creature_spawns SET position_z=61.47 WHERE entry=3296 AND position_x=1668.56 AND position_y=-4323.66 ;
UPDATE creature_spawns SET position_z=61.80 WHERE entry=3310 AND position_x=1676.25 AND position_y=-4313.45 ;
UPDATE creature_spawns SET position_z=61.89 WHERE entry=19177 AND position_x=1689.75 AND position_y=-4334.92 ;
UPDATE creature_spawns SET position_z=62.07 WHERE entry=19177 AND position_x=1693.4 AND position_y=-4334.83 ;
UPDATE creature_spawns SET position_z=52.02 WHERE entry=3296 AND position_x=1673.2 AND position_y=-4250 ;
UPDATE creature_spawns SET position_z=49.16 WHERE entry=12796 AND position_x=1633.56 AND position_y=-4263.7 ;
UPDATE creature_spawns SET position_z=47.67 WHERE entry=3296 AND position_x=1620.45 AND position_y=-4252.84 ;
UPDATE creature_spawns SET position_z=56.38 WHERE entry=12794 AND position_x=1641.65 AND position_y=-4197.52 ;
UPDATE creature_spawns SET position_z=56.38 WHERE entry=12795 AND position_x=1644.59 AND position_y=-4195.53 ;
UPDATE creature_spawns SET position_z=56.38 WHERE entry=12798 AND position_x=1656.62 AND position_y=-4224.73 ;
UPDATE creature_spawns SET position_z=56.38 WHERE entry=12797 AND position_x=1643.48 AND position_y=-4217.4 ;
UPDATE creature_spawns SET position_z=55.44 WHERE entry=12790 AND position_x=1651.96 AND position_y=-4213.8 ;
UPDATE creature_spawns SET position_z=55.44 WHERE entry=19850 AND position_x=1651.85 AND position_y=-4209.56 ;
UPDATE creature_spawns SET position_z=55.44 WHERE entry=12789 AND position_x=1655.53 AND position_y=-4208.76 ;
UPDATE creature_spawns SET position_z=43.19 WHERE entry=7311 AND position_x=1466.88 AND position_y=-4229.92 ;
UPDATE creature_spawns SET position_z=43.19 WHERE entry=5883 AND position_x=1472.48 AND position_y=-4224.6 ;
UPDATE creature_spawns SET position_z=43.19 WHERE entry=5882 AND position_x=1473.55 AND position_y=-4218.57 ;
UPDATE creature_spawns SET position_z=43.19 WHERE entry=5885 AND position_x=1468.18 AND position_y=-4219.88 ;
UPDATE creature_spawns SET position_z=43.79 WHERE entry=14727 AND position_x=1451.64 AND position_y=-4209.35 ;
UPDATE creature_spawns SET position_z=59.22 WHERE entry=5958 AND position_x=1474.97 AND position_y=-4223.14 ;
UPDATE creature_spawns SET position_z=42.81 WHERE entry=3296 AND position_x=1566.22 AND position_y=-4194.07 ;
UPDATE creature_spawns SET position_z=41.17 WHERE entry=3296 AND position_x=1566.45 AND position_y=-4179.18 ;
UPDATE creature_spawns SET position_z=36.47 WHERE entry=3349 AND position_x=1580.05 AND position_y=-4097.68 ;
UPDATE creature_spawns SET position_z=37.94 WHERE entry=3296 AND position_x=1682.14 AND position_y=-4099.99 ;
UPDATE creature_spawns SET position_z=39.48 WHERE entry=3296 AND position_x=1696.31 AND position_y=-4096.76 ;
UPDATE creature_spawns SET position_z=51.78 WHERE entry=3296 AND position_x=1711.45 AND position_y=-3920.75 ;
UPDATE creature_spawns SET position_z=51.78 WHERE entry=3296 AND position_x=1696.56 AND position_y=-3929.77 ;
UPDATE creature_spawns SET position_z=51.78 WHERE entry=3296 AND position_x=1684.94 AND position_y=-3911.59 ;
UPDATE creature_spawns SET position_z=51.78 WHERE entry=3296 AND position_x=1698.85 AND position_y=-3902.94 ;
UPDATE creature_spawns SET position_z=51.88 WHERE entry=5910 AND position_x=1717.78 AND position_y=-4200.11 ;
UPDATE creature_spawns SET position_z=42.88 WHERE entry=3296 AND position_x=1751.45 AND position_y=-4208.82 ;
UPDATE creature_spawns SET position_z=40.23 WHERE entry=3342 AND position_x=1784.44 AND position_y=-4205.35 ;
UPDATE creature_spawns SET position_z=48.17 WHERE entry=3296 AND position_x=1908.35 AND position_y=-4412.74 ;
UPDATE creature_spawns SET position_z=53.42 WHERE entry=3405 AND position_x=1904.86 AND position_y=-4451.63 ;
UPDATE creature_spawns SET position_z=53.42 WHERE entry=3404 AND position_x=1904.76 AND position_y=-4460.69 ;
UPDATE creature_spawns SET position_z=42.09 WHERE entry=14304 AND position_x=1924.73 AND position_y=-4245.42 ;
UPDATE creature_spawns SET position_z=42.07 WHERE entry=14304 AND position_x=1931.52 AND position_y=-4244.78 ;
UPDATE creature_spawns SET position_z=42.16 WHERE entry=14304 AND position_x=1930.46 AND position_y=-4238.26 ;
UPDATE creature_spawns SET position_z=42.16 WHERE entry=14304 AND position_x=1924.79 AND position_y=-4238.43 ;
UPDATE creature_spawns SET position_z=42.07 WHERE entry=14304 AND position_x=1931.52 AND position_y=-4244.78 ;
UPDATE creature_spawns SET position_z=42.05 WHERE entry=14304 AND position_x=1924.73 AND position_y=-4245.42 ;
UPDATE creature_spawns SET position_z=42.32 WHERE entry=4047 AND position_x=1914.65 AND position_y=-4226.58 ;
UPDATE creature_spawns SET position_z=42.32 WHERE entry=5892 AND position_x=1920.95 AND position_y=-4212.99 ;
UPDATE creature_spawns SET position_z=42.21 WHERE entry=14304 AND position_x=1922.2 AND position_y=-4204.38 ;
UPDATE creature_spawns SET position_z=42.19 WHERE entry=14304 AND position_x=1928.19 AND position_y=-4203.37 ;
UPDATE creature_spawns SET position_z=42.32 WHERE entry=3403 AND position_x=1932.88 AND position_y=-4211.3 ;
UPDATE creature_spawns SET position_z=42.32 WHERE entry=3344 AND position_x=1933.69 AND position_y=-4224.86 ;
UPDATE creature_spawns SET position_z=41.15 WHERE entry=14304 AND position_x=1919.36 AND position_y=-4176.05 ;
UPDATE creature_spawns SET position_z=41.15 WHERE entry=14304 AND position_x=1927.48 AND position_y=-4175.91 ;
UPDATE creature_spawns SET position_z=41.15 WHERE entry=16012 AND position_x=1915.67 AND position_y=-4170.77 ;
UPDATE creature_spawns SET position_z=41.15 WHERE entry=14304 AND position_x=1910.21 AND position_y=-4169.48 ;
UPDATE creature_spawns SET position_z=41.15 WHERE entry=3144 AND position_x=1905.75 AND position_y=-4161.37 ;
UPDATE creature_spawns SET position_z=43.71 WHERE entry=14304 AND position_x=1901.27 AND position_y=-4171.16 ;
UPDATE creature_spawns SET position_z=41.13 WHERE entry=14304 AND position_x=1898.32 AND position_y=-4149.7 ;
UPDATE creature_spawns SET position_z=43.69 WHERE entry=14304 AND position_x=1890.67 AND position_y=-4150.02 ;
UPDATE creature_spawns SET position_z=43.67 WHERE entry=14304 AND position_x=1898.44 AND position_y=-4128.35 ;
UPDATE creature_spawns SET position_z=40.64 WHERE entry=14304 AND position_x=1914.56 AND position_y=-4136.63 ;
UPDATE creature_spawns SET position_z=40.63 WHERE entry=14304 AND position_x=1926.54 AND position_y=-4135.56 ;
UPDATE creature_spawns SET position_z=43.26 WHERE entry=14304 AND position_x=1912.25 AND position_y=-4124.2 ;
UPDATE creature_spawns SET position_z=43.22 WHERE entry=17098 AND position_x=1914.83 AND position_y=-4123.96 ;
UPDATE creature_spawns SET position_z=43.19 WHERE entry=14304 AND position_x=1927.04 AND position_y=-4123.48 ;
UPDATE creature_spawns SET position_z=43.18 WHERE entry=29346 AND position_x=1923.94 AND position_y=-4125.77 ;
UPDATE creature_spawns SET position_z=43.72 WHERE entry=14304 AND position_x=1941.71 AND position_y=-4124.25 ;
UPDATE creature_spawns SET position_z=41.14 WHERE entry=23131 AND position_x=1938.95 AND position_y=-4130.73 ;
UPDATE creature_spawns SET position_z=41.15 WHERE entry=23131 AND position_x=1942.32 AND position_y=-4133.69 ;
UPDATE creature_spawns SET position_z=41.14 WHERE entry=23128 AND position_x=1939.69 AND position_y=-4133.33 ;
UPDATE creature_spawns SET position_z=43.49 WHERE entry=14304 AND position_x=1951.96 AND position_y=-4145.71 ;
UPDATE creature_spawns SET position_z=41.10 WHERE entry=14304 AND position_x=1944.36 AND position_y=-4146.45 ;
UPDATE creature_spawns SET position_z=43.71 WHERE entry=14304 AND position_x=1944.79 AND position_y=-4168.14 ;
UPDATE creature_spawns SET position_z=41.14 WHERE entry=10540 AND position_x=1934.06 AND position_y=-4162.26 ;
UPDATE creature_spawns SET position_z=41.15 WHERE entry=14304 AND position_x=1933.29 AND position_y=-4168.81 ;
UPDATE creature_spawns SET position_z=31.94 WHERE entry=3296 AND position_x=1902.14 AND position_y=-4275.21 ;
UPDATE creature_spawns SET position_z=22.95 WHERE entry=3296 AND position_x=1920.62 AND position_y=-4365.93 ;
UPDATE creature_spawns SET position_z=22.72 WHERE entry=3296 AND position_x=1921.7 AND position_y=-4375.67 ;
UPDATE creature_spawns SET position_z=22.66 WHERE entry=3296 AND position_x=1952.53 AND position_y=-4368.57 ;
UPDATE creature_spawns SET position_z=22.19 WHERE entry=3296 AND position_x=1950.89 AND position_y=-4374.69 ;
UPDATE creature_spawns SET position_z=24.77 WHERE entry=3346 AND position_x=1918.26 AND position_y=-4436.26 ;
UPDATE creature_spawns SET position_z=24.80 WHERE entry=3345 AND position_x=1912.18 AND position_y=-4436.61 ;
UPDATE creature_spawns SET position_z=24.79 WHERE entry=11066 AND position_x=1913.25 AND position_y=-4430.54 ;
UPDATE creature_spawns SET position_z=23.89 WHERE entry=3296 AND position_x=1928.32 AND position_y=-4424.41 ;
UPDATE creature_spawns SET position_z=21.45 WHERE entry=3296 AND position_x=1889.53 AND position_y=-4485.08 ;
UPDATE creature_spawns SET position_z=20.78 WHERE entry=3296 AND position_x=1882.15 AND position_y=-4483.99 ;
UPDATE creature_spawns SET position_z=25.89 WHERE entry=3348 AND position_x=1954.75 AND position_y=-4466.79 ;
UPDATE creature_spawns SET position_z=25.92 WHERE entry=11046 AND position_x=1966.15 AND position_y=-4463.1 ;
UPDATE creature_spawns SET position_z=25.93 WHERE entry=3347 AND position_x=1964.88 AND position_y=-4477.84 ;
UPDATE creature_spawns SET position_z=29.29 WHERE entry=6986 AND position_x=1931.78 AND position_y=-4514.99 ;
UPDATE creature_spawns SET position_z=29.29 WHERE entry=6987 AND position_x=1928.33 AND position_y=-4517.21 ;
UPDATE creature_spawns SET position_z=34.12 WHERE entry=3296 AND position_x=1913.71 AND position_y=-4559.36 ;
UPDATE creature_spawns SET position_z=34.12 WHERE entry=3296 AND position_x=1906.25 AND position_y=-4564.21 ;
UPDATE creature_spawns SET position_z=34.12 WHERE entry=3296 AND position_x=1910.24 AND position_y=-4623.92 ;
UPDATE creature_spawns SET position_z=34.12 WHERE entry=3296 AND position_x=1902.63 AND position_y=-4628.79 ;
UPDATE creature_spawns SET position_z=39.49 WHERE entry=3359 AND position_x=1878.64 AND position_y=-4708.13 ;
UPDATE creature_spawns SET position_z=36.48 WHERE entry=3410 AND position_x=1914.16 AND position_y=-4775.87 ;
UPDATE creature_spawns SET position_z=48.66 WHERE entry=4485 AND position_x=1953.59 AND position_y=-4735.77 ;
UPDATE creature_spawns SET position_z=49.11 WHERE entry=3296 AND position_x=1963.01 AND position_y=-4730.91 ;
UPDATE creature_spawns SET position_z=56.99 WHERE entry=27399 AND position_x=1964.46 AND position_y=-4798.77 ;
UPDATE creature_spawns SET position_z=56.99 WHERE entry=3354 AND position_x=1970.95 AND position_y=-4808.17 ;
UPDATE creature_spawns SET position_z=56.99 WHERE entry=19912 AND position_x=1987.4 AND position_y=-4813.11 ;
UPDATE creature_spawns SET position_z=56.99 WHERE entry=3408 AND position_x=1997.93 AND position_y=-4807.95 ;
UPDATE creature_spawns SET position_z=56.05 WHERE entry=15350 AND position_x=1989.93 AND position_y=-4799.55 ;
UPDATE creature_spawns SET position_z=56.03 WHERE entry=3353 AND position_x=1980 AND position_y=-4799.74 ;
UPDATE creature_spawns SET position_z=56.02 WHERE entry=34955 AND position_x=1976.09 AND position_y=-4795.15 ;
UPDATE creature_spawns SET position_z=56.05 WHERE entry=35602 AND position_x=1980.62 AND position_y=-4786.48 ;
UPDATE creature_spawns SET position_z=26.44 WHERE entry=3296 AND position_x=2004.18 AND position_y=-4719.8 ;
UPDATE creature_spawns SET position_z=26.41 WHERE entry=8122 AND position_x=2014.38 AND position_y=-4729.67 ;
UPDATE creature_spawns SET position_z=27.03 WHERE entry=3357 AND position_x=2029.91 AND position_y=-4706.16 ;
UPDATE creature_spawns SET position_z=27.03 WHERE entry=3358 AND position_x=2025.08 AND position_y=-4708.91 ;
UPDATE creature_spawns SET position_z=23.11 WHERE entry=7790 AND position_x=2064.33 AND position_y=-4791.98 ;
UPDATE creature_spawns SET position_z=23.04 WHERE entry=11177 AND position_x=2048.8 AND position_y=-4799.86 ;
UPDATE creature_spawns SET position_z=23.41 WHERE entry=11178 AND position_x=2051.84 AND position_y=-4794.39 ;
UPDATE creature_spawns SET position_z=23.05 WHERE entry=1383 AND position_x=2055.83 AND position_y=-4797.07 ;
UPDATE creature_spawns SET position_z=22.61 WHERE entry=11176 AND position_x=2055.53 AND position_y=-4802.11 ;
UPDATE creature_spawns SET position_z=22.56 WHERE entry=7230 AND position_x=2054.63 AND position_y=-4805.99 ;
UPDATE creature_spawns SET position_z=22.64 WHERE entry=10266 AND position_x=2052.21 AND position_y=-4813.46 ;
UPDATE creature_spawns SET position_z=23.18 WHERE entry=7792 AND position_x=2055.71 AND position_y=-4815.9 ;
UPDATE creature_spawns SET position_z=24.58 WHERE entry=3355 AND position_x=2058.97 AND position_y=-4835.58 ;
UPDATE creature_spawns SET position_z=24.58 WHERE entry=5812 AND position_x=2053.4 AND position_y=-4838.88 ;
UPDATE creature_spawns SET position_z=24.84 WHERE entry=3356 AND position_x=2049.79 AND position_y=-4839.13 ;
UPDATE creature_spawns SET position_z=24.30 WHERE entry=3409 AND position_x=2099.23 AND position_y=-4818.85 ;
UPDATE creature_spawns SET position_z=24.35 WHERE entry=2704 AND position_x=2090.27 AND position_y=-4824.21 ;
UPDATE creature_spawns SET position_z=24.34 WHERE entry=11868 AND position_x=2091.02 AND position_y=-4826.49 ;
UPDATE creature_spawns SET position_z=24.25 WHERE entry=3361 AND position_x=2097.42 AND position_y=-4824.92 ;
UPDATE creature_spawns SET position_z=24.23 WHERE entry=7231 AND position_x=2105.33 AND position_y=-4829.99 ;
UPDATE creature_spawns SET position_z=24.26 WHERE entry=4043 AND position_x=2097.44 AND position_y=-4834.81 ;
UPDATE creature_spawns SET position_z=26.69 WHERE entry=14498 AND position_x=2052.27 AND position_y=-4670.94 ;
UPDATE creature_spawns SET position_z=27.04 WHERE entry=3333 AND position_x=1995.41 AND position_y=-4662.32 ;
UPDATE creature_spawns SET position_z=26.64 WHERE entry=3332 AND position_x=2000.62 AND position_y=-4659.66 ;
UPDATE creature_spawns SET position_z=27.67 WHERE entry=16076 AND position_x=1989.31 AND position_y=-4655.91 ;
UPDATE creature_spawns SET position_z=27.58 WHERE entry=16069 AND position_x=1989.83 AND position_y=-4656.83 ;
UPDATE creature_spawns SET position_z=27.28 WHERE entry=7951 AND position_x=1991.32 AND position_y=-4652.35 ;
UPDATE creature_spawns SET position_z=27.21 WHERE entry=15186 AND position_x=1992.19 AND position_y=-4651.05 ;
UPDATE creature_spawns SET position_z=25.46 WHERE entry=3296 AND position_x=1479.39 AND position_y=-4406.25 ;
UPDATE creature_spawns SET position_z=7.96 WHERE entry=3317 AND position_x=1583.8 AND position_y=-4473.31 ;
UPDATE creature_spawns SET position_z=7.89 WHERE entry=3321 AND position_x=1589.02 AND position_y=-4469.48 ;
UPDATE creature_spawns SET position_z=7.90 WHERE entry=3319 AND position_x=1593.54 AND position_y=-4465.65 ;
UPDATE creature_spawns SET position_z=7.85 WHERE entry=3296 AND position_x=1603.48 AND position_y=-4449.95 ;
UPDATE creature_spawns SET position_z=15.66 WHERE entry=6929 AND position_x=1633.99 AND position_y=-4439.37 ;
UPDATE creature_spawns SET position_z=15.63 WHERE entry=5610 AND position_x=1640.71 AND position_y=-4442.19 ;
UPDATE creature_spawns SET position_z=15.63 WHERE entry=5611 AND position_x=1640.83 AND position_y=-4446.99 ;
UPDATE creature_spawns SET position_z=16.01 WHERE entry=5614 AND position_x=1639.56 AND position_y=-4443.74 ;
UPDATE creature_spawns SET position_z=15.63 WHERE entry=5613 AND position_x=1638.28 AND position_y=-4445 ;
UPDATE creature_spawns SET position_z=15.63 WHERE entry=5606 AND position_x=1633.94 AND position_y=-4445.62 ;
UPDATE creature_spawns SET position_z=15.63 WHERE entry=5606 AND position_x=1634.16 AND position_y=-4447.18 ;
UPDATE creature_spawns SET position_z=20.29 WHERE entry=9856 AND position_x=1695.92 AND position_y=-4455.55 ;
UPDATE creature_spawns SET position_z=20.30 WHERE entry=3296 AND position_x=1696.02 AND position_y=-4463.71 ;
UPDATE creature_spawns SET position_z=45.65 WHERE entry=3400 AND position_x=1779.08 AND position_y=-4488.08 ;
UPDATE creature_spawns SET position_z=45.65 WHERE entry=3368 AND position_x=1775.1 AND position_y=-4482.91 ;
UPDATE creature_spawns SET position_z=45.65 WHERE entry=3399 AND position_x=1769.16 AND position_y=-4485.63 ;
UPDATE creature_spawns SET position_z=27.75 WHERE entry=3369 AND position_x=1780.63 AND position_y=-4505.51 ;
UPDATE creature_spawns SET position_z=24.99 WHERE entry=5811 AND position_x=1855.31 AND position_y=-4568.12 ;
UPDATE creature_spawns SET position_z=28.66 WHERE entry=3296 AND position_x=1886.2 AND position_y=-4546.68 ;
UPDATE creature_spawns SET position_z=29.39 WHERE entry=3413 AND position_x=2036.63 AND position_y=-4739.49 ;
UPDATE creature_spawns SET position_z=29.39 WHERE entry=3412 AND position_x=2036.22 AND position_y=-4746.5 ;
UPDATE creature_spawns SET position_z=29.39 WHERE entry=11017 AND position_x=2038.4 AND position_y=-4748.98 ;
UPDATE creature_spawns SET position_z=29.39 WHERE entry=9317 AND position_x=2045.53 AND position_y=-4753.81 ;
UPDATE creature_spawns SET position_z=29.39 WHERE entry=2857 AND position_x=2047.99 AND position_y=-4746.01 ;
UPDATE creature_spawns SET position_z=51.27 WHERE entry=3296 AND position_x=2049.3 AND position_y=-4629.26 ;
UPDATE creature_spawns SET position_z=27.62 WHERE entry=16069 AND position_x=1989.83 AND position_y=-4656.83 ;
UPDATE creature_spawns SET position_z=28.62 WHERE entry=3296 AND position_x=1886.2 AND position_y=-4546.68 ;
UPDATE creature_spawns SET position_z=23.01 WHERE entry=3363 AND position_x=1806.85 AND position_y=-4573.32 ;
UPDATE creature_spawns SET position_z=23.01 WHERE entry=3364 AND position_x=1792.65 AND position_y=-4565.39 ;
UPDATE creature_spawns SET position_z=23.01 WHERE entry=3315 AND position_x=1802.08 AND position_y=-4561.55 ;
UPDATE creature_spawns SET position_z=27.75 WHERE entry=3369 AND position_x=1780.63 AND position_y=-4505.51 ;
UPDATE creature_spawns SET position_z=40.62 WHERE entry=8404 AND position_x=1527.01 AND position_y=-4154.91 ;
UPDATE creature_spawns SET position_z=53.39 WHERE entry=5640 AND position_x=1781.55 AND position_y=-3997.07 ;
UPDATE creature_spawns SET position_z=43.71 WHERE entry=14304 AND position_x=1951.96 AND position_y=-4145.71 ;
UPDATE creature_spawns SET position_z=23.40 WHERE entry=3350 AND position_x=1891.6 AND position_y=-4326.75 ;
UPDATE creature_spawns SET position_z=23.40 WHERE entry=3351 AND position_x=1890.9 AND position_y=-4322.09 ;
UPDATE creature_spawns SET position_z=22.80 WHERE entry=3296 AND position_x=1952.53 AND position_y=-4368.57 ;
UPDATE creature_spawns SET position_z=11.86 WHERE entry=3296 AND position_x=1886.46 AND position_y=-4415.86 ;
UPDATE creature_spawns SET position_z=-17.20 WHERE entry=3216 AND position_x=1800.66 AND position_y=-4374.51 ;
UPDATE creature_spawns SET position_z=-15.78 WHERE entry=3329 AND position_x=1766.71 AND position_y=-4367.36 ;
UPDATE creature_spawns SET position_z=-12.18 WHERE entry=3330 AND position_x=1823.88 AND position_y=-4302.59 ;
UPDATE creature_spawns SET position_z=-12.19 WHERE entry=5816 AND position_x=1820.77 AND position_y=-4300.23 ;
UPDATE creature_spawns SET position_z=-15.47 WHERE entry=3335 AND position_x=1846.54 AND position_y=-4325.67 ;
UPDATE creature_spawns SET position_z=5.34 WHERE entry=3296 AND position_x=1845.49 AND position_y=-4395.95 ;
UPDATE creature_spawns SET position_z=11.86 WHERE entry=3296 AND position_x=1886.46 AND position_y=-4415.86 ;
UPDATE creature_spawns SET position_z=27.75 WHERE entry=3369 AND position_x=1780.63 AND position_y=-4505.51 ;
UPDATE creature_spawns SET position_z=-14.64 WHERE entry=3325 AND position_x=1834.66 AND position_y=-4362.52 ;
UPDATE creature_spawns SET position_z=-14.62 WHERE entry=5815 AND position_x=1836.86 AND position_y=-4347.13 ;
UPDATE creature_spawns SET position_z=-7.73 WHERE entry=3296 AND position_x=1775.07 AND position_y=-4319.91 ;
UPDATE creature_spawns SET position_z=-7.67 WHERE entry=3189 AND position_x=1772.72 AND position_y=-4343.18 ;
UPDATE creature_spawns SET position_z=-7.84 WHERE entry=29143 AND position_x=1762.84 AND position_y=-4345.06 ;
UPDATE creature_spawns SET position_z=6.14 WHERE entry=3331 AND position_x=1750.38 AND position_y=-4320.91 ;
UPDATE creature_spawns SET position_z=7.67 WHERE entry=3328 AND position_x=1762.88 AND position_y=-4296.38 ;
UPDATE creature_spawns SET position_z=7.98 WHERE entry=3401 AND position_x=1771.21 AND position_y=-4284.42 ;
UPDATE creature_spawns SET position_z=8.09 WHERE entry=6446 AND position_x=1772.94 AND position_y=-4279.93 ;
UPDATE creature_spawns SET position_z=7.73 WHERE entry=3402 AND position_x=1778.55 AND position_y=-4279.88 ;
UPDATE creature_spawns SET position_z=7.48 WHERE entry=3327 AND position_x=1792.34 AND position_y=-4279.38 ;
UPDATE creature_spawns SET position_z=7.31 WHERE entry=3334 AND position_x=1811.04 AND position_y=-4270.9 ;
UPDATE creature_spawns SET position_z=8.26 WHERE entry=3296 AND position_x=1603.48 AND position_y=-4449.95 ;
UPDATE creature_spawns SET position_z=25.46 WHERE entry=3296 AND position_x=1481.77 AND position_y=-4427.79 ;
UPDATE creature_spawns SET position_z=24.99 WHERE entry=3316 AND position_x=1855.82 AND position_y=-4562.49 ;
UPDATE creature_spawns SET position_z=24.99 WHERE entry=3365 AND position_x=1860.9 AND position_y=-4561.51 ;
UPDATE creature_spawns SET position_z=24.99 WHERE entry=7088 AND position_x=1849.04 AND position_y=-4569.23 ;
UPDATE creature_spawns SET position_z=24.99 WHERE entry=3366 AND position_x=1848.01 AND position_y=-4564.89 ;
UPDATE creature_spawns SET position_z=39.49 WHERE entry=3359 AND position_x=1878.64 AND position_y=-4708.13 ;
UPDATE creature_spawns SET position_z=46.66 WHERE entry=9988 AND position_x=2133.44 AND position_y=-4667.45 ;
UPDATE creature_spawns SET position_z=49.89 WHERE entry=3362 AND position_x=2159.36 AND position_y=-4653.74 ;
UPDATE creature_spawns SET position_z=54.47 WHERE entry=7294 AND position_x=2067.86 AND position_y=-4598.88 ;
UPDATE creature_spawns SET position_z=58.82 WHERE entry=3406 AND position_x=2084.96 AND position_y=-4623.77 ;
UPDATE creature_spawns SET position_z=58.93 WHERE entry=3352 AND position_x=2100.58 AND position_y=-4606.96 ;
UPDATE creature_spawns SET position_z=58.88 WHERE entry=3407 AND position_x=2107.35 AND position_y=-4633.78 ;
UPDATE creature_spawns SET position_z=44.28 WHERE entry=6018 AND position_x=1452.43 AND position_y=-4179.82 ;
UPDATE creature_spawns SET position_z=61.56 WHERE entry=6014 AND position_x=1453.24 AND position_y=-4185.65 ;
UPDATE creature_spawns SET position_z=61.56 WHERE entry=5994 AND position_x=1461.02 AND position_y=-4181.68 ;
UPDATE creature_spawns SET position_z=44.02 WHERE entry=3373 AND position_x=1482.72 AND position_y=-4159.95 ;
-- new ones
UPDATE creature_spawns SET position_z=26.18 WHERE entry=3370 AND position_x=1575.800 AND position_y=-4292.670 ;
UPDATE creature_spawns SET position_z=26.20 WHERE entry=5188 AND position_x=1579.360 AND position_y=-4294.500 ;
UPDATE creature_spawns SET position_z=22.71 WHERE entry=3296 AND position_x=1623.150 AND position_y=-4279.640 ;
UPDATE creature_spawns SET position_z=24.23 WHERE entry=3296 AND position_x=1628.890 AND position_y=-4274.760 ;
UPDATE creature_spawns SET position_z=32.27 WHERE entry=3296 AND position_x=1689.990 AND position_y=-4279.850 ;
UPDATE creature_spawns SET position_z=33.54 WHERE entry=3323 AND position_x=1744.900 AND position_y=-4317.860 ;
UPDATE creature_spawns SET position_z=19.00 WHERE entry=3313 AND position_x=1520.540 AND position_y=-4355.580 ;
UPDATE creature_spawns SET position_z=19.05 WHERE entry=5817 AND position_x=1522.300 AND position_y=-4352.530 ;
UPDATE creature_spawns SET position_z=10.39 WHERE entry=19175 AND position_x=1607.390 AND position_y=-4402.930 ;
UPDATE creature_spawns SET position_z=9.31 WHERE entry=19175 AND position_x=1603.360 AND position_y=-4404.490 ;

UPDATE creature_proto SET npcflags=1 WHERE entry=2209;
UPDATE creature_names SET info_str='' WHERE entry=2209;
UPDATE creature_proto SET npcflags=1 WHERE entry=2210;
UPDATE creature_names SET info_str='' WHERE entry=2210;

UPDATE creature_spawns SET slot1item=0, bytes2=4096 WHERE id=16706;

-- 11.01.2013 Thanks to FaceTheSlayer
-- Anvil
REPLACE into gameobject_spawns (id, Entry, map, position_x, position_y, position_z, Facing, orientation1,
orientation2, orientation3, orientation4, State, Flags, Faction, Scale, stateNpcLink, phase, overrides)
VALUES (57072, 1684, 1, 1525.025391, -4371.335449, 18.155767, 1.546458, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0);
-- Forge
REPLACE into gameobject_spawns (id, Entry, map, position_x, position_y, position_z, Facing, orientation1,
orientation2, orientation3, orientation4, State, Flags, Faction, Scale, stateNpcLink, phase, overrides)
VALUES (57073, 173095, 1, 1522.752808, -4368.565918, 18.340502, 2.726120, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0);

REPLACE INTO npc_gossip_textid (creatureid, textid) VALUES (13842, 6475);
UPDATE creature_proto SET npcflags = 3 where entry = 13842;

-- Quest Chicken Clucking for a Mint in Ironforge should be Ally only
UPDATE quests SET `RequiredRaces` = '1101' where `entry` = '8353';
-- Quest Chicken Clucking for a Mint in Undercity should be Horde only
UPDATE quests SET `RequiredRaces` = '690' where `entry` = '8354';

-- Quest Incoming Gumdrop in Gnomeregan should be Ally only
UPDATE quests SET `RequiredRaces` = '1101' where `entry` = '8355';
-- Quest Incoming Gumdrop in Durotar should be Horde only
UPDATE quests SET `RequiredRaces` = '690' where `entry` = '8358';

-- Quest Flexing for Nougat in Orgrimmar should be Horde only
UPDATE quests SET `RequiredRaces` = '690' where `entry` = '8359';

-- Quest for Marzipan in Thunderbluff should be Horde only
UPDATE quests SET `RequiredRaces` = '690' where `entry` = '8360';

-- 11.01.2013 Thanks to Sirala
UPDATE quests SET IsRepeatable=2 WHERE entry=7043; 
UPDATE quests SET Details='The Winterfall are known to carry spirit beads to ward against foul spirits. These beads have clearly failed in their purpose, as the Winterfall themselves are the agents of corruption. Bring to me these spirit beads from fallen Winterfall furbolgs; for every set of five you bring me, you will earn recognition amongst the Timbermaw.', Objectives='Bring any spirit beads you find to Salsa.', IncompleteText='You''ve certainly earned my trust, $N, but you may need to continue to earn the trust of my untrusting tribe. There is something you can do to earn that trust.  Do you have more spirit beads?' WHERE entry=8469;
UPDATE quests SET Details='Some of the Deadwood furbolgs wear a distinctive headdress that may be used as a means of proof in thinning their numbers. Bring me a feather from any headdresses you acquire; for every set of five you bring me, you will earn recognition amongst the Timbermaw.', Objectives='Bring any of the feathers you find to Grazle.', IncompleteText='While you have proven yourself to me, you may need to continue to work toward proving yourself to the suspicious brethren of my tribe. To that end, I may be able to continue assisting you. Do you have more feathers?' WHERE entry=8466;
UPDATE quests SET Details='If you seek to prove your loyalty to us, there is no better way than to continue your fight against these Ogres.', Objectives='Bring the Obsidian Warbeads to Warden Moi''bff Jill.' WHERE entry=10477;

UPDATE quests SET Details='A Corruptor''s Scourgestone is the insignia of the Scourge''s overlords. A powerful being that holds a position of authority over the Scourge will always possess one. To slay such a malevolent creature would surely advance the cause of the Argent Dawn, and all good causes!', Objectives='Bring a Corruptor''s Scourgestone to Duke Nicholas Zverenhoff at the Light''s Hope Chapel.', IncompleteText='On behalf of the Argent Dawn, I will give you a valor token in exchange for just a single one of these insignia. Use caution in acquiring one, $N - such powerful beings are not to be trifled with.' WHERE entry=5508;
UPDATE quests SET Details='An Invader''s Scourgestone is the insignia of the Scourge''s elite troops. These are sometimes found on the stronger of the troops positioned in the Plaguelands. Slaying such a creature is indeed a challenge, but one that should be relished with a commission to vanquish evil.', Objectives='Bring ten of the Invader''s Scourgestones to Duke Nicholas Zverenhoff at the Light''s Hope Chapel.', IncompleteText='The Argent Dawn currently offers a valor token in exchange for ten of these insignia. Bring them to me here, and I will make sure you receive your just reward.' WHERE entry=5509;
UPDATE quests SET Details='A Minion''s Scourgestone is the insignia of the Scourge rank and file. These are sometimes found on the weaker of their troops positioned in the Plaguelands, though the term "weaker" is certainly to be considered in context. The Scourge, no matter where they are, should never be underestimated.', Objectives='Bring 20 of the Minion''s Scourgestone to Duke Nicholas Zverenhoff at the Light‘‘s Hope Chapel.', IncompleteText='The Argent Dawn currently offers a valor token in exchange for twenty of these insignia - an exchange I''m happy to do, provided you have earned enough scourgestones!' WHERE entry=5510;

UPDATE quests SET IsRepeatable=1, Details=' With the proper treatment, the hearts of the unliving can produce potent elixirs.$B$BHunt down the zombies that roam the Dead Scar and bring me their hearts.', Objectives='Bring back ten Rotting Hearts to Magistrix Aminel in Tranquillien.' WHERE entry=9217;
UPDATE quests SET IsRepeatable=1, Details='Bring me some spinal dust and I''ll be glad to provide you with a sample. You''ll find an ample number of skeletons wandering the Dead Scar, west of here.', Objectives='Bring back ten Spinal Dusts to Magistrix Aminel in Tranquillien.' WHERE entry=9219;

-- 12.01.2013
UPDATE npc_monstersay SET chance=10 WHERE entry=5109 and event=1; -- She's nerving ;-)

-- 16.01.2013
set @questid = 1790;
UPDATE quests SET Objectives	= 'Speak with Duthorian Rall again.' WHERE entry=@questid;
UPDATE quests SET CompletionText	= 'Make haste, $N, more than one life hangs in the balance if you fail.$B$BIf for some reason you fail to help Henze, then return to me and I will give you another Symbol of Life for your travels.$B$BDon''t mistake my aid as simple charity, you must prove yourself worthy like any other $C and continual failure may reflect upon you later.' WHERE entry=@questid;
UPDATE quests SET RequiredQuest1 = 1781  WHERE entry=@questid;

set @questid = 1641;
UPDATE quests SET Objectives	= 'Speak with Duthorian Rall again.' WHERE entry=@questid;

set @questid = 1793;
UPDATE quests SET Objectives	= 'Speak with Duthorian Rall again.' WHERE entry=@questid;
UPDATE quests SET IsRepeatable = 0 WHERE entry=@questid;

UPDATE quests SET SrcItemCount=1, srcItem=6866 WHERE entry=1786;
UPDATE quests SET SrcItemCount=1, srcItem=6866 WHERE entry=1783;
-- UPDATE quests SET SrcItemCount=0, srcItem=0, RewItemCount1=1, RewItemId1=6866 WHERE entry=1781;

UPDATE items SET bonding=4 WHERE entry=6866;
UPDATE quests SET RequiredQuest1=0, RequiredOneOfQuest='2998 2999' WHERE entry=1641;

-- 22.01.2013
DELETE FROM creature_quest_finisher WHERE id=13444 AND quest=7021;
DELETE FROM creature_quest_finisher WHERE id=13444 AND quest=7024;

UPDATE quests SET IsRepeatable = 1 WHERE entry=1789;
UPDATE quests SET Objectives	= 'Speak with Tiza Battleforge again.' WHERE entry=1789;

-- 24.01.2013
UPDATE creature_proto SET faction=35 WHERE entry IN (15897, 15893, 15894); 

-- 26.01.2013
-- Thanks to darkangel39
UPDATE `worldstate_templates` SET `zone`=4273 WHERE `field` IN (4195,4196,4197);

UPDATE `creature_proto` SET `npcflags` = `npcflags` + 1 WHERE `npcflags` != `npcflags`|1 and `entry` IN (37119,39371,39372);

DELETE FROM `npc_gossip_textid` WHERE `creatureid` IN (37119,39371,39372,38316);
INSERT INTO `npc_gossip_textid` (`creatureid`,`textid`) VALUES
   (37119,15103),
   (39371,15602),
   (39372,15606),
   (38316,15298);

DELETE FROM `creature_quest_finisher` WHERE `id`=38316;
INSERT INTO `creature_quest_finisher`(`id`,`quest`) VALUES
   (38316,24815),
   (38316,24823),
   (38316,24825),
   (38316,24826),
   (38316,24827),
   (38316,24828),
   (38316,24829),
   (38316,24830),
   (38316,24831),
   (38316,24832),
   (38316,24833),
   (38316,24834),
   (38316,24835),
   (38316,25239),
   (38316,25240),
   (38316,25242);

DELETE FROM `creature_quest_starter` WHERE `id`=38316;
INSERT INTO `creature_quest_starter`(`id`,`quest`) VALUES
   (38316,24815),
   (38316,24823),
   (38316,24825),
   (38316,24826),
   (38316,24827),
   (38316,24828),
   (38316,24829),
   (38316,24830),
   (38316,24831),
   (38316,24832),
   (38316,24833),
   (38316,24834),
   (38316,24835),
   (38316,25239),
   (38316,25240),
   (38316,25242);
   

-- Thanks to FaceTheSlayer
-- fixes the level and other associated values of the North Fleet Marine in Howling Fjord
-- so it's no longer level 1
UPDATE creature_proto SET `minlevel`='68', `maxlevel`='69', `minhealth`='6986', `maxhealth`='7984', `mindamage`='490', `maxdamage`='692' WHERE `entry`='23983';
-- Applies the Sickly Critter Aura to Sickly Gazelle (The Barrens)
-- to make it appear correctly in green with those spooky skull clouds
UPDATE creature_proto SET auras = '19502' WHERE entry = '12296'; 


-- Set LoE db version
UPDATE db_version SET revision=7 WHERE db_name='LoE World';

