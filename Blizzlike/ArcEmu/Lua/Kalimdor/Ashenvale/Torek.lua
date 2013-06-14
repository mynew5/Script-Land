--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Torek_OnCombat(Unit, Event)
	Unit:RegisterEvent("Torek_Rend", 8000, 0)
	Unit:RegisterEvent("Torek_Thunderclap", 10000, 0)
end

function Torek_Rend(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11977, pUnit:GetMainTank()) 
end

function Torek_Thunderclap(pUnit, Event) 
	pUnit:CastSpell(8078) 
end

function Torek_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Torek_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12858, 1, "Torek_OnCombat")
RegisterUnitEvent(12858, 2, "Torek_OnLeaveCombat")
RegisterUnitEvent(12858, 4, "Torek_OnDied")