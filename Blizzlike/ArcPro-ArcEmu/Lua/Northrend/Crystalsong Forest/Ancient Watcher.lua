--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function AncientWatcher_OnCombat(Unit, Event)
	Unit:RegisterEvent("AncientWatcher_EntanglingRoots", 10000, 0)
	Unit:RegisterEvent("AncientWatcher_Trample", 6000, 0)
end

function AncientWatcher_EntanglingRoots(Unit, Event) 
	Unit:FullCastSpellOnTarget(33844, Unit:GetMainTank()) 
end

function AncientWatcher_Trample(Unit, Event) 
	Unit:CastSpell(51944) 
end

function AncientWatcher_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AncientWatcher_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(31229, 1, "AncientWatcher_OnCombat")
RegisterUnitEvent(31229, 2, "AncientWatcher_OnLeaveCombat")
RegisterUnitEvent(31229, 4, "AncientWatcher_OnDied")