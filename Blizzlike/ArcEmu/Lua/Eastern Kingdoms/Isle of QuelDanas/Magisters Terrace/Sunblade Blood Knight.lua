--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Moon Project; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SunbladeBloodKnight_OnCombat(Unit, Event)
	Unit:RegisterAIUpdateEvent(10000)
end

function SunbladeBloodKnight_HolyLight(Unit, Event)
	Unit:FullCastSpell(27136)
end

function SunbladeBloodKnight_LeaveCombat(Unit, Event)
	Unit:RemoveAIUpdateEvent()
end

function SunbladeBloodKnight_Died(Unit, Event)
	Unit:RemoveAIUpdateEvent()
end

RegisterUnitEvent(27136, 1, "SunbladeBloodKnight_OnCombat")
RegisterUnitEvent(27136, 21, "SunbladeBloodKnight_HolyLight")
RegisterUnitEvent(27136, 2, "SunbladeBloodKnight_LeaveCombat")
RegisterUnitEvent(27136, 4, "SunbladeBloodKnight_Died")