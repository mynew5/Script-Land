-- **********************************************
-- LoE World changeset   Rev 2
-- **********************************************

-- renew waypoints 20.8.2012
set @spawnid = 7789;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, -5563.04, -1727.40, 343.16, 3000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, -5558.25, -1725.93, 342.45, 3000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 3, -5556.14, -1729.21, 342.51, 3000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 4, -5560.02, -1731.05, 343.03, 3000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 5, -5557.96, -1727.13, 342.50, 3000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 6, -5560.36, -1720.65, 342.41, 3000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 7, -5565.03, -1722.12, 342.62, 3000, 0, 0, 0, 0, 0, 0, 0);

-- renew waypoints 20.8.2012
set @spawnid = 7722;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, -5714.19, -1689.64, 361.84, 2000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, -5715.20, -1686.13, 361.54, 3000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 3, -5708.50, -1688.81, 361.08, 3000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 4, -5710.80, -1690.52, 361.71, 4000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 5, -5714.11, -1686.15, 361.39, 3000, 0, 0, 0, 0, 0, 0, 0);

-- renew waypoints 20.8.2012
set @spawnid = 62904;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, 8429.16, -7560.71, 174.53, 3000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, 8427.20, -7547.50, 174.46, 2000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 3, 8414.04, -7546.35, 174.57, 3000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 4, 8408.76, -7558.67, 174.48, 3000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 5, 8419.89, -7565.41, 174.55, 4000, 0, 0, 0, 0, 0, 0, 0);

UPDATE creature_spawns SET position_z=126.171 WHERE id=5467;
UPDATE creature_spawns SET position_z=126.171 WHERE id=5468;
UPDATE creature_spawns SET position_z= 115.862 WHERE id=1711;

set @spawnid = 32437;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, -5043.92, -2381.23, -54.40, 5000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, -5038.03, -2381.62, -54.18, 2000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 3, -5042.95, -2377.44, -55.12, 2000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 4, -5055.98, -2376.44, -54.05, 3000, 0, 0, 0, 0, 0, 0, 0);


-- .worldport 530 8687.39 -6347.41 55.92
set @spawnid = 66211;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;

set @spawnid = 66212;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;

set @spawnid = 69235;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;

set @spawnid = 69236;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, 8672.46, -6319.23, 55.96, 7000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, 8666.17, -6317.44, 55.96, 6000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 3, 8661.49, -6315.10, 55.97, 5000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 4, 8668.96, -6313.82, 55.97, 9000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 5, 8680.36, -6316.90, 55.97, 8000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 6, 8675.22, -6322.05, 55.95, 8000, 0, 0, 0, 0, 0, 0, 0);

set @spawnid = 69237;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, 8672.80, -6321.14, 55.95, 4000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, 8669.29, -6326.37, 55.94, 9000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 3, 8667.96, -6332.26, 55.93, 7000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 4, 8659.02, -6330.27, 55.93, 6000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 5, 8661.00, -6323.71, 55.94, 5000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 6, 8665.75, -6323.26, 55.94, 3000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 7, 8671.13, -6319.69, 55.95, 3000, 0, 0, 0, 0, 0, 0, 0);

set @spawnid = 69238;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;

set @spawnid = 69239;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;

set @spawnid = 69240;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;

set @spawnid = 69241;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;

set @spawnid = 69243;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;

set @spawnid = 69244;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, 8684.90, -6364.54, 55.93, 7000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, 8690.10, -6359.21, 55.92, 8000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 3, 8691.00, -6353.45, 55.95, 8000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 4, 8686.97, -6347.22, 55.91, 6000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 5, 8683.73, -6349.48, 55.90, 5000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 6, 8685.40, -6355.60, 55.85, 9000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 7, 8685.52, -6359.70, 55.85, 8000, 0, 0, 0, 0, 0, 0, 0);

set @spawnid = 69245;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;

set @spawnid = 69246;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;

set @spawnid = 69247;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;

set @spawnid = 69248;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, 8679.87, -6341.92, 55.92, 8000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, 8684.28, -6338.10, 55.94, 9000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 3, 8689.23, -6334.26, 55.95, 9000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 4, 8681.00, -6329.21, 55.95, 7000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 5, 8676.56, -6334.83, 55.93, 5000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 6, 8680.81, -6337.05, 55.93, 4000, 0, 0, 0, 0, 0, 0, 0);

