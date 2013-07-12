--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function BlackConradsGhost_OnCombat(Unit, Event)
	Unit:RegisterEvent("BlackConradsGhost_BladeFlurry", 11000, 0)
	Unit:RegisterEvent("BlackConradsGhost_GhostlyStrike", 8000, 0)
end

function BlackConradsGhost_BladeFlurry(Unit, Event) 
	Unit:CastSpell(51211) 
end

function BlackConradsGhost_GhostlyStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(31022, Unit:GetMainTank()) 
end

function BlackConradsGhost_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BlackConradsGhost_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(24790, 1, "BlackConradsGhost_OnCombat")
RegisterUnitEvent(24790, 2, "BlackConradsGhost_OnLeaveCombat")
RegisterUnitEvent(24790, 4, "BlackConradsGhost_OnDied")