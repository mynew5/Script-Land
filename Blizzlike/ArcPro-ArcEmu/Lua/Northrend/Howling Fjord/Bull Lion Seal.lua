--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function BullLionSeal_OnCombat(Unit, Event)
	Unit:RegisterEvent("BullLionSeal_FlipperThwack", 6000, 0)
end

function BullLionSeal_FlipperThwack(Unit, Event) 
	Unit:FullCastSpellOnTarget(50169, Unit:GetMainTank()) 
end

function BullLionSeal_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function BullLionSeal_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26866, 1, "BullLionSeal_OnCombat")
RegisterUnitEvent(26866, 2, "BullLionSeal_OnLeaveCombat")
RegisterUnitEvent(26866, 4, "BullLionSeal_OnDied")