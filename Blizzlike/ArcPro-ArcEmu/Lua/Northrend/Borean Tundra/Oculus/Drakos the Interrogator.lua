--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Holystone Productions; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

local Drakos = 27654
local Bombs = 43307

function DrakostheInterrogator_OnCombat(pUnit, event)
	pUnit:SendChatMessage(14, 0, "The prisoners shall not go free. The word of Malygos is law!")
	pUnit:RegisterEvent("DrakostheInterrogator_ThunderingStomp", 15000, 0)
	pUnit:RegisterEvent("DrakostheInterrogator_MagicPull", 33000, 0)
end

function DrakostheInterrogator_ThunderingStomp(pUnit, event)
  pUnit:SendChatMessage(14, 0, "I will crush you!")
   pUnit:FullCastSpell(50774)
end

function DrakostheInterrogator_MagicPull(pUnit, event)
	pUnit:SendChatMessage(14, 0, "It is too late to run!")
	pUnit:FullCastSpell(51336)
	pUnit:GetRandomPlayer(0):MoveTo(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), pUnit:GetO(), 256)
	pUnit:RegisterEvent("DrakostheInterrogator_SpawnAdd", 5000, 1)
end

function DrakostheInterrogator_SpawnAdd(pUnit, event)
	pUnit:SpawnCreature(43307, pUnit:GetX()+7, pUnit:GetY()+3, pUnit:GetZ()+3, pUnit:GetO(), 14, 20000)
	pUnit:SpawnCreature(43307, pUnit:GetX()+4, pUnit:GetY()+1, pUnit:GetZ()+2, pUnit:GetO(), 14, 20000)
	pUnit:SpawnCreature(43307, pUnit:GetX()+5, pUnit:GetY()+5, pUnit:GetZ()+1, pUnit:GetO(), 14, 20000)
	pUnit:SpawnCreature(43307, pUnit:GetX()+3, pUnit:GetY()+7, pUnit:GetZ()+2, pUnit:GetO(), 14, 20000)
	pUnit:SpawnCreature(43307, pUnit:GetX()+1, pUnit:GetY()+9, pUnit:GetZ()+1, pUnit:GetO(), 14, 20000)
	pUnit:SpawnCreature(43307, pUnit:GetX()+2, pUnit:GetY()+3, pUnit:GetZ()+3, pUnit:GetO(), 14, 20000)
	pUnit:SpawnCreature(43307, pUnit:GetX()+9, pUnit:GetY()+2, pUnit:GetZ()+1, pUnit:GetO(), 14, 20000)
end

function DrakostheInterrogator_Bombs(pUnit, event)
	pUnit:Root()
	pUnit:RegisterEvent("DrakostheInterrogator_Bombs_Explogen", 5000, 1)
end

function DrakostheInterrogator_Bombs_Explogen(pUnit, event)
	pUnit:CastSpell(1449)
end

RegisterUnitEvent(Drakos, 1, "DrakostheInterrogator_OnCombat")
RegisterUnitEvent(Bombs, 18, "DrakostheInterrogator_Bombs")