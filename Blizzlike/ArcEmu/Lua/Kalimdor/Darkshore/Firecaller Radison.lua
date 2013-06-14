--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function FirecallerRadison_OnCombat(Unit, Event)
	Unit:RegisterEvent("FirecallerRadison_Crazed", 2000, 1)
	Unit:RegisterEvent("FirecallerRadison_FireNova", 7000, 0)
	Unit:RegisterEvent("FirecallerRadison_Fireball", 8000, 0)
end

function FirecallerRadison_Crazed(pUnit, Event) 
	pUnit:CastSpell(5915) 
end

function FirecallerRadison_FireNova(pUnit, Event) 
	pUnit:CastSpell(11969) 
end

function FirecallerRadison_Fireball(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(20793, 	pUnit:GetMainTank()) 
end

function FirecallerRadison_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function FirecallerRadison_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2192, 1, "FirecallerRadison_OnCombat")
RegisterUnitEvent(2192, 2, "FirecallerRadison_OnLeaveCombat")
RegisterUnitEvent(2192, 4, "FirecallerRadison_OnDied")