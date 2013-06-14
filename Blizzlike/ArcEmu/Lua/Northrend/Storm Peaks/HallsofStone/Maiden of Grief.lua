--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Holystone Productions; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

local MaidenofGrief = 27975
local StormofGrief = 43304

function MaidenofGrief_OnCombat(pUnit, Event)
    pUnit:SendChatMessage(14, 0, "You shouldn't have come...now you will die!")
	pUnit:RegisterEvent("MaidenofGrief_PartingSorrow", 20000, 0)
	pUnit:RegisterEvent("MaidenofGrief_PillarofWoe", 31000, 0)
	pUnit:RegisterEvent("MaidenofGrief_ShockofSorrow", 14000, 0)
	pUnit:RegisterEvent("MaidenofGrief_StormofGrief", 10000, 0)
end

function MaidenofGrief_PartingSorrow(pUnit, Event)
    pUnit:FullCastSpellOnTarget(59723, pUnit:GetRandomPlayer(0))
end

function MaidenofGrief_PillarofWoe(pUnit, Event)
    pUnit:FullCastSpellOnTarget(50761, pUnit:GetRandomPlayer(0))
	pUnit:GetSelection():AddAura(50761, 10000)
end

function MaidenofGrief_ShockofSorrow(pUnit, Event)
    pUnit:FullCastSpell(50760)
	pUnit:GetAITarges():AddAura(50760, 6000)
end

function MaidenofGrief_StormofGrief(pUnit, Event)
	local plr = pUnit:GetRandomPlayer(0)
	pUnit:SpawnCreature(43304, plr:GetX(), plr:GetY(), plr:GetZ(), plr:GetO(), 14, 22000)
end

RegisterUnitEvent(MaidenofGrief, 1, "MaidenofGrief_OnCombat")

function StormofGrief_OnSpawn(pUnit, Event)
	pUnit:SetFaction(14)
	pUnit:Root()
	pUnit:SetModel(11686)
	pUnit:SetScale(3)
	pUnit:RegisterEvent("StormofGrief_Aoe_Cast", 1000, 1)
end

function StormofGrief_Aoe_Cast(pUnit, Event)
	pUnit:CastSpellAoF(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), 50752)
end

RegisterUnitEvent(StormofGrief, 18, "StormofGrief_OnSpawn")