--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function RedfangElder_OnCombat(Unit, Event)
	Unit:RegisterEvent("RedfangElder_ChainHeal", 12000, 0)
	Unit:RegisterEvent("RedfangElder_Hurricane", 10000, 0)
end

function RedfangElder_ChainHeal(Unit, Event) 
	Unit:CastSpell(14900) 
end

function RedfangElder_Hurricane(Unit, Event) 
	Unit:CastSpell(32717) 
end

function RedfangElder_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RedfangElder_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26436, 1, "RedfangElder_OnCombat")
RegisterUnitEvent(26436, 2, "RedfangElder_OnLeaveCombat")
RegisterUnitEvent(26436, 4, "RedfangElder_OnDied")