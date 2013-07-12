--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Researcher_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Researcher_Energy", 1000, 0)
    Unit:RegisterEvent("Researcher_Surge", 1000, 0)
    Unit:RegisterEvent("Researcher_Bolt", 3000, 0)
end

function Researcher_Energy(Unit, Event)
    Unit:CastSpell(16592)
end

function Researcher_Surge(Unit, Event)
    Unit:FullCastSpellOnTarget(36508, Unit:ClosestPlayer())
end

function Researcher_Bolt(Unit, Event)
    Unit:FullCastSpellOnTarget(9532, Unit:ClosestPlayer())
end

function Researcher_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Researcher_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20456, 1, "Researcher_OnEnterCombat")
RegisterUnitEvent(20456, 2, "Researcher_OnLeaveCombat")
RegisterUnitEvent(20456, 4, "Researcher_OnDied")