--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function GuardianSerpent_OnCombat(Unit, Event)
	Unit:RegisterEvent("GuardianSerpent_TailLash", 6000, 0)
end

function GuardianSerpent_TailLash(Unit, Event) 
	Unit:FullCastSpellOnTarget(34811, Unit:GetMainTank()) 
end

function GuardianSerpent_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GuardianSerpent_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26806, 1, "GuardianSerpent_OnCombat")
RegisterUnitEvent(26806, 2, "GuardianSerpent_OnLeaveCombat")
RegisterUnitEvent(26806, 4, "GuardianSerpent_OnDied")