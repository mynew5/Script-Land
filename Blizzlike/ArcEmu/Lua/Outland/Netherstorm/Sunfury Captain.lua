--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Captain_OnCombat(Unit, Event)
	Unit:RegisterEvent("Captain_Shout", 1000, 3)
	Unit:RegisterEvent("Captain_Enrage", 25000, 1)
	Unit:RegisterEvent("Captain_Breaker", 10000, 0)
	Unit:RegisterEvent("Captain_Breaker", 10000, 0)
end

function Captain_Shout(Unit, Event) 
	Unit:CastSpellOnTarget(32064, Unit:GetRandomFriend(0)) 
end

function Captain_Enrage(Unit, Event) 
	Unit:CastSpell(8599) 
end

function Captain_Breaker(Unit, Event) 
	Unit:CastSpell(35871) 
end

function Captain_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Captain_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(19453, 1, "Captain_OnCombat")
RegisterUnitEvent(19453, 2, "Captain_OnLeaveCombat")
RegisterUnitEvent(19453, 4, "Captain_OnDied")