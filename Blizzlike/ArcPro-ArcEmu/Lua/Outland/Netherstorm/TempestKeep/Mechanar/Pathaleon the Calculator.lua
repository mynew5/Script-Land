--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]
--[[Pathaleon the Calculator yells: A minor inconvenience.
Pathaleon the Calculator yells: I have been waiting for you!
Pathaleon the Calculator yells: I prefer to be hands-on...
Pathaleon the Calculator yells: I'm looking for a team player...
Pathaleon the Calculator yells: Looks like you lose.
Pathaleon the Calculator yells: The project will... continue.
Pathaleon the Calculator yells: Time to supplement my work force.
Pathaleon the Calculator yells: We are on a strict timetable. You will not interfere!
Pathaleon the Calculator yells: You work for me now!]]

function calculator(Unit, Event, MiscUnit, Misc)
	Unit:RegisterEvent("calculator_mana_tap", 8000, 0)
	Unit:RegisterEvent("calculator_domination", 35000, 0)
	Unit:RegisterEvent("calculator_minions_summon", 40000, 0)
end

function calculator_mana_tap(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(36021, Unit:GetRandomPlayer())
end

function calculator_domination(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(36866, Unit:GetRandomPlayer())
end

function calculator_minions_summon(Unit)
	Unit:FullCastSpell(35285)
	Unit:FullCastSpell(35286)
	Unit:FullCastSpell(35287)
	Unit:FullCastSpell(35288)
end

RegisterUnitEvent(19220, 1, "calculator")