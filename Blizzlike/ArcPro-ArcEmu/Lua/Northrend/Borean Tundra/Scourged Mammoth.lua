--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ScourgedMammoth_OnCombat(Unit, Event)
	Unit:RegisterEvent("ScourgedMammoth_Trample", 6000, 0)
end

function ScourgedMammoth_Trample(Unit, Event) 
	Unit:CastSpell(15550)
end

function ScourgedMammoth_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ScourgedMammoth_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25452, 1, "ScourgedMammoth_OnCombat")
RegisterUnitEvent(25452, 2, "ScourgedMammoth_OnLeaveCombat")
RegisterUnitEvent(25452, 4, "ScourgedMammoth_OnDied")