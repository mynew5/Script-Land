--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Overlord_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Overlord_Shout", 1000, 0)
    Unit:RegisterEvent("Overlord_Charge", 1000, 0)
    Unit:RegisterEvent("Overlord_Weapons", 1000, 0)
    Unit:RegisterEvent("Overlord_Shadowtouched", 1000, 0)
end

function Overlord_Charge(Unit, Event)
    Unit:FullCastSpellOnTarget(36509, Unit:MainTank())
end

function Overlord_Shout(Unit, Event)
    Unit:CastSpell(32064)
end

function Overlord_Weapons(Unit, Event)
    Unit:FullCastSpellOnTarget(36510, Unit:ClosestPlayer())
end

function Overlord_Shadowtouched(Unit, Event)
    Unit:CastSpell(36515)
end

function Overlord_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Overlord_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20459, 1, "Overlord_OnEnterCombat")
RegisterUnitEvent(20459, 2, "Overlord_OnLeaveCombat")
RegisterUnitEvent(20459, 4, "Overlord_OnDied")