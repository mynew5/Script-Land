--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function InjuredWarsongShaman_OnCombat(Unit, Event)
	Unit:RegisterEvent("InjuredWarsongShaman_ChainLightning", 8000, 0)
	Unit:RegisterEvent("InjuredWarsongShaman_EarthShock", 6000, 0)
end

function InjuredWarsongShaman_ChainLightning(Unit, Event) 
	Unit:FullCastSpellOnTarget(16033, Unit:GetMainTank()) 
end

function InjuredWarsongShaman_EarthShock(Unit, Event) 
	Unit:FullCastSpellOnTarget(25025, Unit:GetMainTank()) 
end

function InjuredWarsongShaman_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function InjuredWarsongShaman_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27108, 1, "InjuredWarsongShaman_OnCombat")
RegisterUnitEvent(27108, 2, "InjuredWarsongShaman_OnLeaveCombat")
RegisterUnitEvent(27108, 4, "InjuredWarsongShaman_OnDied")