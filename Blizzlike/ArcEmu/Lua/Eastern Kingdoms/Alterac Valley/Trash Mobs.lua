--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team ; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2011 - 2013. ]]

--Alterac Ram
function Ram_OnSpawn(pUnit, Event)
	pUnit:CastSpell(22838)
end

function Ram_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("charge", math.random(1000,0000), 0)
	pUnit:RegisterEvent("rend", math.random(8000,14000), 0)
end

function charge(pUnit, Event)
	pUnit:CastSpellOnTarget(22120)
end

function rend(pUnit, Event)
	pUnit:CastSpellOnTarget(13443, pUnit:GetClosestPlayer())
end

function Ram_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Ram_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(10990, 18, "Ram_OnSpawn")
RegisterUnitEvent(10990, 1, "Ram_OnCombat")
RegisterUnitEvent(10990, 2, "Ram_OnLeaveCombat")
RegisterUnitEvent(10990, 4, "Ram_OnDied")

--Alterac Yeti

function Yeti_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("breath", math.random(1000,0000), 0)
	pUnit:RegisterEvent("stomp", math.random(8000,15000), 0)
end

function breath(pUnit, Event)
	pUnit:FullCastSpellOnTarget(22479)
end

function stomp(pUnit, Event)
	pUnit:CastSpellOnTarget(16727, pUnit:GetClosestPlayer())
end

function Yeti_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Yeti_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(13959, 1, "Yeti_OnCombat")
RegisterUnitEvent(13959, 2, "Yeti_OnLeaveCombat")
RegisterUnitEvent(13959, 4, "Yeti_OnDied")