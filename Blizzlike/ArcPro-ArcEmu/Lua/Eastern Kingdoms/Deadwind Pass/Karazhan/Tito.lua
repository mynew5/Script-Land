--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function Tito_Annoying_Yipping(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(31015, Unit:GetRandomPlayer())
end

function Tito_OnCombat(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Tito_Annoying_Yipping", 10000, 0)
end

function Tito_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Tito_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(17548, 1, "Tito_OnCombat")
RegisterUnitEvent(17548, 2, "Tito_OnLeaveCombat")
RegisterUnitEvent(17548, 4, "Tito_OnDeath")