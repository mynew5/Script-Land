--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function NorthseaThug_OnCombat(Unit, Event)
	Unit:RegisterEvent("NorthseaThug_Crazed", 5000, 1)
end

function NorthseaThug_Crazed(Unit, Event) 
	Unit:CastSpell(5915) 
end

function NorthseaThug_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function NorthseaThug_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25843, 1, "NorthseaThug_OnCombat")
RegisterUnitEvent(25843, 2, "NorthseaThug_OnLeaveCombat")
RegisterUnitEvent(25843, 4, "NorthseaThug_OnDied")