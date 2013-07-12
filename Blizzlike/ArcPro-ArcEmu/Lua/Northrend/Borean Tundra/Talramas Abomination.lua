--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function TalramasAbomination_OnCombat(Unit, Event)
	Unit:RegisterEvent("TalramasAbomination_PlagueCloud", 2000, 2)
end

function TalramasAbomination_PlagueCloud(Unit, Event) 
	Unit:CastSpell(50366) 
end

function TalramasAbomination_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TalramasAbomination_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25684, 1, "TalramasAbomination_OnCombat")
RegisterUnitEvent(25684, 2, "TalramasAbomination_OnLeaveCombat")
RegisterUnitEvent(25684, 4, "TalramasAbomination_OnDied")