--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function GeraldGreen_OnCombat(Unit, Event)
	Unit:RegisterEvent("GeraldGreen_Cleave", 7000, 0)
end

function GeraldGreen_Cleave(Unit, Event) 
	Unit:FullCastSpellOnTarget(40504, Unit:GetMainTank()) 
end

function GeraldGreen_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GeraldGreen_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26083, 1, "GeraldGreen_OnCombat")
RegisterUnitEvent(26083, 2, "GeraldGreen_OnLeaveCombat")
RegisterUnitEvent(26083, 4, "GeraldGreen_OnDied")