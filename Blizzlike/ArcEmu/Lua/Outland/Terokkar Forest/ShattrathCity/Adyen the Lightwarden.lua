--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Lightwarden_OnCombat(Unit, Event)
	Unit:RegisterEvent("Lightwarden_Strike", 6000, 0)
	Unit:RegisterEvent("Lightwarden_Hammer", 1000, 0)
	Unit:RegisterEvent("Lightwarden_Heal", 7000, 0)
end

function Lightwarden_Strike(Unit, Event) 
	Unit:FullCastSpellOnTarget(14518, 	Unit:GetMainTank()) 
end

function Lightwarden_Hammer(Unit, Event) 
	Unit:FullCastSpellOnTarget(13005, 	Unit:GetMainTank()) 
end

function Lightwarden_Heal(Unit, Event) 
	Unit:CastSpell(13952) 
end

function Lightwarden_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Lightwarden_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(18537, 1, "Lightwarden_OnCombat")
RegisterUnitEvent(18537, 2, "Lightwarden_OnLeaveCombat")
RegisterUnitEvent(18537, 4, "Lightwarden_OnDied")