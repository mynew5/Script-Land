--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function LuthiontheVile_OnCombat(Unit, Event)
	Unit:RegisterEvent("LuthiontheVile_BloodPresence", 4000, 1)
	Unit:RegisterEvent("LuthiontheVile_PlagueStrike", 9000, 0)
end

function LuthiontheVile_BloodPresence(Unit, Event) 
	Unit:CastSpell(50689) 
end

function LuthiontheVile_PlagueStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(50688, Unit:GetMainTank()) 
end

function LuthiontheVile_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function LuthiontheVile_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27860, 1, "LuthiontheVile_OnCombat")
RegisterUnitEvent(27860, 2, "LuthiontheVile_OnLeaveCombat")
RegisterUnitEvent(27860, 4, "LuthiontheVile_OnDied")