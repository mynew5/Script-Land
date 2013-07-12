--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function RyntharieltheKeymaster_OnCombat(Unit, Event)
	UnitRegisterEvent("RyntharieltheKeymaster_SlowingPoison", 10000, 0)
	UnitRegisterEvent("RyntharieltheKeymaster_Throw", 6000, 0)
end

function RyntharieltheKeymaster_SlowingPoison(Unit, Event) 
	UnitFullCastSpellOnTarget(7992, UnitGetMainTank()) 
end

function RyntharieltheKeymaster_Throw(Unit, Event) 
	UnitFullCastSpellOnTarget(10277, UnitGetMainTank()) 
end

function RyntharieltheKeymaster_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function RyntharieltheKeymaster_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(8518, 1, "RyntharieltheKeymaster_OnCombat")
RegisterUnitEvent(8518, 2, "RyntharieltheKeymaster_OnLeaveCombat")
RegisterUnitEvent(8518, 4, "RyntharieltheKeymaster_OnDied")