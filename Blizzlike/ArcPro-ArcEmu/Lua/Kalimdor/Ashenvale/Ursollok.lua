--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Ursollok_OnCombat(Unit, Event)
	Unit:RegisterEvent("Ursollok_Maul", 5000, 0)
end

function Ursollok_Maul(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(17156, pUnit:GetMainTank()) 
end

function Ursollok_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Ursollok_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12037, 1, "Ursollok_OnCombat")
RegisterUnitEvent(12037, 2, "Ursollok_OnLeaveCombat")
RegisterUnitEvent(12037, 4, "Ursollok_OnDied")