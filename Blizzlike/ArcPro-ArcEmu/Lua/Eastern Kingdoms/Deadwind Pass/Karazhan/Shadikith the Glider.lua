--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function Shadikith_Charge(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(38461, Unit:GetRandomPlayer())
end

function Shadikith_Sonic_Burst(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(39052, Unit:GetClosestPlayer())
end

function Shadikith_Wing_Buffet(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(38110, Unit:GetClosestPlayer())
end

function Shadikith_Knockback(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(37966, Unit:GetRandomPlayer())
end

function Shadikith(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Shadikith_Charge", 10000, 0)
	Unit:RegisterEvent("Shadikith_Sonic_Burst", 17000, 0)
	Unit:RegisterEvent("Shadikith_Wing_Buffet", 27000, 0)
	Unit:RegisterEvent("Shadikith_Knockback", 33000, 0)
end

function Shadikith_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Shadikith_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(16180, 1, "Shadikith")
RegisterUnitEvent(16180, 2, "Shadikith_OnLeaveCombat")
RegisterUnitEvent(16180, 4, "Shadikith_OnDeath")