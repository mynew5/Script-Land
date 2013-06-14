--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Holystone Productions; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function TheDamned_OnCombat(pUnit, event)
	pUnit:RegisterEvent("Bone_Flurry", 10000, 1)
end

function Bone_Flurry(pUnit, event)
	pUnit:FullCastSpell(70960)
	pUnit:RegisterEvent("Shattered_Bones", 15000, 1)
end

function Shattered_Bones(pUnit, event)
	pUnit:CastSpellOnTarget(70961, pUnit:GetClosestPlayer())
	pUnit:RegisterEvent("Bone_Flurry", 10000, 1)
end

function TheDamned_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(37011, 1, "TheDamned_OnCombat")
RegisterUnitEvent(37011, 2, "TheDamned_OnLeaveCombat")