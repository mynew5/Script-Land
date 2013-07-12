--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function EmeraldSkytalon_OnCombat(Unit, Event)
	Unit:RegisterEvent("EmeraldSkytalon_Swoop", 8000, 0)
	Unit:RegisterEvent("EmeraldSkytalon_TalonStrike", 6000, 0)
end

function EmeraldSkytalon_Swoop(Unit, Event) 
	Unit:CastSpell(51919) 
end

function EmeraldSkytalon_TalonStrike(Unit, Event) 
	Unit:FullCastSpellOnTarget(32909, Unit:GetMainTank()) 
end

function EmeraldSkytalon_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function EmeraldSkytalon_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27244, 1, "EmeraldSkytalon_OnCombat")
RegisterUnitEvent(27244, 2, "EmeraldSkytalon_OnLeaveCombat")
RegisterUnitEvent(27244, 4, "EmeraldSkytalon_OnDied")