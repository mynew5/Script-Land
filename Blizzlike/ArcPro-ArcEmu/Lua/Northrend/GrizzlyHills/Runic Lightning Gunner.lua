--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function RunicLightningGunner_OnCombat(Unit, Event)
	Unit:RegisterEvent("RunicLightningGunner_LightningGunShot", 6000, 0)
end

function RunicLightningGunner_LightningGunShot(Unit, Event) 
	Unit:FullCastSpellOnTarget(46982, Unit:GetMainTank()) 
end

function RunicLightningGunner_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RunicLightningGunner_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26414, 1, "RunicLightningGunner_OnCombat")
RegisterUnitEvent(26414, 2, "RunicLightningGunner_OnLeaveCombat")
RegisterUnitEvent(26414, 4, "RunicLightningGunner_OnDied")