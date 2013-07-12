--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: DARKI
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

--Parasitic Serpent AI
function Serpent_OneTimeBite(pUnit, Event)
    pUnit:FullCastSpellOnTarget(23865, pUnit:GetClosestPlayer())
end

function Serpent_Bite(pUnit, Event)
    pUnit:FullCastSpellOnTarget(23865, pUnit:GetClosestPlayer())
end

function Serpent_OnEnterCombat(pUnit, Event)
    pUnit:RegisterEvent("Serpent_OneTimeBite", 2000, 1)
    pUnit:RegisterEvent("Serpent_Bite", 14000, 0)
end

RegisterUnitEvent(14884, 1, "Serpent_OnEnterCombat")

function Serpent_OnWipe(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(14884, 2, "Serpent_OnWipe")

function Serpent_OnDie(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(14884, 4, "Serpent_OnDie")