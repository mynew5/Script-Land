--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SilverbrookVillager_OnCombat(Unit, Event)
	Unit:RegisterEvent("SilverbrookVillager_Chop", 5000, 0)
end

function SilverbrookVillager_Chop(Unit, Event) 
	Unit:FullCastSpellOnTarget(43410, Unit:GetMainTank()) 
end

function SilverbrookVillager_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SilverbrookVillager_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26708, 1, "SilverbrookVillager_OnCombat")
RegisterUnitEvent(26708, 2, "SilverbrookVillager_OnLeaveCombat")
RegisterUnitEvent(26708, 4, "SilverbrookVillager_OnDied")