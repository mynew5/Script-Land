ZONE_DUROTHAR = 14
AREA_ECHOISLES = 368
QUEST_DA_PERFECT_SPIES = 25444
QUEST_FROGS_A = 25446
QUEST_PREP_FOR_BATTLE = 25495
QUEST_ZALAZANEFALL = 25445
SPELL_SEE_FROGS = 75434
SPELL_SEE_FROGG_SPIES = 74982 
SPELL_EIPHASE = 74092 -- adds phase 256

function AreaUpdate()
for k,v in pairs(GetPlayersInWorld())do
	if(v:GetAreaId() == AREA_ECHOISLES and (v:HasQuest(QUEST_PREP_FOR_BATTLE) or v:HasQuest(QUEST_ZALAZANEFALL)))then
		if(v:HasAura(SPELL_EIPHASE) == false)then
			v:CastSpell(SPELL_EIPHASE)
		end
	elseif(v:HasAura(SPELL_EIPHASE) and (v:HasQuest(QUEST_PREP_FOR_BATTLE) == false or v:HasQuest(QUEST_ZALAZANEFALL) == false))then
		if(v:HasAura(SPELL_EIPHASE) == true)then
			v:RemoveAura(SPELL_EIPHASE)
		end
	elseif(v:GetZoneId() == ZONE_DUROTHAR and v:HasQuest(QUEST_DA_PERFECT_SPIES))then
		if(v:HasAura(SPELL_SEE_FROGS) == false)then
			v:CastSpell(SPELL_SEE_FROGS)
		end
	elseif(v:HasAura(SPELL_SEE_FROGS) and not v:HasQuest(QUEST_DA_PERFECT_SPIES))then
		if(v:HasAura(SPELL_SEE_FROGS) == true)then
			v:RemoveAura(SPELL_SEE_FROGS)
		end
	elseif(v:GetAreaId() == AREA_ECHOISLES and v:HasQuest(QUEST_FROGS_A) and v:IsOnTaxi() == true)then
		if(v:HasAura(SPELL_SEE_FROGG_SPIES) == false)then
			v:CastSpell(SPELL_SEE_FROGG_SPIES)
		end
	elseif(not v:GetAreaId() == AREA_ECHOISLES or not v:HasQuest(QUEST_FROGS_A) or v:IsOnTaxi() == false)then
		if(v:HasAura(SPELL_SEE_FROGG_SPIES) == true)then
			v:RemoveAura(SPELL_SEE_FROGG_SPIES)
		end
	end
end
end

RegisterTimedEvent("AreaUpdate", 1500, 0)
