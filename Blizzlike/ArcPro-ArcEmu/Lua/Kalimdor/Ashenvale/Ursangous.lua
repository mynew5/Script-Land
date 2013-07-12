--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Ursangous_OnCombat(Unit, Event)
	Unit:RegisterEvent("Ursangous_KnockAway", 8000, 0)
	Unit:RegisterEvent("Ursangous_Rend", 10000, 0)
end

function Ursangous_KnockAway(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(10101, pUnit:GetMainTank()) 
end

function Ursangous_Rend(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(13443, pUnit:GetMainTank()) 
end

function Ursangous_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Ursangous_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12678, 1, "Ursangous_OnCombat")
RegisterUnitEvent(12678, 2, "Ursangous_OnLeaveCombat")
RegisterUnitEvent(12678, 4, "Ursangous_OnDied")