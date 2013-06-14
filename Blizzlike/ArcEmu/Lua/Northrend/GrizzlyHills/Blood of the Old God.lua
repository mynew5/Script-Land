--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function BloodoftheOldGod_OnCombat(Unit, Event)
	Unit:RegisterEvent("BloodoftheOldGod_CorruptionoftheOldGod", 7000, 0)
end

function BloodoftheOldGod_CorruptionoftheOldGod(Unit, Event) 
	Unit:FullCastSpellOnTarget(52564, Unit:GetMainTank()) 
end

function BloodoftheOldGod_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BloodoftheOldGod_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(28854, 1, "BloodoftheOldGod_OnCombat")
RegisterUnitEvent(28854, 2, "BloodoftheOldGod_OnLeaveCombat")
RegisterUnitEvent(28854, 4, "BloodoftheOldGod_OnDied")