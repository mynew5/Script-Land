--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function NecrolordAmarion_OnCombat(Unit, Event)
	Unit:RegisterEvent("NecrolordAmarion_Decimate", 5500, 0)
end

function NecrolordAmarion_Decimate(Unit, Event) 
	Unit:FullCastSpellOnTarget(51339, Unit:GetMainTank()) 
end

function NecrolordAmarion_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function NecrolordAmarion_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27508, 1, "NecrolordAmarion_OnCombat")
RegisterUnitEvent(27508, 2, "NecrolordAmarion_OnLeaveCombat")
RegisterUnitEvent(27508, 4, "NecrolordAmarion_OnDied")