--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function InjuredMammoth_OnCombat(Unit, Event)
	Unit:RegisterEvent("InjuredMammoth_Trample", 6000, 0)
end

function InjuredMammoth_Trample(Unit, Event) 
	Unit:CastSpell(51944) 
end

function InjuredMammoth_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function InjuredMammoth_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26711, 1, "InjuredMammoth_OnCombat")
RegisterUnitEvent(26711, 2, "InjuredMammoth_OnLeaveCombat")
RegisterUnitEvent(26711, 4, "InjuredMammoth_OnDied")