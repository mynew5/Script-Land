--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Bloodwarder_OnCombat(Unit, Event)
	Unit:RegisterEvent("Bloodwarder_Enrage", 25000, 1)
	Unit:RegisterEvent("Bloodwarder_Mark", 10000, 0)
end

function Bloodwarder_Enrage(Unit, Event) 
	Unit:CastSpell(8599) 
end

function Bloodwarder_Mark(Unit, Event) 
	Unit:FullCastSpellOnTarget(35877, Unit:GetMainTank()) 
end

function Bloodwarder_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Bloodwarder_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(18853, 1, "Bloodwarder_OnCombat")
RegisterUnitEvent(18853, 2, "Bloodwarder_OnLeaveCombat")
RegisterUnitEvent(18853, 4, "Bloodwarder_OnDied")