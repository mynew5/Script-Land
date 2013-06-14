--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function GorehooftheBlack_OnCombat(Unit, Event)
	UnitRegisterEvent("GorehooftheBlack_WarStomp", 8000, 0)
end

function GorehooftheBlack_WarStomp(Unit, Event) 
	UnitCastSpell(45) 
end

function GorehooftheBlack_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function GorehooftheBlack_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(11914, 1, "GorehooftheBlack_OnCombat")
RegisterUnitEvent(11914, 2, "GorehooftheBlack_OnLeaveCombat")
RegisterUnitEvent(11914, 4, "GorehooftheBlack_OnDied")