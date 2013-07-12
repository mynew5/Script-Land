--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: BrantX, Bapes
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function GurubashiArena_OnSpawn(Unit,Event)
	Unit:RegisterEvent("GurubashiArenaChest_SpawnChest", 10800000, 0)
end

function GurubashiArenaChest_SpawnChest(Unit,Event)
	Unit:SpawnGameObject(179697, -13203.203125, 277.170868, 21.857513, 4.189312, 10800000)
	Unit:SendChatMessage(12, 0, "Arrr, Me Hearties! I be havin' some extra Treasure that i be givin' away at the Gurubashi Arena! All ye need to do is collect it is open the chest I leave on the arena floor!")
end

RegisterUnitEvent(14508, 18, "GurubashiArena_OnSpawn")