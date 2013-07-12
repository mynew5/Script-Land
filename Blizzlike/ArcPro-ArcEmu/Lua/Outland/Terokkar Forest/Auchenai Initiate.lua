--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Mager; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function AuchenaiInitiate_KnockDown(Unit)
	Unit:CastSpellOnTarget(37592)
end

function AuchenaiInitiate_Whirlwind(Unit)
	Unit:CastSpellOnTarget(38619)
end
	
function AuchenaiInitiate_OnCombat(Unit, Event)
	Unit:RegisterEvent("AuchenaiInitiate_Whirlwind", math.random(7800,12000), 0)
	Unit:RegisterEvent("AuchenaiInitiate_KnockDown", math.random(12000,14000), 0)
end

RegisterUnitEvent(21284, 1, "AuchenaiInitiate_OnCombat")