--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Goggeroc_OnCombat(Unit, Event)
	UnitRegisterEvent("Goggeroc_SnapKick", 6000, 0)
	UnitRegisterEvent("Goggeroc_Uppercut", 1000, 0)
end

function Goggeroc_SnapKick(Unit, Event) 
	UnitFullCastSpellOnTarget(8646, UnitGetMainTank()) 
end

function Goggeroc_Uppercut(Unit, Event) 
	UnitFullCastSpellOnTarget(10966, UnitGetMainTank()) 
end

function Goggeroc_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function Goggeroc_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(11920, 1, "Goggeroc_OnCombat")
RegisterUnitEvent(11920, 2, "Goggeroc_OnLeaveCombat")
RegisterUnitEvent(11920, 4, "Goggeroc_OnDied")