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

function Acid_OnSpawn(pUnit, Event)
	pUnit:Root()
end

RegisterUnitEvent(35144, 18, "Acid_OnSpawn")
RegisterUnitEvent(55144, 18, "Acid_OnSpawn")

function Acid_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Acid_AcidSpit", 1500, 0)
	pUnit:RegisterEvent("Acid_ParalyticSpray", 30000, 0)
	pUnit:RegisterEvent("Acid_Sweep", 28000, 0)
	pUnit:RegisterEvent("Acid_SwitchToMobile", 70000, 1)
end

RegisterUnitEvent(35144, 1, "Acid_OnCombat")
RegisterUnitEvent(55144, 1, "Acid_OnCombat")

function Acid_SwitchToMobile(pUnit, Event)
	pUnit:Root()
	pUnit:RemoveEvents()
	pUnit:SetModel(29816)
	pUnit:Root()
	pUnit:RegisterEvent("Acid_AcidicSpew", 22000, 0)
	pUnit:RegisterEvent("Acid_ParalyticBite", 30000, 0)
	pUnit:RegisterEvent("Acid_PoisonCloud", 10000, 0)
	pUnit:RegisterEvent("Acid_SwitchBackToStationary", 70000, 1)
end

function Acid_SwitchBackToStationary(pUnit, Event)
	pUnit:Unroot()
	pUnit:RemoveEvents()
	pUnit:SetModel(29815)
	pUnit:Unroot()
	pUnit:RegisterEvent("Acid_AcidSpit", 1500, 0)
	pUnit:RegisterEvent("Acid_ParalyticSpray", 30000, 0)
	pUnit:RegisterEvent("Acid_Sweep", 28000, 0)
	pUnit:RegisterEvent("Acid_SwitchToMobile", 70000, 1)
end

function Acid_AcidicSpew(pUnit, Event)
	if(pUnit:GetMainTank() ~= nil) then
		pUnit:FullCastSpell(66819, pUnit:GetMainTank())
	end
end

function Acid_ParalyticBite(pUnit, Event)
	if(pUnit:GetRandomPlayer(0) ~= nil) then
		pUnit:CastSpellOnTarget(66824, pUnit:GetRandomPlayer(0))
	end
end

function Acid_AcidSpit(pUnit, Event)
	if(pUnit:GetMainTank() ~= nil) then
		pUnit:FullCastSpellOnTarget(66880, pUnit:GetMainTank())
	end
end

function Acid_ParalyticSpray(pUnit, Event)
	if(pUnit:GetRandomPlayer(0) ~= nil) then
		pUnit:FullCastSpellOnTarget(66901, pUnit:GetRandomPlayer(0))
	end
end

function Acid_Sweep(pUnit, Event)
	if(pUnit:GetMainTank() ~= nil) then
		pUnit:FullCastSpellOnTarget(66794, pUnit:GetMainTank())
	end
end

function Acid_PoisonCloud(pUnit, Event)
	pUnit:SpawnCreature(34802, pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), pUnit:GetO(), 16, 30000)
end

function Acid_OnAllianceDeath(pUnit, Event)
		if(pUnit:GetCreatureNearestCoords(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), 34799):IsAlive() == false) then
			pUnit:GetCreatureNearestCoords(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), 34799):Despawn(1, 0)
			pUnit:SpawnCreature(360953, 563, 78, 419, 4.4070, 35, 0)
			pUnit:SpawnCreature(34797, 563, 173, 394.339, 4.740840, 16, 0)
			pUnit:Despawn(1, 0)
		end
	pUnit:RemoveEvents()
end

function Acid_OnAllianceLeaveCombat(pUnit, Event)
		if(pUnit:GetCreatureNearestCoords(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), 34799):IsAlive() == false) then
			pUnit:GetCreatureNearestCoords(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), 34799):Despawn(1, 0)
			pUnit:SpawnCreature(34816, 563, 173, 394.339, 4.740840, 16, 0)
			pUnit:Despawn(1, 0)
		end
	pUnit:RemoveEvents()
end

function Acid_OnHordeDeath(pUnit, Event)
		if(pUnit:GetCreatureNearestCoords(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), 54799):IsAlive() == false) then
			pUnit:GetCreatureNearestCoords(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), 54799):Despawn(1, 0)
			pUnit:SpawnCreature(360953, 563, 78, 419, 4.4070, 35, 0)
			pUnit:SpawnCreature(34797, 563, 173, 394.339, 4.740840, 16, 0)
			pUnit:Despawn(1, 0)
		end
	pUnit:RemoveEvents()
end

function Acid_OnHordeLeaveCombat(pUnit, Event)
		if pUnit:GetCreatureNearestCoords(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), 54799):IsAlive() == false then
			pUnit:GetCreatureNearestCoords(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), 54799):Despawn(1, 0)
			pUnit:SpawnCreature(34816, 563, 173, 394.339, 4.740840, 16, 0)
			pUnit:Despawn(1, 0)
		end
	pUnit:RemoveEvents()
end

RegisterUnitEvent(55144, 2, "Acid_OnHordeLeaveCombat")
RegisterUnitEvent(35144, 2, "Acid_OnAllianceLeaveCombat")
RegisterUnitEvent(55144, 4, "Acid_OnHordeDeath")
RegisterUnitEvent(35144, 4, "Acid_OnAllianceDeath")