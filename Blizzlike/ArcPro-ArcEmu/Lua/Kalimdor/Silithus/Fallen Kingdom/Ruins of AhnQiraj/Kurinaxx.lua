--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: DARKI; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

local cleave = 0

function KuriOnCombat(Unit, event)
	Unit:RegisterEvent("KuriSandTrap", 14000, 0)
	Unit:RegisterEvent("KuriCleave", 3500, 0)
end

function KuriCleave(Unit, event)
	if(cleave == 3) then
		Unit:ClearThreatList()
	else
	end
	Unit:FullCastSpellOnTarget(28467, Unit:GetClosestPlayer())
	cleave = cleave+1
end

function KuriSandTrap(Unit, event)
local player = Unit:GetRandomPlayer(0)
	if(player ~= nil) then
		Unit:SpawnCreature(90007, player:GetX(), player:GetY(), player:GetZ(), 0, 168, 10000)
	else
	end
end

function DummySandTrap(Unit, event)
	Unit:CastSpell(25648)
	sleep(2000)
	FullCastSpellOnTarget(25656, Unit:GetClosestPlayer())
	Unit:Despawn(100, 0)
	Unit:RegisterEvent("DummyTimerCheck", 1, 1)
end
--[[
function DummyTimerCheck(Unit, event)
	time = Timer:time()
	if(time > 1999) then
	print "TimeCheckSuccessful"
	--distance = Unit:GetDistance(target)
	--if(distance < 15) then
	print "DistanceCheckSuccessful"
	FullCastSpellOnTarget(25656, Unit:GetClosestPlayer())
	--end
	end
	Unit:Despawn(100, 0)
end
]]
function KuriOnLeaveCombat(Unit)
	Unit:RemoveEvents()
end

function KuriOnDied(Unit)
	Unit:RemoveEvents()
end

RegisterUnitEvent(90007, 6, "DummySandTrap")
RegisterUnitEvent(15348, 1, "KuriOnCombat")
RegisterUnitEvent(15348, 2, "KuriOnLeaveCombat")
RegisterUnitEvent(15348, 4, "KuriOnDied")