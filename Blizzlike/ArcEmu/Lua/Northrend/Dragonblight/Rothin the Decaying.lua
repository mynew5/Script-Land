--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function RothintheDecaying_OnCombat(Unit, Event)
	Unit:RegisterEvent("RothintheDecaying_AegisofNeltharion", 4000, 1)
	Unit:RegisterEvent("RothintheDecaying_Shadowflame", 7000, 0)
	Unit:RegisterEvent("RothintheDecaying_ShadowBolt", 8000, 0)
end

function RothintheDecaying_AegisofNeltharion(Unit, Event) 
	Unit:CastSpell(51512) 
end

function RothintheDecaying_Shadowflame(Unit, Event) 
	Unit:CastSpell(51337) 
end

function RothintheDecaying_ShadowBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9613, Unit:GetMainTank()) 
end

function RothintheDecaying_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RothintheDecaying_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27355, 1, "RothintheDecaying_OnCombat")
RegisterUnitEvent(27355, 2, "RothintheDecaying_OnLeaveCombat")
RegisterUnitEvent(27355, 4, "RothintheDecaying_OnDied")