--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Bapes; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--local Slad'ranConstrictor = 29713
--local Slad'ranViper = 29680

function Sladran_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Drakkari gonna kill anybody who trespass on these lands!")
	pUnit:RegisterEvent("Sladran_PoisonNova", math.random(15000,17000), 0)
	pUnit:RegisterEvent("Sladran_PowerfulBite", math.random(22000,24000), 0)
	pUnit:RegisterEvent("Sladran_VenomBolt", math.random(29000,34000), 0)
end

function Sladran_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Sladran_OnKillTarget(pUnit, Event)
local Text = math.random(1,4)
	if(Text == 1) then
		pUnit:SendChatMessage(14, 0, "Ye not breathin'! Good.")
	elseif(Text == 2) then
		pUnit:SendChatMessage(14, 0, "You scared now?")
	elseif(Text == 3) then
		pUnit:SendChatMessage(14, 0, "I'll eat you next, mon!")
	end
end

function Sladran_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
	pUnit:SendChatMessage(14, 0, "I see now... Scourge was not our greatest enemy.")
end

function Sladran_PhaseTwo(pUnit, Event)
	if(pUnit:GetHealthPct() <= 30) then
		pUnit:RegisterEvent("Sladran_SummonAdds", math.random(40000,42000), 0)
		pUnit:RegisterEvent("Sladran_PoisonNova", math.random(15000,17000), 0)
		pUnit:RegisterEvent("Sladran_PowerfulBite", math.random(22000,24000), 0)
		pUnit:RegisterEvent("Sladran_VenomBolt", math.random(29000,34000), 0)
	end
end

function Sladran_SummonAdds(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Minions of the scale, heed my call!")
	pUnit:SpawnCreature(29713, pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), pUnit:GetO(), 14, 0)
	pUnit:SpawnCreature(29713, pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), pUnit:GetO(), 14, 0)
	pUnit:SpawnCreature(29680, pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), pUnit:GetO(), 14, 0)
	pUnit:SpawnCreature(29680, pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), pUnit:GetO(), 14, 0)
end

function Sladran_PoisonNova(pUnit, Event)
	pUnit:FullCastSpell(55081)
end

function Sladran_PowerfulBite(pUnit, Event)
	pUnit:FullCastSpellOnTarget(48287, pUnit:GetMainTank())
end

function Sladran_VenomBolt(pUnit, Event)
	pUnit:FullCastSpellOnTarget(54970, pUnit:GetRandomPlayer(0))
end

RegisterUnitEvent(29304, 1, "Sladran_OnCombat")
RegisterUnitEvent(29304, 2, "Sladran_OnLeaveCombat")
RegisterUnitEvent(29304, 3, "Sladran_OnKillTarget")
RegisterUnitEvent(29304, 4, "Sladran_OnDeath")