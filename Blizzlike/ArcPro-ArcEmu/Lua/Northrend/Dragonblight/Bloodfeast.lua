--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Bloodfeast_OnCombat(Unit, Event)
	Unit:RegisterEvent("Bloodfeast_InciteMaggots", 4000, 1)
end

function Bloodfeast_InciteMaggots(Unit, Event) 
	Unit:CastSpell(52126) 
end

function Bloodfeast_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Bloodfeast_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27008, 1, "Bloodfeast_OnCombat")
RegisterUnitEvent(27008, 2, "Bloodfeast_OnLeaveCombat")
RegisterUnitEvent(27008, 4, "Bloodfeast_OnDied")