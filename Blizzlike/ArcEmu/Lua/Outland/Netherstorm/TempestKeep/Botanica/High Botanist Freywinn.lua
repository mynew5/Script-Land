--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]
--[[High Botanist Freywinn yells: Endorel anuminor!
High Botanist Freywinn yells: Nature bends to my will....
High Botanist Freywinn yells: The specimens... must be preserved.
High Botanist Freywinn yells: What are you doing? These specimens are very delicate!
High Botanist Freywinn says: ...mumble mumble...
High Botanist Freywinn says: ...mumble...Petals of Fire...mumble...
High Botanist Freywinn says: ...thorny vines...mumble...ouch!
High Botanist Freywinn says: ...with the right mixture, perhaps...]]

function Freywinn(Unit, Event, MiscUnit, Misc)
	Unit:RegisterEvent("Freywinn_Heal", 15000, 0)
	Unit:RegisterEvent("Freywinn_White", 19000, 0)
	Unit:RegisterEvent("Freywinn_Green", 23000, 0)
	Unit:RegisterEvent("Freywinn_Blue", 27000, 0)
	Unit:RegisterEvent("Freywinn_Red", 35000, 0)
end

function Freywinn_Heal(Unit)
	Unit:FullCastSpell(25817)
end

function Freywinn_White(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(34759, Unit:GetClosestPlayer())
end

function Freywinn_Green(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(34761, Unit:GetClosestPlayer())
end

function Freywinn_Blue(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(34762, Unit:GetClosestPlayer())
end

function Freywinn_Red(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(34763, Unit:GetClosestPlayer())
end

RegisterUnitEvent(17975, 1, "Freywinn")