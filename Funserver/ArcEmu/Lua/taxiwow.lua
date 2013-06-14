function On_Gossip(unit, event, player)
unit:GossipCreateMenu(50, player, 0)
local race=player:GetPlayerRace()
if race==2 or race==5 or race==6 or race==8 or race==10 then
unit:GossipMenuAddItem(10, "[-- Horde Boss Area --]", 19001, 0)
unit:GossipMenuAddItem(10, "[-- InfinityWoW Horde Zones --]",500, 0)
unit:GossipMenuAddItem(10, "[-- InfinityWoW Horde Citys --]",1, 0)
end
local race=player:GetPlayerRace()
if race==1 or race==3 or race==4 or race==7 or race==11 then
unit:GossipMenuAddItem(10, "[-- Alliance Boss Area --]", 90002, 0)
unit:GossipMenuAddItem(10, "[-- InfinityWoW Alliance Zones --]",400, 0)
unit:GossipMenuAddItem(10, "[-- InfinityWoW Alliance Citys --]",2, 0)
end
unit:GossipMenuAddItem(10, "[-- LEVELING AREAS --]", 2950, 0)
unit:GossipMenuAddItem(10, "[-- Locations in Azeroth --]", 3, 0)
unit:GossipMenuAddItem(10, "[-- Instances in Azeroth --]", 5, 0)
unit:GossipMenuAddItem(10, "[-- Locations in Outland --]", 6, 0)
unit:GossipMenuAddItem(10, "[-- Instances in Outland --]", 7, 0)
unit:GossipMenuAddItem(10, "[-- InfinityWoW Arenas --]", 45,  0)
unit:GossipMenuAddItem(10, "[-- Buff Me --]", 99, 0)
unit:GossipMenuAddItem(10, "[-- Heal Me --]", 8080, 0)
unit:GossipMenuAddItem(10, "[-- Items of InfinityWoW --]", 902, 0)
unit:GossipMenuAddItem(10, "[-- Santhon World Boss --]", 1001, 0)
unit:GossipMenuAddItem(10, "[-- Remove Ressurection Sickness --]", 9090, 0)
unit:GossipMenuAddItem(10, "[-- Shadow Instance --]", 75000, 0)
player:SendBroadcastMessage("Hello there "..player:GetName()..", where are you going today!")
unit:GossipSendMenu(player)
end

function Gossip_Submenus(unit, event, player, id, intid, code)
if(intid == 75) then
unit:GossipCreateMenu(50, player, 0)
local race=player:GetPlayerRace()
if race==2 or race==5 or race==6 or race==8 or race==10 then
unit:GossipMenuAddItem(10, "[-- Horde Boss Area --]", 19001, 0)
unit:GossipMenuAddItem(10, "[-- InfinityWoW Horde Zones --]",500, 0)
unit:GossipMenuAddItem(10, "[-- InfinityWoW Horde Citys --]",1, 0)
end
local race=player:GetPlayerRace()
if race==1 or race==3 or race==4 or race==7 or race==11 then
unit:GossipMenuAddItem(10, "[-- Alliance Boss Area --]", 90002, 0)
unit:GossipMenuAddItem(10, "[-- InfinityWoW Alliance Zones --]",400, 0)
unit:GossipMenuAddItem(10, "[-- InfinityWoW Alliance Citys --]",2, 0)
end
unit:GossipMenuAddItem(10, "[-- LEVELING AREAS --]", 2950, 0)
unit:GossipMenuAddItem(10, "[-- Locations in Azeroth --]", 3, 0)
unit:GossipMenuAddItem(10, "[-- Instances in Azeroth --]", 5, 0)
unit:GossipMenuAddItem(10, "[-- Locations in Outland --]", 6, 0)
unit:GossipMenuAddItem(10, "[-- Instances in Outland --]", 7, 0)
unit:GossipMenuAddItem(10, "[-- InfinityWoW Arenas --]", 45,  0)
unit:GossipMenuAddItem(10, "[-- Buff Me --]", 99, 0)
unit:GossipMenuAddItem(10, "[-- Heal Me --]", 8080, 0)
unit:GossipMenuAddItem(10, "[-- Items of InfinityWoW --]", 902, 0)
unit:GossipMenuAddItem(10, "[-- Santhon World Boss --]", 1001, 0)
unit:GossipMenuAddItem(10, "[-- Remove Ressurection Sickness --]", 9090, 0)
unit:GossipMenuAddItem(10, "[-- Shadow Instance --]", 75000, 0)
unit:GossipSendMenu(player)
end

if(intid == 500) then
if (player:IsInCombat() == true) then
player:SetHealthPct(1)
unit:SendChatMessage(12, 0, ""..player:GetName().." Tried to espace from hes fight! Its so pathetic, hes health is lowered! Now get him guys!")
else
unit:GossipCreateMenu(55, player, 0)
unit:GossipMenuAddItem(10, "[-- Global Mall Zone --]", 6666, 0)
unit:GossipMenuAddItem(10, "[-- Horde Mall Zone --]", 578, 0)
unit:GossipMenuAddItem(10, "[-- Horde Start Area --]", 2903, 0)
unit:GossipMenuAddItem(10, "[-- Jamitos Level 200 Boss --]", 19000, 0)
unit:GossipMenuAddItem(10, "[-- Horde Boss 255 --]", 19001, 0)
unit:GossipMenuAddItem(10, "[-- GM OFFICE --]", 118, 0)
player:SendAreaTriggerMessage("Have fun and remember to vote!")
unit:GossipMenuAddItem(10, "|Main Menu|", 75, 0)
unit:GossipSendMenu(player)
end
end

if(intid == 19001) then
if (player:GetPlayerLevel() == 255) then
unit:GossipCreateMenu(55, player, 0)
unit:GossipMenuAddItem(10, "|-------|", 1502, 0)
unit:GossipSendMenu(player)
else
player:SendAreaTriggerMessage("You must be level 255 to attack this boss!")
end
end

if(intid == 19000) then
if (player:GetPlayerLevel() >= 200) then
unit:GossipCreateMenu(55, player, 0)
unit:GossipMenuAddItem(10, "|-------|", 15000, 0)
unit:GossipSendMenu(player)
else
player:SendAreaTriggerMessage("You must be level 200 or higher to attack this boss!")
end
end

if(intid == 17070) then
player:Teleport(0, -1042.877441, -3551.302246, 54.977585)
end

if(intid == 7070) then
player:Teleport(1, 7309.867188, -887.541931, 31.559586)
end

if(intid == 7071) then
player:Teleport(0, -246.918533, 1532.947632, 77.121796)
end

if(intid == 12904) then
player:Teleport(0, -47343.663574, -3111.000977, 308.573029)
end

if(intid == 12905) then
player:Teleport(0, -4771.063965, -3525.218018, 303.590790)
end

if(intid == 29030) then
player:Teleport(1, 6500.379883, -2364.060059, 594.765686)
end

if(intid == 2904) then
player:Teleport(1, -6287.853516, -383.331238, -0.947034)
end

if(intid == 12903) then
player:Teleport(1, 1274.176392, -4331.429199, 33.097721)
end

if(intid == 2905) then
player:Teleport(1, -5660.225098, -3493.307617, -57.450867)
end

if(intid == 12905) then
player:Teleport(0, -11298.624023, -367.173950, 65.445702)
end

if(intid == 29103) then
player:Teleport(530, 6654.667969, -6458.312988, 29.2593025)
end

