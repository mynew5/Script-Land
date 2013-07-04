/**********************************************
 LoE World changeset   Rev. 11  
 29. June, 2013
**********************************************/

/* **************************************************************************

Read this carefully:
We belive that the damage rate in this database was too high.
Therefore we reduce here the damage values to 50%.
Please feel free to use this query or not.

Please run this update file only once, otherwise with every run you will
divide the damages by 2 !!

*****************************************************************************/
UPDATE creature_proto SET mindamage=mindamage/2, maxdamage=maxdamage/2;


-- Other stuff:

ALTER TABLE `creature_spawns`
CHANGE `position_x` `position_x` FLOAT( 8, 2 ) NOT NULL,
CHANGE `position_y` `position_y` FLOAT( 8, 2 ) NOT NULL,
CHANGE `position_z` `position_z` FLOAT( 8, 2 ) NOT NULL,
CHANGE `orientation` `orientation` FLOAT( 5, 2 ) NOT NULL;

ALTER TABLE `creature_waypoints`
CHANGE `position_x` `position_x` FLOAT( 8, 2 ) NOT NULL DEFAULT '0',
CHANGE `position_y` `position_y` FLOAT( 8, 2 ) NOT NULL DEFAULT '0',
CHANGE `position_z` `position_z` FLOAT( 8, 2 ) NOT NULL DEFAULT '0';

ALTER TABLE `gameobject_spawns`
CHANGE `position_x` `position_x` FLOAT( 8, 2 ) NOT NULL DEFAULT '0',
CHANGE `position_y` `position_y` FLOAT( 8, 2 ) NOT NULL DEFAULT '0',
CHANGE `position_z` `position_z` FLOAT( 8, 2 ) NOT NULL DEFAULT '0',
CHANGE `orientation1` `orientation1` FLOAT( 5, 2 ) NOT NULL DEFAULT '0',
CHANGE `orientation2` `orientation2` FLOAT( 5, 2 ) NOT NULL DEFAULT '0',
CHANGE `orientation3` `orientation3` FLOAT( 5, 2 ) NOT NULL DEFAULT '0',
CHANGE `orientation4` `orientation4` FLOAT( 5, 2 ) NOT NULL DEFAULT '0',
CHANGE `Facing` `Facing` FLOAT( 5, 2 ) NOT NULL DEFAULT '0';

ALTER TABLE `creature_staticspawns` CHANGE `x` `x` FLOAT( 8, 2 ) NOT NULL ,
CHANGE `y` `y` FLOAT( 8, 2 ) NOT NULL ,
CHANGE `z` `z` FLOAT( 8, 2 ) NOT NULL ,
CHANGE `o` `o` FLOAT( 5, 2 ) NOT NULL;

ALTER TABLE `gameobject_staticspawns` CHANGE `x` `x` FLOAT( 8, 2 ) NOT NULL ,
CHANGE `y` `y` FLOAT( 8, 2 ) NOT NULL ,
CHANGE `z` `z` FLOAT( 8, 2 ) NOT NULL ,
CHANGE `facing` `facing` FLOAT( 5, 2 ) NOT NULL ,
CHANGE `o` `o` FLOAT( 5, 2 ) NOT NULL ,
CHANGE `o1` `o1` FLOAT( 5, 2 ) NOT NULL ,
CHANGE `o2` `o2` FLOAT( 5, 2 ) NOT NULL ,
CHANGE `o3` `o3` FLOAT( 5, 2 ) NOT NULL;

-- 22.5.2013 add Tome of Cold Weather Flight
REPLACE INTO `vendors` (`entry`, `item`, `amount`, `max_amount`, `inctime`, `extended_cost`) VALUES
(28746, 49177, 1, 0, 0, 0),
(31247, 49177, 1, 0, 0, 0),
(31238, 49177, 1, 0, 0, 0);
-- make vendor
UPDATE creature_proto SET npcflags=147 WHERE entry=28746;

