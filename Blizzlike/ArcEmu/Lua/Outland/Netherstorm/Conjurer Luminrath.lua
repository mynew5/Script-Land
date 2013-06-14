--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Conjurer_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Conjurer_Bolt", 3000, 0)
    Unit:RegisterEvent("Conjurer_Sword", 30000, 0)
end

function Conjurer_Bolt(Unit, Event)
    Unit:FullCastSpellOnTarget(9532, Unit:ClosestPlayer())
end

function Conjurer_Sword(Unit, Event)
    Unit:CastSpell(36110)
end

function Conjurer_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Conjurer_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19544, 1, "Conjurer_OnEnterCombat")
RegisterUnitEvent(19544, 2, "Conjurer_OnLeaveCombat")
RegisterUnitEvent(19544, 4, "Conjurer_OnDied")