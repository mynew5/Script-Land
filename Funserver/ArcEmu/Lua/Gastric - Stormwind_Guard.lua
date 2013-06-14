--[[ Gastric - StormwindGuard.lua
This script makes stormwind city guards and patrollers yell
when a player enters combat with them. 
-- By Gastricpenguin ]]

function StormwindGuard_onAgro(pUnit, Event)
	pUnit:SendChatMessage (11, 0, "You there, halt!")
end
RegisterUnitEvent (68, 1, "StormwindGuard_onAgro")
RegisterUnitEvent (1423, 1, "StormwindGuard_onAgro")
RegisterUnitEvent (1756, 1, "StormwindGuard_onAgro")
RegisterUnitEvent (1976, 1, "StormwindGuard_onAgro")