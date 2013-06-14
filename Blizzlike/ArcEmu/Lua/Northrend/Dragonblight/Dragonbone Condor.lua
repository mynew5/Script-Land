--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DragonboneCondor_OnCombat(Unit, Event)
	Unit:RegisterEvent("DragonboneCondor_EvasiveManeuver", 6000, 0)
end

function DragonboneCondor_EvasiveManeuver(Unit, Event) 
	Unit:CastSpell(51946) 
end

function DragonboneCondor_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DragonboneCondor_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26483, 1, "DragonboneCondor_OnCombat")
RegisterUnitEvent(26483, 2, "DragonboneCondor_OnLeaveCombat")
RegisterUnitEvent(26483, 4, "DragonboneCondor_OnDied")