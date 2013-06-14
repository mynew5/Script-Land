local itemid = 6948

function Item_Trigger(item, event, player)
    Item_menu(item, player)
end

function Item_menu(item, player)

    
if (player:IsInCombat() == true) then
player:SendAreaTriggerMessage("You are in combat!")
else  
item:GossipCreateMenu(5555, player, 0) 
item:GossipMenuAddItem(8, "[Vendors]", 600, 0)
item:GossipMenuAddItem(8, "[AC-WEB Teleporter]", 601, 0)
item:GossipMenuAddItem(8, "[Morphing]", 602, 0)
item:GossipMenuAddItem(8, "[Jukebox]", 603, 0)         
item:GossipSendMenu(player)
end
end

function OnSelect(item, event, player, id, intid, code)

if(intid == 600) then
item:GossipCreateMenu(3543, player, 0)
item:GossipMenuAddItem(8, "[Class Trainers]", 1, 0)
item:GossipMenuAddItem(8, "[Tier 7]", 2, 0)
item:GossipMenuAddItem(8, "[Weapons]", 3, 0)
item:GossipMenuAddItem(8, "[Rings] [Necklace] [Shield] [Trinkets]", 4, 0)
item:GossipMenuAddItem(8, "[Tabard] [Cloak]", 5, 0)
item:GossipMenuAddItem(8, "[Season 5] [Relics] [Container]", 6, 0)
item:GossipMenuAddItem(8, "[Gliph 1] [Glyph 2] [Wrist]", 7, 0)
item:GossipMenuAddItem(8, "[Book A-Z] [Leather A-Z]", 8, 0)
item:GossipMenuAddItem(8, "[Jewelcrafting A-Z] [Engineering/Enchanting A-Z]", 9, 0)
item:GossipMenuAddItem(8, "[Alchemy/Blacksmithing/Tailoring]", 10, 0)
item:GossipMenuAddItem(8, "[Waist] [Feet] [Heirloom]", 11, 0)
item:GossipMenuAddItem(8, "[Ground Mounts] [Flying Mounts]", 12, 0)
item:GossipMenuAddItem(8, "[Item Enhancement]", 13, 0)
item:GossipMenuAddItem(8, "[Reagents 1]", 14, 0)
item:GossipMenuAddItem(8, ">->Next Page>->", 500, 0)
item:GossipMenuAddItem(0, "[Back]", 9000, 0)
item:GossipSendMenu(player)
end


if(intid == 500) then 
item:GossipCreateMenu(3543, player, 0) 
item:GossipMenuAddItem(8, "[Reagents 2]", 16, 0)  
item:GossipMenuAddItem(8, "[General Goods]", 17, 0)
item:GossipMenuAddItem(8, "[Quiver, AmmoPouch, Projectile]", 18, 0)
item:GossipMenuAddItem(8, "[Currency]", 19, 0)
item:GossipMenuAddItem(8, "[Gemstones]", 20, 0)
item:GossipMenuAddItem(8, "[Armor Tokens, Keys]", 21, 0)
item:GossipMenuAddItem(8, "[Proffession Trainers]", 22, 0)
item:GossipMenuAddItem(8, "[Riding Trainer]", 23, 0)
item:GossipMenuAddItem(8, "[Weapons Trainer]", 24, 0)
item:GossipMenuAddItem(0, "[Back]", 600, 0)
item:GossipSendMenu(player)
end

if(intid == 602) then 
item:GossipCreateMenu(1001, player, 0) 
item:GossipMenuAddItem(8, "[Bosses]", 6616, 0)  
item:GossipMenuAddItem(8, "[Mechanicals]", 6615, 0)
item:GossipMenuAddItem(0, "[Back]", 9000, 0)
item:GossipSendMenu(player)
end

if(intid == 603) then 
item:GossipCreateMenu(100, player, 0)
item:GossipMenuAddItem(1,"Play Anguish Walk", 7001, 0)
item:GossipMenuAddItem(1,"Play Vigil Walk Music", 7002, 0)
item:GossipMenuAddItem(1,"Play Brewfest Music", 7003, 0)
item:GossipMenuAddItem(1,"Play Nagrand Music", 7004, 0)
item:GossipMenuAddItem(1,"Play Power of the Horde", 7005, 0)
item:GossipMenuAddItem(1,"Play Silvermoon City Music", 7006, 0)
item:GossipMenuAddItem(1,"Play Drama Music", 7007, 0)
item:GossipMenuAddItem(1,"Play Dwarf Music", 7008, 0)
item:GossipMenuAddItem(1,"Play Stormwind City Music", 7009, 0)
item:GossipMenuAddItem(1,"Play Irish Ditty Music", 7010, 0)
item:GossipMenuAddItem(1,"Play Horde Tavern Music", 7011, 0)
item:GossipMenuAddItem(1,"Play Alliance Tavern Music", 7012, 0)
item:GossipMenuAddItem(0, "[Back]", 602, 0)
item:GossipSendMenu(player)
end

if(intid == 7001) then 
player:PlaySoundToSet(11700)
player:GossipComplete(player)
end
if(intid == 7002) then
player:PlaySoundToSet(11702)
player:GossipComplete(player)
end
if(intid == 7003) then
player:PlaySoundToSet(11810)
player:GossipComplete(player)
end
if(intid == 7004) then
player:PlaySoundToSet(10849)
player:GossipComplete(player)
end
if(intid == 7005) then
player:PlaySoundToSet(11803)
player:GossipComplete(player)
end
if(intid == 7006) then
player:PlaySoundToSet(9801)
player:GossipComplete(player)
end
if(intid == 7007) then
player:PlaySoundToSet(11706)
player:GossipComplete(player)
end
if(intid == 7008) then
player:PlaySoundToSet(11810)
player:GossipComplete(player)
end
if(intid == 7009) then
player:PlaySoundToSet(2532)
player:GossipComplete(player)
end
if(intid == 7010) then
player:PlaySoundToSet(11805)
player:GossipComplete(player)
end
if(intid == 7011) then
player:PlaySoundToSet(5234)
player:GossipComplete(player)
end
if(intid == 7012) then
player:PlaySoundToSet(4516)
player:GossipComplete(player)
end

