--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Drakonaar(Unit, Event, MiscUnit, Misc)
	Unit:RegisterEvent("Drakonaar_Red", 11000, 0)
	Unit:RegisterEvent("Drakonaar_Blue", 15000, 0)
	Unit:RegisterEvent("Drakonaar_Green", 21000, 0)
	Unit:RegisterEvent("Drakonaar_Black", 27000, 0)
	Unit:RegisterEvent("Drakonaar_Bronze", 31000, 0)
	Unit:SendChatMessage(14, 0, "The black dragonflight will conquer all!")
end

function Drakonaar_Red(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(14264, Unit:GetClosestPlayer())
end

function Drakonaar_Blue(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(14261, Unit:GetClosestPlayer())
end

function Drakonaar_Green(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(14262, Unit:GetClosestPlayer())
end

function Drakonaar_Black(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(14265, Unit:GetClosestPlayer())
	Unit:SendChatMessage(11, 0, "Now the final blast...")
end

function Drakonaar_Bronze(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(14263, Unit:GetClosestPlayer())
end

RegisterUnitEvent(20910, 1, "Drakonaar")