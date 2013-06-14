--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function logrosh_bloodlust(pUnit, Event)
	pUnit:CastSpell(6742)
end

function logrosh_fireshield(pUnit, Event)
	pUnit:CastSpell(2601)
end

function logrosh_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("logrosh_bloodlust", 30000, 0)
	pUnit:RegisterEvent("logrosh_fireshield", 2000, 1)
end

function logrosh_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2453, 1, "logrosh_OnCombat")
RegisterUnitEvent(2453, 2, "logrosh_OnLeaveCombat")