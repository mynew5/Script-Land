--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SoriidtheDevourer_OnCombat(Unit, Event)
	Unit:RegisterEvent("SoriidtheDevourer_PierceArmor", 25000, 0)
	Unit:RegisterEvent("SoriidtheDevourer_Rend", 20000, 0)
end

function SoriidtheDevourer_PierceArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(12097, Unit:GetMainTank()) 
end

function SoriidtheDevourer_Rend(Unit, Event) 
	Unit:FullCastSpellOnTarget(13445, Unit:GetMainTank()) 
end

function SoriidtheDevourer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SoriidtheDevourer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(8204, 1, "SoriidtheDevourer_OnCombat")
RegisterUnitEvent(8204, 2, "SoriidtheDevourer_OnLeaveCombat")
RegisterUnitEvent(8204, 4, "SoriidtheDevourer_OnDied")