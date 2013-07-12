--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Ironhide_OnCombat(Unit, Event)
	Unit:RegisterEvent("Ironhide_Charge", 10000, 0)
	Unit:RegisterEvent("Ironhide_Maul", 6000, 0)
	Unit:RegisterEvent("Ironhide_Swipe", 5000, 0)
end

function Ironhide_Charge(Unit, Event) 
	Unit:FullCastSpellOnTarget(32323, Unit:GetMainTank()) 
end

function Ironhide_Maul(Unit, Event) 
	Unit:FullCastSpellOnTarget(34298, Unit:GetMainTank()) 
end

function Ironhide_Swipe(Unit, Event) 
	Unit:FullCastSpellOnTarget(31279, Unit:GetMainTank()) 
end

function Ironhide_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Ironhide_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27715, 1, "Ironhide_OnCombat")
RegisterUnitEvent(27715, 2, "Ironhide_OnLeaveCombat")
RegisterUnitEvent(27715, 4, "Ironhide_OnDied")