--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function MammothCalf_OnCombat(Unit, Event)
	Unit:RegisterEvent("MammothCalf_Trample", 6000, 0)
end

function MammothCalf_Trample(Unit, Event) 
	Unit:CastSpell(15550) 
end

function MammothCalf_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MammothCalf_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(24613, 1, "MammothCalf_OnCombat")
RegisterUnitEvent(24613, 2, "MammothCalf_OnLeaveCombat")
RegisterUnitEvent(24613, 4, "MammothCalf_OnDied")