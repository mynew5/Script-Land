--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DHSupplicant_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("DHSupplicant_Spell", 40000, 0)
end

function DHSupplicant_Spell(Unit,Event)
	Unit:CastSpell(37683)
end

function DHSupplicant_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

function DHSupplicant_LeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21179, 1, "DHSupplicant_OnEnterCombat")
RegisterUnitEvent(21179, 2, "DHSupplicant_LeaveCombat")
RegisterUnitEvent(21179, 4, "DHSupplicant_OnDied")