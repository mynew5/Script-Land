--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function InjuredDraenei_OnSpawn(pUnit, event)
local InjuredDraeneiChance = math.random(1,2)
	if(InjuredDraeneiChance == 1) then
		pUnit:SetStandState(3)
	else
		pUnit:SetStandState(1)
		pUnit:SetCombatCapable(0)
	end
end

RegisterUnitEvent(16971, 6, "InjuredDraenei_OnSpawn")

function DraeneiSurvivor_OnSpawn(pUnit, event)
local SurvivorDraeneiChance = math.random(1,3)
	if(SurvivorDraeneiChance == 1) then
		pUnit:SetStandState(3)
	elseif(SurvivorDraeneiChance == 2) then
		pUnit:CastSpell(28630)
		pUnit:SetStandState(1)
	else
		pUnit:CastSpell(28630)
		pUnit:SetCombatCapable(0)
	end
end

RegisterUnitEvent(16483, 6, "DraeneiSurvivor_OnSpawn")