--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function FesteringGhoul_OnCombat(Unit, Event)
	Unit:RegisterEvent("FesteringGhoul_RotArmor", 10000, 0)
end

function FesteringGhoul_RotArmor(Unit, Event) 
	Unit:FullCastSpellOnTarget(50361, Unit:GetMainTank()) 
end

function FesteringGhoul_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function FesteringGhoul_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25660, 1, "FesteringGhoul_OnCombat")
RegisterUnitEvent(25660, 2, "FesteringGhoul_OnLeaveCombat")
RegisterUnitEvent(25660, 4, "FesteringGhoul_OnDied")