--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function BlacksmithGoodman_OnCombat(Unit, Event)
	Unit:RegisterEvent("BlacksmithGoodman_CrushArmor", 6000, 0)
	Unit:RegisterEvent("BlacksmithGoodman_SkullCrack", 8000, 0)
end

function BlacksmithGoodman_CrushArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(33661, Unit:GetMainTank()) 
end

function BlacksmithGoodman_SkullCrack(Unit, Event) 
	Unit:FullCastSpellOnTarget(15621, Unit:GetMainTank()) 
end

function BlacksmithGoodman_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BlacksmithGoodman_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27234, 1, "BlacksmithGoodman_OnCombat")
RegisterUnitEvent(27234, 2, "BlacksmithGoodman_OnLeaveCombat")
RegisterUnitEvent(27234, 4, "BlacksmithGoodman_OnDied")