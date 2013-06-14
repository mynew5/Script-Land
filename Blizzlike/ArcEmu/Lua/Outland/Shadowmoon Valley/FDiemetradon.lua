--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function FDiemetradon_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("FDiemetradon_Spell", 40000, 0)
end

function FDiemetradon_Spell(Unit,Event)
	Unit:FullCastSpellOnTarget(37941, Unit:GetClosestPlayer())
end

function FDiemetradon_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function FDiemetradon_OnDeath(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21408, 1, "FDiemetradon_OnEnterCombat")
RegisterUnitEvent(21408, 2, "FDiemetradon_OnLeaveCombat")
RegisterUnitEvent(21408, 4, "FDiemetradon_OnDeath")