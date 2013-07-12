--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Scoodles_OnCombat(Unit, Event)
	Unit:RegisterEvent("Scoodles_FlipperThwack", 7000, 0)
	Unit:RegisterEvent("Scoodles_PowerfulBite", 6000, 0)
end

function Scoodles_FlipperThwack(Unit, Event) 
	Unit:FullCastSpellOnTarget(50169, Unit:GetMainTank()) 
end

function Scoodles_PowerfulBite(Unit, Event) 
	Unit:FullCastSpellOnTarget(48287, Unit:GetMainTank()) 
end

function Scoodles_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Scoodles_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(24899, 1, "Scoodles_OnCombat")
RegisterUnitEvent(24899, 2, "Scoodles_OnLeaveCombat")
RegisterUnitEvent(24899, 4, "Scoodles_OnDied")