--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function RuulsNetherdrake_OnEnterCombat(Unit,Event)
	Unit:FullCastSpellOnTarget(38344, Unit:GetClosestPlayer())
	Unit:FullCastSpellOnTarget(36513, Unit:GetClosestPlayer())
	Unit:RegisterEvent("RuulsNetherdrake_ArcaneBlast", 000, 0)
end

function RuulsNetherdrake_ArcaneBlast(Unit,Event)
	Unit:FullCastSpellOnTarget(38344, Unit:GetClosestPlayer())
end

function RuulsNetherdrake_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

function RuulsNetherdrake_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(22106, 1, "RuulsNetherdrake_OnEnterCombat")
RegisterUnitEvent(22106, 2, "RuulsNetherdrake_OnLeaveCombat")
RegisterUnitEvent(22106, 4, "RuulsNetherdrake_OnDied")