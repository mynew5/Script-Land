--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Ghost_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Ghost_Soulbind", 2000, 0)
end

function Ghost_Soulbind(Unit, Event)
    Unit:CastSpell(36153)
end

function Ghost_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Ghost_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20409, 1, "Ghost_OnEnterCombat")
RegisterUnitEvent(20409, 2, "Ghost_OnLeaveCombat")
RegisterUnitEvent(20409, 4, "Ghost_OnDied")