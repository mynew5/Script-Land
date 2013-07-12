--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function AgedMagnataur_OnCombat(Unit, Event)
	Unit:RegisterEvent("AgedMagnataur_PlagueCloud", 2000, 2)
end

function AgedMagnataur_PlagueCloud(Unit, Event) 
	Unit:CastSpell(50366) 
end

function AgedMagnataur_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AgedMagnataur_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(24954, 1, "AgedMagnataur_OnCombat")
RegisterUnitEvent(24954, 2, "AgedMagnataur_OnLeaveCombat")
RegisterUnitEvent(24954, 4, "AgedMagnataur_OnDied")