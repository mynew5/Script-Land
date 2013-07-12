--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function WoundedWestfallInfantry_OnCombat(Unit, Event)
	Unit:RegisterEvent("WoundedWestfallInfantry_HolyShock", 6000, 0)
	Unit:RegisterEvent("WoundedWestfallInfantry_SealofCommand", 4000, 1)
end

function WoundedWestfallInfantry_HolyShock(Unit, Event) 
	Unit:FullCastSpellOnTarget(32771, Unit:GetMainTank()) 
end

function WoundedWestfallInfantry_SealofCommand(Unit, Event) 
	Unit:CastSpell(29385) 
end

function WoundedWestfallInfantry_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WoundedWestfallInfantry_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27482, 1, "WoundedWestfallInfantry_OnCombat")
RegisterUnitEvent(27482, 2, "WoundedWestfallInfantry_OnLeaveCombat")
RegisterUnitEvent(27482, 4, "WoundedWestfallInfantry_OnDied")