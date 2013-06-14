--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function FrosthornRam_OnCombat(Unit, Event)
	Unit:RegisterEvent("FrosthornRam_HoofStrike", 7000, 0)
end

function FrosthornRam_HoofStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(29577, 	Unit:GetMainTank()) 
end

function FrosthornRam_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function FrosthornRam_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(23740, 1, "FrosthornRam_OnCombat")
RegisterUnitEvent(23740, 2, "FrosthornRam_OnLeaveCombat")
RegisterUnitEvent(23740, 4, "FrosthornRam_OnDied")