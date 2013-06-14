--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Nazan(Unit, Event, MiscUnit, Misc)
	Unit:RegisterEvent("Nazan_Fireball", 5000, 0)
	Unit:RegisterEvent("Nazan_Cone_Fire", 11000, 0)
end

function Nazan_Fireball(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(37111, Unit:GetClosestPlayer())
end

function Nazan_Cone_Fire(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(30926, Unit:GetClosestPlayer())
end

RegisterUnitEvent(17536, 1, "Nazan")