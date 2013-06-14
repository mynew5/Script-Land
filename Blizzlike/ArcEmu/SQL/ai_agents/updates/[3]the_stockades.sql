-- thanks for ACID team work for information

delete from ai_agents where entry=1666;
INSERT INTO `ai_agents` (`entry`, `instance_mode`, `type`, `event`, `chance`, `maxcount`, `spell`, `spelltype`, `targettype_overwrite`, `cooldown_overwrite`, `floatMisc1`, `Misc2`) VALUES 
(1666, 4, 4, 0, 100, 0, 8242, 8, 2, 9300, 0, 0),
(1666, 4, 4, 0, 100, 0, 3419, 10, 4, 18200, 0, 0),
(1666, 4, 4, 0, 100, 1, 7164, 10, 4, 0, 0, 0),
(1666, 4, 3, 0, 100, 0, 0, 0, -1, -1, 15.0, 15000);

delete from ai_agents where entry=1717;
INSERT INTO `ai_agents` (`entry`, `instance_mode`, `type`, `event`, `chance`, `maxcount`, `spell`, `spelltype`, `targettype_overwrite`, `cooldown_overwrite`, `floatMisc1`, `Misc2`) VALUES 
(1717, 4, 4, 0, 100, 0, 6742, 10, 4, 10500, 0, 0),
(1717, 4, 4, 0, 100, 0, 421, 8, 2, 8100, 0, 0);

delete from ai_agents where entry=1716;
INSERT INTO `ai_agents` (`entry`, `instance_mode`, `type`, `event`, `chance`, `maxcount`, `spell`, `spelltype`, `targettype_overwrite`, `cooldown_overwrite`, `floatMisc1`, `Misc2`) VALUES 
(1716, 4, 4, 0, 100, 0, 9128, 10, 4, 26300, 0, 0),
(1716, 4, 4, 0, 100, 0, 7964, 3, 4, 15100, 0, 0),
(1716, 4, 3, 0, 100, 0, 0, 0, -1, -1, 15, 15000);

delete from ai_agents where entry=1663;
INSERT INTO `ai_agents` (`entry`, `instance_mode`, `type`, `event`, `chance`, `maxcount`, `spell`, `spelltype`, `targettype_overwrite`, `cooldown_overwrite`, `floatMisc1`, `Misc2`) VALUES 
(1663, 4, 4, 0, 100, 1, 7165, 10, 4, 0, 0, 0),
(1663, 4, 4, 0, 100, 0, 19134, 10, 4, 14000, 0, 0),
(1663, 4, 4, 0, 100, 0, 11976, 8, 2, 9600, 0, 0),
(1663, 4, 3, 0, 100, 0, 0, 0, -1, -1, 15, 15000);

-- all data in below are original whydb's work, only flee event has been added - thanks
delete from ai_agents where entry=1708;
INSERT INTO `ai_agents` (`entry`, `instance_mode`, `type`, `event`, `chance`, `maxcount`, `spell`, `spelltype`, `targettype_overwrite`, `cooldown_overwrite`, `floatMisc1`, `Misc2`) VALUES 
(1708, 4, 4, 0, 50, 1, 6253, 3, 1, 40000, 0, 0),
(1708, 4, 4, 0, 60, 1, 6547, 8, 1, 20000, 0, 0),
(1708, 4, 3, 0, 100, 0, 0, 0, -1, -1, 15, 15000);

delete from ai_agents where entry=1715;
INSERT INTO `ai_agents` (`entry`, `instance_mode`, `type`, `event`, `chance`, `maxcount`, `spell`, `spelltype`, `targettype_overwrite`, `cooldown_overwrite`, `floatMisc1`, `Misc2`) VALUES 
(1715, 4, 4, 0, 30, 0, 6253, 8, 1, 40000, 0, 0),
(1715, 4, 4, 0, 100, 0, 11554, 8, 1, 20000, 0, 0),
(1715, 4, 3, 0, 100, 0, 0, 0, -1, -1, 15, 15000);

delete from ai_agents where entry=1706;
INSERT INTO `ai_agents` (`entry`, `instance_mode`, `type`, `event`, `chance`, `maxcount`, `spell`, `spelltype`, `targettype_overwrite`, `cooldown_overwrite`, `floatMisc1`, `Misc2`) VALUES 
(1706, 4, 4, 0, 100, 0, 1768, 8, 1, 20000, 0, 0),
(1706, 4, 4, 0, 100, 0, 16509, 8, 1, 40000, 0, 0),
(1706, 4, 4, 0, 100, 0, 17230, 8, 1, 35000, 0, 0),
(1706, 4, 3, 0, 100, 0, 0, 0, -1, -1, 15, 15000);

delete from ai_agents where entry=1711;
INSERT INTO `ai_agents` (`entry`, `instance_mode`, `type`, `event`, `chance`, `maxcount`, `spell`, `spelltype`, `targettype_overwrite`, `cooldown_overwrite`, `floatMisc1`, `Misc2`) VALUES 
(1711, 4, 4, 0, 70, 1, 6253, 8, 1, 20000, 0, 0),
(1711, 4, 4, 0, 50, 0, 8242, 8, 4, 40000, 0, 0),
(1711, 4, 4, 0, 100, 0, 16244, 8, 1, 35000, 0, 0),
(1711, 4, 4, 0, 60, 0, 16509, 8, 1, 60000, 0, 0),
(1711, 4, 3, 0, 100, 0, 0, 0, -1, -1, 15, 15000);

