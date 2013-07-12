--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Nuramoc_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Nuramoc_Lightning", 2000, 0)
    Unit:RegisterEvent("Nuramoc_Bolt", 4000, 0)
    Unit:RegisterEvent("Nuramoc_Shield", 5000, 0)
end

function Nuramoc_Lightning(Unit, Event)
    Unit:FullCastSpellOnTarget(15797, Unit:ClosestPlayer())
end   
   
function Nuramoc_Bolt(Unit, Event)
    Unit:FullCastSpellOnTarget(21971, Unit:ClosestPlayer())
end

function Nuramoc_Shield(Unit, Event)
    Unit:CastSpell(38905)
end
    
function Nuramoc_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Nuramoc_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20932, 1, "Nuramoc_OnEnterCombat")
RegisterUnitEvent(20932, 2, "Nuramoc_OnLeaveCombat")
RegisterUnitEvent(20932, 4, "Nuramoc_OnDied")