set @spawnid = 69249;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;

set @spawnid = 69250;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;

-- 26.8.2012
-- delete double chests
DELETE from gameobject_spawns WHERE Entry=2843 AND (orientation3=0 OR orientation3=1);
DELETE from gameobject_spawns WHERE Entry=106318 AND orientation3>0 AND orientation3<1;
DELETE from gameobject_spawns WHERE Entry=106319 AND orientation3>0 AND orientation3<1;
DELETE from gameobject_spawns WHERE Entry=2844 AND orientation3>0 AND orientation3<1;
DELETE from gameobject_spawns WHERE Entry=2849 AND orientation3>0 AND orientation3<1;
DELETE from gameobject_spawns WHERE Entry=4149 AND orientation3>0 AND orientation3<1;

ALTER TABLE gameobject_names CHANGE sound1 sound1 INT( 10 ) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Not Sound! See Wiki!';
ALTER TABLE gameobject_names CHANGE sound2 sound2 INT( 10 ) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Not Sound! See Wiki!';
ALTER TABLE gameobject_names CHANGE sound3 sound3 INT( 10 ) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Not Sound! See Wiki!';
ALTER TABLE gameobject_names CHANGE sound4 sound4 INT( 10 ) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Not Sound! See Wiki!';
ALTER TABLE gameobject_names CHANGE sound5 sound5 INT( 10 ) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Not Sound! See Wiki!';
ALTER TABLE gameobject_names CHANGE sound6 sound6 INT( 10 ) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Not Sound! See Wiki!';
ALTER TABLE gameobject_names CHANGE sound7 sound7 INT( 10 ) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Not Sound! See Wiki!';
ALTER TABLE gameobject_names CHANGE sound8 sound8 INT( 10 ) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Not Sound! See Wiki!';
ALTER TABLE gameobject_names CHANGE sound9 sound9 INT( 10 ) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Not Sound! See Wiki!';

UPDATE creature_spawns SET position_x=9797.3, position_y=-7301.8, position_z=14.66, orientation=3.15 WHERE id=76571;

--  28.8.2012
-- bloodelve mages speaks wrong language
UPDATE npc_text SET lang0=0 WHERE entry=538;
UPDATE npc_text SET lang0=0 WHERE entry=539;

UPDATE gameobject_names SET sound3=0, spellfocus=0 WHERE entry = 179697; -- gurubashi chest

UPDATE creature_spawns SET flags=32832 WHERE entry=37134; -- make it attackable and selectable
UPDATE creature_spawns SET flags=32832 WHERE entry=37127; -- make it attackable and selectable 
UPDATE creature_proto SET npcflags = 2  WHERE entry = 25590;  
UPDATE creature_proto SET npcflags = 2  WHERE entry = 20735;  


--  30.8.2012
DELETE FROM reputation_creature_onkill WHERE creature_id=14881;
DELETE FROM creature_spawns WHERE entry=23988;  -- remove Michael Schweitzer

-- .worldport 0 873.19 1232.17 52.60
set @spawnid = 12750;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, 866.53, 1233.38, 52.60, 3000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, 871.87, 1237.39, 52.60, 5000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 3, 874.19, 1230.91, 52.60, 3000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 4, 869.42, 1229.01, 52.60, 10000, 0, 0, 0, 0, 0, 0, 0);

set @spawnid = 12780;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, 875.23, 1229.06, 47.84, 4000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, 884.39, 1231.31, 47.84, 5000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 3, 880.82, 1231.85, 47.84, 6000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 4, 872.28, 1232.61, 47.82, 8000, 0, 0, 0, 0, 0, 0, 0);

set @spawnid = 12782;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, 883.29, 1238.62, 52.60, 3000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, 887.31, 1237.92, 52.59, 5000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 3, 888.67, 1230.91, 52.59, 3000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 4, 885.24, 1228.32, 52.56, 5000, 0, 0, 0, 0, 0, 0, 0);

-- 31.8.2012

-- NPC 4217 bekommt statt quest 26 die quest 27
UPDATE creature_quest_starter SET quest=27 WHERE id=4217 AND quest=26;
-- NPC 3033 bekommt statt quest 27 die quest 26
UPDATE creature_quest_starter SET quest=26 WHERE id=3033 AND quest=27;

