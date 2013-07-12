--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function InduleWarrior_OnCombat(Unit, Event)
	Unit:RegisterEvent("InduleWarrior_SpectralStrike", 6000, 0)
end

function InduleWarrior_SpectralStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(51786, Unit:GetMainTank()) 
end

function InduleWarrior_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function InduleWarrior_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26344, 1, "InduleWarrior_OnCombat")
RegisterUnitEvent(26344, 2, "InduleWarrior_OnLeaveCombat")
RegisterUnitEvent(26344, 4, "InduleWarrior_OnDied")