if(intid == 29102) then
if (player:IsInCombat() == true) then
player:SetHealthPct(1)
unit:SendChatMessage(12, 0, ""..player:GetName().." Tried to espace from hes fight! Its so pathetic, hes health is lowered! Now get him guys!")
else
unit:GossipCreateMenu(51, player, 0)
unit:GossipMenuAddItem(10, "Go To Leveling Road", 29103, 0)
unit:GossipMenuAddItem(10, "[-- Main Menu --]", 75, 0)
player:SendAreaTriggerMessage("Have fun leveling and remember to vote!")
unit:GossipSendMenu(player)
end
end

if(intid == 29101) then
player:Teleport(0, -11665.720703, -2371.583252, 0.551880)
end

if(intid == 29100) then
if (player:GetPlayerLevel() >= 85) then
unit:SendChatMessage(12, 0, ""..player:GetName().." Why you wish to be teleported to such a low level area? Your waisting your time there!")
else
unit:GossipCreateMenu(51, player, 0)
unit:GossipMenuAddItem(10, "Go To Starting Road", 29101, 0)
unit:GossipMenuAddItem(10, "[-- Main Menu --]", 75, 0)
player:SendAreaTriggerMessage("Have fun leveling and remember to vote!")
unit:GossipSendMenu(player)
end
end

if(intid == 2903) then
local race=player:GetPlayerRace()
if race==1 or race==3 or race==4 or race==7 or race==11 then
unit:SendChatMessage(12, 0, ""..player:GetName().." You can't go to Horde Starting road when your an enemy to the Horde!")
else
unit:GossipCreateMenu(51, player, 0)
unit:GossipMenuAddItem(10, "Go To Starting Road", 29030, 0)
unit:GossipMenuAddItem(10, "[-- Main Menu --]", 75, 0)
player:SendAreaTriggerMessage("Have fun leveling and remember to vote!")
unit:GossipSendMenu(player)
end
end

if(intid == 2906) then
local race=player:GetPlayerRace()
if race==2 or race==5 or race==6 or race==8 or race==10 then
unit:SendChatMessage(12, 0, ""..player:GetName().." You can't go to Alliance Starting road when your an enemy to the Alliance!")
else
unit:GossipCreateMenu(51, player, 0)
unit:GossipMenuAddItem(10, "Go To Starting Road", 29060, 0)
unit:GossipMenuAddItem(10, "[-- Main Menu --]", 75, 0)
player:SendAreaTriggerMessage("Have fun leveling and remember to vote!")
unit:GossipSendMenu(player)
end
end

if(intid == 29060) then
player:Teleport(1, 5479.136719, -3730.750000, 1593.439941)
end

if(intid == 2951) then
player:Teleport(1, 1814.209961, -4418.845215, -18.449379)
end

if(intid == 2952) then
player:Teleport(469, -7665.308105, -1101.903564, 399.679382)
end

if(intid == 2953) then
player:Teleport(0, -248.317825, 1527.978882, 77.162613)
end

if(intid == 400) then
if (player:IsInCombat() == true) then
player:SetHealthPct(1)
unit:SendChatMessage(12, 0, ""..player:GetName().." Tried to espace from hes fight! Its so pathetic, hes health is lowered! Now get him guys!")
else
unit:GossipCreateMenu(55, player, 0)
unit:GossipMenuAddItem(10, "[-- Global Mall Zone --]", 6666, 0)
unit:GossipMenuAddItem(10, "[-- Alliance Mall Zone --]", 567, 0)
unit:GossipMenuAddItem(10, "[-- Alliance Start Area --]", 2906, 0)
unit:GossipMenuAddItem(10, "|cffFFFF05[-- Alliance Boss 255 --]", 90002, 0)
unit:GossipMenuAddItem(10, "[-- Jamitos Level 200 Boss --]", 11500, 0)
player:SendAreaTriggerMessage("Have fun and remember to vote!")
unit:GossipMenuAddItem(10, "[-- Main Menu --]", 75, 0)
unit:GossipMenuAddItem(10, "GM OFFICE", 118, 0)
unit:GossipSendMenu(player)
end
end

if(intid == 90002) then
if (player:GetPlayerLevel() == 255) then
unit:GossipCreateMenu(55, player, 0)
unit:GossipMenuAddItem(10, "|-------|", 90003, 0)
unit:GossipSendMenu(player)
else
player:SendAreaTriggerMessage("You must be level 255 to attack this boss!")
end
end

if(intid == 90003) then
player:Teleport(1, 3172.926758, -3712.650146, 123.355141)
end

if(intid == 11500) then
if (player:GetPlayerLevel() >= 200) then
unit:GossipCreateMenu(55, player, 0)
unit:GossipMenuAddItem(10, "|-------|", 1500, 0)
unit:GossipSendMenu(player)
else
player:SendAreaTriggerMessage("You must be level 200 or higher to attack this boss!")
end
end

if(intid == 2950) then
if (player:IsInCombat() == true) then
player:SetHealthPct(1)
unit:SendChatMessage(12, 0, "Using me in combat to escape tahts noobie! Your health is lowered as Punishment!")
else
unit:GossipCreateMenu(51, player, 0)
unit:GossipMenuAddItem(10, "|cffFF0000|--- |cff000000STARTING ROADS |cffFF0000---|", 2950, 0)
unit:GossipMenuAddItem(10, "[-- Alliance Start Area --]", 2906, 0)
unit:GossipMenuAddItem(10, "[-- Horde Start Area --]", 2903, 0)
unit:GossipMenuAddItem(10, "[-- Global Starting Road --]", 29100, 0)
unit:GossipMenuAddItem(10, "|cffFF0000|--- |cff000000INSTANCES |cffFF0000---|", 2950, 0)
unit:GossipMenuAddItem(10, "[-- Cave of Rage 70-150 --]", 2951, 0)
unit:GossipMenuAddItem(10, "[-- Lair of the Blackwing 150-255 --]", 2952, 0)
unit:GossipMenuAddItem(10, "[-- Shadow of the Keep 100-200 --]", 2953, 0)
unit:GossipMenuAddItem(10, "|cffFF0000|--- |cff000000LEVELING ROADS |cffFF0000---|", 2950, 0)
unit:GossipMenuAddItem(10, "[-- Global: Path of the Damned --]", 29102, 0)
unit:GossipMenuAddItem(10, "[-- Alpha: Quick Road 200-255 --]", 7070, 0)
unit:GossipMenuAddItem(10, "[-- Omega: Quick Road 200-255 --]", 17070, 0)
unit:GossipMenuAddItem(10, "|cff990000[Main Menu]", 75, 0)
unit:GossipSendMenu(player)
end
end

if(intid == 45) then
if (player:IsInCombat() == true) then
player:SetHealthPct(1)
unit:SendChatMessage(12, 0, ""..player:GetName().." Tried to espace from hes fight! Its so pathetic, hes health is lowered! Now get him guys!")
else
if (player:GetPlayerLevel() == 255) then
unit:GossipCreateMenu(51, player, 0)
unit:GossipMenuAddItem(10, "[-- Gurubashi Arena --]", 777, 0)
unit:GossipMenuAddItem(10, "[-- Blood Arena --]", 778, 0)
unit:GossipMenuAddItem(10, "[-- Blood Ring --]", 779, 0)
unit:GossipMenuAddItem(10, "[-- The Cube --]", 776, 0)
unit:GossipMenuAddItem(10, "[-- The Maul --]", 709, 0)
unit:GossipMenuAddItem(10, "|cff990000[Main Menu]", 75, 0)
player:SendAreaTriggerMessage("HaHa you will get your ass kicked in our arenas!")
unit:GossipSendMenu(player)
else
player:SendAreaTriggerMessage("Sorry you have to be level 255 to enter our arenas!")
end
end
end

