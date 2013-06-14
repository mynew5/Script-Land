--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Teleporting_onUse(pUnit, Event, pMisc)
	pMisc:Teleport(530, 12804.165039, -6906.988281, 41.11567)
end

RegisterGameObjectEvent(455554, 2, "Teleporting_onUse")