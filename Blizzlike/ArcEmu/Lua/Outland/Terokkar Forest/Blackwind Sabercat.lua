--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Mager; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function BlackwindSabercat_Rip(Unit)
	Unit:CastSpellOnTarget(33912)
end

function BlackwindSabercat_OnCombat(Unit, Event)
	Unit:RegisterEvent("BlackWindSabercat_rip", math.random(6700,1190), 0)
end

RegisterUnitEvent(21723, 1, "BlackwindSabercat_OnCombat")