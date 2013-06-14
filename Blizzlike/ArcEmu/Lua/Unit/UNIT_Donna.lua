--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Recon; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function donna_Died(Unit, event, player)
	Unit:RemoveEvents()
end

function donna(Unit, event, player)
	Unit:RegisterEvent("donna_Say", 45000, 0)
end

function donna_Say(Unit, event, player)
local chance = math.random(1,3)
	if(chance == 1) then
		Unit:SendChatMessage(12, 0, "Hey you, did you see my puppy?")
	elseif(chance == 2) then
		Unit:SendChatMessage(12, 0, "Guard ? Can you find my puppy for me?")
	else
		Unit:SendChatMessage(12, 0, "Hmmm ... Where is my puppy?")
	end
end

RegisterUnitEvent(2532, 18, "donna")
RegisterUnitEvent(2532, 4, "donna_Died")