--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Ascendscripting; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SyndicateHighwayman_OnSpawn(Unit,Event)
	Unit:CastSpell(1784)
end

function SyndicateHighwayman_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("Backstab", 8000, 0)
end

function Backstab(Unit,Event)
	Unit:FullCastSpellOnTarget(37685, Unit:GetMainTank())
end

function SyndicateHighwayman_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function SyndicateHighwayman_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2586, 18, "SyndicateHighwayman_OnSpawn")
RegisterUnitEvent(2586, 1, "SyndicateHighwayman_OnEnterCombat")
RegisterUnitEvent(2586, 2, "SyndicateHighwayman_OnLeaveCombat")
RegisterUnitEvent(2586, 4, "SyndicateHighwayman_OnDied")