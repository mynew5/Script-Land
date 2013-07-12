--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Bodyguard_OnCombat(Unit, Event)
	Unit:RegisterEvent("Bodyguard_Demoralize", 10000, 0)
	Unit:RegisterEvent("Bodyguard_Rend", 6000, 0)
end

function Bodyguard_Demoralize(Unit, Event) 
	Unit:FullCastSpellOnTarget(13730, Unit:GetClosestPlayer()) 
end

function Bodyguard_Rend(Unit, Event) 
	Unit:FullCastSpellOnTarget(11977, Unit:GetMainTank()) 
end

function Bodyguard_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Bodyguard_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(18483, 1, "Bodyguard_OnCombat")
RegisterUnitEvent(18483, 2, "Bodyguard_OnLeaveCombat")
RegisterUnitEvent(18483, 4, "Bodyguard_OnDied")