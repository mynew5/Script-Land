--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function AngratharAberration_OnCombat(Unit, Event)
	Unit:RegisterEvent("AngratharAberration_Enrage", 1000, 1)
end

function AngratharAberration_Enrage(Unit, Event) 
	Unit:CastSpell(31540) 
end

function AngratharAberration_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AngratharAberration_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27631, 1, "AngratharAberration_OnCombat")
RegisterUnitEvent(27631, 2, "AngratharAberration_OnLeaveCombat")
RegisterUnitEvent(27631, 4, "AngratharAberration_OnDied")