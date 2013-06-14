--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Ascendscripting; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Runeweaver_OnCombat(Unit, Event)
	Unit:RegisterEvent("Runeweaver_AoE", 6000, 0)
end

function Runeweaver_AoE(pUnit, Event) 
	pUnit:CastSpell(3659) 
end

function Runeweaver_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Runeweaver_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2543, 1, "Runeweaver_OnCombat")
RegisterUnitEvent(2543, 2, "Runeweaver_OnLeaveCombat")
RegisterUnitEvent(2543, 4, "Runeweaver_OnDied")