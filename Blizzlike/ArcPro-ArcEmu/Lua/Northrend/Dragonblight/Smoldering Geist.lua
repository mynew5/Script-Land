--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SmolderingGeist_OnCombat(Unit, Event)
	Unit:RegisterEvent("SmolderingGeist_BurningBlaze", 6500, 0)
end

function SmolderingGeist_BurningBlaze(Unit, Event) 
	Unit:FullCastSpellOnTarget(51500, Unit:GetMainTank()) 
end

function SmolderingGeist_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SmolderingGeist_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27363, 1, "SmolderingGeist_OnCombat")
RegisterUnitEvent(27363, 2, "SmolderingGeist_OnLeaveCombat")
RegisterUnitEvent(27363, 4, "SmolderingGeist_OnDied")