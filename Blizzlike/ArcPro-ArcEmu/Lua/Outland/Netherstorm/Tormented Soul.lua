--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Soul_OnCombat(Unit, Event)
	Unit:RegisterEvent("Soul_Immune", 6000, 0)
end

function Soul_Immune(Unit, Event) 
	Unit:FullCastSpellOnTarget(36153, Unit:GetMainTank()) 
end

function Soul_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Soul_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(20512, 1, "Soul_OnCombat")
RegisterUnitEvent(20512, 2, "Soul_OnLeaveCombat")
RegisterUnitEvent(20512, 4, "Soul_OnDied")