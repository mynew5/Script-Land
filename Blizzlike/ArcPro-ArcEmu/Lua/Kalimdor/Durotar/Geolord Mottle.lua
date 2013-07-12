--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function GeolordMottle_OnCombat(Unit, Event)
	Unit:RegisterEvent("GeolordMottle_LightningShield", 5000, 0)
	Unit:RegisterEvent("GeolordMottle_HealingWave", 12000, 0)
end

function GeolordMottle_LightningShield(Unit, Event) 
	Unit:CastSpell(324) 
end

function GeolordMottle_HealingWave(Unit, Event) 
	Unit:CastSpell(547) 
end

function GeolordMottle_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GeolordMottle_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

function GeolordMottle_OnKilledTarget(Unit, Event) 
end

RegisterUnitEvent(5826, 1, "GeolordMottle_OnCombat")
RegisterUnitEvent(5826, 2, "GeolordMottle_OnLeaveCombat")
RegisterUnitEvent(5826, 3, "GeolordMottle_OnKilledTarget")
RegisterUnitEvent(5826, 4, "GeolordMottle_OnDied")