--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ForceCommanderSteeljaw_OnCombat(Unit, Event)
	Unit:RegisterEvent("ForceCommanderSteeljaw_Cleave", 6000, 0)
	Unit:RegisterEvent("ForceCommanderSteeljaw_PiercingHowl", 10000, 0)
	Unit:RegisterEvent("ForceCommanderSteeljaw_SteelJaw", 12000, 0)
	Unit:RegisterEvent("ForceCommanderSteeljaw_Whirlwind", 8000, 0)
end

function ForceCommanderSteeljaw_Cleave(Unit, Event) 
	Unit:CastSpell(15284) 
end

function ForceCommanderSteeljaw_PiercingHowl(Unit, Event) 
	Unit:CastSpell(38256) 
end

function ForceCommanderSteeljaw_SteelJaw(Unit, Event) 
	Unit:CastSpell(50204) 
end

function ForceCommanderSteeljaw_Whirlwind(Unit, Event) 
	Unit:CastSpell(41057) 
end

function ForceCommanderSteeljaw_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ForceCommanderSteeljaw_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25359, 1, "ForceCommanderSteeljaw_OnCombat")
RegisterUnitEvent(25359, 2, "ForceCommanderSteeljaw_OnLeaveCombat")
RegisterUnitEvent(25359, 4, "ForceCommanderSteeljaw_OnDied")