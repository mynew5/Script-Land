--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function VaridustheFlenser_OnCombat(Unit, Event)
	Unit:RegisterEvent("VaridustheFlenser_ShadowNova", 6000, 0)
	Unit:RegisterEvent("VaridustheFlenser_ShieldofSuffering", 4000, 1)
end

function VaridustheFlenser_ShadowNova(Unit, Event) 
	Unit:CastSpell(32711) 
end

function VaridustheFlenser_ShieldofSuffering(Unit, Event) 
	Unit:CastSpell(50329) 
end

function VaridustheFlenser_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function VaridustheFlenser_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25618, 1, "VaridustheFlenser_OnCombat")
RegisterUnitEvent(25618, 2, "VaridustheFlenser_OnLeaveCombat")
RegisterUnitEvent(25618, 4, "VaridustheFlenser_OnDied")