--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function LICD_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(12, 0, "I cannot be destroyed! By the will of Ragnaros, I shall be reborn!")
	pUnit:RegisterEvent("CurseotEleLord", 7000, 0)
	pUnit:RegisterEvent("FireStorm", 14000, 0)
	pUnit:RegisterEvent("FieryBurst", 21000, 0)
	pUnit:RegisterEvent("MightyBlow", 28000, 0)
end

function CurseotEleLord(pUnit, Event)
	pUnit:CastSpellOnTarget(26977)
end

function MightyBlow(pUnit, Event)
	pUnit:FullCastSpellOnTarget(14099)
end

function FireStorm(pUnit, Event)
	pUnit:FullCastSpellonTarget(13899)
end

function FieryBurst(pUnit, Event)
	pUnit:FullCastSpellonTarget(13900)
end

function LICD_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function LICD_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(9017, 1, "LICD_OnCombat")
RegisterUnitEvent(9017, 2, "LICD_OnLeaveCombat")
RegisterUnitEvent(9017, 4, "LICD_OnDeath")