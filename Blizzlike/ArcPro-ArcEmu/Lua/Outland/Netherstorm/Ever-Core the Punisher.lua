--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Punisher_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Punisher_Explosion", 1500, 0)
    Unit:RegisterEvent("Punisher_Suppression", 3000, 0)
end

function Punisher_Explosion(Unit, Event)
    Unit:FullCastSpellOnTarget(33860, Unit:ClosestPlayer())
end

function Punisher_Suppression(Unit, Event)
    Unit:FullCastSpellOnTarget(35892, Unit:ClosestPlayer())
end

function Punisher_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Punisher_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(18698, 1, "Punisher_OnEnterCombat")
RegisterUnitEvent(18698, 2, "Punisher_OnLeaveCombat")
RegisterUnitEvent(18698, 4, "Punisher_OnDied")