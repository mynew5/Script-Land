--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ForemanRigger_OnCombat(Unit, Event)
	UnitRegisterEvent("ForemanRigger_Net", 10000, 0)
	UnitRegisterEvent("ForemanRigger_PierceArmor", 12000, 1)
end

function ForemanRigger_Net(Unit, Event) 
	UnitFullCastSpellOnTarget(6533, UnitGetRandomPlayer(4)) 
end

function ForemanRigger_PierceArmor(Unit, Event) 
	UnitFullCastSpellOnTarget(6016, UnitGetMainTank()) 
end

function ForemanRigger_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function ForemanRigger_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(5931, 1, "ForemanRigger_OnCombat")
RegisterUnitEvent(5931, 2, "ForemanRigger_OnLeaveCombat")
RegisterUnitEvent(5931, 4, "ForemanRigger_OnDied")