--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ShadeofArugal_OnCombat(Unit, Event)
	Unit:RegisterEvent("ShadeofArugal_PhaseOut", 45000, 0)
	Unit:RegisterEvent("ShadeofArugal_ShadowBolt", 8000, 0)
	Unit:RegisterEvent("ShadeofArugal_WorgensCommand", 15000, 1)
end

function ShadeofArugal_PhaseOut(Unit, Event) 
	Unit:FullCastSpellOnTarget(53052, Unit:GetMainTank()) 
end

function ShadeofArugal_ShadowBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(53086, Unit:GetMainTank()) 
end

function ShadeofArugal_WorgensCommand(Unit, Event) 
	Unit:FullCastSpellOnTarget(53070, Unit:GetMainTank()) 
end

function ShadeofArugal_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ShadeofArugal_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27018, 1, "ShadeofArugal_OnCombat")
RegisterUnitEvent(27018, 2, "ShadeofArugal_OnLeaveCombat")
RegisterUnitEvent(27018, 4, "ShadeofArugal_OnDied")