--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function NecrolordHorus_OnCombat(Unit, Event)
	Unit:RegisterEvent("NecrolordHorus_CurseofImpotence", 4000, 1)
	Unit:RegisterEvent("NecrolordHorus_ShadowBolt", 7000, 0)
end

function NecrolordHorus_CurseofImpotence(Unit, Event) 
	Unit:FullCastSpellOnTarget(51340, Unit:GetMainTank()) 
end

function NecrolordHorus_ShadowBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(20298, Unit:GetMainTank()) 
end

function NecrolordHorus_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function NecrolordHorus_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27805, 1, "NecrolordHorus_OnCombat")
RegisterUnitEvent(27805, 2, "NecrolordHorus_OnLeaveCombat")
RegisterUnitEvent(27805, 4, "NecrolordHorus_OnDied")