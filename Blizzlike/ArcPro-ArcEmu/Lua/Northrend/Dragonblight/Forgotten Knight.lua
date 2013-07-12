--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ForgottenKnight_OnCombat(Unit, Event)
	Unit:RegisterEvent("ForgottenKnight_Throw", 5000, 0)
end

function ForgottenKnight_Throw(Unit, Event) 
	Unit:FullCastSpellOnTarget(38556, Unit:GetMainTank()) 
end

function ForgottenKnight_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ForgottenKnight_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27224, 1, "ForgottenKnight_OnCombat")
RegisterUnitEvent(27224, 2, "ForgottenKnight_OnLeaveCombat")
RegisterUnitEvent(27224, 4, "ForgottenKnight_OnDied")