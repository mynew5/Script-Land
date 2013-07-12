--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

local cry_delay = 100000
local announces = {}
local announcei = 3
local choice = 1

announces[1] = "It put the mutton in the stomach!"
announces[2] = "WHY IT PUT DA BOOTERANG ON DA SKIN?! WHY?!"
announces[3] = "You is bad orc... baaad... or... argh!"

function DragonmawPeon_Random_Tick(Unit, Event)
   choice = math.random(1, announcei)
   Unit:SendChatMessage(12, 0, announces[choice])
end

function DragonmawPeon_Random_Setup(Unit, Event)
   Unit:RegisterEvent("DragonmawPeon_Random_Tick", cry_delay, 0)
end

function DShaman_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("DShaman_LShield", 20000, 0)
	Unit:RegisterEvent("DShaman_Bloodlust", 33000, 0)
end

function DShaman_LShield(Unit,Event)
	Unit:CastSpell(12550)
end

function DShaman_Bloodlust(Unit,Event)
	Unit:CastSpell(6742)
end

function DShaman_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

function DShaman_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(22252, 1, "DShaman_OnEnterCombat")
RegisterUnitEvent(22252, 2, "DShaman_OnLeaveCombat")
RegisterUnitEvent(22252, 3, "DShaman_OnDied")
RegisterUnitEvent(22252, 6, "DragonmawPeon_Random_Setup")