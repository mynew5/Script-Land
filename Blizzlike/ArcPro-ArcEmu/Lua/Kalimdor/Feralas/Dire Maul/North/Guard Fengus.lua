--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Fengus_OnCombat(Unit, Event)
local chance = math.random(1,3)
local race = player:GetPlayerRace()
	if (chance == 1) then
		Unit:SendChatMessage(12, 0, "I'll crush you!")
	elseif (chance == 2) then
		Unit:SendChatMessage(12, 0, "Me smash! You die!")
	elseif (chance == 3) then
		if (race == 10) then
			Unit:SendChatMessage(12, 0, "Raaar!!! Me smash blood elf!")
		elseif (race == 4) then
			Unit:SendChatMessage(12, 0, "Raaar!!! Me smash night elf!")
		elseif (race == 6) then
			Unit:SendChatMessage(12, 0, "Raaar!!! Me smash tauren!")
	end
end
	Unit:RegisterEvent("Charge", 7000, 0)
	Unit:RegisterEvent("Bash", 14000, 0)
	Unit:RegisterEvent("Ferocity", 21000, 0)
	Unit:RegisterEvent("Frenzy", 28000, 0)
	Unit:RegisterEvent("Strike", 35000, 0)
end

function Charge(pUnit, Event) 
	pUnit:CastSpellOnTarget(15749, pUnit:GetMainTank()) 
end

function Bash(pUnit, Event) 
	pUnit:CastSpellOnTarget(11972, pUnit:GetRandomPlayer()) 
end

function Ferocity(pUnit, Event) 
	pUnit:CastSpell(22817) 
end

function Frenzy(pUnit, Event) 
	pUnit:CastSpell(8269) 
end

function Strike(pUnit, Event) 
	pUnit:CastSpellOnTarget(14516, pUnit:GetRandomPlayer()) 
end

function Fengus_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Fengus_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14321, 1, "Fengus_OnCombat")
RegisterUnitEvent(14321, 2, "Fengus_OnLeaveCombat")
RegisterUnitEvent(14321, 4, "Fengus_OnDied")