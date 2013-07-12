--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BrantX; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]
--[[Illidan Stormrage yells: Akama. Your duplicity is hardly surprising. I should have slaughtered you and your malformed brethren long ago.
Illidan Stormrage yells: Behold the power... of the demon within!
Illidan Stormrage yells: Boldly said. But I remain... unconvinced.
Illidan Stormrage yells: Feel the hatred of ten thousand years!
Illidan Stormrage yells: Is this it, mortals? Is this all the fury you can muster?
Illidan Stormrage yells: Maiev... How is it even possible?
Illidan Stormrage yells: Stare into the eyes of the Betrayer!
Illidan Stormrage yells: This is too easy!
Illidan Stormrage yells: Who shall be next to taste my blades?
Illidan Stormrage yells: You have won... Maiev. But the huntress... is nothing without the hunt. You... are nothing... without me.]]

function Illidan_OnSpawn(Unit,Event)
	Unit:StopMovement(1)
	Unit:SetCombatMeleeCapable(1)
	Unit:CastSpell(39656)
	Unit:ApplyAura(39656)
	Unit:SetUInt32Value(UnitField.Unit_FIELD_FLAGS,UnitFieldFlags.Unit_FLAG_NOT_ATTACKABLE_9)
end

RegisterUnitEvent(22917, 18, "Illidan_OnSpawn")

function Illidan_OnEnterCombat(Unit,Event)
	Unit:StopMovement(1)
	Unit:SetCombatMeleeCapable(1)
	Unit:SendChatMessage(14, 0, "You are not prepared!")
	Unit:PlaySoundToSet(11466)
	Unit:RegisterEvent("Illidan_Phase1", 1000, 1)
	Unit:RegisterEvent("Illidan_EmoteDraw", 1000, 1)
	Unit:RegisterEvent("Illidan_StartAttack", 3000, 1)
	Unit:RegisterEvent("Illidan_CallMinion", 1000, 0)
end

function Illidan_EmoteDraw(Unit,Event)
	Unit:Emote(406)
end

function Illidan_StartAttack(Unit,Event)
	Unit:SetCombatMeleeCapable(0)
	Unit:Emote(0)
	Unit:SetUInt64Value(UnitField.Unit_FIELD_FLAGS,UnitFieldFlags.Unit_FLAG_UNKNOWN_1)
	Unit:StopMovement(0)
end

function Illidan_CallMinion(Unit,Event)
local X,Y,Z = Unit:GetX(),Unit:GetY(),Unit:GetZ()
local Akama = Unit:GetCreatureNearestCoords(X,Y,Z,22990)
	if(Unit:GetHealthPct() == 95) then
		Unit:RegisterEvent("Illidan_AkamaFlee", 5000, 1)
		Unit:RegisterEvent("Illidan_AkamaTargetCheck", 1000, 1)
		Unit:SendChatMessage(14, 0,"Come, my minions. Deal with this traitor as he deserves!")
		Unit:PlaySoundToSet(11465)
	end
end

function Illidan_AkamaTargetCheck(Unit,Event)
local X,Y,Z = Unit:GetX(),Unit:GetY(),Unit:GetZ()
local Akama = Unit:GetCreatureNearestCoords(X,Y,Z,22990)
local plr = Unit:GetClosestPlayer()
	Unit:WipeTargetList()
	Unit:SetNextTarget(plr)
end

function Illidan_AkamaFlee(Unit,Event)
local X,Y,Z = Unit:GetX(),Unit:GetY(),Unit:GetZ()
local Akama = Unit:GetCreatureNearestCoords(X,Y,Z,22990)
	Akama:SetCombatCapable(1)
	Akama:SetCombatMeleeCapable(1)
	Akama:SetCombatRangedCapable(1)
	Akama:SetCombatSpellCapable(1)
	Akama:SetCombatTargetingCapable(1)
	Akama:ClearThreatList()
	Akama:WipeThreatList()
	Akama:WipeTargetList()
	Akama:WipeCurrentTarget()
	Akama:SetFaction(35)
	Akama:SendChatMessage(14, 0,"I will deal with these mongrels! Strike now, friends! Strike at the Betrayer!")
	Akama:MoveTo(718.616, 305.473, 352.996, -0.860865)
	Unit:RegisterEvent("Illidan_AkamaFlee2", 6000, 1)
end

function Illidan_AkamaFlee2(Unit,Event)
local X,Y,Z = Unit:GetX(),Unit:GetY(),Unit:GetZ()
local Akama = Unit:GetCreatureNearestCoords(X,Y,Z,22990)
	Akama:MoveTo(673.927, 259.700, 352.996, -2.344210)
