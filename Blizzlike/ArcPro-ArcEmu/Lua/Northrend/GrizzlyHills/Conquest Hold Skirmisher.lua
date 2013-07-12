--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ConquestHoldSkirmisher_OnCombat(Unit, Event)
	Unit:RegisterEvent("ConquestHoldSkirmisher_Cleave", 8000, 0)
	Unit:RegisterEvent("ConquestHoldSkirmisher_Hamstring", 10000, 0)
	Unit:RegisterEvent("ConquestHoldSkirmisher_MortalStrike", 7000, 0)
end

function ConquestHoldSkirmisher_Cleave(Unit, Event) 
	Unit:CastSpell(15496) 
end

function ConquestHoldSkirmisher_Hamstring(Unit, Event) 
	Unit:FullCastSpellOnTarget(9080, Unit:GetMainTank()) 
end

function ConquestHoldSkirmisher_MortalStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(32736, Unit:GetMainTank()) 
end

function ConquestHoldSkirmisher_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ConquestHoldSkirmisher_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27456, 1, "ConquestHoldSkirmisher_OnCombat")
RegisterUnitEvent(27456, 2, "ConquestHoldSkirmisher_OnLeaveCombat")
RegisterUnitEvent(27456, 4, "ConquestHoldSkirmisher_OnDied")