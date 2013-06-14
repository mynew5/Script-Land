--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Holystone Productions; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

local Volkhan = 28587
local MoltenGolem = 28695

function Volkhan_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Phase_One", 1000, 1)
end

function Phase_One(pUnit, Event)
	pUnit:RegisterEvent("Volkhan_ShatteringStomp", 20000, 0)
	pUnit:RegisterEvent("Volkhan_Heat", 60000, 0)
	pUnit:RegisterEvent("Volkhan_Phase_Two", 1000, 0)
end

function Volkhan_ShatteringStomp(pUnit, Event)
    pUnit:FullCastSpellOnTarget(52237, Unit:GetAITargets())
end

function Volkhan_Heat(pUnit, Event)
	pUnit:CastSpell(52387)
end

function Volkhan_Phase_Two(pUnit, Event)
	if(pUnit:GetHealthPct() <= 80) then
		pUnit:RemoveEvents()
		pUnit:RegisterEvent("Volkhan_Move_Unvil", 500, 1)
		pUnit:RegisterEvent("Volkhan_SpawnAdds", 10000, 1)
		pUnit:RegisterEvent("Volkhan_ShatteringStomp", 20000, 0)
		pUnit:RegisterEvent("Volkhan_Heat", 60000, 0)
		pUnit:RegisterEvent("Volkhan_Phase_Twee", 1000, 0)
	end
end

function Volkhan_Move_Unvil(pUnit, Event)
	pUnit:MoveTo(1328.150024, -95.666222, 56.716076, 2.270505)
end

function Volkhan_SpawnAdds(pUnit, Event)
local plr = pUnit:GetMainTank()
	pUnit:SpawnCreature(28695, plr:GetX(), plr:GetY(), plr:GetZ(), plr:GetO(), 14, 360000)
end

function Volkhan_ShatteringStomp(pUnit, Event)
    pUnit:FullCastSpellOnTarget(52237, pUnit:GetAITargets())
end

function Volkhan_Heat(pUnit, Event)
	pUnit:CastSpell(52387)
end

function Volkhan_Phase_Tree(pUnit, Event)
	if(pUnit:GetHealthPct() <= 60) then
		pUnit:RemoveEvents()
		pUnit:RegisterEvent("Volkhan_Move_Unvil", 500, 1)
		pUnit:RegisterEvent("Volkhan_SpawnAdds", 10000, 1)
		pUnit:RegisterEvent("Volkhan_ShatteringStomp", 20000, 0)
		pUnit:RegisterEvent("Volkhan_Heat", 60000, 0)
		pUnit:RegisterEvent("Volkhan_Phase_For", 1000, 0)
	end
end

function Volkhan_Move_Unvil(pUnit, Event)
	pUnit:MoveTo(1328.150024, -95.666222, 56.716076, 2.270505)
end

function Volkhan_SpawnAdds(pUnit, Event)
local plr = pUnit:GetMainTank()
	pUnit:SpawnCreature(28695, plr:GetO(), plr:GetZ(), plr:GetY(), plr:GetX(), 14, 360000)
end

function Volkhan_ShatteringStomp(pUnit, Event)
	pUnit:FullCastSpellOnTarget(52237, pUnit:GetAITargets())
end

function Volkhan_Heat(pUnit, Event)
	pUnit:CastSpell(52387)
end

function Volkhan_Phase_For(pUnit, Event)
	if(pUnit:GetHealthPct() <= 40) then
		pUnit:RemoveEvents()
		pUnit:RegisterEvent("Volkhan_Move_Unvil", 500, 1)
		pUnit:RegisterEvent("Volkhan_SpawnAdds", 10000, 1)
		pUnit:RegisterEvent("Volkhan_ShatteringStomp", 20000, 0)
		pUnit:RegisterEvent("Volkhan_Heat", 60000, 0)
		pUnit:RegisterEvent("Volkhan_Phase_Five", 1000, 0)
	end
end

function Volkhan_Move_Unvil(pUnit, Event)
	pUnit:MoveTo(1328.150024, -95.666222, 56.716076, 2.270505)
end

function Volkhan_SpawnAdds(pUnit, Event)
local plr = pUnit:GetMainTank()
	pUnit:SpawnCreature(28695, plr:GetX(), plr:GetY(), plr:GetZ(), plr:GetO(), 14, 360000)
end

function Volkhan_ShatteringStomp(pUnit, Event)
	pUnit:FullCastSpellOnTarget(52237, pUnit:GetAITargets())
end

function Volkhan_Heat(pUnit, Event)
	pUnit:CastSpell(52387)
end

function Volkhan_Phase_Five(pUnit, Event)
	if(pUnit:GetHealthPct() <= 20) then
		pUnit:RemoveEvents()
		pUnit:RegisterEvent("Volkhan_Move_Unvil", 500, 1)
		pUnit:RegisterEvent("Volkhan_SpawnAdds", 10000, 1)
		pUnit:RegisterEvent("Volkhan_ShatteringStomp", 20000, 0)
		pUnit:RegisterEvent("Volkhan_Heat", 60000, 0)
	end
end

function Volkhan_Move_Unvil(pUnit, Event)
	pUnit:MoveTo(1328.150024, -95.666222, 56.716076, 2.270505)
end

function Volkhan_SpawnAdds(pUnit, Event)
   local plr = pUnit:GetMainTank()
   pUnit:SpawnCreature(28695, plr:GetX(), plr:GetY(), plr:GetZ(), plr:GetO(), 14, 360000)
end

function Volkhan_ShatteringStomp(pUnit, Event)
	pUnit:FullCastSpellOnTarget(52237, pUnit:GetAITargets())
end

function Volkhan_Heat(pUnit, Event)
	pUnit:CastSpell(52387)
end

RegisterUnitEvent(Volkhan, 1, "Volkhan_OnCombat")