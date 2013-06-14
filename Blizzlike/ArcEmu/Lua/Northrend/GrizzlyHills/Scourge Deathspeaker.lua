--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ScourgeDeathspeaker_OnCombat(Unit, Event)
	Unit:RegisterEvent("ScourgeDeathspeaker_Fireball", 6000, 0)
	Unit:RegisterEvent("ScourgeDeathspeaker_FlameoftheSeer", 3000, 1)
end

function ScourgeDeathspeaker_Fireball(Unit, Event) 
	Unit:FullCastSpellOnTarget(52282, Unit:GetMainTank()) 
end

function ScourgeDeathspeaker_FlameoftheSeer(Unit, Event) 
	Unit:CastSpell(52281) 
end

function ScourgeDeathspeaker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ScourgeDeathspeaker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27615, 1, "ScourgeDeathspeaker_OnCombat")
RegisterUnitEvent(27615, 2, "ScourgeDeathspeaker_OnLeaveCombat")
RegisterUnitEvent(27615, 4, "ScourgeDeathspeaker_OnDied")