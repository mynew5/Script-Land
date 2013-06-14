--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function AzzeretheSkyblade_OnCombat(Unit, Event)
	Unit:RegisterEvent("AzzeretheSkyblade_Fireball", 8000, 0)
	Unit:RegisterEvent("AzzeretheSkyblade_FlameSpike", 9000, 0)
end

function AzzeretheSkyblade_Fireball(Unit, Event) 
	Unit:FullCastSpellOnTarget(13375, Unit:GetMainTank()) 
end

function AzzeretheSkyblade_FlameSpike(Unit, Event) 
	Unit:CastSpell(6725) 
end

function AzzeretheSkyblade_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AzzeretheSkyblade_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5834, 1, "AzzeretheSkyblade_OnCombat")
RegisterUnitEvent(5834, 2, "AzzeretheSkyblade_OnLeaveCombat")
RegisterUnitEvent(5834, 4, "AzzeretheSkyblade_OnDied")