--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Bot_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Bot_Suicide", 4000, 1)
end

function Bot_Suicide(Unit, Event)
	Unit:FullCastSpellOnTarget(7, Unit:ClosestPlayer())
	Unit:CastSpell(7)
end

function Bot_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Bot_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19692, 1, "Bot_OnEnterCombat")
RegisterUnitEvent(19692, 2, "Bot_OnLeaveCombat")
RegisterUnitEvent(19692, 4, "Bot_OnDied")