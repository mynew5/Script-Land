--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Ascendscripting; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SyndicatePathstalker_OnEnterCombat(Unit, Event)
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank())
end

RegisterUnitEvent(2587, 1, "SyndicatePathstalker_OnEnterCombat")