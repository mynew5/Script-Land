--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SV_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("SV_HeadCrack", 6000, 0)
	pUnit:RegisterEvent("SV_FireBomb", 11200, 0)
	pUnit:RegisterEvent("SV_Batter", 7000, 0)
end

function SV_HeadCrack(pUnit, Event)
	pUnit:FullCastSpellOnTarget(66407, pUnit:GetMainTank())
end

function SV_FireBomb(pUnit, Event)
	pUnit:FullCastSpell(66313, pUnit:GetRandomPlayer(0))
end

function SV_Batter(pUnit, Event)
	pUnit:FullCastSpellOnTarget(66408, pUnit:GetMainTank())
end

function SV_Death(pUnit, Event)
	pUnit:RemoveEvents()
	pUnit:Despawn(1, 0)
end

function SV_LeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
	pUnit:Despawn(1, 0)
end

RegisterUnitEvent(34800, 1, "SV_OnCombat")
RegisterUnitEvent(34800, 2, "SV_LeaveCombat")
RegisterUnitEvent(34800, 4, "SV_Death")