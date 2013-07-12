--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function Teleporting_onUse(pUnit, Event, pMisc)
	pMisc:Teleport(530, 12804.165039, -6906.988281, 41.11567)
end

RegisterGameObjectEvent(455554, 2, "Teleporting_onUse")