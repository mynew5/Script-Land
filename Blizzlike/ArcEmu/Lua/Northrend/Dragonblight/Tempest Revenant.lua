--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function TempestRevenant_OnCombat(Unit, Event)
	Unit:RegisterEvent("TempestRevenant_SeethingFlames", 6000, 0)
end

function TempestRevenant_SeethingFlames(Unit, Event) 
	Unit:FullCastSpellOnTarget(56620, Unit:GetMainTank()) 
end

function TempestRevenant_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TempestRevenant_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(30875, 1, "TempestRevenant_OnCombat")
RegisterUnitEvent(30875, 2, "TempestRevenant_OnLeaveCombat")
RegisterUnitEvent(30875, 4, "TempestRevenant_OnDied")