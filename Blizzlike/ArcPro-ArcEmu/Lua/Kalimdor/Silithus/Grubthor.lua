--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Grubthor_OnCombat(Unit, Event)
	Unit:RegisterEvent("Grubthor_Tramble", 6000, 0)
end

function Grubthor_Tramble(Unit, Event) 
	Unit:CastSpell(5568) 
end

function Grubthor_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Grubthor_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14477, 1, "Grubthor_OnCombat")
RegisterUnitEvent(14477, 2, "Grubthor_OnLeaveCombat")
RegisterUnitEvent(14477, 4, "Grubthor_OnDied")