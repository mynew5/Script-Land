-- Ignis
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 9, `vehicleId` = 342 WHERE `entry` = 33118;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 9 WHERE `entry` = 33190;
DELETE FROM creature WHERE id = 33121;
DELETE FROM conditions WHERE SourceEntry = 62343;
REPLACE INTO `conditions` VALUES
('13','0','62343','0','18','1','33121','0','0','',NULL);

-- Razorscale
UPDATE `creature_template` SET `speed_run` = 0.00001 WHERE `entry` IN (34188, 34189);

-- XT-002
UPDATE `creature_template` SET `VehicleId` = 335 WHERE `entry` = 33293;

-- Assembly of Iron
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235 WHERE `entry` IN (32867, 32927, 33693, 33692);
UPDATE `creature_template` SET `mechanic_immune_mask` = 617299803 WHERE `entry` IN (32857, 33694);
UPDATE `creature_template` SET `ScriptName` = 'npc_rune_of_power' WHERE `entry` = 33705;
UPDATE `creature_template` SET `difficulty_entry_1` = 33691, `ScriptName` = 'npc_rune_of_summoning' WHERE `entry` = 33051;
UPDATE `creature_template` SET `ScriptName` = 'npc_lightning_elemental' WHERE `entry` = 32958;
-- Runemaster Molgeim
UPDATE `creature_model_info` SET `bounding_radius` = 0.45, `combat_reach` = 4 WHERE `modelid` = 28381;
-- Steelbreaker
UPDATE `creature_model_info` SET `bounding_radius` = 0.45, `combat_reach` = 8 WHERE `modelid` = 28344;

-- Kologarn
UPDATE `creature_template` SET `baseattacktime` = 1800, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` IN (32930, 33909);
UPDATE `creature_model_info` SET `bounding_radius` = 1, `combat_reach` = 15 WHERE `modelid` = 28638;
UPDATE `creature_model_info` SET `bounding_radius` = 0.465, `combat_reach` = 15 WHERE `modelid` = 28821;
-- Left Arm
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `ScriptName` = 'npc_left_arm' WHERE `entry` = 32933;
UPDATE `creature_model_info` SET `bounding_radius` = 0.465, `combat_reach` = 15 WHERE `modelid` = 28821;
-- Right Arm
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `ScriptName` = 'npc_right_arm' WHERE `entry` = 32934;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235 WHERE `entry` IN (33910, 33911);
UPDATE `creature_model_info` SET `bounding_radius` = 0.465, `combat_reach` = 15 WHERE `modelid` = 28822;
-- Focused Eyebeam
UPDATE `creature_template` SET `ScriptName` = 'npc_focused_eyebeam' WHERE `entry` IN (33632, 33802);
DELETE FROM conditions WHERE SourceEntry IN (63676, 63702);
REPLACE INTO `conditions` VALUES
('13','0','63676','0','18','1','32930','0','0','',"Focused Eyebeam (Kologarn)"),
('13','0','63702','0','18','1','32930','0','0','',"Focused Eyebeam (Kologarn)");
-- Cleanup
DELETE FROM `creature` WHERE `id` IN (33632, 33802, 34297, 32933, 32934, 33809, 33661, 33742);



-- Auriaya
UPDATE `creature_template` SET `baseattacktime` = 1500, `equipment_id` = 2422, `mechanic_immune_mask` = 617299807, `flags_extra` = 1 WHERE `entry` = 33515;
UPDATE `creature_template` SET `baseattacktime` = 1500, `equipment_id` = 2422, `mechanic_immune_mask` = 617299807, `flags_extra` = 1 WHERE `entry` = 34175;
UPDATE `creature_model_info` SET `bounding_radius` = 0.775, `combat_reach` = 5 WHERE `modelid` = 28651;
-- Sanctum Sentry
UPDATE `creature_template` SET `speed_walk` = 1.66667, `mechanic_immune_mask` = 536870912, `flags_extra` = 1, `ScriptName` = 'npc_sanctum_sentry' WHERE `entry` = 34014;
UPDATE `creature_template` SET `baseattacktime` = 1500, `speed_walk` = 1.66667, `mechanic_immune_mask` = 536870912, `flags_extra` = 1 WHERE `entry` = 34166;
-- Feral Defender
UPDATE `creature_template` SET `speed_walk` = 2, `dmg_multiplier` = 3.5, `flags_extra` = 1, `ScriptName` = 'npc_feral_defender' WHERE `entry` = 34035;
UPDATE `creature_template` SET `speed_walk` = 2, `dmg_multiplier` = 5, `flags_extra` = 1, `baseattacktime` = 1500 WHERE `entry` = 34171;
UPDATE `creature_template` SET `unit_flags` = 33554432, `ScriptName` = 'npc_seeping_trigger' WHERE `entry` = 34098;
UPDATE `creature_template` SET `unit_flags` = 33554432 WHERE `entry` = 34174;
UPDATE `creature_template` SET `dmg_multiplier` = 1.5, `baseattacktime` = 1500 WHERE `entry` = 34169;
UPDATE `creature_template` SET `ScriptName` = 'npc_feral_defender_trigger' WHERE `entry` = 34096;
-- Mace equip
DELETE FROM `creature_equip_template` WHERE entry = 2422;
REPLACE INTO `creature_equip_template` VALUES ('2422','45315','0','0');
-- Cleanup
DELETE FROM `creature` WHERE `id` = 34014;
-- Auriaya movement path
DELETE FROM `creature_addon` WHERE guid = 137496;
REPLACE INTO `creature_addon` VALUES ('137496','1033515','0','0','0','0','0');
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 137496;
DELETE FROM `waypoint_data` WHERE id = 1033515;
REPLACE INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`, `move_flag`, `action`, `action_chance`, `wpguid`) VALUES
('1033515','1','1968.46','51.75','417.72','0','0','0','100','0'),
('1033515','2','1956.75','49.22','411.35','0','0','0','100','0'),
('1033515','3','1938.90','42.09','411.35','3000','0','0','100','0'),
('1033515','4','1956.75','49.22','411.35','0','0','0','100','0'),
('1033515','5','1968.46','51.75','417.72','0','0','0','100','0'),
('1033515','6','2011.43','44.91','417.72','0','0','0','100','0'),
('1033515','7','2022.65','37.74','411.36','0','0','0','100','0'),
('1033515','8','2046.65','9.61','411.36','0','0','0','100','0'),
('1033515','9','2053.4','-8.65','421.68','0','0','0','100','0'),
('1033515','10','2053.14','-39.8','421.66','0','0','0','100','0'),
('1033515','11','2046.26','-57.96','411.35','0','0','0','100','0'),
('1033515','12','2022.42','-86.39','411.35','0','0','0','100','0'),
('1033515','13','2011.26','-92.95','417.71','0','0','0','100','0'),
('1033515','14','1969.43','-100.02','417.72','0','0','0','100','0'),
('1033515','15','1956.66','-97.4','411.35','0','0','0','100','0'),
('1033515','16','1939.18','-90.90','411.35','3000','0','0','100','0'),
('1033515','17','1956.66','-97.4','411.35','0','0','0','100','0'),
('1033515','18','1969.43','-100.02','417.72','0','0','0','100','0'),
('1033515','19','2011.26','-92.95','417.71','0','0','0','100','0'),
('1033515','20','2022.42','-86.39','411.35','0','0','0','100','0'),
('1033515','21','2046.26','-57.96','411.35','0','0','0','100','0'),
('1033515','22','2053.14','-39.8','421.66','0','0','0','100','0'),
('1033515','23','2053.4','-8.65','421.68','0','0','0','100','0'),
('1033515','24','2046.65','9.61','411.36','0','0','0','100','0'),
('1033515','25','2022.65','37.74','411.36','0','0','0','100','0'),
('1033515','26','2011.43','44.91','417.72','0','0','0','100','0');



-- Hodir
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854239, `flags_extra` = 1, `ScriptName` = 'boss_hodir' WHERE `entry` = 32845;
UPDATE `creature_template` SET `equipment_id` = 1843, `mechanic_immune_mask` = 650854239, `flags_extra` = 1 WHERE `entry` = 32846;
-- Hodir npcs
UPDATE `creature_template` SET `ScriptName` = 'npc_hodir_priest' WHERE `entry` IN (32897, 33326, 32948, 33330);
UPDATE `creature_template` SET `ScriptName` = 'npc_hodir_shaman' WHERE `entry` IN (33328, 32901, 33332, 32950);
UPDATE `creature_template` SET `ScriptName` = 'npc_hodir_druid' WHERE `entry` IN (33325, 32900, 32941, 33333);
UPDATE `creature_template` SET `ScriptName` = 'npc_hodir_mage' WHERE `entry` IN (32893, 33327, 33331, 32946);
UPDATE `creature_template` SET `ScriptName` = 'npc_toasty_fire' WHERE `entry` = 33342;
UPDATE `creature_template` SET `ScriptName` = 'npc_icicle' WHERE `entry` = 33169;
UPDATE `creature_template` SET `ScriptName` = 'npc_icicle_snowdrift' WHERE `entry` = 33173;
UPDATE `creature_template` SET `ScriptName` = 'npc_snowpacked_icicle' WHERE `entry` = 33174;
UPDATE `creature_template` SET `difficulty_entry_1` = 33352, `mechanic_immune_mask` = 612597599, `ScriptName` = 'npc_flash_freeze' WHERE `entry` = 32926;
UPDATE `creature_template` SET `difficulty_entry_1` = 33353, `mechanic_immune_mask` = 612597599, `ScriptName` = 'npc_flash_freeze' WHERE `entry` = 32938;
UPDATE `creature_template` SET `mechanic_immune_mask` = 612597599 WHERE `entry` IN (33352, 33353);
UPDATE `gameobject_template` SET `flags` = 4 WHERE `entry` = 194173;
-- Cleanup
DELETE FROM `creature` WHERE `id` IN (32950, 32941, 32948, 32946, 32938);

