--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Sarendryana_OnCombat(Unit, Event)
	Unit:RegisterEvent("Sarendryana_FrostShock", 6000, 0)
end

function Sarendryana_FrostShock(Unit, Event) 
	Unit:FullCastSpellOnTarget(12548, Unit:GetMainTank()) 
end

function Sarendryana_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Sarendryana_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26837, 1, "Sarendryana_OnCombat")
RegisterUnitEvent(26837, 2, "Sarendryana_OnLeaveCombat")
RegisterUnitEvent(26837, 4, "Sarendryana_OnDied")