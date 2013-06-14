--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Voidshrieker_OnCombat(Unit, Event)
	Unit:RegisterEvent("Voidshrieker_Spawn", 8000, 0)
	Unit:RegisterEvent("Voidshrieker_Bolt", 6000, 0)
end

function Voidshrieker_Spawn(Unit, Event) 
	Unit:CastSpell(34302) 
end

function Voidshrieker_Bolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(34344, Unit:GetMainTank()) 
end

function Voidshrieker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Voidshrieker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(18870, 1, "Voidshrieker_OnCombat")
RegisterUnitEvent(18870, 2, "Voidshrieker_OnLeaveCombat")
RegisterUnitEvent(18870, 4, "Voidshrieker_OnDied")