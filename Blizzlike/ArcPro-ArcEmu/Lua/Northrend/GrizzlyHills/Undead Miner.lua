--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function UndeadMiner_OnCombat(Unit, Event)
	Unit:RegisterEvent("UndeadMiner_PunctureWound", 7000, 0)
	Unit:RegisterEvent("UndeadMiner_ThrowLantern", 9000, 1)
end

function UndeadMiner_PunctureWound(Unit, Event) 
	Unit:FullCastSpellOnTarget(48374, Unit:GetMainTank()) 
end

function UndeadMiner_ThrowLantern(Unit, Event) 
	Unit:FullCastSpellOnTarget(52608, Unit:GetMainTank()) 
end

function UndeadMiner_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function UndeadMiner_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26891, 1, "UndeadMiner_OnCombat")
RegisterUnitEvent(26891, 2, "UndeadMiner_OnLeaveCombat")
RegisterUnitEvent(26891, 4, "UndeadMiner_OnDied")