-- switches id 26 with 27 in 3 steps
-- delete 26+27
DELETE FROM quests WHERE entry=26;
DELETE FROM quests WHERE entry=27;
-- data of ex 27 to 26
INSERT INTO quests (entry, ZoneId, sort, flags, MinLevel, questlevel, `Type`, RequiredRaces, RequiredClass, RequiredTradeskill, RequiredTradeskillValue, RequiredRepFaction, RequiredRepValue, LimitTime, SpecialFlags, PrevQuestId, NextQuestId, srcItem, SrcItemCount, Title, Details, Objectives, CompletionText, IncompleteText, EndText, ObjectiveText1, ObjectiveText2, ObjectiveText3, ObjectiveText4, ReqItemId1, ReqItemId2, ReqItemId3, ReqItemId4, ReqItemId5, ReqItemId6, ReqItemCount1, ReqItemCount2, ReqItemCount3, ReqItemCount4, ReqItemCount5, ReqItemCount6, ReqKillMobOrGOId1, ReqKillMobOrGOId2, ReqKillMobOrGOId3, ReqKillMobOrGOId4, ReqKillMobOrGOCount1, ReqKillMobOrGOCount2, ReqKillMobOrGOCount3, ReqKillMobOrGOCount4, ReqCastSpellId1, ReqCastSpellId2, ReqCastSpellId3, ReqCastSpellId4, ReqEmoteId1, ReqEmoteId2, ReqEmoteId3, ReqEmoteId4, RewChoiceItemId1, RewChoiceItemId2, RewChoiceItemId3, RewChoiceItemId4, RewChoiceItemId5, RewChoiceItemId6, RewChoiceItemCount1, RewChoiceItemCount2, RewChoiceItemCount3, RewChoiceItemCount4, RewChoiceItemCount5, RewChoiceItemCount6, RewItemId1, RewItemId2, RewItemId3, RewItemId4, RewItemCount1, RewItemCount2, RewItemCount3, RewItemCount4, RewRepFaction1, RewRepFaction2, RewRepFaction3, RewRepFaction4, RewRepFaction5, RewRepFaction6, RewRepValue1, RewRepValue2, RewRepValue3, RewRepValue4, RewRepValue5, RewRepValue6, RewRepLimit, RewMoney, RewXP, RewSpell, CastSpell, MailTemplateId, MailDelaySecs, MailSendItem, PointMapId, PointX, PointY, PointOpt, RewardMoneyAtMaxLevel, ExploreTrigger1, ExploreTrigger2, ExploreTrigger3, ExploreTrigger4, RequiredOneOfQuest, RequiredQuest1, RequiredQuest2, RequiredQuest3, RequiredQuest4, RemoveQuests, ReceiveItemId1, ReceiveItemId2, ReceiveItemId3, ReceiveItemId4, ReceiveItemCount1, ReceiveItemCount2, ReceiveItemCount3, ReceiveItemCount4, IsRepeatable, bonushonor, bonusarenapoints, rewardtitleid, rewardtalents, suggestedplayers, detailemotecount, detailemote1, detailemote2, detailemote3, detailemote4, detailemotedelay1, detailemotedelay2, detailemotedelay3, detailemotedelay4, completionemotecnt, completionemote1, completionemote2, completionemote3, completionemote4, completionemotedelay1, completionemotedelay2, completionemotedelay3, completionemotedelay4, completeemote, incompleteemote, iscompletedbyspelleffect, RewXPId) VALUES
(26, 0, 263, 8, 16, -1, 0, 32, 1024, 0, 0, 0, 0, 0, 0, 0, 28, 0, 0, 'A Lesson to Learn', '$N, I have been following your progress with much delight.  You are most assuredly developing yourself into a valued protector of nature.$B$BThe time has come for you to learn more about one of the various animal aspects that Cenarius has blessed us with the ability to change into - one that affords you command and mastery of the water.  For this, you must travel to the village of Nighthaven in Moonglade and speak with Dendrite Starblaze of the Cenarion Circle there.  He will guide you further.', 'Speak with Dendrite Starblaze in the village of Nighthaven, Moonglade.', 'Salutations, young $C; the time has come for you to know our aquatic form. It is one that lets you move freely and indefinitely through water. You will find this aspect a useful tool and a blessing... but it is one that must be earned before it is mastered.$B$BYou will face two trials to overcome. The first will test your ability to work in water under pressure. The second will test your resolve to understand the aspects of the form itself.$B$BStand ready, as the time of testing is now upon us.', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90, 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1);
-- data of ex 26 to 27
INSERT INTO quests (entry, ZoneId, sort, flags, MinLevel, questlevel, `Type`, RequiredRaces, RequiredClass, RequiredTradeskill, RequiredTradeskillValue, RequiredRepFaction, RequiredRepValue, LimitTime, SpecialFlags, PrevQuestId, NextQuestId, srcItem, SrcItemCount, Title, Details, Objectives, CompletionText, IncompleteText, EndText, ObjectiveText1, ObjectiveText2, ObjectiveText3, ObjectiveText4, ReqItemId1, ReqItemId2, ReqItemId3, ReqItemId4, ReqItemId5, ReqItemId6, ReqItemCount1, ReqItemCount2, ReqItemCount3, ReqItemCount4, ReqItemCount5, ReqItemCount6, ReqKillMobOrGOId1, ReqKillMobOrGOId2, ReqKillMobOrGOId3, ReqKillMobOrGOId4, ReqKillMobOrGOCount1, ReqKillMobOrGOCount2, ReqKillMobOrGOCount3, ReqKillMobOrGOCount4, ReqCastSpellId1, ReqCastSpellId2, ReqCastSpellId3, ReqCastSpellId4, ReqEmoteId1, ReqEmoteId2, ReqEmoteId3, ReqEmoteId4, RewChoiceItemId1, RewChoiceItemId2, RewChoiceItemId3, RewChoiceItemId4, RewChoiceItemId5, RewChoiceItemId6, RewChoiceItemCount1, RewChoiceItemCount2, RewChoiceItemCount3, RewChoiceItemCount4, RewChoiceItemCount5, RewChoiceItemCount6, RewItemId1, RewItemId2, RewItemId3, RewItemId4, RewItemCount1, RewItemCount2, RewItemCount3, RewItemCount4, RewRepFaction1, RewRepFaction2, RewRepFaction3, RewRepFaction4, RewRepFaction5, RewRepFaction6, RewRepValue1, RewRepValue2, RewRepValue3, RewRepValue4, RewRepValue5, RewRepValue6, RewRepLimit, RewMoney, RewXP, RewSpell, CastSpell, MailTemplateId, MailDelaySecs, MailSendItem, PointMapId, PointX, PointY, PointOpt, RewardMoneyAtMaxLevel, ExploreTrigger1, ExploreTrigger2, ExploreTrigger3, ExploreTrigger4, RequiredOneOfQuest, RequiredQuest1, RequiredQuest2, RequiredQuest3, RequiredQuest4, RemoveQuests, ReceiveItemId1, ReceiveItemId2, ReceiveItemId3, ReceiveItemId4, ReceiveItemCount1, ReceiveItemCount2, ReceiveItemCount3, ReceiveItemCount4, IsRepeatable, bonushonor, bonusarenapoints, rewardtitleid, rewardtalents, suggestedplayers, detailemotecount, detailemote1, detailemote2, detailemote3, detailemote4, detailemotedelay1, detailemotedelay2, detailemotedelay3, detailemotedelay4, completionemotecnt, completionemote1, completionemote2, completionemote3, completionemote4, completionemotedelay1, completionemotedelay2, completionemotedelay3, completionemotedelay4, completeemote, incompleteemote, iscompletedbyspelleffect, RewXPId) VALUES
(27, 0, 263, 8, 16, -1, 0, 8, 1024, 0, 0, 0, 0, 0, 0, 0, 29, 0, 0, 'A Lesson to Learn', '$N, I have been following your progress with much delight.  You are most assuredly developing yourself into a valued protector of nature.$B$BThe time has come for you to learn more about one of the various animal aspects that Cenarius has blessed us with the ability to change into - one that affords you command and mastery of the water.  For this, you must travel to the village of Nighthaven in Moonglade and speak with Dendrite Starblaze of the Cenarion Circle there.  He will guide you further.', 'Speak with Dendrite Starblaze in the village of Nighthaven, Moonglade.', 'Salutations, young $C; the time has come for you to know our aquatic form. It is one that lets you move freely and indefinitely through water. You will find this aspect a useful tool and a blessing... but it is one that must be earned before it is mastered.$B$BYou will face two trials to overcome. The first will test your ability to work in water under pressure. The second will test your resolve to understand the aspects of the form itself.$B$BStand ready, as the time of testing is now upon us.', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90, 0, 0, 0, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1);


