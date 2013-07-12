--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]


function IronRuneOverseer_OnCombat(Unit, Event)
	Unit:RegisterEvent("IronRuneOverseer_CallLightning", 6000, 0)
end

function IronRuneOverseer_CallLightning(Unit, Event) 
	Unit:FullCastSpellOnTarget(32018, Unit:GetMainTank()) 
end

function IronRuneOverseer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function IronRuneOverseer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27177, 1, "IronRuneOverseer_OnCombat")
RegisterUnitEvent(27177, 2, "IronRuneOverseer_OnLeaveCombat")
RegisterUnitEvent(27177, 4, "IronRuneOverseer_OnDied")