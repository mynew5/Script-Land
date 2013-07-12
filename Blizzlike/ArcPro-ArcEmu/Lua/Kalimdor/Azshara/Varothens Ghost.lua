--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function VarothensGhost_OnCombat(Unit, Event)
	Unit:RegisterEvent("VarothensGhost_CurseofWeakness", 8000, 0)
end

function VarothensGhost_CurseofWeakness(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(21007, 	pUnit:GetMainTank()) 
end

function VarothensGhost_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function VarothensGhost_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6118, 1, "VarothensGhost_OnCombat")
RegisterUnitEvent(6118, 2, "VarothensGhost_OnLeaveCombat")
RegisterUnitEvent(6118, 4, "VarothensGhost_OnDied")