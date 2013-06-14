-- **********************************************
-- LoE World changeset   Rev 4 
-- **********************************************

-- 23.9.2012
set @spawnid = 62904;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 7, 8426.36, -7568.02, 174.63, 6000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 8, 8435.29, -7552.58, 174.46, 4000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 9, 8426.89, -7559.91, 174.52, 8000, 0, 0, 0, 0, 0, 0, 0);

set @spawnid = 10958;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, 2688.84, 956.76, 112.95, 8000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, 2714.73, 950.16, 110.82, 4000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 3, 2726.04, 941.91, 110.26, 7000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 4, 2700.57, 943.16, 110.86, 9000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 5, 2669.82, 943.24, 112.78, 9000, 0, 0, 0, 0, 0, 0, 0);

set @spawnid = 10959;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, 2686.68, 972.16, 114.36, 7000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, 2675.96, 991.25, 113.79, 8000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 3, 2685.66, 998.86, 111.65, 3000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 4, 2703.29, 1005.12, 110.63, 7000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 5, 2689.32, 978.75, 113.89, 9000, 0, 0, 0, 0, 0, 0, 0);

set @spawnid = 11312;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, 3020.99, -541.96, 119.23, 5000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, 3009.83, -531.26, 115.26, 6000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 3, 3003.34, -543.13, 115.74, 5000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 4, 3014.21, -546.20, 117.90, 4000, 0, 0, 0, 0, 0, 0, 0);

set @spawnid = 11315;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, 3066.53, -538.77, 126.67, 8000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, 3056.35, -549.80, 126.72, 7000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 3, 3063.45, -545.57, 126.69, 6000, 0, 0, 0, 0, 0, 0, 0);

set @spawnid = 55471;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, 6929.27, -2271.68, 590.08, 6000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, 6919.58, -2280.60, 589.97, 4000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 3, 6906.92, -2294.15, 590.52, 8000, 0, 0, 0, 0, 0, 0, 0);

-- delete double chests
DELETE from gameobject_spawns WHERE Entry=153453 AND orientation3>0 AND orientation3<1;
DELETE from gameobject_spawns WHERE Entry=153454 AND orientation3>0 AND orientation3<1;

-- correct small chances below 0.01% to 0.01%
UPDATE loot_items SET normal10percentchance=0.01 WHERE ( normal10percentchance>0 AND normal10percentchance<0.01 );
UPDATE loot_items SET normal25percentchance=0.01 WHERE ( normal25percentchance>0 AND normal25percentchance<0.01 );
UPDATE loot_items SET heroic10percentchance=0.01 WHERE ( heroic10percentchance>0 AND heroic10percentchance<0.01 );
UPDATE loot_items SET heroic25percentchance=0.01 WHERE ( heroic25percentchance>0 AND heroic25percentchance<0.01 );

UPDATE loot_gameobjects SET normal10percentchance=0.01 WHERE ( normal10percentchance>0 AND normal10percentchance<0.01 );
UPDATE loot_gameobjects SET normal25percentchance=0.01 WHERE ( normal25percentchance>0 AND normal25percentchance<0.01 );
UPDATE loot_gameobjects SET heroic10percentchance=0.01 WHERE ( heroic10percentchance>0 AND heroic10percentchance<0.01 );
UPDATE loot_gameobjects SET heroic25percentchance=0.01 WHERE ( heroic25percentchance>0 AND heroic25percentchance<0.01 );

UPDATE loot_fishing SET normal10percentchance=0.01 WHERE ( normal10percentchance>0 AND normal10percentchance<0.01 );
UPDATE loot_fishing SET normal25percentchance=0.01 WHERE ( normal25percentchance>0 AND normal25percentchance<0.01 );
UPDATE loot_fishing SET heroic10percentchance=0.01 WHERE ( heroic10percentchance>0 AND heroic10percentchance<0.01 );
UPDATE loot_fishing SET heroic25percentchance=0.01 WHERE ( heroic25percentchance>0 AND heroic25percentchance<0.01 );

UPDATE loot_pickpocketing SET normal10percentchance=0.01 WHERE ( normal10percentchance>0 AND normal10percentchance<0.01 );
UPDATE loot_pickpocketing SET normal25percentchance=0.01 WHERE ( normal25percentchance>0 AND normal25percentchance<0.01 );
UPDATE loot_pickpocketing SET heroic10percentchance=0.01 WHERE ( heroic10percentchance>0 AND heroic10percentchance<0.01 );
UPDATE loot_pickpocketing SET heroic25percentchance=0.01 WHERE ( heroic25percentchance>0 AND heroic25percentchance<0.01 );

UPDATE loot_skinning SET normal10percentchance=0.01 WHERE ( normal10percentchance>0 AND normal10percentchance<0.01 );
UPDATE loot_skinning SET normal25percentchance=0.01 WHERE ( normal25percentchance>0 AND normal25percentchance<0.01 );
UPDATE loot_skinning SET heroic10percentchance=0.01 WHERE ( heroic10percentchance>0 AND heroic10percentchance<0.01 );
UPDATE loot_skinning SET heroic25percentchance=0.01 WHERE ( heroic25percentchance>0 AND heroic25percentchance<0.01 );

ALTER TABLE loot_items CHANGE `normal10percentchance` `normal10percentchance` FLOAT( 5, 2 ) NOT NULL DEFAULT '0.00';
ALTER TABLE loot_items CHANGE `normal25percentchance` `normal25percentchance` FLOAT( 5, 2 ) NOT NULL DEFAULT '0.00';
ALTER TABLE loot_items CHANGE `heroic10percentchance` `heroic10percentchance` FLOAT( 5, 2 ) NOT NULL DEFAULT '0.00';
ALTER TABLE loot_items CHANGE `heroic25percentchance` `heroic25percentchance` FLOAT( 5, 2 ) NOT NULL DEFAULT '0.00';

ALTER TABLE loot_gameobjects CHANGE `normal10percentchance` `normal10percentchance` FLOAT( 5, 2 ) NOT NULL DEFAULT '0.00';
ALTER TABLE loot_gameobjects CHANGE `normal25percentchance` `normal25percentchance` FLOAT( 5, 2 ) NOT NULL DEFAULT '0.00';
ALTER TABLE loot_gameobjects CHANGE `heroic10percentchance` `heroic10percentchance` FLOAT( 5, 2 ) NOT NULL DEFAULT '0.00';
ALTER TABLE loot_gameobjects CHANGE `heroic25percentchance` `heroic25percentchance` FLOAT( 5, 2 ) NOT NULL DEFAULT '0.00';

ALTER TABLE loot_fishing CHANGE `normal10percentchance` `normal10percentchance` FLOAT( 5, 2 ) NOT NULL DEFAULT '0.00';
ALTER TABLE loot_fishing CHANGE `normal25percentchance` `normal25percentchance` FLOAT( 5, 2 ) NOT NULL DEFAULT '0.00';
ALTER TABLE loot_fishing CHANGE `heroic10percentchance` `heroic10percentchance` FLOAT( 5, 2 ) NOT NULL DEFAULT '0.00';
ALTER TABLE loot_fishing CHANGE `heroic25percentchance` `heroic25percentchance` FLOAT( 5, 2 ) NOT NULL DEFAULT '0.00';

