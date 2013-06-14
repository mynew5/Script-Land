/**********************************************
 LoE World changeset   Rev 8  
 23.Feb.2013
**********************************************/

-- 27.1.2013
UPDATE quests SET RequiredQuest1=0 WHERE entry=2999;

-- 2.2.2013 Thanks to Sirala
UPDATE creature_proto SET npcflags= 2 WHERE entry = 30364;
UPDATE creature_proto SET npcflags= 2 WHERE entry = 30368;
UPDATE creature_proto SET npcflags= 2 WHERE entry = 30373;
UPDATE creature_proto SET npcflags= 2 WHERE entry = 30374;
UPDATE creature_proto SET npcflags= 2 WHERE entry = 30371;
UPDATE creature_proto SET npcflags= 2 WHERE entry = 30372;
UPDATE creature_proto SET npcflags= 2 WHERE entry = 30359;
UPDATE creature_proto SET npcflags= 2 WHERE entry = 30360;
UPDATE creature_proto SET npcflags= 2 WHERE entry = 30348;
UPDATE creature_proto SET npcflags= 2 WHERE entry = 30375;
UPDATE creature_proto SET npcflags= 2 WHERE entry = 30363;
UPDATE creature_proto SET npcflags= 2 WHERE entry = 30358;
UPDATE creature_proto SET npcflags= 2 WHERE entry = 30538;
UPDATE creature_proto SET npcflags= 2 WHERE entry = 30536;
UPDATE creature_proto SET npcflags= 2 WHERE entry = 30531;
UPDATE creature_proto SET npcflags= 2 WHERE entry = 30534;
UPDATE creature_proto SET npcflags= 2 WHERE entry = 30533;
UPDATE creature_proto SET npcflags= 2 WHERE entry = 30537;
UPDATE creature_proto SET npcflags= 2 WHERE entry = 30535;
UPDATE creature_proto SET npcflags= 3 WHERE entry = 30370;
UPDATE creature_proto SET npcflags= 3 WHERE entry = 30367;
UPDATE creature_proto SET npcflags= 3 WHERE entry = 30369;
UPDATE creature_proto SET npcflags= 3 WHERE entry = 30365;
UPDATE creature_proto SET npcflags= 3 WHERE entry = 30357;
UPDATE creature_proto SET npcflags= 3 WHERE entry = 30362;

-- 3.2.2013
DELETE FROM creature_spawns WHERE entry=29238; -- Scourge Haunt, seems not to be used anymore

-- 3.2.2013 Thanks to darkangel39
UPDATE `creature_proto` SET `minlevel`=80, `maxlevel`=80 WHERE `entry` IN (38160,31750,26668,31751,34275,31016,31277,31271,31242,30407,35465,31222);
UPDATE `creature_proto` SET `minlevel`=81, `maxlevel`=81 WHERE `entry` IN (35024,31541,31543,31218,31219,31503,31540,31548,30688);
UPDATE `creature_proto` SET `minlevel`=82, `maxlevel`=82 WHERE `entry` IN (34200,31502,38456);
UPDATE `creature_proto` SET `minlevel`=83, `maxlevel`=83 WHERE `entry` IN (32295,31083,36954,37226,37503,36597,37955,28179,30677,37755,38004,30596,36990,37223,37596,38161,38189,38008,38433,37672,31819,31820,31818,31055,24321,34450,37886);

-- 3.2.2013 Thanks to FaceTheSlayer
DELETE FROM `creature_quest_starter` WHERE `id` IN ('5111', '6741', '6826', '6735', '11814', '6929', '6746' ) AND `quest` BETWEEN '8353' AND '8360';

