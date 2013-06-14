--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Holystone Productions; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DeathspeakerAttendant_OnCombat(pUnit, Event)
    pUnit:RegisterEvent("DeathspeakerAttendant_ShadowBolt", 10000, 1)
end

function DeathspeakerAttendant_ShadowBolt(pUnit, Event)
    pUnit:FullCastSpellOnTarget(71254, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("DeathspeakerAttendant_ShadowNova", 10000, 1)
end

function DeathspeakerAttendant_ShadowNova(pUnit, Event)
    pUnit:CastSpell(69355)
	pUnit:RegisterEvent("DeathspeakerAttendant_ShadowBolt", 10000, 1)
end

function DeathspeakerAttendant_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(36811, 1, "DeathspeakerAttendant_OnCombat")
RegisterUnitEvent(36811, 2, "DeathspeakerAttendant_OnLeaveCombat")