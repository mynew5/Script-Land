--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SteamRager_OnCombat(Unit, Event)
	Unit:RegisterEvent("SteamRager_SteamBlast", 8000, 0)
end

function SteamRager_SteamBlast(Unit, Event) 
	Unit:FullCastSpellOnTarget(50375, Unit:GetMainTank()) 
end

function SteamRager_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SteamRager_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(24601, 1, "SteamRager_OnCombat")
RegisterUnitEvent(24601, 2, "SteamRager_OnLeaveCombat")
RegisterUnitEvent(24601, 4, "SteamRager_OnDied")