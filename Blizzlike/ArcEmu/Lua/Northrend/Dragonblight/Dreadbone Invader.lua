--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DreadboneInvader_OnCombat(Unit, Event)
	Unit:RegisterEvent("DreadboneInvader_Soulthirst", 10000, 0)
end

function DreadboneInvader_Soulthirst(Unit, Event) 
	Unit:FullCastSpellOnTarget(51290, Unit:GetMainTank()) 
end

function DreadboneInvader_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DreadboneInvader_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27286, 1, "DreadboneInvader_OnCombat")
RegisterUnitEvent(27286, 2, "DreadboneInvader_OnLeaveCombat")
RegisterUnitEvent(27286, 4, "DreadboneInvader_OnDied")