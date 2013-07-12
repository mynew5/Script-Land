--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function CaptainJacobs_OnCombat(Unit, Event)
	Unit:RegisterEvent("CaptainJacobs_BladeFlurry", 10000, 0)
	Unit:RegisterEvent("CaptainJacobs_MortalStrike", 8000, 0)
end

function CaptainJacobs_BladeFlurry(Unit, Event) 
	Unit:CastSpell(33735) 
end

function CaptainJacobs_MortalStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(32736, Unit:GetMainTank()) 
end

function CaptainJacobs_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CaptainJacobs_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26252, 1, "CaptainJacobs_OnCombat")
RegisterUnitEvent(26252, 2, "CaptainJacobs_OnLeaveCombat")
RegisterUnitEvent(26252, 4, "CaptainJacobs_OnDied")