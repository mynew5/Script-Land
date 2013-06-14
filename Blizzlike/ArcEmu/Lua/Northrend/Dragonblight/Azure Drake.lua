--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function AzureDrake_OnCombat(Unit, Event)
	Unit:RegisterEvent("AzureDrake_FrostBreath", 10000, 1)
end

function AzureDrake_FrostBreath(Unit, Event) 
	Unit:FullCastSpellOnTarget(49111, Unit:GetMainTank()) 
end

function AzureDrake_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AzureDrake_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27682, 1, "AzureDrake_OnCombat")
RegisterUnitEvent(27682, 2, "AzureDrake_OnLeaveCombat")
RegisterUnitEvent(27682, 4, "AzureDrake_OnDied")