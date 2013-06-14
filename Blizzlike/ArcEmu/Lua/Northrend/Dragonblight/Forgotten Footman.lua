--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ForgottenFootman_OnCombat(Unit, Event)
	Unit:RegisterEvent("ForgottenFootman_ShieldBlock", 5000, 0)
end

function ForgottenFootman_ShieldBlock(Unit, Event) 
	Unit:CastSpell(32587) 
end

function ForgottenFootman_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ForgottenFootman_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27229, 1, "ForgottenFootman_OnCombat")
RegisterUnitEvent(27229, 2, "ForgottenFootman_OnLeaveCombat")
RegisterUnitEvent(27229, 4, "ForgottenFootman_OnDied")