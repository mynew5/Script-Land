--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function OverseerDeathgaze_OnCombat(Unit, Event)
	Unit:RegisterEvent("OverseerDeathgaze_ConversionBeam", 9100, 0)
	Unit:RegisterEvent("OverseerDeathgaze_ShadowBolt", 6000, 0)
end

function OverseerDeathgaze_ConversionBeam(Unit, Event) 
	Unit:FullCastSpellOnTarget(50659, Unit:GetMainTank()) 
end

function OverseerDeathgaze_ShadowBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(12739, Unit:GetMainTank()) 
end

function OverseerDeathgaze_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function OverseerDeathgaze_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27122, 1, "OverseerDeathgaze_OnCombat")
RegisterUnitEvent(27122, 2, "OverseerDeathgaze_OnLeaveCombat")
RegisterUnitEvent(27122, 4, "OverseerDeathgaze_OnDied")