--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function BloodsporeFirestarter_OnCombat(Unit, Event)
	Unit:RegisterEvent("BloodsporeFirestarter_Fireball", 8000, 0)
	Unit:RegisterEvent("BloodsporeFirestarter_FlamingTouch", 3000, 1)
	Unit:RegisterEvent("BloodsporeFirestarter_MoltenArmor", 6000, 1)
end

function BloodsporeFirestarter_Fireball(Unit, Event) 
	Unit:FullCastSpellOnTarget(20793, Unit:GetMainTank()) 
end

function BloodsporeFirestarter_FlamingTouch(Unit, Event) 
	Unit:CastSpell(45985) 
end

function BloodsporeFirestarter_MoltenArmor(Unit, Event) 
	Unit:CastSpell(35916) 
end

function BloodsporeFirestarter_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BloodsporeFirestarter_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25470, 1, "BloodsporeFirestarter_OnCombat")
RegisterUnitEvent(25470, 2, "BloodsporeFirestarter_OnLeaveCombat")
RegisterUnitEvent(25470, 4, "BloodsporeFirestarter_OnDied")