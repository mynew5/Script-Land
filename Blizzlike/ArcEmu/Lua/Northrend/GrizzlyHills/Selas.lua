--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Selas_OnCombat(Unit, Event)
	Unit:RegisterEvent("Selas_AxeVolley", 6000, 0)
	Unit:RegisterEvent("Selas_KillingRage", 5000, 0)
end

function Selas_AxeVolley(Unit, Event) 
	Unit:CastSpell(53239) 
end

function Selas_KillingRage(Unit, Event) 
	Unit:CastSpell(52071) 
end

function Selas_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Selas_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27580, 1, "Selas_OnCombat")
RegisterUnitEvent(27580, 2, "Selas_OnLeaveCombat")
RegisterUnitEvent(27580, 4, "Selas_OnDied")