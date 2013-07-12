--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function WastesScavenger_OnCombat(Unit, Event)
	Unit:RegisterEvent("WastesScavenger_BoneToss", 5000, 0)
end

function WastesScavenger_BoneToss(Unit, Event) 
	Unit:FullCastSpellOnTarget(50403, Unit:GetMainTank()) 
end

function WastesScavenger_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WastesScavenger_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(28005, 1, "WastesScavenger_OnCombat")
RegisterUnitEvent(28005, 2, "WastesScavenger_OnLeaveCombat")
RegisterUnitEvent(28005, 4, "WastesScavenger_OnDied")