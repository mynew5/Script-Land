--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ColdarraScalesworn_OnCombat(Unit, Event)
	Unit:RegisterEvent("ColdarraScalesworn_FrostNova", 10000, 0)
	Unit:RegisterEvent("ColdarraScalesworn_Rend", 8000, 0)
end

function ColdarraScalesworn_FrostNova(Unit, Event) 
	Unit:CastSpell(12748) 
end

function ColdarraScalesworn_Rend(Unit, Event) 
	Unit:FullCastSpellOnTarget(11977, Unit:GetMainTank()) 
end

function ColdarraScalesworn_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ColdarraScalesworn_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25717, 1, "ColdarraScalesworn_OnCombat")
RegisterUnitEvent(25717, 2, "ColdarraScalesworn_OnLeaveCombat")
RegisterUnitEvent(25717, 4, "ColdarraScalesworn_OnDied")