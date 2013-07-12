--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

AllowSpawn = 1

function BaronVardus_QuestOnAccept (pUnit, Event)
	if(AllowSpawn == 1) then
		spin = math.random (1,4)
		if(spin == 1) then
			pUnit:SpawnCreature (2306, 692.64, -904.74, 157.79, 1.17511, 14, 1800000)
			AllowSpawn = 0
		elseif(spin == 2) then
			pUnit:SpawnCreature (2306, 939.0, -852.46, 114.644, 1.17511, 14, 1800000)
			AllowSpawn = 0
		elseif(spin == 3) then
			pUnit:SpawnCreature (2306, 1184.07, -553.43, 71.3346, 1.17511, 14, 1800000)
			AllowSpawn = 0
		elseif(spin == 4) then
			pUnit:SpawnCreature (2306, 1001.20, -793.93, 108.65, 1.17511, 14, 1800000)
			AllowSpawn = 0
		end
	end
end

function BaronVardus_OnDead (pUnit, Event)
   AllowSpawn = 1
end

--RegisterQuestEvent(566, 2,"BaronVardus_OnAcceptQuest")
RegisterUnitEvent(2306, 6, "BaronVardus_QuestOnAccept")
RegisterUnitEvent(2306, 4, "BaronVardus_OnDead") 