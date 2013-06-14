--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]
--[[Harbinger Skyriss yells: Bear witness to the agent of your demise!
Harbinger Skyriss yells: Flee in terror.
Harbinger Skyriss yells: I am merely one of... infinite multitudes.
Harbinger Skyriss yells: I will show you horrors undreamed of.
Harbinger Skyriss yells: It is a small matter to control the mind of the weak... for I bear allegiance to powers untouched by time, unmoved by fate. No force on this world or beyond harbors the strength to bend our knee... not even the mighty Legion!
Harbinger Skyriss yells: The chaos I have sown here is but a taste....
Harbinger Skyriss yells: We span the universe, as countless as the stars!
Harbinger Skyriss yells: You will do my bidding, weakling.
Harbinger Skyriss yells: Your fate is written.
Harbinger Skyriss yells: Your will is no longer your own.]]

function Skyriss(Unit, Event, MiscUnit, Misc)
	Unit:RegisterEvent("Skyriss_Red", 11000, 0)
	Unit:RegisterEvent("Skyriss_Blue", 15000, 0)
	Unit:RegisterEvent("Skyriss_Rend", 21000, 0)
	Unit:RegisterEvent("Skyriss_Control", 27000, 0)
	Unit:RegisterEvent("Skyriss_Fear",31000,0)
end

function Skyriss_Red(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(14264, Unit:GetClosestPlayer())
end

function Skyriss_Blue(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(14261, Unit:GetClosestPlayer())
end

function Skyriss_Rend(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(36924, Unit:GetClosestPlayer())
end

function Skyriss_Control(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(11446, Unit:GetClosestPlayer())
end

function Skyriss_Fear(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(30584, Unit:GetClosestPlayer())
end

RegisterUnitEvent(20912, 1, "Skyriss")