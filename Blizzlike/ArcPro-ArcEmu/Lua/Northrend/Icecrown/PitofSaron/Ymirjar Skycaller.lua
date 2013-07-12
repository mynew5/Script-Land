--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Skycaller_OnCombat(Unit, Event)
	Unit:RegisterEvent("Skycaller_CallDrake", 1000, 1)
	Unit:RegisterEvent("Skycaller_Strike", 14500, 0)
	Unit:RegisterEvent("Skycaller_Disarm", 18500, 0)
end

function Skycaller_CallDrake(Unit, Event)
	Unit:SpawnCreature(36794, Unit:GetX(), Unit:GetY(), Unit:GetZ(), Unit:GetO(), 18, 300000, 0, 0, 0, 0, 0)
end

function Skycaller_Strike(Unit, Event)
	Unit:CastSpellOnTarget(70292, Unit:GetMainTank())
end

function Skycaller_Disarm(Unit, Event)
	Unit:CastSpellOnTarget(41062, Unit:GetMainTank())
end

function Skycaller_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Skycaller_OnDeath(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(31260, 1, "Skycaller_OnCombat")
RegisterUnitEvent(31260, 2, "Skycaller_OnLeaveCombat")
RegisterUnitEvent(31260, 4, "Skycaller_OnDeath")