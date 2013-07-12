--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: LUA++
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

--[[Terestian Illhoof yells: Ah, you're just in time. The rituals are about to begin!
Terestian Illhoof yells: Come, you dwellers in the dark! Rally to my call!
Terestian Illhoof yells: Gather, my pets... there is plenty for all!
Terestian Illhoof yells: Let this sacrifice serve as testament to my fealty.
Terestian Illhoof yells: My life is yours, oh great one...
Terestian Illhoof yells: Please accept this humble offering, oh great one...
Terestian Illhoof yells: Your blood will anoint my circle!]]

function Terestian_Shadow_Bolt(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(36868, Unit:GetClosestPlayer())
end

function Terestian_Sacrifice(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(30115, Unit:GetRandomPlayer())
end

function Terestian_Kilrek(Unit, event, miscUnit, misc)
	if((Unit:GetHealthPct(17229) < 0) and (Didthat == 0)) then
		Unit:SpawnCreature(17229, -11236.9, -1695.81, 179.237, 0, 18, 96000000)
		Didthat = 1
	else
	end
end

function Terestian_Berserk(Unit, event, miscUnit, misc)
	Unit:FullCastSpell(38110)
end

function Terestian(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Terestian_Shadow_Bolt", 8000, 0)
	Unit:RegisterEvent("Terestian_Sacrifice", 33000, 0)
	Unit:RegisterEvent("Terestian_Kilrek", 45000, 0)
	Unit:RegisterEvent("Terestian_Berserk", 60000, 0)
end

function Terestian_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Terestian_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(15688, 1, "Terestian")
RegisterUnitEvent(15688, 2, "Terestian_OnLeaveCombat")
RegisterUnitEvent(15688, 4, "Terestian_OnDeath")