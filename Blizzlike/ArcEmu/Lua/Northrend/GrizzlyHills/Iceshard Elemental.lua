--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]


function IceshardElemental_OnCombat(Unit, Event)
	Unit:RegisterEvent("IceshardElemental_IceSpike", 8000, 0)
end

function IceshardElemental_IceSpike(Unit, Event) 
	Unit:FullCastSpellOnTarget(50094, Unit:GetMainTank()) 
end

function IceshardElemental_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function IceshardElemental_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(24228, 1, "IceshardElemental_OnCombat")
RegisterUnitEvent(24228, 2, "IceshardElemental_OnLeaveCombat")
RegisterUnitEvent(24228, 4, "IceshardElemental_OnDied")