-- 8.9.2012
set @spawnid = 65949;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, 6641.46, -7405.60, 65.09, 3000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, 6644.93, -7411.52, 65.00, 3000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 3, 6652.66, -7404.88, 65.18, 7000, 0, 0, 0, 0, 0, 0, 0);

set @spawnid = 65950;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, 6667.38, -7405.30, 58.41, 3000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, 6665.10, -7406.47, 60.13, 4000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 3, 6661.88, -7406.92, 62.28, 9000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 4, 6656.39, -7405.66, 64.93, 8000, 0, 0, 0, 0, 0, 0, 0);

set @spawnid = 65959;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, 6657.99, -7387.73, 57.55, 6000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, 6652.52, -7394.84, 57.55, 7000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 3, 6651.82, -7403.97, 57.55, 7000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 4, 6655.33, -7407.60, 57.55, 7000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 5, 6658.05, -7402.19, 57.55, 7000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 6, 6657.91, -7396.95, 57.55, 4000, 0, 0, 0, 0, 0, 0, 0);

set @spawnid = 65934;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, 6662.82, -7383.69, 70.47, 8000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, 6648.00, -7388.40, 70.49, 6000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 3, 6648.43, -7400.05, 70.68, 8000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 4, 6652.82, -7401.05, 70.63, 6000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 5, 6657.08, -7393.20, 70.47, 6000, 0, 0, 0, 0, 0, 0, 0);

