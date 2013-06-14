--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function BloodShade_OnCombat(Unit, Event)
	Unit:RegisterEvent("BloodShade_VexedBloodoftheAncestors", 6000, 0)
end

function BloodShade_VexedBloodoftheAncestors(Unit, Event) 
	Unit:FullCastSpellOnTarget(49843, Unit:GetMainTank()) 
end

function BloodShade_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BloodShade_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(24872, 1, "BloodShade_OnCombat")
RegisterUnitEvent(24872, 2, "BloodShade_OnLeaveCombat")
RegisterUnitEvent(24872, 4, "BloodShade_OnDied")