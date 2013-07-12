--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Icoshock_OnCombat(Unit, Event)
	Unit:RegisterEvent("Icoshock_Surge", 7000, 0)
	Unit:RegisterEvent("Icoshock_Drain", 1000, 1)
end

function Icoshock_Surge(Unit, Event) 
	Unit:FullCastSpellOnTarget(36517, Unit:GetMainTank()) 
end

function Icoshock_Drain(Unit, Event) 
	Unit:CastSpell(36515) 
end

function Icoshock_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Icoshock_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(20770, 1, "Icoshock_OnCombat")
RegisterUnitEvent(20770, 2, "Icoshock_OnLeaveCombat")
RegisterUnitEvent(20770, 4, "Icoshock_OnDied")