if(intid == 15000) then
player:Teleport(1, 7567.507324, -2891.146240, 460.661255)
end

if(intid == 2900) then
player:Teleport(1, -4285.628418, -785.919495, -52.691986)
end

if(intid == 2901) then
player:Teleport(1, -6286.524902, -385.810486, 1.208365)
end

if(intid == 1) then
if (player:IsInCombat() == true) then
player:SetHealthPct(1)
unit:SendChatMessage(12, 0, ""..player:GetName().." Tried to espace from hes fight! Its so pathetic, hes health is lowered! Now get him guys!")
else
unit:GossipCreateMenu(51, player, 0)
unit:GossipMenuAddItem(10, "[-- Orgrimmar --]", 10, 0)
unit:GossipMenuAddItem(10, "[-- Undercity --]", 11, 0)
unit:GossipMenuAddItem(10, "[-- Thunder Bluff --]", 12, 0)
unit:GossipMenuAddItem(10, "[-- Silvermoon --]", 13, 0)
unit:GossipMenuAddItem(10, "[-- Dalaran --]", 46,  0)
unit:GossipMenuAddItem(10, "|cff990000[Main Menu]", 75, 0)
unit:GossipSendMenu(player)
end
end

if(intid == 2) then
if (player:IsInCombat() == true) then
player:SetHealthPct(1)
unit:SendChatMessage(12, 0, ""..player:GetName().." Tried to espace from hes fight! Its so pathetic, hes health is lowered! Now get him guys!")
else
unit:GossipCreateMenu(52, player, 0)
unit:GossipMenuAddItem(10, "[-- Stormwind --]", 14, 0)
unit:GossipMenuAddItem(10, "[-- Ironforge --]", 15, 0)
unit:GossipMenuAddItem(10, "[-- Darnassus --]", 16, 0)
unit:GossipMenuAddItem(10, "[-- Exodar --]", 17, 0)
unit:GossipMenuAddItem(10, "[-- Dalaran|", 46,  0)
unit:GossipMenuAddItem(10, "|cff990000[Main Menu]", 75, 0)
unit:GossipSendMenu(player)
end
end

if(intid == 3) then
if (player:IsInCombat() == true) then
player:SetHealthPct(1)
unit:SendChatMessage(12, 0, ""..player:GetName().." Tried to espace from hes fight! Its so pathetic, hes health is lowered! Now get him guys!")
else
unit:GossipCreateMenu(53, player, 0)
unit:GossipMenuAddItem(10, "|Eastern Kingdoms|", 40, 0)
unit:GossipMenuAddItem(10, "|Kalimdor|", 41, 0)
unit:GossipMenuAddItem(10, "|cff990000[Main Menu]", 75, 0)
unit:GossipSendMenu(player)
end
end

if(intid == 40) then
if (player:IsInCombat() == true) then
player:SetHealthPct(1)
unit:SendChatMessage(12, 0, ""..player:GetName().." Tried to espace from hes fight! Its so pathetic, hes health is lowered! Now get him guys!")
else
unit:GossipCreateMenu(54, player, 0)
unit:GossipMenuAddItem(10, "|Alterac Mountains|", 208, 0)
unit:GossipMenuAddItem(10, "|Badlands|", 214, 0)
unit:GossipMenuAddItem(10, "|Blasted Lands|", 222, 0)
unit:GossipMenuAddItem(10, "|Burning Steppes|", 216, 0)
unit:GossipMenuAddItem(10, "|Deadwind Pass|", 221, 0)
unit:GossipMenuAddItem(10, "|Dun Morogh|", 212, 0)
unit:GossipMenuAddItem(10, "|Duskwood|", 220, 0)
unit:GossipMenuAddItem(10, "|Eastern Plaguelands|", 206, 0)
unit:GossipMenuAddItem(10, "|Elwynn Forest|", 217, 0)
unit:GossipMenuAddItem(10, "|Eversong Woods|", 201, 0)
unit:GossipMenuAddItem(10, "|Ghostlands|", 202, 0)
unit:GossipMenuAddItem(10, "-->Second Page-->", 43, 0)
unit:GossipMenuAddItem(10, "|cff990000[Back]", 3, 0)
unit:GossipMenuAddItem(10, "|cff990000[Main Menu]", 75, 0)
unit:GossipSendMenu(player)
end
end

if(intid == 8080) then
unit:GossipCreateMenu(55, player, 0)
if (player:IsInCombat() == true) then
player:SetHealthPct(5)
unit:SendChatMessage(12, 0, "You Cant Use Heal In Combat Noob! Your health is Lowered As Punishment!")
else
unit:GossipMenuAddItem(10, "Hello i can heal you, but if you try to heal in combat ill get mad!", 8080, 0)
unit:GossipMenuAddItem(10, "Is that a deal?!", 8081, 0)
unit:GossipSendMenu(player)
end
end

if(intid == 8081) then
if (player:GetHealthPct() == 100) then
player:SendAreaTriggerMessage("You allready have max health, why you seek healing?")
else
unit:GossipCreateMenu(55, player, 0)
unit:GossipMenuAddItem(10, "|-------|", 8082, 0)
unit:GossipSendMenu(player)
end
end

if(intid == 8082) then
if (player:IsInCombat() == true) then
player:SetHealthPct(5)
unit:SendChatMessage(12, 0, "You Cant Use Heal In Combat Noob! Your health is Lowered As Punishment!")
else
player:SendAreaTriggerMessage("You have been healed to max, remember to vote!")
player:SetHealthPct(100)
player:GossipComplete()
end
end

if(intid == 41) then
if (player:IsInCombat() == true) then
player:SetHealthPct(1)
unit:SendChatMessage(12, 0, ""..player:GetName().." Tried to espace from hes fight! Its so pathetic, hes health is lowered! Now get him guys!")
else
unit:GossipCreateMenu(55, player, 0)
unit:GossipMenuAddItem(10, "|Ashenvale|", 109, 0)
unit:GossipMenuAddItem(10, "|Azuremyst Isle|", 103, 0)
unit:GossipMenuAddItem(10, "|Bloodmyst Isle|", 102, 0)
unit:GossipMenuAddItem(10, "|Darkshore|", 105, 0)
unit:GossipMenuAddItem(10, "|Desolace|", 113, 0)
unit:GossipMenuAddItem(10, "|Durotar|", 111, 0)
unit:GossipMenuAddItem(10, "|Dustwallow Marsh|", 117, 0)
unit:GossipMenuAddItem(10, "|Felwood|", 107, 0)
unit:GossipMenuAddItem(10, "|Feralas|", 116, 0)
unit:GossipMenuAddItem(10, "|Moonglade|", 106, 0)
unit:GossipMenuAddItem(10, "|Mulgore|", 115, 0)
unit:GossipMenuAddItem(10, "|Silithus|", 120, 0)
unit:GossipMenuAddItem(10, "-->Second Page-->", 43, 0)
unit:GossipMenuAddItem(10, "|cff990000[Back]", 3, 0)
unit:GossipMenuAddItem(10, "|cff990000[Main Menu]", 75, 0)
unit:GossipSendMenu(player)
end
end

