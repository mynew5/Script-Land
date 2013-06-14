--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function VengefulSurge_OnEnterCombat(Unit, Event)
	Unit:RegisterEvent("FrostNova", 14000, 1)
end

function FrostNova(Unit, Event)
	Unit:FullCastSpellOnTarget(14907, Unit:GetMainTank())
end

function VengefulSurge_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function VengefulSurge_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2776, 1, "VengefulSurge_OnEnterCombat")
RegisterUnitEvent(2776, 2, "VengefulSurge_OnLeaveCombat")
RegisterUnitEvent(2776, 4, "VengefulSurge_OnDied")