-- Mimiron Tram
UPDATE `gameobject_template` SET `flags` = 32, `data2` = 3000, `ScriptName` = 'go_call_tram' WHERE `entry` IN (194914, 194912, 194437);
DELETE FROM gameobject WHERE id = '194437';
REPLACE INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
('194437','603','1','1','2306.87','274.237','424.288','1.52255','0','0','0.689847','0.723956','300','0','1');
DELETE FROM gameobject_template WHERE entry = '194438';
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`, `WDBVerified`) VALUES
('194438','1','8504','Activate Tram','','','','0','32','1','0','0','0','0','0','0','0','0','3000','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','go_call_tram','11159');
DELETE FROM gameobject WHERE id = '194438';
REPLACE INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(194438, 603, 1,1,2306.99, 2589.35, 424.382, 4.71676, 0, 0, 0.705559, -0.708651, 300, 0, 1);

-- Mimiron
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `ScriptName` = 'boss_mimiron' WHERE `entry` = 33350;
-- Leviathan MKII
UPDATE `creature_template` SET `vehicleid` = 370, `mechanic_immune_mask` = 650854235, `ScriptName` = 'boss_leviathan_mk' WHERE `entry` = 33432;
UPDATE `creature_template` SET `minlevel` = 83, `maxlevel` = 83, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 34106;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `ScriptName` = 'boss_leviathan_mk_turret' WHERE `entry` = 34071;

UPDATE creature_template SET ScriptName = 'npc_proximity_mine' WHERE entry = 34362;
DELETE FROM `creature_model_info` WHERE `modelid`=28831;
REPLACE INTO `creature_model_info` (`modelid`, `bounding_radius`, `combat_reach`, `gender`, `modelid_other_gender`) VALUES
(28831, 0.5, 7, 2, 0);
-- VX-001
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1, `vehicleid` = 371, `ScriptName` = 'boss_vx_001' WHERE `entry` = 33651;
UPDATE `creature_template` SET `minlevel` = 83, `maxlevel` = 83, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 34108;
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35 WHERE `entry` = 34050;
UPDATE `creature_template` SET `unit_flags` = 33686020, `flags_extra` = 2 WHERE `entry` = 34211;
UPDATE `creature_template` SET `ScriptName` = 'npc_rocket_strike' WHERE `entry` = 34047;
-- Aerial Command Unit
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1, `ScriptName` = 'boss_aerial_unit' WHERE `entry` = 33670;
UPDATE `creature_template` SET `minlevel` = 83, `maxlevel` = 83, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 34109;
UPDATE `creature_template` SET `ScriptName` = 'npc_magnetic_core' WHERE `entry` = 34068;
UPDATE `creature_template` SET `ScriptName` = 'npc_assault_bot' WHERE `entry` = 34057;
UPDATE `creature_template` SET `difficulty_entry_1` = 34148, `ScriptName` = 'npc_emergency_bot' WHERE `entry` = 34147;
-- HardMode
UPDATE `gameobject_template` SET `flags` = 32, `ScriptName` = 'go_not_push_button' WHERE `entry` = 194739;
UPDATE `creature_template` SET `difficulty_entry_1` = 34361, `ScriptName` = 'npc_frost_bomb' WHERE `entry` = 34149;
UPDATE `creature_template` SET `speed_walk` = 0.15, `speed_run` = 0.15, `ScriptName` = 'npc_mimiron_flame_trigger' WHERE `entry` = 34363;
UPDATE `creature_template` SET `ScriptName` = 'npc_mimiron_flame_spread' WHERE `entry` = 34121;
-- CleanUp
DELETE FROM creature WHERE id IN (34071, 33856);
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` = 34143;




