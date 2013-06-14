--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function AchelliostheBanished_OnCombat(Unit, Event)
	Unit:RegisterEvent("AchelliostheBanished_BattleShout", 1000, 1)
end

function AchelliostheBanished_BattleShout(Unit, Event) 
	Unit:CastSpell(6192) 
end

function AchelliostheBanished_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AchelliostheBanished_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5933, 1, "AchelliostheBanished_OnCombat")
RegisterUnitEvent(5933, 2, "AchelliostheBanished_OnLeaveCombat")
RegisterUnitEvent(5933, 4, "AchelliostheBanished_OnDied")