--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SilverCovenantScout_OnCombat(Unit, Event)
	Unit:RegisterEvent("SilverCovenantScout_MultiShot", 8000, 0)
	Unit:RegisterEvent("SilverCovenantScout_Shoot", 6000, 0)
end

function SilverCovenantScout_MultiShot(Unit, Event) 
	Unit:FullCastSpellOnTarget(14443, Unit:GetMainTank()) 
end

function SilverCovenantScout_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank()) 
end

function SilverCovenantScout_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SilverCovenantScout_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(30238, 1, "SilverCovenantScout_OnCombat")
RegisterUnitEvent(30238, 2, "SilverCovenantScout_OnLeaveCombat")
RegisterUnitEvent(30238, 4, "SilverCovenantScout_OnDied")