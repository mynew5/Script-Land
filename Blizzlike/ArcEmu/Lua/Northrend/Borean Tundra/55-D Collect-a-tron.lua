--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DCollectatron_OnCombat(Unit, Event)
	Unit:RegisterEvent("DCollectatron_DumpOil", 10000, 0)
end

function DCollectatron_DumpOil(Unit, Event) 
	Unit:FullCastSpellOnTarget(50269, Unit:GetMainTank()) 
end

function DCollectatron_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DCollectatron_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25793, 1, "DCollectatron_OnCombat")
RegisterUnitEvent(25793, 2, "DCollectatron_OnLeaveCombat")
RegisterUnitEvent(25793, 4, "DCollectatron_OnDied")