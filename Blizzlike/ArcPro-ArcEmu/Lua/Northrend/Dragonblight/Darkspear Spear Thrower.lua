--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DarkspearSpearThrower_OnCombat(Unit, Event)
	Unit:RegisterEvent("DarkspearSpearThrower_Net", 10000, 0)
	Unit:RegisterEvent("DarkspearSpearThrower_Throw", 5000, 0)
end

function DarkspearSpearThrower_Net(Unit, Event) 
	Unit:FullCastSpellOnTarget(12024, Unit:GetMainTank()) 
end

function DarkspearSpearThrower_Throw(Unit, Event) 
	Unit:FullCastSpellOnTarget(38556, Unit:GetMainTank()) 
end

function DarkspearSpearThrower_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DarkspearSpearThrower_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27560, 1, "DarkspearSpearThrower_OnCombat")
RegisterUnitEvent(27560, 2, "DarkspearSpearThrower_OnLeaveCombat")
RegisterUnitEvent(27560, 4, "DarkspearSpearThrower_OnDied")