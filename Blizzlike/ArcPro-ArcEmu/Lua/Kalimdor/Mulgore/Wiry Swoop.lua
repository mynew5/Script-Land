--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function WirySwoop_OnCombat(Unit, Event)
	Unit:RegisterEvent("WirySwoop_Swoop", 6000, 0)
end

function WirySwoop_WirySwoop(pUnit, Event) 
	pUnit:CastSpell(5708) 
end

function WirySwoop_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WirySwoop_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2969, 1, "WirySwoop_OnCombat")
RegisterUnitEvent(2969, 2, "WirySwoop_OnLeaveCombat")
RegisterUnitEvent(2969, 4, "WirySwoop_OnDied")