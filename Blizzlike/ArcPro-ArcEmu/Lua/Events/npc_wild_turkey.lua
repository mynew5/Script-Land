SPELL_TURKEY_TRACKER = 62014
ACHIEVEMENT_TURKINATOR = 3578
NPC_WILD_TURKEY = 32820

function OnDeath(pUnit, event, pKiller)
if(pKiller:IsPlayer())then
	local stack = pKiller:GetAuraStackCount(SPELL_TURKEY_TRACKER)
	pKiller:FullCastSpell(SPELL_TURKEY_TRACKER)
	if(stack == 9)then
		pUnit:SendChatMessageToPlayer(42, 0, "Turkey Hunter!", pKiller)
	elseif(stack == 19)then
		pUnit:SendChatMessageToPlayer(42, 0, "Turkey Domination!", pKiller)
	elseif(stack == 29)then
		pUnit:SendChatMessageToPlayer(42, 0, "Turkey Slaughter!", pKiller)
	elseif(stack == 39)then
		pUnit:SendChatMessageToPlayer(42, 0, "TURKEY TRIUMPH!", pKiller)
		if(pKiller:HasAchievement(ACHIEVEMENT_TURKINATOR) == false)then
			pKiller:AddAchievement(ACHIEVEMENT_TURKINATOR)
		end
	end
end
end

RegisterUnitEvent(NPC_WILD_TURKEY, 4, OnDeath)
