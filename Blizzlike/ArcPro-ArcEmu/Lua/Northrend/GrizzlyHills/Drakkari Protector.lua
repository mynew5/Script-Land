--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DrakkariProtector_OnCombat(Unit, Event)
	Unit:RegisterEvent("DrakkariProtector_HeadTrauma", 7000, 0)
end

function DrakkariProtector_HeadTrauma(Unit, Event) 
	Unit:FullCastSpellOnTarget(52425, Unit:GetMainTank()) 
end

function DrakkariProtector_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DrakkariProtector_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26797, 1, "DrakkariProtector_OnCombat")
RegisterUnitEvent(26797, 2, "DrakkariProtector_OnLeaveCombat")
RegisterUnitEvent(26797, 4, "DrakkariProtector_OnDied")