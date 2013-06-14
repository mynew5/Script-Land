SPELL_HONOR_THE_DEAD = 65386
NPC_CATRINA = 34383
ACHIEVEMRNT_DEAD_MANS_PARTY = 3456

function OnEmote(event, pPlayer, pUnit, EmoteId)
if(EmoteId == 10)then
	local catrina = pPlayer:GetSelection()
	if(catrina ~= nil and catrina:IsCreature())then
		if(catrina:GetEntry() == NPC_CATRINA)then
			if(pPlayer:HasAura(SPELL_HONOR_THE_DEAD) == false and not pPlayer:IsDead())then
				catrina:CastSpellOnTarget(SPELL_HONOR_THE_DEAD, pPlayer)
			end
			if(pPlayer:HasAchievement(ACHIEVEMRNT_DEAD_MANS_PARTY) == false)then
				pPlayer:AddAchievement(ACHIEVEMRNT_DEAD_MANS_PARTY)
			end
		end
	end
end
end

RegisterServerHook(8, OnEmote)