ALTER TABLE loot_pickpocketing CHANGE `normal10percentchance` `normal10percentchance` FLOAT( 5, 2 ) NOT NULL DEFAULT '0.00';
ALTER TABLE loot_pickpocketing CHANGE `normal25percentchance` `normal25percentchance` FLOAT( 5, 2 ) NOT NULL DEFAULT '0.00';
ALTER TABLE loot_pickpocketing CHANGE `heroic10percentchance` `heroic10percentchance` FLOAT( 5, 2 ) NOT NULL DEFAULT '0.00';
ALTER TABLE loot_pickpocketing CHANGE `heroic25percentchance` `heroic25percentchance` FLOAT( 5, 2 ) NOT NULL DEFAULT '0.00';

ALTER TABLE loot_skinning CHANGE `normal10percentchance` `normal10percentchance` FLOAT( 5, 2 ) NOT NULL DEFAULT '0.00';
ALTER TABLE loot_skinning CHANGE `normal25percentchance` `normal25percentchance` FLOAT( 5, 2 ) NOT NULL DEFAULT '0.00';
ALTER TABLE loot_skinning CHANGE `heroic10percentchance` `heroic10percentchance` FLOAT( 5, 2 ) NOT NULL DEFAULT '0.00';
ALTER TABLE loot_skinning CHANGE `heroic25percentchance` `heroic25percentchance` FLOAT( 5, 2 ) NOT NULL DEFAULT '0.00';

ALTER TABLE `creature_spawns` CHANGE `position_x` `position_x` FLOAT( 8, 3 ) NOT NULL;
ALTER TABLE `creature_spawns` CHANGE `position_y` `position_y` FLOAT( 8, 3 ) NOT NULL;
ALTER TABLE `creature_spawns` CHANGE `position_z` `position_z` FLOAT( 8, 3 ) NOT NULL;

ALTER TABLE `teleport_coords` CHANGE `id` `id` INT( 10 ) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Teleport Spell ID';
ALTER TABLE `teleport_coords` CHANGE `position_x` `position_x` FLOAT NOT NULL DEFAULT '0' COMMENT 'Destination x coord';
ALTER TABLE `teleport_coords` CHANGE `position_y` `position_y` FLOAT NOT NULL DEFAULT '0' COMMENT 'Destination y coord';
ALTER TABLE `teleport_coords` CHANGE `position_z` `position_z` FLOAT NOT NULL DEFAULT '0' COMMENT 'Destination z coord';

UPDATE loot_items SET normal10percentchance=25 WHERE entryid=50160;

-- 26.9.
UPDATE `quests` SET `Title`='Candy Bucket',`CompletionText`='Candy buckets like this are located in inns throughout the realms. Go ahead... take some!' WHERE `entry` IN ('12286', '12331', '12332', '12333', '12334', '12335', '12336', '12337', '12338', '12339', '12340', '12341', '12342', '12343', '12344', '12345', '12346', '12347', '12348', '12349', '12350', '12351', '12352', '12353', '12354', '12355', '12356', '12357', '12358', '12359', '12360', '12361', '12362', '12363', '12364', '12365', '12366', '12367', '12368', '12369', '12370', '12371', '12373', '12374', '12375', '12376', '12377', '12378', '12379', '12380', '12381', '12382', '12383', '12384', '12385', '12386', '12387', '12388', '12389', '12390', '12391', '12392', '12393', '12394', '12395', '12396', '12397', '12398', '12399', '12400', '12401', '12402', '12403', '12404', '12405', '12406', '12407', '12408', '12409', '12410', '12940', '12941', '12944', '12945', '12946', '12947', '12950', '13433', '13434', '13435', '13436', '13437', '13438', '13439', '13448', '13452', '13456', '13459', '13460', '13461', '13462', '13463', '13464', '13465', '13466', '13467', '13468', '13469', '13470', '13471', '13472', '13473', '13474', '13501', '13548');

