--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

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
local plr = Unit:GetClosestPlayer()
	if (plr ~= nil) then
		Unit:CastSpellOnTarget(33665, plr) 
		Unit:PlaySoundToSet(11346)
	end
end

function DoomWalker_SunderArmor(Unit)
local plr = Unit:GetClosestPlayer()
	if (plr ~= nil) then
		Unit:CastSpellOnTarget(30901, plr) 
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

function DoomWalker_OnKilledTarget(Unit)
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