--[[ Gastric - NightshroudCelestial.lua

Hooray for custom boss scripts. This is a custom boss
script I have been working on for a bit. Lets give 
him a go!

Spells:
15 second Divine Shield: 41367
-> Nightshroud uses this spell when he summons his minions
Water impact visual: 32995
-> When the spawns come into aggro, they use this spell

Novas:
Chill Nova: Knocks players back, 36148
Holy Nova:Damages and Heals self, 37669
 -> Gonna use this for player death, makes a good ding :)
Shadow Nova: 3k damage, 38627

-- By Gastricpenguin ]]

function Nightshroud_CheckA(Unit)
	if Unit:GetHealthPct() < 75 then
		Unit:CastSpell(37669)
		Unit:SendChatMessage(12, 0, "Leerwandler, kommt zu mir!...")
		Unit:SpawnCreature(100245, 4249, -4136, 939, 0.5, 21, 360000);
		Unit:SpawnCreature(100245, 4259, -4132, 938, 1.22, 21, 360000);
		Unit:SpawnCreature(100245, 4264, -4147, 940, 1.5, 21, 360000);
	end
end

function Nightshroud_CheckB(Unit)
	if Unit:GetHealthPct() < 50 then
		Unit:CastSpell(37669)
		Unit:SendChatMessage(12, 0, "I see you are formidable opponents!")
		Unit:SpawnCreature(100245, 4249, -4136, 939, 0.5, 21, 360000);
		Unit:SpawnCreature(100245, 4259, -4132, 938, 1.22, 21, 360000);
		Unit:SpawnCreature(100245, 4264, -4147, 940, 1.5, 21, 360000);
	end
end

function Nightshroud_CheckC(Unit)
	if Unit:GetHealthPct() < 25 then
		Unit:CastSpell(37669)
		Unit:SendChatMessage(12, 0, "Ihr ägert mich zum letzten mal!")
		Unit:SpawnCreature(100245, 4249, -4136, 939, 0.5, 21, 360000);
		Unit:SpawnCreature(100245, 4259, -4132, 938, 1.22, 21, 360000);
		Unit:SpawnCreature(100245, 4264, -4147, 940, 1.5, 21, 360000);
	end
end

function Nightshroud_CheckD(Unit)
	if Unit:GetHealthPct() < 10 then
		Unit:CastSpell(28131)
		Unit:SendChatMessage(12, 0, "Feel my undying wrath!")
		Unit:SpawnCreature(100245, 4249, -4136, 939, 0.5, 21, 360000);
		Unit:SpawnCreature(100245, 4259, -4132, 938, 1.22, 21, 360000);
		Unit:SpawnCreature(100245, 4264, -4147, 940, 1.5, 21, 360000);
	end
end

function NightshroudVoid_OnSpawn (Unit, Event)
	Unit:Despawn (6000, 0)
end
RegisterUnitEvent (100245, 6, "NightshroudVoid_OnSpawn")

function NightshroudVoid_onCombat (Unit, Event)
	Unit:CastSpell(32995)
end
RegisterUnitEvent (100245, 1, "NightshroudVoid_onCombat") 

function Nightshroud_Chill(Unit)
	Unit:CastSpell(36148)
	Unit:SendChatMessage(12, 0, "zuRück!")
end

function Nightshroud_Shadow(Unit)
	Unit:CastSpell(38627)
	Unit:SendChatMessage(12, 0, "zuRück!")
end

function Nightshroud_OnCombat(Unit, Event)
	Unit:SendChatMessage (11, 0, "Ich sehs, ihr wollt mit mir Spielen!")
	Unit:RegisterEvent("Nightshroud_CheckA",25000, 0)
	Unit:RegisterEvent("Nightshroud_CheckB",20000, 0)
	Unit:RegisterEvent("Nightshroud_CheckC",25000, 0)
	Unit:RegisterEvent("Nightshroud_CheckD",20000, 0)
	Unit:RegisterEvent("Nightshroud_Chill",20000, 0)
	Unit:RegisterEvent("Nightshroud_Shadow",31000, 0)
end

function Nightshroud_OnLeaveCombat(Unit)
	Unit:RemoveEvents()
end

function Nightshroud_KilledTarget(Unit)
	Unit:SendChatMessage(12, 0, "Ding!")
	Unit:CastSpell(37669)
	Unit:RemoveEvents()
end

function Nightshroud_OnDied(Unit)
	Unit:SendChatMessage(12, 0, "I-Ich... hass..e noobs!")
	Unit:RemoveEvents()
end

RegisterUnitEvent(100246, 1, "Nightshroud_OnCombat")
RegisterUnitEvent(100246, 2, "Nightshroud_OnLeaveCombat")
RegisterUnitEvent(100246, 3, "Nightshroud_OnKilledTarget")
RegisterUnitEvent(100246, 4, "Nightshroud_OnDied")