--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function AnubarAmbusher_OnCombat(Unit, Event)
	Unit:RegisterEvent("AnubarAmbusher_Rush", 6000, 0)
end

function AnubarAmbusher_Rush(Unit, Event) 
	Unit:CastSpell(50347) 
end

function AnubarAmbusher_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AnubarAmbusher_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26402, 1, "AnubarAmbusher_OnCombat")
RegisterUnitEvent(26402, 2, "AnubarAmbusher_OnLeaveCombat")
RegisterUnitEvent(26402, 4, "AnubarAmbusher_OnDied")