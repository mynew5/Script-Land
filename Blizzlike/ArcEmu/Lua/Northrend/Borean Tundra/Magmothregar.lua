--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Magmothregar_OnCombat(Unit, Event)
	Unit:RegisterEvent("Magmothregar_Fervor", 10000, 0)
	Unit:RegisterEvent("Magmothregar_MagnataurCharge", 8000, 0)
end

function Magmothregar_Fervor(Unit, Event) 
	Unit:CastSpell(50822) 
end

function Magmothregar_MagnataurCharge(Unit, Event) 
	Unit:CastSpell(50413) 
end

function Magmothregar_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Magmothregar_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25430, 1, "Magmothregar_OnCombat")
RegisterUnitEvent(25430, 2, "Magmothregar_OnLeaveCombat")
RegisterUnitEvent(25430, 4, "Magmothregar_OnDied")