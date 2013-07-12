--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function CaedakartheVicious_OnCombat(Unit, Event)
	Unit:RegisterEvent("CaedakartheVicious_HealingWave", 13000, 0)
	Unit:RegisterEvent("CaedakartheVicious_LightningBolt", 8000, 0)
	Unit:RegisterEvent("CaedakartheVicious_LightningShield", 5000, 0)
end

function CaedakartheVicious_HealingWave(pUnit, Event) 
	pUnit:CastSpell(913) 
end

function CaedakartheVicious_LightningBolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9532, 	pUnit:GetMainTank()) 
end

function CaedakartheVicious_LightningShield(pUnit, Event) 
	pUnit:CastSpell(905) 
end

function CaedakartheVicious_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CaedakartheVicious_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3900, 1, "CaedakartheVicious_OnCombat")
RegisterUnitEvent(3900, 2, "CaedakartheVicious_OnLeaveCombat")
RegisterUnitEvent(3900, 4, "CaedakartheVicious_OnDied")