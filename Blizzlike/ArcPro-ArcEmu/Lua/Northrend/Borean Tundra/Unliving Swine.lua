--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function UnlivingSwine_OnCombat(Unit, Event)
	Unit:RegisterEvent("UnlivingSwine_SwineFlu", 8000, 0)
end

function UnlivingSwine_SwineFlu(Unit, Event) 
	Unit:FullCastSpellOnTarget(50303, Unit:GetMainTank()) 
end

function UnlivingSwine_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function UnlivingSwine_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25600, 1, "UnlivingSwine_OnCombat")
RegisterUnitEvent(25600, 2, "UnlivingSwine_OnLeaveCombat")
RegisterUnitEvent(25600, 4, "UnlivingSwine_OnDied")