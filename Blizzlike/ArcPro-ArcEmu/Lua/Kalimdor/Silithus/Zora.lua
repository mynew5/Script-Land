--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Zora_OnCombat(Unit, Event)
	Unit:RegisterEvent("Zora_PoisonBolt", 8000, 0)
end

function Zora_PoisonBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(21067, Unit:GetMainTank()) 
end

function Zora_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Zora_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14474, 1, "Zora_OnCombat")
RegisterUnitEvent(14474, 2, "Zora_OnLeaveCombat")
RegisterUnitEvent(14474, 4, "Zora_OnDied")