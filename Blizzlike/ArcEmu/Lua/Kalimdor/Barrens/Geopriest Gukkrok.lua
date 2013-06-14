--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function GeopriestGukkrok_OnCombat(Unit, Event)
	Unit:RegisterEvent("GeopriestGukkrok_Heal", 15000, 0)
	Unit:RegisterEvent("GeopriestGukkrok_PowerWordShield", 6000, 1)
	Unit:RegisterEvent("GeopriestGukkrok_Renew", 10000, 0)
end

function GeopriestGukkrok_Heal(Unit, Event) 
	Unit:CastSpell(2054) 
end

function GeopriestGukkrok_PowerWordShield(Unit, Event) 
	Unit:CastSpell(600) 
end

function GeopriestGukkrok_Renew(Unit, Event) 
	Unit:CastSpell(6075) 
end

function GeopriestGukkrok_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GeopriestGukkrok_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5863, 1, "GeopriestGukkrok_OnCombat")
RegisterUnitEvent(5863, 2, "GeopriestGukkrok_OnLeaveCombat")
RegisterUnitEvent(5863, 4, "GeopriestGukkrok_OnDied")