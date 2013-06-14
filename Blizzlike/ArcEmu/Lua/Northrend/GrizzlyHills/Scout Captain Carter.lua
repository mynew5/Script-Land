--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ScoutCaptainCarter_OnCombat(Unit, Event)
	Unit:RegisterEvent("ScoutCaptainCarter_DebilitatingStrike", 7000, 0)
end

function ScoutCaptainCarter_DebilitatingStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(38621, Unit:GetMainTank()) 
end

function ScoutCaptainCarter_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ScoutCaptainCarter_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27783, 1, "ScoutCaptainCarter_OnCombat")
RegisterUnitEvent(27783, 2, "ScoutCaptainCarter_OnLeaveCombat")
RegisterUnitEvent(27783, 4, "ScoutCaptainCarter_OnDied")