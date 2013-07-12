--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Sarkoth_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Sarkoth_Claw", 1000, 2)
end

function Sarkoth_Claw(pUnit, Event)
	pUnit:FullCastSpellOnTarget(16827, pUnit:GetClosestPlayer())
end

function Sarkoth_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Sarkoth_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3281, 1, "Sarkoth_OnCombat")
RegisterUnitEvent(3099, 2, "Sarkoth_OnLeaveCombat")
RegisterUnitEvent(3099, 4, "Sarkoth_OnDied")