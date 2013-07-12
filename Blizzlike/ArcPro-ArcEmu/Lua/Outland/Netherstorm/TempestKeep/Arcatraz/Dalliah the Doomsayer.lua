--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]
--[[Dalliah the Doomsayer yells: Ahh... just what I needed.
Dalliah the Doomsayer yells: Completely ineffective. Just like someone else I know.
Dalliah the Doomsayer yells: Congratulations. I've wanted to do that for years.
Dalliah the Doomsayer yells: Don't worry about me; kill that worthless dullard instead!
Dalliah the Doomsayer yells: I suppose I'll end up fighting them all myself.
Dalliah the Doomsayer yells: I'll cut you to pieces!
Dalliah the Doomsayer yells: I've grown used to cleaning up your messes.
Dalliah the Doomsayer yells: It is unwise to anger me!
Dalliah the Doomsayer yells: More than you can handle, scryer?
Dalliah the Doomsayer yells: Now I'm really angry.
Dalliah the Doomsayer yells: Reap the whirlwind!
Dalliah the Doomsayer yells: That is much better.
Dalliah the Doomsayer yells: What would you know about commitment, sheet-sah?
Dalliah the Doomsayer yells: When I need someone to prance around like an overstuffed peacock, I'll call on you.
Dalliah the Doomsayer yells: Why would I call on you?
Dalliah the Doomsayer yells: You chose the wrong opponent.]]

function Dalliah(Unit, Event, MiscUnit, Misc)
	Unit:RegisterEvent("Dalliah_Red", 11000, 0)
	Unit:RegisterEvent("Dalliah_Whirlwind_Heal", 21000, 0)
	Unit:RegisterEvent("Dalliah_Doomsayer", 31000, 0)
end

function Dalliah_Red(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(14264, Unit:GetClosestPlayer())
end

function Dalliah_Whirlwind_Heal(Unit)
	Unit:FullCastSpell(36142)
end

function Dalliah_Doomsayer(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(36173, Unit:GetClosestPlayer())
end

RegisterUnitEvent(20885, 1, "Dalliah")