--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DoomwalkerOnCombat(pUnit, event)
	pUnit:SendChatMessage(14, 0, "Do not proceed. You will be eliminated.")
	pUnit:PlaySoundToSet(11344)
	pUnit:RegisterEvent("Doomwalker_Enrage",1000,1)
	pUnit:RegisterEvent("Doomwalker_Earthquake",10000,0)
	pUnit:RegisterEvent("Doomwalker_Chain_Light",17000,0)
	pUnit:RegisterEvent("Doomwalker_Overrun",23000,0)
end

function DoomwalkerOnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end

function DoomwalkerOnKilledTarget(pUnit, event)
	local DWSpeech = math.random(1,3)
	if(DWSpeech == 1) then
		pUnit:SendChatMessage(14, 0, "Threat level zero.")
		pUnit:PlaySoundToSet(11349)
	elseif(DWSpeech == 2) then
		pUnit:SendChatMessage(14, 0, "Directive accomplished.")
		pUnit:PlaySoundToSet(11350)
	else
		pUnit:SendChatMessage(14, 0, "Target exterminated.")
		pUnit:PlaySoundToSet(11351)
	end
end

function DoomwalkerOnDied(pUnit, event)
	pUnit:RemoveEvents()
	pUnit:SendChatMessage(14, 0, "System failure in five... four...")
	pUnit:PlaySoundToSet(11352)
end

function Doomwalker_Overrun(pUnit, event)
	pUnit:ClearThreatList()
	pUnit:CastSpell(32637)
	local Overrun = math.random(1,2)
	if(Overrun == 1) then
		pUnit:SendChatMessage(14, 0, "Trajectory locked.")
		pUnit:PlaySoundToSet()
	else
		pUnit:SendChatMessage(14, 0, "Engage maximum speed.")
		pUnit:PlaySoundToSet()
	end
end

function Doomwalker_Earthquake(Unit, event)
	pUnit:CastSpellAoF(pUnit:GetX(), pUnit:GetY(), pUnit:GetZ(), 32686)
	local Earthquake = math.random(1,2)
	if(Earthquake == 1) then
		pUnit:SendChatMessage(14, 0, "Tectonic disruption commencing.")
		pUnit:PlaySoundToSet()
	else
		pUnit:SendChatMessage(14, 0, "Magnitude set. Release.")
		pUnit:PlaySoundToSet()
	end
end

function Doomwalker_Chain_Light(pUnit, event)
	pUnit:FullCastSpellOnTarget(28167, pUnit:GetRandomPlayer(7))
end

function Doomwalker_Enrage(pUnit, event)
	if((pUnit:GetHealthPct() < 20) and (Didthat == 0)) then
		pUnit:FullCastSpell(34670)
		Didthat = 1
	else
	end
end

RegisterUnitEvent(17711, 1, "DoomwalkerOnCombat")
RegisterUnitEvent(17711, 2, "DoomwalkerOnLeaveCombat")
RegisterUnitEvent(17711, 3, "DoomwalkerOnKilledTarget")
RegisterUnitEvent(17711, 4, "DoomwalkerOnDied")