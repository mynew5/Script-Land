--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team ; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2011 - 2013. ]]

function Druid_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("roots", math.random(1000,0000), 0)
	pUnit:RegisterEvent("fire", math.random(7000,14000), 0)
	pUnit:RegisterEvent("rejuv", math.random(21000,28000), 0)
end

function roots(pUnit, Event)
	pUnit:CastSpellOnTarget(22127, pUnit:GetClosestPlayer())
end

function fire(pUnit, Event)
	pUnit:CastSpellOnTarget(22206)
end

function rejuv(pUnit, Event)
	pUnit:CastSpell(15981)
end

function Druid_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents()
end

function Druid_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(13442, 1, "Druid_OnCombat")
RegisterUnitEvent(13442, 2, "Druid_OnLeaveCombat")
RegisterUnitEvent(13442, 4, "Druid_OnDied")