end

function Illidan_Phase1(Unit,Event)
	Unit:RegisterEvent("Illidan_Phase2", 1000, 0)
	Unit:RegisterEvent("Illidan_Shear", 15000, 0)
	Unit:RegisterEvent("Illidan_FlameCrash", 33000, 0)
	Unit:RegisterEvent("Illidan_ParasiticShadowfiend", 45000, 0)
	Unit:RegisterEvent("Illidan_DrawSoul", 37000, 0)
end

function Illidan_Shear(Unit,Event)
	Unit:FullCastSpellOnTarget(41032, Unit:GetMainTank())
	if(Unit:GetMainTank() == nil) then
		Unit:FullCastSpellOnTarget(41032, Unit:GetClosestPlayer())
	else
		return
	end
end

function Illidan_FlameCrash(Unit,Event)
local x,y,z,o = Unit:GetX(),Unit:GetY(),Unit:GetZ(),Unit:GetO()
	Unit:FullCastSpellOnTarget(40832, Unit:GetMainTank())
	if(Unit:GetMainTank() == nil) then
		Unit:FullCastSpellOnTarget(41032, Unit:GetClosestPlayer())
	else
		return
	end
end

function Illidan_ParasiticShadowfiend(Unit,Event)
	Unit:FullCastSpellOnTarget(41917,Unit:GetRandomPlayer(0))
	Unit:FullCastSpellOnTarget(41917,Unit:GetMainTank())
end

function Illidan_DrawSoul(Unit,Event)
	Unit:FullCastSpellOnTarget(40904, Unit:GetMainTank())
	if(Unit:GetMainTank() == nil) then
		Unit:FullCastSpellOnTarget(40904, Unit:GetRandomPlayer(2))
	else
		return
	end
end

function Illidan_Phase2(Unit,Event)
	if(Unit:GetHealthPct() <= 65) then
		Unit:RemoveEvents()
		local X,Y,Z,O = Unit:GetX(),Unit:GetY(),Unit:GetZ(),Unit:GetO()
--		Unit:SendChatMessage(14, 0,"I will not be touched by rabble such as you!")
		Unit:PlaySoundToSet(11479)
		Unit:EnableMoveFly(1)
		Unit:SetFlying()
		Unit:SetCombatMeleeCapable(1)
		Unit:SetUInt32Value(UnitField.Unit_FIELD_FLAGS,UnitFieldFlags.Unit_FLAG_NOT_SELECTABLE)
		Unit:SetUInt32Value(UnitField.Unit_FIELD_FLAGS,UnitFieldFlags.Unit_FLAG_NOT_ATTACKABLE_9)
		Unit:CastSpell(57764)
		Unit:RegisterEvent("Illidan_Phase2FlyToFront", 7000, 1)
	end
end

function Illidan_Phase2FlyToFront(Unit,Event)
	Unit:MoveTo(705.045, 305.233, 353.888, 3.129)
	Unit:RegisterEvent("Illidan_Phase2FaceMiddle", 1000, 1)
end

function Illidan_Phase2FaceMiddle(Unit,Event)
	Unit:SetFacing(0.674085)
	Unit:RegisterEvent("Illidan_Phase2Talk", 5000, 1)
end

function Illidan_Phase2Talk(Unit,Event)
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL,LangField.LANG_UNIVERSAL,"Behold the Flames of Azzinoth!")
	Unit:PlaySoundToSet(11480)
	Unit:CastSpellAoF(676.717346, 322.445251, 354.153320,39635)
	Unit:CastSpellAoF(677.368286, 285.374725, 354.242157,39849)
	Unit:RegisterEvent("Illidan_Phase2Patrol",1000, 1)
	Unit:RegisterEvent("Illidan_GlaiveSpawn", 1200, 1)
end

function Illidan_GlaiveSpawn(Unit,Event)
	Unit:SpawnCreature(229960, 676.717346, 322.445251, 354.153320, 5.732623,35,0)
	Unit:SpawnCreature(229960, 677.368286, 285.374725, 354.242157, 5.645614,35,0)
	Unit:SpawnCreature(229970, 672.039246, 326.748322, 354.206390, 0.207343,1825,0)
	Unit:SpawnCreature(229970, 673.008667, 283.813660, 354.267548, 6.203853,1825,0)
end

