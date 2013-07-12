--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function KoltiraDeathweaver_OnCombat(Unit, Event)
	Unit:RegisterEvent("KoltiraDeathweaver_WorldofShadows", 5000, 1)
end

function KoltiraDeathweaver_WorldofShadows(Unit, Event) 
	Unit:CastSpell(47740) 
end

function KoltiraDeathweaver_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function KoltiraDeathweaver_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26581, 1, "KoltiraDeathweaver_OnCombat")
RegisterUnitEvent(26581, 2, "KoltiraDeathweaver_OnLeaveCombat")
RegisterUnitEvent(26581, 4, "KoltiraDeathweaver_OnDied")