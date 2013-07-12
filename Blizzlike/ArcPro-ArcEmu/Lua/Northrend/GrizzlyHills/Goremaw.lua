--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Goremaw_OnCombat(Unit, Event)
	Unit:RegisterEvent("Goremaw_CarnivorousBite", 10000, 0)
	Unit:RegisterEvent("Goremaw_InfectedWorgenBite", 4000, 3)
end

function Goremaw_CarnivorousBite(Unit, Event) 
	Unit:FullCastSpellOnTarget(50729, Unit:GetMainTank()) 
end

function Goremaw_InfectedWorgenBite(Unit, Event) 
	Unit:FullCastSpellOnTarget(53174, Unit:GetMainTank()) 
end

function Goremaw_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Goremaw_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27578, 1, "Goremaw_OnCombat")
RegisterUnitEvent(27578, 2, "Goremaw_OnLeaveCombat")
RegisterUnitEvent(27578, 4, "Goremaw_OnDied")