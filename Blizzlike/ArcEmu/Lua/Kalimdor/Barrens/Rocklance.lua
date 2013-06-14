--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Rocklance_OnCombat(Unit, Event)
	Unit:RegisterEvent("Rocklance_Cleave", 4000, 0)
	Unit:RegisterEvent("Rocklance_DefensiveStance", 2000, 1)
	Unit:RegisterEvent("Rocklance_SunderArmor", 6000, 0)
end

function Rocklance_Cleave(Unit, Event) 
	Unit:CastSpell(15496) 
end

function Rocklance_DefensiveStance(Unit, Event) 
	Unit:CastSpell(7164) 
end

function Rocklance_SunderArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(21081, Unit:GetMainTank()) 
end

function Rocklance_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Rocklance_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5841, 1, "Rocklance_OnCombat")
RegisterUnitEvent(5841, 2, "Rocklance_OnLeaveCombat")
RegisterUnitEvent(5841, 4, "Rocklance_OnDied")