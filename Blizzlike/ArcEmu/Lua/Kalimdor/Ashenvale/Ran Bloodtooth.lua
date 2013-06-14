--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function RanBloodtooth_OnCombat(Unit, Event)
	Unit:RegisterEvent("RanBloodtooth_MultiShot", 10000, 0)
	Unit:RegisterEvent("RanBloodtooth_Shoot", 6000, 0)
end

function RanBloodtooth_MultiShot(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(14443, pUnit:GetMainTank()) 
end

function RanBloodtooth_Shoot(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6660, pUnit:GetMainTank()) 
end

function RanBloodtooth_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RanBloodtooth_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3696, 1, "RanBloodtooth_OnCombat")
RegisterUnitEvent(3696, 2, "RanBloodtooth_OnLeaveCombat")
RegisterUnitEvent(3696, 4, "RanBloodtooth_OnDied")