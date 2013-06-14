--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ShadowhoofSummoner_OnEnterCombat(Unit,Event)
	Unit:SetCombatMeleeCapable(1)
	Unit:RegisterEvent("ShadowhoofSummoner_CurseOfTongues", 30000, 0)
	Unit:RegisterEvent("ShadowhoofSummoner_ShadowBolt", 3000, 0)
end

function ShadowhoofSummoner_CurseOfTongues(Unit,Event)
	Unit:FullCastSpellOnTarget(13338, Unit:GetClosestPlayer())
end

function ShadowhoofSummoner_ShadowBolt(Unit,Event)
	Unit:FullCastSpellOnTarget(9613, Unit:GetClosestPlayer())
end

function ShadowhoofSummoner_OnLeaveCombat(Unit,Event)
	Unit:SetCombatMeleeCapable(0)
	Unit:RemoveEvents()
end

function ShadowhoofSummoner_OnDied(Unit,Event)
	Unit:SetCombatMeleeCapable(0)
	Unit:RemoveEvents()
end

RegisterUnitEvent(22859, 1, "ShadowhoofSummoner_OnEnterCombat")
RegisterUnitEvent(22859, 2, "ShadowhoofSummoner_OnLeaveCombat")
RegisterUnitEvent(22859, 4, "ShadowhoofSummoner_OnDied")