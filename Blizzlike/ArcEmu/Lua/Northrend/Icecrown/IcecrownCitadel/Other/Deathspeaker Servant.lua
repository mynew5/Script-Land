--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Holystone Productions; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DeathspeakerServant_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("DeathspeakerServant_ChaosBolt", 10000, 1)
end

function DeathspeakerServant_ChaosBolt(pUnit, Event)
	pUnit:FullCastSpellOnTarget(69576, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("DeathspeakerServant_ConsumingShadows", 5000, 1)
end

function DeathspeakerServant_ConsumingShadows(pUnit, Event)
   local target = pUnit:GetRandomFriend()
    if(pUnit:GetRandomFriend() ~= nil) then
		pUnit:FullCastSpellOnTarget(69405, pUnit:GetRandomFriend())
		pUnit:RegisterEvent("DeathspeakerServant_CurseofAgony", 8000, 1)
	end
end

function DeathspeakerServant_CurseofAgony(pUnit, Event)
	if(pUnit:GetRandomFriend() ~= nil) then
		pUnit:CastSpellOnTarget(69404, pUnit:GetRandomFriend())
		pUnit:RegisterEvent("DeathspeakerServant_ChaosBolt", 5000, 1)
	end
end

function DeathspeakerServant_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(36805, 1, "DeathspeakerServant_OnCombat")
RegisterUnitEvent(36805, 2, "DeathspeakerServant_OnLeaveCombat")