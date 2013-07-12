--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ForgemasterDamrath_OnCombat(Unit, Event)
	Unit:RegisterEvent("ForgemasterDamrath_ForgeForce", 7000, 0)
end

function ForgemasterDamrath_ForgeForce(Unit, Event) 
	Unit:CastSpell(52640) 
end

function ForgemasterDamrath_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ForgemasterDamrath_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26334, 1, "ForgemasterDamrath_OnCombat")
RegisterUnitEvent(26334, 2, "ForgemasterDamrath_OnLeaveCombat")
RegisterUnitEvent(26334, 4, "ForgemasterDamrath_OnDied")