-- Freya
UPDATE `creature_template` SET `baseattacktime` = 1500, `mechanic_immune_mask` = 650854235, `ScriptName` = 'boss_freya' WHERE `entry` = 32906;
UPDATE `creature_template` SET `speed_walk` = 1.6, `baseattacktime` = 1500, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 33360;
-- Elders
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1, `ScriptName` = 'npc_elder_brightleaf' WHERE `entry` = 32915;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1, `ScriptName` = 'npc_elder_ironbranch' WHERE `entry` = 32913;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1, `ScriptName` = 'npc_elder_stonebark' WHERE `entry` = 32914;
UPDATE `creature_template` SET `speed_walk` = 1.66666, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` IN (33393, 33392, 33391);
-- Iron roots
UPDATE `creature_template` SET `difficulty_entry_1` = 33397, `mechanic_immune_mask` = 650854239, `ScriptName` = 'npc_iron_roots' WHERE `entry` = 33168;
UPDATE `creature_template` SET `difficulty_entry_1` = 33396, `mechanic_immune_mask` = 650854239, `ScriptName` = 'npc_iron_roots' WHERE `entry` = 33088;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854239 WHERE `entry` IN (33396, 33397);
-- Eonar Gift
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1, `ScriptName` = 'npc_eonars_gift' WHERE `entry` = 33228;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 33385;
-- Unstable Sun Beam
UPDATE `creature_template` SET `ScriptName` = 'npc_unstable_sun_beam' WHERE `entry` = 33050;
-- Sun Beam
UPDATE `creature_template` SET `ScriptName` = 'npc_sun_beam' WHERE `entry` = 33170;
-- Nature Bomb
UPDATE `creature_template` SET `ScriptName` = 'npc_nature_bomb' WHERE `entry` = 34129;
UPDATE `gameobject_template` SET `flags` = 4 WHERE `entry` = 194902;
-- Detonating Lasher
UPDATE `creature_template` SET `flags_extra` = 256, `ScriptName` = 'npc_detonating_lasher' WHERE `entry` = 32918;
UPDATE `creature_template` SET `flags_extra` = 256 WHERE `entry` = 33399;
-- Ancient Conservator
UPDATE `creature_template` SET `mechanic_immune_mask` = 650853979, `ScriptName` = 'npc_ancient_conservator' WHERE `entry` = 33203;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650853979 WHERE `entry` = 33376;
-- Healthy Spore
UPDATE `creature_template` SET `ScriptName` = 'npc_healthy_spore' WHERE `entry` = 33215;
-- Storm Lasher
UPDATE `creature_template` SET `ScriptName` = 'npc_storm_lasher' WHERE `entry` = 32919;
-- Snaplasher
UPDATE `creature_template` SET `ScriptName` = 'npc_snaplasher' WHERE `entry` = 32916;
-- Ancient Water Spirit
UPDATE `creature_template` SET `ScriptName` = 'npc_ancient_water_spirit' WHERE `entry` = 33202;
-- Cleanup
DELETE FROM `creature` WHERE `guid` = 136607 OR id = 33575;



-- Thorim
UPDATE `creature_template` SET `speed_walk` = 1.66667, `mechanic_immune_mask` = 650854239, `flags_extra` = 1, `ScriptName` = 'boss_thorim' WHERE `entry` = 32865;
UPDATE `creature_template` SET `speed_walk` = 1.66667, `baseattacktime` = 1500, `equipment_id` = 1844, `mechanic_immune_mask` = 650854239 WHERE `entry` = 33147;
DELETE FROM `creature` WHERE `id`=32865;
REPLACE INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(32865, 603, 3, 1, 28977, 0, 2134.967, -298.962, 438.331, 1.57, 604800, 0, 0, 4183500, 425800, 0, 1);
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=62042;
REPLACE INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
('62042','62470','1','Thorim: Deafening Thunder');
-- Charge Orb
DELETE FROM conditions WHERE SourceEntry = 62016;
REPLACE INTO `conditions` VALUES
('13','0','62016','0','18','1','33378','0','0','',NULL);
UPDATE `creature_template` SET `unit_flags` = 33685508 WHERE `entry` = 33378;
-- Gate
DELETE FROM `gameobject_scripts` WHERE `id`=55194;
REPLACE INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES 
(55194, 0, 11, 34155, 15, '0', 0, 0, 0, 0);
DELETE FROM `gameobject_template` WHERE `entry`=194265;
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`, `WDBVerified`) VALUES
('194265','1','295','Lever','','','','0','16','3','0','0','0','0','0','0','0','0','6000','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0');
UPDATE `gameobject` SET `id` = 194265, `rotation2` = 1, `rotation3` = 0, `spawntimesecs` = 7200, `animprogress` = 100 WHERE `guid` = 55194;
-- Cleanup
DELETE FROM `creature` WHERE `id` IN (32885, 32883, 32908, 32907, 32882, 33110, 32886, 32879, 32892, 33140, 33141, 33378, 32874, 32875)
OR guid IN (136694, 136695, 136666, 136706, 136754, 136653, 136756, 136757, 136725, 136718);
-- Pre adds
UPDATE `creature_template` SET `equipment_id` = 1849, `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32885;
UPDATE `creature_template` SET `equipment_id` = 1849 WHERE `entry` = 33153;
UPDATE `creature_template` SET `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32883;
UPDATE `creature_template` SET `equipment_id` = 1847 WHERE `entry` = 33152;
UPDATE `creature_template` SET `equipment_id` = 1850, `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32908;
UPDATE `creature_template` SET `equipment_id` = 1850 WHERE `entry` = 33151;
UPDATE `creature_template` SET `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32907;
UPDATE `creature_template` SET `equipment_id` = 1852 WHERE `entry` = 33150;
UPDATE `creature_template` SET `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32882;
UPDATE `creature_template` SET `ScriptName` = 'npc_thorim_pre_phase' WHERE `entry` = 32886;
UPDATE `creature_template` SET `modelid1` = 16925, `modelid2` = 0 WHERE `entry`IN (33378, 32892);
-- Thorim Mini bosses
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854239, `flags_extra` = 1, `ScriptName` = 'npc_runic_colossus' WHERE `entry` = 32872;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854239, `flags_extra` = 1, `ScriptName` = 'npc_ancient_rune_giant' WHERE `entry` = 32873;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854239, `flags_extra` = 1, `ScriptName` = 'npc_sif' WHERE `entry` = 33196;
UPDATE `creature_template` SET `ScriptName` = 'npc_thorim_arena_phase' WHERE `entry` IN (32876, 32904, 32878, 32877, 32874, 32875, 33110);
DELETE FROM `creature_addon` WHERE `guid`IN (136059, 136816);
REPLACE INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
('136059','0','0','0','1','0','40775 0'),
('136816','0','0','0','1','0','40775 0');


-- General Vezax
UPDATE `creature_template` SET `mechanic_immune_mask` = 617299803, `flags_extra` = 257, `ScriptName` = 'boss_general_vezax' WHERE `entry` = 33271;
UPDATE `creature_template` SET `baseattacktime` = 1500, `mechanic_immune_mask` = 617299803, `flags_extra` = 257 WHERE `entry` = 33449;
UPDATE `creature_model_info` SET `bounding_radius` = 0.62, `combat_reach` = 12 WHERE `modelid` = 28548;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `ScriptName` = 'npc_saronite_vapors' WHERE `entry` = 33488;
UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80, `mechanic_immune_mask` = 650854235, `ScriptName` = 'npc_saronite_animus' WHERE `entry` = 33524;
UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80, `mechanic_immune_mask` = 650854235 WHERE `entry` IN (33789, 34152);
UPDATE `creature_model_info` SET `bounding_radius` = 0.62, `combat_reach` = 10 WHERE `modelid` = 28992;
-- CleanUp
DELETE FROM creature WHERE id = 33500;

-- Leviathan Doors
DELETE FROM `gameobject` WHERE `id` = '194905';
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
('35528','194905','603','1','1','401.308','-13.8236','409.524','3.14159','0','0','0','1','180','255','0');

-- Thorim's Hammer
DELETE FROM `conditions` WHERE `SourceEntry` = 62911;
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
('13','0','62911','0','18','1','33365','0','0','',"Thorim Hammer");

-- Mimiron's Inferno
DELETE FROM `conditions` WHERE `SourceEntry` = 62909;
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
('13','0','62909','0','18','1','33370','0','0','',"Mimiron Inferno");

-- Hodir's Fury
DELETE FROM `conditions` WHERE `SourceEntry` = 62533;
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
('13','0','62533','0','18','1','33212','0','0','',"Hodirs Fury");

-- Freya's Ward
DELETE FROM `conditions` WHERE `SourceEntry` = 62906;
REPLACE INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
('13','0','62906','0','18','1','33367','0','0','',"Freya Ward");


UPDATE `creature_template` SET `speed_walk` = 2 WHERE `entry` IN (33370, 33212);
DELETE FROM creature WHERE guid IN (137479, 137480);

DELETE FROM `smart_scripts` WHERE (`entryorguid`=33836);
REPLACE INTO `smart_scripts` VALUES 
(33836, 0, 0, 1, 9, 0, 100, 1, 0, 2, 0, 0, 11, 63801, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Boom Bot - Explode'),
(33836, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Boom Bot - despawn');

-- Creatures and Gameobjects 25 man spawn
UPDATE `creature` SET `spawnMask` = 3 WHERE `map` = 603;
UPDATE `gameobject` SET `spawnMask` = 3 WHERE `map` = 603;

-- .tele Uld
DELETE FROM `game_tele` WHERE `name` = "Uld";
REPLACE INTO `game_tele` VALUES
(NULL, 9347.78, -1114.88, 1245.09, 6.278, 571, 'Uld');

-- Salvaged Chopper has no heroic entry
UPDATE `creature_template` SET `difficulty_entry_1` = 0 WHERE `entry` = 33062;

DELETE FROM `creature` WHERE `id` IN (33060, 33062, 33109);

-- Flame Leviathan
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235 WHERE `entry` IN (33113, 34003);

-- Mimiron
UPDATE `creature_template` SET `exp` = 0 WHERE `entry` IN (33432, 34106);
UPDATE `creature_template` SET `difficulty_entry_1` = 34114 WHERE `entry` = 33855;

-- remove Chest spawned
DELETE FROM `gameobject` WHERE `id` IN (195046, 195047, 194307, 194308);

-- XT-002 loot
DELETE FROM `creature_loot_template` WHERE `entry`=33293;
REPLACE INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('33293','45624','100','1','0','1','1'),
('33293','1','100','1','0','-34121','2'),
('33293','45867','0','2','2','1','1'),
('33293','45868','0','2','2','1','1'),
('33293','45869','0','2','2','1','1'),
('33293','45870','0','2','2','1','1'),
('33293','45871','0','2','2','1','1');

DELETE FROM `reference_loot_template` WHERE `entry`=34121;
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('34121','45675','0','1','1','1','1'),
('34121','45676','0','1','1','1','1'),
('34121','45677','0','1','1','1','1'),
('34121','45679','0','1','1','1','1'),
('34121','45680','0','1','1','1','1'),
('34121','45682','0','1','1','1','1'),
('34121','45685','0','1','1','1','1'),
('34121','45686','0','1','1','1','1'),
('34121','45687','0','1','1','1','1'),
('34121','45694','0','1','1','1','1');


-- Assembly of Iron Hardmode loot

DELETE FROM `creature_loot_template` WHERE `entry` IN (32857, 32927, 32867);
REPLACE INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('32857','45624','100','2','0','1','1'),
('32857','1','100','1','0','-34122','2'),
('32927','45624','100','2','0','2','2'),
('32927','1','100','1','0','-34122','3'),
('32927','45506','100','2','0','1','1'),
('32867','45624','100','4','0','1','1'),
('32867','1','100','1','0','-34122','2'),
('32867','45506','0','4','0','1','1'),
('32867','45447','0','4','2','1','1'),
('32867','45448','0','4','2','1','1'),
('32867','45449','0','4','2','1','1'),
('32867','45455','0','4','2','1','1'),
('32867','45456','0','4','2','1','1');

DELETE FROM `reference_loot_template` WHERE `entry`=34122;
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('34122','45322','0','1','1','1','1'),
('34122','45324','0','1','1','1','1'),
('34122','45329','0','1','1','1','1'),
('34122','45330','0','1','1','1','1'),
('34122','45331','0','1','1','1','1'),
('34122','45332','0','1','1','1','1'),
('34122','45333','0','1','1','1','1'),
('34122','45378','0','1','1','1','1'),
('34122','45418','0','1','1','1','1'),
('34122','45423','0','1','1','1','1');

UPDATE creature_loot_template SET lootmode = 4 WHERE entry = 33693 AND item IN (45506, 45624);
UPDATE creature_loot_template SET lootmode = 2 WHERE entry IN (33694, 33692) AND item = 45624;

-- Hodir

DELETE FROM `reference_loot_template` WHERE entry = 34173;
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('34173','45450','0','1','1','1','1'),
('34173','45451','0','1','1','1','1'),
('34173','45452','0','1','1','1','1'),
('34173','45453','0','1','1','1','1'),
('34173','45454','0','1','1','1','1');

DELETE FROM `gameobject_loot_template` WHERE entry = 26946;
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('26946','1','100','1','0','-34173','2'),
('26946','2','10','1','0','-34154','1'),
('26946','45038','8','1','0','1','1'),
('26946','45087','75','1','0','1','1'),
('26946','45624','100','1','0','1','1'),
('26946','45632','0','1','1','1','1'),
('26946','45633','0','1','1','1','1'),
('26946','45634','0','1','1','1','1');

-- Hodir Harmode loot

UPDATE script_texts SET `type` = 2 WHERE entry = -1603218;
DELETE FROM `gameobject` WHERE `id`=194200;
REPLACE INTO `gameobject` (`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(194200, 603, 1, 1, 2038.29, -200.702, 432.687, 3.12232, 0, 0, 1, 0, 300, 0, 1);

