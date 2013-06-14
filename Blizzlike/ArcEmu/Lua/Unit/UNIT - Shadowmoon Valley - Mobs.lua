--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function EclipsionSpawn(pUnit, Event)
	pUnit:SpawnCreature(21627, pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), pUnit:GetO(), 23000);
end

function EclipsionDespawn(pUnit, Event)
	pUnit:Despawn(1000, 0);
end

RegisterUnitEvent(19806, 1, "EclipsionSpawn");
RegisterUnitEvent(22018, 1, "EclipsionSpawn");
RegisterUnitEvent(21627, 2, "EclipsionDespawn");

function DoomWalker_Earthquake(Unit)
	Unit:CastSpell(32686)
	Unit:SendChatMessage(12, 0, "Magnitude set. Release.")
	Unit:PlaySoundToSet(11345)
end

function DoomWalker_overrun(Unit)
	Unit:CastSpell(32637)
	Unit:SendChatMessage(12, 0, "Trajectory Locked.")
	Unit:PlaySoundToSet(11347)
end

function DoomWalker_ChainLightning(Unit)
	if(Unit:GetClosestPlayer() ~= nil) then
		Unit:CastSpellOnTarget(33665, Unit:GetClosestPlayer()) 
		Unit:PlaySoundToSet(11346)
	end
end

function DoomWalker_SunderArmor(Unit)
	if(Unit:GetClosestPlayer() ~= nil) then
		Unit:FullCastSpellOnTarget(30901, Unit:GetClosestPlayer()) 
	end
end

function DoomWalker_OnEnterCombat(Unit)
	Unit:SendChatMessage(12, 0, "Do not proceed. You will be eliminated.")
	Unit:PlaySoundToSet(11344)
	Unit:RegisterEvent("DoomWalker_ChainLightning",23000, 0)
	Unit:RegisterEvent("DoomWalker_SunderArmor",10000, 0)
	Unit:RegisterEvent("DoomWalker_Earthquake",50000, 0)
	Unit:RegisterEvent("DoomWalker_overrun",120000, 0) 
end

function DoomWalker_OnLeaveCombat(Unit)
	Unit:RemoveEvents()
end

function DoomWalker_KilledTarget(Unit)
	Unit:SendChatMessage(12, 0, "Target Exterminated.")
	Unit:PlaySoundToSet(11351)
	Unit:RemoveEvents()
end

function DoomWalker_OnDied(Unit)
	Unit:SendChatMessage(12, 0, "System failure in five....four....")
	Unit:PlaySoundToSet(11352)
	Unit:RemoveEvents()
end

RegisterUnitEvent(17711, 1, "DoomWalker_OnEnterCombat")
RegisterUnitEvent(17711, 2, "DoomWalker_OnLeaveCombat")
RegisterUnitEvent(17711, 3, "DoomWalker_OnKilledTarget")
RegisterUnitEvent(17711, 4, "DoomWalker_OnDied") 