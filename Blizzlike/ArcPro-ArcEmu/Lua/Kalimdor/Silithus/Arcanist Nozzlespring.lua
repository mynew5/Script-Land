--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ArcanistNozzlespring_OnCombat(Unit, Event)
	Unit:RegisterEvent("ArcanistNozzlespring_ArcaneMissiles", 8000, 0)
	Unit:RegisterEvent("ArcanistNozzlespring_Fireball", 12000, 0)
end

function ArcanistNozzlespring_ArcaneMissiles(Unit, Event) 
	Unit:FullCastSpellOnTarget(15791, Unit:GetRandomPlayer(0)) 
end

function ArcanistNozzlespring_Fireball(Unit, Event) 
	Unit:FullCastSpellOnTarget(13375, Unit:GetMainTank()) 
end

function ArcanistNozzlespring_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ArcanistNozzlespring_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(15444, 1, "ArcanistNozzlespring_OnCombat")
RegisterUnitEvent(15444, 2, "ArcanistNozzlespring_OnLeaveCombat")
RegisterUnitEvent(15444, 4, "ArcanistNozzlespring_OnDied")