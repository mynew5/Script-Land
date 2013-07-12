--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function CMyrmidon_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("CMyrmidon_Spell", 120000, 0)
end

function CMyrmidon_Spell(Unit,Event)
	Unit:FullCastSpellOnTarget(38027, Unit:GetClosestPlayer())
end

function CMyrmidon_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function CMyrmidon_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19765, 1, "CMyrmidon_OnEnterCombat")
RegisterUnitEvent(19765, 2, "CMyrmidon_OnLeaveCombat")
RegisterUnitEvent(19765, 4, "CMyrmidon_OnDied")