--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function GameltheCruel_OnCombat(Unit, Event)
	Unit:RegisterEvent("GameltheCruel_MortalStrike", 6000, 0)
end

function GameltheCruel_MortalStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(13737, Unit:GetMainTank()) 
end

function GameltheCruel_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GameltheCruel_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26449, 1, "GameltheCruel_OnCombat")
RegisterUnitEvent(26449, 2, "GameltheCruel_OnLeaveCombat")
RegisterUnitEvent(26449, 4, "GameltheCruel_OnDied")