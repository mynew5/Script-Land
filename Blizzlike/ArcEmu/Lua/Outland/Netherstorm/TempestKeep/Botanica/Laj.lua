--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Laj(Unit, Event, MiscUnit, Misc)
	Unit:RegisterEvent("Laj_Allergic", 10000, 0)
	Unit:RegisterEvent("Laj_Flayer", 21000, 0)
	Unit:RegisterEvent("Laj_Lasher", 22000, 0)
end

function Laj_Allergic(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(34697, Unit:GetClosestPlayer())
end

function Laj_Flayer(Unit)
	Unit:FullCastSpell(34682)
end

function Laj_Lasher(Unit)
	Unit:FullCastSpell(34681)
end

RegisterUnitEvent(17980, 1, "Laj")