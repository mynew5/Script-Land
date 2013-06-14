--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function TwilightLordEverun_OnCombat(Unit, Event)
	Unit:RegisterEvent("TwilightLordEverun_Fireball", 8000, 0)
	Unit:RegisterEvent("TwilightLordEverun_ShadowShock", 6000, 0)
end

function TwilightLordEverun_Fireball(Unit, Event) 
	Unit:FullCastSpellOnTarget(19816, Unit:GetMainTank()) 
end

function TwilightLordEverun_ShadowShock(Unit, Event) 
	Unit:FullCastSpellOnTarget(17439, Unit:GetMainTank()) 
end

function TwilightLordEverun_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TwilightLordEverun_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14479, 1, "TwilightLordEverun_OnCombat")
RegisterUnitEvent(14479, 2, "TwilightLordEverun_OnLeaveCombat")
RegisterUnitEvent(14479, 4, "TwilightLordEverun_OnDied")