--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Ascendscripting; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SyndicateMagus_OnSpawn(Unit, Event)
	Unit:CastSpell(12544)
end

function SyndicateMagus_OnEnterCombat(Unit, Event)
	Unit:RegisterEvent("Frostbolt", 11000, 0)
end

function Frostbolt(Unit, Event)
	Unit:FullCastSpellOnTarget(9672, Unit:GetMainTank())
end

function SyndicateMagus_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function SyndicateMagus_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2591, 18, "SyndicateMagus_OnSpawn")
RegisterUnitEvent(2591, 1, "SyndicateMagus_OnEnterCombat")
RegisterUnitEvent(2591, 2, "SyndicateMagus_OnLeaveCombat")
RegisterUnitEvent(2591, 4, "SyndicateMagus_OnDied")