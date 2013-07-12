--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: LUA++; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Az_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Abandon all hope! The Legion has returned to finish what was begun so many years ago. This time, there will be no escape!")
	pUnit:PlaySoundToSet(10999)
	pUnit:RegisterEvent("AzAttacks", 1000, 0)
	pUnit:CastSpell(31344)
end

function Az_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Az_OnKilledTarget(pUnit, Event)
	local AzSpeech = math.random(1,3)
	if(AzSpeech == 1) then
		pUnit:SendChatMessage(14, 0, "Reesh, hokta!")
		pUnit:PlaySoundToSet(11001)
	elseif(AzSpeech == 2) then
		pUnit:SendChatMessage(14, 0, "No one is going to save you.")
		pUnit:PlaySoundToSet(11047)
	else
		pUnit:SendChatMessage(14, 0, "Don't fight it.")
		pUnit:PlaySoundToSet(11048)
	end
end

function Az_OnDeath(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Your time is almost... up.")
	pUnit:PlaySoundToSet(11002)
end

function AzAttacks(pUnit, Event)
	pUnit:RegisterEvent("AzCleave", math.random(30000,60000), 0)
	pUnit:RegisterEvent("AzRoF", math.random(30000,60000), 0)
	pUnit:RegisterEvent("AzHowl", math.random(15000,20000), 0)
	pUnit:RegisterEvent("AzDoom", math.random(45000,50000), 0)
end

function AzCleave(pUnit, Event)
	pUnit:CastSpellOnTarget(31345, pUnit:GetMainTank())
end

function AzRoF(pUnit, Event)
	if(pUnit:GetRandomPlayer(0) ~= nil) then
		pUnit:CastSpellAoF(pUnit:GetRandomPlayer(0):GetX(), pUnit:GetRandomPlayer(0):GetY(), pUnit:GetRandomPlayer(0):GetZ(), 31340)
	end
end

function AzHowl(pUnit, Event)
	pUnit:CastSpell(31344)
end

function AzDoom(pUnit, Event)
	pUnit:CastSpell(31347, pUnit:GetRandomTarget(7))
	local AzDoomSpeech = math.random(1,2)
	if(AzDoomSpeech == 1) then
		pUnit:SendChatMessage(14, 0, "Just a taste... of what awaits you.")
		--pUnit:PlaySoundToSet()
	else
		pUnit:SendChatMessage(14, 0, "Suffer, you despicable insect!")
		--pUnit:PlaySoundToSet()
	end
end
	
RegisterUnitEvent(17842, 1, "Az_OnCombat")
RegisterUnitEvent(17842, 2, "Az_OnLeaveCombat")
RegisterUnitEvent(17842, 3, "Az_OnKilledTarget")
RegisterUnitEvent(17842, 4, "Az_OnDeath")