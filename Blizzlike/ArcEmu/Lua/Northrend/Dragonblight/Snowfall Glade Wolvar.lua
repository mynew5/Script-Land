--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SnowfallGladeWolvar_OnCombat(Unit, Event)
	Unit:RegisterEvent("SnowfallGladeWolvar_Net", 8000, 0)
	Unit:RegisterEvent("SnowfallGladeWolvar_ThrowSpear", 6000, 0)
end

function SnowfallGladeWolvar_Net(Unit, Event) 
	Unit:FullCastSpellOnTarget(6533, Unit:GetMainTank()) 
end

function SnowfallGladeWolvar_ThrowSpear(Unit, Event) 
	Unit:FullCastSpellOnTarget(43413, Unit:GetMainTank()) 
end

function SnowfallGladeWolvar_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SnowfallGladeWolvar_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26198, 1, "SnowfallGladeWolvar_OnCombat")
RegisterUnitEvent(26198, 2, "SnowfallGladeWolvar_OnLeaveCombat")
RegisterUnitEvent(26198, 4, "SnowfallGladeWolvar_OnDied")