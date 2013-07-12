--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function VentureCoStraggler_OnCombat(Unit, Event)
	Unit:RegisterEvent("VentureCoStraggler_Chop", 5000, 0)
end

function VentureCoStraggler_Chop(Unit, Event) 
	Unit:FullCastSpellOnTarget(43410, Unit:GetMainTank()) 
end

function VentureCoStraggler_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function VentureCoStraggler_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27570, 1, "VentureCoStraggler_OnCombat")
RegisterUnitEvent(27570, 2, "VentureCoStraggler_OnLeaveCombat")
RegisterUnitEvent(27570, 4, "VentureCoStraggler_OnDied")