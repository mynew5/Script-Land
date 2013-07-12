local GO_ICESTONE1			= 188153 -- Hellfire
local GO_ICESTONE2			= 188154 -- Hellfire
local GO_ICESTONE3			= 188152 -- Hellfire
local GO_ICESTONE4			= 188151 -- Hellfire
local GO_ICESTONE5			= 188049 -- Ahen
local GO_ICESTONE6			= 188138 -- Ahen
local GO_ICESTONE7			= 188137 -- Ahen
local GO_ICESTONE8			= 188134 -- Desolace
local GO_ICESTONE9			= 188130 -- Desolace
local GO_ICESTONE10			= 188135 -- Desolace
local GO_ICESTONE11			= 188139 -- Stranglethorn
local GO_ICESTONE12			= 188144 -- Stranglethorn
local GO_ICESTONE13			= 188143 -- Stranglethorn
local GO_ICESTONE14			= 188145 -- Searing Gourge
local GO_ICESTONE15			= 188146 -- Searing Gourge
local GO_ICESTONE16			= 188147 -- Searing Gourge
local GO_ICESTONE17			= 188148 -- Silithus
local GO_ICESTONE18			= 188149 -- Silithus
local GO_ICESTONE19			= 188150 -- Silithus

local QUEST_HELLFIRE		= 11954
local QUEST_ASHENVALE		= 11917
local QUEST_DESOLACE		= 11947
local QUEST_STRANGLETHORN	= 11948
local QUEST_SGOURGE			= 11952
local QUEST_SILITHUS		= 11953

local NPC_GLACIAL_TEMPLAIR		= 26216 -- Hellfire
local NPC_FROSTWAVE_LIEWTENANT	= 26116 -- Ashenvale
local NPC_HAILSTONE_LIEWTENANT	= 26178 -- Desolace
local NPC_CHILLWIND_LIEWTENANT	= 26204 -- Stranglethorn
local NPC_FRIGID_LIEWTENANT		= 26214 -- Searing Gourge
local NPC_GLACIAL_LIEWTENANT	= 26215 -- Silithus

function OnUse(pGO, event, pPlayer)
local goentry = pGO:GetEntry()
if(goentry == GO_ICESTONE1 or goentry == GO_ICESTONE2 or goentry == GO_ICESTONE3 or goentry == GO_ICESTONE4)then
	if(pPlayer:HasQuest(QUEST_HELLFIRE))then
		pGO:SpawnCreature(NPC_GLACIAL_TEMPLAIR,pGO:GetX(),pGO:GetY(),pGO:GetZ(),pGO:GetO(),14,360000,0,0,0,1,0)
		pGO:Despawn(1,360000)
	end
elseif(goentry == GO_ICESTONE5 or goentry == GO_ICESTONE6 or goentry == GO_ICESTONE7)then
	if(pPlayer:HasQuest(QUEST_ASHENVALE))then
		pGO:SpawnCreature(NPC_FROSTWAVE_LIEWTENANT,pGO:GetX(),pGO:GetY(),pGO:GetZ(),pGO:GetO(),14,360000,0,0,0,1,0)
		pGO:Despawn(1,360000)
	end
elseif(goentry == GO_ICESTONE8 or goentry == GO_ICESTONE9 or goentry == GO_ICESTONE10)then
	if(pPlayer:HasQuest(QUEST_DESOLACE))then
		pGO:SpawnCreature(NPC_HAILSTONE_LIEWTENANT,pGO:GetX(),pGO:GetY(),pGO:GetZ(),pGO:GetO(),14,360000,0,0,0,1,0)
		pGO:Despawn(1,360000)
	end
elseif(goentry == GO_ICESTONE11 or goentry == GO_ICESTONE12 or goentry == GO_ICESTONE13)then
	if(pPlayer:HasQuest(QUEST_STRANGLETHORN))then
		pGO:SpawnCreature(NPC_CHILLWIND_LIEWTENANT,pGO:GetX(),pGO:GetY(),pGO:GetZ(),pGO:GetO(),14,360000,0,0,0,1,0)
		pGO:Despawn(1,360000)
	end
elseif(goentry == GO_ICESTONE14 or goentry == GO_ICESTONE15 or goentry == GO_ICESTONE16)then
	if(pPlayer:HasQuest(QUEST_SGOURGE))then
		pGO:SpawnCreature(NPC_FRIGID_LIEWTENANT,pGO:GetX(),pGO:GetY(),pGO:GetZ(),pGO:GetO(),14,360000,0,0,0,1,0)
		pGO:Despawn(1,360000)
	end
elseif(goentry == GO_ICESTONE17 or goentry == GO_ICESTONE18 or goentry == GO_ICESTONE19)then
	if(pPlayer:HasQuest(QUEST_SILITHUS))then
		pGO:SpawnCreature(NPC_GLACIAL_LIEWTENANT,pGO:GetX(),pGO:GetY(),pGO:GetZ(),pGO:GetO(),14,360000,0,0,0,1,0)
		pGO:Despawn(1,360000)
	end
end
end

RegisterGameObjectEvent(GO_ICESTONE1,4,OnUse)
RegisterGameObjectEvent(GO_ICESTONE2,4,OnUse)
RegisterGameObjectEvent(GO_ICESTONE3,4,OnUse)
RegisterGameObjectEvent(GO_ICESTONE4,4,OnUse)
RegisterGameObjectEvent(GO_ICESTONE5,4,OnUse)
RegisterGameObjectEvent(GO_ICESTONE6,4,OnUse)
RegisterGameObjectEvent(GO_ICESTONE7,4,OnUse)
RegisterGameObjectEvent(GO_ICESTONE8,4,OnUse)
RegisterGameObjectEvent(GO_ICESTONE9,4,OnUse)
RegisterGameObjectEvent(GO_ICESTONE10,4,OnUse)
RegisterGameObjectEvent(GO_ICESTONE11,4,OnUse)
RegisterGameObjectEvent(GO_ICESTONE12,4,OnUse)
RegisterGameObjectEvent(GO_ICESTONE13,4,OnUse)
RegisterGameObjectEvent(GO_ICESTONE14,4,OnUse)
RegisterGameObjectEvent(GO_ICESTONE15,4,OnUse)
RegisterGameObjectEvent(GO_ICESTONE16,4,OnUse)
RegisterGameObjectEvent(GO_ICESTONE17,4,OnUse)
RegisterGameObjectEvent(GO_ICESTONE18,4,OnUse)
RegisterGameObjectEvent(GO_ICESTONE19,4,OnUse)
