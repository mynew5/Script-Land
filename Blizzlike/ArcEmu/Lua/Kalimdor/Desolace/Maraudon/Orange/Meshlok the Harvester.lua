--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Meshlok_OnCombat(Unit, Event)
	Unit:RegisterEvent("Strike", 7000, 0)
	Unit:RegisterEvent("Stomp", 14000, 0)
end

function Strike(pUnit, Event) 
	pUnit:CastSpellOnTarget(13446, Unit:GetRandomPlayer()) 
end

function Stomp(pUnit, Event) 
	pUnit:CastSpell(15593) 
end

function Meshlok_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Meshlok_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12237, 1, "Meshlok_OnCombat")
RegisterUnitEvent(12237, 2, "Meshlok_OnLeaveCombat")
RegisterUnitEvent(12237, 4, "Meshlok_OnDied")