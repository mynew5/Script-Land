--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function KRider_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("KRider_SnapKick", 6000, 0)
	Unit:RegisterEvent("KRider_MortalStrike", 13000, 0)
end

function KRider_SnapKick(Unit,Event)
	Unit:FullCastSpellOnTarget(15618, Unit:GetClosestPlayer())
end

function KRider_MortalStrike(Unit,Event)
	Unit:FullCastSpellOnTarget(19643, Unit:GetClosestPlayer())
end

function KRider_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function KRider_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19364, 1, "KRider_OnEnterCombat")
RegisterUnitEvent(19364, 2, "KRider_OnLeaveCombat")
RegisterUnitEvent(19364, 4, "KRider_OnDied")