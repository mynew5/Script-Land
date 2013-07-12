--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Gorgannon_OnCombat(Unit, Event)
	Unit:RegisterEvent("Gorgannon_Knockdown", 8000, 0)
	Unit:RegisterEvent("Gorgannon_ShadowBolt", 10000, 0)
end

function Gorgannon_Knockdown(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11428, pUnit:GetMainTank()) 
end

function Gorgannon_ShadowBolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9613, pUnit:GetMainTank()) 
end

function Gorgannon_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Gorgannon_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17300, 1, "Gorgannon_OnCombat")
RegisterUnitEvent(17300, 2, "Gorgannon_OnLeaveCombat")
RegisterUnitEvent(17300, 4, "Gorgannon_OnDied")