if(intid == 6617) then
item:GossipCreateMenu(1002, player, 0)
item:GossipMenuAddItem(1, "Morph Me Into A-Me 01", 6001, 0)
item:GossipMenuAddItem(1, "Morph Me Into Advanced Target Dummy", 6002, 0)
item:GossipMenuAddItem(1, "Morph Me Into Arcane Protector", 6003, 0)
item:GossipMenuAddItem(1, "Morph Me Into Arcane Servant", 6004, 0)
item:GossipMenuAddItem(1, "Morph Me Into Arcanite Dragonling", 6005, 0)
item:GossipMenuAddItem(1, "Morph Me Into Arcatraz Sentinel", 6006, 0)
item:GossipMenuAddItem(1, "Morph Me Into Archery Target", 6007, 0)
item:GossipMenuAddItem(1, "Morph Me Into Area 52 Death Machine", 6008, 0)
item:GossipMenuAddItem(1, "Morph Me Into Battle Chicken", 6009, 0)
item:GossipMenuAddItem(1, "Morph Me Into Crimson Cannon", 6010, 0)
item:GossipMenuAddItem(1, "Morph Me Into Death's Door Fel Cannon", 6011, 0)
item:GossipMenuAddItem(1, "Morph Me Into Electrocutioner 6000", 6012, 0)
item:GossipMenuAddItem(1, "Morph Me Into Gnome Drag Car", 6013, 0)
item:GossipMenuAddItem(1, "Morph Me Into Goblin Drag Car", 6014, 0)
item:GossipMenuAddItem(1, "Morph Me Into Love Fool", 6015, 0)
item:GossipMenuAddItem(0, "[Back]", 6615, 0)
item:GossipSendMenu(player)
end

if(intid == 6616) then
item:GossipCreateMenu(1003, player, 0)
item:GossipMenuAddItem(1, "Morph Me Into Kil'jaden", 1001, 0)
item:GossipMenuAddItem(1, "Morph Me Into Archimonde", 1002, 0)
item:GossipMenuAddItem(1, "Morph Me Into Akil'zon", 1003, 0)
item:GossipMenuAddItem(1, "Morph Me Into Al'ar", 1004, 0)
item:GossipMenuAddItem(1, "Morph Me Into Anetheron", 1005, 0)
item:GossipMenuAddItem(1, "Morph Me Into Attumen the Huntsman", 1006, 0)
item:GossipMenuAddItem(1, "Morph Me Into Azgalor", 1007, 0)
item:GossipMenuAddItem(1, "Morph Me Into Brutallus", 1008, 0)
item:GossipMenuAddItem(1, "Morph Me Into Doom Lord Kazzak", 1009, 0)
item:GossipMenuAddItem(1, "Morph Me Into Doomwalker", 1010, 0)
item:GossipMenuAddItem(1, "Morph Me Into Fathom-Lord Karathress", 1011, 0)
item:GossipMenuAddItem(1, "Morph Me Into Felmyst", 1012, 0)
item:GossipMenuAddItem(1, "Morph Me Into Gruul the Dragonkiller", 1013, 0)
item:GossipMenuAddItem(1, "Morph Me Into Gurtogg Bloodboil", 1014, 0)
item:GossipMenuAddItem(1, "Morph Me Into Halazzi", 1015, 0)
item:GossipMenuAddItem(6, "[Second Page]", 6612, 0)
item:GossipMenuAddItem(0, "[Back]", 602, 0)
item:GossipSendMenu(player)
end

if(intid == 6612) then
item:GossipCreateMenu(1004, player, 0)
item:GossipMenuAddItem(1, "Morph Me Into Hex Lord Malacrass", 2001, 0)
item:GossipMenuAddItem(1, "Morph Me Into High Astromancer Solarian", 2002, 0)
item:GossipMenuAddItem(1, "Morph Me Into High King Maulgar", 2003, 0)
item:GossipMenuAddItem(1, "Morph Me Into High Warlord Naj'entus", 2004, 0)
item:GossipMenuAddItem(1, "Morph Me Into Hydross the Unstable", 2005, 0)
item:GossipMenuAddItem(1, "Morph Me Into Illidan Stormrage", 2006, 0)
item:GossipMenuAddItem(1, "Morph Me Into Jan'alai", 2007, 0)
item:GossipMenuAddItem(1, "Morph Me Into Kalecgos", 2008, 0)
item:GossipMenuAddItem(1, "Morph Me Into Kael'thas Sunstrider", 2009, 0)
item:GossipMenuAddItem(1, "Morph Me Into Kaz'rogal", 2010, 0)
item:GossipMenuAddItem(1, "Morph Me Into Kil'jaeden", 2011, 0)
item:GossipMenuAddItem(1, "Morph Me Into Lady Vashj", 2012, 0)
item:GossipMenuAddItem(1, "Morph Me Into Leotheras the Blind", 2013, 0)
item:GossipMenuAddItem(1, "Morph Me Into M'uru", 2014, 0)
item:GossipMenuAddItem(1, "Morph Me Into Magtheridon", 2015, 0)
item:GossipMenuAddItem(6, "[Third Page]", 6613, 0)
item:GossipMenuAddItem(0, "[Back]", 6616, 0)
item:GossipSendMenu(player)
end

if(intid == 6613) then
item:GossipCreateMenu(1005, player, 0)
item:GossipMenuAddItem(1, "Morph Me Into Maiden of Virtue", 3001, 0)
item:GossipMenuAddItem(1, "Morph Me Into Moroes", 3002, 0)
item:GossipMenuAddItem(1, "Morph Me Into Morogrim Tidewalker", 3003, 0)
item:GossipMenuAddItem(1, "Morph Me Into Mother Shahraz", 3004, 0)
item:GossipMenuAddItem(1, "Morph Me Into Nalorakk", 3005, 0)
item:GossipMenuAddItem(1, "Morph Me Into Netherspite", 3006, 0)
item:GossipMenuAddItem(1, "Morph Me Into Nightbane", 3007, 0)
item:GossipMenuAddItem(1, "Morph Me Into Prince Malchezaar", 3008, 0)
item:GossipMenuAddItem(1, "Morph Me Into Rage Winterchill", 3009, 0)
item:GossipMenuAddItem(1, "Morph Me Into Reliquary of the Lost", 3010, 0)
item:GossipMenuAddItem(1, "Morph Me Into Romulo", 3011, 0)
item:GossipMenuAddItem(1, "Morph Me Into Julianne", 3012, 0)
item:GossipMenuAddItem(1, "Morph Me Into Shade of Akama", 3013, 0)
item:GossipMenuAddItem(1, "Morph Me Into Shade of Aran", 3014, 0)
item:GossipMenuAddItem(1, "Morph Me Into Supremus", 3015, 0)
item:GossipMenuAddItem(6, "[Fourth Page]", 6614, 0)
item:GossipMenuAddItem(0, "[Back]", 602, 0)
item:GossipSendMenu(player)
end

