--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function TallhornStag_OnCombat(Unit, Event)
	Unit:RegisterEvent("TallhornStag_Gore", 10000, 0)
end

function TallhornStag_Gore(Unit, Event) 
	Unit:FullCastSpellOnTarget(32019, Unit:GetMainTank()) 
end

function TallhornStag_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TallhornStag_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26363, 1, "TallhornStag_OnCombat")
RegisterUnitEvent(26363, 2, "TallhornStag_OnLeaveCombat")
RegisterUnitEvent(26363, 4, "TallhornStag_OnDied")