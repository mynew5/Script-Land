--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function WarpMaster_OnEnterCombat(Unit, Event)
    	Unit:RegisterEvent("WarpMaster_Spray", 2000, 0)
end

function WarpMaster_Spray(Unit, Event)
    	Unit:FullCastSpellOnTarget(36486, Unit:ClosestPlayer())
end

function WarpMaster_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function WarpMaster_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(20326, 1, "WarpMaster_OnEnterCombat")
RegisterUnitEvent(20326, 2, "WarpMaster_OnLeaveCombat")
RegisterUnitEvent(20326, 4, "WarpMaster_OnDied")