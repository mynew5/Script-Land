--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Mager; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function AuchenaiWarrior_WhirlWind(Unit)
	Unit:CastSpellOnTarget(38619)
end

function AuchenaiWarrior_OnCombat(Unit, Event)
	Unit:RegisterEvent("AuchenaiWarrior_WhirlWind", math.random(8900,12000), 0)
end

RegisterUnitEvent(21852, 1, "AuchenaiWarrior_OnCombat")