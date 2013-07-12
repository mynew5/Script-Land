--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DecrepitNecromancer_OnCombat(Unit, Event)
	Unit:RegisterEvent("DecrepitNecromancer_ConversionBeam", 8000, 0)
	Unit:RegisterEvent("DecrepitNecromancer_ShadowBolt", 5000, 0)
end

function DecrepitNecromancer_ConversionBeam(Unit, Event) 
	Unit:FullCastSpellOnTarget(50659, Unit:GetMainTank()) 
end

function DecrepitNecromancer_ShadowBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9613, Unit:GetMainTank()) 
end

function DecrepitNecromancer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DecrepitNecromancer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26942, 1, "DecrepitNecromancer_OnCombat")
RegisterUnitEvent(26942, 2, "DecrepitNecromancer_OnLeaveCombat")
RegisterUnitEvent(26942, 4, "DecrepitNecromancer_OnDied")