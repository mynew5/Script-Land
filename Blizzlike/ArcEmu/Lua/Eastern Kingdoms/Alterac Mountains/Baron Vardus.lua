--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Ascendscripting; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Vardus_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("frostbolt", math.random(4000,7000), 0)
end

function frostbolt(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(20822, pUnit:GetClosestPlayer())
	end
end

function Vardus_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Vardus_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(2306, 1, "Vardus_OnCombat")
RegisterUnitEvent(2306, 2, "Vardus_OnLeaveCombat")
RegisterUnitEvent(2306, 4, "Vardus_OnDied")