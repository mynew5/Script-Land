--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Vladek_OnCombat(Unit, Event)
	Unit:RegisterEvent("Vladek_Enrage", 10000, 0)
end

function Vladek_Enrage(Unit, Event) 
	Unit:CastSpell(32714) 
end

function Vladek_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Vladek_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27547, 1, "Vladek_OnCombat")
RegisterUnitEvent(27547, 2, "Vladek_OnLeaveCombat")
RegisterUnitEvent(27547, 4, "Vladek_OnDied")