function Illidan_Phase2Patrol(Unit,Event)
	Unit:CastSpell(57764)
	Unit:RegisterEvent("Illidan_Phase2Patrol2",45000, 0)
	Unit:RegisterEvent("Illidan_Phase2Spells",1000, 1)
end

function Illidan_Phase2Patrol2(Unit,Event)
local Choice = math.random(1,3)
	if(Choice == 1) then
		Unit:MoveTo(718.616, 305.474, 352.996, 3.140)
	elseif(Choice == 2) then
		Unit:MoveTo(685.491, 344.018, 353.148, 4.512)
	elseif(Choice == 3) then
		Unit:MoveTo(673.927, 259.700, 352.996, 1.484)
	end
end

function Illidan_Phase2Spells(Unit,Event)
	Unit:RegisterEvent("Illidan_Fireball", 5500, 0)
	Unit:RegisterEvent("Illidan_DarkBarrage", 120000, 0)
	Unit:RegisterEvent("Illidan_EyeBeam", 74000, 0)
	Unit:RegisterEvent("Illidan_Phase3", 1000, 1)
end

function Illidan_Fireball(Unit,Event)
local plr = Unit:GetRandomPlayer(0)
	if(Unit:GetRandomPlayer(0) == nil) then
		return
	else
		Unit:CancelSpell()
		Unit:FullCastSpellOnTarget(40598, Unit:GetRandomPlayer(0))
	end
end

function Illidan_DarkBarrage(Unit,Event)
	if(Unit:GetRandomPlayer(0) == nil) then
		return
	else
		Unit:CancelSpell()
		Unit:FullCastSpellOnTarget(40585, Unit:GetRandomPlayer(0))
	end
end

function Illidan_EyeBeam(Unit,Event)
local Trigger = Unit:SpawnCreature(230691, 642.240601, 297.297180, 353.423401, 6, 35, 0)
	Unit:CancelSpell()
	Unit:RemoveEvents()
	Unit:SendChatMessage(14, 0, "Stare into the eyes of the Betrayer!")
	Unit:PlaySoundToSet(11481)
	Unit:SetUInt32Value(UnitField.Unit_FIELD_CHANNEL_OBJECT, Trigger:GetGUID())
	Unit:SetUInt32Value(UnitField.Unit_CHANNEL_SPELL, 39908)
	Unit:FullCastSpellOnTarget(39908, Trigger)
	Unit:RegisterEvent("Illidan_Phase2Spells", 30000, 1)
	Unit:RegisterEvent("Illidan_StopChannel", 26000, 1)
end

function Illidan_StopChannel(Unit,Event)
	Unit:SetUInt32Value(UnitField.Unit_CHANNEL_SPELL,0)
end

function EyeBeam_OnSpawn(Unit,Event)
	local Choice = math.random(1,3)
	if(Choice == 1) then
		Unit:RegisterEvent("EyeBeam_EyeBeamMove2", 3000, 1)
	elseif(Choice == 2) then
		Unit:RegisterEvent("EyeBeam_EyeBeamMove5", 3000, 1)
	elseif(Choice == 3) then
		Unit:RegisterEvent("EyeBeam_EyeBeamMove7", 3000, 1)
	end
end

function EyeBeam_EyeBeamMove2(Unit,Event)
	Unit:MoveTo(641.197449, 314.330963, 353.300262,6)
	Unit:RegisterEvent("EyeBeam_EyeBeamMove3", 3000, 1)
end

function EyeBeam_EyeBeamMove3(Unit,Event)
	Unit:MoveTo(657.239807, 256.925568, 352.996094,6)
	Unit:RegisterEvent("EyeBeam_EyeBeamMove4", 3000, 1)
end

function EyeBeam_EyeBeamMove4(Unit,Event)
	Unit:MoveTo(657.913330, 353.562775, 352.996185,6)
end

function EyeBeam_EyeBeamMove5(Unit,Event)
	Unit:MoveTo(707.019043, 270.441772, 352.996063,6)
	Unit:RegisterEvent("EyeBeam_EyeBeamMove6", 3000, 1)
end

function EyeBeam_EyeBeamMove6(Unit,Event)
	Unit:MoveTo(706.592407, 343.425568, 352.996124,6)
end

function EyeBeam_EyeBeamMove7(Unit,Event)
	Unit:MoveTo(706.593262, 310.011475, 353.693848,6)
	Unit:RegisterEvent("EyeBeam_Move8", 3000, 1)
end

