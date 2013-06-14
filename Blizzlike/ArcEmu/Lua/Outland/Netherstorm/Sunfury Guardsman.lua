--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Guardsman_OnCombat(Unit, Event)
	Unit:RegisterEvent("Guardsman_Enrage", 25000, 0)
	Unit:RegisterEvent("Guardsman_Mark", 10000, 0)
end

function Guardsman_Enrage(Unit, Event) 
	Unit:CastSpell(8599) 
end

function Guardsman_Mark(Unit, Event) 
	Unit:FullCastSpellOnTarget(35877, Unit:GetMainTank()) 
end

function Guardsman_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Guardsman_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(18850, 1, "Guardsman_OnCombat")
RegisterUnitEvent(18850, 2, "Guardsman_OnLeaveCombat")
RegisterUnitEvent(18850, 4, "Guardsman_OnDied")