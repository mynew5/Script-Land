--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Iceshatter_OnCombat(Unit, Event)
	Unit:RegisterEvent("Iceshatter_MagnataurCharge", 8000, 0)
	Unit:RegisterEvent("Iceshatter_PulsingShards", 6000, 0)
end

function Iceshatter_MagnataurCharge(Unit, Event) 
	Unit:FullCastSpellOnTarget(52088, Unit:GetMainTank()) 
end

function Iceshatter_PulsingShards(Unit, Event) 
	Unit:CastSpell(52118) 
end

function Iceshatter_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Iceshatter_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27007, 1, "Iceshatter_OnCombat")
RegisterUnitEvent(27007, 2, "Iceshatter_OnLeaveCombat")
RegisterUnitEvent(27007, 4, "Iceshatter_OnDied")