--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]
--[[Mechano-Lord Capacitus yells: Bully!
Mechano-Lord Capacitus yells: Can't say I didn't warn you....
Mechano-Lord Capacitus yells: Damn, I'm good!
Mechano-Lord Capacitus yells: Go ahead, gimme your best shot. I can take it!
Mechano-Lord Capacitus yells: Think you can hurt me, huh? Think I'm afraid a' you?
Mechano-Lord Capacitus yells: You should split while you can.]]

function Capacitus(Unit, Event, MiscUnit, Misc)
	Unit:RegisterEvent("Capacitus_head_crack", 7000, 0)
	Unit:RegisterEvent("Capacitus_reflective_damage_shield", 14000, 0)
	Unit:RegisterEvent("Capacitus_reflective_magic_shield", 21000, 0)
	Unit:RegisterEvent("Capacitus_seed_of_corruption", 35000, 0)
end

function Capacitus_head_crack(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(35161, Unit:GetRandomPlayer())
end

function Capacitus_reflective_damage_shield(Unit)
	Unit:FullCastSpell(35159)
end

function Capacitus_reflective_magic_shield(Unit)
	Unit:FullCastSpell(35158)
end

function Capacitus_seed_of_corruption(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(37826, Unit:GetRandomPlayer())
end

RegisterUnitEvent(19219, 1, "Capacitus")