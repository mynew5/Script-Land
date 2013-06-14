--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Tally/`Angel; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

local motherPhase = 0
local beamPhase = 0
local beamTimes = 1
local mother = 22947
local multiIntro = 0
local round = 1
local repeatAllow = 0
local beamAllow = 0
local aura = 0
local lashTime = math.random(30000,90000)
local attAllow = 0

function MotherIntro(pUnit, event)
	pUnit:SendChatMessage(14, 0, "So... business or pleasure?")
	pUnit:RegisterEvent("Mother_OnCombat", 1000, 0)
	motherPhase = 0
end

function Mother_OnCombat(pUnit, event)
	if(motherPhase == 0) then
		pUnit:FullCastSpellOnTarget(40879, pUnit)
		beamPhase = 1
		beamTimes = 1
		pUnit:RegisterEvent("Mother_BeamOne", 10000, 0)
		pUnit:RegisterEvent("Mother_Auras", 10000, 0)
		motherPhase = 1
	else
	end
end

function Mother_BeamOne(pUnit, event)
	if(beamPhase == 1) then
	beamAllow = 0
		pUnit:FullCastSpellOnTarget(40859, pUnit:GetMainTank())
		if(beamTimes == 1) then
			if(beamAllow == 0) then
				beamTimes = 2
				beamAllow = 1
				pUnit:SendChatMeesage(14, 0, "You seem a little tense...")
			end
		end
		if(beamTimes == 2) then
			if(beamAllow == 0) then
				beamTimes = 3
				beamAllow = 1
				pUnit:SendChatMeesage(14, 0, "Don't be shy.")
			end
		end	
		if(beamTimes == 3) then
			if(beamAllow == 0) then
				pUnit:SendChatMeesage(14, 0, "I'm all... yours.")
				beamPhase = 2
				pUnit:RemoveEvents()
				pUnit:RegisterEvent("Mother_BeamTwo", 10000, 0)
				beamAllow = 0
				pUnit:RegisterEvent("Mother_SaberLash", 30000, 0)
			end
		end
	end
end
	
function Mother_BeamTwo(pUnit, event)
	if(beamPhase == 2) then
		pUnit:FullCastSpellOnTarget(40860, pUnit:GetMainTank())
		beamAllow = 0
		if(beamTimes == 3) then
			if(beamAllow == 0) then
				beamTimes = 4
				beamAllow = 1
				pUnit:SendChatMeesage(14, 0, "You play, you pay.")
			end
		end
		if(beamTimes == 4) then
			if(beamAllow == 0) then
				beamTimes = 5
				beamAllow = 1
				pUnit:SendChatMeesage(14, 0, "I'm not impressed.")
			end
		end
		if(beamTimes == 5) then
			if(beamAllow == 0) then
				pUnit:SendChatMeesage(14, 0, "Enjoying yourselves?")
				beamPhase = 3
				pUnit:RemoveEvents()
				pUnit:RegisterEvent("Mother_BeamThree", 10000, 0)
				pUnit:RegisterEvent("Mother_SaberLash", 30000, 0)
				pUnit:RegisterEvent("Mother_FatalAttraction", 10, 0)
				beamAllow = 0
			end
		end
	end	
end
	
function Mother_BeamThree(pUnit, event)
	if(beamPhase == 3) then
		beamAllow = 0
		pUnit:FullCastSpellOnTarget(40861, pUnit:GetMainTank())
		repeatAllow = 0
		if(beamTimes == 5) then
			if(beamAllow == 0) then
				beamTimes = 6
				beamAllow = 1
				pUnit:SendChatMeesage(14, 0, "You seem a little tense...")
			end
		end
		if(beamTimes == 6) then
			if(beamAllow == 0) then
				pUnit:SendChatMeesage(14, 0, "Don't be shy.")
				beamTimes = 7
				beamAllow = 1
			end
		end
		if(beamTimes == 7) then
			if(beamAllow == 0) then
				pUnit:SendChatMeesage(14, 0, "I'm all... yours.")
				pUnit:RemoveEvents()
				pUnit:RegisterEvent("Mother_BeamFour", 10000, 0)
				pUnit:RegisterEvent("Mother_SaberLash", 30000, 0)
				beamAllow = 0
				beamPhase = 4
			end
		end
	end	
end

function Mother_BeamFour(pUnit, event)
	if(beamPhase == 4) then
		pUnit:FullCastSpellOnTarget(40827, pUnit:GetMainTank())
		repeatAllow = 0
		beamAllow = 0
		if(beamTimes == 7) then
			if(beamAllow == 0) then
				pUnit:SendChatMeesage(14, 0, "You play, you pay.")
				beamTimes = 8
				beamAllow = 1
			end
		end
		if(beamTimes == 8) then
			if(beamAllow == 0) then
				pUnit:SendChatMeesage(14, 0, "I'm not impressed.")
				beamTimes = 9
				beamAllow = 1
			end
		end
		if(beamTimes == 9) then
			if(beamAllow == 0) then
				pUnit:SendChatMeesage(14, 0, "Enjoying yourselves?")
				repeatAllow = 0
				pUnit:RemoveEvents()
				pUnit:RegisterEvent("Mother_RestartBeams", 1000, 0)
			end
		end
	end	
end

function Mother_RestartBeams(pUnit, event)
	if(repeatAllow == 0) then
		beamPhase = 1
		beamTimes = 1
		repeatAllow = 1
		pUnit:RegisterEvent("Mother_BeamOne", 10000, 0)
	end
end

function Mother_Auras(pUnit, event)
local aura = math.random(1,6)
	if(aura == 1) then
		pUnit:FullCastSpell(40880)
	elseif(aura == 2) then
		pUnit:FullCastSpell(40882)
	elseif(aura == 3) then
		pUnit:FullCastSpell(40883)
	elseif(aura == 4) then
		pUnit:FullCastSpell(40891)
	elseif(aura == 5) then
		pUnit:FullCastSpell(40896)
	elseif(aura == 6) then
		pUnit:FullCastSpell(40897)
	end
end

function Mother_SaberLash(pUnit, event)
	pUnit:FullCastSpellOnTarget(40810, pUnit:GetMainTank())
end

function motherLeave(pUnit, event)
	pUnit:SendChatMessage(14, 0, "I wasn't finished.")
	pUnit:RemoveEvents()
	motherPhase = 0
	beamPhase = 0
	beamTimes = 0
	pUnit:RemoveEvents()
end

function Mother_FatalAttraction(pUnit, event)
	if(attAllow == 0) then
		pUnit:SendChatMessage(14, 0, "Stop toying with my emotions!")
		pUnit:FullCastSpellOnTarget(40871, pUnit:GetMainTank())
		pUnit:FullCastSpellOnTarget(41001, pUnit:GetMainTank())
		attAllow = 1
	end
end

function Mother_OnTargetDied(pUnit, Event)
	if(math.random(1,2) == 1) then
		pUnit:SendChatMessage(14, 0, "Easy come, easy go.")
	else
		pUnit:SendChatMeesage(14, 0, "So much for a happy ending.")
	end
end

RegisterUnitEvent(mother, 3, "Mother_OnTargetDied")
RegisterUnitEvent(mother, 2, "motherLeave")
RegisterUnitEvent(mother, 1, "MotherIntro")
RegisterUnitEvent(mother, 4, "motherLeave")