DELETE FROM `gameobject_loot_template` WHERE entry=27069;
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('27069','45624','100','1','0','1','1'),
('27069','45888','0','1','1','1','1'),
('27069','45886','0','1','1','1','1'),
('27069','45887','0','1','1','1','1'),
('27069','45877','0','1','1','1','1'),
('27069','45876','0','1','1','1','1'),
('27069','45786','-100','1','0','1','1');

DELETE FROM `gameobject` WHERE `id`=194201;
REPLACE INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(NULL, 194201, 603, 2, 1, 2038.29, -200.702, 432.687, 3.12232, 0, 0, 1, 0, 604800, 0, 1);
UPDATE `gameobject_template` SET `flags` = 16 WHERE `entry` = 194201;
UPDATE gameobject_loot_template SET lootmode = 1 WHERE entry = 26950 AND lootmode = 2;


-- Freya
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` = 33215;
DELETE FROM `gameobject_loot_template` WHERE `entry` IN (27078, 27079, 27080, 27081);
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('27078','1','100','1','0','-34125','1'),
('27078','2','100','1','0','-34105','1'),
('27078','45624','100','1','0','1','1'),
('27078','45087','100','1','0','1','1'),
('27078','45644','0','1','1','1','1'),
('27078','45645','0','1','1','1','1'),
('27078','45646','0','1','1','1','1'),
('27078','46110','100','1','0','1','1'),
('27079','1','100','1','0','-34125','2'),
('27079','2','100','1','0','-34105','1'),
('27079','45624','100','1','0','1','1'),
('27079','45087','100','1','0','1','1'),
('27079','45644','0','1','1','1','1'),
('27079','45645','0','1','1','1','1'),
('27079','45646','0','1','1','1','1'),
('27079','46110','100','1','0','1','1'),
('27080','1','100','1','0','-34125','2'),
('27080','2','100','1','0','-34105','1'),
('27080','45624','100','1','0','2','2'),
('27080','45087','100','1','0','1','1'),
('27080','45644','0','1','1','1','1'),
('27080','45645','0','1','1','1','1'),
('27080','45646','0','1','1','1','1'),
('27080','46110','100','1','0','1','1'),
('27081','1','100','1','0','-34125','1'),
('27081','2','100','1','0','-34105','1'),
('27081','45943','0','1','2','1','1'),
('27081','45945','0','1','2','1','1'),
('27081','45946','0','1','2','1','1'),
('27081','45294','0','1','2','1','1'),
('27081','45947','0','1','2','1','1'),
('27081','45624','100','1','0','1','1'),
('27081','45087','100','1','0','1','1'),
('27081','45644','0','1','1','1','1'),
('27081','45645','0','1','1','1','1'),
('27081','45646','0','1','1','1','1'),
('27081','45788','-100','1','0','1','1'),
('27081','46110','100','1','0','1','1');

DELETE FROM `reference_loot_template` WHERE `entry`=34125;
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('34125','45934','0','1','1','1','1'),
('34125','45935','0','1','1','1','1'),
('34125','45936','0','1','1','1','1'),
('34125','45940','0','1','1','1','1'),
('34125','45941','0','1','1','1','1');


DELETE FROM `gameobject_template` WHERE entry IN (194326, 194328, 194329, 194330, 194331);
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`, `WDBVerified`) VALUES
('194326','3','8628','Freya\'s Gift','','','','0','0','2','0','0','0','0','0','0','1634','27080','0','1','0','0','0','0','0','0','0','1','0','1','0','1','0','0','0','0','0','0','0','0','','12340'),
('194328','3','8628','Freya\'s Gift','','','','0','0','2','0','0','0','0','0','0','1634','27087','0','1','0','0','0','0','0','0','0','1','0','1','0','1','0','0','0','0','0','0','0','0','','12340'),
('194329','3','8628','Freya\'s Gift','','','','0','0','2','0','0','0','0','0','0','1634','27088','0','1','0','0','0','0','0','0','0','1','0','1','0','1','0','0','0','0','0','0','0','0','','12340'),
('194330','3','8628','Freya\'s Gift','','','','0','0','2','0','0','0','0','0','0','1634','27089','0','1','0','0','0','0','0','0','0','1','0','1','0','1','0','0','0','0','0','0','0','0','','12340'),
('194331','3','8628','Freya\'s Gift','','','','0','0','2','0','0','0','0','0','0','1634','27090','0','1','0','0','0','0','0','0','0','1','0','1','0','1','0','0','0','0','0','0','0','0','','12340');

DELETE FROM `reference_loot_template` WHERE entry = 34176;
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('34176','45479','0','1','1','1','1'),
('34176','45483','0','1','1','1','1'),
('34176','45482','0','1','1','1','1'),
('34176','45481','0','1','1','1','1'),
('34176','45480','0','1','1','1','1');

DELETE FROM `gameobject_loot_template` WHERE entry = 27087;
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('27087','1','100','1','0','-34176','2'),
('27087','2','10','1','0','-34154','1'),
('27087','45624','100','1','0','1','1'),
('27087','45038','18','1','0','1','1'),
('27087','45087','75','1','0','1','1'),
('27087','45653','0','1','1','1','1'),
('27087','45654','0','1','1','1','1'),
('27087','45655','0','1','1','1','1'),
('27087','46110','70','1','0','1','1');

DELETE FROM `gameobject_loot_template` WHERE entry = 27088;
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('27088','1','100','1','0','-34176','3'),
('27088','2','10','1','0','-34154','1'),
('27088','45624','100','1','0','1','1'),
('27088','45038','18','1','0','1','1'),
('27088','45087','75','1','0','1','1'),
('27088','45653','0','1','1','1','1'),
('27088','45654','0','1','1','1','1'),
('27088','45655','0','1','1','1','1'),
('27088','46110','70','1','0','1','1');

DELETE FROM `gameobject_loot_template` WHERE entry = 27089;
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('27089','1','100','1','0','-34176','3'),
('27089','2','10','1','0','-34154','1'),
('27089','45624','100','1','0','2','2'),
('27089','45038','18','1','0','1','1'),
('27089','45087','75','1','0','1','1'),
('27089','45653','0','1','1','1','1'),
('27089','45654','0','1','1','1','1'),
('27089','45655','0','1','1','1','1'),
('27089','46110','70','1','0','1','1'),
('27089','45814','-100','1','0','1','1');

DELETE FROM `gameobject_loot_template` WHERE entry = 27090;
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('27090','1','100','1','0','-34176','3'),
('27090','2','10','1','0','-34154','1'),
('27090','45624','100','1','0','2','2'),
('27090','45038','18','1','0','1','1'),
('27090','45087','75','1','0','1','1'),
('27090','45485','0','1','1','1','1'),
('27090','45613','0','1','1','1','1'),
('27090','45487','0','1','1','1','1'),
('27090','45484','0','1','1','1','1'),
('27090','45486','0','1','1','1','1'),
('27090','45653','0','1','2','1','1'),
('27090','45654','0','1','2','1','1'),
('27090','45655','0','1','2','1','1'),
('27090','45488','0','1','1','1','1'),
('27090','46110','70','1','0','1','1'),
('27090','45814','-100','1','0','1','1');

-- Thorim

UPDATE `gameobject_template` SET `faction` = 0, `flags` = 0 WHERE `entry` IN (194312, 194313);

DELETE FROM `gameobject_loot_template` WHERE entry IN (27073, 27074);
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('27073','45624','100','1','0','1','1'),
('27073','1','100','1','0','-34130','1'),
('27073','45659','0','1','1','1','1'),
('27073','45660','0','1','1','1','1'),
('27073','45661','0','1','1','1','1'),
('27074','45624','100','1','0','1','1'),
('27074','1','100','1','0','-34130','1'),
('27074','45928','0','1','2','1','1'),
('27074','45929','0','1','2','1','1'),
('27074','45930','0','1','2','1','1'),
('27074','45931','0','1','2','1','1'),
('27074','45933','0','1','2','1','1'),
('27074','45659','0','1','1','1','1'),
('27074','45660','0','1','1','1','1'),
('27074','45661','0','1','1','1','1'),
('27074','45784','-100','3','0','1','1');

