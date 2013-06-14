--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function GormaroktheRavager_OnCombat(Unit, Event)
	Unit:RegisterEvent("GormaroktheRavager_Cleave", 4000, 0)
	Unit:RegisterEvent("GormaroktheRavager_Enrage", 120000, 0)
	Unit:RegisterEvent("GormaroktheRavager_MortalStrike", 6000, 0)
end

function GormaroktheRavager_Cleave(Unit, Event) 
	Unit:CastSpell(15496) 
end

function GormaroktheRavager_MortalStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(16856, Unit:GetMainTank()) 
end

function GormaroktheRavager_Enrage(Unit, Event) 
	if(Unit:GetHealthPct() < 25) then
		Unit:CastSpell(8599) 
	end
end

function GormaroktheRavager_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GormaroktheRavager_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12046, 1, "GormaroktheRavager_OnCombat")
RegisterUnitEvent(12046, 2, "GormaroktheRavager_OnLeaveCombat")
RegisterUnitEvent(12046, 4, "GormaroktheRavager_OnDied")