if(intid == 42) then
if (player:IsInCombat() == true) then
player:SetHealthPct(1)
unit:SendChatMessage(12, 0, ""..player:GetName().." Tried to espace from hes fight! Its so pathetic, hes health is lowered! Now get him guys!")
else
unit:GossipCreateMenu(55, player, 0)
unit:GossipMenuAddItem(10, "|Hillsbrad Foothills|", 210, 0)
unit:GossipMenuAddItem(10, "|Loch Modan|", 213, 0)
unit:GossipMenuAddItem(10, "|Redridge Mountains|", 218, 0)
unit:GossipMenuAddItem(10, "|Searing Gorge|", 215, 0)
unit:GossipMenuAddItem(10, "|Silverpine Forest|", 207, 0)
unit:GossipMenuAddItem(10, "|Strangethorn Vale|", 223, 0)
unit:GossipMenuAddItem(10, "|Swamp Of Sorrows|", 219, 0)
unit:GossipMenuAddItem(10, "|The Hinterlands|", 209, 0)
unit:GossipMenuAddItem(10, "|Trisfal Glades|", 205, 0)
unit:GossipMenuAddItem(10, "|Western Plaguelands|", 203, 0)
unit:GossipMenuAddItem(10, "|Wetlands|", 211, 0)
unit:GossipMenuAddItem(10, "|cff990000[Back]", 3, 0)
unit:GossipMenuAddItem(10, "|cff990000[Main Menu]", 75, 0)
unit:GossipSendMenu(player)
end
end

if(intid == 43) then
if (player:IsInCombat() == true) then
player:SetHealthPct(1)
unit:SendChatMessage(12, 0, ""..player:GetName().." Tried to espace from hes fight! Its so pathetic, hes health is lowered! Now get him guys!")
else
unit:GossipCreateMenu(55, player, 0)
unit:GossipMenuAddItem(10, "|Stonetalon Mountains|", 112, 0)
unit:GossipMenuAddItem(10, "|Tanaris|", 121, 0)
unit:GossipMenuAddItem(10, "|Teldrassil|", 100, 0)
unit:GossipMenuAddItem(10, "|The Barrens|", 114, 0)
unit:GossipMenuAddItem(10, "|Thousand Needles|", 118, 0)
unit:GossipMenuAddItem(10, "|Un'Goro Crater|", 119, 0)
unit:GossipMenuAddItem(10, "|cff990000[Back]", 3, 0)
unit:GossipMenuAddItem(10, "|cff990000[Main Menu]", 75, 0)
unit:GossipSendMenu(player)
end
end

if(intid == 1001) then
if (player:IsInCombat() == true) then
player:SetHealthPct(1)
unit:SendChatMessage(12, 0, ""..player:GetName().." Tried to espace from hes fight! Its so pathetic, hes health is lowered! Now get him guys!")
player:GossipComplete()
else
unit:GossipCreateMenu(55, player, 0)
unit:GossipMenuAddItem(10, "Go Fight The Boss!", 10020, 0)
unit:GossipMenuAddItem(10, "Now Now!", 9093, 0)
player:SendBroadcastMessage("|cffFF0000You must have 1 [|cffFFFF05Gem of Immortal Power|cffFF0000] Its dropped by the level 255 Bosses! - |cffFF0000if you already have a gem, skip this message.")
unit:GossipSendMenu(player)
end
end

if(intid == 10020) then
if (player:GetPlayerLevel() == 255) then
unit:GossipCreateMenu(55, player, 0)
unit:GossipMenuAddItem(10, "|-------|", 10021, 0)
player:SendBroadcastMessage("|cffFF0000You must have 1 [|cffFFFF05Gem of Immortal Power|cffFF0000] Its dropped by the level 255 Bosses! - |cffFF0000if you already have a gem, skip this message.")
unit:GossipSendMenu(player)
else
player:SendAreaTriggerMessage("You must be level 255 to fight this boss!")
player:GossipComplete()
end
end

if(intid == 10021) then
if player:HasItem(29750) then
unit:GossipCreateMenu(55, player, 0)
unit:GossipMenuAddItem(10, "|-------|", 10019, 0)
unit:GossipSendMenu(player)
else
player:SendBroadcastMessage("|cffFF0000You must have 1 [|cffFFFF05Gem of Immortal Power|cffFF0000] Its dropped by the level 255 Bosses! - |cffFF0000if you already have a gem, skip this message.")
player:GossipComplete()
end
end

if(intid == 75000) then
if (player:GetPlayerLevel() == 255) then
unit:GossipCreateMenu(55, player, 0)
unit:GossipMenuAddItem(10, "|-------|", 75001, 0)
unit:GossipSendMenu(player)
player:SendBroadcastMessage("|cffFF0000You must have 1 [|cffFFFF05Gem of Immortal Power|cffFF0000] Its dropped by the level 255 Bosses! - |cffFF0000if you already have a gem, skip this message.")
else
player:SendAreaTriggerMessage("You must be level 255 to access this instance!")
player:GossipComplete()
end
end

if(intid == 75001) then
if player:HasItem(29750) then
player:Teleport(530, -3514.047607, 4942.769531, -101.395370)
else
player:SendBroadcastMessage("|cffFF0000You must have 1 [|cffFFFF05Gem of Immortal Power|cffFF0000] Its dropped by the level 255 Bosses! - |cffFF0000if you already have a gem, skip this message.")
player:GossipComplete()
end
end

if(intid == 75002) then
player:Teleport(530, -3514.047607, 4942.769531, -101.395370)
end

if(intid == 1000) then
player:Teleport(469, -7665.006348, -1102.048950, 399.679230)
end

if(intid == 10019) then
player:Teleport(571, 7371.120117, -527.588928, 1897.495728)
end

if(intid == 1002) then
player:Teleport(530, 2891.586670, 1572.162720, 248.763815)
end

if(intid == 1500) then
player:Teleport(0, 334.382446, 372.605347, -38.309719)
end

if(intid == 1501) then
player:Teleport(0, -10428.820313, -422.008423, 44.391155)
end

if(intid == 1502) then
player:Teleport(0, -10428.820313, -422.008423, 44.391155)
end

if(intid == 834) then
player:Teleport(43, -161.737076, 132.046326, -73.882683)
end 

if(intid == 1010) then
player:Teleport(1, 6925.790039, -2274.969971, 590.013000)
end

if(intid == 1011) then
player:Teleport(1, 4582.560059, -3820.830078, 978.575012)
end

if(intid == 1012) then
player:Teleport(1, 1814.668335, -4419.4147480, -18.812292)
end

if(intid == 835) then
player:Teleport(48, -151.889999, 106.959999, -39.869999)
end 

if(intid == 836) then
player:Teleport(47, 1943.000000, 1544.630005, 81.997025)
end 

if(intid == 837) then
player:Teleport(189, 1691.010010, 1053.744507, 18.677431)
end 

if(intid == 838) then
player:Teleport(189, 862.380432, 1321.962036, 18.676479)
end

if(intid == 839) then
player:Teleport(189, 1614.569580, -323.615875, 18.675322)
end

if(intid == 820) then
player:Teleport(189, 257.482117, -209.070969, 18.677341)
end 

if(intid == 821) then
player:Teleport(209, 1221.819946, 840.745972, 8.976506)
end 

if(intid == 822) then
player:Teleport(0, -10265.416016, -3887.859131, -38.769176)
end

