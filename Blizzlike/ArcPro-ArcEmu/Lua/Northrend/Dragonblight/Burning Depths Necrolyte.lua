--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function BurningDepthsNecrolyte_OnCombat(Unit, Event)
	Unit:RegisterEvent("BurningDepthsNecrolyte_DestructiveStrike", 6000, 0)
	Unit:RegisterEvent("BurningDepthsNecrolyte_ObsidianEssence", 2000, 1)
end

function BurningDepthsNecrolyte_DestructiveStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(51430, Unit:GetMainTank()) 
end

function BurningDepthsNecrolyte_ObsidianEssence(Unit, Event) 
	Unit:CastSpell(48616) 
end

function BurningDepthsNecrolyte_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BurningDepthsNecrolyte_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27356, 1, "BurningDepthsNecrolyte_OnCombat")
RegisterUnitEvent(27356, 2, "BurningDepthsNecrolyte_OnLeaveCombat")
RegisterUnitEvent(27356, 4, "BurningDepthsNecrolyte_OnDied")