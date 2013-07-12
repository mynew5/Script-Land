--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function WoolyMammoth_OnCombat(Unit, Event)
	Unit:RegisterEvent("WoolyMammoth_Trample", 6000, 0)
end

function WoolyMammoth_Trample(Unit, Event) 
	Unit:CastSpell(15550) 
end

function WoolyMammoth_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WoolyMammoth_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(24614, 1, "WoolyMammoth_OnCombat")
RegisterUnitEvent(24614, 2, "WoolyMammoth_OnLeaveCombat")
RegisterUnitEvent(24614, 4, "WoolyMammoth_OnDied")