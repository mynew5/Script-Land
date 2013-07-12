--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Lothros_OnEnterCombat(Unit,Event)
	Unit:RegisterUnitEvent("Lothros_Spell", 60000, 0)
end

function Lothros_Spell(Unit,Event)
	Unit:FullCastSpellOnTarget(38167, Unit:GetClosestPlayer())
end

function Lothros_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function Lothros_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21928, 1, "Lothros_OnEnterCombat")
RegisterUnitEvent(21928, 2, "Lothros_OnLeaveCombat")
RegisterUnitEvent(21928, 4, "Lothros_OnDied")