-- 27.9
-- correct z coord
UPDATE creature_spawns SET position_z=27.24 WHERE entry=3296 AND position_x LIKE 1387.28 AND position_y LIKE -4379.89 ;
UPDATE creature_spawns SET position_z=27.24 WHERE entry=3296 AND position_x LIKE 1384.62 AND position_y LIKE -4358.56 ;
UPDATE creature_spawns SET position_z=18.94 WHERE entry=3296 AND position_x LIKE 1518.15 AND position_y LIKE -4425.35 ;
UPDATE creature_spawns SET position_z=16.88 WHERE entry=3296 AND position_x LIKE 1523.92 AND position_y LIKE -4429.44 ;
UPDATE creature_spawns SET position_z=5.54 WHERE entry=5597 AND position_x LIKE 1568.65 AND position_y LIKE -4386.24 ;
UPDATE creature_spawns SET position_z=7.17 WHERE entry=14720 AND position_x LIKE 1566.89 AND position_y LIKE -4395.2 ;
UPDATE creature_spawns SET position_z=6.70 WHERE entry=3296 AND position_x LIKE 1576.2 AND position_y LIKE -4394.43 ;
UPDATE creature_spawns SET position_z=1.22 WHERE entry=3296 AND position_x LIKE 1557.74 AND position_y LIKE -4364.25 ;
UPDATE creature_spawns SET position_z=1.34 WHERE entry=3296 AND position_x LIKE 1561.79 AND position_y LIKE -4360.5 ;
UPDATE creature_spawns SET position_z=10.13 WHERE entry=3296 AND position_x LIKE 1596.65 AND position_y LIKE -4388.67 ;
UPDATE creature_spawns SET position_z=9.85 WHERE entry=5603 AND position_x LIKE 1594.38 AND position_y LIKE -4378.3 ;
UPDATE creature_spawns SET position_z=9.80 WHERE entry=13842 AND position_x LIKE 1607.92 AND position_y LIKE -4376.44 ;
UPDATE creature_spawns SET position_z=12.55 WHERE entry=3296 AND position_x LIKE 1615.63 AND position_y LIKE -4376.11 ;
UPDATE creature_spawns SET position_z=11.95 WHERE entry=3320 AND position_x LIKE 1622.9 AND position_y LIKE -4369.06 ;
UPDATE creature_spawns SET position_z=11.96 WHERE entry=3309 AND position_x LIKE 1627.32 AND position_y LIKE -4376.07 ;
UPDATE creature_spawns SET position_z=11.94 WHERE entry=3318 AND position_x LIKE 1632.39 AND position_y LIKE -4381.97 ;
UPDATE creature_spawns SET position_z=4.52 WHERE entry=3314 AND position_x LIKE 1634.23 AND position_y LIKE -4347.62 ;
UPDATE creature_spawns SET position_z=3.33 WHERE entry=3312 AND position_x LIKE 1618.96 AND position_y LIKE -4307.28 ;
UPDATE creature_spawns SET position_z=61.47 WHERE entry=3296 AND position_x LIKE 1668.56 AND position_y LIKE -4323.66 ;
UPDATE creature_spawns SET position_z=61.80 WHERE entry=3310 AND position_x LIKE 1676.25 AND position_y LIKE -4313.45 ;
UPDATE creature_spawns SET position_z=61.89 WHERE entry=19177 AND position_x LIKE 1689.75 AND position_y LIKE -4334.92 ;
UPDATE creature_spawns SET position_z=62.07 WHERE entry=19177 AND position_x LIKE 1693.4 AND position_y LIKE -4334.83 ;
UPDATE creature_spawns SET position_z=52.02 WHERE entry=3296 AND position_x LIKE 1673.2 AND position_y LIKE -4250 ;
UPDATE creature_spawns SET position_z=49.16 WHERE entry=12796 AND position_x LIKE 1633.56 AND position_y LIKE -4263.7 ;
UPDATE creature_spawns SET position_z=47.67 WHERE entry=3296 AND position_x LIKE 1620.45 AND position_y LIKE -4252.84 ;
UPDATE creature_spawns SET position_z=56.38 WHERE entry=12794 AND position_x LIKE 1641.65 AND position_y LIKE -4197.52 ;
UPDATE creature_spawns SET position_z=56.38 WHERE entry=12795 AND position_x LIKE 1644.59 AND position_y LIKE -4195.53 ;
UPDATE creature_spawns SET position_z=56.38 WHERE entry=12798 AND position_x LIKE 1656.62 AND position_y LIKE -4224.73 ;
UPDATE creature_spawns SET position_z=56.38 WHERE entry=12797 AND position_x LIKE 1643.48 AND position_y LIKE -4217.4 ;
UPDATE creature_spawns SET position_z=55.44 WHERE entry=12790 AND position_x LIKE 1651.96 AND position_y LIKE -4213.8 ;
UPDATE creature_spawns SET position_z=55.44 WHERE entry=19850 AND position_x LIKE 1651.85 AND position_y LIKE -4209.56 ;
UPDATE creature_spawns SET position_z=55.44 WHERE entry=12789 AND position_x LIKE 1655.53 AND position_y LIKE -4208.76 ;
UPDATE creature_spawns SET position_z=43.19 WHERE entry=7311 AND position_x LIKE 1466.88 AND position_y LIKE -4229.92 ;
UPDATE creature_spawns SET position_z=43.19 WHERE entry=5883 AND position_x LIKE 1472.48 AND position_y LIKE -4224.6 ;
UPDATE creature_spawns SET position_z=43.19 WHERE entry=5882 AND position_x LIKE 1473.55 AND position_y LIKE -4218.57 ;
UPDATE creature_spawns SET position_z=43.19 WHERE entry=5885 AND position_x LIKE 1468.18 AND position_y LIKE -4219.88 ;
UPDATE creature_spawns SET position_z=43.79 WHERE entry=14727 AND position_x LIKE 1451.64 AND position_y LIKE -4209.35 ;
UPDATE creature_spawns SET position_z=59.22 WHERE entry=5958 AND position_x LIKE 1474.97 AND position_y LIKE -4223.14 ;
UPDATE creature_spawns SET position_z=42.81 WHERE entry=3296 AND position_x LIKE 1566.22 AND position_y LIKE -4194.07 ;
UPDATE creature_spawns SET position_z=41.17 WHERE entry=3296 AND position_x LIKE 1566.45 AND position_y LIKE -4179.18 ;
UPDATE creature_spawns SET position_z=36.47 WHERE entry=3349 AND position_x LIKE 1580.05 AND position_y LIKE -4097.68 ;
UPDATE creature_spawns SET position_z=37.94 WHERE entry=3296 AND position_x LIKE 1682.14 AND position_y LIKE -4099.99 ;
UPDATE creature_spawns SET position_z=39.48 WHERE entry=3296 AND position_x LIKE 1696.31 AND position_y LIKE -4096.76 ;
UPDATE creature_spawns SET position_z=51.78 WHERE entry=3296 AND position_x LIKE 1711.45 AND position_y LIKE -3920.75 ;
UPDATE creature_spawns SET position_z=51.78 WHERE entry=3296 AND position_x LIKE 1696.56 AND position_y LIKE -3929.77 ;
UPDATE creature_spawns SET position_z=51.78 WHERE entry=3296 AND position_x LIKE 1684.94 AND position_y LIKE -3911.59 ;
UPDATE creature_spawns SET position_z=51.78 WHERE entry=3296 AND position_x LIKE 1698.85 AND position_y LIKE -3902.94 ;
UPDATE creature_spawns SET position_z=51.88 WHERE entry=5910 AND position_x LIKE 1717.78 AND position_y LIKE -4200.11 ;
UPDATE creature_spawns SET position_z=42.88 WHERE entry=3296 AND position_x LIKE 1751.45 AND position_y LIKE -4208.82 ;
UPDATE creature_spawns SET position_z=40.23 WHERE entry=3342 AND position_x LIKE 1784.44 AND position_y LIKE -4205.35 ;
UPDATE creature_spawns SET position_z=48.17 WHERE entry=3296 AND position_x LIKE 1908.35 AND position_y LIKE -4412.74 ;
UPDATE creature_spawns SET position_z=53.42 WHERE entry=3405 AND position_x LIKE 1904.86 AND position_y LIKE -4451.63 ;
UPDATE creature_spawns SET position_z=53.42 WHERE entry=3404 AND position_x LIKE 1904.76 AND position_y LIKE -4460.69 ;
UPDATE creature_spawns SET position_z=42.09 WHERE entry=14304 AND position_x LIKE 1924.73 AND position_y LIKE -4245.42 ;
UPDATE creature_spawns SET position_z=42.07 WHERE entry=14304 AND position_x LIKE 1931.52 AND position_y LIKE -4244.78 ;
UPDATE creature_spawns SET position_z=42.16 WHERE entry=14304 AND position_x LIKE 1930.46 AND position_y LIKE -4238.26 ;
UPDATE creature_spawns SET position_z=42.16 WHERE entry=14304 AND position_x LIKE 1924.79 AND position_y LIKE -4238.43 ;
UPDATE creature_spawns SET position_z=42.07 WHERE entry=14304 AND position_x LIKE 1931.52 AND position_y LIKE -4244.78 ;
UPDATE creature_spawns SET position_z=42.05 WHERE entry=14304 AND position_x LIKE 1924.73 AND position_y LIKE -4245.42 ;
UPDATE creature_spawns SET position_z=42.32 WHERE entry=4047 AND position_x LIKE 1914.65 AND position_y LIKE -4226.58 ;
UPDATE creature_spawns SET position_z=42.32 WHERE entry=5892 AND position_x LIKE 1920.95 AND position_y LIKE -4212.99 ;
UPDATE creature_spawns SET position_z=42.21 WHERE entry=14304 AND position_x LIKE 1922.2 AND position_y LIKE -4204.38 ;
UPDATE creature_spawns SET position_z=42.19 WHERE entry=14304 AND position_x LIKE 1928.19 AND position_y LIKE -4203.37 ;
UPDATE creature_spawns SET position_z=42.32 WHERE entry=3403 AND position_x LIKE 1932.88 AND position_y LIKE -4211.3 ;
UPDATE creature_spawns SET position_z=42.32 WHERE entry=3344 AND position_x LIKE 1933.69 AND position_y LIKE -4224.86 ;
UPDATE creature_spawns SET position_z=41.15 WHERE entry=14304 AND position_x LIKE 1919.36 AND position_y LIKE -4176.05 ;
UPDATE creature_spawns SET position_z=41.15 WHERE entry=14304 AND position_x LIKE 1927.48 AND position_y LIKE -4175.91 ;
UPDATE creature_spawns SET position_z=41.15 WHERE entry=16012 AND position_x LIKE 1915.67 AND position_y LIKE -4170.77 ;
UPDATE creature_spawns SET position_z=41.15 WHERE entry=14304 AND position_x LIKE 1910.21 AND position_y LIKE -4169.48 ;
UPDATE creature_spawns SET position_z=41.15 WHERE entry=3144 AND position_x LIKE 1905.75 AND position_y LIKE -4161.37 ;
UPDATE creature_spawns SET position_z=43.71 WHERE entry=14304 AND position_x LIKE 1901.27 AND position_y LIKE -4171.16 ;
UPDATE creature_spawns SET position_z=41.13 WHERE entry=14304 AND position_x LIKE 1898.32 AND position_y LIKE -4149.7 ;
UPDATE creature_spawns SET position_z=43.69 WHERE entry=14304 AND position_x LIKE 1890.67 AND position_y LIKE -4150.02 ;
UPDATE creature_spawns SET position_z=43.67 WHERE entry=14304 AND position_x LIKE 1898.44 AND position_y LIKE -4128.35 ;
UPDATE creature_spawns SET position_z=40.64 WHERE entry=14304 AND position_x LIKE 1914.56 AND position_y LIKE -4136.63 ;
UPDATE creature_spawns SET position_z=40.63 WHERE entry=14304 AND position_x LIKE 1926.54 AND position_y LIKE -4135.56 ;
UPDATE creature_spawns SET position_z=43.26 WHERE entry=14304 AND position_x LIKE 1912.25 AND position_y LIKE -4124.2 ;
UPDATE creature_spawns SET position_z=43.22 WHERE entry=17098 AND position_x LIKE 1914.83 AND position_y LIKE -4123.96 ;
UPDATE creature_spawns SET position_z=43.19 WHERE entry=14304 AND position_x LIKE 1927.04 AND position_y LIKE -4123.48 ;
UPDATE creature_spawns SET position_z=43.18 WHERE entry=29346 AND position_x LIKE 1923.94 AND position_y LIKE -4125.77 ;
UPDATE creature_spawns SET position_z=43.72 WHERE entry=14304 AND position_x LIKE 1941.71 AND position_y LIKE -4124.25 ;
UPDATE creature_spawns SET position_z=41.14 WHERE entry=23131 AND position_x LIKE 1938.95 AND position_y LIKE -4130.73 ;
UPDATE creature_spawns SET position_z=41.15 WHERE entry=23131 AND position_x LIKE 1942.32 AND position_y LIKE -4133.69 ;
UPDATE creature_spawns SET position_z=41.14 WHERE entry=23128 AND position_x LIKE 1939.69 AND position_y LIKE -4133.33 ;
UPDATE creature_spawns SET position_z=43.49 WHERE entry=14304 AND position_x LIKE 1951.96 AND position_y LIKE -4145.71 ;
UPDATE creature_spawns SET position_z=41.10 WHERE entry=14304 AND position_x LIKE 1944.36 AND position_y LIKE -4146.45 ;
UPDATE creature_spawns SET position_z=43.71 WHERE entry=14304 AND position_x LIKE 1944.79 AND position_y LIKE -4168.14 ;
UPDATE creature_spawns SET position_z=41.14 WHERE entry=10540 AND position_x LIKE 1934.06 AND position_y LIKE -4162.26 ;
UPDATE creature_spawns SET position_z=41.15 WHERE entry=14304 AND position_x LIKE 1933.29 AND position_y LIKE -4168.81 ;
UPDATE creature_spawns SET position_z=31.94 WHERE entry=3296 AND position_x LIKE 1902.14 AND position_y LIKE -4275.21 ;
UPDATE creature_spawns SET position_z=22.95 WHERE entry=3296 AND position_x LIKE 1920.62 AND position_y LIKE -4365.93 ;
UPDATE creature_spawns SET position_z=22.72 WHERE entry=3296 AND position_x LIKE 1921.7 AND position_y LIKE -4375.67 ;
UPDATE creature_spawns SET position_z=22.66 WHERE entry=3296 AND position_x LIKE 1952.53 AND position_y LIKE -4368.57 ;
UPDATE creature_spawns SET position_z=22.19 WHERE entry=3296 AND position_x LIKE 1950.89 AND position_y LIKE -4374.69 ;
UPDATE creature_spawns SET position_z=24.77 WHERE entry=3346 AND position_x LIKE 1918.26 AND position_y LIKE -4436.26 ;
UPDATE creature_spawns SET position_z=24.80 WHERE entry=3345 AND position_x LIKE 1912.18 AND position_y LIKE -4436.61 ;
UPDATE creature_spawns SET position_z=24.79 WHERE entry=11066 AND position_x LIKE 1913.25 AND position_y LIKE -4430.54 ;
UPDATE creature_spawns SET position_z=23.89 WHERE entry=3296 AND position_x LIKE 1928.32 AND position_y LIKE -4424.41 ;
UPDATE creature_spawns SET position_z=21.45 WHERE entry=3296 AND position_x LIKE 1889.53 AND position_y LIKE -4485.08 ;
UPDATE creature_spawns SET position_z=20.78 WHERE entry=3296 AND position_x LIKE 1882.15 AND position_y LIKE -4483.99 ;
UPDATE creature_spawns SET position_z=25.89 WHERE entry=3348 AND position_x LIKE 1954.75 AND position_y LIKE -4466.79 ;
UPDATE creature_spawns SET position_z=25.92 WHERE entry=11046 AND position_x LIKE 1966.15 AND position_y LIKE -4463.1 ;
UPDATE creature_spawns SET position_z=25.93 WHERE entry=3347 AND position_x LIKE 1964.88 AND position_y LIKE -4477.84 ;
UPDATE creature_spawns SET position_z=29.29 WHERE entry=6986 AND position_x LIKE 1931.78 AND position_y LIKE -4514.99 ;
UPDATE creature_spawns SET position_z=29.29 WHERE entry=6987 AND position_x LIKE 1928.33 AND position_y LIKE -4517.21 ;
UPDATE creature_spawns SET position_z=34.12 WHERE entry=3296 AND position_x LIKE 1913.71 AND position_y LIKE -4559.36 ;
UPDATE creature_spawns SET position_z=34.12 WHERE entry=3296 AND position_x LIKE 1906.25 AND position_y LIKE -4564.21 ;
UPDATE creature_spawns SET position_z=34.12 WHERE entry=3296 AND position_x LIKE 1910.24 AND position_y LIKE -4623.92 ;
UPDATE creature_spawns SET position_z=34.12 WHERE entry=3296 AND position_x LIKE 1902.63 AND position_y LIKE -4628.79 ;
UPDATE creature_spawns SET position_z=39.49 WHERE entry=3359 AND position_x LIKE 1878.64 AND position_y LIKE -4708.13 ;
UPDATE creature_spawns SET position_z=36.48 WHERE entry=3410 AND position_x LIKE 1914.16 AND position_y LIKE -4775.87 ;
UPDATE creature_spawns SET position_z=48.66 WHERE entry=4485 AND position_x LIKE 1953.59 AND position_y LIKE -4735.77 ;
UPDATE creature_spawns SET position_z=49.11 WHERE entry=3296 AND position_x LIKE 1963.01 AND position_y LIKE -4730.91 ;
UPDATE creature_spawns SET position_z=56.99 WHERE entry=27399 AND position_x LIKE 1964.46 AND position_y LIKE -4798.77 ;
UPDATE creature_spawns SET position_z=56.99 WHERE entry=3354 AND position_x LIKE 1970.95 AND position_y LIKE -4808.17 ;
UPDATE creature_spawns SET position_z=56.99 WHERE entry=19912 AND position_x LIKE 1987.4 AND position_y LIKE -4813.11 ;
UPDATE creature_spawns SET position_z=56.99 WHERE entry=3408 AND position_x LIKE 1997.93 AND position_y LIKE -4807.95 ;
UPDATE creature_spawns SET position_z=56.05 WHERE entry=15350 AND position_x LIKE 1989.93 AND position_y LIKE -4799.55 ;
UPDATE creature_spawns SET position_z=56.03 WHERE entry=3353 AND position_x LIKE 1980 AND position_y LIKE -4799.74 ;
UPDATE creature_spawns SET position_z=56.02 WHERE entry=34955 AND position_x LIKE 1976.09 AND position_y LIKE -4795.15 ;
UPDATE creature_spawns SET position_z=56.05 WHERE entry=35602 AND position_x LIKE 1980.62 AND position_y LIKE -4786.48 ;
UPDATE creature_spawns SET position_z=26.44 WHERE entry=3296 AND position_x LIKE 2004.18 AND position_y LIKE -4719.8 ;
UPDATE creature_spawns SET position_z=26.41 WHERE entry=8122 AND position_x LIKE 2014.38 AND position_y LIKE -4729.67 ;
UPDATE creature_spawns SET position_z=27.03 WHERE entry=3357 AND position_x LIKE 2029.91 AND position_y LIKE -4706.16 ;
UPDATE creature_spawns SET position_z=27.03 WHERE entry=3358 AND position_x LIKE 2025.08 AND position_y LIKE -4708.91 ;
UPDATE creature_spawns SET position_z=23.11 WHERE entry=7790 AND position_x LIKE 2064.33 AND position_y LIKE -4791.98 ;
UPDATE creature_spawns SET position_z=23.04 WHERE entry=11177 AND position_x LIKE 2048.8 AND position_y LIKE -4799.86 ;
UPDATE creature_spawns SET position_z=23.41 WHERE entry=11178 AND position_x LIKE 2051.84 AND position_y LIKE -4794.39 ;
UPDATE creature_spawns SET position_z=23.05 WHERE entry=1383 AND position_x LIKE 2055.83 AND position_y LIKE -4797.07 ;
UPDATE creature_spawns SET position_z=22.61 WHERE entry=11176 AND position_x LIKE 2055.53 AND position_y LIKE -4802.11 ;
UPDATE creature_spawns SET position_z=22.56 WHERE entry=7230 AND position_x LIKE 2054.63 AND position_y LIKE -4805.99 ;
UPDATE creature_spawns SET position_z=22.64 WHERE entry=10266 AND position_x LIKE 2052.21 AND position_y LIKE -4813.46 ;
UPDATE creature_spawns SET position_z=23.18 WHERE entry=7792 AND position_x LIKE 2055.71 AND position_y LIKE -4815.9 ;
UPDATE creature_spawns SET position_z=24.58 WHERE entry=3355 AND position_x LIKE 2058.97 AND position_y LIKE -4835.58 ;
UPDATE creature_spawns SET position_z=24.58 WHERE entry=5812 AND position_x LIKE 2053.4 AND position_y LIKE -4838.88 ;
UPDATE creature_spawns SET position_z=24.84 WHERE entry=3356 AND position_x LIKE 2049.79 AND position_y LIKE -4839.13 ;
UPDATE creature_spawns SET position_z=24.30 WHERE entry=3409 AND position_x LIKE 2099.23 AND position_y LIKE -4818.85 ;
UPDATE creature_spawns SET position_z=24.35 WHERE entry=2704 AND position_x LIKE 2090.27 AND position_y LIKE -4824.21 ;
UPDATE creature_spawns SET position_z=24.34 WHERE entry=11868 AND position_x LIKE 2091.02 AND position_y LIKE -4826.49 ;
UPDATE creature_spawns SET position_z=24.25 WHERE entry=3361 AND position_x LIKE 2097.42 AND position_y LIKE -4824.92 ;
UPDATE creature_spawns SET position_z=24.23 WHERE entry=7231 AND position_x LIKE 2105.33 AND position_y LIKE -4829.99 ;
UPDATE creature_spawns SET position_z=24.26 WHERE entry=4043 AND position_x LIKE 2097.44 AND position_y LIKE -4834.81 ;
UPDATE creature_spawns SET position_z=26.69 WHERE entry=14498 AND position_x LIKE 2052.27 AND position_y LIKE -4670.94 ;
UPDATE creature_spawns SET position_z=27.04 WHERE entry=3333 AND position_x LIKE 1995.41 AND position_y LIKE -4662.32 ;
UPDATE creature_spawns SET position_z=26.64 WHERE entry=3332 AND position_x LIKE 2000.62 AND position_y LIKE -4659.66 ;
UPDATE creature_spawns SET position_z=27.67 WHERE entry=16076 AND position_x LIKE 1989.31 AND position_y LIKE -4655.91 ;
UPDATE creature_spawns SET position_z=27.58 WHERE entry=16069 AND position_x LIKE 1989.83 AND position_y LIKE -4656.83 ;
UPDATE creature_spawns SET position_z=27.28 WHERE entry=7951 AND position_x LIKE 1991.32 AND position_y LIKE -4652.35 ;
UPDATE creature_spawns SET position_z=27.21 WHERE entry=15186 AND position_x LIKE 1992.19 AND position_y LIKE -4651.05 ;
UPDATE creature_spawns SET position_z=25.46 WHERE entry=3296 AND position_x LIKE 1479.39 AND position_y LIKE -4406.25 ;
UPDATE creature_spawns SET position_z=7.96 WHERE entry=3317 AND position_x LIKE 1583.8 AND position_y LIKE -4473.31 ;
UPDATE creature_spawns SET position_z=7.89 WHERE entry=3321 AND position_x LIKE 1589.02 AND position_y LIKE -4469.48 ;
UPDATE creature_spawns SET position_z=7.90 WHERE entry=3319 AND position_x LIKE 1593.54 AND position_y LIKE -4465.65 ;
UPDATE creature_spawns SET position_z=7.85 WHERE entry=3296 AND position_x LIKE 1603.48 AND position_y LIKE -4449.95 ;
UPDATE creature_spawns SET position_z=15.66 WHERE entry=6929 AND position_x LIKE 1633.99 AND position_y LIKE -4439.37 ;
UPDATE creature_spawns SET position_z=15.63 WHERE entry=5610 AND position_x LIKE 1640.71 AND position_y LIKE -4442.19 ;
UPDATE creature_spawns SET position_z=15.63 WHERE entry=5611 AND position_x LIKE 1640.83 AND position_y LIKE -4446.99 ;
UPDATE creature_spawns SET position_z=16.01 WHERE entry=5614 AND position_x LIKE 1639.56 AND position_y LIKE -4443.74 ;
UPDATE creature_spawns SET position_z=15.63 WHERE entry=5613 AND position_x LIKE 1638.28 AND position_y LIKE -4445 ;
UPDATE creature_spawns SET position_z=15.63 WHERE entry=5606 AND position_x LIKE 1633.94 AND position_y LIKE -4445.62 ;
UPDATE creature_spawns SET position_z=15.63 WHERE entry=5606 AND position_x LIKE 1634.16 AND position_y LIKE -4447.18 ;
UPDATE creature_spawns SET position_z=20.29 WHERE entry=9856 AND position_x LIKE 1695.92 AND position_y LIKE -4455.55 ;
UPDATE creature_spawns SET position_z=20.30 WHERE entry=3296 AND position_x LIKE 1696.02 AND position_y LIKE -4463.71 ;
UPDATE creature_spawns SET position_z=45.65 WHERE entry=3400 AND position_x LIKE 1779.08 AND position_y LIKE -4488.08 ;
UPDATE creature_spawns SET position_z=45.65 WHERE entry=3368 AND position_x LIKE 1775.1 AND position_y LIKE -4482.91 ;
UPDATE creature_spawns SET position_z=45.65 WHERE entry=3399 AND position_x LIKE 1769.16 AND position_y LIKE -4485.63 ;
UPDATE creature_spawns SET position_z=27.75 WHERE entry=3369 AND position_x LIKE 1780.63 AND position_y LIKE -4505.51 ;
UPDATE creature_spawns SET position_z=24.99 WHERE entry=5811 AND position_x LIKE 1855.31 AND position_y LIKE -4568.12 ;
UPDATE creature_spawns SET position_z=28.66 WHERE entry=3296 AND position_x LIKE 1886.2 AND position_y LIKE -4546.68 ;
UPDATE creature_spawns SET position_z=29.39 WHERE entry=3413 AND position_x LIKE 2036.63 AND position_y LIKE -4739.49 ;
UPDATE creature_spawns SET position_z=29.39 WHERE entry=3412 AND position_x LIKE 2036.22 AND position_y LIKE -4746.5 ;
UPDATE creature_spawns SET position_z=29.39 WHERE entry=11017 AND position_x LIKE 2038.4 AND position_y LIKE -4748.98 ;
UPDATE creature_spawns SET position_z=29.39 WHERE entry=9317 AND position_x LIKE 2045.53 AND position_y LIKE -4753.81 ;
UPDATE creature_spawns SET position_z=29.39 WHERE entry=2857 AND position_x LIKE 2047.99 AND position_y LIKE -4746.01 ;
UPDATE creature_spawns SET position_z=51.27 WHERE entry=3296 AND position_x LIKE 2049.3 AND position_y LIKE -4629.26 ;
UPDATE creature_spawns SET position_z=27.62 WHERE entry=16069 AND position_x LIKE 1989.83 AND position_y LIKE -4656.83 ;
UPDATE creature_spawns SET position_z=28.62 WHERE entry=3296 AND position_x LIKE 1886.2 AND position_y LIKE -4546.68 ;
UPDATE creature_spawns SET position_z=23.01 WHERE entry=3363 AND position_x LIKE 1806.85 AND position_y LIKE -4573.32 ;
UPDATE creature_spawns SET position_z=23.01 WHERE entry=3364 AND position_x LIKE 1792.65 AND position_y LIKE -4565.39 ;
UPDATE creature_spawns SET position_z=23.01 WHERE entry=3315 AND position_x LIKE 1802.08 AND position_y LIKE -4561.55 ;
UPDATE creature_spawns SET position_z=27.75 WHERE entry=3369 AND position_x LIKE 1780.63 AND position_y LIKE -4505.51 ;
UPDATE creature_spawns SET position_z=40.62 WHERE entry=8404 AND position_x LIKE 1527.01 AND position_y LIKE -4154.91 ;
UPDATE creature_spawns SET position_z=53.39 WHERE entry=5640 AND position_x LIKE 1781.55 AND position_y LIKE -3997.07 ;
UPDATE creature_spawns SET position_z=43.71 WHERE entry=14304 AND position_x LIKE 1951.96 AND position_y LIKE -4145.71 ;
UPDATE creature_spawns SET position_z=23.40 WHERE entry=3350 AND position_x LIKE 1891.6 AND position_y LIKE -4326.75 ;
UPDATE creature_spawns SET position_z=23.40 WHERE entry=3351 AND position_x LIKE 1890.9 AND position_y LIKE -4322.09 ;
UPDATE creature_spawns SET position_z=22.80 WHERE entry=3296 AND position_x LIKE 1952.53 AND position_y LIKE -4368.57 ;
UPDATE creature_spawns SET position_z=11.86 WHERE entry=3296 AND position_x LIKE 1886.46 AND position_y LIKE -4415.86 ;
UPDATE creature_spawns SET position_z=-17.20 WHERE entry=3216 AND position_x LIKE 1800.66 AND position_y LIKE -4374.51 ;
UPDATE creature_spawns SET position_z=-15.78 WHERE entry=3329 AND position_x LIKE 1766.71 AND position_y LIKE -4367.36 ;
UPDATE creature_spawns SET position_z=-12.18 WHERE entry=3330 AND position_x LIKE 1823.88 AND position_y LIKE -4302.59 ;
UPDATE creature_spawns SET position_z=-12.19 WHERE entry=5816 AND position_x LIKE 1820.77 AND position_y LIKE -4300.23 ;
UPDATE creature_spawns SET position_z=-15.47 WHERE entry=3335 AND position_x LIKE 1846.54 AND position_y LIKE -4325.67 ;
UPDATE creature_spawns SET position_z=5.34 WHERE entry=3296 AND position_x LIKE 1845.49 AND position_y LIKE -4395.95 ;
UPDATE creature_spawns SET position_z=11.86 WHERE entry=3296 AND position_x LIKE 1886.46 AND position_y LIKE -4415.86 ;
UPDATE creature_spawns SET position_z=27.75 WHERE entry=3369 AND position_x LIKE 1780.63 AND position_y LIKE -4505.51 ;
UPDATE creature_spawns SET position_z=-14.64 WHERE entry=3325 AND position_x LIKE 1834.66 AND position_y LIKE -4362.52 ;
UPDATE creature_spawns SET position_z=-14.62 WHERE entry=5815 AND position_x LIKE 1836.86 AND position_y LIKE -4347.13 ;
UPDATE creature_spawns SET position_z=-7.73 WHERE entry=3296 AND position_x LIKE 1775.07 AND position_y LIKE -4319.91 ;
UPDATE creature_spawns SET position_z=-7.67 WHERE entry=3189 AND position_x LIKE 1772.72 AND position_y LIKE -4343.18 ;
UPDATE creature_spawns SET position_z=-7.84 WHERE entry=29143 AND position_x LIKE 1762.84 AND position_y LIKE -4345.06 ;
UPDATE creature_spawns SET position_z=6.14 WHERE entry=3331 AND position_x LIKE 1750.38 AND position_y LIKE -4320.91 ;
UPDATE creature_spawns SET position_z=7.67 WHERE entry=3328 AND position_x LIKE 1762.88 AND position_y LIKE -4296.38 ;
UPDATE creature_spawns SET position_z=7.98 WHERE entry=3401 AND position_x LIKE 1771.21 AND position_y LIKE -4284.42 ;
UPDATE creature_spawns SET position_z=8.09 WHERE entry=6446 AND position_x LIKE 1772.94 AND position_y LIKE -4279.93 ;
UPDATE creature_spawns SET position_z=7.73 WHERE entry=3402 AND position_x LIKE 1778.55 AND position_y LIKE -4279.88 ;
UPDATE creature_spawns SET position_z=7.48 WHERE entry=3327 AND position_x LIKE 1792.34 AND position_y LIKE -4279.38 ;
UPDATE creature_spawns SET position_z=7.31 WHERE entry=3334 AND position_x LIKE 1811.04 AND position_y LIKE -4270.9 ;
UPDATE creature_spawns SET position_z=8.26 WHERE entry=3296 AND position_x LIKE 1603.48 AND position_y LIKE -4449.95 ;
UPDATE creature_spawns SET position_z=25.46 WHERE entry=3296 AND position_x LIKE 1481.77 AND position_y LIKE -4427.79 ;
UPDATE creature_spawns SET position_z=24.99 WHERE entry=3316 AND position_x LIKE 1855.82 AND position_y LIKE -4562.49 ;
UPDATE creature_spawns SET position_z=24.99 WHERE entry=3365 AND position_x LIKE 1860.9 AND position_y LIKE -4561.51 ;
UPDATE creature_spawns SET position_z=24.99 WHERE entry=7088 AND position_x LIKE 1849.04 AND position_y LIKE -4569.23 ;
UPDATE creature_spawns SET position_z=24.99 WHERE entry=3366 AND position_x LIKE 1848.01 AND position_y LIKE -4564.89 ;
UPDATE creature_spawns SET position_z=39.49 WHERE entry=3359 AND position_x LIKE 1878.64 AND position_y LIKE -4708.13 ;
UPDATE creature_spawns SET position_z=46.66 WHERE entry=9988 AND position_x LIKE 2133.44 AND position_y LIKE -4667.45 ;
UPDATE creature_spawns SET position_z=49.89 WHERE entry=3362 AND position_x LIKE 2159.36 AND position_y LIKE -4653.74 ;
UPDATE creature_spawns SET position_z=54.47 WHERE entry=7294 AND position_x LIKE 2067.86 AND position_y LIKE -4598.88 ;
UPDATE creature_spawns SET position_z=58.82 WHERE entry=3406 AND position_x LIKE 2084.96 AND position_y LIKE -4623.77 ;
UPDATE creature_spawns SET position_z=58.93 WHERE entry=3352 AND position_x LIKE 2100.58 AND position_y LIKE -4606.96 ;
UPDATE creature_spawns SET position_z=58.88 WHERE entry=3407 AND position_x LIKE 2107.35 AND position_y LIKE -4633.78 ;
UPDATE creature_spawns SET position_z=44.28 WHERE entry=6018 AND position_x LIKE 1452.43 AND position_y LIKE -4179.82 ;
UPDATE creature_spawns SET position_z=61.56 WHERE entry=6014 AND position_x LIKE 1453.24 AND position_y LIKE -4185.65 ;
UPDATE creature_spawns SET position_z=61.56 WHERE entry=5994 AND position_x LIKE 1461.02 AND position_y LIKE -4181.68 ;
UPDATE creature_spawns SET position_z=44.02 WHERE entry=3373 AND position_x LIKE 1482.72 AND position_y LIKE -4159.95 ;

