--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function flamelev_oncombat(Unit, Event)
	Unit:SendChatMessage(14, 0, "hostile entities detected. Threat assessment protocol active. Primary target engaged. Time minus thirty seconds to re-evaluation.") 
	Unit:PlaySoundToSet(15506)
	Unit:RegisterEvent("flamelev_secondmessage", 12000, 1)
	Unit:RegisterEvent("flamelev_phase1", 20000, 1)
end

function flamelev_secondmessage(Unit, Event)
	Unit:SendChatMessage(14, 0, "unauthorized entity attempting circuit overload. Activating anti-personnel countermeasures.")
	Unit:PlaySoundToSet(15516)
end

function flamelev_phase1(Unit, Event)
	Unit:RemoveEvents()
	Unit:CastSpellOnTarget(62374, Unit:GetRandomPlayer(0))
	Unit:CastSpell(62374)
	Unit:SendChatMessage(14, 0, "pursuit objective modified. Changing course.")
	Unit:PlaySoundToSet(15508)
	Unit:RegisterEvent("flamelev_missilebarrage", 21000, 0)
	Unit:RegisterEvent("flamelev_vents", 73000, 0)
	Unit:RegisterEvent("flamelev_psvoice", 34000, 0)
	Unit:RegisterEvent("flamelev_pursued", 34000, 0)
	Unit:RegisterEvent("flamelev_phase2", 5000, 0)
end

function flamelev_missilebarrage(Unit, Event)
	Unit:CastSpellOnTarget(62400, Unit:GetRandomPlayer(0))
end

function flamelev_psvoice(Unit, Event)
	Unit:SendChatMessage(14, 0, "pursuit objective modified. Changing course.")
	Unit:PlaySoundToSet(15508)
end

function flamelev_pursued(Unit, Event)
	Unit:CastSpellOnTarget(62374, Unit:GetRandomPlayer(0))
end

function flamelev_vents(Unit, Event)
	Unit:FullCastSpell(62396)
	Unit:SendChatMessage(14, 0, "orbital countermeasures enabled.")
	Unit:PlaySoundToSet(15510)
end

function flamelev_phase2(Unit, Event)
	if(Unit:GetHealthPct() <= 80) then
		Unit:RemoveEvents()
		Unit:FullCastSpell(62680)
		Unit:RegisterEvent("flamelev_voicephase2", 1000, 1)
		Unit:RegisterEvent("flamelev_psvoice", 35000, 0)
		Unit:RegisterEvent("flamelev_pursued", 35000, 0)
		Unit:RegisterEvent("flamelev_flamejets", 43000, 0)
		Unit:RegisterEvent("flamelev_firenova", 8493, 0)
		Unit:RegisterEvent("flamelev_vents", 73000, 0)
		Unit:RegisterEvent("flamelev_missilebarrage", 26000, 0)
		Unit:RegisterEvent("flamelev_phase3", 1000, 0)
	end
end

function flamelev_missilebarrage(Unit, Event)
	Unit:CastSpellOnTarget(62400, Unit:GetRandomPlayer(0))
end

function flamelev_voicephase2(Unit, Event)
	Unit:SendChatMessage(14, 0, "system malfunction. Diverting power to support systems.")
	Unit:PlaySoundToSet(15517)
end

function flamelev_psvoice(Unit, Event)
	Unit:SendChatMessage(14, 0, "pursuit objective modified. Changing course.")
	Unit:PlaySoundToSet(15508)
end

function flamelev_pursued(Unit, Event)
	Unit:CastSpellOnTarget(62374, Unit:GetRandomPlayer(0))
end

function flamelev_flamejets(Unit, Event)
	Unit:FullCastSpell(62680)
end

function flamelev_vents(Unit, Event)
	Unit:FullCastSpell(62396)
	Unit:SendChatMessage(14, 0, "orbital countermeasures enabled.")
	Unit:PlaySoundToSet(15510)
end

function flamelev_firenova(Unit, Event)
	Unit:FullCastSpell(38728)
end

function flamelev_phase3(Unit, Event)
	if(Unit:GetHealthPct() <= 15) then
		Unit:RemoveEvents()
		Unit:SendChatMessage(14, 0, "system restart required. Deactivating weapon systems.")
		Unit:RegisterEvent("flamelev_systemvoice", 1000, 1)
		Unit:RegisterEvent("flamelev_battering", 25517, 10)
		Unit:RegisterEvent("flamelev_searingflame", 30284, 0)
		Unit:RegisterEvent("flamelev_flamejets", 62000, 0)
		Unit:RegisterEvent("flamelev_missilebarrage", 26000, 0)
	end
end

function flamelev_missilebarrage(Unit, Event)
	Unit:CastSpellOnTarget(62400, Unit:GetRandomPlayer(0))
end

function flamelev_systemvoice(Unit, Event)
	Unit:PlaySoundToSet(15519)
end

function flamelev_battering(Unit, Event)
	Unit:CastSpellOnTarget(62376, Unit:GetRandomPlayer(0))
end

function flamelev_flamejets(Unit, Event)
	Unit:FullCastSpell(62680)
end

function flamelev_searingflame(Unit, Event)
	Unit:FullCastSpellOnTarget(62661, Unit:GetRandomPlayer(0))
end

function flamelev_onleavecombat(Unit, Event)
	Unit:RemoveEvents()
end

function flamelev_onkilledtarget(Unit, Event)
	Unit:SendChatMessage(14, 0, "threat assessment routine modified. Current target threat level: Zero. Acquiring new target.")
	Unit:PlaySoundToSet(15521)
end

function flamelev_ondeath(Unit, Event)
	Unit:SendChatMessage(14, 0, "total systems failure. Defense protocols breached. Leviathan Unit shutting down.")
	Unit:PlaySoundToSet(15520)
	Unit:RemoveEvents()
end 

RegisterUnitEvent(33113, 1, "flamelev_oncombat")
RegisterUnitEvent(33113, 2, "flamelev_onleavecombat")
RegisterUnitEvent(33113, 3, "flamelev_onkilledtarget")
RegisterUnitEvent(33113, 4, "flamelev_ondeath")