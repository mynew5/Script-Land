--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: DARKI
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

--[[Transform player into a worgen
Unit:SendChatMessage(14, 0, "Release your rage!")
]]

--[[ Functions ]]
function Arugal_OnCombat(Unit, Event)
	--Unit:SendChatMessage(14, 0, "Who dares interfere with the Sons of Arugal?") --Send when 'Fenrus the Devourer' dies
	Unit:SendChatMessage(14, 0, "You too, shall serve!")
end

function Arugal_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Arugal_OnKilledTarget(Unit, Event)
    Unit:SendChatMessage(14, 0, "Another falls!")
end

function Arugal_OnDied(Unit, Event)
	Unit:RemoveEvents()
end 

RegisterUnitEvent(4275, 1, "Arugal_OnCombat")
RegisterUnitEvent(4275, 2, "Arugal_OnLeaveCombat")
RegisterUnitEvent(4275, 3, "Arugal_OnKilledTarget")
RegisterUnitEvent(4275, 4, "Arugal_OnDied")