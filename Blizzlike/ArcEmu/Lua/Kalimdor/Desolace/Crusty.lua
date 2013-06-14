--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Crusty_OnCombat(Unit, Event)
	Unit:RegisterEvent("Crusty_Enrage", 10000, 1)
end

function Crusty_Enrage(Unit, Event) 
	Unit:CastSpell(8599) 
end

function Crusty_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Crusty_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(18241, 1, "Crusty_OnCombat")
RegisterUnitEvent(18241, 2, "Crusty_OnLeaveCombat")
RegisterUnitEvent(18241, 4, "Crusty_OnDied")