-- 25.5.2013
REPLACE INTO `npc_gossip_textid` (`creatureid`, `textid`) VALUES (26546, 12639);
REPLACE INTO `npc_text`
(`entry`, `prob0`, `text0_0`, `text0_1`, `lang0`, `EmoteDelay0_0`, `Emote0_0`, `EmoteDelay0_1`, `Emote0_1`, `EmoteDelay0_2`, `Emote0_2`, `prob1`, `text1_0`, `text1_1`, `lang1`, `EmoteDelay1_0`, `Emote1_0`, `EmoteDelay1_1`, `Emote1_1`, `EmoteDelay1_2`, `Emote1_2`, `prob2`, `text2_0`, `text2_1`, `lang2`, `EmoteDelay2_0`, `Emote2_0`, `EmoteDelay2_1`, `Emote2_1`, `EmoteDelay2_2`, `Emote2_2`, `prob3`, `text3_0`, `text3_1`, `lang3`, `EmoteDelay3_0`, `Emote3_0`, `EmoteDelay3_1`, `Emote3_1`, `EmoteDelay3_2`, `Emote3_2`, `prob4`, `text4_0`, `text4_1`, `lang4`, `EmoteDelay4_0`, `Emote4_0`, `EmoteDelay4_1`, `Emote4_1`, `EmoteDelay4_2`, `Emote4_2`, `prob5`, `text5_0`, `text5_1`, `lang5`, `EmoteDelay5_0`, `Emote5_0`, `EmoteDelay5_1`, `Emote5_1`, `EmoteDelay5_2`, `Emote5_2`, `prob6`, `text6_0`, `text6_1`, `lang6`, `EmoteDelay6_0`, `Emote6_0`, `EmoteDelay6_1`, `Emote6_1`, `EmoteDelay6_2`, `Emote6_2`, `prob7`, `text7_0`, `text7_1`, `lang7`, `EmoteDelay7_0`, `Emote7_0`, `EmoteDelay7_1`, `Emote7_1`, `EmoteDelay7_2`, `Emote7_2`)
VALUES
(12639, 0, 'The steam-powered Alliance icebreaker Northspear sails from here to Valgarde in the Howling Fjord, across the sea in the Eastern Kingdoms.', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0);

-- 31.5.2013
UPDATE creature_proto SET minlevel=80, maxlevel=80, minhealth=12600, maxhealth=12600, mindamage=422, maxdamage=586 WHERE entry=29563;

