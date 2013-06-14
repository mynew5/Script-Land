--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function GromthartheThunderbringer_OnCombat(Unit, Event)
	Unit:RegisterEvent("GromthartheThunderbringer_MagnataurCharge", 8000, 0)
	Unit:RegisterEvent("GromthartheThunderbringer_Thunder", 10000, 0)
end

function GromthartheThunderbringer_MagnataurCharge(Unit, Event) 
	Unit:FullCastSpellOnTarget(52169, Unit:GetMainTank()) 
end

function GromthartheThunderbringer_Thunder(Unit, Event) 
	Unit:CastSpell(52166) 
end

function GromthartheThunderbringer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GromthartheThunderbringer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27002, 1, "GromthartheThunderbringer_OnCombat")
RegisterUnitEvent(27002, 2, "GromthartheThunderbringer_OnLeaveCombat")
RegisterUnitEvent(27002, 4, "GromthartheThunderbringer_OnDied")