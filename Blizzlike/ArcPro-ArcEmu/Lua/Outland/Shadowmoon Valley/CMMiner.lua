--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function CMMiner_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("CMMiner_Enrage", 5000, 0)
end

function CMMiner_Enrage(Unit,Event)
	Unit:CastSpell(40743)
end

function CMMiner_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function CMMiner_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(23324, 1, "CMMiner_OnEnterCombat")
RegisterUnitEvent(23324, 2, "CMMiner_OnLeaveCombat")
RegisterUnitEvent(23324, 4, "CMMiner_OnDied")