--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]


function WestfallBrigadeMarine_OnCombat(Unit, Event)
	Unit:RegisterEvent("WestfallBrigadeMarine_ConcussionBlow", 9000, 0)
	Unit:RegisterEvent("WestfallBrigadeMarine_SunderArmor", 5000, 0)
end

function WestfallBrigadeMarine_ConcussionBlow(Unit, Event) 
	Unit:FullCastSpellOnTarget(52719, Unit:GetMainTank()) 
end

function WestfallBrigadeMarine_SunderArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(50307, Unit:GetMainTank()) 
end

function WestfallBrigadeMarine_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WestfallBrigadeMarine_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27501, 1, "WestfallBrigadeMarine_OnCombat")
RegisterUnitEvent(27501, 2, "WestfallBrigadeMarine_OnLeaveCombat")
RegisterUnitEvent(27501, 4, "WestfallBrigadeMarine_OnDied")