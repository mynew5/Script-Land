--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function GAF_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Enrage", 7000, 0)
	pUnit:RegisterEvent("Flurry", 14000, 0)
	pUnit:RegisterEvent("SunderArmor", 21000, 0)
end

function Enrage(pUnit, Event)
	if(pUnit:GetHealthPct() >= 30) then
		pUnit:SpawnCreature(8894, pUnit:GetX(), pUnit:GetY(),pUnit:GetZ(), pUnit:GetO(), 14, 300000)
		pUnit:SpawnCreature(8894, pUnit:GetX(), pUnit:GetY(),pUnit:GetZ(), pUnit:GetO(), 14, 300000)
		pUnit:FullCastSpell(15061)
	end
end

function Flurry(pUnit, Event)
	pUnit:FullCastSpell(17687)
end

function SunderArmor(pUnit, Event)
	pUnit:FullCastSpellOnTarget(15572)
end

function GAF_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function GAF_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(9033, 1, "GAF_OnCombat")
RegisterUnitEvent(9033, 2, "GAF_OnLeaveCombat")
RegisterUnitEvent(9033, 4, "GAF_OnDeath")