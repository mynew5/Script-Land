--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: LUA++; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]
--[[Kaz'rogal yells: Shaza-kiel!]]

function Kaz_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Cry for mercy! Your meaningless lives will soon be forfeit.")
	pUnit:PlaySoundToSet(11015)
	pUnit:RegisterEvent("KazAttacks", 1000, 0)
end

function Kaz_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Kaz_OnKilledTarget(pUnit, Event)
	local speech = math.random(1,2)
	if(speech == 1) then
		pUnit:SendChatMessage(14, 0, "Your death will be a painful one.")
		pUnit:PlaySoundToSet(11016)
	else
		pUnit:SendChatMessage(14, 0, "You... are marked.")
		pUnit:PlaySoundToSet(11052)
	end
end

function Kaz_OnDeath(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Hahahahaa aahaah!")
	pUnit:PlaySoundToSet(11018)
end

function KazAttacks(pUnit, Event)
	pUnit:RegisterEvent("KazCleave", math.random(30000,60000), 0)
	pUnit:RegisterEvent("KazMOKR", math.random(30000,60000), 0)
	pUnit:RegisterEvent("KazStomp", math.random(25000,45000), 0)
	pUnit:RegisterEvent("KazDispel", math.random(30000,60000), 0)
end

function KazCleave(pUnit, Event)
	pUnit:CastSpellOnTarget(31345, pUnit:GetMainTank())
end

function KazMOKR(pUnit, Event)
	local speech = math.random(1,2)
	if(speech == 1) then
		pUnit:SendChatMessage(14, 0, "You are nothing!")
		pUnit:PlaysoundToSet(11053)
		pUnit:CastSpellOnTarget(31447, pUnit:GetInRangePlayers())
	else
		pUnit:SendChatMessage(14, 0, "Miserable nuisance!")
		pUnit:PlaySoundToSet(11054)
		pUnit:CastSpellOnTarget(31447, pUnit:GetInRangePlayers())
	end
end

function KazStomp(pUnit, Event)
	pUnit:CastSpell(31408)
end

function KazDispel(pUnit, Event)
	pUnit:CastSpellOnTarget(43577, pUnit:GetRandomPlayer(0))
end

RegisterUnitEvent(17888, 1, "Kaz_OnCombat")
RegisterUnitEvent(17888, 2, "Kaz_OnLeaveCombat")
RegisterUnitEvent(17888, 3, "Kaz_OnKilledTarget")
RegisterUnitEvent(17888, 4, "Kaz_OnDeath")