--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Rockfang_OnCombat(Unit, Event)
	Unit:RegisterEvent("Rockfang_ChillingHowl", 10000, 0)
end

function Rockfang_ChillingHowl(Unit, Event) 
	Unit:CastSpell(32918) 
end

function Rockfang_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Rockfang_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25774, 1, "Rockfang_OnCombat")
RegisterUnitEvent(25774, 2, "Rockfang_OnLeaveCombat")
RegisterUnitEvent(25774, 4, "Rockfang_OnDied")