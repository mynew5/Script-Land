--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ClamMasterK_OnCombat(Unit, Event)
	Unit:RegisterEvent("ClamMasterK_HookedNet", 8000, 0)
end

function ClamMasterK_HookedNet(Unit, Event) 
	Unit:FullCastSpellOnTarget(49711, Unit:GetMainTank()) 
end

function ClamMasterK_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ClamMasterK_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25800, 1, "ClamMasterK_OnCombat")
RegisterUnitEvent(25800, 2, "ClamMasterK_OnLeaveCombat")
RegisterUnitEvent(25800, 4, "ClamMasterK_OnDied")