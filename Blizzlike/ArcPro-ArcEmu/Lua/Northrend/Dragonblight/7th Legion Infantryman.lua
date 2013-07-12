--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function thLegionInfantryman_OnCombat(Unit, Event)
	Unit:RegisterEvent("thLegionInfantryman_ConcussionBlow", 10000, 0)
	Unit:RegisterEvent("thLegionInfantryman_DemoralizingShout", 2000, 1)
end

function thLegionInfantryman_ConcussionBlow(Unit, Event) 
	Unit:FullCastSpellOnTarget(32588, Unit:GetMainTank()) 
end

function thLegionInfantryman_DemoralizingShout(Unit, Event) 
	Unit:CastSpell(16244) 
end

function thLegionInfantryman_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function thLegionInfantryman_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27160, 1, "thLegionInfantryman_OnCombat")
RegisterUnitEvent(27160, 2, "thLegionInfantryman_OnLeaveCombat")
RegisterUnitEvent(27160, 4, "thLegionInfantryman_OnDied")