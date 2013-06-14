--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Chronalis_OnCombat(Unit, Event)
	Unit:RegisterEvent("Chronalis_SandBreath", 10000, 0)
	Unit:RegisterEvent("Chronalis_Cleave", 5000, 0)
end

function Chronalis_Cleave(Unit, Event) 
	Unit:CastSpell(40505) 
end

function Chronalis_SandBreath(Unit, Event) 
	Unit:FullCastSpellOnTarget(20717, Unit:GetMainTank()) 
end

function Chronalis_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Chronalis_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(8197, 1, "Chronalis_OnCombat")
RegisterUnitEvent(8197, 2, "Chronalis_OnLeaveCombat")
RegisterUnitEvent(8197, 4, "Chronalis_OnDied")