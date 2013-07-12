--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

--Lillith Nefara
function LillithNefara_onSpawn(Unit)
	Unit:SendChatMessage(12, 1, "You have disturbed my rest. Now face my wrath!")
end

RegisterUnitEvent(1946, 6, "LillithNefara_onSpawn")