--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DispiritedEnt_OnCombat(Unit, Event)
	Unit:RegisterEvent("DispiritedEnt_Rejuvenation", 12000, 0)
	Unit:RegisterEvent("DispiritedEnt_Thorns", 2000, 1)
end

function DispiritedEnt_Rejuvenation(Unit, Event) 
	Unit:CastSpell(15981) 
end

function DispiritedEnt_Thorns(Unit, Event) 
	Unit:CastSpell(35361) 
end

function DispiritedEnt_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DispiritedEnt_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(31041, 1, "DispiritedEnt_OnCombat")
RegisterUnitEvent(31041, 2, "DispiritedEnt_OnLeaveCombat")
RegisterUnitEvent(31041, 4, "DispiritedEnt_OnDied")