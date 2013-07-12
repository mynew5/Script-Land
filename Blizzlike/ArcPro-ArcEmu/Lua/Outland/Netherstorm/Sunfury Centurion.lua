--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Centurion_OnCombat(Unit, Event)
	Unit:RegisterEvent("Centurion_Enrage", 25000, 1)
	Unit:RegisterEvent("Centurion_Breaker", 10000, 0)
end

function Centurion_Enrage(Unit, Event) 
	Unit:CastSpell(8599) 
end

function Centurion_Breaker(Unit, Event) 
	Unit:CastSpell(35871) 
end

function Centurion_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Centurion_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(20140, 1, "Centurion_OnCombat")
RegisterUnitEvent(20140, 2, "Centurion_OnLeaveCombat")
RegisterUnitEvent(20140, 4, "Centurion_OnDied")