if(intid == 6614) then
item:GossipCreateMenu(1006, player, 0)
item:GossipMenuAddItem(1, "Morph Me Into Terestian Illhoof", 4001, 0)
item:GossipMenuAddItem(1, "Morph Me Into Teron Gorefiend", 4002, 0)
item:GossipMenuAddItem(1, "Morph Me Into The Big Bad Wolf", 4003, 0)
item:GossipMenuAddItem(1, "Morph Me Into The Curator", 4004, 0)
item:GossipMenuAddItem(1, "Morph Me Into The Lurker Below", 4005, 0)
item:GossipMenuAddItem(1, "Morph Me Into Void Reaver", 4006, 0)
item:GossipMenuAddItem(1, "Morph Me Into Zul'jin", 4007, 0)
item:GossipMenuAddItem(1, "Morph Me Into Onyxia", 4008, 0)
item:GossipMenuAddItem(1, "Morph Me Into Maiev Shadowsong Large", 4009, 0)
item:GossipMenuAddItem(1, "Morph Me Into Maiev Shadowsong Normal", 4010, 0)
item:GossipMenuAddItem(6, "[Back]", 6613, 0)
item:GossipSendMenu(player)
end

if(intid == 6615) then
item:GossipCreateMenu(1007, player, 0)
item:GossipMenuAddItem(1, "Morph Me into XT:9", 5001, 0)
item:GossipMenuAddItem(1, "Morph Me Into Walking Bomb", 5002, 0)
item:GossipMenuAddItem(1, "Morph Me Into Unpainted Mechanostrider", 5003, 0)
item:GossipMenuAddItem(1, "Morph Me Into Truesilver Boar", 5004, 0)
item:GossipMenuAddItem(1, "Morph Me Into Tonk Mine", 5005, 0)
item:GossipMenuAddItem(1, "Morph Me Into The Threshwackonator 4100", 5006, 0)
item:GossipMenuAddItem(1, "Morph Me Into Techbot", 5007, 0)
item:GossipMenuAddItem(1, "Morph Me Into Swift White Mechanostrider", 5008, 0)
item:GossipMenuAddItem(1, "Morph Me Into Goblin Steam Tonk", 5009, 0)
item:GossipMenuAddItem(1, "Morph Me Into Red Mechanostrider", 5010, 0)
item:GossipMenuAddItem(1, "Morph Me Into R-3D0", 5011, 0)
item:GossipMenuAddItem(1, "Morph Me Into Peacekeeper Security Suit", 5012, 0)
item:GossipMenuAddItem(1, "Morph Me Into Overwatch Mark I", 5013, 0)
item:GossipMenuAddItem(1, "Morph Me Into Naga Distiller", 5014, 0)
item:GossipMenuAddItem(1, "Morph Me Into Mekgineer Thermaplugg", 5015, 0)
item:GossipMenuAddItem(0, "[Next Page]", 6617, 0)
item:GossipMenuAddItem(0, "[Back]", 9000, 0)
item:GossipSendMenu(player)
end

if(intid == 6015) then
player:SetModel(16011)
player:GossipComplete(player)
end

if(intid == 6014) then
player:SetModel(10318)
player:GossipComplete(player)
end

if(intid == 6013) then
player:SetModel(2490)
player:GossipComplete(player)
end

if(intid == 6012) then
player:SetModel(6915)
player:GossipComplete(player)
end

if(intid == 6011) then
player:SetModel(18505)
player:GossipComplete(player)
end

if(intid == 6010) then
player:SetModel(10753)
player:GossipComplete(player)
end

if(intid == 6009) then
player:SetModel(6909)
player:GossipComplete(player)
end

if(intid == 6008) then
player:SetModel(20658)
player:GossipComplete(player)
end

if(intid == 6007) then
player:SetModel(3020)
player:GossipComplete(player)
end

if(intid == 6006) then
player:SetModel(19971)
player:GossipComplete(player)
end

if(intid == 6005) then
player:SetModel(12489)
player:GossipComplete(player)
end

if(intid == 6004) then
player:SetModel(14273)
player:GossipComplete(player)
end

if(intid == 6003) then
player:SetModel(16841)
player:GossipComplete(player)
end

if(intid == 6002) then
player:SetModel(1555)
player:GossipComplete(player)
end

if(intid == 6001) then
player:SetModel(1269)
player:GossipComplete(player)
end

if(intid == 5001) then
player:SetModel(1269)
player:GossipComplete(player)
end

if(intid == 5002) then
player:SetModel(6977)
player:GossipComplete(player)
end

if(intid == 5003) then
player:SetModel(9476)
player:GossipComplete(player)
end

if(intid == 5004) then
player:SetModel(15922)
player:GossipComplete(player)
end

if(intid == 5005) then
player:SetModel(15402)
player:GossipComplete(player)
end

if(intid == 5006) then
player:SetModel(5386)
player:GossipComplete(player)
end

if(intid == 5007) then
player:SetModel(7288)
player:GossipComplete(player)
end

if(intid == 5008) then
player:SetModel(14376)
player:GossipComplete(player)
end

if(intid == 5009) then
player:SetModel(15381)
player:GossipComplete(player)
end

if(intid == 5010) then
player:SetModel(9473)
player:GossipComplete(player)
end

if(intid == 5011) then
player:SetModel(20417)
player:GossipComplete(player)
end

if(intid == 5012) then
player:SetModel(8369)
player:GossipComplete(player)
end

if(intid == 5013) then
player:SetModel(5299)
player:GossipComplete(player)
end

if(intid == 5014) then
player:SetModel(17423)
player:GossipComplete(player)
end

if(intid == 5015) then
player:SetModel(6980)
player:GossipComplete(player)
end
if(intid == 1001) then
player:SetModel(23200)
player:GossipComplete(player)
end

if(intid == 1002) then
player:SetModel(18292)
player:GossipComplete(player)
end

if(intid == 1003) then
player:SetModel(21630)
player:GossipComplete(player)
end

if(intid == 1004) then
player:SetModel(21069)
player:GossipComplete(player)
end

if(intid == 1005) then
player:SetModel(21069)
player:GossipComplete(player)
end

