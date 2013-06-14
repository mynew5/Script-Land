--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Holystone Productions; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

local General = 28586
local Stormforged = 29240

function General_OnCombat(pUnit, Event)
	   pUnit:RegisterEvent("General_SpawnAdd", 400, 1)
	   pUnit:RegisterEvent("General_BattleStance", 500, 1)
end

function General_BattleStance(pUnit, Event)
	pUnit:RemoveEvents()
	pUnit:AddAura(41106, 0)
	pUnit:RegisterEvent("General_Cleave", 5000, 0)
	pUnit:RegisterEvent("General_BerserkerStance", 20000, 1)
end

function General_Cleave(pUnit, Event)
	pUnit:CastSpellOnTarget(15284, pUnit:GetClosestEnemy())
end

function General_BerserkerStance(pUnit, Event)
	pUnit:RemoveEvents()
	pUnit:RemoveAura(41106)
    pUnit:AddAura(41107, 0)
	pUnit:RegisterEvent("General_MortalStrike", 4000, 0)
	pUnit:RegisterEvent("General_Whirlwind", 8000, 1)
	pUnit:RegisterEvent("General_DefensiveStance", 20000, 1)
end

function General_MortalStrike(pUnit, Event)
    pUnit:CastSpellOnTarget(16856, pUnit:GetClosestEnemy())
end

function General_Whirlwind(pUnit, Event)
	  pUnit:FullCastSpell(52027)
	  pUnit:Root()
	  pUnit:RegisterEvent("General_UnRoot", 8000, 1)
end

function General_UnRoot(pUnit, Event)
	pUnit:UnRoot()
end

function General_DefensiveStance(pUnit, Event)
	pUnit:RemoveEvents()
	pUnit:RemoveAura(41107)
	pUnit:AddAura(41105, 0)
    pUnit:RegisterEvent("General_Intercept", 4000, 0)
	pUnit:RegisterEvent("General_KnockAway", 7000, 0)
	pUnit:RegisterEvent("General_SpellReflection", 10000, 0)
	pUnit:RegisterEvent("General_BattleStance", 20000, 1)
end

function General_Intercept(pUnit, Event)
    pUnit:CastSpellOnTarget(58769, pUnit:GetRandomPlayer(0))
    pUnit:GetRandomPlayer(0):AddAura(58747, 3000)
end

function General_KnockAway(pUnit, Event)
	pUnit:CastSpellOnTarget(52029, pUnit:GetClosestEnemy())
end

function General_SpellReflection(pUnit, Event)
  pUnit:CastSpell(36096)
    pUnit:AddAura(36096, 8000)
end

function General_SpawnAdd(pUnit, Event)
local plr = pUnit:GetRandomPlayer(0)
	pUnit:SpawnCreature(29240, plr:GetX()+4, plr:GetY(), plr:GetZ(), plr:GetO(), 14, 360000)
	pUnit:SpawnCreature(29240, plr:GetX(), plr:GetY()+4, plr:GetZ(), plr:GetO(), 14, 360000)
end

function StormforgedLieutenant_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Stormforged_ArcWeld", 10000, 0)
	pUnit:RegisterEvent("Stormforged_RenewSteel", 7000, 0)
end

function Stormforged_ArcWeld(pUnit, Event)
	pUnit:CastSpellOnTarget(59085, pUnit:GetRandomPlayer(0))
    pUnit:GetRandomPlayer(0):AddAura(59086, 10000)
--	pUnit:GetRandomPlayer(0):Root()
--	pUnit:RegisterEvent("Target_UnRoot", 10000, 1)
end

function Target_UnRoot(pUnit, Event)
	pUnit:GetAITargets():Unroot()
end

function Stormforged_RenewSteel(pUnit, Event)
	if(pUnit:GetClosestFriend() == 28586) then
		pUnit:CastSpellOnTarget(52774, pUnit:GetClosestFriend())
	end
end

function General_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(General, 1, "General_OnCombat")
RegisterUnitEvent(General, 2, "General_OnLeaveCombat")
RegisterUnitEvent(Stormforged, 1, "StormforgedLieutenant_OnCombat")