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

function Icehowl_OnSpawn(pUnit, Event)
	pUnit:SetFaction(16)
	pUnit:SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1)
	pUnit:SetCombatCapable(1)
	pUnit:SetCombatMeleeCapable(1)
	pUnit:SetCombatRangedCapable(1)
	pUnit:SetCombatSpellCapable(1)
	pUnit:SetCombatTargetingCapable(1)
	pUnit:RegisterEvent("Icehowl_Attack", 5000, 1)
end

RegisterUnitEvent(34797, 18, "Icehowl_OnSpawn")
RegisterUnitEvent(54797, 18, "Icehowl_OnSpawn")

function Icehowl_Attack(pUnit, Event)
	pUnit:SetFaction(16)
	pUnit:SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_IS_ATTACKABLE_1)
	pUnit:SetCombatCapable(0)
	pUnit:SetCombatMeleeCapable(0)
	pUnit:SetCombatRangedCapable(0)
	pUnit:SetCombatSpellCapable(0)
	pUnit:SetCombatTargetingCapable(0)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:MoveTo(pUnit:GetClosestPlayer():GetX(), pUnit:GetClosestPlayer():GetY(), pUnit:GetClosestPlayer():GetZ(), pUnit:GetClosestPlayer():GetO())
	end
end

function Icehowl_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Icehowl_FerociousButt", 31000, 0)
	pUnit:RegisterEvent("Icehowl_ArcticBreath", 40000, 0)
	pUnit:RegisterEvent("Icehowl_Whirl", 15000, 0)
	pUnit:RegisterEvent("Icehowl_MassiveCrashPrep", 60000, 0)
end

RegisterUnitEvent(34797, 1, "Icehowl_OnCombat")
RegisterUnitEvent(54797, 1, "Icehowl_OnCombat")

function Icehowl_MassiveCrashPrep(pUnit, Event)
	pUnit:RemoveEvents()
	pUnit:WipeTargetList()
	pUnit:SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1)
	pUnit:SetCombatCapable(1)
	pUnit:SetCombatMeleeCapable(1)
	pUnit:SetCombatRangedCapable(1)
	pUnit:SetCombatSpellCapable(1)
	pUnit:SetCombatTargetingCapable(1)
	pUnit:MoveTo(563.728, 140.401, 393.846, 4.710839)
	pUnit:RegisterEvent("Icehowl_MassiveCrashRun", 6000, 1)
end

function Icehowl_MassiveCrashRun(pUnit, Event)
	pUnit:SetCombatSpellCapable(0)
	pUnit:SetCombatTargetingCapable(0)
	pUnit:Root()
	pUnit:RemoveEvents()
	pUnit:Root()
	if(pUnit:GetRandomPlayer(0) ~= nil) then
		pUnit:FullCastSpell(66683, pUnit:GetRandomPlayer(0))
		pUnit:RegisterEvent("Icehowl_Charge", 1200, 1)
	end
end

function Icehowl_Charge(pUnit, Event)
	pUnit:Unroot()
	pUnit:RemoveEvents()
	pUnit:Unroot()
	if(pUnit:GetRandomPlayer(0) ~= nil) then
		pUnit:ModifyRunSpeed(20)
		pUnit:ModifyWalkSpeed(20)
		pUnit:MoveTo(pUnit:GetRandomPlayer(0):GetX(), pUnit:GetRandomPlayer(0):GetY(), pUnit:GetRandomPlayer(0):GetZ(), pUnit:GetRandomPlayer(0):GetO())
		pUnit:RegisterEvent("Icehowl_ChargeEnd", 3500, 1)
	end
end

function Icehowl_ChargeEnd(pUnit, Event)
	pUnit:RemoveEvents()
	pUnit:SetCombatSpellCapable(1)
	pUnit:SetCombatTargetingCapable(1)
	pUnit:CastSpell(66758)
	pUnit:SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_IS_ATTACKABLE_1)
	pUnit:ModifyRunSpeed(10)
	pUnit:ModifyWalkSpeed(5)
	pUnit:RegisterEvent("Icehowl_StartAgain", 15000, 1)
end

function Icehowl_StartAgain(pUnit, Event)
	if(pUnit:HasAura(66758)) then
		pUnit:RemoveAura(66758)
	end
	pUnit:SetCombatCapable(0)
	pUnit:SetCombatMeleeCapable(0)
	pUnit:SetCombatRangedCapable(0)
	pUnit:SetCombatSpellCapable(0)
	pUnit:SetCombatTargetingCapable(0)
	pUnit:RegisterEvent("Icehowl_FerociousButt", 31000, 0)
	pUnit:RegisterEvent("Icehowl_ArcticBreath", 40000, 0)
	pUnit:RegisterEvent("Icehowl_Whirl", 15000, 0)
	pUnit:RegisterEvent("Icehowl_MassiveCrashPrep", 60000, 0)
end

function Icehowl_FerociousButt(pUnit, Event)
	if(pUnit:GetMainTank() ~= nil) then
		pUnit:CastSpellOnTarget(66770, pUnit:GetMainTank())
	end
end

function Icehowl_ArcticBreath(pUnit, Event)
	if(pUnit:GetRandomPlayer(0) ~= nil) then
		pUnit:FullCastSpellOnTarget(66689, pUnit:GetRandomPlayer(0))
	end
end

function Icehowl_Whirl(pUnit, Event)
	if(pUnit:GetRandomPlayer(0) ~= nil) then
		pUnit:FullCastSpell(67345, pUnit:GetRandomPlayer(0))
	end
end

function Icehowl_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
	pUnit:SpawnCreature(34816, 554.412, 94.4594, 396.096, 5.49938, 35, 0)
	pUnit:SpawnCreature(360955, 563.636, 79.012, 418.215, 1.554401, 35, 0)
	pUnit:Despawn(1, 0)
end

function Icehowl_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
	pUnit:SpawnCreature(35035, 554.412, 94.4594, 396.096, 5.49938, 35, 0)
	pUnit:SpawnCreature(360954, 563, 78, 419, 4.4070, 35, 0)
end

RegisterUnitEvent(34797, 4, "Icehowl_OnDeath")
RegisterUnitEvent(54797, 4, "Icehowl_OnDeath")
RegisterUnitEvent(34797, 2, "Icehowl_OnLeaveCombat")
RegisterUnitEvent(54797, 2, "Icehowl_OnLeaveCombat")