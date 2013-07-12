--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function NethermineRavager_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("NethermineRavager_Rend", 15000, 0)
	Unit:RegisterEvent("NethermineRavager_RockShell", 18000, 0)
end

function NethermineRavager_Rend(Unit,Event)
	Unit:FullCastSpellOnTarget(13443, Unit:GetClosestPlayer())
end

function NethermineRavager_RockShell(Unit,Event)
	Unit:FullCastSpellOnTarget(33810, Unit:GetClosestPlayer())
end

function NethermineRavager_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function NethermineRavager_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(23326, 1, "NethermineRavager_OnEnterCombat")
RegisterUnitEvent(23326, 2, "NethermineRavager_OnLeaveCombat")
RegisterUnitEvent(23326, 4, "NethermineRavager_OnDied")