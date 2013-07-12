--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function AnubarCultist_OnCombat(Unit, Event)
	Unit:RegisterEvent("AnubarCultist_Empower", 2000, 1)
	Unit:RegisterEvent("AnubarCultist_ShadowBolt", 8000, 0)
	Unit:RegisterEvent("AnubarCultist_Zeal", 3000, 1)
end

function AnubarCultist_Empower(Unit, Event) 
	Unit:CastSpell(47257) 
end

function AnubarCultist_ShadowBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(9613, Unit:GetMainTank()) 
end

function AnubarCultist_Zeal(Unit, Event) 
	Unit:CastSpell(51605) 
end

function AnubarCultist_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AnubarCultist_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26319, 1, "AnubarCultist_OnCombat")
RegisterUnitEvent(26319, 2, "AnubarCultist_OnLeaveCombat")
RegisterUnitEvent(26319, 4, "AnubarCultist_OnDied")