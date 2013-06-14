--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]
--[[Akkiris Lightning-Waker yells: You are... nothing!
Akkiris Lightning-Waker yells: You dare imprison me? You will die!]]

function Akkiris(Unit, Event, MiscUnit, Misc)
	Unit:RegisterEvent("Akkiris_Red", 10000, 0)
	Unit:RegisterEvent("Akkiris_Wave", 13000, 0)
	Unit:RegisterEvent("Akkiris_FireBolt", 21000, 0)
end

function Akkiris_Red(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(14264, Unit:GetClosestPlayer())
end

function Akkiris_Wave(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(23331, Unit:GetClosestPlayer())
end

function Akkiris_FireBolt(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(36906, Unit:GetClosestPlayer())
end

RegisterUnitEvent(20908, 1, "Akkiris")