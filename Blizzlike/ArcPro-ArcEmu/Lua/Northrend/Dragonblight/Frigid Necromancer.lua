--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function FrigidNecromancer_OnCombat(Unit, Event)
	Unit:RegisterEvent("FrigidNecromancer_BoneArmor", 2000, 1)
	Unit:RegisterEvent("FrigidNecromancer_ShadowBolt", 7000, 0)
end

function FrigidNecromancer_BoneArmor(Unit, Event) 
	Unit:CastSpell(50324) 
end

function FrigidNecromancer_ShadowBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9613, Unit:GetMainTank()) 
end

function FrigidNecromancer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function FrigidNecromancer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27539, 1, "FrigidNecromancer_OnCombat")
RegisterUnitEvent(27539, 2, "FrigidNecromancer_OnLeaveCombat")
RegisterUnitEvent(27539, 4, "FrigidNecromancer_OnDied")