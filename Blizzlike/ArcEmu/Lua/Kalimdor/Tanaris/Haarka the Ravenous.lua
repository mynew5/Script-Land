--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function HaarkatheRavenous_OnCombat(Unit, Event)
	Unit:RegisterEvent("HaarkatheRavenous_SunderArmor", 10000, 0)
	Unit:RegisterEvent("HaarkatheRavenous_Thrash", 5000, 0)
end

function HaarkatheRavenous_SunderArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(21081, Unit:GetMainTank()) 
end

function HaarkatheRavenous_Thrash(Unit, Event) 
	Unit:FullCastSpellOnTarget(3391, Unit:GetMainTank()) 
end

function HaarkatheRavenous_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HaarkatheRavenous_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(8205, 1, "HaarkatheRavenous_OnCombat")
RegisterUnitEvent(8205, 2, "HaarkatheRavenous_OnLeaveCombat")
RegisterUnitEvent(8205, 4, "HaarkatheRavenous_OnDied")