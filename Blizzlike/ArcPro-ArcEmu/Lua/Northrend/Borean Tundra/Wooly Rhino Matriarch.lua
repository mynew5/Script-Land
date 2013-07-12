--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function WoolyRhinoMatriarch_OnCombat(Unit, Event)
	Unit:RegisterEvent("WoolyRhinoMatriarch_ThickHide", 4000, 1)
end

function WoolyRhinoMatriarch_ThickHide(Unit, Event) 
	Unit:CastSpell(50502) 
end

function WoolyRhinoMatriarch_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WoolyRhinoMatriarch_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25487, 1, "WoolyRhinoMatriarch_OnCombat")
RegisterUnitEvent(25487, 2, "WoolyRhinoMatriarch_OnLeaveCombat")
RegisterUnitEvent(25487, 4, "WoolyRhinoMatriarch_OnDied")