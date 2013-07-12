--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SilverCovenantHorseman_OnCombat(Unit, Event)
	Unit:RegisterEvent("SilverCovenantHorseman_MultiShot", 8000, 0)
	Unit:RegisterEvent("SilverCovenantHorseman_Shoot", 6000, 0)
end

function SilverCovenantHorseman_MultiShot(Unit, Event) 
	Unit:FullCastSpellOnTarget(14443, Unit:GetMainTank()) 
end

function SilverCovenantHorseman_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank()) 
end

function SilverCovenantHorseman_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SilverCovenantHorseman_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(30263, 1, "SilverCovenantHorseman_OnCombat")
RegisterUnitEvent(30263, 2, "SilverCovenantHorseman_OnLeaveCombat")
RegisterUnitEvent(30263, 4, "SilverCovenantHorseman_OnDied")