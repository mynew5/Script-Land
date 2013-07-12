--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Knight_OnCombat(Unit, Event)
end

function Knight_Heal(Unit, Event) 
	Unit:CastSpell(36476) 
end

function Knight_Enrage(Unit, Event) 
	Unit:CastSpell(8599) 
end

function Knight_Breaker(Unit, Event) 
	Unit:FullCastSpellOnTarget(35871, Unit:GetMainTank()) 
end

function Knight_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Knight_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(21089, 1, "Knight_OnCombat")
RegisterUnitEvent(21089, 2, "Knight_OnLeaveCombat")
RegisterUnitEvent(21089, 4, "Knight_OnDied")