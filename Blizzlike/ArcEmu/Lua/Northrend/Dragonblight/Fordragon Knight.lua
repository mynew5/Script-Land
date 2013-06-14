--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function FordragonKnight_OnCombat(Unit, Event)
	Unit:RegisterEvent("FordragonKnight_RallyingCry", 2000, 1)
end

function FordragonKnight_RallyingCry(Unit, Event) 
	Unit:CastSpell(31732) 
end

function FordragonKnight_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function FordragonKnight_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27531, 1, "FordragonKnight_OnCombat")
RegisterUnitEvent(27531, 2, "FordragonKnight_OnLeaveCombat")
RegisterUnitEvent(27531, 4, "FordragonKnight_OnDied")