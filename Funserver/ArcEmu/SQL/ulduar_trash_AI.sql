-- Runeforged Sentry
UPDATE `creature_template` SET `spell1` = 64852, `spell2` = 64870, `spell3` = 64847, `AIName` = 'EventAI' WHERE `entry` = 34234;
UPDATE `creature_template` SET `spell1` = 64852, `spell2` = 64870, `spell3` = 64847 WHERE `entry` = 34235;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34234);
INSERT INTO `creature_ai_scripts` VALUES 
(3423401, 34234, 0, 0, 100, 1, 2000, 2000, 10000, 10000, 11, 64852, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Runeforged Sentry - Cast Flaming Rune'),
(3423402, 34234, 0, 0, 100, 1, 3000, 5000, 5000, 7000, 11, 64870, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Runeforged Sentry - Cast Lava Burst'),
(3423403, 34234, 0, 0, 100, 1, 2500, 3000, 12000, 15000, 11, 64847, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Runeforged Sentry - Cast Runed Flame Jets');

-- Steelforged Defender
UPDATE `creature_template` SET `spell1` = 62845, `spell2` = 57780, `spell3` = 50370, `AIName` = 'EventAI' WHERE `entry` = 33236;
UPDATE `creature_template` SET `spell1` = 62845, `spell2` = 57780, `spell3` = 50370 WHERE `entry` = 34113;
UPDATE `creature` SET `spawntimesecs` = 604800 WHERE `id` IN (33236, 33838);
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33236);
INSERT INTO `creature_ai_scripts` VALUES 
(3323601, 33236, 0, 0, 100, 1, 4000, 6000, 15000, 20000, 11, 62845, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Steelforged Defender - Cast Hamstring'),
(3323602, 33236, 0, 0, 100, 1, 0, 4000, 6000, 8000, 11, 57780, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Steelforged Defender - Cast Lightning Bolt'),
(3323603, 33236, 0, 0, 100, 1, 5000, 6000, 4000, 6000, 11, 50370, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Steelforged Defender - Cast Sunder Armor');

-- Mechagnome Battletank
UPDATE `creature_template` SET `spell1` = 64693, `spell2` = 64953, `AIName` = 'EventAI' WHERE `entry` = 34164;
UPDATE `creature_template` SET `spell1` = 64693, `spell2` = 64953 WHERE `entry` = 34165;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34164);
INSERT INTO `creature_ai_scripts` VALUES 
(3416401, 34164, 0, 0, 100, 1, 3000, 4000, 6000, 8000, 11, 64693, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mechagnome Battletank - Cast Flame Cannon'),
(3416402, 34164, 0, 0, 100, 1, 10000, 10000, 15000, 20000, 11, 64953, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mechagnome Battletank - Cast Jump Attack');

-- Ulduar Colossus
UPDATE `creature_template` SET `spell1` = 62625, `AIName` = 'EventAI' WHERE `entry` = 33237;
UPDATE `creature_template` SET `spell1` = 62625 WHERE `entry` = 34105;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33237);
INSERT INTO `creature_ai_scripts` VALUES 
(3323701, 33237, 0, 0, 100, 1, 8000, 10000, 20000, 25000, 11, 62625, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ulduar Colossus - Cast Ground Slam');

-- invisible triggers
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` IN (33377, 33742, 34286, 33500, 33406, 33575);

-- Molten Colossus
UPDATE `creature_template` SET `spell1` = 64697, `spell2` = 64698, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34069;
UPDATE `creature_template` SET `spell1` = 64697, `spell2` = 64698, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 34185;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34069);
INSERT INTO `creature_ai_scripts` VALUES 
(3406901, 34069, 0, 0, 100, 1, 6000, 10000, 10000, 12000, 11, 64697, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Molten Colossus - Cast Earthquake'),
(3406902, 34069, 0, 0, 100, 1, 2000, 4000, 6000, 9000, 11, 64698, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Molten Colossus - Cast Pyroblast');

-- Magma Rager
UPDATE `creature_template` SET `spell1` = 64773, `spell2` = 64746, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34086;
UPDATE `creature_template` SET `spell1` = 64773, `spell2` = 64746, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 34201;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34086);
INSERT INTO `creature_ai_scripts` VALUES 
(3408601, 34086, 0, 0, 100, 1, 2000, 40000, 6000, 8000, 11, 64773, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magma Rager - Cast Fire Blast'),
(3408602, 34086, 0, 0, 100, 1, 8000, 16000, 15000, 25000, 11, 64746, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magma Rager - Cast Superheated winds');
UPDATE `creature_template` SET `unit_flags` = 33718790, modelid1 = 11686, modelid2 = 0, `spell1` = 64724, `AIName` = 'EventAI' WHERE `entry` = 34194;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34194);
INSERT INTO `creature_ai_scripts` VALUES 
(3419401, 34194, 0, 0, 100, 1, 0, 0, 10000, 10000, 11, 64724, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Superheated Winds');

-- Forge Construct
UPDATE `creature_template` SET `spell1` = 64719, `spell2` = 64720, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34085;
UPDATE `creature_template` SET `spell1` = 64719, `spell2` = 64721, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 34186;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34085);
INSERT INTO `creature_ai_scripts` VALUES 
(3408501, 34085, 0, 0, 100, 1, 8000, 12000, 10000, 15000, 11, 64719, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forge Construct - Cast Charge'),
(3408502, 34085, 0, 0, 100, 3, 2000, 6000, 6000, 9000, 11, 64720, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forge Construct - Cast Flame Emission 10'),
(3408503, 34085, 0, 0, 100, 5, 2000, 6000, 6000, 9000, 11, 64721, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forge Construct - Cast Flame Emission 25');

-- XB-488 Disposalbot
UPDATE `creature_template` SET `spell1` = 65080, `spell2` = 65084, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34273;
UPDATE `creature_template` SET `spell1` = 65104, `spell2` = 65084, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 34274;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34273);
INSERT INTO `creature_ai_scripts` VALUES 
(3427301, 34273, 2, 0, 100, 1, 30, 20, 0, 0, 11, 65084, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'XB-488 Disposalbot - Cast Self Destruct'),
(3427302, 34273, 0, 0, 100, 3, 2000, 6000, 10000, 15000, 11, 65080, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'XB-488 Disposalbot - Cast Cut Scrap Metal 10'),
(3427303, 34273, 0, 0, 100, 5, 2000, 6000, 10000, 15000, 11, 65104, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'XB-488 Disposalbot - Cast Cut Scrap Metal 25');

-- Parts Recovery Technician
UPDATE `creature_template` SET `spell1` = 65071, `spell2` = 65070, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554432, `AIName` = 'EventAI' WHERE `entry` = 34267;
UPDATE `creature_template` SET `spell1` = 65071, `spell2` = 65070, `mingold` = 14200, `maxgold` = 15600, `mechanic_immune_mask` = 33554432 WHERE `entry` = 34268;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34267);
INSERT INTO `creature_ai_scripts` VALUES 
(3426701, 34267, 0, 0, 100, 1, 8000, 12000, 10000, 15000, 11, 65071, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts Recovery Technician - Cast Mechano Kick'),
(3426702, 34267, 0, 0, 100, 1, 6000, 8000, 25000, 30000, 11, 65070, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts Recovery Technician - Cast Defense Matrix');

-- XD-175 Compactobot
UPDATE `creature_template` SET `spell1` = 65073, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34271;
UPDATE `creature_template` SET `spell1` = 65106, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 34272;
UPDATE `creature_template` SET `mingold` = 7100, `maxgold` = 7600 WHERE `entry` = 34269;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34271);
INSERT INTO `creature_ai_scripts` VALUES 
(3427101, 34271, 0, 0, 100, 3, 8000, 12000, 15000, 20000, 11, 65073, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'XD-175 Compactobot - Cast Trash Compactor 10'),
(3427102, 34271, 0, 0, 100, 5, 8000, 12000, 15000, 20000, 11, 65106, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'XD-175 Compactobot - Cast Trash Compactor 25');

-- Lightning Charged Iron Dwarf
UPDATE `creature_template` SET `spell1` = 64889, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34199;
UPDATE `creature_template` SET `spell1` = 64975, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 34237;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34199);
INSERT INTO `creature_ai_scripts` VALUES 
(3419901, 34199, 0, 0, 100, 3, 0, 0, 10000, 15000, 11, 64889, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lightning Charged Iron Dwarf - Cast Lightning Charged 10'),
(3419902, 34199, 0, 0, 100, 5, 0, 0, 10000, 15000, 11, 64975, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lightning Charged Iron Dwarf - Cast Lightning Charged 25');

-- Hardened Iron Golem
UPDATE `creature_template` SET `spell1` = 64877, `spell2` = 64874, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 34190;
UPDATE `creature_template` SET `spell1` = 64877, `spell2` = 64967, `mingold` = 14200, `maxgold` = 15600, `mechanic_immune_mask` = 33554496 WHERE `entry` = 34229;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34190);
INSERT INTO `creature_ai_scripts` VALUES 
(3419001, 34190, 0, 0, 100, 1, 4000, 8000, 25000, 30000, 11, 64877, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hardened Iron Golem - Cast Harden Fists'),
(3419002, 34190, 0, 0, 100, 3, 5000, 7000, 20000, 30000, 11, 64874, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hardened Iron Golem - Cast Rune Punch 10'),
(3419003, 34190, 0, 0, 100, 5, 5000, 7000, 20000, 30000, 11, 64967, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hardened Iron Golem - Cast Rune Punch 25');

-- Iron Mender
UPDATE `creature_template` SET `spell1` = 64918, `spell2` = 64903, `spell3` = 64897, `mechanic_immune_mask` = 33554496, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34198;
UPDATE `creature_template` SET `spell1` = 64971, `spell2` = 64970, `spell3` = 64968, `mechanic_immune_mask` = 33554496, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 34236;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34198);
INSERT INTO `creature_ai_scripts` VALUES 
(3419801, 34198, 0, 0, 100, 3, 2000, 4000, 4000, 6000, 11, 64918, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Mender - Cast Electro Shock 10'),
(3419802, 34198, 0, 0, 100, 5, 2000, 4000, 4000, 6000, 11, 64971, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Mender - Cast Electro Shock 25'),
(3419803, 34198, 0, 0, 100, 3, 3000, 6000, 10000, 15000, 11, 64903, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Mender - Cast Fuse Lightning 10'),
(3419804, 34198, 0, 0, 100, 5, 3000, 6000, 10000, 15000, 11, 64970, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Mender - Cast Fuse Lightning 25'),
(3419805, 34198, 0, 0, 100, 3, 10000, 25000, 30000, 45000, 11, 64897, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Mender - Cast Fuse Metal 10'),
(3419806, 34198, 0, 0, 100, 5, 10000, 25000, 30000, 45000, 11, 64968, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Mender - Cast Fuse Metal 25');

-- Rune Etched Sentry
UPDATE `creature_template` SET `spell1` = 64852, `spell2` = 64870, `spell3` = 64847, `mechanic_immune_mask` = 33554496, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34196;
UPDATE `creature_template` SET `spell1` = 64852, `spell2` = 64870, `spell3` = 64847, `mechanic_immune_mask` = 33554496, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 34245;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34196);
INSERT INTO `creature_ai_scripts` VALUES 
(3419601, 34196, 0, 0, 100, 1, 2000, 2000, 10000, 10000, 11, 64852, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rune Etched Sentry - Cast Flaming Rune'),
(3419602, 34196, 0, 0, 100, 1, 3000, 5000, 5000, 7000, 11, 64870, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rune Etched Sentry - Cast Lava Burst'),
(3419603, 34196, 0, 0, 100, 1, 2500, 3000, 12000, 15000, 11, 64847, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rune Etched Sentry - Cast Runed Flame Jets');

-- Chamber Overseer
UPDATE `creature_template` SET `spell1` = 64820, `spell2` = 64825, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 34197;
UPDATE `creature_template` SET `spell1` = 64943, `spell2` = 64944, `mingold` = 14200, `maxgold` = 15600, `mechanic_immune_mask` = 33554496 WHERE `entry` = 34226;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34197);
INSERT INTO `creature_ai_scripts` VALUES 
(3419701, 34197, 0, 0, 100, 3, 4000, 8000, 6000, 9000, 11, 64820, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chamber Overseer - Cast Devastating Leap 10'),
(3419702, 34197, 0, 0, 100, 5, 4000, 8000, 6000, 9000, 11, 64943, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chamber Overseer - Cast Devastating Leap 25'),
(3419703, 34197, 0, 0, 100, 3, 10000, 12000, 8000, 12000, 11, 64825, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chamber Overseer - Cast Staggering Roar 10'),
(3419704, 34197, 0, 0, 100, 5, 10000, 12000, 8000, 12000, 11, 64944, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chamber Overseer - Cast Staggering Roar 25');

-- Storm Tempered Keeper
UPDATE `creature_template` SET `spell1` = 63541, `spell2` = 63630, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 33722;
UPDATE `creature_template` SET `spell1` = 63541, `spell2` = 63630, `mingold` = 14200, `maxgold` = 15600, `mechanic_immune_mask` = 33554496 WHERE `entry` = 33723;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33722);
INSERT INTO `creature_ai_scripts` VALUES 
(3372201, 33722, 0, 0, 100, 1, 120000, 120000, 120000, 150000, 11, 63630, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Vengeful Surge'),
(3372202, 33722, 0, 0, 100, 1, 3000, 6000, 10000, 15000, 11, 63541, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Forked Lightning');

-- Storm Tempered Keeper
UPDATE `creature_template` SET `spell1` = 63541, `spell2` = 63630, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 33699;
UPDATE `creature_template` SET `spell1` = 63541, `spell2` = 63630, `mingold` = 14200, `maxgold` = 15600, `mechanic_immune_mask` = 33554496 WHERE `entry` = 33700;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33699);
INSERT INTO `creature_ai_scripts` VALUES 
(3369901, 33699, 0, 0, 100, 1, 120000, 120000, 120000, 150000, 11, 63630, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Vengeful Surge'),
(3369902, 33699, 0, 0, 100, 1, 3000, 6000, 10000, 15000, 11, 63541, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Storm Tempered Keeper - Cast Forked Lightning');

-- Champion of Hodir
UPDATE `creature_template` SET `spell1` = 64639, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34133;
UPDATE `creature_template` SET `spell1` = 64652, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 34139;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34133);
INSERT INTO `creature_ai_scripts` VALUES 
(3413301, 34133, 0, 0, 100, 3, 3000, 6000, 12000, 16000, 11, 64639, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion of Hodir - Cast Stomp 10'),
(3413302, 34133, 0, 0, 100, 5, 3000, 6000, 12000, 16000, 11, 64652, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion of Hodir - Cast Stomp 25');

-- Winter Jormungar
UPDATE `creature_template` SET `spell1` = 64638, `AIName` = 'EventAI' WHERE `entry` = 34137;
UPDATE `creature_template` SET `spell1` = 64638 WHERE `entry` = 34140;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34137);
INSERT INTO `creature_ai_scripts` VALUES 
(3413701, 34137, 0, 0, 100, 1, 3000, 6000, 6000, 9000, 11, 64638, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Jormungar - Cast Acidic Bite');
UPDATE `creature` SET `spawndist` = 0 WHERE `id` = 34137;

-- Winter Revenant
UPDATE `creature_template` SET `spell1` = 64642, `spell2` = 64643, `spell3` = 64644, `mechanic_immune_mask` = 33554496, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 34134;
UPDATE `creature_template` SET `spell1` = 64653, `spell2` = 64643, `spell3` = 64644, `mechanic_immune_mask` = 33554496, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 34141;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34134);
INSERT INTO `creature_ai_scripts` VALUES 
(3413401, 34134, 0, 0, 100, 3, 8000, 12000, 15000, 20000, 11, 64642, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Revenant - Cast Blizzard 10'),
(3413402, 34134, 0, 0, 100, 5, 8000, 12000, 15000, 20000, 11, 64653, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Revenant - Cast Blizzard 25'),
(3413403, 34134, 0, 0, 100, 1, 3000, 5000, 10000, 12000, 11, 64643, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Revenant - Cast Whirling Strike'),
(3413404, 34134, 0, 0, 100, 1, 15000, 20000, 60000, 75000, 11, 64644, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Revenant - Cast Shield of the Winter Revenant');

-- Winter Rumbler
UPDATE `creature_template` SET `spell1` = 64645, `spell2` = 64647, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 34135;
UPDATE `creature_template` SET `spell1` = 64645, `spell2` = 64654, `mingold` = 14200, `maxgold` = 15600, `mechanic_immune_mask` = 33554496 WHERE `entry` = 34142;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34135);
INSERT INTO `creature_ai_scripts` VALUES 
(3413501, 34135, 0, 0, 100, 1, 6000, 12000, 10000, 16000, 11, 64645, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Rumbler - Cast Cone of Cold'),
(3413502, 34135, 0, 0, 100, 3, 3000, 6000, 8000, 12000, 11, 64647, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Rumbler - Cast Snow Blindness 10'),
(3413503, 34135, 0, 0, 100, 5, 3000, 6000, 8000, 12000, 11, 64654, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Winter Rumbler - Cast Snow Blindness 25');

-- Guardian Lasher
UPDATE `creature_template` SET `spell1` = 63007, `spell2` = 63047, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 33430;
UPDATE `creature_template` SET `spell1` = 63007, `spell2` = 63550, `mingold` = 14200, `maxgold` = 15600, `mechanic_immune_mask` = 33554496 WHERE `entry` = 33732;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33430);
INSERT INTO `creature_ai_scripts` VALUES 
(3343001, 33430, 4, 0, 100, 1, 0, 0, 0, 0, 11, 63007, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardian Lasher - Cast Guardian Pheromones'),
(3343002, 33430, 0, 0, 100, 3, 3000, 6000, 10000, 14000, 11, 63047, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardian Lasher - Cast Guardian''s Lash 10'),
(3343003, 33430, 0, 0, 100, 5, 3000, 6000, 10000, 14000, 11, 63550, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardian Lasher - Cast Guardian''s Lash 25');

-- Forest Swarmer
UPDATE `creature_template` SET `spell1` = 63059, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33431;
UPDATE `creature_template` SET `spell1` = 63059, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33731;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33431);
INSERT INTO `creature_ai_scripts` VALUES 
(3343101, 33431, 0, 0, 100, 1, 3000, 9000, 10000, 20000, 11, 63059, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forest Swarmer - Cast Pollinate');
DELETE FROM conditions WHERE SourceEntry = 63059;
INSERT INTO `conditions` VALUES
('13','0','63059','0','18','1','33430','0','0','',NULL);

-- Guardian of Life
UPDATE `creature_template` SET `spell1` = 63226, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33528;
UPDATE `creature_template` SET `spell1` = 63551, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33733;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33528);
INSERT INTO `creature_ai_scripts` VALUES 
(3352801, 33528, 0, 0, 100, 3, 3000, 9000, 15000, 20000, 11, 63226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardian of Life - Cast Poison Breath 10'),
(3352802, 33528, 0, 0, 100, 5, 3000, 9000, 15000, 20000, 11, 63551, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardian of Life - Cast Poison Breath 25');

-- Nature's Blade
UPDATE `creature_template` SET `spell1` = 63247, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33527;
UPDATE `creature_template` SET `spell1` = 63568, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33741;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33527);
INSERT INTO `creature_ai_scripts` VALUES 
(3352701, 33527, 0, 0, 100, 3, 3000, 9000, 18000, 24000, 11, 63247, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nature Blade - Cast Living Tsunami 10'),
(3352702, 33527, 0, 0, 100, 5, 3000, 9000, 18000, 24000, 11, 63568, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nature Blade - Cast Living Tsunami 25');

-- Ironroot Lasher
UPDATE `creature_template` SET `spell1` = 63240, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33526;
UPDATE `creature_template` SET `spell1` = 63553, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33734;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33526);
INSERT INTO `creature_ai_scripts` VALUES 
(3352601, 33526, 0, 0, 100, 3, 3000, 8000, 12000, 16000, 11, 63240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironroot Lasher - Cast Ironroot Thorns 10'),
(3352602, 33526, 0, 0, 100, 5, 3000, 8000, 12000, 16000, 11, 63553, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironroot Lasher - Cast Ironroot Thorns 25');

-- Mangrove Ent
UPDATE `creature_template` SET `spell1` = 63272, `spell2` = 63242, `spell3` = 63241, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33525;
UPDATE `creature_template` SET `spell1` = 63272, `spell2` = 63556, `spell3` = 63554, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33735;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33525);
INSERT INTO `creature_ai_scripts` VALUES 
(3352501, 33525, 0, 0, 100, 1, 8000, 12000, 25000, 30000, 11, 63272, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mangrove Ent - Cast Hurricane'),
(3352502, 33525, 0, 0, 100, 3, 12000, 16000, 12000, 16000, 11, 63242, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mangrove Ent - Cast Nourish 10'),
(3352503, 33525, 0, 0, 100, 5, 12000, 16000, 12000, 16000, 11, 63556, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mangrove Ent - Cast Nourish 25'),
(3352504, 33525, 0, 0, 100, 3, 25000, 30000, 25000, 30000, 11, 63241, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mangrove Ent - Cast Tranquility 10'),
(3352505, 33525, 0, 0, 100, 5, 25000, 30000, 25000, 30000, 11, 63554, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mangrove Ent - Cast Tranquility 25');

-- Misguided Nymph
UPDATE `creature_template` SET `spell1` = 63082, `spell2` = 63111, `spell3` = 63136, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33355;
UPDATE `creature_template` SET `spell1` = 63559, `spell2` = 63562, `spell3` = 63564, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33737;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33355);
INSERT INTO `creature_ai_scripts` VALUES 
(3335501, 33355, 0, 0, 100, 3, 8000, 12000, 25000, 30000, 11, 63082, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Misguided Nymph - Cast Bind Life 10'),
(3335502, 33355, 0, 0, 100, 5, 8000, 12000, 25000, 30000, 11, 63559, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Misguided Nymph - Cast Bind Life 25'),
(3335503, 33355, 0, 0, 100, 3, 4000, 6000, 12000, 16000, 11, 63111, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Misguided Nymph - Cast Frost Spear 10'),
(3335504, 33355, 0, 0, 100, 5, 4000, 6000, 12000, 16000, 11, 63562, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Misguided Nymph - Cast Frost Spear 25'),
(3335505, 33355, 0, 0, 100, 3, 15000, 20000, 15000, 20000, 11, 63136, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Misguided Nymph - Cast Winter''s Embrace 10'),
(3335506, 33355, 0, 0, 100, 5, 15000, 20000, 15000, 20000, 11, 63564, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Misguided Nymph - Cast Winter''s Embrace 25');

-- Corrupted Servitor
UPDATE `creature_template` SET `spell1` = 63169, `spell2` = 63149, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 33354;
UPDATE `creature_template` SET `spell1` = 63549, `spell2` = 63149, `mingold` = 14200, `maxgold` = 15600, `mechanic_immune_mask` = 33554496 WHERE `entry` = 33729;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33354);
INSERT INTO `creature_ai_scripts` VALUES 
(3335401, 33354, 0, 0, 100, 3, 2000, 4000, 20000, 25000, 11, 63169, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Corrupted Servitor - Cast Petrify Joints 10'),
(3335402, 33354, 0, 0, 100, 5, 2000, 4000, 20000, 25000, 11, 63549, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Corrupted Servitor - Cast Petrify Joints 25'),
(3335403, 33354, 0, 0, 100, 1, 6000, 8000, 12000, 16000, 11, 63149, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Corrupted Servitor - Cast Violent Earth');

-- Arachnopod Destroyer
UPDATE `creature_template` SET `spell1` = 64717, `spell2` = 64776, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 34183;
UPDATE `creature_template` SET `spell1` = 64717, `spell2` = 64776, `mingold` = 14200, `maxgold` = 15600, `mechanic_immune_mask` = 33554496 WHERE `entry` = 34214;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34183);
INSERT INTO `creature_ai_scripts` VALUES 
(3418301, 34183, 0, 0, 100, 1, 2000, 4000, 12000, 16000, 11, 64717, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arachnopod Destroyer - Cast Flame Spray'),
(3418302, 34183, 0, 0, 100, 1, 8000, 10000, 12000, 16000, 11, 64776, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arachnopod Destroyer - Cast Machine Gun');

-- Boomer XP-500
UPDATE `creature_template` SET `spell1` = 55714, `AIName` = 'EventAI' WHERE `entry` = 34192;
UPDATE `creature_template` SET `spell1` = 55714 WHERE `entry` = 34216;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34192);
INSERT INTO `creature_ai_scripts` VALUES 
(3419201, 34192, 9, 0, 100, 1, 0, 3, 0, 0, 11, 55714, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Boomer XP-500 - Explode');

-- Clockwork Sapper
UPDATE `creature_template` SET `spell1` = 64740, `mingold` = 7100, `maxgold` = 7600, `mechanic_immune_mask` = 33554496, `AIName` = 'EventAI' WHERE `entry` = 34193;
UPDATE `creature_template` SET `spell1` = 64740, `mingold` = 14200, `maxgold` = 15600, `mechanic_immune_mask` = 33554496 WHERE `entry` = 34220;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=34193);
INSERT INTO `creature_ai_scripts` VALUES 
(3419301, 34193, 0, 0, 100, 1, 2000, 6000, 12000, 16000, 11, 64740, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Clockwork Sapper - Cast Energy Sap');

-- Twilight Adherent
UPDATE `creature_template` SET `spell1` = 64663, `spell2` = 63760, `spell3` = 13704, `equipment_id` = 1848, `mechanic_immune_mask` = 33554513, `unit_class` = 2, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33818;
UPDATE `creature_template` SET `spell1` = 64663, `spell2` = 63760, `spell3` = 13704, `equipment_id` = 1848, `mechanic_immune_mask` = 33554513, `unit_class` = 2, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33827;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33818);
INSERT INTO `creature_ai_scripts` VALUES 
(3381801, 33818, 0, 0, 100, 1, 10000, 16000, 20000, 25000, 11, 64663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Adherent - Cast Arcane Burst'),
(3381802, 33818, 0, 0, 100, 1, 18000, 24000, 20000, 24000, 11, 63760, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Adherent - Cast Greater Heal'),
(3381803, 33818, 0, 0, 100, 1, 2000, 4000, 10000, 16000, 11, 13704, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Adherent - Cast Psychic Scream');

-- Twilight Guardian
UPDATE `creature_template` SET `spell1` = 52719, `spell2` = 62317, `spell3` = 63757, `mechanic_immune_mask` = 33554513, `equipment_id` = 1852, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33822;
UPDATE `creature_template` SET `spell1` = 52719, `spell2` = 62317, `spell3` = 63757, `mechanic_immune_mask` = 33554513, `equipment_id` = 1852, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33828;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33822);
INSERT INTO `creature_ai_scripts` VALUES 
(3382201, 33822, 0, 0, 100, 1, 6000, 10000, 8000, 10000, 11, 52719, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Guardian - Cast Concussion Blow'),
(3382202, 33822, 0, 0, 100, 1, 2000, 3000, 3000, 6000, 11, 62317, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Guardian - Cast Devastate'),
(3382203, 33822, 0, 0, 100, 1, 16000, 18000, 14000, 16000, 11, 63757, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Guardian - Cast Thunderclap');

-- Twilight Shadowblade
UPDATE `creature_template` SET `spell1` = 63753, `mechanic_immune_mask` = 33554513,  `equipment_id` = 1862, `baseattacktime` = 1000, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33824;
UPDATE `creature_template` SET `spell1` = 63753, `mechanic_immune_mask` = 33554513,  `equipment_id` = 1862, `baseattacktime` = 1000, `mingold` = 7100, `maxgold` = 7600 WHERE `entry` = 33831;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33824);
INSERT INTO `creature_ai_scripts` VALUES 
(3382401, 33824, 0, 0, 100, 5, 6000, 8000, 14000, 16000, 11, 63753, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Shadowblade - Cast Fan of Knives');

-- Twilight Slayer
UPDATE `creature_template` SET `spell1` = 63784, `spell2` = 35054, `mechanic_immune_mask` = 33554513, `equipment_id` = 1847, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33823;
UPDATE `creature_template` SET `spell1` = 63784, `spell2` = 35054, `mechanic_immune_mask` = 33554513, `equipment_id` = 1847, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33832;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33823);
INSERT INTO `creature_ai_scripts` VALUES 
(3382301, 33823, 0, 0, 100, 1, 3000, 5000, 16000, 20000, 11, 35054, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Slayer - Cast Mortal Strike'),
(3382302, 33823, 0, 0, 100, 1, 9000, 12000, 28000, 34000, 11, 63784, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Slayer - Cast Bladestorm');

UPDATE `creature_template` SET `equipment_id` = 1849 WHERE `entry` = 32885;
UPDATE `creature_template` SET `equipment_id` = 1850 WHERE `entry` = 32908;

-- Faceless Horror
UPDATE `creature_template` SET `spell1` = 64429, `spell2` = 63722, `spell3` = 63710, `spell4` = 63703, `mechanic_immune_mask` = 33554513, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33772;
UPDATE `creature_template` SET `spell1` = 64429, `spell2` = 63722, `spell3` = 63710, `spell4` = 63703, `mechanic_immune_mask` = 33554513, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33773;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33772);
INSERT INTO `creature_ai_scripts` VALUES 
(3377201, 33772, 0, 0, 100, 1, 18000, 22000, 15000, 20000, 11, 64429, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faceless Horror - Cast Death Grip'),
(3377202, 33772, 0, 0, 100, 1, 2000, 4000, 10000, 12000, 11, 63722, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faceless Horror - Cast Shadow Crash'),
(3377203, 33772, 4, 0, 100, 1, 0, 0, 0, 0, 11, 63703, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faceless Horror - Cast Void Wave');

-- Twilight Frost Mage
UPDATE `creature_template` SET `spell1` = 64663, `spell2` = 63758, `spell3` = 63912, `spell4` = 63913, `equipment_id` = 1849, `mechanic_immune_mask` = 33554513, `unit_class` = 2, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33819;
UPDATE `creature_template` SET `spell1` = 64663, `spell2` = 63758, `spell3` = 63912, `spell4` = 63913, `equipment_id` = 1849, `mechanic_immune_mask` = 33554513, `unit_class` = 2, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33829;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33819);
INSERT INTO `creature_ai_scripts` VALUES 
(3381901, 33819, 0, 0, 100, 1, 10000, 16000, 20000, 25000, 11, 64663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Frost Mage - Cast Arcane Burst'),
(3381902, 33819, 0, 0, 100, 1, 1000, 2000, 6000, 8000, 11, 63913, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Frost Mage - Cast Frostbolt'),
(3381903, 33819, 0, 0, 100, 1, 2000, 4000, 10000, 16000, 11, 63758, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Frost Mage - Cast Frost Bolt Volley'),
(3381904, 33819, 0, 0, 100, 1, 8000, 10000, 12000, 16000, 11, 63912, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Frost Mage - Cast Frost Nova');

-- Twilight Pyromancer
UPDATE `creature_template` SET `spell1` = 64663, `spell2` = 63789, `spell3` = 63775, `equipment_id` = 1848, `mechanic_immune_mask` = 33554513, `unit_class` = 2, `mingold` = 7100, `maxgold` = 7600, `AIName` = 'EventAI' WHERE `entry` = 33820;
UPDATE `creature_template` SET `spell1` = 64663, `spell2` = 63789, `spell3` = 63775, `equipment_id` = 1848, `mechanic_immune_mask` = 33554513, `unit_class` = 2, `mingold` = 14200, `maxgold` = 15600 WHERE `entry` = 33830;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33820);
INSERT INTO `creature_ai_scripts` VALUES 
(3382001, 33820, 0, 0, 100, 1, 10000, 16000, 20000, 25000, 11, 64663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Pyromancer - Cast Arcane Burst'),
(3382002, 33820, 0, 0, 100, 1, 1000, 2000, 6000, 8000, 11, 63789, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Pyromancer - Cast Fireball'),
(3382003, 33820, 0, 0, 100, 1, 2000, 4000, 10000, 16000, 11, 63775, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Pyromancer - Cast Flamestrike');

-- Enslaved Fire Elemental
UPDATE `creature_template` SET `spell1` = 38064, `spell2` = 63778, `mechanic_immune_mask` = 33554513, `AIName` = 'EventAI' WHERE `entry` = 33838;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33838);
INSERT INTO `creature_ai_scripts` VALUES 
(3383801, 33838, 0, 0, 100, 1, 4000, 8000, 12000, 14000, 11, 38064, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enslaved Fire Elemental - Cast Blast Wave'),
(3383802, 33838, 4, 0, 100, 1, 0, 0, 0, 0, 11, 63778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enslaved Fire Elemental - Cast Fire Shield');