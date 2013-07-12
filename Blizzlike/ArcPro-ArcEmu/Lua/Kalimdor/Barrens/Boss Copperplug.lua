--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function BossCopperplug_OnCombat(Unit, Event)
	Unit:RegisterEvent("BossCopperplug_Bom", 8000, 0)
	Unit:RegisterEvent("BossCopperplug_Net", 10000, 0)
end

function BossCopperplug_Bom(Unit, Event) 
	Unit:CastSpell(9143) 
end

function BossCopperplug_Net(Unit, Event) 
	Unit:FullCastSpellOnTarget(6533, Unit:GetMainTank()) 
end

function BossCopperplug_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BossCopperplug_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(9336, 1, "BossCopperplug_OnCombat")
RegisterUnitEvent(9336, 2, "BossCopperplug_OnLeaveCombat")
RegisterUnitEvent(9336, 4, "BossCopperplug_OnDied")