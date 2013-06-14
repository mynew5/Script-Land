--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ArchDruidFandralStaghelm_OnCombat(Unit, Event)
	Unit:RegisterEvent("ArchDruidFandralStaghelm_EntanglingRoots", 25000, 0)
	Unit:RegisterEvent("ArchDruidFandralStaghelm_Rejuvenation", 35000, 0)
	Unit:RegisterEvent("ArchDruidFandralStaghelm_SummonTreantAllies", 4000, 1)
	Unit:RegisterEvent("ArchDruidFandralStaghelm_Wrath", 13000, 0)
end

function ArchDruidFandralStaghelm_EntanglingRoots(Unit, Event) 
	Unit:FullCastSpellOnTarget(20699, Unit:GetMainTank()) 
end

function ArchDruidFandralStaghelm_Rejuvenation(Unit, Event) 
	Unit:CastSpell(20701) 
end

function ArchDruidFandralStaghelm_SummonTreantAllies(Unit, Event) 
	Unit:CastSpell(20702) 
end

function ArchDruidFandralStaghelm_Wrath(Unit, Event) 
	Unit:FullCastSpellOnTarget(20698, Unit:GetMainTank()) 
end

function ArchDruidFandralStaghelm_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ArchDruidFandralStaghelm_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3516, 1, "ArchDruidFandralStaghelm_OnCombat")
RegisterUnitEvent(3516, 2, "ArchDruidFandralStaghelm_OnLeaveCombat")
RegisterUnitEvent(3516, 4, "ArchDruidFandralStaghelm_OnDied")