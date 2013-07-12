--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function OggleflintOnCombat(Unit, Event, Attacker)
	Unit:RegisterEvent(OggleflintSpell1, 10000, 0)
end

function OggleflintSpell2(Unit, Event, Attacker)
	Unit:FullCastSpellOnTarget(40505, Unit:GetMainTank())
end

RegisterUnitEvent(11517, 1, "OggleflintOnCombat")