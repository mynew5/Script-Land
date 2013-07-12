--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function TorturerLeCraft_OnCombat(Unit, Event)
	Unit:RegisterEvent("TorturerLeCraft_Hemorrhage", 5000, 0)
	Unit:RegisterEvent("TorturerLeCraft_KidneyShot", 10000, 0)
end

function TorturerLeCraft_Hemorrhage(Unit, Event) 
	Unit:FullCastSpellOnTarget(30478) 
end

function TorturerLeCraft_KidneyShot(Unit, Event) 
	Unit:FullCastSpellOnTarget(30621, Unit:GetMainTank()) 
end

function TorturerLeCraft_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TorturerLeCraft_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27209, 1, "TorturerLeCraft_OnCombat")
RegisterUnitEvent(27209, 2, "TorturerLeCraft_OnLeaveCombat")
RegisterUnitEvent(27209, 4, "TorturerLeCraft_OnDied")