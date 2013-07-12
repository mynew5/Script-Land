--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function Crowd_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Arcing_Smash", 7000, 0)
	pUnit:RegisterEvent("Crowd_Pummel", 14000, 0)
	pUnit:RegisterEvent("Trample", 21000, 0)
end

function Arcing_Smash(pUnit, Event)
local chance = math.random(1,2)
	if(chance == 1) then
		pUnit:CastSpellOnTarget(8374)
	elseif(chance == 2) then
		pUnit:CastSpellOnTarget(16169)
	end
end

function Crowd_Pummel(pUnit, Event)
	pUnit:CastSpellOnTarget(10887)
end

function Trample(pUnit, Event)
	pUnit:CastSpellOnTarget(5568)
end

function Crowd_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Crowd_OnDied(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(6229, 1, "Crowd_OnCombat")
RegisterUnitEvent(6229, 2, "Crowd_OnLeaveCombat")
RegisterUnitEvent(6229, 4, "Crowd_OnDied")