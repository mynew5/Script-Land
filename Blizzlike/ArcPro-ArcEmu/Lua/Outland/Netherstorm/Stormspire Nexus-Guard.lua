--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Guard_OnCombat(Unit, Event)
	Unit:RegisterEvent("Guard_Cleave", 5000, 0)
	Unit:RegisterEvent("Guard_Hamstring", 6000, 0)
	Unit:RegisterEvent("Guard_Mortal_Strike", 7000, 0)
end

function Guard_Cleave(Unit, Event)
	Unit:FullCastSpellOnTarget(15284, GetMainTank())
end

function Guard_Hamstring(Unit, Event)
	Unit:FullCastSpellOnTarget(9080, GetMainTank())
end

function Guard_Mortal_Strike(Unit, Event)
	Unit:FullCastSpellOnTarget(16856, GetMainTank())
end

function Guard_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Guard_OnDeath(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19529, 1, "Guard_OnCombat")
RegisterUnitEvent(19529, 2, "Guard_OnLeaveCombat")
RegisterUnitEvent(19529, 4, "Guard_OnDeath")