--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SpellboundTerrorguard_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("SpellboundTerrorguard_FelFlames", 8000, 0)
	Unit:RegisterEvent("SpellboundTerrorguard_Hamstring", 20000, 3)
end

function SpellboundTerrorguard_FelFlames(Unit,Event)
	Unit:FullCastSpellOnTarget(37488, Unit:GetClosestPlayer())
end

function SpellboundTerrorguard_Hamstring(Unit,Event)
	Unit:FullCastSpellOnTarget(31553, Unit:GetClosestPlayer())
end

function SpellboundTerrorguard_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function SpellboundTerrorguard_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21908, 1, "SpellboundTerrorguard_OnEnterCombat")
RegisterUnitEvent(21908, 2, "SpellboundTerrorguard_OnLeaveCombat")
RegisterUnitEvent(21908, 4, "SpellboundTerrorguard_OnDied")