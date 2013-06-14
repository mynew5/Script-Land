--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function WintersSister_OnCombat(Unit, Event)
	Unit:RegisterEvent("WintersSister_FrostShock", 6000, 0)
end

function WintersSister_FrostShock(Unit, Event) 
	Unit:FullCastSpellOnTarget(12548, Unit:GetMainTank()) 
end

function WintersSister_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WintersSister_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26456, 1, "WintersSister_OnCombat")
RegisterUnitEvent(26456, 2, "WintersSister_OnLeaveCombat")
RegisterUnitEvent(26456, 4, "WintersSister_OnDied")