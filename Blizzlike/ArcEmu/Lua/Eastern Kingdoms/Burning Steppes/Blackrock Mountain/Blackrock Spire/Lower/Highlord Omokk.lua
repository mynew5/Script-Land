--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--[[Omokk's head, when placed on a [Roughshod Pike], can be used to challenge Urok Doomhowl.]]--

function HO_OnCombat(pUnit, Event)
local combat = math.random(1,3)
	if(combat == 1) then
		pUnit:SendChatMessage(12, 0, "I'll crush you!")
	elseif(combat == 2) then
		pUnit:SendChatMessage(12, 0, "Me smash! You die!")
	elseif(combat == 3) then
		if(player:GetPlayerRace() == 1) then
			pUnit:SendChatMessage(12, 0, "Raaar!!! Me smash human!")
		elseif(player:GetPlayerRace() == 10) then
			pUnit:SendChatMessage(12, 0, "Raaar!!! Me smash blood elf!")
		else
			if(combat == 1) then
				pUnit:SendChatMessage(12, 0, "I'll crush you!")
			elseif(combat == 2 or 3) then
				pUnit:SendChatMessage(12, 0, "Me smash! You die!")
			end
		end
	end
	pUnit:RegisterEvent("Frenzy", 1100, 0)
	pUnit:RegisterEvent("KnockAway", 3100, 0)
end

function Frenzy(pUnit, Event)
	pUnit:CastSpell(8269)
end

function KnockAway(pUnit, Event)
	pUnit:CastSpellOnTarget(10101)
end

function HO_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function HO_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(9196, 1, "HO_OnCombat")
RegisterUnitEvent(9196, 2, "HO_OnLeaveCombat")
RegisterUnitEvent(9196, 4, "HO_OnDeath")