-- Probably all in wrong phases. Thanks to Sirala
UPDATE creature_spawns SET phase = 1 WHERE id=127861;
UPDATE creature_spawns SET phase = 1 WHERE id=127860;
UPDATE creature_spawns SET phase = 1 WHERE id=127859;
UPDATE creature_spawns SET phase = 1 WHERE id=127858;
UPDATE creature_spawns SET phase = 1 WHERE id=127857;
UPDATE creature_spawns SET phase = 1 WHERE id=127856;
UPDATE creature_spawns SET phase = 1 WHERE id=127855;
UPDATE creature_spawns SET phase = 1 WHERE id=127854;
UPDATE creature_spawns SET phase = 1 WHERE id=127853;
UPDATE creature_spawns SET phase = 1 WHERE id=117838;
UPDATE creature_spawns SET phase = 1 WHERE id=117837;
UPDATE creature_spawns SET phase = 1 WHERE id=117836;
UPDATE creature_spawns SET phase = 1 WHERE id=117835;
UPDATE creature_spawns SET phase = 1 WHERE id=117834;
UPDATE creature_spawns SET phase = 1 WHERE id=117833;
UPDATE creature_spawns SET phase = 1 WHERE id=117832;
UPDATE creature_spawns SET phase = 1 WHERE id=117831;
UPDATE creature_spawns SET phase = 1 WHERE id=127884;
UPDATE creature_spawns SET phase = 1 WHERE id=127883;
UPDATE creature_spawns SET phase = 1 WHERE id=138937;
UPDATE creature_spawns SET phase = 1 WHERE id=138936;
UPDATE creature_spawns SET phase = 1 WHERE id=138935;
UPDATE creature_spawns SET phase = 1 WHERE id=138934;
UPDATE creature_spawns SET phase = 1 WHERE id=138933;
UPDATE creature_spawns SET phase = 1 WHERE id=138932;
UPDATE creature_spawns SET phase = 1 WHERE id=138931;
UPDATE creature_spawns SET phase = 1 WHERE id=138930;
UPDATE creature_spawns SET phase = 1 WHERE id=138929;
UPDATE creature_spawns SET phase = 1 WHERE id=138928;
UPDATE creature_spawns SET phase = 1 WHERE id=138927;
UPDATE creature_spawns SET phase = 1 WHERE id=138402;
UPDATE creature_spawns SET phase = 1 WHERE id=138401;
UPDATE creature_spawns SET phase = 1 WHERE id=138400;
UPDATE creature_spawns SET phase = 1 WHERE id=138399;
UPDATE creature_spawns SET phase = 1 WHERE id=138398;
UPDATE creature_spawns SET phase = 1 WHERE id=139858;
UPDATE creature_spawns SET phase = 1 WHERE id=139857;
UPDATE creature_spawns SET phase = 1 WHERE id=139856;
UPDATE creature_spawns SET phase = 1 WHERE id=139855;
UPDATE creature_spawns SET phase = 1 WHERE id=139854;
UPDATE creature_spawns SET phase = 1 WHERE id=139853;
UPDATE creature_spawns SET phase = 1 WHERE id=139852;
UPDATE creature_spawns SET phase = 1 WHERE id=139851;
UPDATE creature_spawns SET phase = 1 WHERE id=139850;
UPDATE creature_spawns SET phase = 1 WHERE id=139849;
UPDATE creature_spawns SET phase = 1 WHERE id=138441;
UPDATE creature_spawns SET phase = 1 WHERE id=138440;
UPDATE creature_spawns SET phase = 1 WHERE id=140934;
UPDATE creature_spawns SET phase = 1 WHERE id=140933;
UPDATE creature_spawns SET phase = 1 WHERE id=140932;
UPDATE creature_spawns SET phase = 1 WHERE id=140931;
UPDATE creature_spawns SET phase = 1 WHERE id=140930;
UPDATE creature_spawns SET phase = 1 WHERE id=140929;
UPDATE creature_spawns SET phase = 1 WHERE id=140928;
UPDATE creature_spawns SET phase = 1 WHERE id=140927;
UPDATE creature_spawns SET phase = 1 WHERE id=140028;
UPDATE creature_spawns SET phase = 1 WHERE id=137710;
UPDATE creature_spawns SET phase = 1 WHERE id=141297;
UPDATE creature_spawns SET phase = 1 WHERE id=141296;
UPDATE creature_spawns SET phase = 1 WHERE id=141295;
UPDATE creature_spawns SET phase = 1 WHERE id=138636;
UPDATE creature_spawns SET phase = 1 WHERE id=138447;
UPDATE creature_spawns SET phase = 1 WHERE id=138446;
UPDATE creature_spawns SET phase = 1 WHERE id=138445;
UPDATE creature_spawns SET phase = 1 WHERE id=138444;
UPDATE creature_spawns SET phase = 1 WHERE id=138443;
UPDATE creature_spawns SET phase = 1 WHERE id=136879;
UPDATE creature_spawns SET phase = 1 WHERE id=136878;
UPDATE creature_spawns SET phase = 1 WHERE id=136877;
UPDATE creature_spawns SET phase = 1 WHERE id=138416;
UPDATE creature_spawns SET phase = 1 WHERE id=138415;
UPDATE creature_spawns SET phase = 1 WHERE id=139848;
UPDATE creature_spawns SET phase = 1 WHERE id=139847;
UPDATE creature_spawns SET phase = 1 WHERE id=139846;
UPDATE creature_spawns SET phase = 1 WHERE id=139845;
UPDATE creature_spawns SET phase = 1 WHERE id=139844;
UPDATE creature_spawns SET phase = 1 WHERE id=139843;
UPDATE creature_spawns SET phase = 1 WHERE id=139842;
UPDATE creature_spawns SET phase = 1 WHERE id=139841;
UPDATE creature_spawns SET phase = 1 WHERE id=139840;
UPDATE creature_spawns SET phase = 1 WHERE id=139839;
UPDATE creature_spawns SET phase = 1 WHERE id=139838;
UPDATE creature_spawns SET phase = 1 WHERE id=139837;
UPDATE creature_spawns SET phase = 1 WHERE id=141521;
UPDATE creature_spawns SET phase = 1 WHERE id=141520;
UPDATE creature_spawns SET phase = 1 WHERE id=141519;
UPDATE creature_spawns SET phase = 1 WHERE id=141518;
UPDATE creature_spawns SET phase = 1 WHERE id=141517;
UPDATE creature_spawns SET phase = 1 WHERE id=141301;
UPDATE creature_spawns SET phase = 1 WHERE id=138922;
UPDATE creature_spawns SET phase = 1 WHERE id=138921;
UPDATE creature_spawns SET phase = 1 WHERE id=138920;
UPDATE creature_spawns SET phase = 1 WHERE id=138298;
UPDATE creature_spawns SET phase = 1 WHERE id=135855;
UPDATE creature_spawns SET phase = 1 WHERE id=139780;
UPDATE creature_spawns SET phase = 1 WHERE id=139779;
UPDATE creature_spawns SET phase = 1 WHERE id=139778;
UPDATE creature_spawns SET phase = 1 WHERE id=139777;
UPDATE creature_spawns SET phase = 1 WHERE id=139776;
UPDATE creature_spawns SET phase = 1 WHERE id=139775;
UPDATE creature_spawns SET phase = 1 WHERE id=139774;
UPDATE creature_spawns SET phase = 1 WHERE id=139773;
UPDATE creature_spawns SET phase = 1 WHERE id=139772;
UPDATE creature_spawns SET phase = 1 WHERE id=139771;
UPDATE creature_spawns SET phase = 1 WHERE id=139770;
UPDATE creature_spawns SET phase = 1 WHERE id=139769;
UPDATE creature_spawns SET phase = 1 WHERE id=139768;
UPDATE creature_spawns SET phase = 1 WHERE id=139767;
UPDATE creature_spawns SET phase = 1 WHERE id=139766;
UPDATE creature_spawns SET phase = 1 WHERE id=139765;
UPDATE creature_spawns SET phase = 1 WHERE id=139764;
UPDATE creature_spawns SET phase = 1 WHERE id=139763;
UPDATE creature_spawns SET phase = 1 WHERE id=139762;
UPDATE creature_spawns SET phase = 1 WHERE id=140889;
UPDATE creature_spawns SET phase = 1 WHERE id=140888;
UPDATE creature_spawns SET phase = 1 WHERE id=140887;
UPDATE creature_spawns SET phase = 1 WHERE id=140886;
UPDATE creature_spawns SET phase = 1 WHERE id=140885;
UPDATE creature_spawns SET phase = 1 WHERE id=140884;
UPDATE creature_spawns SET phase = 1 WHERE id=140883;
UPDATE creature_spawns SET phase = 1 WHERE id=140882;
UPDATE creature_spawns SET phase = 1 WHERE id=140881;
UPDATE creature_spawns SET phase = 1 WHERE id=138439;
UPDATE creature_spawns SET phase = 1 WHERE id=138926;
UPDATE creature_spawns SET phase = 1 WHERE id=141354;
UPDATE creature_spawns SET phase = 1 WHERE id=139790;
UPDATE creature_spawns SET phase = 1 WHERE id=139829;
UPDATE creature_spawns SET phase = 1 WHERE id=139782;
UPDATE creature_spawns SET phase = 1 WHERE id=138404;
UPDATE creature_spawns SET phase = 1 WHERE id=138341;
UPDATE creature_spawns SET phase = 1 WHERE id=139794;
UPDATE creature_spawns SET phase = 1 WHERE id=139796;
UPDATE creature_spawns SET phase = 1 WHERE id=139789;

