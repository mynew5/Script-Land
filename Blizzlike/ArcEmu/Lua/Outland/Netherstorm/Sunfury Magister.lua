--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Magister_OnCombat(Unit, Event)
	Unit:RegisterEvent("Magister_Fireball", 6000, 0)
	Unit:RegisterEvent("Magister_Surge", 10000, 0)
end

function Magister_Fireball(Unit, Event) 
	Unit:FullCastSpellOnTarget(9053, Unit:GetMainTank()) 
end

function Magister_Surge(Unit, Event) 
	Unit:CastSpell(35778) 
end

function Magister_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Magister_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(18855, 1, "Magister_OnCombat")
RegisterUnitEvent(18855, 2, "Magister_OnLeaveCombat")
RegisterUnitEvent(18855, 4, "Magister_OnDied")