--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Terokk_OnCombat(Unit, Event)
	Unit:RegisterEvent("Terokk_Charge", 1000, 1)
	Unit:RegisterEvent("Terokk_Burst", 6000, 0)
end

function Terokk_Charge(Unit, Event) 
	Unit:FullCastSpellOnTarget(24193, Unit:GetMainTank()) 
end

function Terokk_Burst(Unit, Event) 
	Unit:FullCastSpellOnTarget(39068, Unit:GetMainTank()) 
end

function Terokk_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Terokk_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(22375, 1, "Terokk_OnCombat")
RegisterUnitEvent(22375, 2, "Terokk_OnLeaveCombat")
RegisterUnitEvent(22375, 4, "Terokk_OnDied")