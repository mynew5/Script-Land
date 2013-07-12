--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

--[[To Do: http://old.wowhead.com/zone=2597#npcs]]

--Aggi Rumblestomp
function Aggi_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("block", math.random(4000,7000), 0)
	pUnit:RegisterEvent("slam", math.random(14000,21000), 0)
end

function block(pUnit, Event)
	pUnit:CastSpell(12169)
end

function slam(pUnit, Event)
	pUnit:CastSpellOnTarget(15655, pUnit:GetClosestPlayer())
end

function Aggi_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Aggi_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(13086, 1, "Aggi_OnCombat")
RegisterUnitEvent(13086, 2, "Aggi_OnLeaveCombat")
RegisterUnitEvent(13086, 4, "Aggi_OnDied")

--Arch Druid Renferal
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

--Corporal Noreg Stormpike
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