--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ForgottenCaptain_OnCombat(Unit, Event)
	Unit:RegisterEvent("ForgottenCaptain_Stormhammer", 9000, 0)
end

function ForgottenCaptain_Stormhammer(Unit, Event) 
	Unit:FullCastSpellOnTarget(51591, Unit:GetMainTank()) 
end

function ForgottenCaptain_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ForgottenCaptain_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27220, 1, "ForgottenCaptain_OnCombat")
RegisterUnitEvent(27220, 2, "ForgottenCaptain_OnLeaveCombat")
RegisterUnitEvent(27220, 4, "ForgottenCaptain_OnDied")