UPDATE creature_spawns SET phase = 1 WHERE id=122640;
UPDATE creature_spawns SET phase = 1 WHERE id=138174;
UPDATE creature_spawns SET phase = 1 WHERE id=138175;
UPDATE creature_spawns SET phase = 1 WHERE id=138176;
UPDATE creature_spawns SET phase = 1 WHERE id=138177;
UPDATE creature_spawns SET phase = 1 WHERE id=138178;
UPDATE creature_spawns SET phase = 1 WHERE id=138179;
UPDATE creature_spawns SET phase = 1 WHERE id=138180;
UPDATE creature_spawns SET phase = 1 WHERE id=138181;
UPDATE creature_spawns SET phase = 1 WHERE id=138182;
UPDATE creature_spawns SET phase = 1 WHERE id=138183;
UPDATE creature_spawns SET phase = 1 WHERE id=138184;
UPDATE creature_spawns SET phase = 1 WHERE id=138185;
UPDATE creature_spawns SET phase = 1 WHERE id=138186;
UPDATE creature_spawns SET phase = 1 WHERE id=138187;
UPDATE creature_spawns SET phase = 1 WHERE id=138188;
UPDATE creature_spawns SET phase = 1 WHERE id=138189;
UPDATE creature_spawns SET phase = 1 WHERE id=138190;
UPDATE creature_spawns SET phase = 1 WHERE id=138191;
UPDATE creature_spawns SET phase = 1 WHERE id=138192;
UPDATE creature_spawns SET phase = 1 WHERE id=138193;
UPDATE creature_spawns SET phase = 1 WHERE id=138194;
UPDATE creature_spawns SET phase = 1 WHERE id=103936;
UPDATE creature_spawns SET phase = 1 WHERE id=103824;
UPDATE creature_spawns SET phase = 1 WHERE id=103825;
UPDATE creature_spawns SET phase = 1 WHERE id=103826;
UPDATE creature_spawns SET phase = 1 WHERE id=103827;
UPDATE creature_spawns SET phase = 1 WHERE id=103828;
UPDATE creature_spawns SET phase = 1 WHERE id=103829;
UPDATE creature_spawns SET phase = 1 WHERE id=103830;
UPDATE creature_spawns SET phase = 1 WHERE id=103831;
UPDATE creature_spawns SET phase = 1 WHERE id=103832;
UPDATE creature_spawns SET phase = 1 WHERE id=103833;
UPDATE creature_spawns SET phase = 1 WHERE id=103834;
UPDATE creature_spawns SET phase = 1 WHERE id=103835;
UPDATE creature_spawns SET phase = 1 WHERE id=103836;
UPDATE creature_spawns SET phase = 1 WHERE id=103837;
UPDATE creature_spawns SET phase = 1 WHERE id=103838;
UPDATE creature_spawns SET phase = 1 WHERE id=103839;
UPDATE creature_spawns SET phase = 1 WHERE id=103840;
UPDATE creature_spawns SET phase = 1 WHERE id=103841;
UPDATE creature_spawns SET phase = 1 WHERE id=103842;
UPDATE creature_spawns SET phase = 1 WHERE id=103843;
UPDATE creature_spawns SET phase = 1 WHERE id=103844;
UPDATE creature_spawns SET phase = 1 WHERE id=103845;
UPDATE creature_spawns SET phase = 1 WHERE id=103846;
UPDATE creature_spawns SET phase = 1 WHERE id=103936;
UPDATE creature_spawns SET phase = 1 WHERE id=138678;
UPDATE creature_spawns SET phase = 1 WHERE id=138677;
UPDATE creature_spawns SET phase = 1 WHERE id=103502;
UPDATE creature_spawns SET phase = 1 WHERE id=99464;
UPDATE creature_spawns SET phase = 1 WHERE id=99465;
UPDATE creature_spawns SET phase = 1 WHERE id=103460;
UPDATE creature_spawns SET phase = 1 WHERE id=103461;
UPDATE creature_spawns SET phase = 1 WHERE id=103462;
UPDATE creature_spawns SET phase = 1 WHERE id=103463;
UPDATE creature_spawns SET phase = 1 WHERE id=103464;
UPDATE creature_spawns SET phase = 1 WHERE id=103465;
UPDATE creature_spawns SET phase = 1 WHERE id=103466;
UPDATE creature_spawns SET phase = 1 WHERE id=103467;
UPDATE creature_spawns SET phase = 1 WHERE id=103468;
UPDATE creature_spawns SET phase = 1 WHERE id=103469;
UPDATE creature_spawns SET phase = 1 WHERE id=103470;
UPDATE creature_spawns SET phase = 1 WHERE id=103471;
UPDATE creature_spawns SET phase = 1 WHERE id=103472;
UPDATE creature_spawns SET phase = 1 WHERE id=103473;
UPDATE creature_spawns SET phase = 1 WHERE id=103474;
UPDATE creature_spawns SET phase = 1 WHERE id=103475;
UPDATE creature_spawns SET phase = 1 WHERE id=103476;
UPDATE creature_spawns SET phase = 1 WHERE id=103477;
UPDATE creature_spawns SET phase = 1 WHERE id=103478;
UPDATE creature_spawns SET phase = 1 WHERE id=103479;
UPDATE creature_spawns SET phase = 1 WHERE id=103480;
UPDATE creature_spawns SET phase = 1 WHERE id=103481;
UPDATE creature_spawns SET phase = 1 WHERE id=103482;
UPDATE creature_spawns SET phase = 1 WHERE id=103483;
UPDATE creature_spawns SET phase = 1 WHERE id=103484;
UPDATE creature_spawns SET phase = 1 WHERE id=103485;
UPDATE creature_spawns SET phase = 1 WHERE id=103486;
UPDATE creature_spawns SET phase = 1 WHERE id=103487;
UPDATE creature_spawns SET phase = 1 WHERE id=103488;
UPDATE creature_spawns SET phase = 1 WHERE id=103489;
UPDATE creature_spawns SET phase = 1 WHERE id=103490;
UPDATE creature_spawns SET phase = 1 WHERE id=103491;
UPDATE creature_spawns SET phase = 1 WHERE id=103492;
UPDATE creature_spawns SET phase = 1 WHERE id=103493;
UPDATE creature_spawns SET phase = 1 WHERE id=103494;
UPDATE creature_spawns SET phase = 1 WHERE id=103213;
UPDATE creature_spawns SET phase = 1 WHERE id=103214;
UPDATE creature_spawns SET phase = 1 WHERE id=103215;
UPDATE creature_spawns SET phase = 1 WHERE id=103216;
UPDATE creature_spawns SET phase = 1 WHERE id=103217;
UPDATE creature_spawns SET phase = 1 WHERE id=103218;
UPDATE creature_spawns SET phase = 1 WHERE id=103219;
UPDATE creature_spawns SET phase = 1 WHERE id=103220;
UPDATE creature_spawns SET phase = 1 WHERE id=103221;
UPDATE creature_spawns SET phase = 1 WHERE id=103222;
UPDATE creature_spawns SET phase = 1 WHERE id=103223;
UPDATE creature_spawns SET phase = 1 WHERE id=103224;
UPDATE creature_spawns SET phase = 1 WHERE id=103225;
UPDATE creature_spawns SET phase = 1 WHERE id=103226;
UPDATE creature_spawns SET phase = 1 WHERE id=103227;
UPDATE creature_spawns SET phase = 1 WHERE id=103228;
UPDATE creature_spawns SET phase = 1 WHERE id=103229;
UPDATE creature_spawns SET phase = 1 WHERE id=103230;
UPDATE creature_spawns SET phase = 1 WHERE id=103231;
UPDATE creature_spawns SET phase = 1 WHERE id=103232;
UPDATE creature_spawns SET phase = 1 WHERE id=103233;
UPDATE creature_spawns SET phase = 1 WHERE id=103234;
UPDATE creature_spawns SET phase = 1 WHERE id=103587;
UPDATE creature_spawns SET phase = 1 WHERE id=103588;
UPDATE creature_spawns SET phase = 1 WHERE id=103589;
UPDATE creature_spawns SET phase = 1 WHERE id=103590;
UPDATE creature_spawns SET phase = 1 WHERE id=103591;
UPDATE creature_spawns SET phase = 1 WHERE id=103592;
UPDATE creature_spawns SET phase = 1 WHERE id=103593;
UPDATE creature_spawns SET phase = 1 WHERE id=103594;
UPDATE creature_spawns SET phase = 1 WHERE id=103595;
UPDATE creature_spawns SET phase = 1 WHERE id=103596;
UPDATE creature_spawns SET phase = 1 WHERE id=103597;
UPDATE creature_spawns SET phase = 1 WHERE id=103598;
UPDATE creature_spawns SET phase = 1 WHERE id=103599;
UPDATE creature_spawns SET phase = 1 WHERE id=103600;
UPDATE creature_spawns SET phase = 1 WHERE id=103601;
UPDATE creature_spawns SET phase = 1 WHERE id=103602;
UPDATE creature_spawns SET phase = 1 WHERE id=103603;
UPDATE creature_spawns SET phase = 1 WHERE id=103604;
UPDATE creature_spawns SET phase = 1 WHERE id=103605;
UPDATE creature_spawns SET phase = 1 WHERE id=103606;
UPDATE creature_spawns SET phase = 1 WHERE id=103607;
UPDATE creature_spawns SET phase = 1 WHERE id=103608;
UPDATE creature_spawns SET phase = 1 WHERE id=103609;
UPDATE creature_spawns SET phase = 1 WHERE id=103610;
UPDATE creature_spawns SET phase = 1 WHERE id=103529;
UPDATE creature_spawns SET phase = 1 WHERE id=103530;
UPDATE creature_spawns SET phase = 1 WHERE id=103531;
UPDATE creature_spawns SET phase = 1 WHERE id=103532;
UPDATE creature_spawns SET phase = 1 WHERE id=103533;
UPDATE creature_spawns SET phase = 1 WHERE id=103534;
UPDATE creature_spawns SET phase = 1 WHERE id=103535;
UPDATE creature_spawns SET phase = 1 WHERE id=103536;
UPDATE creature_spawns SET phase = 1 WHERE id=103537;
UPDATE creature_spawns SET phase = 1 WHERE id=103538;
UPDATE creature_spawns SET phase = 1 WHERE id=99191;
UPDATE creature_spawns SET phase = 1 WHERE id=99192;
UPDATE creature_spawns SET phase = 1 WHERE id=99193;
UPDATE creature_spawns SET phase = 1 WHERE id=99194;
UPDATE creature_spawns SET phase = 1 WHERE id=99195;
UPDATE creature_spawns SET phase = 1 WHERE id=99196;
UPDATE creature_spawns SET phase = 1 WHERE id=99197;
UPDATE creature_spawns SET phase = 1 WHERE id=99198;
UPDATE creature_spawns SET phase = 1 WHERE id=99199;
UPDATE creature_spawns SET phase = 1 WHERE id=99200;
UPDATE creature_spawns SET phase = 1 WHERE id=107653;
UPDATE creature_spawns SET phase = 1 WHERE id=107654;

