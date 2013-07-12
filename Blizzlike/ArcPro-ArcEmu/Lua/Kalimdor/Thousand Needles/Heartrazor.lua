--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Heartrazor_OnCombat(Unit, Event)
	Unit:RegisterEvent("Heartrazor_LethalToxin", 12000, 0)
end

function Heartrazor_LethalToxin(Unit, Event) 
	Unit:FullCastSpellOnTarget(8256, Unit:GetMainTank()) 
end

function Heartrazor_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Heartrazor_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5934, 1, "Heartrazor_OnCombat")
RegisterUnitEvent(5934, 2, "Heartrazor_OnLeaveCombat")
RegisterUnitEvent(5934, 4, "Heartrazor_OnDied")