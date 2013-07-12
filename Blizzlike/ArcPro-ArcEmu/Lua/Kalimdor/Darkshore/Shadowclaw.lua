--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Shadowclaw_OnCombat(Unit, Event)
	Unit:RegisterEvent("Shadowclaw_CurseofWeakness", 4000, 1)
end

function Shadowclaw_CurseofWeakness(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(17227, pUnit:GetMainTank()) 
end

function Shadowclaw_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Shadowclaw_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2175, 1, "Shadowclaw_OnCombat")
RegisterUnitEvent(2175, 2, "Shadowclaw_OnLeaveCombat")
RegisterUnitEvent(2175, 4, "Shadowclaw_OnDied")