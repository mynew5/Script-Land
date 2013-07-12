--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: DARKI
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function Nandos_OnCombat(Unit, Event)
	Unit:SendChatMessage(14, 0, "I can't believe it! You've destroyed my pack... Now face my wrath!")
end

function Nandos_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Nandos_OnDied(Unit, Event)
	Unit:RemoveEvents()
end 

RegisterUnitEvent(3927, 1, "Nandos_OnCombat")
RegisterUnitEvent(3927, 2, "Nandos_OnLeaveCombat")
RegisterUnitEvent(3927, 4, "Nandos_OnDied")