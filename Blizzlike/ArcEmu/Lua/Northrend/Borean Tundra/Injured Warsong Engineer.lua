--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function InjuredWarsongEngineer_OnCombat(Unit, Event)
	Unit:RegisterEvent("InjuredWarsongEngineer_GoblinDragonGun", 8000, 0)
	Unit:RegisterEvent("InjuredWarsongEngineer_SuperShrinkRay", 10000, 0)
end

function InjuredWarsongEngineer_GoblinDragonGun(Unit, Event) 
	Unit:CastSpell(44273) 
end

function InjuredWarsongEngineer_SuperShrinkRay(Unit, Event) 
	Unit:CastSpell(22742) 
end

function InjuredWarsongEngineer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function InjuredWarsongEngineer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27110, 1, "InjuredWarsongEngineer_OnCombat")
RegisterUnitEvent(27110, 2, "InjuredWarsongEngineer_OnLeaveCombat")
RegisterUnitEvent(27110, 4, "InjuredWarsongEngineer_OnDied")