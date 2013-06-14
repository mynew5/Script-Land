--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team ; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2011 - 2013. ]]

function Noreg_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("revenge", math.random(7000,14000), 0)
	pUnit:RegisterEvent("block", math.random(21000,28000), 0)
end

function revenge(pUnit, Event)
	pUnit:CastSpellOnTarget(19130, pUnit:GetClosestPlayer())
end

function block(pUnit, Event)
	pUnit:CastSpellOnTarget(12169, pUnit:GetClosestPlayer())
end

function Noreg_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents()
end

function Noreg_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(13447, 1, "Noreg_OnCombat")
RegisterUnitEvent(13447, 2, "Noreg_OnLeaveCombat")
RegisterUnitEvent(13447, 4, "Noreg_OnDied")