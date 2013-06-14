--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function RottingCadaver_OnDied(pUnit, Event)
	pUnit:SpawnCreature(10925, pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), pUnit:GetO(), 21, 360000)
	pUnit:SpawnCreature(10925, pUnit:GetX()+0.3, pUnit:GetY(), pUnit:GetZ(), pUnit:GetO(), 21, 360000)
end

RegisterUnitEvent(4474, 4, "RottingCadaver_OnDied")

function RottingWorm_OnSpawn(pUnit, Event)
	pUnit:SetScale(0.2)
end

RegisterUnitEvent(10925, 6, "RottingWorm_OnSpawn")

function VileSlime_OnDied (pUnit, Event)
	pUnit:SpawnCreature(8257, pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), pUnit:GetO(), 104, 360000)
	pUnit:SpawnCreature(8257, pUnit:GetX()-1, pUnit:GetY(), pUnit:GetZ(), pUnit:GetO(), 104, 360000)
	pUnit:SpawnCreature(8257, pUnit:GetX()+2, pUnit:GetY(), pUnit:GetZ(), pUnit:GetO(), 104, 360000)
end

RegisterUnitEvent(1806, 4, "VileSlime_OnDied")

function RWOO_OnLeaveCombat(pUnit, Event)
	pUnit:Despawn(1000, 0)
end

RegisterUnitEvent(10925, 2, "RWOO_OnLeaveCombat")
RegisterUnitEvent(8257, 2, "RWOO_OnLeaveCombat") 