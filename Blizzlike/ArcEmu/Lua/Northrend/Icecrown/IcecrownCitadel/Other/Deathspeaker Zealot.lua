--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Holystone Productions; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

local DeathspeakerZealot = 36808

function DeathspeakerZealot_OnCombat(pUnit, event)
	pUnit:RegisterEvent("DeathspeakerZealot_ShadowCleave", 10000, 0)
end

function DeathspeakerZealot_ShadowCleave(pUnit, event)
    pUnit:CastSpellOnTarget(69492, pUnit:GetClosestPlayer())
end

function DeathspeakerZealot_OnLeaveCombat(pUnit, event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(DeathspeakerZealot, 1, "DeathspeakerZealot_OnCombat")
RegisterUnitEvent(DeathspeakerZealot, 2, "DeathspeakerZealot_OnLeaveCombat")