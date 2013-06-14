--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function BatteredDrakkariBerserker_OnCombat(Unit, Event)
	Unit:RegisterEvent("BatteredDrakkariBerserker_Enrage", 10000, 1)
	Unit:RegisterEvent("BatteredDrakkariBerserker_Knockdown", 6000, 0)
end

function BatteredDrakkariBerserker_Enrage(Unit, Event) 
	Unit:CastSpell(50420) 
end

function BatteredDrakkariBerserker_Knockdown(Unit, Event) 
	Unit:FullCastSpellOnTarget(37592, Unit:GetMainTank()) 
end

function BatteredDrakkariBerserker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BatteredDrakkariBerserker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26943, 1, "BatteredDrakkariBerserker_OnCombat")
RegisterUnitEvent(26943, 2, "BatteredDrakkariBerserker_OnLeaveCombat")
RegisterUnitEvent(26943, 4, "BatteredDrakkariBerserker_OnDied")