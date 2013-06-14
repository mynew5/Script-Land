--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Bron_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("Bron_ThrowHammer", 15000, 0)
end

function Bron_ThrowHammer(Unit,Event)
	Unit:FullCastSpellOnTarget(33822, Unit:GetClosestPlayer())
end

function Bron_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function Bron_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19395, 1, "Bron_OnEnterCombat")
RegisterUnitEvent(19395, 2, "Bron_OnLeaveCombat")
RegisterUnitEvent(19395, 4, "Bron_OnDied")