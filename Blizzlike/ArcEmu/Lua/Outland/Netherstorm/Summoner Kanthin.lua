--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Summoner_Kanthin_OnCombat(Unit, Event)
	Unit:RegisterEvent("Summoner_Kanthin_Fireball", 4000, 0)
	Unit:RegisterEvent("Summoner_Kanthin_Nova", 10000, 0)
	Unit:RegisterEvent("Summoner_Kanthin_Pyroblast", 7000, 0)
end

function Summoner_Kanthin_Fireball(Unit, Event)
	Unit:FullCastSpellOnTarget(19816, Unit:ClosestPlayer())
end

function Summoner_Kanthin_Nova(Unit, Event)
	Unit:FullCastSpellOnTarget(19657, Unit:MainTank())
end

function Summoner_Kanthin_Pyroblast(Unit, Event)
	Unit:FullCastSpellOnTarget(17273, Unit:ClosestPlayer())
end

function Summoner_Kanthin_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Summoner_Kanthin_OnDeath(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19657, 1, "Summoner_Kanthin_OnCombat")
RegisterUnitEvent(19657, 2, "Summoner_Kanthin_OnLeaveCombat")
RegisterUnitEvent(19657, 4, "Summoner_Kanthin_OnDeath")