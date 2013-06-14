--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function NecrolordXavius_OnCombat(Unit, Event)
	Unit:RegisterEvent("NecrolordXavius_ShadowBolt", 7000, 0)
	Unit:RegisterEvent("NecrolordXavius_Shadowflame", 6000, 0)
end

function NecrolordXavius_ShadowBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(20298, Unit:GetMainTank()) 
end

function NecrolordXavius_Shadowflame(Unit, Event) 
	Unit:CastSpell(51337) 
end

function NecrolordXavius_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function NecrolordXavius_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27826, 1, "NecrolordXavius_OnCombat")
RegisterUnitEvent(27826, 2, "NecrolordXavius_OnLeaveCombat")
RegisterUnitEvent(27826, 4, "NecrolordXavius_OnDied")