DELETE FROM `reference_loot_template` WHERE entry = 34130;
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('34130','45892','0','1','1','1','1'),
('34130','45893','0','1','1','1','1'),
('34130','45894','0','1','1','1','1'),
('34130','45895','0','1','1','1','1'),
('34130','45927','0','1','1','1','1');


DELETE FROM `reference_loot_template` WHERE entry = 34174;
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('34174','45463','0','1','1','1','1'),
('34174','45466','0','1','1','1','1'),
('34174','45467','0','1','1','1','1'),
('34174','45468','0','1','1','1','1'),
('34174','45469','0','1','1','1','1');

DELETE FROM `gameobject_loot_template` WHERE entry = 26955;
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('26955','1','100','1','0','-34174','2'),
('26955','2','10','1','0','-34154','1'),
('26955','45038','18','1','0','1','1'),
('26955','45087','75','1','0','1','1'),
('26955','45624','100','1','0','1','2'),
('26955','45638','0','1','1','1','1'),
('26955','45639','0','1','1','1','1'),
('26955','45640','0','1','1','1','1');

UPDATE `gameobject_template` SET `size` = 3, `questItem1` = 45817, `data1` = 26956 WHERE `entry` = 194315;
DELETE FROM `gameobject_loot_template` WHERE entry = 26956;
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('26956','1','100','1','0','-34174','2'),
('26956','2','10','1','0','-34154','1'),
('26956','45624','100','1','0','2','2'),
('26956','45038','18','1','0','1','1'),
('26956','45087','75','1','0','1','1'),
('26956','45470','0','1','1','1','1'),
('26956','45471','0','1','1','1','1'),
('26956','45472','0','1','1','1','1'),
('26956','45473','0','1','1','1','1'),
('26956','45474','0','1','1','1','1'),
('26956','45570','0','1','1','1','1'),
('26956','45638','0','1','2','1','1'),
('26956','45639','0','1','2','1','1'),
('26956','45640','0','1','2','1','1'),
('26956','45817','-100','1','0','1','1');

-- Mimiron
DELETE FROM `gameobject_template` WHERE entry = 194790;
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`, `WDBVerified`) VALUES
('194790','3','8686','Cache of Innovation','','','','0','0','1.5','0','0','0','0','0','0','1634','27084','0','1','0','0','0','0','0','0','0','1','0','1','0','1','0','0','0','0','0','0','0','0','','12340');

DELETE FROM `gameobject_loot_template` WHERE entry IN (27085, 27084);
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('27085','45624','100','1','0','1','1'),
('27085','1','100','1','0','-34129','1'),
('27085','45647','0','1','1','1','1'),
('27085','45648','0','1','1','1','1'),
('27085','45649','0','1','1','1','1'),
('27084','45624','100','1','0','1','1'),
('27084','1','100','1','0','-34129','1'),
('27084','45982','0','1','2','1','1'),
('27084','45988','0','1','2','1','1'),
('27084','45989','0','1','2','1','1'),
('27084','45990','0','1','2','1','1'),
('27084','45993','0','1','2','1','1'),
('27084','45647','0','1','1','1','1'),
('27084','45648','0','1','1','1','1'),
('27084','45649','0','1','1','1','1'),
('27084','45787','-100','1','0','1','1');

DELETE FROM `reference_loot_template` WHERE entry = 34129;
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('34129','45972','0','1','1','1','1'),
('34129','45973','0','1','1','1','1'),
('34129','45974','0','1','1','1','1'),
('34129','45975','0','1','1','1','1'),
('34129','45976','0','1','1','1','1');


UPDATE `gameobject_template` SET `size` = 1.5 WHERE `entry` = 194956;
DELETE FROM `reference_loot_template` WHERE entry = 34175;
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('34175','45489','0','1','1','1','1'),
('34175','45490','0','1','1','1','1'),
('34175','45491','0','1','1','1','1'),
('34175','45492','0','1','1','1','1'),
('34175','45493','0','1','1','1','1');

DELETE FROM `gameobject_loot_template` WHERE entry = 26963;
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('26963','1','100','1','0','-34175','2'),
('26963','2','10','1','0','-34154','1'),
('26963','45038','18','1','0','1','1'),
('26963','45087','75','1','0','1','1'),
('26963','45624','100','1','0','1','1'),
('26963','45641','0','1','1','1','1'),
('26963','45642','0','1','1','1','1'),
('26963','45643','0','1','1','1','1');

DELETE FROM `gameobject_loot_template` WHERE entry = 27086;
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('27086','1','100','1','0','-34175','2'),
('27086','2','10','1','0','-34154','1'),
('27086','45624','100','1','0','2','2'),
('27086','45038','18','1','0','1','1'),
('27086','45087','75','1','0','1','1'),
('27086','45494','0','1','1','1','1'),
('27086','45495','0','1','1','1','1'),
('27086','45496','0','1','1','1','1'),
('27086','45497','0','1','1','1','1'),
('27086','45620','0','1','1','1','1'),
('27086','45641','0','1','2','1','1'),
('27086','45642','0','1','2','1','1'),
('27086','45643','0','1','2','1','1'),
('27086','45663','0','1','1','1','1'),
('27086','45816','-100','1','0','1','1');

-- General Vezax loot

DELETE FROM `creature_loot_template` WHERE entry = 33271;
REPLACE INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('33271','45624','100','1','0','1','1'),
('33271','1','100','1','0','-34131','2'),
('33271','46032','0','2','2','1','1'),
('33271','46033','0','2','2','1','1'),
('33271','46034','0','2','2','1','1'),
('33271','46035','0','2','2','1','1'),
('33271','46036','0','2','2','1','1');

DELETE FROM `reference_loot_template` WHERE entry = 34131;
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
('34131','45996','0','1','1','1','1'),
('34131','45997','0','1','1','1','1'),
('34131','46008','0','1','1','1','1'),
('34131','46009','0','1','1','1','1'),
('34131','46010','0','1','1','1','1'),
('34131','46011','0','1','1','1','1'),
('34131','46012','0','1','1','1','1'),
('34131','46013','0','1','1','1','1'),
('34131','46014','0','1','1','1','1'),
('34131','46015','0','1','1','1','1');


DELETE FROM creature WHERE id = 33167;
UPDATE `creature_template` SET `modelid1` = 11686, `modelid2` = 0 WHERE `entry` IN (33364, 33369, 33108, 33366);



UPDATE creature_model_info SET bounding_radius = 15, combat_reach = 10 WHERE modelid IN (29158, 29159, 29160);
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` = 33264; -- TODO
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'boss_flame_leviathan_defense_cannon' WHERE `entry` = 33139;

-- Mimiron modelids
UPDATE `creature_model_info` SET `bounding_radius` = 0.775, `combat_reach` = 7 WHERE `modelid` = 28831;
UPDATE `creature_model_info` SET `bounding_radius` = 0.775, `combat_reach` = 5 WHERE `modelid` = 28841;
UPDATE `creature_model_info` SET `bounding_radius` = 0.775, `combat_reach` = 4 WHERE `modelid` = 28979;