if(intid == 1006) then
player:SetModel(16416)
player:GossipComplete(player)
end

if(intid == 1007) then
player:SetModel(18526)
player:GossipComplete(player)
end

if(intid == 1008) then
player:SetModel(22711)
player:GossipComplete(player)
end

if(intid == 1009) then
player:SetModel(17887)
player:GossipComplete(player)
end

if(intid == 1010) then
player:SetModel(21435)
player:GossipComplete(player)
end

if(intid == 1011) then
player:SetModel(20662)
player:GossipComplete(player)
end

if(intid == 1012) then
player:SetModel(22838)
player:GossipComplete(player)
end

if(intid == 1013) then
player:SetModel(18698)
player:GossipComplete(player)
end

if(intid == 1014) then
player:SetModel(21443)
player:GossipComplete(player)
end

if(intid == 1015) then
player:SetModel(21632)
player:GossipComplete(player)
end

if(intid == 2001) then
player:SetModel(22332)
player:GossipComplete(player)
end

if(intid == 2002) then
player:SetModel(18239)
player:GossipComplete(player)
end

if(intid == 2003) then
player:SetModel(18649)
player:GossipComplete(player)
end

if(intid == 2004) then
player:SetModel(21174)
player:GossipComplete(player)
end

if(intid == 2005) then
player:SetModel(20162)
player:GossipComplete(player)
end

if(intid == 2006) then
player:SetModel(21135)
player:GossipComplete(player)
end

if(intid == 2007) then
player:SetModel(21633)
player:GossipComplete(player)
end

if(intid == 2008) then
player:SetModel(23487)
player:GossipComplete(player)
end

if(intid == 2009) then
player:SetModel(20023)
player:GossipComplete(player)
end

if(intid == 2010) then
player:SetModel(17886)
player:GossipComplete(player)
end

if(intid == 2011) then
player:SetModel(23200)
player:GossipComplete(player)
end

if(intid == 2012) then
player:SetModel(20748)
player:GossipComplete(player)
end

if(intid == 2013) then
player:SetModel(20514)
player:GossipComplete(player)
end

if(intid == 2014) then
player:SetModel(23404)
player:GossipComplete(player)
end

if(intid == 2015) then
player:SetModel(18527)
player:GossipComplete(player)
end

if(intid == 3001) then
player:SetModel(16198)
player:GossipComplete(player)
end

if(intid == 3002) then
player:SetModel(16540)
player:GossipComplete(player)
end

if(intid == 3003) then
player:SetModel(20739)
player:GossipComplete(player)
end

if(intid == 3004) then
player:SetModel(21252)
player:GossipComplete(player)
end

if(intid == 3005) then
player:SetModel(21631)
player:GossipComplete(player)
end

if(intid == 3006) then
player:SetModel(15363)
player:GossipComplete(player)
end

if(intid == 3007) then
player:SetModel(18062)
player:GossipComplete(player)
end

if(intid == 3008) then
player:SetModel(19274)
player:GossipComplete(player)
end

if(intid == 3009) then
player:SetModel(17444)
player:GossipComplete(player)
end

if(intid == 3010) then
player:SetModel(21146)
player:GossipComplete(player)
end

if(intid == 3011) then
player:SetModel(17067)
player:GossipComplete(player)
end

if(intid == 3012) then
player:SetModel(17068)
player:GossipComplete(player)
end

if(intid == 3013) then
player:SetModel(21357)
player:GossipComplete(player)
end

if(intid == 3014) then
player:SetModel(16621)
player:GossipComplete(player)
end

if(intid == 3015) then
player:SetModel(21145)
player:GossipComplete(player)
end

if(intid == 4001) then
player:SetModel(11343)
player:GossipComplete(player)
end

if(intid == 4002) then
player:SetModel(21576)
player:GossipComplete(player)
end

if(intid == 4003) then
player:SetModel(17053)
player:GossipComplete(player)
end

if(intid == 4004) then
player:SetModel(16958)
player:GossipComplete(player)
end

if(intid == 4005) then
player:SetModel(20216)
player:GossipComplete(player)
end

if(intid == 4006) then
player:SetModel(18951)
player:GossipComplete(player)
end

if(intid == 4007) then
player:SetModel(21899)
player:GossipComplete(player)
end

if(intid == 4008) then
player:SetModel(8570)
player:GossipComplete(player)
end

if(intid == 4010) then
player:SetModel(20628)
player:GossipComplete(player)
end


if(intid == 4009) then
player:SetModel(21349)
player:GossipComplete(player)
end

if(intid == 601) then 
item:GossipCreateMenu(1000, player, 0)
local race=player:GetPlayerRace()
if race==2 or race==5 or race==6 or race==8 or race==10 then
item:GossipMenuAddItem(4, "Horde Cities",200, 0)
end
local race=player:GetPlayerRace()
if race==1 or race==3 or race==4 or race==7 or race==11 then
item:GossipMenuAddItem(4, "Alliance Cities",201, 0)
end
item:GossipMenuAddItem(3, "AC-WEB Locations", 950, 0)
item:GossipMenuAddItem(3, "AC-WEB Events", 980, 0)
item:GossipMenuAddItem(3, "Start Area", 971, 0)
item:GossipMenuAddItem(3, "Party Area", 972, 0)
item:GossipMenuAddItem(3, "Northrend Locations", 648, 0)
item:GossipMenuAddItem(4, "Azeroth Instances", 205, 0)
item:GossipMenuAddItem(4, "Outland Instances", 206, 0)
item:GossipMenuAddItem(4, "PvP Arenas", 207, 0)
item:GossipMenuAddItem(1, "Dalaran", 649, 0)
item:GossipMenuAddItem(0, "[Back]", 9000, 0)
item:GossipSendMenu(player)
end

if(intid == 950) then 
item:GossipCreateMenu(10100, player, 0)
local race=player:GetPlayerRace()
if race==2 or race==5 or race==6 or race==8 or race==10 then
item:GossipMenuAddItem(4, "Icecrown Mall",960, 0)
end
local race=player:GetPlayerRace()
if race==1 or race==3 or race==4 or race==7 or race==11 then
item:GossipMenuAddItem(4, "Frozen Throne",961, 0)
end
item:GossipMenuAddItem(3, "Icecrown Mall", 962, 0)
item:GossipMenuAddItem(3, "Argent Mall Grounds", 963, 0)
item:GossipMenuAddItem(3, "Frozen Throne", 968, 0)
item:GossipMenuAddItem(3, "Pit of Soron", 964, 0)
item:GossipMenuAddItem(3, "Halls of Reflection ", 965, 0)
item:GossipMenuAddItem(4, "Forge of Souls", 966, 0)
item:GossipMenuAddItem(4, "Frozen Halls", 967, 0)
item:GossipMenuAddItem(4, "Onyxias's Lair", 969, 0)
item:GossipMenuAddItem(4, "Wintergrasp", 970, 0)


