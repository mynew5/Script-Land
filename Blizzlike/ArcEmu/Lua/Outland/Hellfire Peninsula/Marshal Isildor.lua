--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function MarshalIsildor_Talk(pUnit, Event)
	pUnit:RemoveEvents()
	pUnit:SendChatMessage(12, 0, "Do you think that demons will play fair? These beasts are more savage than orcs and more cunning that the undead. Do not attempt to engage Legion by normal standards of war.")
end

function MarshalIsildor_Start(pUnit, Event)
	pUnit:RegisterEvent("MarshalIsildor_Talk", 15000, 0)
end

RegisterUnitEvent(19308, 6, "MarshalIsildor_Start")