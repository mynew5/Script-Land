--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function TwilightLordKelris_OnCombat(pUnit, event)
	pUnit:SendChatMessage(14, 0, "Who dares disturb my meditation?!")
	pUnit:PlaySoundToSet(5802)
	pUnit:RegisterEvent("MindBlast", 7000, 0)
	pUnit:RegisterEvent("Sleep", 14000, 0)
end
 
function MindBlast(pUnit, Event)
	pUnit:FullCastSpellOnTarget(15587, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("MindBlast", 7000, 0)
end
 
function Sleep(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Sleep...")
	pUnit:PlaySoundToSet(5804)
	pUnit:CastSpell(8399)
	pUnit:RegisterEvent("Sleep", 14000, 0)
end
 
function TwilightLordKelris_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end
 
function TwilightLordKelris_OnKilledPlayer(pUnit, event)
	pUnit:SendChatMessage(14, 0, "Dust to dust.")
	pUnit:PlaySoundToSet(5803)
end
 
function TwilightLordKelris_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end
 
RegisterUnitEvent(4832, 1, "TwilightLordKelris_OnCombat")
RegisterUnitEvent(4832, 2, "TwilightLordKelris_OnLeaveCombat")
RegisterUnitEvent(4832, 3, "TwilightLordKelris_OnKilledPlayer")
RegisterUnitEvent(4832, 4, "TwilightLordKelris_OnDeath")