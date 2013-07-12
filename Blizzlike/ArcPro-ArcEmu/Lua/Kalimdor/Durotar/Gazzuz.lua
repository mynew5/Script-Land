--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Gazzuz_OnCombat(Unit, Event)
	Unit:RegisterEvent("Gazzuz_SummonVoidwalker", 1000, 1)
	Unit:RegisterEvent("Gazzuz_DemonSkin", 2000, 1)
	Unit:RegisterEvent("Gazzuz_Corruption", 4000, 1)
	Unit:RegisterEvent("Gazzuz_ShadowBolt", 8000, 0)
end

function Gazzuz_SummonVoidwalker(Unit, Event) 
	Unit:CastSpell(12746) 
end

function Gazzuz_DemonSkin(Unit, Event) 
	Unit:CastSpell(20798) 
end

function Gazzuz_Corruption(Unit, Event) 
	Unit:FullCastSpellOnTarget(172, 	Unit:GetMainTank()) 
end

function Gazzuz_ShadowBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(20791, 	Unit:GetMainTank()) 
end

function Gazzuz_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Gazzuz_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

function Gazzuz_OnKilledTarget(Unit, Event) 
end

RegisterUnitEvent(3204, 1, "Gazzuz_OnCombat")
RegisterUnitEvent(3204, 2, "Gazzuz_OnLeaveCombat")
RegisterUnitEvent(3204, 3, "Gazzuz_OnKilledTarget")
RegisterUnitEvent(3204, 4, "Gazzuz_OnDied")