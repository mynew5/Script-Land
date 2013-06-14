--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DrakkariOracle_OnCombat(Unit, Event)
	Unit:RegisterEvent("DrakkariOracle_LightningBolt", 7000, 0)
	Unit:RegisterEvent("DrakkariOracle_WarpedBody", 8000, 0)
	Unit:RegisterEvent("DrakkariOracle_WarpedMind", 6000, 0)
end

function DrakkariOracle_LightningBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9532, Unit:GetMainTank()) 
end

function DrakkariOracle_WarpedBody(Unit, Event) 
	Unit:FullCastSpellOnTarget(52431, Unit:GetMainTank()) 
end

function DrakkariOracle_WarpedMind(Unit, Event) 
	Unit:FullCastSpellOnTarget(52430, Unit:GetMainTank()) 
end

function DrakkariOracle_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DrakkariOracle_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26795, 1, "DrakkariOracle_OnCombat")
RegisterUnitEvent(26795, 2, "DrakkariOracle_OnLeaveCombat")
RegisterUnitEvent(26795, 4, "DrakkariOracle_OnDied")