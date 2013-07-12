--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: BrantX
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function ChronoLordEpoch_OnEnterCombat(pUnit,Event)
	pUnit:SendChatMessage(14, 0, "We'll see about that, young prince.")
	pUnit:RegisterEvent("ChronoLordEpoch_TimeWarp", 18000, 0)
	pUnit:RegisterEvent("ChronoLordEpoch_CurseOfExertion", 16000, 0)
	pUnit:RegisterEvent("ChronoLordEpoch_WoundingStrike", 8000, 0)
end

function ChronoLordEpoch_OnSpawn(pUnit,Event)
	pUnit:SendChatMessage(14, 0, "Prince Arthas Menethil, on this day, a powerful darkness has taken hold of your soul. The death you are destined to visit upon others will this day be your own.")
end

function ChronoLordEpoch_TimeWarp(pUnit,Event)
	pUnit:FullCastSpellOnTarget(52766, pUnit:GetClosestPlayer())
	local Choice = math.random(1,3)
	if(Choice == 1) then
		pUnit:SendChatMessage(14, 0, "Tick tock, tick tock...")
	elseif(Choice == 2) then
		pUnit:SendChatMessage(14, 0, "Not quick enough!")
	elseif(Choice == 3) then
		pUnit:SendChatMessage(14, 0, "Let's get this over with.")
	end
end

function ChronoLordEpoch_CurseOfExertion(pUnit,Event)
	pUnit:FullCastSpellOnTarget(52772, pUnit:GetClosestPlayer())
end

function ChronoLordEpoch_WoundingStrike(pUnit,Event)
	pUnit:FullCastSpellOnTarget(52771, pUnit:GetClosestPlayer())
end

function ChronoLordEpoch_OnKill(pUnit,Event)
	local Choice = math.random(1,3)
	if(Choice == 1) then
		pUnit:SendChatMessage(14, 0, "There is no future for you.")
	elseif(Choice == 2) then
		pUnit:SendChatMessage(14, 0, "This is the hour of our greatest triumph!")
	elseif(Choice == 3) then
		pUnit:SendChatMessage(14, 0, "You would destined to fail.")
	end
end

function ChronoLordEpoch_OnDied(pUnit,Event)
	pUnit:RemoveEvents()
end

function ChronoLordEpoch_OnLeaveCombat(pUnit,Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(26532, 1, "ChronoLordEpoch_OnEnterCombat")
RegisterUnitEvent(26532, 18, "ChronoLordEpoch_OnSpawn")
RegisterUnitEvent(26532, 3, "ChronoLordEpoch_OnKill")
RegisterUnitEvent(26532, 4, "ChronoLordEpoch_OnDied")
RegisterUnitEvent(26532, 2, "ChronoLordEpoch_OnLeaveCombat")