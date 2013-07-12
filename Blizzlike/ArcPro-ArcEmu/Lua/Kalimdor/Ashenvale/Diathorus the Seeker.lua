--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DiathorustheSeeker_OnCombat(Unit, Event)
	Unit:RegisterEvent("DiathorustheSeeker_DrainLife", 8000, 0)
end

function DiathorustheSeeker_DrainLife(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(18557, pUnit:GetMainTank()) 
end

function DiathorustheSeeker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DiathorustheSeeker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6072, 1, "DiathorustheSeeker_OnCombat")
RegisterUnitEvent(6072, 2, "DiathorustheSeeker_OnLeaveCombat")
RegisterUnitEvent(6072, 4, "DiathorustheSeeker_OnDied")