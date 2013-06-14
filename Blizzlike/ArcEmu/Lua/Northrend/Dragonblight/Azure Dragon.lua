--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function AzureDragon_OnCombat(Unit, Event)
	Unit:RegisterEvent("AzureDragon_FrostBreath", 10000, 1)
end

function AzureDragon_FrostBreath(Unit, Event) 
	Unit:FullCastSpellOnTarget(49111, Unit:GetMainTank()) 
end

function AzureDragon_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AzureDragon_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27608, 1, "AzureDragon_OnCombat")
RegisterUnitEvent(27608, 2, "AzureDragon_OnLeaveCombat")
RegisterUnitEvent(27608, 4, "AzureDragon_OnDied")