-- Flame Leviathan
UPDATE `creature_template` SET `mingold` = 1450000, `maxgold` = 1750000 WHERE `entry` = 33113;
UPDATE `creature_template` SET `mingold` = 2450000, `maxgold` = 2750000 WHERE `entry` = 34003;
-- Razorscale
UPDATE `creature_template` SET `mingold` = 1450000, `maxgold` = 1750000 WHERE `entry` = 33186;
UPDATE `creature_template` SET `mingold` = 2450000, `maxgold` = 2750000 WHERE `entry` = 33724;
-- Ignis
UPDATE `creature_template` SET `mingold` = 1450000, `maxgold` = 1750000 WHERE `entry` = 33118;
UPDATE `creature_template` SET `mingold` = 2450000, `maxgold` = 2750000 WHERE `entry` = 33190;
UPDATE `creature_template` SET `mechanic_immune_mask` = 536872986 WHERE `entry` IN (34234, 34235, 33237, 34105);
-- Magma Rager
UPDATE `creature_template` SET `mechanic_immune_mask` = 131072 WHERE `entry` IN (34086, 34201);
-- Robots
UPDATE `creature_template` SET `mechanic_immune_mask` = 8405008 WHERE `entry` IN (34085, 34186, 34274, 34268, 34272, 34270);
-- XT-002
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235 WHERE `entry` IN (33293, 33885, 33329, 33995);
UPDATE `creature_template` SET `mingold` = 3450000, `maxgold` = 3750000 WHERE entry = 33885;
UPDATE `creature_template` SET `mingold` = 1450000, `maxgold` = 1750000 WHERE entry = 33293;
-- Lightning charged dwarf
UPDATE `creature_template` SET `equipment_id` = 870, `mechanic_immune_mask` = 5 WHERE `entry` = 34237;
UPDATE `creature_template` SET `equipment_id` = 870, `mechanic_immune_mask` = 5 WHERE `entry` = 34199;
-- Hardened Iron Golem
UPDATE `creature_template` SET `mingold` = 24200, `maxgold` = 26200, `mechanic_immune_mask` = 64 WHERE `entry` = 34229;
UPDATE `creature_template` SET `mingold` = 14200, `maxgold` = 16200, `mechanic_immune_mask` = 64 WHERE `entry` = 34190;
-- Iron Mender
UPDATE `creature_template` SET `mingold` = 24200, `maxgold` = 26200, `mechanic_immune_mask` = 1 WHERE `entry` = 34236;
UPDATE `creature_template` SET `mingold` = 14200, `maxgold` = 16200, `mechanic_immune_mask` = 1 WHERE `entry` = 34198;
-- Runed Etched
UPDATE `creature_template` SET `mingold` = 24200, `maxgold` = 26200, `mechanic_immune_mask` = 64 WHERE `entry` = 34245;
UPDATE `creature_template` SET `mingold` = 14200, `maxgold` = 16200, `mechanic_immune_mask` = 64 WHERE `entry` = 34196;
-- Chamber Overseer
UPDATE `creature_template` SET `mingold` = 14600, `maxgold` = 18200, `mechanic_immune_mask` = 33554496 WHERE `entry` = 34226;
UPDATE `creature_template` SET `mingold` = 14600, `maxgold` = 18200, `mechanic_immune_mask` = 33554496 WHERE `entry` = 34197;
-- Storm Tempered Keeper
UPDATE `creature_template` SET `mingold` = 271000, `maxgold` = 276000, `mechanic_immune_mask` = 545260304 WHERE `entry` IN (33700, 33723);
UPDATE `creature_template` SET `mingold` = 71000, `maxgold` = 76000, `mechanic_immune_mask` = 545260304 WHERE `entry` IN (33699, 33722);
-- Auriaya
UPDATE `creature_template` SET `mingold` = 1460000, `maxgold` = 1520000, `mechanic_immune_mask` = 617299807 WHERE `entry` = 33515;
UPDATE `creature_template` SET `mingold` = 3460000, `maxgold` = 3520000, `mechanic_immune_mask` = 617299807, `flags_extra` = 1 WHERE `entry` = 34175;
-- Sanctum Sentry
UPDATE `creature_template` SET `baseattacktime` = 1500, `speed_walk` = 1.66667, `flags_extra` = 1 WHERE `entry` IN (34014, 34166);
-- Champion of Hodir
UPDATE `creature_template` SET `mingold` = 371000, `maxgold` = 376000, `mechanic_immune_mask` = 545267736 WHERE `entry` = 34139;
UPDATE `creature_template` SET `mingold` = 171000, `maxgold` = 176000, `mechanic_immune_mask` = 545267736 WHERE `entry` = 34133;
-- Winter revenant
UPDATE `creature_template` SET `mingold` = 171000, `maxgold` = 176000, `mechanic_immune_mask` = 2128 WHERE `entry` = 34141;
UPDATE `creature_template` SET `mingold` = 71000, `maxgold` = 76000, `mechanic_immune_mask` = 2128 WHERE `entry` = 34134;
-- Winter Rumbler
UPDATE `creature_template` SET `mingold` = 30300, `maxgold` = 32000, `mechanic_immune_mask` = 33554432 WHERE `entry` = 34142;
UPDATE `creature_template` SET `mingold` = 10300, `maxgold` = 12000, `mechanic_immune_mask` = 33554432 WHERE `entry` = 34135;
-- Arachnopod
UPDATE `creature_template` SET `mingold` = 205000, `maxgold` = 225000, `mechanic_immune_mask` = 8405008 WHERE `entry` = 34214;
UPDATE `creature_template` SET `mingold` = 105000, `maxgold` = 125000, `mechanic_immune_mask` = 8405008 WHERE `entry` = 34183;
-- Clockwork
UPDATE `creature_template` SET `mingold` = 17200, `maxgold` = 17600, `mechanic_immune_mask` = 8405008 WHERE `entry` = 34184;
UPDATE `creature_template` SET `mingold` = 27200, `maxgold` = 27600, `mechanic_immune_mask` = 8405008 WHERE `entry` = 34219;
-- Boomer XP-500
UPDATE `creature_template` SET `mechanic_immune_mask` = 8405008 WHERE `entry` = 34216;
UPDATE `creature_template` SET `mechanic_immune_mask` = 8405008 WHERE `entry` = 34192;
-- Trash
UPDATE `creature_template` SET `mechanic_immune_mask` = 8405008 WHERE `entry` = 34191;
UPDATE `creature_template` SET `mechanic_immune_mask` = 8405008 WHERE `entry` = 34217;
-- Clockwork sapper
UPDATE `creature_template` SET `mingold` = 37000, `maxgold` = 38200, `mechanic_immune_mask` = 8405008 WHERE `entry` = 34220;
UPDATE `creature_template` SET `mingold` = 17000, `maxgold` = 18200, `mechanic_immune_mask` = 8405008 WHERE `entry` = 34193;
-- Elders
UPDATE `creature_template` SET `mingold` = 625000, `maxgold` = 665000, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` IN (32914, 32913, 33391);
UPDATE `creature_template` SET `mingold` = 1805000, `maxgold` = 1855000, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` IN (33393, 33392, 33391);
-- Freya trash
UPDATE `creature_template` SET `mingold` = 625000, `maxgold` = 655000 WHERE `entry` = 33732;
UPDATE `creature_template` SET `mingold` = 75000, `maxgold` = 95000 WHERE `entry` = 33731;
UPDATE `creature_template` SET `mingold` = 125000, `maxgold` = 155000 WHERE `entry` IN (33733, 33734);
UPDATE `creature_template` SET `mingold` = 125000, `maxgold` = 155000 WHERE `entry` IN (33741, 33729);
UPDATE `creature_template` SET `mingold` = 125000, `maxgold` = 155000 WHERE `entry` IN (33735, 33737);
-- Dark Rune Thunderer, Ravager
UPDATE `creature_template` SET `baseattacktime` = 1500, `mechanic_immune_mask` = 545259541 WHERE `entry` IN (33754, 33755);
UPDATE `creature_template` SET `baseattacktime` = 1500, `mingold` = 71000, `maxgold` = 76000, `mechanic_immune_mask` = 545259541 WHERE `entry` = 33757;
UPDATE `creature_template` SET `baseattacktime` = 1500, `mingold` = 71000, `maxgold` = 76000, `mechanic_immune_mask` = 545259541 WHERE `entry` = 33758;
-- Twilight mobs
UPDATE `creature_template` SET `mingold` = 72000, `maxgold` = 76000, `mechanic_immune_mask` = 570425425 WHERE `entry` IN (33818, 33822, 33824, 33823);
UPDATE `creature_template` SET `mingold` = 272000, `maxgold` = 276000, `mechanic_immune_mask` = 570425425 WHERE `entry` = 33827;
UPDATE `creature_template` SET `mingold` = 72000, `maxgold` = 76000, `mechanic_immune_mask` = 570425425 WHERE `entry` = 33828;
UPDATE `creature_template` SET `baseattacktime` = 1000, `mingold` = 72000, `maxgold` = 76000, `mechanic_immune_mask` = 570425425 WHERE `entry` = 33831;
UPDATE `creature_template` SET `mingold` = 72000, `maxgold` = 76000, `mechanic_immune_mask` = 570425425 WHERE `entry` = 33832;
UPDATE `creature_template` SET `mingold` = 76000, `maxgold` = 79000, `mechanic_immune_mask` = 33554512 WHERE `entry` = 33773;
UPDATE `creature_template` SET `mingold` = 72000, `maxgold` = 76000, `mechanic_immune_mask` = 8388625 WHERE `entry` = 33830;
UPDATE `creature_template` SET `mingold` = 72000, `maxgold` = 76000, `mechanic_immune_mask` = 8388625 WHERE `entry` = 33829;
UPDATE `creature_template` SET `mingold` = 41000, `maxgold` = 46000, `mechanic_immune_mask` = 8519697 WHERE `entry` = 33839;
-- Hodir
UPDATE `creature_template` SET `mingold` = 0, `maxgold` = 0 WHERE `entry` IN (32845, 32846);
-- General Vezax
UPDATE `creature_template` SET `mingold` = 3450000, `maxgold` = 3750000, `mechanic_immune_mask` = 617299803, `flags_extra` = 257 WHERE `entry` = 33449;
UPDATE `creature_template` SET `mingold` = 1450000, `maxgold` = 1750000 WHERE `entry` = 33271;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235 WHERE `entry` = 33789;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 256 WHERE `entry` = 33524;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 256 WHERE `entry` = 34152;

UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16 WHERE `entry` = 34114;

