--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: DARKI
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

--Jadespine Basilisk
function Basilisk_OnCombat(Unit, Event)
	Unit:RegisterEvent("Basilisk_Cslumber", 2000+math.random(1,26000), 0)
end

function Basilisk_Cslumber(Unit, Event)
	Unit:FullCastSpellOnTarget(3636, Unit:GetRandomPlayer())
end

function Basilisk_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Basilisk_OnDied(Unit, Event)
	Unit:RemoveEvents()
end 

RegisterUnitEvent(4863, 1, "Basilisk_OnCombat")
RegisterUnitEvent(4863, 2, "Basilisk_OnLeaveCombat")
RegisterUnitEvent(4863, 4, "Basilisk_OnDied")