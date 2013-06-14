--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function OronuTheElder_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("OronuTheElder_GroundingTotem", 45000, 0)
	Unit:RegisterEvent("OronuTheElder_HealingWave", 11000, 0)
	Unit:RegisterEvent("OronuTheElder_LightningShield", 30000, 0)
end

function OronuTheElder_GroundingTotem(Unit,Event)
	Unit:CastSpell(34079)
end

function OronuTheElder_HealingWave(Unit,Event)
	Unit:FullCastSpellOnTarget(11986, Unit:GetRandomFriend())
end

function OronuTheElder_LightningShield(Unit,Event)
	Unit:CastSpell(12550)
end

function OronuTheElder_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function OronuTheElder_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21663, 1, "OronuTheElder_OnEnterCombat")
RegisterUnitEvent(21663, 2, "OronuTheElder_OnLeaveCombat")
RegisterUnitEvent(21663, 4, "OronuTheElder_OnDied")