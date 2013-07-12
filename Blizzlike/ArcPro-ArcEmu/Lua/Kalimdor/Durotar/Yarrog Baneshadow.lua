--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function YarrogBaneshadow_OnCombat(Unit, Event)
	Unit:RegisterEvent("YarrogBaneshadow_Immolate", 6000, 0)
	Unit:RegisterEvent("YarrogBaneshadow_Corruption", 8000, 0)
end

function YarrogBaneshadow_Immolate(Unit, Event) 
	Unit:FullCastSpellOnTarget(348, Unit:GetMainTank()) 
end

function YarrogBaneshadow_Corruption(Unit, Event) 
	Unit:FullCastSpellOnTarget(172, Unit:GetMainTank()) 
end

function YarrogBaneshadow_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function YarrogBaneshadow_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3183, 1, "YarrogBaneshadow_OnCombat")
RegisterUnitEvent(3183, 2, "YarrogBaneshadow_OnLeaveCombat")
RegisterUnitEvent(3183, 4, "YarrogBaneshadow_OnDied")