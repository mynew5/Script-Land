--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function HordeConscript_OnCombat(Unit, Event)
	Unit:RegisterEvent("HordeConscript_HeroicStrike", 8000, 0)
	Unit:RegisterEvent("HordeConscript_Shoot", 6000, 0)
end

function HordeConscript_HeroicStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(29426, Unit:GetMainTank()) 
end

function HordeConscript_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(15620, Unit:GetMainTank()) 
end

function HordeConscript_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HordeConscript_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27749, 1, "HordeConscript_OnCombat")
RegisterUnitEvent(27749, 2, "HordeConscript_OnLeaveCombat")
RegisterUnitEvent(27749, 4, "HordeConscript_OnDied")