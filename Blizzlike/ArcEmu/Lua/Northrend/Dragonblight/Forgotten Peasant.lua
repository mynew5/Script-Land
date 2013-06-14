--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ForgottenPeasant_OnCombat(Unit, Event)
	Unit:RegisterEvent("ForgottenPeasant_Bonk", 6000, 0)
end

function ForgottenPeasant_Bonk(Unit, Event) 
	Unit:FullCastSpellOnTarget(51601, Unit:GetMainTank()) 
end

function ForgottenPeasant_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ForgottenPeasant_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27226, 1, "ForgottenPeasant_OnCombat")
RegisterUnitEvent(27226, 2, "ForgottenPeasant_OnLeaveCombat")
RegisterUnitEvent(27226, 4, "ForgottenPeasant_OnDied")