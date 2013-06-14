--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Thassarian_OnCombat(Unit, Event)
	Unit:RegisterEvent("Thassarian_EmpoweredBloodPresence", 1000, 1)
end

function Thassarian_EmpoweredBloodPresence(Unit, Event) 
	Unit:CastSpell(50995) 
end

function Thassarian_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Thassarian_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26170, 1, "Thassarian_OnCombat")
RegisterUnitEvent(26170, 2, "Thassarian_OnLeaveCombat")
RegisterUnitEvent(26170, 4, "Thassarian_OnDied")