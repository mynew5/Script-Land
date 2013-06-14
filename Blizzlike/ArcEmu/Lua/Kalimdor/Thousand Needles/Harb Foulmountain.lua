--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function HarbFoulmountain_OnCombat(Unit, Event)
	Unit:RegisterEvent("HarbFoulmountain_Thrash", 6000, 0)
	Unit:RegisterEvent("HarbFoulmountain_WarStomp", 8000, 0)
end

function HarbFoulmountain_Thrash(Unit, Event) 
	Unit:FullCastSpellOnTarget(3391, Unit:GetMainTank()) 
end

function HarbFoulmountain_WarStomp(Unit, Event) 
	Unit:FullCastSpellOnTarget(45, Unit:GetMainTank()) 
end

function HarbFoulmountain_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HarbFoulmountain_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14426, 1, "HarbFoulmountain_OnCombat")
RegisterUnitEvent(14426, 2, "HarbFoulmountain_OnLeaveCombat")
RegisterUnitEvent(14426, 4, "HarbFoulmountain_OnDied")