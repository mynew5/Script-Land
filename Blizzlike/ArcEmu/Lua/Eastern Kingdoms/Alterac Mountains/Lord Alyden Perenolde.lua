--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function perenolde_pws(pUnit, Event)
	pUnit:CastSpell(11974)
end

function perenolde_renew(pUnit, Event)
	pUnit:CastSpell(8362)
end

function perenolde_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("perenolde_pws", 2000, 1)
	pUnit:RegisterEvent("perenolde_renew", 20000, 1)
end

function perenolde_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2423, 1, "perenolde_OnCombat")
RegisterUnitEvent(2423, 2, "perenolde_OnLeaveCombat")