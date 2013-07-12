--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function Kilrek_Amplify_Flames(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(30053, Unit:GetClosestPlayer())
end

function Kilrek(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Kilrek_Amplify_Flames", 7000, 0)
end

function Kilrek_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Kilrek_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(17229, 2, "Kilrek_OnLeaveCombat")
RegisterUnitEvent(17229, 4, "Kilrek_OnDeath")
RegisterUnitEvent(17229, 1, "Kilrek")