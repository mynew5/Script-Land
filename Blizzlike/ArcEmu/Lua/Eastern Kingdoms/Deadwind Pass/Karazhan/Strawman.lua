--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--[[Strawman yells: Don't let them make... a mattress outta' me.
Strawman yells: Now what should I do with you? I simply can't make up my mind.]]

function Strawman_Burning_Straw(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(31075, Unit:GetClosestPlayer())
end

function Strawman_Brain_Bash(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(31046, Unit:GetClosestPlayer())
end

function Strawman_OnEnterCombat(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Strawman_Burning_Straw", 10000, 0)
	Unit:RegisterEvent("Strawman_Brain_Bash", 17000, 0)
end

function Strawman_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Strawman_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(17543, 1, "Strawman_OnEnterCombat")
RegisterUnitEvent(17543, 2, "Strawman_OnLeaveCombat")
RegisterUnitEvent(17543, 4, "Strawman_OnDied")