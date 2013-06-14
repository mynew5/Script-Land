--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Crocolisk_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Crocolisk_Rip",1000,0)
end

function Crocolisk_Rip(Unit, Event)
    Unit:FullCastSpellOnTarget(3604, Unit:GetClosestPlayer())
end

function Crocolisk_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Crocolisk_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20773, 1, "Crocolisk_OnEnterCombat")
RegisterUnitEvent(20773, 2, "Crocolisk_OnLeaveCombat")
RegisterUnitEvent(20773, 4, "Crocolisk_OnDied")