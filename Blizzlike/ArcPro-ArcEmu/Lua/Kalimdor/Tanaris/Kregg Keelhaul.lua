--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function KreggKeelhaul_OnCombat(Unit, Event)
	Unit:RegisterEvent("KreggKeelhaul_Cleave", 4000, 0)
	Unit:RegisterEvent("KreggKeelhaul_Strike", 6000, 0)
end

function KreggKeelhaul_Cleave(Unit, Event) 
	Unit:CastSpell(40504) 
end

function KreggKeelhaul_Strike(Unit, Event) 
	Unit:FullCastSpellOnTarget(11976, Unit:GetMainTank()) 
end

function KreggKeelhaul_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function KreggKeelhaul_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(8203, 1, "KreggKeelhaul_OnCombat")
RegisterUnitEvent(8203, 2, "KreggKeelhaul_OnLeaveCombat")
RegisterUnitEvent(8203, 4, "KreggKeelhaul_OnDied")