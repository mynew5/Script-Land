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

function Dread_OnSpawn(pUnit, Event)
	pUnit:SetFaction(16)
	pUnit:SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1)
	pUnit:SetCombatCapable(1)
	pUnit:SetCombatMeleeCapable(1)
	pUnit:SetCombatRangedCapable(1)
	pUnit:SetCombatSpellCapable(1)
	pUnit:SetCombatTargetingCapable(1)
	pUnit:RegisterEvent("Dread_Attack", 5000, 1)
end

RegisterUnitEvent(34799, 18, "Dread_OnSpawn")
RegisterUnitEvent(54799, 18, "Dread_OnSpawn")

function Dread_Attack(pUnit, Event)
	pUnit:SetFaction(16)
	pUnit:SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_IS_ATTACKABLE_1)
	pUnit:SetCombatCapable(0)
	pUnit:SetCombatMeleeCapable(0)
	pUnit:SetCombatRangedCapable(0)
	pUnit:SetCombatSpellCapable(0)
	pUnit:SetCombatTargetingCapable(0)
	pUnit:SpawnCreature(35144, 546.329, 167.369, 394.667, 5.046088, 16, 0)
	pUnit:ModifyWalkSpeed(8)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:MoveTo(pUnit:GetClosestPlayer():GetX(), pUnit:GetClosestPlayer():GetY(), pUnit:GetClosestPlayer():GetZ(), pUnit:GetClosestPlayer():GetO())
	end
end

function Dread_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Dread_PoisonCloud", 10000, 0)
	pUnit:RegisterEvent("Dread_MoltenSpew", 22000, 0)
	pUnit:RegisterEvent("Dread_BurningBite", 30000, 0)
	pUnit:RegisterEvent("Dread_SwitchToStationary", 70000, 1)
end

RegisterUnitEvent(34799, 1, "Dread_OnCombat")
RegisterUnitEvent(54799, 1, "Dread_OnCombat")

function Dread_SwitchToStationary(pUnit, Event)
	pUnit:Root()
	pUnit:RemoveEvents()
	pUnit:SetModel(26935)
	pUnit:Root()
	pUnit:RegisterEvent("Dread_FireSpit", 1500, 0)
	pUnit:RegisterEvent("Dread_BurningSpray", 30000, 0)
	pUnit:RegisterEvent("Dread_Sweep", 28000, 0)
	pUnit:RegisterEvent("Dread_SwitchBackToMobile", 70000, 1)
end

function Dread_SwitchBackToMobile(pUnit, Event)
	pUnit:Unroot()
	pUnit:RemoveEvents()
	pUnit:SetModel(24564)
	pUnit:Unroot()
	pUnit:RegisterEvent("Dread_PoisonCloud", 10000, 0)
	pUnit:RegisterEvent("Dread_MoltenSpew", 22000, 0)
	pUnit:RegisterEvent("Dread_BurningBite", 30000, 0)
	pUnit:RegisterEvent("Dread_SwitchToStationary", 70000, 1)
end

function Dread_MoltenSpew(pUnit, Event)
	if(pUnit:GetMainTank() ~= nil) then
		pUnit:FullCastSpellOnTarget(66820, pUnit:GetMainTank())
	end
end

function Dread_BurningBite(pUnit, Event)
	if(pUnit:GetRandomPlayer(0) ~= nil) then
		pUnit:CastSpellOnTarget(66879, pUnit:GetRandomPlayer(0))
	end
end

function Dread_FireSpit(pUnit, Event)
	if(pUnit:GetMainTank() ~= nil) then
		pUnit:FullCastSpellOnTarget(66796, pUnit:GetMainTank())
	end
end

function Dread_BurningSpray(pUnit, Event)
	if(pUnit:GetRandomPlayer(0) ~= nil) then
		pUnit:FullCastSpellOnTarget(66902, pUnit:GetRandomPlayer(0))
	end
end

function Dread_Sweep(pUnit, Event)
	if(pUnit:GetMainTank() ~= nil) then
		pUnit:FullCastSpellOnTarget(66794, pUnit:GetMainTank())
	end
end

function Dread_PoisonCloud(pUnit, Event)
	pUnit:SpawnCreature(34802, pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), pUnit:GetO(), 16, 30000)
end

function PoisonCloud_OnSpawn(pUnit, Event)
	pUnit:SetCombatCapable(1)
	pUnit:SetCombatMeleeCapable(1)
	pUnit:SetCombatRangedCapable(1)
	pUnit:SetCombatTargetingCapable(1)
	pUnit:SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
	pUnit:RegisterEvent("PoisonCloud_PoisonNova", 1000, 0)
	pUnit:Root()
end

function PoisonCloud_PoisonNova(pUnit, Event)
	pUnit:CastSpell(59842, pUnit:GetRandomPlayer(0))
end

function PoisonCloud_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
	pUnit:Despawn(1, 0)
end

function PoisonCloud_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
	pUnit:Despawn(1, 0)
end

RegisterUnitEvent(34802, 18, "PoisonCloud_OnSpawn")
RegisterUnitEvent(34802, 2, "PoisonCloud_OnLeaveCombat")
RegisterUnitEvent(34802, 4, "PoisonCloud_OnDeath")

function Dread_OnAllianceDeath(pUnit, Event)
	local Acid = pUnit:GetCreatureNearestCoords(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), 35144)
		if((Acid ~= nil) and (Acid:IsAlive() == false)) then
			Acid:Despawn(1, 0)
			pUnit:SpawnCreature(360953, 563, 78, 419, 4.4070, 35, 0)
			pUnit:SpawnCreature(34797, 563, 173, 394.339, 4.740840, 16, 0)
			pUnit:Despawn(1, 0)
		end
	pUnit:RemoveEvents()
end

function Dread_OnAllianceLeaveCombat(pUnit, Event)
	local Acid = pUnit:GetCreatureNearestCoords(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), 35144)
		if((Acid ~= nil) and (Acid:IsAlive() == false)) then
			Acid:Despawn(1, 0)
			pUnit:SpawnCreature(34816, 563, 173, 394.339, 4.740840, 16, 0)
			pUnit:Despawn(1, 0)
		end
	pUnit:RemoveEvents()
end

function Dread_OnHordeLeaveCombat(pUnit, Event)
	local Acid = pUnit:GetCreatureNearestCoords(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), 55144)
		if((Acid ~= nil) and (Acid:IsAlive() == false)) then
			Acid:Despawn(1, 0)
			pUnit:SpawnCreature(34816, 563, 173, 394.339, 4.740840, 16, 0)
			pUnit:Despawn(1, 0)
		end
	pUnit:RemoveEvents()
end

function Dread_OnHordeDeath(pUnit, Event)
	local X,Y,Z = pUnit:GetX(),pUnit:GetY(),pUnit:GetZ()
	local Acid = pUnit:GetCreatureNearestCoords(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), 55144)
		if((Acid ~= nil) and (Acid:IsAlive() == false)) then
			Acid:Despawn(1, 0)
			pUnit:SpawnCreature(360953, 563, 78, 419, 4.4070, 35, 0)
			pUnit:SpawnCreature(34797, 563, 173, 394.339, 4.740840, 16, 0)
			pUnit:Despawn(1, 0)
		end
	pUnit:RemoveEvents()
end

RegisterUnitEvent(34799, 2, "Dread_OnAllianceLeaveCombat")
RegisterUnitEvent(34799, 4, "Dread_OnAllianceDeath")
RegisterUnitEvent(54799, 2, "Dread_OnHordeLeaveCombat")
RegisterUnitEvent(54799, 4, "Dread_OnHordeDeath")