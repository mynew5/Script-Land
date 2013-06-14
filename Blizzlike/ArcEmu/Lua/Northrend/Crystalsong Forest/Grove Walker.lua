--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function GroveWalker_OnCombat(Unit, Event)
	Unit:RegisterEvent("GroveWalker_Rejuvenation", 12000, 0)
	Unit:RegisterEvent("GroveWalker_Thorns", 2000, 1)
end

function GroveWalker_Rejuvenation(Unit, Event) 
	Unit:CastSpell(15981) 
end

function GroveWalker_Thorns(Unit, Event) 
	Unit:CastSpell(35361) 
end

function GroveWalker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GroveWalker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(31228, 1, "GroveWalker_OnCombat")
RegisterUnitEvent(31228, 2, "GroveWalker_OnLeaveCombat")
RegisterUnitEvent(31228, 4, "GroveWalker_OnDied")