--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function HighCultistZangus_OnCombat(Unit, Event)
	Unit:RegisterEvent("HighCultistZangus_ShadowBolt", 7000, 0)
	Unit:RegisterEvent("HighCultistZangus_Zeal", 2000, 1)
end

function HighCultistZangus_ShadowBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9613, Unit:GetMainTank()) 
end

function HighCultistZangus_Zeal(Unit, Event) 
	Unit:CastSpell(51605) 
end

function HighCultistZangus_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HighCultistZangus_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26655, 1, "HighCultistZangus_OnCombat")
RegisterUnitEvent(26655, 2, "HighCultistZangus_OnLeaveCombat")
RegisterUnitEvent(26655, 4, "HighCultistZangus_OnDied")