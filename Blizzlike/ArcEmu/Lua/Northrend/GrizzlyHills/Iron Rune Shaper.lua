--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]


function IronRuneShaper_OnCombat(Unit, Event)
	Unit:RegisterEvent("IronRuneShaper_MoldRune", 3000, 1)
end

function IronRuneShaper_MoldRune(Unit, Event) 
	Unit:CastSpell(52622) 
end

function IronRuneShaper_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function IronRuneShaper_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26270, 1, "IronRuneShaper_OnCombat")
RegisterUnitEvent(26270, 2, "IronRuneShaper_OnLeaveCombat")
RegisterUnitEvent(26270, 4, "IronRuneShaper_OnDied")