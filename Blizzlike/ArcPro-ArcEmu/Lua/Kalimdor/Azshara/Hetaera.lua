--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Hetaera_OnCombat(Unit, Event)
	Unit:RegisterEvent("Hetaera_InfectedBite", 8000, 0)
end

function Hetaera_InfectedBite(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12542, 	pUnit:GetMainTank()) 
end

function Hetaera_Thrash(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(3391, 	pUnit:GetMainTank()) 
end

function Hetaera_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Hetaera_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6140, 1, "Hetaera_OnCombat")
RegisterUnitEvent(6140, 2, "Hetaera_OnLeaveCombat")
RegisterUnitEvent(6140, 4, "Hetaera_OnDied")