-- 30.9.
-- delete not used creature
DELETE FROM creature_proto WHERE entry=2;
DELETE FROM creature_names WHERE entry=2;

-- changes by aaron
REPLACE INTO `npc_gossip_textid` (`creatureid`, `textid`) VALUES ('33740', '14384');
REPLACE INTO `npc_gossip_textid` (`creatureid`, `textid`) VALUES ('33746', '14384');
REPLACE INTO `npc_gossip_textid` (`creatureid`, `textid`) VALUES ('33748', '14384');
REPLACE INTO `npc_gossip_textid` (`creatureid`, `textid`) VALUES ('33744', '14384');
REPLACE INTO `npc_gossip_textid` (`creatureid`, `textid`) VALUES ('33745', '14384');
REPLACE INTO `npc_gossip_textid` (`creatureid`, `textid`) VALUES ('33749', '14384');
REPLACE INTO `npc_gossip_textid` (`creatureid`, `textid`) VALUES ('33739', '14384');
REPLACE INTO `npc_gossip_textid` (`creatureid`, `textid`) VALUES ('33738', '14384');
REPLACE INTO `npc_gossip_textid` (`creatureid`, `textid`) VALUES ('33747', '14384');
REPLACE INTO `npc_gossip_textid` (`creatureid`, `textid`) VALUES ('33743', '14384');
REPLACE INTO `npc_gossip_textid` (`creatureid`, `textid`) VALUES ('35499', '14779');
REPLACE INTO `npc_gossip_textid` (`creatureid`, `textid`) VALUES ('35117', '14692');
REPLACE INTO `npc_gossip_textid` (`creatureid`, `textid`) VALUES ('29095', '13441');
REPLACE INTO `npc_gossip_textid` (`creatureid`, `textid`) VALUES ('36669', '15076');

