--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]


function WestfallBrigadeHunter_OnCombat(Unit, Event)
	Unit:RegisterEvent("WestfallBrigadeHunter_AimedShot", 7000, 0)
end

function WestfallBrigadeHunter_AimedShot(Unit, Event) 
	Unit:FullCastSpellOnTarget(38861, Unit:GetMainTank()) 
end

function WestfallBrigadeHunter_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WestfallBrigadeHunter_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27462, 1, "WestfallBrigadeHunter_OnCombat")
RegisterUnitEvent(27462, 2, "WestfallBrigadeHunter_OnLeaveCombat")
RegisterUnitEvent(27462, 4, "WestfallBrigadeHunter_OnDied")