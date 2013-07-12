--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]


function IronRuneAvenger_OnCombat(Unit, Event)
	Unit:RegisterEvent("IronRuneAvenger_RuneofRetribution", 3000, 1)
end

function IronRuneAvenger_RuneofRetribution(Unit, Event) 
	Unit:CastSpell(52628) 
end

function IronRuneAvenger_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function IronRuneAvenger_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26786, 1, "IronRuneAvenger_OnCombat")
RegisterUnitEvent(26786, 2, "IronRuneAvenger_OnLeaveCombat")
RegisterUnitEvent(26786, 4, "IronRuneAvenger_OnDied")