--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Hellgawd; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function UmbSeer_OnEnterCombat(pUnit,Event)
	pUnit:SendChatMessage(12, 0, "You will not unbind the slaves!")
end

function UmbSeer_OnLeaveCombat(pUnit,Event)
	pUnit:RemoveEvents()
end

function UmbSeer_OnDied(pUnit,Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(18042, 1, "UmbSeer_OnEnterCombat")
RegisterUnitEvent(18042, 2, "UmbSeer_OnLeaveCombat")
RegisterUnitEvent(18042, 4, "UmbSeer_OnDied")