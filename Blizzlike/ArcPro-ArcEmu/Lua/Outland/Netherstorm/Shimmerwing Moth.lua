--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Moth_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Moth_Dust", 10000, 0)
    Unit:RegisterEvent("Moth_Buffet", 2000, 0)
end

function Moth_Dust(Unit, Event)
    Unit:FullCastSpellOnTarget(36592, Unit:MainTank())
end   

function Moth_Buffet(Unit, Event)
    Unit:FullCastSpellOnTarget(32914, Unit:MainTank())
end

function Moth_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Moth_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20611, 1, "Moth_OnEnterCombat")
RegisterUnitEvent(20611, 2, "Moth_OnLeaveCombat")
RegisterUnitEvent(20611, 4, "Moth_OnDied")