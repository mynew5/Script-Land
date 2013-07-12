--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Icefist_OnCombat(Unit, Event)
	Unit:RegisterEvent("Icefist_IceSlash", 6000, 0)
	Unit:RegisterEvent("Icefist_TuskStrike", 8000, 0)
end

function Icefist_IceSlash(Unit, Event) 
	Unit:FullCastSpellOnTarget(51878, Unit:GetMainTank()) 
end

function Icefist_TuskStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(50410, Unit:GetMainTank()) 
end

function Icefist_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Icefist_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27004, 1, "Icefist_OnCombat")
RegisterUnitEvent(27004, 2, "Icefist_OnLeaveCombat")
RegisterUnitEvent(27004, 4, "Icefist_OnDied")