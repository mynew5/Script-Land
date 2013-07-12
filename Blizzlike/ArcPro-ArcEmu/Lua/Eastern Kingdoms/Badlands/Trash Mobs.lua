--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcPro Speculation; for the Script
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

--Ambassador Infernus
function AmbassadorInfernus_OnEnterCombat(pUnit,Event)
	pUnit:RegisterEvent("AmbassadorInfernus_FireNova", 16000, 0)
	pUnit:RegisterEvent("AmbassadorInfernus_FireShieldIV", 24000, 0)
	pUnit:RegisterEvent("AmbassadorInfernus_SearingFlames", 13000, 0)
end

function AmbassadorInfernus_FireNova(pUnit,Event)
	pUnit:CastSpell(11970)
end

function AmbassadorInfernus_FireShieldIV(pUnit,Event)
	pUnit:CastSpell(2602)
end

function AmbassadorInfernus_SearingFlames(pUnit,Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
	else
		pUnit:FullCastSpellOnTarget(9552, pUnit:GetClosestPlayer())
	end
end

function AmbassadorInfernus_OnLeaveCombat(pUnit,Event)
	pUnit:RemoveEvents()
end

function AmbassadorInfernus_OnDied(pUnit,Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2745, 1, "AmbassadorInfernus_OnEnterCombat")
RegisterUnitEvent(2745, 2, "AmbassadorInfernus_OnLeaveCombat")
RegisterUnitEvent(2745, 4, "AmbassadorInfernus_OnDied")

--Blacklash
function Blacklash_OnEnterCombat(pUnit,Event)
	pUnit:RegsiterEvent("Blacklash_FlameBreath", 4500, 0)
end

function Blacklash_FlameBreath(pUnit,Event)
	pUnit:FullCastSpellOnTarget(9573, pUnit:GetClosestPlayer())
end

function Blacklash_OnLeaveCombat(pUnit,Event)
	pUnit:RemoveEvents()
end

function Blacklash_OnDied(pUnit,Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2757, 1, "Blacklash_OnEnterCombat")
RegisterUnitEvent(2757, 2, "Blacklash_OnLeaveCombat")
RegisterUnitEvent(2757, 4, "Blacklash_OnDied")

--Buzzard
function Buzzard_OnEnterCombat(pUnit,Event)
	pUnit:RegisterEvent("Buzzard_InfectedWound", 38000, 0)
end

function Buzzard_InfectedWound(pUnit,Event)
	pUnit:FullCastSpellOnTarget(3427, pUnit:GetClosestPlayer())
end

function Buzzard_OnLeaveCombat(pUnit,Event)
	pUnit:RemoveEvents()
end

function Buzzard_OnDied(pUnit,Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2830, 1, "Buzzard_OnEnterCombat")
RegisterUnitEvent(2830, 2, "Buzzard_OnLeaveCombat")
RegisterUnitEvent(2830, 4, "Buzzard_OnDied")