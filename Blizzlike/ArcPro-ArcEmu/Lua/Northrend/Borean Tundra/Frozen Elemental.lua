--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function FrozenElemental_OnCombat(Unit, Event)
	Unit:RegisterEvent("FrozenElemental_IceSpike", 8000, 0)
end

function FrozenElemental_IceSpike(Unit, Event) 
	Unit:FullCastSpellOnTarget(50094, Unit:GetMainTank()) 
end

function FrozenElemental_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function FrozenElemental_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25715, 1, "FrozenElemental_OnCombat")
RegisterUnitEvent(25715, 2, "FrozenElemental_OnLeaveCombat")
RegisterUnitEvent(25715, 4, "FrozenElemental_OnDied")