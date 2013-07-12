--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Holystone Productions; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DeathspeakerDisciple_OnCombat(pUnit, Event)
    pUnit:RegisterEvent("DeathspeakerDisciple_ShadowBolt", 10000, 1)
end

function DeathspeakerDisciple_ShadowBolt(pUnit, Event)
    pUnit:FullCastSpellOnTarget(71254, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("DeathspeakerDisciple_ShadowMend", 10000, 1)
end

function DeathspeakerDisciple_ShadowMend(pUnit, Event)
	if(pUnit:GetRandomFriend() ~= nil) then
		pUnit:FullCastSpellOnTarget(69389, pUnit:GetRandomFriend())
		pUnit:RegisterEvent("DeathspeakerDisciple_DarkBlessing", 5000, 1)
	end
end

function DeathspeakerDisciple_DarkBlessing(pUnit, Event)
    if(pUnit:GetRandomFriend() ~= nil) then
		pUnit:FullCastSpellOnTarget(69391, pUnit:GetRandomFriend())
		pUnit:RegisterEvent("DeathspeakerDisciple_ShadowBolt", 5000, 1)
	end
end

function DeathspeakerDisciple_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(36807, 1, "DeathspeakerDisciple_OnCombat")
RegisterUnitEvent(36807, 2, "DeathspeakerDisciple_OnLeaveCombat")