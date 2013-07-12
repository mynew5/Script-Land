local NPC_TOTEM = 26534
local NPC_GUIDE = 25324
local SPELL_FULL_MID_SET	= 58933
local SPELL_RIBBON_DANCE	= 29175 -- XP buff
local SPELL_DANCER_AURA		= 29531 -- Ribbon visual channel
local SPELL_RIBBON_POLE		= 29708 -- Summon pole bunny
local SPELL_RIBBON_FLAME	= 45422
local SPELL_DANCER_CHECK	= 45390
local SPELL_DANCER_VISUAL	= 45406 -- Character spinning
local GO_RIBBON_POLE		= 181605
local NPC_RIBBON_POLE_BUNNY	= 17066
local ACHIEVEMENT_RIBBON	= 271

function OnLoad(pUnit)
pUnit:SpawnCreature(NPC_GUIDE, pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), pUnit:GetO(),35,36000,0,0,0,1,0)
end

function Guide_OnLoad(pUnit)
pUnit:SetModel(23114)
end

RegisterUnitEvent(NPC_TOTEM,18,OnLoad)
RegisterUnitEvent(NPC_GUIDE,18,Guide_OnLoad)

function OnLoadPoleBunny(pUnit)
local pole = pUnit:GetGameObjectNearestCoords(pUnit:GetX(),pUnit:GetY(),pUnit:GetZ(),GO_RIBBON_POLE)
if(pole)then
	local x = pole:GetX()
	local y = pole:GetY()
	local z = pole:GetZ()
	pUnit:TeleportCreature(x,y,z+2)
	pUnit:RegisterEvent("CastVisual", 500, 1)
end
end

function CastVisual(pUnit)
pUnit:FullCastSpell(SPELL_RIBBON_FLAME)
end

function PoleOnLoad(pGO)
pGO:RegisterAIUpdateEvent(3000)
end

function AIUpdate(pGO)
if(pGO == nil)then
	pGO:RemoveAIUpdateEvent()
end
for k,v in pairs(pGO:GetInRangePlayers())do
	if(v:GetDistanceYards(pGO) < 20 and v:HasAura(SPELL_DANCER_VISUAL))then
		if(v:HasAura(SPELL_DANCER_VISUAL) and v:HasAura(SPELL_DANCER_AURA) == false)then
			v:ChannelSpell(SPELL_DANCER_AURA,pGO)
		end
		local aura = v:GetAuraObjectById(SPELL_RIBBON_DANCE)
		if(aura)then
			local lenght = aura:GetDuration()
			if(lenght < 3600000 - 180000)then
				aura:SetDuration(lenght + 180000)
			else
				aura:SetDuration(3600000)
				if(v:HasAura(SPELL_FULL_MID_SET) and not v:HasAchievement(ACHIEVEMENT_RIBBON))then
					v:AddAchievement(ACHIEVEMENT_RIBBON)
				end
			end
		else
			v:CastSpell(SPELL_RIBBON_DANCE)
		end
	else
		v:StopChannel()
		if(v:HasAura(SPELL_DANCER_CHECK))then
			v:RemoveAura(SPELL_DANCER_CHECK)
		end
		if(v:HasAura(SPELL_DANCER_VISUAL))then
			v:RemoveAura(SPELL_DANCER_VISUAL)
		end
		if(v:HasAura(SPELL_DANCER_AURA))then
			v:RemoveAura(SPELL_DANCER_AURA)
		end
	end
end
end

function OnUse(pGO, event, pPlayer)
if not(pPlayer:HasAura(SPELL_DANCER_VISUAL))then
	pPlayer:CastSpell(SPELL_DANCER_VISUAL)
	pPlayer:CastSpell(SPELL_RIBBON_POLE)
end
end

function OnZoneChange(event, pPlayer, ZoneId, OldZoneId)
pPlayer:StopChannel()
if(pPlayer:HasAura(SPELL_DANCER_CHECK))then
	pPlayer:RemoveAura(SPELL_DANCER_CHECK)
end
if(pPlayer:HasAura(SPELL_DANCER_VISUAL))then
	pPlayer:RemoveAura(SPELL_DANCER_VISUAL)
end
if(pPlayer:HasAura(SPELL_DANCER_AURA))then
	pPlayer:RemoveAura(SPELL_DANCER_AURA)
end
end

function OnLOgOut(event, pPlayer)
pPlayer:StopChannel()
if(pPlayer:HasAura(SPELL_DANCER_CHECK))then
	pPlayer:RemoveAura(SPELL_DANCER_CHECK)
end
if(pPlayer:HasAura(SPELL_DANCER_VISUAL))then
	pPlayer:RemoveAura(SPELL_DANCER_VISUAL)
end
if(pPlayer:HasAura(SPELL_DANCER_AURA))then
	pPlayer:RemoveAura(SPELL_DANCER_AURA)
end
end

RegisterGameObjectEvent(GO_RIBBON_POLE,1,PoleOnLoad)
RegisterGameObjectEvent(GO_RIBBON_POLE,4,OnUse)
RegisterUnitEvent(NPC_RIBBON_POLE_BUNNY,18,OnLoadPoleBunny)
RegisterGameObjectEvent(GO_RIBBON_POLE,5,AIUpdate)
RegisterServerHook(15,OnZoneChange)
RegisterServerHook(13,OnLOgOut)
