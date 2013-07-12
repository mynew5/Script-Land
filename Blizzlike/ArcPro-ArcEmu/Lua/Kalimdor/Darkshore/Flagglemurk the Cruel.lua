--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function FlagglemurktheCruel_OnCombat(Unit, Event)
	Unit:RegisterEvent("FlagglemurktheCruel_Knockdown", 9000, 0)
	Unit:RegisterEvent("FlagglemurktheCruel_Strike", 6000, 0)
end

function FlagglemurktheCruel_Knockdown(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11428, 	pUnit:GetMainTank()) 
end

function FlagglemurktheCruel_Strike(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11976, 	pUnit:GetMainTank()) 
end

function FlagglemurktheCruel_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function FlagglemurktheCruel_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(7015, 1, "FlagglemurktheCruel_OnCombat")
RegisterUnitEvent(7015, 2, "FlagglemurktheCruel_OnLeaveCombat")
RegisterUnitEvent(7015, 4, "FlagglemurktheCruel_OnDied")