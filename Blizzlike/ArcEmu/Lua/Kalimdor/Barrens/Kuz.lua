--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Kuz_OnCombat(Unit, Event)
	Unit:RegisterEvent("Kuz_FireBlast", 8000, 0)
	Unit:RegisterEvent("Kuz_FrostNova", 10000, 0)
	Unit:RegisterEvent("Kuz_Frostbolt", 4000, 0)
end

function Kuz_FireBlast(Unit, Event) 
	Unit:FullCastSpellOnTarget(20795, Unit:GetMainTank()) 
end

function Kuz_FrostNova(Unit, Event) 
	Unit:CastSpell(11831) 
end

function Kuz_Frostbolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(20792, Unit:GetMainTank()) 
end

function Kuz_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Kuz_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3436, 1, "Kuz_OnCombat")
RegisterUnitEvent(3436, 2, "Kuz_OnLeaveCombat")
RegisterUnitEvent(3436, 4, "Kuz_OnDied")