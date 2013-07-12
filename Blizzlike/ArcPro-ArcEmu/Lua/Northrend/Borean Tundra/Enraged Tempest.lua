--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function EnragedTempest_OnCombat(Unit, Event)
	Unit:RegisterEvent("EnragedTempest_Enrage", 10000, 0)
	Unit:RegisterEvent("EnragedTempest_Zephyr", 9000, 1)
end

function EnragedTempest_Enrage(Unit, Event) 
	Unit:CastSpell(50420) 
end

function EnragedTempest_Zephyr(Unit, Event) 
	Unit:CastSpell(50215) 
end

function EnragedTempest_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function EnragedTempest_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25415, 1, "EnragedTempest_OnCombat")
RegisterUnitEvent(25415, 2, "EnragedTempest_OnLeaveCombat")
RegisterUnitEvent(25415, 4, "EnragedTempest_OnDied")