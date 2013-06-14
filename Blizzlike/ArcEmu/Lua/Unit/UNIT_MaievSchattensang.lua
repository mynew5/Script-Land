--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Recon; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Maiev_Died(Unit, event, player)
	Unit:RemoveEvents()
end

function Maiev(Unit, event, player)
	Unit:RegisterEvent("Maiev_Say", 62000, 0)
end

function Maiev_Say(Unit, event, player)
	Unit:SendChatMessage(12, 0, "I've waited for this moment for years. Illidan and his lapdogs will be destroyed!!")
	Unit:SendChatMessage(12, 0, "You've sealed your fate, Akama. The Master will learn of your betrayal!")
end

RegisterUnitEvent(21699, 18, "Maiev")
RegisterUnitEvent(21699, 4, "Maiev_Died")