-- Going Bearback
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = 29358, `ReqCreatureOrGOId2` = 29351 WHERE `entry` = 12851;
-- Cold Hearted
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = 29639, `ReqCreatureOrGOId2` = 0, `ReqCreatureOrGOCount2` = 0 WHERE `entry` = 12856;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16 WHERE `entry` = 29639;
-- The Last of Her Kind
DELETE FROM creature WHERE guid = 202998 OR id = 29563;
REPLACE INTO `creature` VALUES
(NULL, 29563, 571, 1, 4, 0, 0, 7290.31, -2027.52, 772.019, 2.38693, 300, 0, 0, 12600, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16 WHERE `entry` = 29563;
-- The Warm-Up
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = 29352 WHERE `entry` = 12996;
-- Prepare for Glory
DELETE FROM creature WHERE id = 29975;
REPLACE INTO `creature` VALUES
(NULL, 29975, 571, 1, 1, 0, 0, 6922.13, -1536.09, 835.689, 4.50129, 300, 0, 0, 12175, 0, 0, 0, 0, 0, 0);
-- The Drakkensryd
UPDATE `quest_template` SET `Method` = 0, `ReqCreatureOrGOId1` = 0, `ReqCreatureOrGOCount1` = 0 WHERE `entry` = 12886;

-- XT-002 correct vehicle id
UPDATE `creature_template` SET `VehicleId` = 353 WHERE `entry` = 33293;

-- Gravity Bomb
DELETE FROM spell_script_names WHERE spell_id IN (63025, 64233);
REPLACE INTO spell_script_names VALUES 
(63025, "spell_xt002_gravity_bomb"),
(64233, "spell_xt002_gravity_bomb");

-- Salvaged Chopper has faction dependent modelid
UPDATE `creature_template` SET `modelid2` = 0 WHERE `entry` = 33062;
-- Sanctum Sentry 25 damage nerf
UPDATE `creature_template` SET `dmg_multiplier` = 35 WHERE `entry` = 34166;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (33113, 33114, 33118, 33293, 33432, 33651);
REPLACE INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`quest_start`,`quest_start_active`,`quest_end`,`cast_flags`,`aura_required`,`aura_forbidden`,`user_type`) VALUES
(33113,46598,0,0,0,0,0,0,0), -- Flame Leviathan
(33114,46598,0,0,0,0,0,0,0), -- Flame Leviathan Seat
(33118,46598,0,0,0,0,0,0,0), -- Ignis
(33293,46598,0,0,0,0,0,0,0), -- XT-002
(33432,46598,0,0,0,0,0,0,0), -- Leviathan MK II
(33651,46598,0,0,0,0,0,0,0); -- VX-001

DELETE FROM vehicle_template_accessory WHERE entry = 32930;
REPLACE INTO vehicle_template_accessory VALUES 
(32930, 32933, 0, 1, "Kologarn - Left Arm", 6, 30000),
(32930, 32934, 1, 1, "Kologarn - Right Arm", 6, 30000);

