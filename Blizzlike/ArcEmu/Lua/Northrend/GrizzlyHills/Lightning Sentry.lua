--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function LightningSentry_OnCombat(Unit, Event)
	Unit:RegisterEvent("LightningSentry_ChargedSentryTotem", 4000, 1)
end

function LightningSentry_ChargedSentryTotem(Unit, Event) 
	Unit:CastSpell(52703) 
end

function LightningSentry_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function LightningSentry_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26407, 1, "LightningSentry_OnCombat")
RegisterUnitEvent(26407, 2, "LightningSentry_OnLeaveCombat")
RegisterUnitEvent(26407, 4, "LightningSentry_OnDied")