--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function MoonPriestessAmara_OnCombat(Unit, Event)
	Unit:RegisterEvent("MoonPriestessAmara_Shoot", 6000, 0)
end

function MoonPriestessAmara_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(18561, Unit:GetMainTank()) 
end

function MoonPriestessAmara_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MoonPriestessAmara_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2151, 1, "MoonPriestessAmara_OnCombat")
RegisterUnitEvent(2151, 2, "MoonPriestessAmara_OnLeaveCombat")
RegisterUnitEvent(2151, 4, "MoonPriestessAmara_OnDied")