-- Sara
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235, `flags_extra` = 1, `ScriptName` = 'boss_sara' WHERE `entry` IN (33134, 34332);
UPDATE creature_model_info SET bounding_radius = 0.465, combat_reach = 45 WHERE modelid = 29117;
UPDATE `creature` SET `spawndist` = 0 WHERE `id` = 33134;
-- Ominous cloud
DELETE FROM `creature` WHERE `id`=33292;
UPDATE `creature_template` SET `ScriptName` = 'npc_ominous_cloud' WHERE `entry` = 33292;
-- Guardian of Yogg-Saron
UPDATE `creature_template` SET `difficulty_entry_1` = 33968, `faction_A` = 14, `faction_H` = 14, `ScriptName` = 'npc_guardian_yoggsaron' WHERE `entry` = 33136;
UPDATE `creature_template` SET `minlevel` = 82, `maxlevel` = 82, `faction_A` = 14, `faction_H` = 14 WHERE `entry` = 33968;
UPDATE creature_model_info SET bounding_radius = 0.62, combat_reach = 1.5 WHERE modelid = 28465;
-- Yogg-Saron
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mechanic_immune_mask` = 650854235, `ScriptName` = 'boss_yoggsaron' WHERE `entry` = 33288;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mechanic_immune_mask` = 650854235, `flags_extra` = 1 WHERE `entry` = 33955;
UPDATE creature_model_info SET bounding_radius = 0.755, combat_reach = 18 WHERE modelid = 28817;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `speed_walk` = 2, `ScriptName` = 'npc_death_orb' WHERE `entry` = 33882;
-- Brain of Yogg-Saron
UPDATE `creature_template` SET `difficulty_entry_1` = 33954, `faction_A` = 14, `faction_H` = 14, `mechanic_immune_mask` = 650854235, `ScriptName` = 'boss_brain_yoggsaron' WHERE `entry` = 33890;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mechanic_immune_mask` = 650854235 WHERE `entry` = 33954;
UPDATE creature_model_info SET bounding_radius = 0.755, combat_reach = 30 WHERE modelid = 28951;
-- Illusions
UPDATE `creature_template` SET `minlevel` = 82, `maxlevel` = 82, `faction_A` = 14, `faction_H` = 14, `ScriptName` = 'npc_laughing_skull' WHERE `entry` = 33990;
UPDATE `creature_template` SET `minlevel` = 82, `maxlevel` = 82, `faction_A` = 7, `faction_H` = 7, `mechanic_immune_mask` = 650854235, `ScriptName` = 'npc_illusion' WHERE `entry` IN (33433, 33716, 33717, 33719, 33720, 33567);
UPDATE creature_model_info SET bounding_radius = 0.306, combat_reach = 1.5 WHERE modelid = 28621;
UPDATE creature_model_info SET bounding_radius = 1, combat_reach = 10 WHERE modelid IN (2718, 1687, 2717, 12869);
-- Influence Tentacle
UPDATE `creature_template` SET `difficulty_entry_1` = 33959, `minlevel` = 82, `maxlevel` = 82, `faction_A` = 14, `faction_H` = 14 WHERE `entry` = 33943;
UPDATE `creature_template` SET `minlevel` = 82, `maxlevel` = 82, `faction_A` = 14, `faction_H` = 14 WHERE `entry` = 33959;
UPDATE creature_model_info SET bounding_radius = 0.306, combat_reach = 1.5 WHERE modelid = 28813;
-- Fake npcs
UPDATE `creature_template` SET ScriptName = "npc_passive_illusion" WHERE `entry` IN (33436, 33437, 33536, 33535, 33495, 33523, 33441, 33442);
-- Whispers
UPDATE `script_texts` SET `type` = 4 WHERE `entry` IN (-1603317, -1603340, -1603339);
-- Descend into madness portal
UPDATE `creature_template` SET `npcflag` = 16777216, `unit_flags` = 2, `type_flags` = 0, `ScriptName` = 'npc_descend_into_madness' WHERE `entry` = 34072;
DELETE FROM `creature_template` WHERE entry IN (34122, 34123);
REPLACE INTO `creature_template` VALUES
('34122','0','0','0','0','0','29074','0','0','0','Descend Into Madness','','Interact','0','81','81','0','35','35','16777216','1','1.14286','1','0','0','0','0','0','1','2000','0','1','2','0','0','0','0','0','0','0','0','0','10','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','0','0','0','0','0','0','0','0','1','0','0','0','npc_descend_into_madness','11159'),
('34123','0','0','0','0','0','29074','0','0','0','Descend Into Madness','','Interact','0','81','81','0','35','35','16777216','1','1.14286','1','0','0','0','0','0','1','2000','0','1','2','0','0','0','0','0','0','0','0','0','10','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','0','0','0','0','0','0','0','0','1','0','0','0','npc_descend_into_madness','11159');
-- Flee to the Surface
UPDATE `gameobject_template` SET `data10` = 63992 WHERE `entry` = 194625;
DELETE FROM `gameobject` WHERE `id` = 194625;
REPLACE INTO `gameobject` VALUES
(NULL, 194625, 603, 3, 1, 1996.41, -0.070, 240.59, 0, 0, 0, 1, 0, 300, 0, 1),
(NULL, 194625, 603, 3, 1, 1949.63, -26.07, 241.25, 0, 0, 0, 1, 0, 300, 0, 1),
(NULL, 194625, 603, 3, 1, 1995.03, -52.98, 241.02, 0, 0, 0, 1, 0, 300, 0, 1);
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (34072, 34122, 34123);
REPLACE INTO `npc_spellclick_spells` VALUES
(34072, 63989, 0, 0, 0, 3, 0, 0, 0), -- Stormwind
(34122, 63997, 0, 0, 0, 3, 0, 0, 0), -- Chamber
(34123, 63998, 0, 0, 0, 3, 0, 0, 0); -- Icecrown
-- Cancel Illusion Room Aura
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 63992;
REPLACE INTO `spell_linked_spell` VALUES
(63992, -63988, 0, "Cancel Illusion Room Aura");
-- Dragon blood
DELETE FROM gameobject WHERE id = 194462;
REPLACE INTO gameobject VALUES (NULL, 194462, 603, 3, 1, 2104.35, -25.3753, 242.647, 0, 0, 0, 0, -1, 300, 0, 1);
-- Remove spawned mobs
-- DELETE FROM `creature` WHERE `id`=34137 AND position_x = 1921.84;
-- Portals coordinates
DELETE FROM `spell_target_position` WHERE `id` IN (63989, 63992, 63997, 63998);
REPLACE INTO `spell_target_position` VALUES
(63989, 603, 1953.91, 21.91, 239.71, 2.08),
(63992, 603, 1980.28, -25.59, 329.40, 3.14),
(63997, 603, 2042.02, -25.54, 239.72, 0),
(63998, 603, 1948.44, -82.04, 239.99, 4.18);
-- Tentacles
UPDATE `creature_template` SET `difficulty_entry_1` = 33984, `faction_A` = 14, `faction_H` = 14, `ScriptName` = "npc_constrictor_tentacle" WHERE `entry` = 33983;
UPDATE `creature_template` SET `minlevel` = 82, `maxlevel` = 82, `faction_A` = 14, `faction_H` = 14, `VehicleId` = 385 WHERE `entry` = 33984;
UPDATE creature_model_info SET bounding_radius = 0.306, combat_reach = 1.5 WHERE modelid = 28815;
-- Constrictor vehicle
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = 33983;
REPLACE INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`quest_start`,`quest_start_active`,`quest_end`,`cast_flags`,`aura_required`,`aura_forbidden`,`user_type`) VALUES
(33983,46598,0,0,0,0,0,0,0);
UPDATE `creature_template` SET `difficulty_entry_1` = 33967, `faction_A` = 14, `faction_H` = 14, `baseattacktime` = 1800, `ScriptName` = 'npc_crusher_tentacle' WHERE `entry` = 33966;
UPDATE `creature_template` SET `minlevel` = 81, `maxlevel` = 81, `faction_A` = 14, `faction_H` = 14, `baseattacktime` = 1800 WHERE `entry` = 33967;
UPDATE creature_model_info SET bounding_radius = 0.985, combat_reach = 5 WHERE modelid = 28814;
UPDATE `creature_template` SET `difficulty_entry_1` = 33986, `faction_A` = 14, `faction_H` = 14, `ScriptName` = 'npc_corruptor_tentacle' WHERE `entry` = 33985;
UPDATE `creature_template` SET `minlevel` = 82, `maxlevel` = 82, `faction_A` = 14, `faction_H` = 14 WHERE `entry` = 33986;
-- Immortal Guardian
UPDATE `creature_template` SET `difficulty_entry_1` = 33989, `faction_A` = 14, `faction_H` = 14, `mechanic_immune_mask` = 650854235, `ScriptName` = 'npc_immortal_guardian' WHERE `entry` = 33988;
UPDATE `creature_template` SET `minlevel` = 82, `maxlevel` = 82, `faction_A` = 14, `faction_H` = 14, `mechanic_immune_mask` = 650854235 WHERE `entry` = 33989;
UPDATE creature_model_info SET bounding_radius = 0.92, combat_reach = 4 WHERE modelid = 29024;
-- Remove area stun
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (64059, 65238);
REPLACE INTO `spell_linked_spell` VALUES
(64059, 65238, 0, "Shattered illusion remove"),
(65238, -64173, 1, "Shattered illusion remove");
-- Yogg-Saron emotes
DELETE FROM script_texts WHERE entry IN (-1603342, -1603343, -1603344);
REPLACE INTO script_texts VALUES 
(33288, -1603342, "Portals open into Yogg-Saron's mind!", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 5, 0, 0, "YoggSaron EMOTE_PORTALS"),
(33288, -1603343, "The Illusion shatters and a path to the central chamber opens!", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 5, 0, 0, "YoggSaron EMOTE_OPEN_CHAMBER"),
(33288, -1603344, "Yogg-Saron prepares to unleash Empowering Shadows!", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 5, 0, 0, "YoggSaron EMOTE_EMPOWERING");
-- Ulduar Keepers Images
DELETE FROM `creature` WHERE `id` IN (33213, 33241, 33242, 33244);
REPLACE INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(33241, 603, 3, 1, 0, 0, 2057.81, -24.0768, 421.532, 3.12904, 604800, 0, 0, 14433075, 0, 0, 0),
(33242, 603, 3, 1, 0, 0, 2036.81, -73.7053, 411.353, 2.43575, 604800, 0, 0, 14433075, 0, 0, 0),
(33244, 603, 3, 1, 0, 0, 2036.74, 25.4642, 411.357, 3.81412, 604800, 0, 0, 14433075, 0, 0, 0),
(33213, 603, 3, 1, 0, 0, 1939.29, -90.6994, 411.357, 1.02595, 604800, 0, 0, 14433075, 0, 0, 0);

UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35, `npcflag` = 1, `flags_extra` = 2, `ScriptName` = 'npc_keeper_image' WHERE `entry` IN (33213, 33241, 33242, 33244);

-- Keepers (Yogg Saron Encounter)
DELETE FROM `creature` WHERE `id` IN (33410, 33411, 33412, 33413);
REPLACE INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(33410, 603, 3, 1, 0, 0, 2036.739, 25.464, 338.296, 3.814, 604800, 0, 0, 14433075, 0, 0, 0),
(33411, 603, 3, 1, 0, 0, 1939.094, -90.699, 338.296, 1.026, 604800, 0, 0, 14433075, 0, 0, 0),
(33412, 603, 3, 1, 0, 0, 1939.094, 42.534, 338.296, 5.321, 604800, 0, 0, 14433075, 0, 0, 0),
(33413, 603, 3, 1, 0, 0, 2036.739, -73.705, 338.296, 2.435, 604800, 0, 0, 14433075, 0, 0, 0);

UPDATE `creature_template` SET `ScriptName` = 'npc_ys_freya' WHERE `entry` = 33410;
UPDATE `creature_template` SET `ScriptName` = 'npc_ys_hodir' WHERE `entry` = 33411;
UPDATE `creature_template` SET `ScriptName` = 'npc_ys_mimiron' WHERE `entry` = 33412;
UPDATE `creature_template` SET `ScriptName` = 'npc_ys_thorim' WHERE `entry` = 33413;
UPDATE `creature_template` SET `ScriptName` = 'npc_sanity_well' WHERE `entry` = 33991;

-- Death Ray Target
DELETE FROM conditions WHERE SourceEntry IN (63882, 63886);
REPLACE INTO conditions VALUES 
(13, 0, 63882, 0, 18, 1, 33134, 0, 0, '', 'Death Ray Warning (Yogg-Saron)'),
(13, 0, 63886, 0, 18, 1, 33134, 0, 0, '', 'Death Ray Damage (Yogg-Saron)');

-- Shattered Illusion Targets
DELETE FROM conditions WHERE SourceEntry = 64173;
REPLACE INTO conditions VALUES 
(13, 0, 64173, 0, 18, 1, 33966, 0, 0, '', 'Shattered Illusion (Yogg-Saron)'),
(13, 0, 64173, 0, 18, 1, 33983, 0, 0, '', 'Shattered Illusion (Yogg-Saron)'),
(13, 0, 64173, 0, 18, 1, 33985, 0, 0, '', 'Shattered Illusion (Yogg-Saron)');

-- Thorim's Titanic Storm
DELETE FROM conditions WHERE SourceEntry = 64172;
REPLACE INTO conditions VALUES 
(13, 0, 64172, 0, 18, 1, 33988, 0, 0, '', 'Thorim''s Titanic Storm (Yogg-Saron)');

-- Empowering Shadows
DELETE FROM conditions WHERE SourceEntry = 64468;
REPLACE INTO conditions VALUES 
(13, 0, 64468, 0, 18, 1, 33288, 0, 0, '', 'Empowering Shadows (Yogg-Saron)'),
(13, 0, 64468, 0, 18, 1, 33988, 0, 0, '', 'Empowering Shadows (Yogg-Saron)');

-- Shadow Nova Target
DELETE FROM conditions WHERE SourceEntry IN (62714, 65209);
REPLACE INTO conditions VALUES 
(13, 0, 62714, 0, 18, 1, 33134, 0, 0, '', 'Shadow Nova (Yogg-Saron)'),
(13, 0, 65209, 0, 18, 1, 33134, 0, 0, '', 'Shadow Nova (Yogg-Saron)');

-- Spell Scripts
DELETE FROM spell_script_names WHERE spell_id IN (64164, 64168, 64059);
REPLACE INTO spell_script_names VALUES 
(64164, "spell_yoggsaron_lunatic_gaze"),
(64168, "spell_yoggsaron_lunatic_gaze"),
(64059, "spell_yoggsaron_induce_madness");