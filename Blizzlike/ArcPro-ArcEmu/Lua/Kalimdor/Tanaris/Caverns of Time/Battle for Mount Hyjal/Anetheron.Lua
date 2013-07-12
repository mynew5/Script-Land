--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: LUA++; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Aneth_OnEnterCombat(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "You are defenders of a doomed world! Flee here, and perhaps you will prolong your pathetic lives!")
	pUnit:PlaySoundToSet(10977)
	pUnit:RegisterEvent("AnethCS", math.random(11000, 15000), 0)
	pUnit:RegisterEvent("AnethInferno", 60000, 0)
	pUnit:RegisterEvent("AnethSleep", 7000, 0)
	pUnit:RegisterEvent("AnethAura", 1000, 0)
	pUnit:RegisterEvent("AnethEnrage", 600000, 0)
end

function Aneth_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Aneth_OnKilledTarget(pUnit, Event)
	local AnethOKT = math.random(1,3)
	if(AnethOKT == 1) then
		pUnit:SendChatMessage(14, 0, "Your hopes are lost!")
		pUnit:PlaySoundToSet(10981)
	elseif(AnethOKt == 2) then
		pUnit:SendChatMessage(14, 0, "Scream for me.")
		pUnit:PlaySoundToSet(11038)
	elseif(AnethOKT == 3) then
		pUnit:SendChatMessage(14, 0, "Pity, no time for a slow death!")
		pUnit:PlaySoundToSet(11039)
	end
end

function Aneth_OnDeath(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "The clock... is still... ticking.")
	pUnit:PlaySoundToSet(10982)
end

function AnethCS(pUnit, Event)
	pUnit:CastSpell()
	local AnethCSSpeech = math.random(1,2)
	if(AnethCSSpeech == 1) then
		pUnit:SendChatMessage(14, 0, "The swarm is eager to feed.")
		--pUnit:PlaySoundToSet()
	elseif(AnethCSSpeech == 2) then
		pUnit:SendChatMessage(14, 0, "Pestilence upon you!")
		--pUnit:PlaySoundToSet( )
	end
end

function AnethInferno(pUnit, Event)
	pUnit:CastSpell(31299)
	local InfernoSpeech =  math.random(1,2)
	if(InfernoSpeech == 1) then
		pUnit:SendChatMessage(14, 0, "Earth and sky shall burn!")
		--pUnit:PlaySoundToSet()
	elseif(InfernoSpeech == 2) then
		pUnit:SendChatMessage(14, 0, "Let fire rain from above!")
		--pUnit:PlaysoundToSet()
	end
end

function AnethSleep(pUnit, Event)
	pUnit:CastSpell()
	local SleepSpeech =  math.random(1,2)
	if(SleepSpeech == 1) then
		pUnit:SendChatMessage(14, 0, "You look tired....")
		pUnit:PlaySoundToSet(10978)
	elseif(SleepSpeech == 2) then
		pUnit:SendChatMessage(14, 0, "Sweet dreams.")
		--pUnit:PlaySoundToSet()
	end
end

function AnethAura(pUnit, Event)
	pUnit:CastSpell(38196)
end

function AnethEnrage(pUnit, Event)
	pUnit:CastSpell(26662)
end

RegisterUnitEvent(17808, 1, "Aneth_OnEnterCombat")
RegisterUnitEvent(17808, 2, "Aneth_OnLeaveCombat")
RegisterUnitEvent(17808, 3, "Aneth_OnKilledTarget")
RegisterUnitEvent(17808, 4, "Aneth_OnDeath")