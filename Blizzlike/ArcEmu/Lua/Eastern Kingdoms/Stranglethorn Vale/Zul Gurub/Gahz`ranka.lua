--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: DARKI; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Gahz_OnEnterCombat(pUnit, Event)
    pUnit:RegisterEvent("Gahz_Frostbreath", math.random(16000,20000), 1)
    pUnit:RegisterEvent("Gahz_Slam", 25000, 0)
end

function Gahz_Frostbreath(pUnit, Event)
    pUnit:FullCastSpell(16099)
    pUnit:RegisterEvent("Gahz_Frostbreath", math.random(22000,26000), 1)
end

function Gahz_Slam(pUnit, Event)
    pUnit:FullCastSpell(24326)
end

function Gahz_OnWipe(pUnit, Event)
    pUnit:RemoveEvents()
end

function Gahz_OnDie(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(15114, 1, "Gahz_OnEnterCombat")
RegisterUnitEvent(15114, 2, "Gahz_OnWipe")
RegisterUnitEvent(15114, 4, "Gahz_OnDie")