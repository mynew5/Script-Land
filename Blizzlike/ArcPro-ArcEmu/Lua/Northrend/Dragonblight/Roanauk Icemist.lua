--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function RoanaukIcemist_OnCombat(Unit, Event)
	Unit:RegisterEvent("RoanaukIcemist_GloryoftheAncestors", 5000, 1)
	Unit:RegisterEvent("RoanaukIcemist_IcemistsBlessing", 10000, 0)
end

function RoanaukIcemist_GloryoftheAncestors(Unit, Event) 
	Unit:CastSpell(47378) 
end

function RoanaukIcemist_IcemistsBlessing(Unit, Event) 
	Unit:CastSpell(47379) 
end

function RoanaukIcemist_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RoanaukIcemist_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26654, 1, "RoanaukIcemist_OnCombat")
RegisterUnitEvent(26654, 2, "RoanaukIcemist_OnLeaveCombat")
RegisterUnitEvent(26654, 4, "RoanaukIcemist_OnDied")