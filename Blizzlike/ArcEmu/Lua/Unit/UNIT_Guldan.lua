--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Recon; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]
--[[Gul'dan says: Be silent! The shattering is soon to come!
Gul'dan says: Bear witness to the undeniable power of our dark master!
Gul'dan says: It... is... done...
Gul'dan says: Watch! See the ground shatter before us! Watch as the energy flows! It will feed our armies...
Gul'dan says: We will never be without power! I have secured our future! Bask in my glory!
Gul'dan says: With his gift, I shall raze this land and reform it!]]

function guldan_Died(Unit, event, player)
	Unit:RemoveEvents()
end

function guldan(Unit, event, player)
	Unit:RegisterEvent("guldan_Say",69000, 0)
end

function guldan_Say(Unit, event, player)
	Unit:SendChatMessage(12, 0, "Behold those who have power, and who are not afraid to wield it. Behold... the warlocks!")
end

RegisterUnitEvent(17008, 18, "guldan")
RegisterUnitEvent(17008, 4, "guldan_Died")