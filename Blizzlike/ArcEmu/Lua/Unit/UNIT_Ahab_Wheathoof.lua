--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Recon; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Ahab_Died(Unit, event, player)
	Unit:RemoveEvents()
end

function Ahab(Unit, event, player)
	Unit:RegisterEvent("Ahab_Say", 15000, 0)
end

function Ahab_Say(Unit, event, player)
local chance = math.random(1,2)
	if(chance == 1) then
		Unit:SendChatMessage(12, 0, "Where is that dog?")
	else
		Unit:SendChatMessage(12, 0, "I miss my dog so much!")
	end
end

RegisterUnitEvent(23618, 18, "Ahab")
RegisterUnitEvent(23618, 4, "Ahab_Died")