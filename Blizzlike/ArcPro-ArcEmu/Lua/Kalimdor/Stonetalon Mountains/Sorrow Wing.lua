--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SorrowWing_OnCombat(Unit, Event)
	UnitRegisterEvent("SorrowWing_SoulRend", 6000, 1)
	UnitRegisterEvent("SorrowWing_DeadlyLeechPoison", 8000, 1)
end

function SorrowWing_SoulRend(Unit, Event) 
	UnitFullCastSpellOnTarget(3405, UnitGetMainTank()) 
end

function SorrowWing_DeadlyLeechPoison(Unit, Event) 
	UnitFullCastSpellOnTarget(3388, UnitGetMainTank()) 
end

function SorrowWing_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function SorrowWing_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(5928, 1, "SorrowWing_OnCombat")
RegisterUnitEvent(5928, 2, "SorrowWing_OnLeaveCombat")
RegisterUnitEvent(5928, 4, "SorrowWing_OnDied")