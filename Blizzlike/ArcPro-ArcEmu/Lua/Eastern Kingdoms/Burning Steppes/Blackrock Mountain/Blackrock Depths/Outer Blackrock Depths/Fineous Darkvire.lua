--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function FDV_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("DevotionAura", 7000, 0)
	pUnit:RegisterEvent("HolyLight", 14000, 0)
	pUnit:RegisterEvent("HolyStrike", 21000, 0)
	pUnit:RegisterEvent("SealOfReckoning", 28000, 0)
	pUnit:RegisterEvent("Kick", 35000, 0)
end

function Kick(pUnit, Event)
	pUnit:CastSpellOnTarget(11978)
end

function SealOfReckoning(pUnit, Event)
	pUnit:FullCastSpellOnTarget(15346)
end

function HolyStrike(pUnit, Event)
	pUnit:FullCastSpellonTarget(13953)
end

function HolyLight(pUnit, Event)
	pUnit:FullCastSpellonTarget(15493)
end

function DevotionAura(pUnit, Event)
	pUnit:FullCastSpellonTarget(8258)
end

function FDV_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function FDV_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(9056, 1, "FDV_OnCombat")
RegisterUnitEvent(9056, 2, "FDV_OnLeaveCombat")
RegisterUnitEvent(9056, 4, "FDV_OnDeath")