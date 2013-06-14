--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Vyle_OnCombat(Unit, Event)
	Unit:RegisterEvent("Shoot", 7000, 0)
	Unit:RegisterEvent("Shot", 14000, 0)
	Unit:RegisterEvent("Bomb", 21000, 0)
	Unit:RegisterEvent("Blink", 28000, 0)
end

function Shoot(pUnit, Event) 
	pUnit:CastSpellOnTarget(16100, Unit:GetRandomPlayer()) 
end

function Shot(pUnit, Event) 
	pUnit:CastSpellOnTarget(21390, pUnit:GetMainTank()) 
end

function Bomb(pUnit, Event) 
	pUnit:CastSpell(7964) 
end

function Blink(pUnit, Event) 
	pUnit:CastSpell(21655) 
end

function Vyle_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Vyle_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12236, 1, "Vyle_OnCombat")
RegisterUnitEvent(12236, 2, "Vyle_OnLeaveCombat")
RegisterUnitEvent(12236, 4, "Vyle_OnDied")