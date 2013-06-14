--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function CaptainShely_OnCombat(Unit, Event)
	Unit:RegisterEvent("CaptainShely_RunThrough", 5000, 1)
end

function CaptainShely_RunThrough(Unit, Event) 
	Unit:FullCastSpellOnTarget(50853, Unit:GetMainTank()) 
end

function CaptainShely_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CaptainShely_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27232, 1, "CaptainShely_OnCombat")
RegisterUnitEvent(27232, 2, "CaptainShely_OnLeaveCombat")
RegisterUnitEvent(27232, 4, "CaptainShely_OnDied")