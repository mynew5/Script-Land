--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function MTerokk_OnCombat(Unit, Event)
	Unit:RegisterEvent("MTerokk_Dmg", 7000, 0)
end

function MTerokk_Dmg(Unit, Event) 
	Unit:FullCastSpellOnTarget(38021, Unit:GetMainTank()) 
end

function MTerokk_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MTerokk_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(22376, 1, "MTerokk_OnCombat")
RegisterUnitEvent(22376, 2, "MTerokk_OnLeaveCombat")
RegisterUnitEvent(22376, 4, "MTerokk_OnDied")