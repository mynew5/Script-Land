--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Icestorm_OnCombat(Unit, Event)
	Unit:RegisterEvent("Icestorm_FrostBreath", 7000, 0)
end

function Icestorm_FrostBreath(Unit, Event) 
	Unit:FullCastSpellOnTarget(47428, Unit:GetMainTank()) 
end

function Icestorm_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Icestorm_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26287, 1, "Icestorm_OnCombat")
RegisterUnitEvent(26287, 2, "Icestorm_OnLeaveCombat")
RegisterUnitEvent(26287, 4, "Icestorm_OnDied")