-- 9.2.2013
-- not yet used in arcemu
DROP TABLE IF EXISTS `weather_season`;
CREATE TABLE IF NOT EXISTS `weather_season` (
  `season` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT 'Weather season',
  `active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Only one season can be active',
  `remark` text NOT NULL COMMENT 'Personal remarks',
  PRIMARY KEY (`season`),
  KEY `active` (`active`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

INSERT INTO weather_season (season, active, remark) VALUES
(1, 1, 'Spring'),
(2, 0, 'Summer'),
(3, 0, 'Autumn'),
(4, 0, 'Winter');

-- 10.2.2013
set @questid = 24597;
UPDATE quests SET CompletionText	= 'My thanks for this Lovely Charm Bracelet.' WHERE entry=@questid;
set @questid = 24658;
UPDATE quests SET CompletionText	= 'Good job, kid. You deserve a little somethin''. And hey, come back tomorrow if you get the time; I might have a job for ya.' WHERE entry=@questid;
set @questid = 24659;
UPDATE quests SET CompletionText	= 'Good job, kid. You deserve a little somethin''. And hey, come back tomorrow if you get the time; I might have a job for ya.' WHERE entry=@questid;
set @questid = 24660;
UPDATE quests SET CompletionText	= 'Good job, kid. You deserve a little somethin''. And hey, come back tomorrow if you get the time; I might have a job for ya.' WHERE entry=@questid;
set @questid = 24662;
UPDATE quests SET CompletionText	= 'Good job, kid. You deserve a little somethin''. And hey, come back tomorrow if you get the time; I might have a job for ya.' WHERE entry=@questid;
set @questid = 24663;
UPDATE quests SET CompletionText	= 'Good job, kid. You deserve a little somethin''. And hey, come back tomorrow if you get the time; I might have a job for ya.' WHERE entry=@questid;
set @questid = 24664;
UPDATE quests SET CompletionText	= 'Good job, kid. You deserve a little somethin''. And hey, come back tomorrow if you get the time; I might have a job for ya.' WHERE entry=@questid;
set @questid = 24665;
UPDATE quests SET CompletionText	= 'Good job, kid. You deserve a little somethin''. And hey, come back tomorrow if you get the time; I might have a job for ya.' WHERE entry=@questid;
set @questid = 24666;
UPDATE quests SET CompletionText	= 'Good job, kid. You deserve a little somethin''. And hey, come back tomorrow if you get the time; I might have a job for ya.' WHERE entry=@questid;
set @questid = 24804;
UPDATE quests SET CompletionText	= 'Hey. You got some time on your hands? I could use someone like you.' WHERE entry=@questid;
set @questid = 24629;
UPDATE quests SET CompletionText	= 'Great work, $N! People will come running to buy Crown perfumes now that they''ve had a chance to sample their wonders.' WHERE entry=@questid;
set @questid = 24635;
UPDATE quests SET CompletionText	= 'Nice work, $N! People will be buying Crown colognes by the crate-load now that they''ve had a chance to try them.' WHERE entry=@questid;
set @questid = 24610;
UPDATE quests SET CompletionText	= 'My thanks for this Lovely Charm Bracelet.' WHERE entry=@questid;
set @questid = 24611;
UPDATE quests SET CompletionText	= 'My thanks for this Lovely Charm Bracelet.' WHERE entry=@questid;

UPDATE creature_proto SET npcflags= 3 WHERE entry = 38042;

set @questid = 24612;
UPDATE quests SET CompletionText	= 'My "thanks" for this Lovely Charm Bracelet.' WHERE entry=@questid;
set @questid = 24536;
UPDATE quests SET CompletionText	= 'Hey, thanks, kid. Give it over, let''s take a look.$B$B<He takes the device from you and fiddles with it.>$B$BOh, that ain''t good. ' WHERE entry=@questid;
set @questid = 24541;
UPDATE quests SET CompletionText	= 'You got it, huh? Good job, kid. Top notch. Let''s see what we got here.$B$B<He cracks open the crate and rummages around inside.>' WHERE entry=@questid;
UPDATE quests SET EndText			= 'Steal perfume package from Crown Chemical Co. outside Orgrimmar' WHERE entry=@questid;
set @questid = 24656;
UPDATE quests SET EndText			= 'Steal perfume package from Crown Chemical Co. outside Orgrimmar' WHERE entry=@questid;
set @questid = 24638;
UPDATE quests SET CompletionText	= 'Good job, kid. You deserve a little somethin''. And hey, come back tomorrow if you get the time; I might have a job for ya.' WHERE entry=@questid;
set @questid = 24645;
UPDATE quests SET CompletionText	= 'Good job, kid. You deserve a little somethin''. And hey, come back tomorrow if you get the time; I might have a job for ya.' WHERE entry=@questid;
set @questid = 24647;
UPDATE quests SET CompletionText	= 'Good job, kid. You deserve a little somethin''. And hey, come back tomorrow if you get the time; I might have a job for ya.' WHERE entry=@questid;
set @questid = 24648;
UPDATE quests SET CompletionText	= 'Good job, kid. You deserve a little somethin''. And hey, come back tomorrow if you get the time; I might have a job for ya.' WHERE entry=@questid;
set @questid = 24649;
UPDATE quests SET CompletionText	= 'Good job, kid. You deserve a little somethin''. And hey, come back tomorrow if you get the time; I might have a job for ya.' WHERE entry=@questid;
set @questid = 24650;
UPDATE quests SET CompletionText	= 'Good job, kid. You deserve a little somethin''. And hey, come back tomorrow if you get the time; I might have a job for ya.' WHERE entry=@questid;
set @questid = 24651;
UPDATE quests SET CompletionText	= 'Good job, kid. You deserve a little somethin''. And hey, come back tomorrow if you get the time; I might have a job for ya.' WHERE entry=@questid;
set @questid = 24652;
UPDATE quests SET CompletionText	= 'Good job, kid. You deserve a little somethin''. And hey, come back tomorrow if you get the time; I might have a job for ya.' WHERE entry=@questid;
set @questid = 24850;
UPDATE quests SET CompletionText	= 'You''re not Snivel. He was supposed to be here an hour ago! What have you done with him?$b$b<Roka seems to calm down when you tell her that you''re looking for Snivel, too. Then, tears start to well up in her eyes.>$b$bThis isn''t like my sweet Snivel. Do you think something''s happened to him?' WHERE entry=@questid;
set @questid = 14483;
UPDATE quests SET CompletionText	= 'What''ve you got there?$b$bOh hey, this is big. Real big. Most of the crazy details in one little package. Thanks - you really helped us reel this all in. Good working with ya.' WHERE entry=@questid;
set @questid = 24805;
UPDATE quests SET CompletionText	= 'Hey. You got some time on your hands? I could use someone like you.' WHERE entry=@questid;

-- 11.2.2012 Spotlight from Lunar festival, don't need perma spawn
DELETE FROM creature_spawns WHERE entry=15897 AND id BETWEEN 140030 AND 140872; 

-- 11.2.2012 Thanks to zdroid9770
UPDATE `creature_proto` SET `minlevel`=71,`maxlevel`=71,`faction`=1897,`minhealth`=9291,`maxhealth`=9291,`mindamage`=386.4,`armor`=7039 WHERE `entry`=29346;

-- 12.2.2012 Thanks to Sirala
UPDATE creature_proto SET npcflags= 3 WHERE entry=38044;
UPDATE creature_proto SET npcflags= 3 WHERE entry=38045;
UPDATE quests SET CompletionText='What''ve you got there?$B$BOh hey, this is big. Real big. Most of the crazy details in one little package. Thanks - you really helped us reel this all in. Good working with ya.' WHERE entry=24754;
UPDATE quests SET CompletionText='Fantastic. Help is exactly what I need.' WHERE entry=24793;
UPDATE quests SET CompletionText='My thanks for this Lovely Charm Bracelet.' WHERE entry=24609;

UPDATE quests SET IncompleteText='I have dedicated my life to the search of flawless draenethyst spheres. A lifetime, $R!' WHERE entry=2521;
UPDATE quests SET IsRepeatable=1 WHERE entry=2522;
UPDATE quests SET IsRepeatable=1 WHERE entry=3483;
UPDATE creature_proto SET npcflags = 51 WHERE entry = 5515;
UPDATE creature_spawns SET slot1item =0 WHERE id=45458;
UPDATE creature_spawns SET slot1item =0 WHERE id=45459;
UPDATE creature_spawns SET slot1item =0 WHERE id=45460;
UPDATE creature_spawns SET slot1item =0 WHERE id=45461;
UPDATE creature_spawns SET slot1item =0 WHERE id=45462;
UPDATE creature_spawns SET slot1item =0 WHERE id=45463;
UPDATE creature_spawns SET slot1item =0 WHERE id=45464;
UPDATE creature_spawns SET slot1item =0 WHERE id=45465;
UPDATE creature_spawns SET slot1item =0 WHERE id=45466;
UPDATE creature_spawns SET slot1item =0 WHERE id=45467;
UPDATE creature_spawns SET slot1item =0 WHERE id=45468;
UPDATE creature_spawns SET slot1item =0 WHERE id=45469;
UPDATE creature_spawns SET slot1item =0 WHERE id=45470;
UPDATE creature_spawns SET slot1item =0 WHERE id=45471;
UPDATE creature_spawns SET slot1item =0 WHERE id=45472;
UPDATE creature_spawns SET slot1item =0 WHERE id=45473;

-- Set LoE db version
UPDATE db_version SET revision=8 WHERE db_name='LoE World';