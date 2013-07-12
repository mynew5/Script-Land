--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Mage_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Mage_Blast", 6000, 0)
    Unit:RegisterEvent("Mage_Flames", 2500, 0)
end

function Mage_Rip(Unit, Event)
    Unit:FullCastSpellOnTarget(17273, Unit:GetClosestPlayer())
end

function Mage_Flames(Unit, Event)
    Unit:FullCastSpellOnTarget(36104, Unit:GetClosestPlayer())
end
    
function Mage_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Mage_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19543, 1, "Mage_OnEnterCombat")
RegisterUnitEvent(19543, 2, "Mage_OnLeaveCombat")
RegisterUnitEvent(19543, 4, "Mage_OnDied")