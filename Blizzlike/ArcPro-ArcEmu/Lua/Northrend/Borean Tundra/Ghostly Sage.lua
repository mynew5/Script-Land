--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function GhostlySage_OnCombat(Unit, Event)
	Unit:RegisterEvent("GhostlySage_Moonfire", 6000, 0)
	Unit:RegisterEvent("GhostlySage_Wrath", 8000, 0)
end

function GhostlySage_Moonfire(Unit, Event) 
	Unit:FullCastSpellOnTarget(15798, Unit:GetMainTank()) 
end

function GhostlySage_Wrath(Unit, Event) 
	Unit:FullCastSpellOnTarget(9739, Unit:GetMainTank()) 
end

function GhostlySage_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GhostlySage_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25351, 1, "GhostlySage_OnCombat")
RegisterUnitEvent(25351, 2, "GhostlySage_OnLeaveCombat")
RegisterUnitEvent(25351, 4, "GhostlySage_OnDied")