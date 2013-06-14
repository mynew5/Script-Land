--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function FrozenSphere_OnCombat(Unit, Event)
	Unit:RegisterEvent("FrozenSphere_IceShard", 6000, 0)
end

function FrozenSphere_IceShard(Unit, Event) 
	Unit:FullCastSpellOnTarget(50578, Unit:GetMainTank()) 
end

function FrozenSphere_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function FrozenSphere_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(28066, 1, "FrozenSphere_OnCombat")
RegisterUnitEvent(28066, 2, "FrozenSphere_OnLeaveCombat")
RegisterUnitEvent(28066, 4, "FrozenSphere_OnDied")