if(intid == 5) then
if (player:IsInCombat() == true) then
player:SetHealthPct(1)
unit:SendChatMessage(12, 0, ""..player:GetName().." Tried to espace from hes fight! Its so pathetic, hes health is lowered! Now get him guys!")
else
unit:GossipCreateMenu(56, player, 0)
unit:GossipMenuAddItem(10, "|Shadowfang Keep|", 19, 0)
unit:GossipMenuAddItem(10, "|Zul'Gurub|", 20, 0)
unit:GossipMenuAddItem(10, "|Scarlet Monastery|", 21, 0)
unit:GossipMenuAddItem(10, "|Stratholme|", 22, 0)
unit:GossipMenuAddItem(10, "|Scholomance|", 23, 0)
unit:GossipMenuAddItem(10, "|Blackrock|", 24, 0)
unit:GossipMenuAddItem(10, "|Onyxia's Lair|", 25, 0)
unit:GossipMenuAddItem(10, "|Molten Core|", 26, 0)
unit:GossipMenuAddItem(10, "|Karazhan|", 27, 0)
unit:GossipMenuAddItem(10, "|Naxxramas|", 28, 0)
unit:GossipMenuAddItem(10, "|Caverns Of Time|", 29, 0)
unit:GossipMenuAddItem(10, "|cff990000[Main Menu]", 75, 0)
unit:GossipSendMenu(player)
end
end

if(intid == 6) then
if (player:IsInCombat() == true) then
player:SetHealthPct(1)
unit:SendChatMessage(12, 0, ""..player:GetName().." Tried to espace from hes fight! Its so pathetic, hes health is lowered! Now get him guys!")
else
unit:GossipCreateMenu(57, player, 0)
unit:GossipMenuAddItem(10, "|Hellfire|", 30, 0)
unit:GossipMenuAddItem(10, "|Zangremarsh|", 31, 0)
unit:GossipMenuAddItem(10, "|Nagrand|", 32, 0)
unit:GossipMenuAddItem(10, "|Blades Edge|", 33, 0)
unit:GossipMenuAddItem(10, "|Netherstorm|", 34, 0)
unit:GossipMenuAddItem(10, "|Terokkar Forest|", 35, 0)
unit:GossipMenuAddItem(10, "|Shadowmoon Valley|", 36, 0)
unit:GossipMenuAddItem(10, "|Shattrath|", 37, 0)
unit:GossipMenuAddItem(10, "|cff990000[Main Menu]", 75, 0)
unit:GossipSendMenu(player)
end
end

if(intid == 7) then
if (player:IsInCombat() == true) then
player:SetHealthPct(1)
unit:SendChatMessage(12, 0, ""..player:GetName().." Tried to espace from hes fight! Its so pathetic, hes health is lowered! Now get him guys!")
else
unit:GossipCreateMenu(58, player, 0)
unit:GossipMenuAddItem(10, "|Outland Raids|", 41, 0)
unit:GossipMenuAddItem(10, "|Hellfire Ramparts|", 430, 0)
unit:GossipMenuAddItem(10, "|The BloodFurnace|", 431, 0)
unit:GossipMenuAddItem(10, "|Shattered Halls|", 441, 0)
unit:GossipMenuAddItem(10, "|Mana-Tombs|", 434, 0)
unit:GossipMenuAddItem(10, "|Sethekk Halls|", 438, 0)
unit:GossipMenuAddItem(10, "|Auchenai Crypts|", 435, 0)
unit:GossipMenuAddItem(10, "|cff990000-->Second Page-->", 47, 0)
unit:GossipMenuAddItem(10, "|cff990000[Main Menu]", 75, 0)
unit:GossipSendMenu(player)
end
end

if(intid == 47) then
if (player:IsInCombat() == true) then
player:SetHealthPct(1)
unit:SendChatMessage(12, 0, ""..player:GetName().." Tried to espace from hes fight! Its so pathetic, hes health is lowered! Now get him guys!")
else
unit:GossipCreateMenu(59, player, 0)
unit:GossipMenuAddItem(10, "|Gruul's Lair|", 446, 0)
unit:GossipMenuAddItem(10, "|Magtheridon's Lair|", 447, 0)
unit:GossipMenuAddItem(10, "|Serpentshrine Cavern|", 449, 0)
unit:GossipMenuAddItem(10, "|Black Temple|", 451, 0)
unit:GossipMenuAddItem(10, "|Sunwell Plateau|", 452, 0)
unit:GossipMenuAddItem(10, "|cff990000[Back]", 7, 0)
unit:GossipMenuAddItem(10, "|cff990000[Main Menu]", 75, 0)
unit:GossipSendMenu(player)
end
end

if(intid == 902) then
unit:GossipCreateMenu(3543, player, 0)
unit:GossipMenuAddItem(10, "World Of InfinityWoW Rule Book", 903, 0)
unit:GossipMenuAddItem(10, "Starter Items", 8090, 0)
unit:GossipMenuAddItem(10, "Shaman Totems", 1600, 0)
unit:GossipMenuAddItem(10, "Ankh", 1601, 0)
unit:GossipMenuAddItem(10, "x1 Arrows", 1903, 0)
unit:GossipMenuAddItem(10, "x2 Arrows", 1904, 0)
unit:GossipMenuAddItem(10, "x3 Arrows", 1905, 0)
unit:GossipMenuAddItem(10, "x4 Arrows", 1906, 0)
unit:GossipMenuAddItem(10, "x5 Arrows", 1907, 0)
unit:GossipMenuAddItem(10, "Healing Apple", 1908, 0)
unit:GossipMenuAddItem(10, "Pet Meat", 4000, 0)
unit:GossipMenuAddItem(10, "Pet Cheese", 4001, 0)
unit:GossipMenuAddItem(10, "Pet Fruit", 4002, 0)
unit:GossipMenuAddItem(10, "Pet Cake", 4003, 0)
unit:GossipMenuAddItem(10, "Soul Shards", 4004, 0)
unit:GossipMenuAddItem(10, "|cff990000[Main Menu]", 75, 0)
player:SendAreaTriggerMessage("You can allwayse come back and buy more!")
unit:GossipSendMenu(player)
end

if(intid == 8090) then
unit:GossipCreateMenu(59, player, 0)
unit:GossipMenuAddItem(10, "|Starter Helmet|", 8091, 0)
unit:GossipMenuAddItem(10, "|Starter Shoulder|", 8092, 0)
unit:GossipMenuAddItem(10, "|Starter Chest|", 8093, 0)
unit:GossipMenuAddItem(10, "|Starter Bracer|", 8094, 0)
unit:GossipMenuAddItem(10, "|Starter Gloves|", 8095, 0)
unit:GossipMenuAddItem(10, "|Starter Belt|", 8096, 0)
unit:GossipMenuAddItem(10, "|Starter Pants|", 8097, 0)
unit:GossipMenuAddItem(10, "|Starter Boots|", 8098, 0)
unit:GossipMenuAddItem(10, "|Starter Sword|", 8099, 0)
unit:GossipMenuAddItem(10, "|Starter Bow|", 8100, 0)
unit:GossipMenuAddItem(10, "|Starter Bag|", 8101, 0)
unit:GossipMenuAddItem(10, "|Starter Quiver|", 8102, 0)
unit:GossipMenuAddItem(10, "[Back]", 902, 0)
unit:GossipMenuAddItem(10, "[Main Menu]", 75, 0)
unit:GossipSendMenu(player)
end

