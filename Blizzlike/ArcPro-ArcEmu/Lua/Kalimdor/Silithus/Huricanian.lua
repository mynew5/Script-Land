--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Huricanian_OnCombat(Unit, Event)
	Unit:RegisterEvent("Huricanian_ChainLightning", 8000, 0)
end

function Huricanian_ChainLightning(Unit, Event) 
	Unit:FullCastSpellOnTarget(15659, Unit:GetRandomPlayer(0)) 
end

function Huricanian_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Huricanian_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14478, 1, "Huricanian_OnCombat")
RegisterUnitEvent(14478, 2, "Huricanian_OnLeaveCombat")
RegisterUnitEvent(14478, 4, "Huricanian_OnDied")