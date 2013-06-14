--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function TheAnvi_OnCombat(Unit, Event)
	Unit:RegisterEvent("TheAnvi_MoltenBlast", 8000, 0)
end

function TheAnvi_MoltenBlast(Unit, Event) 
	Unit:CastSpell(61577) 
end

function TheAnvi_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TheAnvi_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26406, 1, "TheAnvi_OnCombat")
RegisterUnitEvent(26406, 2, "TheAnvi_OnLeaveCombat")
RegisterUnitEvent(26406, 4, "TheAnvi_OnDied")