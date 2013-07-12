--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function NerubarWarrior_OnCombat(Unit, Event)
	Unit:RegisterEvent("NerubarWarrior_Rush", 8000, 0)
end

function NerubarWarrior_Rush(Unit, Event) 
	Unit:CastSpell(50347) 
end

function NerubarWarrior_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function NerubarWarrior_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25619, 1, "NerubarWarrior_OnCombat")
RegisterUnitEvent(25619, 2, "NerubarWarrior_OnLeaveCombat")
RegisterUnitEvent(25619, 4, "NerubarWarrior_OnDied")