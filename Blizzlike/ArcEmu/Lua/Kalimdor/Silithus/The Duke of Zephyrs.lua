--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function TheDukeofZephyrs_OnCombat(Unit, Event)
	Unit:RegisterEvent("TheDukeofZephyrs_ForkedLightning", 6000, 0)
	Unit:RegisterEvent("TheDukeofZephyrs_LightningCloud", 8000, 0)
	Unit:RegisterEvent("TheDukeofZephyrs_WingFlap", 12000, 0)
end

function TheDukeofZephyrs_ForkedLightning(Unit, Event) 
	Unit:CastSpell(25034) 
end

function TheDukeofZephyrs_LightningCloud(Unit, Event) 
	Unit:CastSpell(44417) 
end

function TheDukeofZephyrs_WingFlap(Unit, Event) 
	Unit:FullCastSpellOnTarget(12882, Unit:GetMainTank()) 
end

function TheDukeofZephyrs_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TheDukeofZephyrs_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(15220, 1, "TheDukeofZephyrs_OnCombat")
RegisterUnitEvent(15220, 2, "TheDukeofZephyrs_OnLeaveCombat")
RegisterUnitEvent(15220, 4, "TheDukeofZephyrs_OnDied")