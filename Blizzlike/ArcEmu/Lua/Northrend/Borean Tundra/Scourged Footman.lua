--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ScourgedFootman_OnCombat(Unit, Event)
	Unit:RegisterEvent("ScourgedFootman_BladeFlurry", 10000, 0)
	Unit:RegisterEvent("ScourgedFootman_MortalStrike", 8000, 0)
end

function ScourgedFootman_BladeFlurry(Unit, Event) 
	Unit:CastSpell(33735) 
end

function ScourgedFootman_MortalStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(32736, Unit:GetMainTank()) 
end

function ScourgedFootman_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ScourgedFootman_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25981, 1, "ScourgedFootman_OnCombat")
RegisterUnitEvent(25981, 2, "ScourgedFootman_OnLeaveCombat")
RegisterUnitEvent(25981, 4, "ScourgedFootman_OnDied")