item:GossipMenuAddItem(0, "[Back]", 601, 0)
item:GossipSendMenu(player)
end


if (intid == 980) then
item:GossipCreateMenu(998, player, 0)
item:GossipMenuAddItem(2, "RedRidge Event", 964, 0)
item:GossipMenuAddItem(2, "BossFight Event", 965, 0)
item:GossipMenuAddItem(0, "[Back]", 601, 0)
item:GossipSendMenu(player)
end

if (intid == 201) then
item:GossipCreateMenu(99, player, 0)
item:GossipMenuAddItem(2, "Stormwind", 300, 0)
item:GossipMenuAddItem(2, "Ironforge", 301, 0)
item:GossipMenuAddItem(2, "Darnassus", 302, 0)
item:GossipMenuAddItem(2, "The Exodar", 303, 0)
item:GossipMenuAddItem(0, "[Back]", 601, 0)
item:GossipSendMenu(player)
end
if(intid == 648) then
item:GossipCreateMenu(70, player, 0)
item:GossipMenuAddItem(1, "Dragonblight", 650, 0)
item:GossipMenuAddItem(1, "Howling Fjord", 651, 0)
item:GossipMenuAddItem(1, "Grizzly Hills", 652, 0)
item:GossipMenuAddItem(1, "Icecrown", 653, 0)
item:GossipMenuAddItem(1, "Storm Peaks", 654, 0)
item:GossipMenuAddItem(1, "Zul'Drak", 655, 0)
item:GossipMenuAddItem(1, "Sholazar Basin", 656, 0)
item:GossipMenuAddItem(1, "Borean Tundra", 657, 0)
item:GossipMenuAddItem(1, "Wintergrasp", 658, 0)
item:GossipMenuAddItem(1, "Crystalsong", 659, 0)
item:GossipMenuAddItem(0, "[Back]", 601, 0)
item:GossipSendMenu(player)
end
if (intid == 200) then
item:GossipCreateMenu(99, player, 0) 
item:GossipMenuAddItem(2, "Orgrimmar", 304, 0)
item:GossipMenuAddItem(2, "The Undercity", 305, 0)
item:GossipMenuAddItem(2, "Thunder Bluff", 306, 0)
item:GossipMenuAddItem(2, "Silvermoon", 307, 0)
item:GossipMenuAddItem(0, "[Back]", 601, 0)
item:GossipSendMenu(player)
end
if (intid == 205) then
item:GossipCreateMenu(99, player, 0)
item:GossipMenuAddItem(2, "Shadowfang Keep", 371, 0)
item:GossipMenuAddItem(2, "Scarlet Monastery", 372, 0)
item:GossipMenuAddItem(2, "Zul'Farrak", 373, 0)
item:GossipMenuAddItem(2, "Stratholme", 374, 0)
item:GossipMenuAddItem(2, "Scholomance", 375, 0)
item:GossipMenuAddItem(2, "Blackrock Spire", 376, 0)
item:GossipMenuAddItem(2, "Onyxia's Lair", 377, 0)
item:GossipMenuAddItem(2, "Molten Core", 378, 0)
item:GossipMenuAddItem(2, "Zul'Gurub", 379, 0)
item:GossipMenuAddItem(2, "Karazhan", 380, 0)
item:GossipMenuAddItem(2, "Ahn'Qirai 20", 381, 0)
item:GossipMenuAddItem(2, "Ahn'Qirai 40", 382, 0)
item:GossipMenuAddItem(2, "Naxxramas", 383, 0)
item:GossipMenuAddItem(2, "Caverns of Time", 384, 0)
item:GossipMenuAddItem(0, "[Back]", 601, 0)
item:GossipSendMenu(player)
end
if (intid == 206) then
item:GossipCreateMenu(99, player, 0)
item:GossipMenuAddItem(2, "Outlands Raids", 285, 0)
item:GossipMenuAddItem(2, "Hellfire Ramparts", 386, 0)
item:GossipMenuAddItem(2, "The Blood Furnace", 387, 0)
item:GossipMenuAddItem(2, "The Shattered Halls", 388, 0)
item:GossipMenuAddItem(2, "The Underbog", 389, 0)
item:GossipMenuAddItem(2, "The Slave Pens", 390, 0)
item:GossipMenuAddItem(2, "The Steamvault", 391, 0)
item:GossipMenuAddItem(2, "Mana-Tombs", 392, 0)
item:GossipMenuAddItem(2, "Auchenai Crypts", 393, 0)
item:GossipMenuAddItem(2, "Sethekk Halls", 394, 0)
item:GossipMenuAddItem(2, "Shadow Labyrinth", 395, 0)
item:GossipMenuAddItem(2, "The Mechanar", 396, 0)
item:GossipMenuAddItem(2, "The Botanica", 397, 0)
item:GossipMenuAddItem(2, "The Arcatraz", 398, 0)
item:GossipMenuAddItem(0, "[Back]", 601, 0)
item:GossipSendMenu(player)
end
if (intid == 285) then
item:GossipCreateMenu(99, player, 0)
item:GossipMenuAddItem(2, "Magtheridon's Lair", 399, 0)
item:GossipMenuAddItem(2, "Serpentshrine Cavern", 400, 0)
item:GossipMenuAddItem(2, "Gruul's Lair", 401, 0)
item:GossipMenuAddItem(2, "The Eye", 402, 0)
item:GossipMenuAddItem(2, "Black Temple", 403, 0)
item:GossipMenuAddItem(0, "[Back]", 601, 0)
item:GossipSendMenu(player)
end
if (intid == 207) then
item:GossipCreateMenu(99, player, 0)
item:GossipMenuAddItem(2, "Gurabashi Arena", 410, 0)
item:GossipMenuAddItem(0, "[Back]", 601, 0)
item:GossipSendMenu(player)
end


