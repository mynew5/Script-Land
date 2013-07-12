--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SnowfallElk_OnCombat(Unit, Event)
	Unit:RegisterEvent("SnowfallElk_Puncture", 5000, 0)
end

function SnowfallElk_Puncture(Unit, Event) 
	Unit:FullCastSpellOnTarget(15976, Unit:GetMainTank()) 
end

function SnowfallElk_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SnowfallElk_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26615, 1, "SnowfallElk_OnCombat")
RegisterUnitEvent(26615, 2, "SnowfallElk_OnLeaveCombat")
RegisterUnitEvent(26615, 4, "SnowfallElk_OnDied")