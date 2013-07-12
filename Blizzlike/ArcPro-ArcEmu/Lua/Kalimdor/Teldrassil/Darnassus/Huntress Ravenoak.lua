--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function HuntressRavenoak_OnCombat(Unit, Event)
	Unit:RegisterEvent("HuntressRavenoak_HookedNet", 13000, 0)
	Unit:RegisterEvent("HuntressRavenoak_SunderArmor", 8000, 0)
end

function HuntressRavenoak_HookedNet(Unit, Event) 
	Unit:FullCastSpellOnTarget(14030, Unit:GetMainTank()) 
end

function HuntressRavenoak_SunderArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(15572, Unit:GetMainTank()) 
end

function HuntressRavenoak_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HuntressRavenoak_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14379, 1, "HuntressRavenoak_OnCombat")
RegisterUnitEvent(14379, 2, "HuntressRavenoak_OnLeaveCombat")
RegisterUnitEvent(14379, 4, "HuntressRavenoak_OnDied")