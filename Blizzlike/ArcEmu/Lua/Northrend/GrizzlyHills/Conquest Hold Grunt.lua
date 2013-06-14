--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ConquestHoldGrunt_OnCombat(Unit, Event)
	Unit:RegisterEvent("ConquestHoldGrunt_DemoralizingShout", 3000, 1)
	Unit:RegisterEvent("ConquestHoldGrunt_HeroicStrike", 5000, 0)
	Unit:RegisterEvent("ConquestHoldGrunt_Intercept", 9000, 0)
end

function ConquestHoldGrunt_DemoralizingShout(Unit, Event) 
	Unit:CastSpell(13730) 
end

function ConquestHoldGrunt_HeroicStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(25710, Unit:GetMainTank()) 
end

function ConquestHoldGrunt_Intercept(Unit, Event) 
	Unit:FullCastSpellOnTarget(27577, Unit:GetMainTank()) 
end

function ConquestHoldGrunt_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ConquestHoldGrunt_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27470, 1, "ConquestHoldGrunt_OnCombat")
RegisterUnitEvent(27470, 2, "ConquestHoldGrunt_OnLeaveCombat")
RegisterUnitEvent(27470, 4, "ConquestHoldGrunt_OnDied")