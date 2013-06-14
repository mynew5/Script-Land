--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Stalker_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Stalker_Shadowsurge", 1000, 0)
    Unit:RegisterEvent("Stalker_Shadowtouched", 1000, 0)
end

function Stalker_Shadowsurge(Unit, Event)
    Unit:FullCastSpellOnTarget(36517, Unit:ClosestPlayer())
end

function Stalker_Shadowtouched(Unit, Event)
    Unit:CastSpell(36515)
end

function Stalker_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Stalker_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20474, 1, "Stalker_OnEnterCombat")
RegisterUnitEvent(20474, 2, "Stalker_OnLeaveCombat")
RegisterUnitEvent(20474, 4, "Stalker_OnDied")