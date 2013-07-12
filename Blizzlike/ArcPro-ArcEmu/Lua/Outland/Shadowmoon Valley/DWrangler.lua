--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DWrangler_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("DWrangler_Net", 20000, 0)
	Unit:RegisterEvent("DWrangler_Enrage", 1000, 0)
end

function DWrangler_Net(Unit,Event)
	Unit:FullCastSpellOnTarget(38338, Unit:GetClosestPlayer())
end

function DWrangler_Enrage(Unit,Event)
	if(Unit:GetHealthPct() == 94) then
		Unit:CastSpell(8599)
	end
end

function DWrangler_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function DWrangler_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21717, 1, "DWrangler_OnEnterCombat")
RegisterUnitEvent(21717, 2, "DWrangler_OnLeaveCombat")
RegisterUnitEvent(21717, 4, "DWrangler_OnDied")