if(intid == 8091) then
unit:GossipMenuAddItem(10, "Main Menu", 8090, 0)
player:AddItem(98900, 1)
player:GossipComplete()
end

if(intid == 8092) then
unit:GossipMenuAddItem(10, "Main Menu", 8090, 0)
player:AddItem(98901, 1)
player:GossipComplete()
end

if(intid == 8093) then
player:AddItem(98902, 1)
player:GossipComplete()
end

if(intid == 8094) then
player:AddItem(98903, 1)
player:GossipComplete()
end

if(intid == 8095) then
player:AddItem(98904, 1)
player:GossipComplete()
end

if(intid == 8096) then
player:AddItem(98907, 1)
player:GossipComplete()
end

if(intid == 8097) then
player:AddItem(98905, 1)
player:GossipComplete()
end

if(intid == 8098) then
player:AddItem(98906, 1)
player:GossipComplete()
end

if(intid == 8099) then
player:AddItem(45266, 1)
player:GossipComplete()
end

if(intid == 8100) then
player:AddItem(28722, 1)
player:GossipComplete()
end

if(intid == 8101) then
player:AddItem(98912, 1)
player:GossipComplete()
end

if(intid == 8102) then
player:AddItem(98913, 1)
player:GossipComplete()
end

if(intid == 4004) then
player:AddItem(6265, 999)
unit:GossipMenuAddItem(10, "Main Menu", 902, 0)
player:GossipComplete()
end

if(intid == 4001) then
player:AddItem(35952, 999)
unit:GossipMenuAddItem(10, "Main Menu", 902, 0)
player:GossipComplete()
end

if(intid == 4002) then
player:AddItem(41751, 999)
unit:GossipMenuAddItem(10, "Main Menu", 902, 0)
player:GossipComplete()
end

if(intid == 4003) then
player:AddItem(42428, 999)
unit:GossipMenuAddItem(10, "Main Menu", 902, 0)
player:GossipComplete()
end

if(intid == 4000) then
player:AddItem(38706, 999)
unit:GossipMenuAddItem(10, "Main Menu", 902, 0)
player:GossipComplete()
end

if(intid == 1908) then
player:AddItem(20516, 999)
unit:GossipMenuAddItem(10, "Main Menu", 902, 0)
player:GossipComplete()
end

if(intid == 1903) then
player:AddItem(19316, 999)
unit:GossipMenuAddItem(10, "Main Menu", 902, 0)
player:GossipComplete()
end

if(intid == 1904) then
player:AddItem(34581, 999)
unit:GossipMenuAddItem(10, "Main Menu", 902, 0)
player:GossipComplete()
end

if(intid == 1905) then
player:AddItem(32760, 999)
unit:GossipMenuAddItem(10, "Main Menu", 902, 0)
player:GossipComplete()
end

if(intid == 1906) then
player:AddItem(31737, 999)
unit:GossipMenuAddItem(10, "Main Menu", 902, 0)
player:GossipComplete()
end

if(intid == 1907) then
player:AddItem(30319, 999)
unit:GossipMenuAddItem(10, "Main Menu", 902, 0)
player:GossipComplete()
end

if(intid == 903) then
player:AddItem(2161, 1)
player:GossipComplete()
end

if(intid == 1600) then
player:AddItem(5175, 1)
player:AddItem(5176, 1)
player:AddItem(5177, 1)
player:AddItem(5178, 1)
player:GossipComplete()
end

if(intid == 1601) then
player:AddItem(17030, 1)
player:GossipComplete()
end

if(intid == 48) then
if (player:IsInCombat() == true) then
player:SetHealthPct(1)
unit:SendChatMessage(12, 0, ""..player:GetName().." Tried to espace from hes fight! Its so pathetic, hes health is lowered! Now get him guys!")
else
unit:GossipCreateMenu(60, player, 0)
unit:GossipMenuAddItem(10, "|The Mechanar|", 442, 0)
unit:GossipMenuAddItem(10, "|The Botanica|", 443, 0)
unit:GossipMenuAddItem(10, "|The Arcatraz|", 444, 0)
unit:GossipMenuAddItem(10, "|The Steamvault|", 439, 0)
unit:GossipMenuAddItem(10, "|Slave Pens|", 432, 0)
unit:GossipMenuAddItem(10, "|The Underbog|", 433, 0)
unit:GossipMenuAddItem(10, "|cff990000[Back]", 7, 0)
unit:GossipMenuAddItem(10, "|cff990000[Main Menu]", 75, 0)
unit:GossipSendMenu(player)
end
end

if(intid == 8) then
if (player:IsInCombat() == true) then
player:SetHealthPct(1)
unit:SendChatMessage(12, 0, ""..player:GetName().." Tried to espace from hes fight! Its so pathetic, hes health is lowered! Now get him guys!")
else
unit:GossipCreateMenu(50, player, 0)
unit:GossipMenuAddItem(10, "Terrace of Light", 38, 0)
unit:GossipSendMenu(player)
end
end

if(intid == 99) then
unit:GossipCreateMenu(50, player, 0)
unit:GossipMenuAddItem(10, "So, you want to get buffed hardstyle or noobie style?", 99, 0)
unit:GossipMenuAddItem(10, "Hardstyle!", 8049, 0)
unit:GossipMenuAddItem(10, "Noobie style!", 8050, 0)
unit:GossipSendMenu(player)
end

if(intid == 8049) then
player:SetHealthPct(40)
unit:FullCastSpellOnTarget(56920, player)
unit:FullCastSpellOnTarget(56920, player)
unit:FullCastSpellOnTarget(56920, player)
unit:FullCastSpellOnTarget(56920, player)
unit:FullCastSpellOnTarget(56920, player)
unit:FullCastSpellOnTarget(56920, player)
unit:FullCastSpellOnTarget(56920, player)
unit:FullCastSpellOnTarget(56920, player)
unit:FullCastSpellOnTarget(56920, player)
unit:FullCastSpellOnTarget(56920, player)
unit:FullCastSpellOnTarget(56920, player)
unit:FullCastSpellOnTarget(56920, player)
unit:FullCastSpellOnTarget(56920, player)
unit:FullCastSpellOnTarget(56920, player)
unit:FullCastSpellOnTarget(56920, player)
player:SendAreaTriggerMessage("Live on the hardway tuff guy!")
player:GossipComplete()
end

if(intid == 8050) then
unit:FullCastSpellOnTarget(33077, player)
unit:FullCastSpellOnTarget(33078, player)
unit:FullCastSpellOnTarget(33079, player)
unit:FullCastSpellOnTarget(33080, player)
unit:FullCastSpellOnTarget(33081, player)
unit:FullCastSpellOnTarget(33082, player)
unit:FullCastSpellOnTarget(24705, player)
unit:FullCastSpellOnTarget(26035, player)
player:SendAreaTriggerMessage("Noob buffs, i hope you enjoy them!")
player:GossipComplete()
end