UPDATE `creature_spawns` SET `position_x`='5939.69', `position_y`='505.24', `orientation`='2.522836' WHERE (`id`='134170');
UPDATE `creature_spawns` SET `position_x`='5941.89', `position_y`='507.93', `orientation`='2.479095' WHERE (`id`='128045');
UPDATE `creature_spawns` SET `position_x`='5939.66', `position_y`='513.24', `orientation`='3.076477' WHERE (`id`='133202');
UPDATE `creature_spawns` SET `position_x`='5936.77', `position_y`='504.13', `orientation`='2.179906' WHERE (`id`='128044');

-- auctioneer
UPDATE `creature_proto` SET `npcflags`=2097152 WHERE (`entry`=35607);
UPDATE `creature_proto` SET `npcflags`=2097152 WHERE (`entry`=35594);

UPDATE `creature_proto` SET `auras`='' WHERE (`entry`='35594');
UPDATE `creature_proto` SET `invisibility_type`='0' WHERE (`entry`='35594');
UPDATE `creature_spawns` SET `position_x`='5765.28', `position_y`='743.87', `orientation`='4,11898' WHERE (`id`='128042');
UPDATE `creature_spawns` SET `position_x`='5762.69', `position_y`='745.96' WHERE (`id`='128043');

UPDATE `gameobject_names` SET `sound2`='0' WHERE (`entry`='188141');
UPDATE `creature_spawns` SET `flags`='0' WHERE (`id`='105584');
UPDATE `creature_spawns` SET `flags`='0' WHERE (`id`='105585');

