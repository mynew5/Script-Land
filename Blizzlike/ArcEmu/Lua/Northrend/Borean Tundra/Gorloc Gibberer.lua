--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function GorlocGibberer_OnCombat(Unit, Event)
	Unit:RegisterEvent("GorlocGibberer_DeepDredge", 6000, 0)
	Unit:RegisterEvent("GorlocGibberer_Whirlwind", 9000, 0)
end

function GorlocGibberer_DeepDredge(Unit, Event) 
	Unit:CastSpell(50520) 
end

function GorlocGibberer_Whirlwind(Unit, Event) 
	Unit:CastSpell(15576) 
end

function GorlocGibberer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GorlocGibberer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25686, 1, "GorlocGibberer_OnCombat")
RegisterUnitEvent(25686, 2, "GorlocGibberer_OnLeaveCombat")
RegisterUnitEvent(25686, 4, "GorlocGibberer_OnDied")