if(intid == 97) then
if (player:IsInCombat() == true) then
player:SetHealthPct(1)
unit:SendChatMessage(12, 0, ""..player:GetName().." Tried to espace from hes fight! Its so pathetic, hes health is lowered! Now get him guys!")
else
unit:GossipCreateMenu(500, player, 0)
unit:GossipMenuAddItem(10, "|Borean Tundra|", 501, 0)
unit:GossipMenuAddItem(10, "|Crystalsong Forest|", 502, 0)
unit:GossipMenuAddItem(10, "|Dalaran (City)|", 503, 0)
unit:GossipMenuAddItem(10, "|Dragonblight|", 504, 0)
unit:GossipMenuAddItem(10, "|Grizzly Hills|", 505, 0)
unit:GossipMenuAddItem(10, "|Howling Fjord|", 506, 0)
unit:GossipMenuAddItem(10, "|Icecrown|", 507, 0)
unit:GossipMenuAddItem(10, "|Sholazar Basin|", 508, 0)
unit:GossipMenuAddItem(10, "|The Storm Peaks|", 509, 0)
unit:GossipMenuAddItem(10, "|Zul'Dark|", 510, 0)
unit:GossipMenuAddItem(10, "|DK Start Zone|", 511, 0)
unit:GossipMenuAddItem(10, "|cff990000[Main Menu]", 75, 0)
unit:GossipSendMenu(player)
end
end

if(intid == 9090) then
unit:GossipCreateMenu(500, player, 0)
unit:GossipMenuAddItem(10, "You want me to remove your sickness?", 9090, 0)
unit:GossipMenuAddItem(10, "Press here to Continue!", 9092, 0)
unit:GossipSendMenu(player)
end

if(intid == 9092) then
if (player:HasAura(15007) == true) then
unit:GossipCreateMenu(62, player, 0)
unit:GossipMenuAddItem(10, "Sickness Removed Completely!", 9092, 0)
player:SendAreaTriggerMessage("Your Sickness has been cured!")
player:LearnSpell(15007)
player:UnlearnSpell(15007)
player:GossipComplete()
else
unit:GossipCreateMenu(62, player, 0)
unit:GossipMenuAddItem(10, "|cFF0000A0-EXIT-", 9093, 0)
unit:GossipSendMenu(player)
player:SendBroadcastMessage("You currently don't have any sickness!")
player:GossipComplete()
end
end

if(intid == 9093) then
player:GossipComplete()
end

if(intid == 10) then
player:Teleport(1, 1484, -4417, 25)
end

if(intid == 11) then
player:Teleport(0, 1831, 238, 60)
end

if(intid == 12) then
player:Teleport(1, -1277, 118, 131)
end

if(intid == 13) then
player:Teleport(530, 9413, -7277, 14)
end

if(intid == 14) then
player:Teleport(0, -8913.23, 554.633, 94.7944)
end

if(intid == 15) then
player:Teleport(0, -4981.25, -881.542, 502.66)
end

if(intid == 833) then
player:Teleport(389, 2.258112, -10.744517, -16.434870)
end

if(intid == 16) then
player:Teleport(1, 9948, 2413, 1327)
end

if(intid == 17) then
player:Teleport(530, -4014.080078, -11895.799805, -1.990842)
end

if(intid == 19) then
player:Teleport(0, -234.495087, 1561.946411, 76.892143)
end

if(intid == 20) then
player:Teleport(0, -11919.073242, -1202.459374, 92.298744)
end

if(intid == 21) then
player:Teleport(0, 2870.442627, -819.985229, 160.331085)
end

if(intid == 22) then
player:Teleport(0, 3359.111572, -3380.8444238, 144.781860)
end

if(intid == 23) then
player:Teleport(0, 1267.468628, -2556.651367, 94.127983)
end

if(intid == 24) then
player:Teleport(0, -7527.129883, -1224.997437, 285.733002)
end

if(intid == 25) then
player:Teleport(1, -4708.491699, -3727.672363, 54.535076)
end

if(intid == 26) then
player:Teleport(0, -7515.409668, -1045.369629, 182.301208)
end

if(intid == 27) then
player:Teleport(0, -11122.913086, -2014.498779, 47.079350)
end

if(intid == 28) then
player:Teleport(0, 3132.915283, -3731.012939, 138.658371)
end

if(intid == 29) then
player:Teleport(1, -8519.718750, -4297.542480, -208.441376)
end

if(intid == 30) then
player:Teleport(530, -247.9672, 948.5709, 84.3798)
end

if(intid == 31) then
player:Teleport(530, -1045.0179, 5380.0288, 22.1216)
end

if (intid == 32) then
player:Teleport(530, -468, 8418, 28)
end

if(intid == 33) then
player:Teleport(530, 1552.2236, 6813.3798, 125.1364)
end

if(intid == 34) then
player:Teleport(530, 3396, 4185, 137)
end

if(intid == 35) then
player:Teleport(530, -2276.82, 5132.03, -8.62994)
end

if(intid == 36) then
player:Teleport(530, -3004.3488, 2968.4343, 81.8821)
end

if(intid == 37) then
player:Teleport(530, -1849.4200, 5401.4599, -12.4279)
end

if(intid == 669) then
player:Teleport(603, 1673.903809, -24.098600, 427.311707)
end

if(intid == 38) then
player:Teleport(530, -1821.645508, 5415.870117, 0.857084)
end

if(intid == 46) then
player:Teleport(571, 5785.240234, 724.909973, 641.080994)
end

if(intid == 100) then
player:Teleport(1, 9874.646484, 595.742432, 1303.874023)
end

if(intid == 102) then
player:Teleport(530, -2721.68, -12208.9, 10.0882)
end

if(intid == 103) then
player:Teleport(530, -4020.48, -13783.3, 74.9001)
end

if(intid == 105) then
player:Teleport(1, 6207.5, -152.833, 80.8185)
end

if(intid == 106) then
player:Teleport(1, 7101.68, -2670.2, 512.2)
end

if(intid == 107) then
player:Teleport(1, 5483.9, -749.881, 335.621)
end

if(intid == 108) then
player:Teleport(1, 6107.62, -4181.6, 853.322)
end

if(intid == 109) then
player:Teleport(1, 2717.1, 5967.91, 107.4)  (1, 3469.43, 847.62, 6.36476)
end

if(intid == 111) then
player:Teleport(1, 341.42, -4684.7, 31.9493)
end

if(intid == 112) then
player:Teleport(1, 1145.85, 664.812, 143)
end

if(intid == 113) then
player:Teleport(1, -93.1614, 1691.15, 90.0649)
end

if(intid == 114) then
player:Teleport(1, -90.19003, -1943.44, -180.4727)
end

if(intid == 115) then
player:Teleport(1, -1840.75, 5359, -7.845)
end

if(intid == 709) then
player:Teleport(1, -3750.512451, 1098.846294, 151.969482)
end

if(intid == 116) then
player:Teleport(1, -4458.93, 243.415, -65.6136)
end

if(intid == 117) then
player:Teleport(1, -3463.26, -4123.13, 18.1043)
end

if(intid == 118) then
player:Teleport(0, -1324.612305, -1245.649780, 32.123672)
end

if(intid == 119) then
player:Teleport(1, -7932.61, -2139.61, -229.728)
end

if(intid == 120) then
player:Teleport(1, -7373.69, -2950.2, -11.7598)
end

if(intid == 121) then
player:Teleport(1, -7373.69, -2950.2, -30.7598)
end

if(intid == 201) then
player:Teleport(530, 9449.15, -6782.61, 16.6167)
end 

if(intid == 202) then
player:Teleport(530, 7880, -6193, 22)
end

if(intid == 203) then
player:Teleport(0, 1224.36, -1151.97, 61.7327)
end 

if(intid == 205) then
player:Teleport(0, 2019.35, 1904.36, 106.144)
end

