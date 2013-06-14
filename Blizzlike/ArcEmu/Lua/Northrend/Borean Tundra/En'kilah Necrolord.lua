--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function EnkilahNecrolord_OnCombat(Unit, Event)
	Unit:RegisterEvent("EnkilahNecrolord_BoneArmor", 2000, 1)
	Unit:RegisterEvent("EnkilahNecrolord_SharpenedBone", 6000, 0)
end

function EnkilahNecrolord_BoneArmor(Unit, Event) 
	Unit:CastSpell(50324) 
end

function EnkilahNecrolord_SharpenedBone(Unit, Event) 
	Unit:FullCastSpellOnTarget(50323, Unit:GetMainTank()) 
end

function EnkilahNecrolord_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function EnkilahNecrolord_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25609, 1, "EnkilahNecrolord_OnCombat")
RegisterUnitEvent(25609, 2, "EnkilahNecrolord_OnLeaveCombat")
RegisterUnitEvent(25609, 4, "EnkilahNecrolord_OnDied")