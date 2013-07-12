--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function LorgusJett_OnCombat(pUnit, event)
	pUnit:RegisterEvent("LightningBolt", 7000, 0)
	pUnit:RegisterEvent("LightningShield", 14000, 0)
end
 
function LightningBolt(pUnit, Event)
	pUnit:FullCastSpellOnTarget(12167, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("LightningBolt", 7000, 0)
end
 
function LightningShield(pUnit, Event)
	pUnit:CastSpell(12550)
	pUnit:RegisterEvent("LightningShield", 14000, 0)
end
 
function LorgusJett_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end
 
function LorgusJett_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end
 
RegisterUnitEvent(12902, 1, "LorgusJett_OnCombat")
RegisterUnitEvent(12902, 2, "LorgusJett_OnLeaveCombat")
RegisterUnitEvent(12902, 4, "LorgusJett_OnDeath")