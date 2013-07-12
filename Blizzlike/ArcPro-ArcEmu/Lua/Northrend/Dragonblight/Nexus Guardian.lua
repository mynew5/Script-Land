--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function NexusGuardian_OnCombat(Unit, Event)
	Unit:RegisterEvent("NexusGuardian_FrostBreath", 6500, 0)
	Unit:RegisterEvent("NexusGuardian_FrostCleave", 8000, 0)
end

function NexusGuardian_FrostBreath(Unit, Event) 
	Unit:FullCastSpellOnTarget(47425, Unit:GetMainTank()) 
end

function NexusGuardian_FrostCleave(Unit, Event) 
	Unit:CastSpell(51857) 
end

function NexusGuardian_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function NexusGuardian_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26276, 1, "NexusGuardian_OnCombat")
RegisterUnitEvent(26276, 2, "NexusGuardian_OnLeaveCombat")
RegisterUnitEvent(26276, 4, "NexusGuardian_OnDied")