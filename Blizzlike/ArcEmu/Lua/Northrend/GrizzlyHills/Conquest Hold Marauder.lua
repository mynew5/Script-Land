--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ConquestHoldMarauder_OnCombat(Unit, Event)
	Unit:RegisterEvent("ConquestHoldMarauder_DemoralizingShout", 3000, 1)
	Unit:RegisterEvent("ConquestHoldMarauder_HeroicStrike", 5000, 0)
	Unit:RegisterEvent("ConquestHoldMarauder_Intercept", 9000, 0)
end

function ConquestHoldMarauder_DemoralizingShout(Unit, Event) 
	Unit:CastSpell(13730) 
end

function ConquestHoldMarauder_HeroicStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(25710, Unit:GetMainTank()) 
end

function ConquestHoldMarauder_Intercept(Unit, Event) 
	Unit:FullCastSpellOnTarget(27577, Unit:GetMainTank()) 
end

function ConquestHoldMarauder_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ConquestHoldMarauder_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27424, 1, "ConquestHoldMarauder_OnCombat")
RegisterUnitEvent(27424, 2, "ConquestHoldMarauder_OnLeaveCombat")
RegisterUnitEvent(27424, 4, "ConquestHoldMarauder_OnDied")