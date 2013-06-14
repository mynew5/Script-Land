--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BrantX; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function GrandMagusTelestra_OnEnterCombat(Unit,Event)
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL,LangField.LANG_UNIVERSAL,"You know what they say about curiosity.")
	Unit:RegisterEvent("GrandMagusTelestra_IceNova", 14000, 0)
	Unit:RegisterEvent("GrandMagusTelestra_GravityWell", 22000, 0)
	Unit:RegisterEvent("GrandMagusTelestra_Phase2Move", 1000, 1)
end

function GrandMagusTelestra_Phase2Move(Unit,Event)
	if(Unit:GetHealthPct() <= 50) then
		Unit:RemoveEvents()
		Unit:MoveTo(504.922577, 89.081749, -16.124632, -6)
		Unit:SetCombatMeleeCapable(1)
		Unit:SetCombatSpellCapable(1)
		Unit:RegisterEvent("GrandMagusTelestra_Phase2Start", 3000, 1)
	end
end

function GrandMagusTelestra_Phase2Start(Unit,Event)
	if(Unit:GetHealthPct() <= 49) then
		Unit:RemoveEvents()
		Unit:CancelSpell()
	local Choice = math.random(1,2)
	if(Choice == 1) then
		Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "There's plenty of me to go around.")
	elseif(Choice == 2) then
		Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "I'll give you more than you can handle.")
	end
		Unit:SetCombatMeleeCapable(1)
		Unit:SetCombatSpellCapable(1)
		Unit:CastSpell(10032)
		Unit:SpawnCreature(26928, Unit:GetX(), Unit:GetY(), Unit:GetZ(), 6, 16, 0)
		Unit:SpawnCreature(26929, Unit:GetX(), Unit:GetY(), Unit:GetZ(), 6, 16, 0)
		Unit:SpawnCreature(26930, Unit:GetX(), Unit:GetY(), Unit:GetZ(), 6, 16, 0)
		Unit:RegisterEvent("GrandMagusTelestra_Merge", 1000, 1)
	end
end

function GrandMagusTelestra_Merge(Unit,Event)
		local Flame = Unit:GetCreatureNearestCoords(Unit:GetX(), Unit:GetY(), Unit:GetZ(), 26928)
		local Arcane = Unit:GetCreatureNearestCoords(Unit:GetX(), Unit:GetY(), Unit:GetZ(), 26929)
		local Frost = Unit:GetCreatureNearestCoords(Unit:GetX(), Unit:GetY(), Unit:GetZ(), 26930)
	if((Flame:IsDead() == 1) and (Arcane:IsDead() == 1) and (Frost:IsDead() == 1)) then 
		Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Now to finish the job!")
		Unit:SetCombatMeleeCapable(0)
		Unit:SetCombatSpellCapable(0)
	else
		Unit:RegisterEvent("GrandMagusTelestra_Merge", 1000, 0)
	end
end

function GrandMagusTelestra_IceNova(Unit,Event)
	Unit:FullCastSpell(47772)
	Unit:MoveTo(495.507, 89.091263, Unit:GetZ(), Unit:GetO())
	Unit:RegisterEvent("GrandMagusTelestra_Firebomb", 3000, 0)
end

function GrandMagusTelestra_Firebomb(Unit,Event)
	if(Unit:GetMainTank() == nil) then
		Unit:FullCastSpellOnTarget(47773, Unit:GetMainTank())
	elseif(Unit:GetClosestPlayer() == nil) then
		Unit:FullCastSpellOnTarget(47773, Unit:GetClosestPlayer())
		return
	end
end

function GrandMagusTelestra_GravityWell(Unit,Event)
	if((Unit:GetClosestPlayer() == nil) and (Unit:GetMainTank() == nil)) then
		return
		else
		Unit:RemoveEvents()
		Unit:SetCombatMeleeCapable(1)
		Unit:CastSpell(47756)
		Unit:RegisterEvent("GrandMagusTelestra_ReCast", 6000, 1)
		Unit:RegisterEvent("GrandMagusTelestra_KnockRepeat", 000, 0)
	end
end

function GrandMagusTelestra_KnockRepeat(Unit,Event)
	Unit:Knockback()
end

function GrandMagusTelestra_ReCast(Unit,Event)
	Unit:SetCombatMeleeCapable(0)
	Unit:RegisterEvent("GrandMagusTelestra_IceNova", 14000, 0)
	Unit:RegisterEvent("GrandMagusTelestra_GravityWell", 22000, 0)
	Unit:RegisterEvent("GrandMagusTelestra_Phase2Move", 1000, 1)
end

function GrandMagusTelestra_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function GrandMagusTelestra_OnKill(Unit,Event)
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Death becomes you!")
	Unit:RemoveEvents()
end

function GrandMagusTelestra_OnDied(Unit,Event)
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "Damn the... luck. ")
	Unit:RemoveEvents()
end

function GrandMagusTelestraFLAME_OnSpawn(Unit,Event)
	Unit:CastSpell(47705)
end

function GrandMagusTelestraARCANE_OnSpawn(Unit,Event)
	Unit:CastSpell(47704)
end

function GrandMagusTelestraFROST_OnSpawn(Unit,Event)
	Unit:CastSpell(47706)
end

RegisterUnitEvent(26731, 1, "GrandMagusTelestra_OnEnterCombat")
RegisterUnitEvent(26731, 2, "GrandMagusTelestra_OnLeaveCombat")
RegisterUnitEvent(26731, 3, "GrandMagusTelestra_OnKill")
RegisterUnitEvent(26731, 4, "GrandMagusTelestra_OnDied")
RegisterUnitEvent(26928, 18, "GrandMagusTelestraFLAME_OnSpawn")
RegisterUnitEvent(26929, 18, "GrandMagusTelestraARCANE_OnSpawn")
RegisterUnitEvent(26930, 18, "GrandMagusTelestraFROST_OnSpawn")