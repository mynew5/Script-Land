--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Stormhide_OnCombat(Unit, Event)
	Unit:RegisterEvent("Stormhide_LizardBolt", 6000, 0)
end

function Stormhide_LizardBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(5401, Unit:GetMainTank()) 
end

function Stormhide_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Stormhide_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3238, 1, "Stormhide_OnCombat")
RegisterUnitEvent(3238, 2, "Stormhide_OnLeaveCombat")
RegisterUnitEvent(3238, 4, "Stormhide_OnDied")