INSERT INTO creature_spawns (`entry`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `movetype`, `displayid`, `faction`, `flags`, `bytes0`, `bytes1`, `bytes2`, `emote_state`, `npc_respawn_link`, `channel_spell`, `channel_target_sqlid`, `channel_target_sqlid_creature`, `standstate`, `death_state`, `mountdisplayid`, `slot1item`, `slot2item`, `slot3item`, `CanFly`, `phase`) VALUES ('35607', '571', '5937.39', '508.544', '650.18', '2.18819', '0', '28282', '714', '768', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO creature_spawns (`entry`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `movetype`, `displayid`, `faction`, `flags`, `bytes0`, `bytes1`, `bytes2`, `emote_state`, `npc_respawn_link`, `channel_spell`, `channel_target_sqlid`, `channel_target_sqlid_creature`, `standstate`, `death_state`, `mountdisplayid`, `slot1item`, `slot2item`, `slot3item`, `CanFly`, `phase`) VALUES ('35594', '571', '5763.85', '744.832', '653.665', '4.10449', '0', '28282', '534', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');

-- 20.10. from whydb by Loken
-- Grand Anchorite Almonen waypoints
set @spawnid = 80402;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO `creature_waypoints` (`spawnid`, `waypointid`, `position_x`, `position_y`, `position_z`, `waittime`, `flags`, `forwardemoteoneshot`, `forwardemoteid`, `backwardemoteoneshot`, `backwardemoteid`, `forwardskinid`, `backwardskinid`) VALUES
(@spawnid, 1, -1854.72, 5423.08, -10.4595, 23000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, -1854.6, 5412, -12.4282, 800, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 3, -1851.7, 5413.06, -12.4282, 10000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 4, -1848.78, 5412.81, -12.4282, 1000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 5, -1851.57, 5412.08, -12.4282, 7000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 6, -1856.31, 5410.27, -12.4282, 1900, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 7, -1859, 5406.96, -12.4281, 1900, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 8, -1855.09, 5410.68, -12.4282, 5000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 9, -1853.62, 5409.83, -12.4282, 1000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 10, -1852.5, 5412.29, -12.4282, 100, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 11, -1849.05, 5415.08, -12.4282, 1000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 12, -1851.64, 5414.01, -12.4282, 4000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 13, -1854.91, 5412.68, -12.4282, 1200, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 14, -1854.41, 5411.23, -12.4282, 800, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 15, -1853.14, 5424.86, -10.4779, 10000, 0, 0, 0, 0, 0, 0, 0);

-- 4.10
-- correct flags
UPDATE quests SET flags=128 WHERE entry=12790;

-- telporters dalaran (may a hack)
UPDATE gameobject_names SET type=22, spellfocus=42953 WHERE entry=191229; -- was 10
UPDATE gameobject_names SET type=22, spellfocus=54620 WHERE entry=191230; -- was 10
UPDATE teleport_coords SET position_x=5810.3, position_y=586.9, position_z=652.5, orientation=4 WHERE id=54620;

-- 10.10
-- Defias faction
UPDATE creature_proto SET faction=17 WHERE entry=38;
UPDATE creature_spawns SET faction=17 WHERE entry=38;
UPDATE creature_proto SET faction=17 WHERE entry=103;
UPDATE creature_spawns SET faction=17 WHERE entry=103;

-- double chests
DELETE FROM gameobject_spawns WHERE id=15727;
DELETE from gameobject_spawns WHERE Entry=153451 AND orientation3>0 AND orientation3<1;

-- 13.10
-- Kobold faction
UPDATE creature_proto SET faction=26, respawntime=240000 WHERE entry=6;
UPDATE creature_spawns SET faction=26 WHERE entry=6;
UPDATE creature_proto SET faction=26, respawntime=240000 WHERE entry=257;
UPDATE creature_spawns SET faction=26 WHERE entry=257;
UPDATE creature_proto SET faction=26, respawntime=240000 WHERE entry=80;
UPDATE creature_spawns SET faction=26 WHERE entry=80;


set @spawnid = 14005;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, -432.91, 1530.41, 18.65, 4000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, -440.77, 1529.35, 18.73, 6000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 3, -438.43, 1531.79, 18.76, 5000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 4, -421.91, 1535.00, 17.89, 4000, 0, 0, 0, 0, 0, 0, 0);

set @spawnid = 14008;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, -438.76, 1518.59, 19.55, 6000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, -434.59, 1522.71, 19.55, 5000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 3, -432.20, 1516.76, 19.55, 3000, 0, 0, 0, 0, 0, 0, 0);

set @spawnid = 14009;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;

set @spawnid = 14011;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, -366.09, 1547.59, 24.02, 3000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, -349.98, 1551.76, 24.25, 7000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 3, -353.22, 1539.20, 24.25, 6000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 4, -365.18, 1537.19, 24.20, 7000, 0, 0, 0, 0, 0, 0, 0);

set @spawnid = 14024;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, -443.26, 1539.50, 19.64, 7000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, -436.88, 1539.55, 19.64, 4000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 3, -434.41, 1539.79, 18.56, 7000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 4, -417.88, 1539.49, 17.38, 6000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 5, -434.06, 1539.13, 18.57, 7000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 6, -436.47, 1539.02, 19.62, 8000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 7, -442.21, 1539.20, 19.64, 8000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 8, -443.56, 1543.78, 19.64, 9000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 9, -443.94, 1536.76, 19.64, 8000, 0, 0, 0, 0, 0, 0, 0);


-- Set LoE db version
UPDATE db_version SET revision=4 WHERE db_name='LoE World';