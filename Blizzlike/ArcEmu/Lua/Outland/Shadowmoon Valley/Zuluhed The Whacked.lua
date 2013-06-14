--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ZuluhedTheWhacked_OnEnterCombat(Unit,Event)
	Unit:CastSpell(38853)
	Unit:RegisterEvent("ZuluhedTheWhacked_DemonPortal", 35000, 0)
end

function ZuluhedTheWhacked_DemonPortal(Unit,Event)
	Unit:CastSpell(38876)
end

function ZuluhedTheWhacked_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function ZuluhedTheWhacked_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(11980, 1, "ZuluhedTheWhacked_OnEnterCombat")
RegisterUnitEvent(11980, 2, "ZuluhedTheWhacked_OnLeaveCombat")
RegisterUnitEvent(11980, 4, "ZuluhedTheWhacked_OnDied")