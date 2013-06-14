--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Vindicator_OnCombat(Unit, Event)
	Unit:RegisterEvent("Vindicator_Banish", 7000, 0)
end

function Vindicator_Banish(Unit, Event) 
	Unit:FullCastSpellOnTarget(36642, Unit:GetMainTank()) 
end

function Vindicator_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Vindicator_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(18549, 1, "Vindicator_OnCombat")
RegisterUnitEvent(18549, 2, "Vindicator_OnLeaveCombat")
RegisterUnitEvent(18549, 4, "Vindicator_OnDied")