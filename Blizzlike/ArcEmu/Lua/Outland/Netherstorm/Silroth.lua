--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Silroth_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Silroth_Flames1", 10000, 0)
    Unit:RegisterEvent("Silroth_Flames2", 2000, 0)
end

function Silroth_Flames1(Unit, Event)
    Unit:CastSpell(36253)
end   

function Silroth_Flames2(Unit, Event)
    Unit:FullCastSpellOnTarget(36252, Unit:MainTank())
end

function Silroth_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Silroth_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20801, 1, "Silroth_OnEnterCombat")
RegisterUnitEvent(20801, 2, "Silroth_OnLeaveCombat")
RegisterUnitEvent(20801, 4, "Silroth_OnDied")