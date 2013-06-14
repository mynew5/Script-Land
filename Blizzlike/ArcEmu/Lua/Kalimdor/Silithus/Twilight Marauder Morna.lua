--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function TwilightMarauderMorna_OnCombat(Unit, Event)
	Unit:RegisterEvent("TwilightMarauderMorna_MortalStrike", 6000, 0)
	Unit:RegisterEvent("TwilightMarauderMorna_PiercingHowl", 10000, 0)
	Unit:RegisterEvent("TwilightMarauderMorna_SunderArmor", 4000, 0)
end

function TwilightMarauderMorna_MortalStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(16856, Unit:GetMainTank()) 
end

function TwilightMarauderMorna_PiercingHowl(Unit, Event) 
	Unit:CastSpell(23600) 
end

function TwilightMarauderMorna_SunderArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(15572, Unit:GetMainTank()) 
end

function TwilightMarauderMorna_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TwilightMarauderMorna_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(15541, 1, "TwilightMarauderMorna_OnCombat")
RegisterUnitEvent(15541, 2, "TwilightMarauderMorna_OnLeaveCombat")
RegisterUnitEvent(15541, 4, "TwilightMarauderMorna_OnDied")