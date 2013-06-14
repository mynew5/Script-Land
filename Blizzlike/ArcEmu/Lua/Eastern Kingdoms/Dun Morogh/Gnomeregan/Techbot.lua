--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: DARKI; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function radiation_dt_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Lag", 7000, 0)
	pUnit:RegisterEvent("Summon_Dupe_Bug", 14000, 0)
	pUnit:RegisterEvent("Battle_Net", 21000, 0)
end

function Lag(pUnit, Event)
	pUnit:FullCastSpellOnTarget(10855, pUnit:GetClosestPlayer(1))
end

function Summon_Dupe_Bug(pUnit, Event)
	pUnit:FullCastSpellOnTarget(10858, pUnit:GetClosestPlayer(1))
end

function Battle_Net(pUnit, Event)
	pUnit:FullCastSpellOnTarget(10855, pUnit:GetClosestPlayer(1))
end

function radiation_dt_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function radiation_dt_OnDied(pUnit, Event)
	pUnit:SendChatMessage(12, 0, "Machine shutdown!")
	pUnit:RemoveEvents()
end

RegisterUnitEvent(6231, 1, "radiation_dt_OnCombat")
RegisterUnitEvent(6231, 2, "radiation_dt_OnLeaveCombat")
RegisterUnitEvent(6231, 4, "radiation_dt_OnDied")