-- 2.6.2013
-- Quest Ruf des Wassers (5 von 6) doesn't work
-- Problem: http://landofelves.net/?p=showtopic&t=134&post=480
-- Cheat: Spawn the quest NPC Tel'athion the Impure because of missing script
INSERT INTO `creature_spawns`
(`id`, `entry`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `movetype`, `displayid`, `faction`, `flags`, `bytes0`, `bytes1`, `bytes2`, `emote_state`, `npc_respawn_link`, `channel_spell`, `channel_target_sqlid`, `channel_target_sqlid_creature`, `standstate`, `death_state`, `mountdisplayid`, `slot1item`, `slot2item`, `slot3item`, `CanFly`, `phase`)
VALUES
(199002, 17359, 530, -1644.47, -10916.20, 58.79, 2.96, 0, 16983, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);

-- 6.6.2013
ALTER TABLE `creature_spawns` CHANGE `phase` `phase` INT( 10 ) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Phase mask';
ALTER TABLE `creature_staticspawns` CHANGE `phase` `phase` INT( 10 ) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Phase mask';
ALTER TABLE `gameobject_spawns` CHANGE `phase` `phase` INT( 10 ) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Phase mask';
ALTER TABLE `gameobject_staticspawns` CHANGE `phase` `phase` INT( 10 ) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Phase mask';


