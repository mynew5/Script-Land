--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Mageslayer_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Mageslayer_Reflection", 8000, 0)
end

function Mageslayer_Reflection(Unit, Event)
    Unit:CastSpell(36096)
end

function Mageslayer_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Mageslayer_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(18866, 1, "Mageslayer_OnEnterCombat")
RegisterUnitEvent(18866, 2, "Mageslayer_OnLeaveCombat")
RegisterUnitEvent(18866, 4, "Mageslayer_OnDied")