set @spawnid = 65955;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, 6675.00, -7392.96, 57.55, 5000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, 6675.81, -7399.09, 57.55, 3000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 3, 6671.60, -7395.59, 57.55, 7000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 4, 6668.78, -7387.28, 57.55, 9000, 0, 0, 0, 0, 0, 0, 0);

set @spawnid = 65956;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, 6677.86, -7399.73, 70.54, 5000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, 6672.58, -7388.11, 70.61, 8000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 3, 6671.46, -7396.91, 70.52, 6000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 4, 6667.56, -7405.67, 70.47, 8000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 5, 6656.60, -7407.09, 70.63, 5000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 6, 6664.28, -7412.39, 70.43, 7000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 7, 6672.29, -7409.96, 70.55, 3000, 0, 0, 0, 0, 0, 0, 0);

-- .worldport 530 6471.25 -6427.12 50.15
set @spawnid = 65265;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;
INSERT INTO creature_waypoints (spawnid, waypointid, position_x, position_y, position_z, waittime, flags, forwardemoteoneshot, forwardemoteid, backwardemoteoneshot, backwardemoteid, forwardskinid, backwardskinid) VALUES
(@spawnid, 1, 6463.86, -6443.44, 52.43, 5000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 2, 6465.77, -6447.85, 52.46, 4000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 3, 6464.93, -6443.64, 52.37, 4000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 4, 6469.40, -6440.22, 49.84, 9000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 5, 6465.16, -6440.40, 51.80, 6000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 6, 6462.38, -6440.19, 52.43, 3000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 7, 6460.55, -6436.55, 52.43, 3000, 0, 0, 0, 0, 0, 0, 0),
(@spawnid, 8, 6461.74, -6440.17, 52.47, 3000, 0, 0, 0, 0, 0, 0, 0);

set @spawnid = 65445;
DELETE FROM creature_waypoints WHERE spawnid = @spawnid;

-- Alterac Valley - unneeded spawns
DELETE FROM `creature_spawns` WHERE `map` = '30' AND `entry` IN('11947', '11949');

-- Kirgaraak
DELETE FROM `creature_waypoints` WHERE `spawnid`=121741;
UPDATE `creature_proto` SET `invisibility_type`=0 WHERE `entry`=24921;
UPDATE `creature_spawns` SET `channel_spell` = '54324', `channel_target_sqlid_creature` = '121741' WHERE `id` IN ('100595', '100596', '100597', '100598', '100599', '100600', '100601', '100602', '100603', '100604', '100605', '100606', '100607');

ALTER TABLE db_version DROP INDEX db_name, ADD UNIQUE db_name ( db_name );
UPDATE db_version SET db_name='LoE World', revision=2 WHERE db_name='LoE';