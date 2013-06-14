--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function AnubarBlightbeast_OnCombat(Unit, Event)
	Unit:RegisterEvent("AnubarBlightbeast_BlightedShriek", 8000, 0)
	Unit:RegisterEvent("AnubarBlightbeast_PoisonBolt", 6000, 0)
end

function AnubarBlightbeast_BlightedShriek(Unit, Event) 
	Unit:CastSpell(47443) 
end

function AnubarBlightbeast_PoisonBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(21971, Unit:GetMainTank()) 
end

function AnubarBlightbeast_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AnubarBlightbeast_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26607, 1, "AnubarBlightbeast_OnCombat")
RegisterUnitEvent(26607, 2, "AnubarBlightbeast_OnLeaveCombat")
RegisterUnitEvent(26607, 4, "AnubarBlightbeast_OnDied")