--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function UnboundEnt_OnCombat(Unit, Event)
	Unit:RegisterEvent("UnboundEnt_CorruptedRejuvenation", 8000, 0)
	Unit:RegisterEvent("UnboundEnt_Thorns", 2000, 1)
end

function UnboundEnt_CorruptedRejuvenation(Unit, Event) 
	Unit:FullCastSpellOnTarget(58624, Unit:GetMainTank()) 
end

function UnboundEnt_Thorns(Unit, Event) 
	Unit:CastSpell(35361) 
end

function UnboundEnt_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function UnboundEnt_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(30862, 1, "UnboundEnt_OnCombat")
RegisterUnitEvent(30862, 2, "UnboundEnt_OnLeaveCombat")
RegisterUnitEvent(30862, 4, "UnboundEnt_OnDied")