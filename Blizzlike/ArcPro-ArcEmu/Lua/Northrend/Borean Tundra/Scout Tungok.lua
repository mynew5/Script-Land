--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ScoutTungok_OnCombat(Unit, Event)
	Unit:RegisterEvent("ScoutTungok_Enrage", 10000, 0)
end

function ScoutTungok_Enrage(Unit, Event) 
	Unit:CastSpell(8599) 
end

function ScoutTungok_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ScoutTungok_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25440, 1, "ScoutTungok_OnCombat")
RegisterUnitEvent(25440, 2, "ScoutTungok_OnLeaveCombat")
RegisterUnitEvent(25440, 4, "ScoutTungok_OnDied")