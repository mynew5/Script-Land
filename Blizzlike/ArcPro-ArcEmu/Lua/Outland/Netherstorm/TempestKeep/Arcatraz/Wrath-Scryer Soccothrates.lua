--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]
--[[Wrath-Scryer Soccothrates yells: Ahh... much better.
Wrath-Scryer Soccothrates yells: At last, a target for my frustrations!
Wrath-Scryer Soccothrates yells: Defend yourself, for all the good it will do....
Wrath-Scryer Soccothrates yells: Did you call on me?
Wrath-Scryer Soccothrates yells: Finally! Well done!
Wrath-Scryer Soccothrates yells: Have you come to kill Dalliah? Can I watch?
Wrath-Scryer Soccothrates yells: Having problems, Dalliah? How nice.
Wrath-Scryer Soccothrates yells: I suggest a new strategy: you draw their attacks while I gather reinforcements.
Wrath-Scryer Soccothrates yells: Knew this was... the only way out.
Wrath-Scryer Soccothrates yells: On guard!
Wrath-Scryer Soccothrates yells: Then I'll commit myself to ignoring you.
Wrath-Scryer Soccothrates yells: This may be the end for you, Dalliah. What a shame that would be.
Wrath-Scryer Soccothrates yells: To do your heavy lifting, most likely.
Wrath-Scryer Soccothrates yells: Yes, that was quite satisfying.
Wrath-Scryer Soccothrates yells: You're the one who should be-- Wait, we have company...]]

function Soccothrates(Unit, Event, MiscUnit, Misc)
	Unit:RegisterEvent("Soccothrates_Immolation", 8000, 0)
	Unit:RegisterEvent("Soccothrates_Shock", 11000, 0)
	Unit:RegisterEvent("Soccothrates_Charge", 21000, 0)
end

function Soccothrates_Immolation(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(36051, Unit:GetClosestPlayer())
end

function Soccothrates_Shock(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(22423, Unit:GetClosestPlayer())
end

function Soccothrates_Charge(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(36058, Unit:GetClosestPlayer())
end

RegisterUnitEvent(20886, 1, "Soccothrates")