if (intid == 1) then
item:GossipCreateMenu(800, player, 0)
item:GossipMenuAddItem(2, "Classtrainer Melee 1", 100, 0)
item:GossipMenuAddItem(2, "Classtrainer Melee 2", 101, 0)
item:GossipMenuAddItem(2, "Classtrainer Spell 1", 102, 0)
item:GossipMenuAddItem(2, "Classtrainer Spell 2", 103, 0)
item:GossipMenuAddItem(0, "[Back]", 600, 0)
item:GossipSendMenu(player)
end

if (intid == 2) then
item:GossipCreateMenu(501, player, 0)
item:GossipMenuAddItem(2, "Tier7  1 Vendor", 104, 0)
item:GossipMenuAddItem(2, "Tier7  2 Vendor", 105, 0)
item:GossipMenuAddItem(0, "[Back]", 600, 0)
item:GossipSendMenu(player)
end

if (intid == 3) then
item:GossipCreateMenu(502, player, 0)
item:GossipMenuAddItem(2, "Weapons 200+ Vendor", 106, 0)
item:GossipMenuAddItem(0, "[Back]", 600, 0)
item:GossipSendMenu(player)
end

if (intid == 4) then
item:GossipCreateMenu(503, player, 0)
item:GossipMenuAddItem(2, "Rings Vendor", 107, 0)
item:GossipMenuAddItem(2, "Necklace Vendor", 108, 0)
item:GossipMenuAddItem(2, "Shield Vendor", 108, 0)
item:GossipMenuAddItem(2, "Trinkets Vendor", 148, 0)
item:GossipMenuAddItem(0, "[Back]", 600, 0)
item:GossipSendMenu(player)
end

if (intid == 5) then
item:GossipCreateMenu(504, player, 0)
item:GossipMenuAddItem(2, "Tabard Vendor", 110, 0)
item:GossipMenuAddItem(2, "Cloak Vendor", 111, 0)
item:GossipMenuAddItem(0, "[Back]", 600, 0)
item:GossipSendMenu(player)
end

if (intid == 6) then
item:GossipCreateMenu(505, player, 0)
item:GossipMenuAddItem(2, "Season 5 Vendor", 112, 0)
item:GossipMenuAddItem(2, "Relic Vendor", 113, 0)
item:GossipMenuAddItem(2, "Container Vendor", 114, 0)
item:GossipMenuAddItem(0, "[Back]", 600, 0)
item:GossipSendMenu(player)
end

if (intid == 7) then
item:GossipCreateMenu(506, player, 0)
item:GossipMenuAddItem(2, "Glyph 1 Vendor", 115, 0)
item:GossipMenuAddItem(2, "Glyph 2 Vendor", 116, 0)
item:GossipMenuAddItem(2, "Wrist Vendor", 117, 0)
item:GossipMenuAddItem(0, "[Back]", 600, 0)
item:GossipSendMenu(player)
end

if (intid == 8) then
item:GossipCreateMenu(507, player, 0)
item:GossipMenuAddItem(2, "Book A-Z Vendor", 118, 0)
item:GossipMenuAddItem(2, "Leather A-Z Vendor", 119, 0)
item:GossipMenuAddItem(0, "[Back]", 600, 0)
item:GossipSendMenu(player)
end

if (intid == 9) then
item:GossipCreateMenu(508, player, 0)
item:GossipMenuAddItem(2, "Jewelcrafting A-Z Vendor", 120, 0)
item:GossipMenuAddItem(2, "Engineering/Enchanting A-Z Vendor", 121, 0)
item:GossipMenuAddItem(0, "[Back]", 600, 0)
item:GossipSendMenu(player)
end


if (intid == 10) then
item:GossipCreateMenu(509, player, 0)
item:GossipMenuAddItem(2, "Alchemy/Blacksmithing/Tailoring Vendor", 122, 0)
item:GossipMenuAddItem(0, "[Back]", 600, 0)
item:GossipSendMenu(player)
end

if (intid == 11) then
item:GossipCreateMenu(510, player, 0)
item:GossipMenuAddItem(2, "Waist Vendor", 123, 0)
item:GossipMenuAddItem(2, "Feet Vendor", 124, 0)
item:GossipMenuAddItem(2, "Heirloom Vendor", 125, 0)
item:GossipMenuAddItem(0, "[Back]", 600, 0)
item:GossipSendMenu(player)
end

if (intid == 12) then
item:GossipCreateMenu(511, player, 0)
item:GossipMenuAddItem(2, "Ground Mounts Vendor", 126, 0)
item:GossipMenuAddItem(2, "Flying MOunts Vendor", 127, 0)
item:GossipMenuAddItem(0, "[Back]", 600, 0)
item:GossipSendMenu(player)
end

if (intid == 13) then
item:GossipCreateMenu(512, player, 0)
item:GossipMenuAddItem(2, "Item Enhancement (Permanent) Vendor", 128, 0)
item:GossipMenuAddItem(2, "Item Enhancement (Temporary) Vendor", 129, 0)
item:GossipMenuAddItem(0, "[Back]", 600, 0)
item:GossipSendMenu(player)
end

if (intid == 14) then
item:GossipCreateMenu(513, player, 0)
item:GossipMenuAddItem(2, "Reagent ( Enchanting ) Vendor", 130, 0)
item:GossipMenuAddItem(2, "Reagent ( Leatherworking ) Vendor", 131, 0)
item:GossipMenuAddItem(2, "Reagent ( Blacksmithing ) Vendor", 132, 0)
item:GossipMenuAddItem(0, "[Back]", 600, 0)
item:GossipSendMenu(player)
end

if (intid == 9000) then
item:GossipCreateMenu(6666, player, 0)
item:GossipMenuAddItem(8, "[Mall Vendors]", 600, 0)
item:GossipMenuAddItem(8, "[Teleporter Services]", 601, 0)
item:GossipMenuAddItem(8, "[Morphing Services]", 602, 0)
item:GossipMenuAddItem(8, "[Jukebox]", 603, 0)         
item:GossipSendMenu(player)
end

if (intid == 16) then
item:GossipCreateMenu(514, player, 0)
item:GossipMenuAddItem(2, "Reagent ( Inscription ) Vendor", 133, 0)
item:GossipMenuAddItem(2, "Reagent ( Engineering ) Vendor", 134, 0)
item:GossipMenuAddItem(2, "Reagent ( Alchemy ) Vendor", 135, 0)
item:GossipMenuAddItem(2, "Reagent ( Tailoring ) Vendor", 136, 0)
item:GossipMenuAddItem(0, "[Back]", 600, 0)
item:GossipSendMenu(player)
end

