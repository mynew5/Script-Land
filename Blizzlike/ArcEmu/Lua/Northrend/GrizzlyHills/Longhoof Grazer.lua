--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]


function LonghoofGrazer_OnCombat(Unit, Event)
	Unit:RegisterEvent("LonghoofGrazer_HeadButt", 8000, 0)
end

function LonghoofGrazer_HeadButt(Unit, Event) 
	Unit:FullCastSpellOnTarget(42320, Unit:GetMainTank()) 
end

function LonghoofGrazer_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function LonghoofGrazer_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26418, 1, "LonghoofGrazer_OnCombat")
RegisterUnitEvent(26418, 2, "LonghoofGrazer_OnLeaveCombat")
RegisterUnitEvent(26418, 4, "LonghoofGrazer_OnDied")