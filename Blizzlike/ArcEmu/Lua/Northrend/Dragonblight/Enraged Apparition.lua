--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function EnragedApparition_OnCombat(Unit, Event)
	Unit:RegisterEvent("EnragedApparition_Enrage", 10000, 1)
end

function EnragedApparition_Enrage(Unit, Event) 
	Unit:CastSpell(50420) 
end

function EnragedApparition_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function EnragedApparition_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27551, 1, "EnragedApparition_OnCombat")
RegisterUnitEvent(27551, 2, "EnragedApparition_OnLeaveCombat")
RegisterUnitEvent(27551, 4, "EnragedApparition_OnDied")