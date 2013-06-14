--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

local UNIT_FLAG_NOT_ATTACKABLE_1 = 320
local UNIT_FLAG_IS_ATTACKABLE_1 = 0
local UNIT_FLAG_NOT_SELECTABLE = 33554432

function Gormok_OnSpawn(pUnit, Event)
	pUnit:SetFaction(16)
	pUnit:SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1)
	pUnit:SetCombatCapable(1)
	pUnit:SetCombatMeleeCapable(1)
	pUnit:SetCombatRangedCapable(1)
	pUnit:SetCombatSpellCapable(1)
	pUnit:SetCombatTargetingCapable(1)
	pUnit:RegisterEvent("Gormok_Attack", 5000, 1)
end

RegisterUnitEvent(34796, 18, "Gormok_OnSpawn")
RegisterUnitEvent(54796, 18, "Gormok_OnSpawn")

function Gormok_Attack(pUnit, Event)
	pUnit:SetFaction(16)
	pUnit:SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_IS_ATTACKABLE_1)
	pUnit:SetCombatCapable(0)
	pUnit:SetCombatMeleeCapable(0)
	pUnit:SetCombatRangedCapable(0)
	pUnit:SetCombatSpellCapable(0)
	pUnit:SetCombatTargetingCapable(0)
	pUnit:ModifyWalkSpeed(8)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:MoveTo(pUnit:GetClosestPlayer():GetX(), pUnit:GetClosestPlayer():GetY(), pUnit:GetClosestPlayer():GetZ(), pUnit:GetClosestPlayer():GetO())
	end
end

function Gormok_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Gormok_RatFirst", 20000, 1)
	pUnit:RegisterEvent("Gormok_Fire", 20000, 0)
	pUnit:RegisterEvent("Gormok_Stomp", 20100, 0)
	pUnit:RegisterEvent("Gormok_Impale", 10000, 0)
end

RegisterUnitEvent(34796, 1, "Gormok_OnCombat")
RegisterUnitEvent(54796, 1, "Gormok_OnCombat")

function Gormok_RatFirst(pUnit, Event)
	local randomplr = pUnit:GetRandomPlayer(0)
	if(randomplr ~= nil) then
		pUnit:SpawnCreature(34800, randomplr:GetX(), randomplr:GetY(), randomplr:GetZ(), randomplr:GetO(), 16, 0) --spawn snobold
	    pUnit:RegisterEvent("Gormok_RatSecond", 30000, 1)
	end
end

function Gormok_RatSecond(pUnit, Event)
	local randomplr = pUnit:GetRandomPlayer(0)
	if(randomplr ~= nil) then
		pUnit:SpawnCreature(34800, randomplr:GetX(), randomplr:GetY(), randomplr:GetZ(), randomplr:GetO(), 16, 0) --spawn snobold
	    pUnit:RegisterEvent("Gormok_RatThird", 30000, 1)
	end
end

function Gormok_RatThird(pUnit, Event)
	local randomplr = pUnit:GetRandomPlayer(0)
	if(randomplr ~= nil) then
		pUnit:SpawnCreature(34800, randomplr:GetX(), randomplr:GetY(), randomplr:GetZ(), randomplr:GetO(), 16, 0) --spawn snobold
	    pUnit:RegisterEvent("Gormok_RatFourth", 30000, 1)
	end
end

function Gormok_RatFourth(pUnit, Event)
	local randomplr = pUnit:GetRandomPlayer(0)
	if(randomplr ~= nil) then
		pUnit:SpawnCreature(34800, randomplr:GetX(), randomplr:GetY(), randomplr:GetZ(), randomplr:GetO(), 16, 0) --spawn snobold
	    pUnit:RegisterEvent("Gormok_RatFifth", 30000, 1)
	end
end

function Gormok_RatFifth(pUnit, Event)
	local randomplr = pUnit:GetRandomPlayer(0)
	if(randomplr ~= nil) then
		pUnit:SpawnCreature(34800, randomplr:GetX(), randomplr:GetY(), randomplr:GetZ(), randomplr:GetO(), 16, 0) --spawn snobold
	end
end

function Gormok_Fire(pUnit, Event)
	local randomplr = pUnit:GetRandomPlayer(0)
	if(randomplr ~= nil) then
		pUnit:SpawnCreature(34801, randomplr:GetX(), randomplr:GetY(), randomplr:GetZ(), randomplr:GetO(), 16, 60000) --spawn fire visual trigger
	end
end

function FireVisual_OnSpawn(pUnit, Event)
	pUnit:SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE+UNIT_FLAG_NOT_ATTACKABLE_1)
	pUnit:RegisterEvent("FireVisual_FireNova", 1000, 0)
	pUnit:SpawnGameObject(34801, pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), pUnit:GetO(), 60000)
	pUnit:Root()
end

function FireVisual_FireNova(pUnit, Event)
	pUnit:CastSpell(37371, pUnit:GetRandomPlayer(0))
end

RegisterUnitEvent(34801, 18, "FireVisual_OnSpawn")

function Gormok_Stomp(pUnit, Event)
	if(pUnit:GetRandomPlayer(0) ~= nil) then
		pUnit:FullCastSpell(66330, pUnit:GetRandomPlayer(0))
	end
end

function Gormok_Impale(pUnit, Event)
	if(pUnit:GetMainTank() ~= nil) then
		pUnit:CastSpellOnTarget(66331, pUnit:GetMainTank())
	end
end

function Gormok_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
	pUnit:SpawnCreature(34816, 554.412, 94.4594, 396.096, 5.49938, 35, 0)
	pUnit:Despawn(1, 0)
end

function Gormok_OnAllianceDeath(pUnit, Event)
	pUnit:RemoveEvents()
	pUnit:SpawnCreature(34799, 563.657, 167.491, 394.332, 4.703654, 16, 0)
	pUnit:SpawnCreature(360952, 563, 78, 419, 4.4070, 35, 0)
	pUnit:Despawn(1, 0)
end

function Gormok_OnHordeDeath(pUnit, Event)
	pUnit:RemoveEvents()
	pUnit:SpawnCreature(54799, 563.657, 167.491, 394.332, 4.703654, 16, 0)
	pUnit:SpawnCreature(360952, 563, 78, 419, 4.4070, 35, 0)
	pUnit:Despawn(1, 0)
end

RegisterUnitEvent(34796, 4, "Gormok_OnAllianceDeath")
RegisterUnitEvent(54796, 4, "Gormok_OnHordeDeath")
RegisterUnitEvent(34796, 2, "Gormok_OnLeaveCombat")
RegisterUnitEvent(54796, 2, "Gormok_OnLeaveCombat")