--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function TatteredAbomination_OnCombat(Unit, Event)
	Unit:RegisterEvent("TatteredAbomination_ScourgeHook", 7000, 0)
end

function TatteredAbomination_ScourgeHook(Unit, Event) 
	Unit:FullCastSpellOnTarget(50335, Unit:GetMainTank()) 
end

function TatteredAbomination_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TatteredAbomination_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27797, 1, "TatteredAbomination_OnCombat")
RegisterUnitEvent(27797, 2, "TatteredAbomination_OnLeaveCombat")
RegisterUnitEvent(27797, 4, "TatteredAbomination_OnDied")