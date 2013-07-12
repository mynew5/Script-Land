--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function EnkilahNecromancer_OnCombat(Unit, Event)
	Unit:RegisterEvent("EnkilahNecromancer_Corruption", 10000, 0)
	Unit:RegisterEvent("EnkilahNecromancer_ShadowBolt", 7000, 0)
end

function EnkilahNecromancer_Corruption(Unit, Event) 
	Unit:FullCastSpellOnTarget(32063, Unit:GetMainTank()) 
end

function EnkilahNecromancer_ShadowBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9613, Unit:GetMainTank()) 
end

function EnkilahNecromancer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function EnkilahNecromancer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25378, 1, "EnkilahNecromancer_OnCombat")
RegisterUnitEvent(25378, 2, "EnkilahNecromancer_OnLeaveCombat")
RegisterUnitEvent(25378, 4, "EnkilahNecromancer_OnDied")