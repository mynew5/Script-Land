--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Holystone Productions; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

local Krystallus = 27977

function Krystallus_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Crash....")
    pUnit:RegisterEvent("Krystallus_BoulderToss", 10000, 0)
	pUnit:RegisterEvent("Krystallus_Stomp", 35000, 0)
	pUnit:RegisterEvent("Krystallus_GroundSlam", 22000, 0)
end

function Krystallus_BoulderToss(pUnit, Event)
    pUnit:FullCastSpellOnTarget(50843, pUnit:GetRandomPlayer(0))
end

function Krystallus_Stomp(pUnit, Event)
	pUnit:CastSpell(50868)
end

function Krystallus_GroundSlam(pUnit, Event)
    pUnit:FullCastSpellOnTarget(50827, pUnit:GetAITargets())
	pUnit:RegisterEvent("Krystallus_Shatter", 5000, 1)
end

function Krystallus_Shatter(pUnit, Event)
    pUnit:FullCastSpellOnTarget(50810, pUnit:GetAITargets())
end

RegisterUnitEvent(Krystallus, 1, "Krystallus_OnCombat")