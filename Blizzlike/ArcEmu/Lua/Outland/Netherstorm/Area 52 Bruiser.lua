--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Bruiser_OnEnterCombat(Unit, Event)
    Unit:RegisterEvent("Bruiser_Net", 1000, 0)
end

function Bruiser_Net(Unit, Event)
    Unit:FullCastSpellOnTarget(12024, Unit:GetClosestPlayer())
end

function Bruiser_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Bruiser_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20485, 1, "Bruiser_OnEnterCombat")
RegisterUnitEvent(20485, 2, "Bruiser_OnLeaveCombat")
RegisterUnitEvent(20485, 4, "Bruiser_OnDied")