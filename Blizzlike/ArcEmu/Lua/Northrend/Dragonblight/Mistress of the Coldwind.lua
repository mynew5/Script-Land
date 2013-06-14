--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function MistressoftheColdwind_OnCombat(Unit, Event)
	Unit:RegisterEvent("MistressoftheColdwind_ArcticWinds", 6500, 0)
	Unit:RegisterEvent("MistressoftheColdwind_Renew", 18000, 0)
end

function MistressoftheColdwind_ArcticWinds(Unit, Event) 
	Unit:FullCastSpellOnTarget(52814, Unit:GetMainTank()) 
end

function MistressoftheColdwind_Renew(Unit, Event) 
	Unit:CastSpell(38210) 
end

function MistressoftheColdwind_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MistressoftheColdwind_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26578, 1, "MistressoftheColdwind_OnCombat")
RegisterUnitEvent(26578, 2, "MistressoftheColdwind_OnLeaveCombat")
RegisterUnitEvent(26578, 4, "MistressoftheColdwind_OnDied")