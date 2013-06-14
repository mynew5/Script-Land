--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DTinkerer_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("DTinkerer_Spell", 23000, 0)
end

function DTinkerer_Spell(Unit,Event)
	Unit:FullCastSpellOnTarget(38753, Unit:GetClosestPlayer())
end

function DTinkerer_LeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function DTinkerer_OnDeath(Unit,Event)
	Unit:RemoveEvents()
	Unit:CastSpell(38107)
end

RegisterUnitEvent(19754, 1, "DTinkerer_OnEnterCombat")
RegisterUnitEvent(19754, 2, "DTinkerer_LeaveCombat")
RegisterUnitEvent(19754, 4, "DTinkerer_OnDeath")