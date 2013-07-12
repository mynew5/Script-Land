BOSS_OMEN = 15467
NPC_LIGHT = 15902
NPC_MINION_OF_OMEN = 15466
SPELL_CLEAVE = 15284
SPELL_STARFALL = 26540
SPELL_SUMMON_SPOTLIGHT = 26392
SPELL_ELUNE_BLESSING = 26393
SPELL_ELUNE_BLESSING_CREDIT = 26394
GO_ELUNE_TRAP_1 = 180876
GO_ELUNE_TRAP_2 = 180877
ZONE_MOONGLADE = 493
QUEST_ELUNE_BLESSING = 8868

UNIT_FLAG_NOT_SELECTABLE = 33554432

local self = getfenv(1)

function OnLoad(pUnit)
if(pUnit:GetZoneId() == ZONE_MOONGLADE)then
	pUnit:SetMovementFlags(1)
	pUnit:MoveTo(7549.977, -2855.137, 456.9678, pUnit:GetO())
end
end

function OnCombat(pUnit, event)
self[tostring(pUnit)] = {
cleave = math.random(3,5),
starfall = math.random(8,10)
}
pUnit:RegisterAIUpdateEvent(1000)
end

function AIUpdate(pUnit)
if(pUnit == nil)then
	pUnit:RemoveAIUpdateEvent()
end
if(pUnit:IsCasting() ) then return end
	if(pUnit:GetNextTarget() == nil)then
		pUnit:WipeThreatList()
		return
	end
local vars = self[tostring(pUnit)]
vars.cleave = vars.cleave - 1
vars.starfall = vars.starfall - 1
if(vars.cleave <= 0)then
	local tank = pUnit:GetMainTank()
	if(tank ~= nil and pUnit:GetDistanceYards(tank) < 7)then
		pUnit:FullCastSpellOnTarget(SPELL_CLEAVE, tank)
	end
	vars.cleave = math.random(3,5)
elseif(vars.starfall <= 0)then
	local target = pUnit:GetRandomPlayer(0)
	if(target ~= nil)then
		TX = target:GetX()
		TY = target:GetY()
		TZ = target:GetZ()
		pUnit:CastSpellAoF(TX, TY, TZ, SPELL_STARFALL)
	end
	vars.starfall = math.random(8,10)
end
end

function OnLeaveCombat(pUnit, event)
pUnit:RemoveEvents()
pUnit:RemoveAIUpdateEvent()
end

function OnDeath(pUnit, event)
pUnit:CastSpell(SPELL_SUMMON_SPOTLIGHT)
pUnit:RemoveEvents()
pUnit:RemoveAIUpdateEvent()
pUnit:Despawn(300,0)
end

function LightOnLoad(pUnit)
pUnit:SetUInt32Value(59, UNIT_FLAG_NOT_SELECTABLE)
pUnit:RegisterAIUpdateEvent(1000)
end

function LightUpdate(pUnit)
if(pUnit == nil)then
	pUnit:RemoveAIUpdateEvent()
end
for k,v in pairs(pUnit:GetInRangePlayers())do
	if(pUnit:GetDistanceYards(v) < 6)then
		if(v:HasQuest(QUEST_ELUNE_BLESSING) and v:GetQuestObjectiveCompletion(QUEST_ELUNE_BLESSING, 0) == 0)then
			v:CastSpell(SPELL_ELUNE_BLESSING_CREDIT)
		end
		if(v:HasAura(SPELL_ELUNE_BLESSING) == false)then
			v:AddAura(SPELL_ELUNE_BLESSING, 3600000)
		end
	end
end
end

function MinionOnDeath(pUnit, event)
pUnit:RemoveEvents()
pUnit:Despawn(10,0)
end

RegisterUnitEvent(BOSS_OMEN,1,OnCombat)
RegisterUnitEvent(BOSS_OMEN,2,OnLeaveCombat)
RegisterUnitEvent(BOSS_OMEN,4,OnDeath)
RegisterUnitEvent(BOSS_OMEN,18,OnLoad)
RegisterUnitEvent(BOSS_OMEN,21,AIUpdate)
RegisterUnitEvent(NPC_LIGHT,18,LightOnLoad)
RegisterUnitEvent(NPC_LIGHT,21,LightUpdate)
RegisterUnitEvent(NPC_MINION_OF_OMEN,4,MinionOnDeath)
