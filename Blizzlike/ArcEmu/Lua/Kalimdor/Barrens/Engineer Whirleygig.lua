--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function EngineerWhirleygig_OnCombat(Unit, Event)
	Unit:RegisterEvent("EngineerWhirleygig_CompactHarvestReaper", 4000, 1)
	Unit:RegisterEvent("EngineerWhirleygig_ExplosiveSheep", 10000, 1)
end

function EngineerWhirleygig_CompactHarvestReaper(Unit, Event) 
	Unit:CastSpell(7979) 
end

function EngineerWhirleygig_ExplosiveSheep(Unit, Event) 
	Unit:CastSpell(8209) 
end

function EngineerWhirleygig_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function EngineerWhirleygig_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5836, 1, "EngineerWhirleygig_OnCombat")
RegisterUnitEvent(5836, 2, "EngineerWhirleygig_OnLeaveCombat")
RegisterUnitEvent(5836, 4, "EngineerWhirleygig_OnDied")