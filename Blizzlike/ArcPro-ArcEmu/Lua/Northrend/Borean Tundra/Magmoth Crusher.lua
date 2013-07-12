--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function MagmothCrusher_OnCombat(Unit, Event)
	Unit:RegisterEvent("MagmothCrusher_MagnataurCharge", 8000, 0)
	Unit:RegisterEvent("MagmothCrusher_TuskStrike", 7000, 0)
end

function MagmothCrusher_MagnataurCharge(Unit, Event) 
	Unit:CastSpell(50413) 
end

function MagmothCrusher_TuskStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(50410, Unit:GetMainTank()) 
end

function MagmothCrusher_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MagmothCrusher_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25434, 1, "MagmothCrusher_OnCombat")
RegisterUnitEvent(25434, 2, "MagmothCrusher_OnLeaveCombat")
RegisterUnitEvent(25434, 4, "MagmothCrusher_OnDied")