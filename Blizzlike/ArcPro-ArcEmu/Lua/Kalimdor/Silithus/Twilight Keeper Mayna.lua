--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function TwilightKeeperMayna_OnCombat(Unit, Event)
	Unit:RegisterEvent("TwilightKeeperMayna_ShadowWordPain", 2000, 2)
	Unit:RegisterEvent("TwilightKeeperMayna_MindFlay", 6000, 0)
	Unit:RegisterEvent("TwilightKeeperMayna_PsychicScream", 10000, 0)
end

function TwilightKeeperMayna_ShadowWordPain(Unit, Event) 
	Unit:FullCastSpellOnTarget(15654, Unit:GetMainTank()) 
end

function TwilightKeeperMayna_MindFlay(Unit, Event) 
	Unit:FullCastSpellOnTarget(17165, Unit:GetMainTank()) 
end

function TwilightKeeperMayna_PsychicScream(Unit, Event) 
	Unit:FullCastSpellOnTarget(22884, Unit:GetMainTank()) 
end

function TwilightKeeperMayna_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TwilightKeeperMayna_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(15200, 1, "TwilightKeeperMayna_OnCombat")
RegisterUnitEvent(15200, 2, "TwilightKeeperMayna_OnLeaveCombat")
RegisterUnitEvent(15200, 4, "TwilightKeeperMayna_OnDied")