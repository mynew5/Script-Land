--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BrantX; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function FelCrystal_OnSpawn(Unit,Event)
	Unit:StopMovement(1)
	Unit:SetCombatMeleeCapable(1)
	Unit:SetCombatCapable(1)
	Unit:SetCombatTargetingCapable(1)
end

function FelCrystal_OnDied(Unit,Event)
	Unit:RemoveEvents()
	Unit:RegisterEvent("FelCrystal_RemoveFromWorld", 3500, 1)
end

function FelCrystal_RemoveFromWorld(Unit,Event)
	Unit:RemoveFromWorld()
end

RegisterUnitEvent(24722, 18, "FelCrystal_OnSpawn")
RegisterUnitEvent(24722, 4, "FelCrystal_OnDied")