--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function GorlocDredger_OnCombat(Unit, Event)
	Unit:RegisterEvent("GorlocDredger_DeepDredge", 6000, 0)
	Unit:RegisterEvent("GorlocDredger_Whirlwind", 9000, 0)
end

function GorlocDredger_DeepDredge(Unit, Event) 
	Unit:CastSpell(50520) 
end

function GorlocDredger_Whirlwind(Unit, Event) 
	Unit:CastSpell(15576) 
end

function GorlocDredger_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GorlocDredger_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25701, 1, "GorlocDredger_OnCombat")
RegisterUnitEvent(25701, 2, "GorlocDredger_OnLeaveCombat")
RegisterUnitEvent(25701, 4, "GorlocDredger_OnDied")