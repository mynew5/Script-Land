--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Arakis_OnCombat(Unit, Event)
	Unit:RegisterEvent("Arakis_BerserkerCharge", 6000, 0)
end

function Arakis_BerserkerCharge(Unit, Event) 
	Unit:FullCastSpellOnTarget(19471, Unit:GetRandomPlayer(0)) 
end

function Arakis_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Arakis_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(15290, 1, "Arakis_OnCombat")
RegisterUnitEvent(15290, 2, "Arakis_OnLeaveCombat")
RegisterUnitEvent(15290, 4, "Arakis_OnDied")