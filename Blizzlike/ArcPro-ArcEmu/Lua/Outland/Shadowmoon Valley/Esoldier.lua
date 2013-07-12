--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ESoldier_OnEnterCombat(Unit,Event)
	if(Unit:GetHealthPct() == 3) then
		Unit:CastSpell(36476)
	end
end

function ESoldier_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function ESoldier_OnDeath(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(22016, 1, "ESoldier_OnEnterCombat")
RegisterUnitEvent(22016, 2, "ESoldier_OnLeaveCombat")
RegisterUnitEvent(22016, 4, "ESoldier_OnDeath")