--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DCTalonite_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("DCTalonite_ColdTouch", 18000, 0)
	Unit:RegisterEvent("DCTalonite_TalonOfJustice", 15000, 0)
end

function DCTalonite_ColdTouch(Unit,Event)
	Unit:FullCastSpellOnTarget(39230, Unit:GetClosestPlayer())
end


function DCTalonite_TalonOfJustice(Unit,Event)
	Unit:FullCastSpellOnTarget(39229, Unit:GetClosestPlayer())
end

function DCTalonite_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

function DCTalonite_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19825, 1, "DCTalonite_OnEnterCombat")
RegisterUnitEvent(19825, 4, "DCTalonite_OnDied")
RegisterUnitEvent(19825, 2, "DCTalonite_OnLeaveCombat")