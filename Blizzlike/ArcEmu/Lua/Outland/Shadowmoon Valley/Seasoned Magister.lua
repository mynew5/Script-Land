--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SeasonedMagister_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("SeasonedMagister_Fireball", 3000, 0)
end

function SeasonedMagister_Fireball(Unit,Event)
	Unit:FullCastSpellOnTarget(15228, Unit:GetClosestPlayer())
end

function SeasonedMagister_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function SeasonedMagister_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(22863, 1, "SeasonedMagister_OnEnterCombat")
RegisterUnitEvent(22863, 2, "SeasonedMagister_OnLeaveCombat")
RegisterUnitEvent(22863, 4, "SeasonedMagister_OnDied")