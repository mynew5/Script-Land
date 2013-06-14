--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function LongrunnerProudhoof_OnCombat(Unit, Event)
	Unit:RegisterEvent("LongrunnerProudhoof_DemoralizingShout", 2000, 2)
	Unit:RegisterEvent("LongrunnerProudhoof_ForcefulCleave", 8000, 0)
end

function LongrunnerProudhoof_DemoralizingShout(Unit, Event) 
	Unit:CastSpell(13730) 
end

function LongrunnerProudhoof_ForcefulCleave(Unit, Event) 
	Unit:CastSpell(35473) 
end

function LongrunnerProudhoof_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function LongrunnerProudhoof_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25335, 1, "LongrunnerProudhoof_OnCombat")
RegisterUnitEvent(25335, 2, "LongrunnerProudhoof_OnLeaveCombat")
RegisterUnitEvent(25335, 4, "LongrunnerProudhoof_OnDied")