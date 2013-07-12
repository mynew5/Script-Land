--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DCRavenguard_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("DCRavenguard_Enrage", 120000, 0)
	Unit:RegisterEvent("DCRavenguard_Howl", 27000, 0)
end

function DCRavenguard_Enrage(Unit,Event)
	Unit:FullCastSpellOnTarget(8599, Unit:GetClosestPlayer())
end

function DCRavenguard_Howl(Unit,Event)
	Unit:FullCastSpellOnTarget(23600, Unit:GetClosestPlayer())
end

function DCRavenguard_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

function DCRavenguard_LeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19827, 1, "DCRavenguard_OnEnterCombat")
RegisterUnitEvent(19827, 2, "DCRavenguard_LeaveCombat")
RegisterUnitEvent(19827, 4, "DCRavenguard_OnDied")