--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Researcher_OnCombat(Unit, Event)
	Unit:RegisterEvent("Researcher_Armor", 6000, 0)
end

function Researcher_Armor(Unit, Event) 
	Unit:FullCastSpellOnTarget(35918, Unit:GetMainTank()) 
end

function Researcher_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Researcher_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(20136, 1, "Researcher_OnCombat")
RegisterUnitEvent(20136, 2, "Researcher_OnLeaveCombat")
RegisterUnitEvent(20136, 4, "Researcher_OnDied")