if (intid == 17) then
item:GossipCreateMenu(515, player, 0)
item:GossipMenuAddItem(2, "General Goods Vendor", 137, 0)
item:GossipMenuAddItem(0, "[Back]", 600, 0)
item:GossipSendMenu(player)
end

if (intid == 18) then
item:GossipCreateMenu(516, player, 0)
item:GossipMenuAddItem(2, "Quiver, AmmoPouch, Projectile Vendor", 138, 0)
item:GossipMenuAddItem(0, "[Back]", 600, 0)
item:GossipSendMenu(player)
end

if (intid == 19) then
item:GossipCreateMenu(517, player, 0)
item:GossipMenuAddItem(2, "Currency Vendor", 139, 0)
item:GossipMenuAddItem(0, "[Back]", 600, 0)
item:GossipSendMenu(player)
end

if (intid == 20) then
item:GossipCreateMenu(518, player, 0)
item:GossipMenuAddItem(2, "Gemstone I Vendor", 140, 0)
item:GossipMenuAddItem(2, "Gemstone II Vendor", 141, 0)
item:GossipMenuAddItem(2, "Gemstone III", 142, 0)
item:GossipMenuAddItem(0, "[Back]", 600, 0)
item:GossipSendMenu(player)
end

if (intid == 21) then
item:GossipCreateMenu(519, player, 0)
item:GossipMenuAddItem(2, "Armor Tokens Vendor", 143, 0)
item:GossipMenuAddItem(2, "Keys Vendor", 144, 0)
item:GossipMenuAddItem(0, "[Back]", 600, 0)
item:GossipSendMenu(player)
end

if (intid == 22) then
item:GossipCreateMenu(520, player, 0)
item:GossipMenuAddItem(2, "Proffession Trainer I", 145, 0)
item:GossipMenuAddItem(2, "Proffession Trainer II", 149, 0)
item:GossipMenuAddItem(0, "[Back]", 600, 0)
item:GossipSendMenu(player)
end

if (intid == 23) then
item:GossipCreateMenu(521, player, 0)
item:GossipMenuAddItem(2, "Riding Trainer", 146, 0)
item:GossipMenuAddItem(0, "[Back]", 600, 0)
item:GossipSendMenu(player)
end

if (intid == 24) then
item:GossipCreateMenu(522, player, 0)
item:GossipMenuAddItem(2, "Weapons Trainer", 147, 0)
item:GossipMenuAddItem(0, "[Back]", 600, 0)
item:GossipSendMenu(player)
end

if (intid == 300) then 
player:Teleport(0, -9100.480469, 406.950745, 92.594185)
player:GossipComplete()
end
if (intid == 301) then 
player:Teleport(0, -5028.265137, -825.976563, 495.301575)
player:GossipComplete()
end
if (intid == 302) then
player:Teleport(1, 9985.907227, 1971.155640, 1326.815674)
player:GossipComplete()
end
if (intid == 303) then 
player:Teleport(530, -4072.202393, -12014.337891, -1.277277)
player:GossipComplete()
end
if (intid == 304) then 
player:Teleport(1, 1371.068970, -4370.801758, 26.052483)
player:GossipComplete()
end
if (intid == 305) then
player:Teleport(0, 2050.203125, 285.650604, 56.994549)
player:GossipComplete()
end
if (intid == 306) then
player:Teleport(1, -1304.569946, 205.285004, 68.681396)
player:GossipComplete()
end
if (intid == 307) then
player:Teleport(530, 9400.486328, -7278.376953, 14.206780)
player:GossipComplete()
end
if (intid == 370) then
player:Teleport(530, -2859.522461, 3182.34773, 10.008426);
player:GossipComplete()
end
if (intid == 371) then
player:Teleport(0, -234.495087, 1561.946411, 76.892143);
player:GossipComplete()
end
if (intid == 372) then
player:Teleport(0, 2870.442627, -819.985229, 160.331085);
player:GossipComplete()
end
if (intid == 373) then
player:Teleport(1, -6797.278809, -2903.917969, 9.953360);
player:GossipComplete()
end
if (intid == 374) then
player:Teleport(0, -11919.073242, -1202.459374, 92.298744);
player:GossipComplete()
end
if (intid == 375) then
player:Teleport(1, -8394.730469, 1485.658447, 21.038563);
player:GossipComplete()
end
if (intid == 376) then
player:Teleport(1, -8247.316406, 1970.156860, 129.071472);
player:GossipComplete()
end
if (intid == 377) then
player:Teleport(249, -49.740337,-98.675171, -38.678769);
player:GossipComplete()
end
if (intid == 378) then
player:Teleport(249, 30.0, -64.0, -5.0);
player:GossipComplete()
end
if (intid == 379) then
player:Teleport(533, 3006.06, -3436.72, 293.891);
player:GossipComplete()
end
if (intid == 380) then
player:Teleport(0, 1267.468628, -2556.651367, 94.127983);
player:GossipComplete()
end
if (intid == 381) then
player:Teleport(0, 3359.111572, -3380.8444238, 144.781860);
player:GossipComplete()
end
if (intid == 382) then
player:Teleport(0, -7527.129883, -1224.997437, 285.733002);
player:GossipComplete()
end
if (intid == 383) then
player:Teleport(532, -11087.3, -1977.47, 49.6135);
player:GossipComplete()
end
if (intid == 384) then
player:Teleport(1, -8519.718750, -4297.542480, -208.441376);
player:GossipComplete()
end
if (intid == 386) then
player:Teleport(530, -360.670990, 3071.899902, -15.097700);
player:GossipComplete()
end
if (intid == 387) then
player:Teleport(530, -303.506012, 3164.820068, 31.742500);
player:GossipComplete()
end
if (intid == 388) then
player:Teleport(530, -311.083527, 3083.291748, -3.745923);
player:GossipComplete()
end
if (intid == 389) then
player:Teleport(530, 777.088989, 6763.450195, -72.062561);
player:GossipComplete()
end
if (intid == 390) then
player:Teleport(530, 719.507996, 6999.339844, -73.074303);
player:GossipComplete()
end
if (intid == 391) then
player:Teleport(530, 816.590027, 6934.669922, -80.544601);
player:GossipComplete()
end
if (intid == 392) then
player:Teleport(530, -3079.810059, 4943.040039, -101.046997);
player:GossipComplete()
end
if (intid == 393) then
player:Teleport(530, -3361.959961, 5225.770020, -101.047997);
player:GossipComplete()
end
if (intid == 394) then
player:Teleport(530, -3362.219971, 4660.410156, -101.049004);
player:GossipComplete()
end
if (intid == 395) then
player:Teleport(530, -3645.060059, 4943.620117, -101.047997);
player:GossipComplete()
end
if (intid == 396) then
player:Teleport(530, 2862.409912, 1546.089966, 252.158691);
player:GossipComplete()
end
if (intid == 397) then
player:Teleport(530, 3413.649902, 1483.319946, 182.837997);
player:GossipComplete()
end
if (intid == 398) then
player:Teleport(530, 3311.598145, 1332.745117, 505.557251);
player:GossipComplete()
end
if (intid == 399) then
player:Teleport(530, -313.678986, 3088.350098, -116.501999);
player:GossipComplete()
end
if (intid == 400) then
player:Teleport(530, 830.542908, 6865.445801, -63.785503);
player:GossipComplete()
end
if (intid == 401) then
player:Teleport(530, 3549.424072, 5179.854004, -4.430779);
player:GossipComplete()
end
if (intid == 402) then
player:Teleport(530, 3087.310059, 1373.790039, 184.643005);
player:GossipComplete()
end
if (intid == 403) then
player:Teleport(564, 97.0894, 1001.96, -86.8798);
player:GossipComplete()
end
if (intid == 410) then
player:Teleport(0, -13243.240234, 197.949799, 32.112690);
player:GossipComplete()
end
if(intid == 650) then
player:Teleport(571, 2981.362305, 291.108032, 84.906631);
player:GossipComplete()
end
if(intid == 651) then
player:Teleport(571, 452.491608, -4010.313965, 268.903809);
player:GossipComplete()
end
if(intid == 652) then
player:Teleport(571, 3730.314453, -3859.454346, 183.489944);
player:GossipComplete()
end
if(intid == 653) then
player:Teleport(571, 6591.855469, 2451.750732, 467.928711);
player:GossipComplete()
end
if(intid == 654) then
player:Teleport(571, 7266.094238, -1338.805542, 911.679749);
player:GossipComplete()
end
if(intid == 655) then
player:Teleport(571, 5444.818848, -1746.449585, 248.347855);
player:GossipComplete()
end
if(intid == 656) then
player:Teleport(571, 4872.304688, 5535.682617, -62.462074);
player:GossipComplete()
end
if(intid == 657) then
player:Teleport(571, 4502.164551, 5560.019531, 51.479229);
player:GossipComplete()
end
if(intid == 658) then
player:Teleport(571, 4608.474121, 2847.145020, 396.896790);
player:GossipComplete()
end
if(intid == 659) then
player:Teleport(571, 5331.596191, 142.360580, 168.219833);
player:GossipComplete()
end
if(intid == 649) then
player:Teleport(571, 5806.516602, 628.091370, 647.240662);
player:GossipComplete()
end

