local ZONE_ST = 1519
local ZONE_OG = 1637
local ZONE_UNGORO = 490
local AREA_HOT_SPRINGS = 543
local SPELL_HIDE_EGG = 61820
local SPELL_LAY_EGG = 61718
local SPELL_LAY_EGG_TRIGGER = 61719
local SPELL_TURN_INTO_RABIT = 61734
local ACHIEVEMENT_HIDE_EGG_H = 2420
local ACHIEVEMENT_HIDE_EGG_A = 2421
local ACHIEVEMENT_BRIDE = 2576
local ACHIEVEMENT_HARD_BOILED = 2416
local AURA_SPRING_T = 62181
local AURA_SPRING_D = 61980
local GO_EGG_1 = 113768
local GO_EGG_2 = 113769
local GO_EGG_3 = 113770
local GO_EGG_4 = 113771
local GO_EGG_5 = 113772

function NoblegardenEgg(event, pPlayer, SpellId, pSpellObject)
if(SpellId == SPELL_HIDE_EGG and pPlayer:GetTeam() == 0 and pPlayer:GetAreaId() == ZONE_ST)then
	if not(pPlayer:HasAchievement(ACHIEVEMENT_HIDE_EGG_A))then
		pPlayer:AddAchievement(ACHIEVEMENT_HIDE_EGG_A)
	end
elseif(SpellId == SPELL_HIDE_EGG and pPlayer:GetTeam() == 1 and pPlayer:GetAreaId() == ZONE_OG)then
	if not(pPlayer:HasAchievement(ACHIEVEMENT_HIDE_EGG_H))then
		pPlayer:AddAchievement(ACHIEVEMENT_HIDE_EGG_H)
	end
end
if(SpellId == SPELL_LAY_EGG)then
	if not(pPlayer:HasAchievement(ACHIEVEMENT_HARD_BOILED))then
		pPlayer:AddAchievement(ACHIEVEMENT_HARD_BOILED)
	end
end
end

function OnEmote(event, pPlayer, pUnit, EmoteId)
if(EmoteId == 17)then
	local target  = pPlayer:GetSelection()
	if(target ~= nil and target:IsPlayer())then
		if(target:HasAura(AURA_SPRING_D) and pPlayer:HasAura(AURA_SPRING_T))then
			if not(pPlayer:HasAchievement(ACHIEVEMENT_BRIDE))then
				pPlayer:AddAchievement(ACHIEVEMENT_BRIDE)
			end
		end
	end
end
end

function LayEggs()
for k,v in pairs(GetPlayersInZone(ZONE_UNGORO))do
	if(v:HasAura(SPELL_TURN_INTO_RABIT) and v:GetAreaId() == AREA_HOT_SPRINGS and v:HasAura(SPELL_LAY_EGG_TRIGGER) == false)then
		v:CastSpell(SPELL_LAY_EGG_TRIGGER)
	elseif(v:GetAreaId() ~= AREA_HOT_SPRINGS and v:HasAura(SPELL_LAY_EGG_TRIGGER))then
		v:RemoveAura(SPELL_LAY_EGG_TRIGGER)
	end
end
end

function EggsOnUse(pGO, event, pPlayer)
local chance = math.random(1,100) -- not sure of the actual proc chance in retail. Set to 1%.
if(chance == 99)then
	pPlayer:CastSpell(SPELL_TURN_INTO_RABIT)
end
end

RegisterServerHook(8, OnEmote)
RegisterTimedEvent("LayEggs", 1000, 0)
RegisterServerHook(10, "NoblegardenEgg")
RegisterGameObjectEvent(GO_EGG_1,4,EggsOnUse)
RegisterGameObjectEvent(GO_EGG_2,4,EggsOnUse)
RegisterGameObjectEvent(GO_EGG_3,4,EggsOnUse)
RegisterGameObjectEvent(GO_EGG_4,4,EggsOnUse)
RegisterGameObjectEvent(GO_EGG_5,4,EggsOnUse)