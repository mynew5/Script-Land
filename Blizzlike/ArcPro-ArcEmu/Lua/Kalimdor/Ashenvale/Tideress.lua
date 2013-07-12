--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Tideress_OnCombat(Unit, Event)
	Unit:RegisterEvent("Tideress_Frostbolt", 7000, 0)
end

function Tideress_Frostbolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9672, pUnit:GetMainTank()) 
end

function Tideress_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Tideress_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12759, 1, "Tideress_OnCombat")
RegisterUnitEvent(12759, 2, "Tideress_OnLeaveCombat")
RegisterUnitEvent(12759, 4, "Tideress_OnDied")