if (intid == 100) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (400030, x, y, z, o, 35, 70000)
player:GossipComplete()
end


if (intid == 101) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (400040, x, y, z, o, 35, 70000)
player:GossipComplete()
end




if (intid == 102) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (400050, x, y, z, o, 35, 70000)
player:GossipComplete()
end



if (intid == 103) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (400060, x, y, z, o, 35, 70000)
player:GossipComplete()
end


if (intid == 104) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900005, x, y, z, o, 35, 70000)
player:GossipComplete()
end



if (intid == 105) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900006, x, y, z, o, 35, 70000)
player:GossipComplete()
end




if (intid == 106) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900007, x, y, z, o, 35, 70000)
player:GossipComplete()
end



if (intid == 107) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900009, x, y, z, o, 35, 70000)
player:GossipComplete()
end




if (intid == 108) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900010, x, y, z, o, 35, 70000)
player:GossipComplete()
end




if (intid == 109) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900011, x, y, z, o, 35, 70000)
player:GossipComplete()
end


if (intid == 110) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900008, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 110) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900012, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 111) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900015, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 112) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900013, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 113) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900014, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 114) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900016, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 115) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900017, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 116) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900018, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 117) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900019, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 118) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900020, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 119) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900021, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 120) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900022, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 121) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900023, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 122) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900024, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 123) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900025, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 124) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900026, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 125) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900027, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 126) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900028, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 127) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900029, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 128) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900030, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 129) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900031, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 130) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900032, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 131) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900033, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 132) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900034, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 133) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900035, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 134) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900036, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 135) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900037, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 136) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900038, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 137) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900039, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 138) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900041, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 139) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900043, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 140) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900044, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 141) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900045, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 142) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900046, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 143) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900047, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 144) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (900048, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 145) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (70006, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 146) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (7953, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 147) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (70002, x, y, z, o, 35, 70000)
player:GossipComplete()
end

if (intid == 149) then
local x =player:GetX ()
local y =player:GetY ()
local z =player:GetZ ()
local o =player:GetO ()
player:SpawnCreature (70007, x, y, z, o, 35, 70000)
player:GossipComplete()
end  



if(intid == 960) then
player:Teleport( 631, -62.000000, 2212.000000, 27.902721)
end


if(intid == 961) then
player:Teleport (631, -363.226410,2203.708984, 70.335487)
end


if(intid == 962) then
player:Teleport(631, -62.000000, 2212.000000, 27.902721)
end

if(intid == 963) then
player:Teleport(571,8567.905273, 953.127930, 547.553955)
end

if(intid == 964) then
player:Teleport(658,430.146,212.561, 528.708)
end

if (intid == 965) then 
player:Teleport(668,5241.26,1934.81, 707.695)
end


if(intid == 966) then
player:Teleport(632,4917.27,2185.41,638.734)
end


if(intid == 968) then
player:Teleport(631, -363.226410,2203.708984, 70.335487)
end

if(intid == 969) then
player:Teleport(249, -49.740337,-98.675171, -38.678769)
end

if(intid == 970) then
player:Teleport(571, 4608.474121, 2847.145020, 396.896790)
end


if(intid == 971) then
player:Teleport(1, 16227.8, 16403.4, -64.3793)
end


if(intid == 972) then
player:Teleport(0, -3692, -2270.53, 166.372)
end


if (intid == 967) then 
player:Teleport(571,5632.934570,2029.113159,798.273926 );
end
end




RegisterItemGossipEvent(6948,1,"Item_Trigger")
RegisterItemGossipEvent(6948,2,"OnSelect")