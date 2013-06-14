--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

local id = 2051
local ID = 36837
local drake = 15628
local portal = 28409
local drakereplace = 15491
local attacker = 99999
local aluzar = 24882

function Deru_OnGossipTalk(pUnit, Event, player)
	pUnit:GossipCreateMenu(1, player, 0)
	pUnit:GossipMenuAddItem(1, "I'm ready to face A’luzar!", 1, 0)
	pUnit:GossipSendMenu(player)
end

function Deru_OnGossipSelect(pUnit, Event, player, id, intid, pmisc)
	if(intid == 1) then
		pUnit:SendChatMessage(12, 0, "Very well then, lets go!")
		pUnit:Despawn(1000, 0)
	end
end

RegisterUnitGossipEvent(id, 1, "Deru_OnGossipTalk")
RegisterUnitGossipEvent(id, 2, "Deru_OnGossipSelect")

function Drakes_OnGossipTalk(Unit, event, player)
	Unit:GossipCreateMenu(1, player, 0)
	Unit:GossipMenuAddItem(1, "Mount up!", 1, 0)
	Unit:GossipSendMenu(player)
end

function Drakes_OnGossipSelect(Unit, event, player, id, intid, pmisc)
	if(intid == 1) then
		player:SendBroadcastMessage("[Drake] says: Hold on tight, it might just be a rough ride!")
		LuaTaxi:CreateTaxi():AddPathNode(269, -1722.391602, 7132.791504, 24.434061)
		LuaTaxi:CreateTaxi():AddPathNode(269, -1777.753296, 7092.041992, 24.800127)
		LuaTaxi:CreateTaxi():AddPathNode(269, -1862.992310, 7133.613281, 23.492975)
		LuaTaxi:CreateTaxi():AddPathNode(269, -1903.151611, 7110.182129, 17.741901)
		player:StartTaxi(LuaTaxi:CreateTaxi(), 30346)
		Unit:Despawn(1000, 0)
		player:GossipComplete()
	end
end

RegisterUnitGossipEvent(ID, 1, "Drakes_OnGossipTalk")
RegisterUnitGossipEvent(ID, 2, "Drakes_OnGossipSelect")

function pUnit_OnGossipTalk(pUnit, Event, player)
	pUnit:GossipCreateMenu(1, player, 0)
	pUnit:GossipMenuAddItem(0, "Start the battle!", 1, 0)
	pUnit:GossipSendMenu(player)
end

function pUnit_OnGossipSelect(pUnit, Event, player, id, intid, pmisc)
	if(intid == 1) then
		pUnit:SendChatMessage(42, 0, "The battle for the crystals has started!")
		pUnit:SpawnLocalCreature(drakereplace, 35, 0)
		pUnit:Despawn(100, 0)
		pUnit:SpawnCreature(aluzar, -2036.649048, 7121.080078, 22.679752, 0, 14, 0)
		pUnit:SpawnCreature(portal, -2019.093384, 7088.562012, 21.004997, 0, 35, 0)
		pUnit:SpawnCreature(portal, -1991.203857, 7126.957520, 18.896038, 0, 35, 0)
		pUnit:SpawnCreature(portal, -2013.555420, 7156.967285, 18.870935, 0, 35, 0)
		pUnit:GossipComplete()
	end
end

RegisterUnitGossipEvent(drake, 1, "pUnit_OnGossipTalk")
RegisterUnitGossipEvent(drake, 2, "pUnit_OnGossipSelect")
		
function Rift_OnSpawn(pUnit, Event)
	pUnit:RegisterEvent("Rift_Spawn", 50000, 0)
end

function Rift_Spawn(pUnit, Event)
	pUnit:SpawnLocalCreature(99999, 14, 0)
end

RegisterUnitEvent(portal, 18, "Rift_OnSpawn")

function Attacker_OnSpawn(pUnit, Event)
	pUnit:MoveTo(269, -1981.507813, 7117.742188, 17.483904)
	pUnit:RegisterEvent("Attacker_Arrive", 15000, 1)
end

function Attacker_Arrive(pUnit, Event)
	pUnit:MoveTo(-1989.506470, 7129.289551, 18.386921, 3.36682)
end

function Al_OnSpawn(pUnit, Event)
local al = pUnit
	al:SendChatMessage(13, 0, "I possess the crystals, it would be foul of you to try to stop me!")
end

RegisterUnitEvent(aluzar, 18, "Al_OnSpawn")

function DpUnit_OnSpawn(pUnit, Event)
	pUnit:RegisterEvent("DpUnit_explain", 2000, 1)
	pUnit:RegisterEvent("DpUnit_located", 6000, 1)
	pUnit:RegisterEvent("DpUnit_talk", 12000, 1)
	pUnit:RegisterEvent("DpUnit_tal", 16000, 1)
	pUnit:RegisterEvent("DpUnit_Move", 20000, 1)
	pUnit:RegisterEvent("DpUnit_CastAlu", 27000, 1)
	if(pUnit:GetInRangePlayers():GetTeam() == 0) then
		pUnit:SetFaction(4)
		al:SetFaction(5)
	else
		pUnit:SetFaction(5)
		al:SetFaction(4)
	end
end

function DpUnit_explain(pUnit, Event)
	pUnit:SendChatMessage(12, 0, "Heroes, I've summoned you here for a purpose.")
end

function DpUnit_located(pUnit, Event)
	pUnit:SendChatMessage(12, 0, "We've located Aluzar and the crystal, thus hes hiding behind the demonic power of the crystals.")
end

function DpUnit_talk(pUnit, Event)
	pUnit:SendChatMessage(12, 0, "We'll try to bring him down but it'll be a real intense fight.")
end

function DpUnit_tal(pUnit, Event)
	pUnit:SendChatMessage(12, 0, "Lets go!")
end

function DpUnit_Move(pUnit, Event)
	pUnit:MoveTo(-2002.641479, 7119.100586, 21.215466, 0)
end

function DpUnit_OnDeath(pUnit, Event)
	al:Despawn(0, 1000)
	rift:Despawn(0, 1000)
	pUnit:RemoveEvents()
	drag:SpawnCreature(drake, -1945.944336, 7094.913574, 17.477522, 0.210793, 35, 0)
end
	
RegisterUnitEvent(drakereplace, 4, "DpUnit_OnDeath")
RegisterUnitEvent(drakereplace, 18, "DpUnit_OnSpawn")