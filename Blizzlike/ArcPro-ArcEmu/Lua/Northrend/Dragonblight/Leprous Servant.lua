--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function LeprousServant_OnCombat(Unit, Event)
	Unit:RegisterEvent("LeprousServant_LeprousTouch", 8000, 0)
end

function LeprousServant_LeprousTouch(Unit, Event) 
	Unit:FullCastSpellOnTarget(51315, Unit:GetMainTank()) 
end

function LeprousServant_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function LeprousServant_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27800, 1, "LeprousServant_OnCombat")
RegisterUnitEvent(27800, 2, "LeprousServant_OnLeaveCombat")
RegisterUnitEvent(27800, 4, "LeprousServant_OnDied")