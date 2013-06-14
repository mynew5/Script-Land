--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]


function IceSerpent_OnCombat(Unit, Event)
	Unit:RegisterEvent("IceSerpent_IceSlash", 7000, 0)
end

function IceSerpent_IceSlash(Unit, Event) 
	Unit:FullCastSpellOnTarget(51878, Unit:GetMainTank()) 
end

function IceSerpent_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents() 
end

function IceSerpent_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26446, 1, "IceSerpent_OnCombat")
RegisterUnitEvent(26446, 2, "IceSerpent_OnLeaveCombat")
RegisterUnitEvent(26446, 4, "IceSerpent_OnDied")