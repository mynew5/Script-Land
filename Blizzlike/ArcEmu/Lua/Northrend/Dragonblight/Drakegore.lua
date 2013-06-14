--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Drakegore_OnCombat(Unit, Event)
	Unit:RegisterEvent("Drakegore_BurningFists", 2000, 1)
	Unit:RegisterEvent("Drakegore_MagnataurCharge", 6000, 0)
end

function Drakegore_BurningFists(Unit, Event) 
	Unit:CastSpell(52101) 
end

function Drakegore_MagnataurCharge(Unit, Event) 
	Unit:FullCastSpellOnTarget(52088, Unit:GetMainTank()) 
end

function Drakegore_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Drakegore_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27009, 1, "Drakegore_OnCombat")
RegisterUnitEvent(27009, 2, "Drakegore_OnLeaveCombat")
RegisterUnitEvent(27009, 4, "Drakegore_OnDied")