function EyeBeam_Move8(Unit,Event)
	Unit:MoveTo(706.751343, 298.312683, 353.653809,6)
	Unit:RegisterEvent("EyeBeam_Move9", 3000, 1)
end

function EyeBeam_Move9(Unit,Event)
	Unit:MoveTo(642.240601, 297.297180, 353.423401,6)
	Unit:Despawn(4000,0)
end

RegisterUnitEvent(230691, 18, "EyeBeam_OnSpawn")

function Illidan_Phase3(Unit,Event)
local Elem1 = Unit:GetCreatureNearestCoords(703.582, 290.075, 352.996, 229970)
local Elem2 = Unit:GetCreatureNearestCoords(672.000, 327.000, 354.000, 229970)
	if((Elem1:IsAlive() == false) and (Elem2:IsAlive() == false)) then
		Unit:RemoveEvents()
		Unit:MoveTo(676.248, 262.114, 352.996, 6)
		Unit:RegisterEvent("Illidan_Phase3GlaiveTake", 3000, 1)
	end
end

function Illidan_Phase3GlaiveTake(Unit,Event)
local Blade1 = Unit:GetCreatureNearestCoords(676.717346, 322.445251, 354.153320,229960)
local Blade2 = Unit:GetCreatureNearestCoords(677.368286, 285.374725, 354.242157,229960)
	Unit:MoveTo(676.248, 262.114, 352.996, 6)
	Unit:StopMovement(1)
	Unit:SetCombatMeleeCapable(1)
	Blade1:Despawn(1000,0)
	Blade2:Despawn(1000,0)
	Unit:CastSpell(39873)
	Unit:RegisterEvent("Illidan_Phase3Spells", 1000, 0)
end

function Illidan_Phase3Spells(Unit,Event)
local Elem1 = Unit:GetCreatureNearestCoords(703.582, 290.075, 352.996, 229970)
local Elem2 = Unit:GetCreatureNearestCoords(672.000, 327.000, 354.000, 229970)
	if((Elem1:IsAlive() == false) and (Elem2:IsAlive() == false)) then
		Unit:Land()
		Unit:StopMovement(1)
		Unit:SetCombatMeleeCapable(1)
		Unit:RegisterEvent("Illidan_StartCombat", 2000, 1)
		Unit:RegisterEvent("Illidan_Shear", 15000, 0)
		Unit:RegisterEvent("Illidan_FlameCrash", 30000, 0)
		Unit:RegisterEvent("Illidan_ParasiticShadowfiend", 000, 0)
		Unit:RegisterEvent("Illidan_DrawSoul", 33000, 0)
		Unit:RegisterEvent("Illidan_AgonizingFlames", 70000, 0)
		Unit:RegisterEvent("Illidan_Phase4", 30000, 1)
		Unit:RegisterEvent("Illidan_Phase5", 1000, 1)
	else
		Unit:RegisterEvent("Illidan_Phase3Spells", 1000, 1)
	end
end

function Illidan_StartCombat(Unit,Event)
	Unit:StopMovement(0)
	Unit:SetCombatMeleeCapable(0)
end

function Illidan_Phase4(Unit,Event)
	Unit:RemoveEvents()
	Unit:SetUInt32Value(UnitField.Unit_FIELD_FLAGS,UnitFieldFlags.Unit_FLAG_NOT_SELECTABLE)
	Unit:StopMovement(1)
	Unit:SetCombatMeleeCapable(1)
	Unit:RegisterEvent("Illidan_Emotes", 000, 1)
	Unit:SendChatMessage(14, 0,"Behold the power... of the demon within!")
	Unit:PlaySoundToSet(11475)
	Unit:RegisterEvent("Illidan_Deform", 60000, 1)
end

function Illidan_Emotes(Unit,Event)
--	Unit:Emote(403)
	Unit:RegisterEvent("Illidan_Emote2", 1200, 1)
end

function Illidan_Emote2(Unit,Event)
--	Unit:Emote(404)
	Unit:RegisterEvent("Illidan_Turn", 2000, 1)
end

function Illidan_Turn(Unit,Event)
--	Unit:Emote(405)
	Unit:CastSpell(40506)
end

function Illidan_Deform(Unit,Event)
	Unit:RemoveEvents()
--	Unit:Emote(403) 
	Unit:RegisterEvent("Illidan_DeformMid1", 2000, 1)
end

function Illidan_DeformMid1(Unit,Event)
--	Unit:Emote(404)
	Unit:RegisterEvent("Illidan_Phase3Spells", 4500, 1)
	Unit:RegisterEvent("Illidan_DeformCheck", 1200, 1)
