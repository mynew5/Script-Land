--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Shadumbra_OnCombat(Unit, Event)
	Unit:RegisterEvent("Shadumbra_Rend", 10000, 0)
end

function Shadumbra_Rend(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(13445, pUnit:GetMainTank()) 
end

function Shadumbra_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Shadumbra_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12677, 1, "Shadumbra_OnCombat")
RegisterUnitEvent(12677, 2, "Shadumbra_OnLeaveCombat")
RegisterUnitEvent(12677, 4, "Shadumbra_OnDied")