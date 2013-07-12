--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function BloodpawWarrior_OnCombat(Unit, Event)
	Unit:RegisterEvent("BloodpawWarrior_Maul", 5000, 0)
end

function BloodpawWarrior_Maul(Unit, Event) 
	Unit:FullCastSpellOnTarget(51875, Unit:GetMainTank()) 
end

function BloodpawWarrior_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BloodpawWarrior_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27342, 1, "BloodpawWarrior_OnCombat")
RegisterUnitEvent(27342, 2, "BloodpawWarrior_OnLeaveCombat")
RegisterUnitEvent(27342, 4, "BloodpawWarrior_OnDied")