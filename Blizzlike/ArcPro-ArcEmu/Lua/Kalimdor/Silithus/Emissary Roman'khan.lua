--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function EmissaryRomankhan_OnCombat(Unit, Event)
	Unit:RegisterEvent("EmissaryRomankhan_Wilt", 15000, 0)
end

function EmissaryRomankhan_Wilt(Unit, Event) 
	Unit:CastSpell(23772) 
end

function EmissaryRomankhan_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function EmissaryRomankhan_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14862, 1, "EmissaryRomankhan_OnCombat")
RegisterUnitEvent(14862, 2, "EmissaryRomankhan_OnLeaveCombat")
RegisterUnitEvent(14862, 4, "EmissaryRomankhan_OnDied")