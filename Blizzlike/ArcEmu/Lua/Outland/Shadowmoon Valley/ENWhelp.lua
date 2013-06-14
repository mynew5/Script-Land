--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ENWhelp_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("ENWhelp_Spell", 4000, 0)
end

function ENWhelp_Spell(Unit,Event)
	Unit:FullCastSpellOnTarget(38340, Unit:GetClosestPlayer())
end

function ENWhelp_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function ENWhelp_OnDeath(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21721, 1, "ENWhelp_OnEnterCombat")
RegisterUnitEvent(21721, 1, "ENWhelp_OnLeaveCombat")
RegisterUnitEvent(21721, 1, "ENWhelp_OnDeath")