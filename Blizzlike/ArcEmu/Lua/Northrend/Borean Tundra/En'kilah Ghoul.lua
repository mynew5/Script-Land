--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function EnkilahGhoul_OnCombat(Unit, Event)
	Unit:RegisterEvent("EnkilahGhoul_FleshRip", 8000, 0)
end

function EnkilahGhoul_FleshRip(Unit, Event) 
	Unit:FullCastSpellOnTarget(38056, Unit:GetMainTank()) 
end

function EnkilahGhoul_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function EnkilahGhoul_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25393, 1, "EnkilahGhoul_OnCombat")
RegisterUnitEvent(25393, 2, "EnkilahGhoul_OnLeaveCombat")
RegisterUnitEvent(25393, 4, "EnkilahGhoul_OnDied")