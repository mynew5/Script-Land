--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Ascendscripting; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ThunderingExile_OnEnterCombat(Unit, Event)
	Unit:RegsiterEvent("LightningBolt", 4000, 0)
	Unit:RegsiterEvent("Shock", 22000, 0)
end

function LightningBolt(Unit, Event)
	Unit:FullCastSpellOnTarget(9532, Unit:GetMainTank())
end

function Shock(Unit, Event)
	Unit:FullCastSPellOnTarget(11824, Unit:GetMainTank())
end

function ThunderingExile_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function ThunderingExile_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2762, 1, "ThunderingExile_OnEnterCombat")
RegisterUnitEvent(2762, 2, "ThunderingExile_OnLeaveCombat")
RegisterUnitEvent(2762, 4, "ThunderingExile_OnDied")