if(intid == 206) then
player:Teleport(0, 1919.44, -4306.23, 77.838)
end 

if(intid == 207) then
player:Teleport(0, 511.536, 1638.63, 121.417)
end

if(intid == 208) then
player:Teleport(0, 272.704, -654.514, 129.609)
end 

if(intid == 209) then
player:Teleport(0, 139.375, -1982.79, 134.043)
end 

if(intid == 210) then
player:Teleport(0, -852.854, -576.712, 21.0293)
end 

if(intid == 211) then
player:Teleport(0, -4086.36, -2610.95, 47.0143)
end

if(intid == 212) then
player:Teleport(0, -5425.924316, -224.271957, 404.984344)
end

if(intid == 213) then
player:Teleport(0, -4939.1, -3423.74, 306.595)
end

if(intid == 214) then
player:Teleport(0, -6018.138184, -3311.517822, 261.744324)
end 

if(intid == 215) then
player:Teleport(0, -7176.63, -937.667, 171.206)
end

if(intid == 216) then
player:Teleport(0, -7907.41, -1128.66, 192.056)
end 

if(intid == 217) then
player:Teleport(0, -9621.383789, -371.068207, 57.471478)
end

if(intid == 218) then
player:Teleport(0, -9219.37, -2149.94, 71.606)
end

if(intid == 219) then
player:Teleport(0, -10264.6, -3059.9, 19.9356)
end 						

if(intid == 220) then
player:Teleport(0, -11224.254883, -378.471802, 52.764240)
end

if(intid == 221) then
player:Teleport(0, -10435.4, -1809.28, 101)
end

if(intid == 222) then
player:Teleport(0, -11204.5, -2730.61, 15.8972)
end

if(intid == 223) then
player:Teleport(0, -11634.8, -54.0697, 14.4439)
end

if(intid == 430) then
player:Teleport(530, -360.671, 3071.9, -15.0977)
end 

if(intid == 431) then
player:Teleport(542, -3.9967, 14.6363, -44.8009)
end 

if(intid == 432) then
player:Teleport(530, 721.926, 7012.24, -73.065)
end 

if(intid == 433) then
player:Teleport(530, 779.802, 6769.33, -71.4282)
end 

if(intid == 434) then
player:Teleport(530, -3101.47, 4947.11, -101.177)
end 

if(intid == 435) then
player:Teleport(530, -3357.32, 5216.77, -101.049)
end 

if(intid == 777) then
player:Teleport(0, -13243.240234, 197.949799, 32.112690)
end

if(intid == 778) then
player:Teleport(530, -2044.388672, 6655.308594, 37.733746)
end

if(intid == 779) then
player:Teleport(1, 2177.811523, -4764.241699, 67.311165)
end

if(intid == 776) then
player:Teleport(1, 16227.868164, 16404.136719, -44.751499)
end

if(intid == 436) then
player:Teleport(1, -8195.94, -4500.13, 9.60819)
end 

if(intid == 438) then
player:Teleport(530, -3360.13, 4667.85, -101.047)
end 

if(intid == 439) then
player:Teleport(0, -11634.8, -54.0697, 14.4439)
end 

if(intid == 440) then
player:Teleport(530, -3635.76, 4931.82, -100.034)
end 

if(intid == 441) then
player:Teleport(530, -309.83, 3080.08, -3.63538)
end 

if(intid == 442) then
player:Teleport(530, 2885.2, 1564.73, 248.874)
end

if(intid == 443) then
player:Teleport(530, 3405.48, 1489.14, 183.838)
end

if(intid == 444) then
player:Teleport(530, 2872, 1555.29, 253.159)
end 

if(intid == 445) then
player:Teleport(585, 2.19347, -0.123698, -2.8025)
end

if(intid == 446) then
player:Teleport(530, 3606.85, 5260.49, 4.1724)
end 

if(intid == 447) then
player:Teleport(530, -319.635, 3102.03, -113.937)
end 

if(intid == 448) then
player:Teleport(530, 6850, -7950, 170)
end 

if(intid == 449) then
player:Teleport(530, 742.883, 6867.19, -68.8289)
end 

if(intid == 450) then
player:Teleport(530, 3087.22, 1380.7, 184.883)
end

if(intid == 451) then
player:Teleport(530, -3604.74, 328.252, 38.3077)
end

if(intid == 452) then
player:Teleport(580, 1791.17, 926.31, 15.1135)
end

if(intid == 501) then
player:Teleport(571, 2087.0109, 6508.6171, 1.4727)
end

if(intid == 502) then
player:Teleport(571, 5434.8281, -1022.4812, 175.0125)
end

if(intid == 503) then
player:Teleport(571, 5811.4067, 647.7883, 647.4152)
end

if(intid == 504) then
player:Teleport(571, 3511.6850, 2841.8454, 36.7473)
end

if(intid == 505) then
player:Teleport(571, 3346.2551, -4486.8173, 259.2319)
end

if(intid == 506) then
player:Teleport(571, 2195.3654, -4526.7729, 216.7943)
end

if(intid == 507) then
player:Teleport(571, 6729.2387, 2510.4931, 427.7868)
end

if(intid == 508) then
player:Teleport(570, 4913.3090, 5536.0737, -76.4190)
end

if(intid == 509) then
player:Teleport(571, 6196.4174, -776.7462, 402.3688)
end

if(intid == 510) then
player:Teleport(571, 5443.4326, -1259.7487, 248.7494)
end

if(intid == 511) then
player:Teleport(609, 2355.7048, -5662.7075, 426.0274)
end

if(intid == 521) then
player:Teleport(574, 149, -88, 13)
end

if(intid == 522) then
player:Teleport(575, 570, -327, 111)
end

if(intid == 523) then
player:Teleport(576, 146, -10, -16)
end

if(intid == 524) then
player:Teleport(578, 1129, 1052, 70)
end

if(intid == 525) then
player:Teleport(599, 1153, 811, 196)
end

if(intid == 526) then
player:Teleport(602, 1333, -237, 41)
end

if(intid == 527) then
player:Teleport(603, 1739, 310, 119)
end

if(intid == 528) then
player:Teleport(600, -518, -488, 11)
end

if(intid == 529) then
player:Teleport(604, 2031, 805, 246)
end

if(intid == 530) then
player:Teleport(1, -8638, -4382, -207)
end

if(intid == 531) then
player:Teleport(595, 1967, 1287, 146)
end

if(intid == 532) then
player:Teleport(595, 2300, 1495, 129)
end

if(intid == 533) then
player:Teleport(595, 2258.3, 1153.6, 139)
end

if(intid == 534) then
player:Teleport(595, 1560.4, 603.3, 100)
end

if(intid == 535) then
player:Teleport(595, 1654.3, 1611.9, 117)
end

if(intid == 536) then
player:Teleport(607, 1605, 32, 23)
end

if(intid == 6666) then   -- global mall
player:Teleport(1, -8503.130859, 2022.010010, 104.751045)
player:GossipComplete()
end

if(intid == 578) then   --Horde Mall
player:Teleport(1, 1920.535522, -4129.774414, 43.142735)
player:GossipComplete()
end

if(intid == 567) then   --Alliance Mall
player:Teleport(0, -8452.386719, 346.997894, 120.885796)
player:GossipComplete()
end
end

RegisterUnitGossipEvent(990000040, 1, "On_Gossip")
RegisterUnitGossipEvent(990000040, 2, "Gossip_Submenus")