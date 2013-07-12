--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BlackHer0; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Chaser_OnCombat(Unit, Event)
	Unit:RegisterEvent("Chaser_Invisible", 15000, 0)
	Unit:RegisterEvent("Chaser_Bite", 4000, 0)
	Unit:RegisterEvent("Chaser_Warp", 7000, 0)
	Unit:RegisterEvent("Chaser_WarpCharge", 5000, 0)
end

function Chaser_Invisible(Unit, Event) 
	Unit:CastSpell(32943) 
end

function Chaser_Bite(Unit, Event) 
	Unit:FullCastSpellOnTarget(32739, Unit:GetMainTank()) 
end

function Chaser_Warp(Unit, Event) 
	Unit:CastSpell(32920) 
end

function Chaser_WarpCharge(Unit, Event) 
	Unit:FullCastSpellOnTarget(37417, Unit:GetMainTank()) 
end

function Chaser_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Chaser_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(18884, 1, "Chaser_OnCombat")
RegisterUnitEvent(18884, 2, "Chaser_OnLeaveCombat")
RegisterUnitEvent(18884, 4, "Chaser_OnDied")