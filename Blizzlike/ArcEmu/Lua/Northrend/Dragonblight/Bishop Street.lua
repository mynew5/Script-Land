--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function BishopStreet_OnCombat(Unit, Event)
	Unit:RegisterEvent("BishopStreet_HolySmite", 5000, 0)
	Unit:RegisterEvent("BishopStreet_PowerWordShield", 2000, 1)
end

function BishopStreet_HolySmite(Unit, Event) 
	Unit:FullCastSpellOnTarget(20820, Unit:GetMainTank()) 
end

function BishopStreet_PowerWordShield(Unit, Event) 
	Unit:CastSpell(11974) 
end

function BishopStreet_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BishopStreet_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27246, 1, "BishopStreet_OnCombat")
RegisterUnitEvent(27246, 2, "BishopStreet_OnLeaveCombat")
RegisterUnitEvent(27246, 4, "BishopStreet_OnDied")