end

function Illidan_DeformCheck(Unit,Event)
	Unit:RemoveAura(40506)
	Unit:SetModel(21135)
	Unit:StopMovement(0)
	Unit:SetCombatMeleeCapable(0)
--	Unit:Emote(405)
--	Unit:Emote(0)
end

function Illidan_Phase5(Unit,Event)
	if(Unit:GetHealthPct() <= 30) then
		Unit:RemoveEvents()
		Unit:CastSpell(40647)
		Unit:StopMovement(1)
		Unit:SetCombatMeleeCapable(1)
		Unit:SendChatMessage(14, 0,"Is this it, mortals? Is this all the fury you can muster?")
		Unit:PlaySoundToSet(11476)
--		Unit:Emote(6)
		Unit:RegisterEvent("Illidan_SpawnMaiev", 8000, 1)
		Unit:RegisterEvent("Illidan_MaievTalk1", 15000, 1)
		if(Unit:GetModel() == 21322) then
			Unit:SetModel(21135)
			Unit:StopMovement(0)
		end
	end
end

function Illidan_SpawnMaiev(Unit,Event)
local X,Y,Z = Unit:GetX(),Unit:GetY(),Unit:GetZ()
local O = Unit:GetO()
local Maiev = Unit:SpawnCreature(231970, X,Y,Z+.5, 2.177125, 35, 0)
--	Unit:Emote(0)
	if(Maiev:IsInWorld() == 1) then
		Unit:MoveTo(X,Y,Z, O-2.177)
		Unit:SetNextTarget(Maiev)
	else
		if(Maiev:IsInWorld() == 1) then
			Unit:MoveTo(X,Y,Z, O-2.177)
			Unit:SetNextTarget(Maiev)
		end
	end
end

function Illidan_MaievTalk1(Unit,Event)
	Unit:SendChatMessage(14, 0, "Maiev... How is it even possible?")
	Unit:PlaySoundToSet(11477)
	Unit:RegisterEvent("Illidan_MaievAttack", 7000, 1)
end

function Illidan_MaievAttack(Unit,Event)
local X,Y,Z,O = Unit:GetX(),Unit:GetY(),Unit:GetZ(),Unit:GetO()
local Maiev = Unit:GetCreatureNearestCoords(X,Y,Z,O, 231970)
	Unit:RegisterEvent("Illidan_Speak2Maiev", 35000, 0)
	Unit:RegisterEvent("Illidan_OnCloseToDie", 35000, 0)
	Unit:SetNextTarget(Maiev)
	if(Unit:GetNextTarget() == Maiev) then
		Unit:StopMovement(0)
		Unit:SetCombatMeleeCapable(0)
	else
		Unit:SetNextTarget(Maiev)
		Unit:StopMovement(0)
		Unit:SetCombatMeleeCapable(0)
	end
end

function Illidan_Speak2Maiev(Unit,Event)
	Unit:SendChatMessage(14, 0, "Feel the hatred of ten thousand years!")
	Unit:PlaySoundToSet(11470)
end

function Illidan_OnCloseToDie(Unit,Event)
	if(Unit:GetHealthPct() == 1) then
		Unit:RemoveEvents()
		Unit:StopMovement(1)
--		Unit:Emote(EMOTE_ONESHOT_CUSTOMSPELL06)
		Unit:SetUInt32Value(UnitField.Unit_FIELD_FLAGS,UnitFieldFlags.Unit_FLAG_NOT_SELECTABLE+UnitFieldFlags.Unit_FLAG_NOT_ATTACKABLE_9)
		Unit:SetCombatMeleeCapable(1)
	end
end

function Illidan_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

function Illidan_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
	if(Unit:IsFlying() == true) then
		Unit:Land()
	end
end

function Illidan_OnKill(Unit,Event)
local Choice = math.random(1,2)
	if(Choice == 1) then
		Unit:SendChatMessage(14, 0,"Who shall be next to taste my blades?!")
		Unit:PlaySoundToSet(11473)
	elseif(Choice == 2) then
		Unit:SendChatMessage(14, 0,"This is too easy!")
		Unit:PlaySoundToSet(11472)
	end
end

RegisterUnitEvent(229170, 1, "Illidan_OnEnterCombat")
RegisterUnitEvent(229170, 2, "Illidan_OnLeaveCombat")
RegisterUnitEvent(229170, 3, "Illidan_OnKill")
RegisterUnitEvent(229170, 4, "Illidan_OnDied")