--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function FrigidGhoul_OnCombat(Unit, Event)
	Unit:RegisterEvent("FrigidGhoul_RotArmor", 8000, 0)
end

function FrigidGhoul_RotArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(50361, Unit:GetMainTank()) 
end

function FrigidGhoul_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function FrigidGhoul_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27534, 1, "FrigidGhoul_OnCombat")
RegisterUnitEvent(27534, 2, "FrigidGhoul_OnLeaveCombat")
RegisterUnitEvent(27534, 4, "FrigidGhoul_OnDied")