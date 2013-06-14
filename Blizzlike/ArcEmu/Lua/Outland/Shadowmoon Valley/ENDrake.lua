--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ENDrake_OnEnterCombat(Unit,Event)
	Unit:CastSpell(38775)
	Unit:RegisterEvent("ENDrake_Spell", 13000, 0)
end

function ENDrake_Spell(Unit,Event)
	Unit:FullCastSpellOnTarget(36513, Unit:GetClosestPlayer())
end

function ENDrake_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function ENDrake_OnDeath(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21722, 1, "ENDrake_OnEnterCombat")
RegisterUnitEvent(21722, 2, "ENDrake_OnLeaveCombat")
RegisterUnitEvent(21722, 4, "ENDrake_OnDeath")