-- 19.6.2013 Double spawns
DELETE FROM gameobject_spawns WHERE id=18640;
DELETE FROM gameobject_spawns WHERE id=18641;
DELETE FROM gameobject_spawns WHERE id IN(50285,50379,50427,50428,50429,50430,50448,50450,50452,50459,50460,50464,50465,50470,50472,50473,50474,50475,50476,50768,50769,50770,50771);  -- chests
DELETE FROM gameobject_spawns WHERE id=25714;

DELETE FROM gameobject_spawns WHERE id BETWEEN 52063 AND 52070; -- stone benches and chairs
DELETE FROM gameobject_spawns WHERE id=52072; 
DELETE FROM gameobject_spawns WHERE id=52074; 
DELETE FROM gameobject_spawns WHERE id=52076; 
DELETE FROM gameobject_spawns WHERE id BETWEEN 52078 AND 52089; -- stone benches and chairs
DELETE FROM gameobject_spawns WHERE id=52091; 
DELETE FROM gameobject_spawns WHERE id BETWEEN 52093 AND 52094; -- stone benches and chairs
DELETE FROM gameobject_spawns WHERE id BETWEEN 52096 AND 52141; 
DELETE FROM gameobject_spawns WHERE id BETWEEN 52143 AND 52206; 
-- 52207 -- wegweiser   sp 15225  2112
DELETE FROM gameobject_spawns WHERE id BETWEEN 52208 AND 52213; -- stone benches and chairs
DELETE FROM gameobject_spawns WHERE id BETWEEN 52215 AND 52235; -- stone benches and chairs
-- 52236 -- Fahne entry 28044 sp 18945
DELETE FROM gameobject_spawns WHERE id BETWEEN 52237 AND 52238; -- stone benches and chairs
-- 52239 -- Fahne entry 28044 sp 18945
DELETE FROM gameobject_spawns WHERE id BETWEEN 52240 AND 52246; -- stone benches and chairs
-- 52247 single chair
DELETE FROM gameobject_spawns WHERE id=52248; -- stone benches and chairs
-- 52249 single chair
DELETE FROM gameobject_spawns WHERE id BETWEEN 52250 AND 52259; -- stone benches and chairs
DELETE FROM gameobject_spawns WHERE id BETWEEN 52266 AND 52280; -- stone benches and chairs
DELETE FROM gameobject_spawns WHERE id BETWEEN 52282 AND 52296; -- stone benches and chairs



