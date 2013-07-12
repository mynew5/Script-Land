--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function RisenWintergardeDefender_OnCombat(Unit, Event)
	Unit:RegisterEvent("RisenWintergardeDefender_UnwaveringWill", 4000, 1)
end

function RisenWintergardeDefender_UnwaveringWill(Unit, Event) 
	Unit:CastSpell(51307) 
end

function RisenWintergardeDefender_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RisenWintergardeDefender_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27284, 1, "RisenWintergardeDefender_OnCombat")
RegisterUnitEvent(27284, 2, "RisenWintergardeDefender_OnLeaveCombat")
RegisterUnitEvent(27284, 4, "RisenWintergardeDefender_OnDied")