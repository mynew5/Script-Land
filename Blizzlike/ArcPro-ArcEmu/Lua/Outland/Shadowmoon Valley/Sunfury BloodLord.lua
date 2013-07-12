--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SunfuryBloodLord_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("SunfuryBloodLord_DebilitatingStrike", 15000, 0)
	Unit:RegisterEvent("SunfuryBloodLord_TorrentOfFlames", 5000, 0)
end

function SunfuryBloodLord_DebilitatingStrike(Unit,Event)
	Unit:FullCastSpellOnTarget(37577, Unit:GetClosestPlayer())
end

function SunfuryBloodLord_TorrentOfFlames(Unit,Event)
	Unit:FullCastSpellOnTarget(36104, Unit:GetClosestPlayer())
end

function SunfuryBloodLord_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function SunfuryBloodLord_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21743, 1, "SunfuryBloodLord_OnEnterCombat")
RegisterUnitEvent(21743, 2, "SunfuryBloodLord_OnLeaveCombat")
RegisterUnitEvent(21743, 4, "SunfuryBloodLord_OnDied")