--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function GorlocSteamBelcher_OnCombat(Unit, Event)
	Unit:RegisterEvent("GorlocSteamBelcher_BelchBlast", 7000, 0)
end

function GorlocSteamBelcher_BelchBlast(Unit, Event) 
	Unit:FullCastSpellOnTarget(50538, Unit:GetMainTank()) 
end

function GorlocSteamBelcher_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GorlocSteamBelcher_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25687, 1, "GorlocSteamBelcher_OnCombat")
RegisterUnitEvent(25687, 2, "GorlocSteamBelcher_OnLeaveCombat")
RegisterUnitEvent(25687, 4, "GorlocSteamBelcher_OnDied")