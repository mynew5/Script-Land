--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function WindTraderMufah_OnCombat(Unit, Event)
	Unit:RegisterEvent("WindTraderMufah_Typhoon", 4000, 1)
end

function WindTraderMufah_Typhoon(Unit, Event) 
	Unit:CastSpell(51817) 
end

function WindTraderMufah_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WindTraderMufah_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26496, 1, "WindTraderMufah_OnCombat")
RegisterUnitEvent(26496, 2, "WindTraderMufah_OnLeaveCombat")
RegisterUnitEvent(26496, 4, "WindTraderMufah_OnDied")