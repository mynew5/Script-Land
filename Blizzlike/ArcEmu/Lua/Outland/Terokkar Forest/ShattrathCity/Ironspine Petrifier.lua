--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Petrifier_OnCombat(Unit, Event)
	Unit:RegisterEvent("Petrifier_Glare", 10000, 0)
end

function Petrifier_Glare(Unit, Event) 
	Unit:FullCastSpellOnTarget(32905, Unit:GetMainTank()) 
end

function Petrifier_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Petrifier_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(21854, 1, "Petrifier_OnCombat")
RegisterUnitEvent(21854, 2, "Petrifier_OnLeaveCombat")
RegisterUnitEvent(21854, 4, "Petrifier_OnDied")