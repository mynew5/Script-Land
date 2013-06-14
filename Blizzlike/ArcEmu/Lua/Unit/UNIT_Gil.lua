--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Recon; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function gil_Died(Unit, event, player)
	Unit:RemoveEvents()
end

function gil(Unit, event, player)
	Unit:RegisterEvent("gil_Say", 18000, 0)
end

function gil_Say(Unit, event, player)
local chance = math.random(1,6)
	if(chance == 1) then
		Unit:SendChatMessage(12, 0, "I wanna see the Mage Tower." )
	elseif(chance == 2) then
		Unit:SendChatMessage(12, 0, "Is it true? Are there crocolisks in the canal?")
	elseif(chance == 3) then
		Unit:SendChatMessage(12, 0, "Why do we always go the same way?")
	elseif(chance == 4) then
		Unit:SendChatMessage(12, 0, "Are we there yet?")
	elseif(chance == 5) then
		Unit:SendChatMessage(12, 0, "I have to pee.")
	elseif(chance == 6) then
		Unit:SendChatMessage(12, 0, "My feet hurt.")
	end
end

RegisterUnitEvent(3504, 18, "gil")
RegisterUnitEvent(3504, 4, "gil_Died")