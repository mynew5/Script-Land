--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function UnboundAncient_OnCombat(Unit, Event)
	Unit:RegisterEvent("UnboundAncient_EntanglingRoots", 10000, 0)
	Unit:RegisterEvent("UnboundAncient_Trample", 6000, 0)
end

function UnboundAncient_EntanglingRoots(Unit, Event) 
	Unit:FullCastSpellOnTarget(33844, Unit:GetMainTank()) 
end

function UnboundAncient_Trample(Unit, Event) 
	Unit:CastSpell(51944) 
end

function UnboundAncient_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function UnboundAncient_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(30861, 1, "UnboundAncient_OnCombat")
RegisterUnitEvent(30861, 2, "UnboundAncient_OnLeaveCombat")
RegisterUnitEvent(30861, 4, "UnboundAncient_OnDied")