UPDATE creature_proto SET faction=14 WHERE entry=20287;
UPDATE creature_proto SET npcflags=66177 WHERE entry=6737;
REPLACE INTO gameobject_quest_starter (id, quest) VALUES (190917, 12711);
REPLACE INTO gameobject_quest_finisher (id, quest) VALUES (190917, 12711);

UPDATE creature_proto SET minlevel=68, maxlevel=69, minhealth=5200, maxhealth=5400, mindamage=245, maxdamage=346, faction=84 WHERE entry IN(32577,32578,32579,32580);
UPDATE creature_spawns SET faction=84 WHERE entry IN(32577,32578,32579,32580);

-- 23.6.2013 by zdroid9770

-- 19909 - Rex Pixem - No need random walk
DELETE FROM `creature_waypoints` WHERE `spawnid`=82841;

-- Fire of Aku'mai / Needs to be a door so its not clicked too many times, 1 time click only
UPDATE `gameobject_names` SET `Type`=0 WHERE `entry`=21118;
UPDATE `gameobject_names` SET `Type`=0 WHERE `entry`=21119;
UPDATE `gameobject_names` SET `Type`=0 WHERE `entry`=21120;
UPDATE `gameobject_names` SET `Type`=0 WHERE `entry`=21121;

-- 18964 - Turtle Egg (Loggerhead) / Missing Description/Wrong Description
UPDATE `items` SET `description`="Teaches you how to summon this companion." WHERE `entry`=18964;
-- 45942 - XS-001 Constructor Bot / Missing Spell and description
UPDATE `items` SET `spellid_1`=64351, `description`="Teaches you how to summon this companion." WHERE `entry`=45942;


-- 25.6.2013
UPDATE creature_spawns SET position_x=5917.51, position_y=661.43, position_z=643.49, orientation=1.93 WHERE id=133205;

-- felweed
REPLACE INTO `loot_gameobjects` (`entryid`, `itemid`, `normal10percentchance`, `normal25percentchance`, `heroic10percentchance`, `heroic25percentchance`, `mincount`, `maxcount`) VALUES
(22984, 22785, 3, 3, 3, 3, 2, 4),
(18111, 22785, 100, 100, 100, 100, 1, 3),
(18111, 22575, 15, 15, 15, 15, 1, 2),
(18111, 22795, 10, 10, 10, 10, 1, 1),
(18111, 35229, 4, 4, 4, 4, 1, 1),
(18111, 24401, 4, 4, 4, 4, 1, 1),
(18111, 22794, 2, 2, 2, 2, 1, 1);

UPDATE gameobject_spawns SET Entry=181270 WHERE Entry=183044;


-- Set LoE db version
UPDATE db_version SET revision=11 WHERE db_name='LoE World' OR db_name='LoE Sunrise World';
