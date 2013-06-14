--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ConquestHoldRaider_OnCombat(Unit, Event)
	Unit:RegisterEvent("ConquestHoldRaider_DemoralizingShout", 3000, 1)
	Unit:RegisterEvent("ConquestHoldRaider_HeroicStrike", 5000, 0)
	Unit:RegisterEvent("ConquestHoldRaider_Intercept", 9000, 0)
end

function ConquestHoldRaider_DemoralizingShout(Unit, Event) 
	Unit:CastSpell(13730) 
end

function ConquestHoldRaider_HeroicStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(25710, Unit:GetMainTank()) 
end

function ConquestHoldRaider_Intercept(Unit, Event) 
	Unit:FullCastSpellOnTarget(27577, Unit:GetMainTank()) 
end

function ConquestHoldRaider_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ConquestHoldRaider_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27118, 1, "ConquestHoldRaider_OnCombat")
RegisterUnitEvent(27118, 2, "ConquestHoldRaider_OnLeaveCombat")
RegisterUnitEvent(27118, 4, "ConquestHoldRaider_OnDied")