--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Scalder_OnCombat(Unit, Event)
	Unit:RegisterEvent("Scalder_ScaldingBlast", 8000, 0)
	Unit:RegisterEvent("Scalder_WaterBolt", 5500, 0)
end

function Scalder_ScaldingBlast(Unit, Event) 
	Unit:FullCastSpellOnTarget(50257, Unit:GetMainTank()) 
end

function Scalder_WaterBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(32011, Unit:GetMainTank()) 
end

function Scalder_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Scalder_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25226, 1, "Scalder_OnCombat")
RegisterUnitEvent(25226, 2, "Scalder_OnLeaveCombat")
RegisterUnitEvent(25226, 4, "Scalder_OnDied")