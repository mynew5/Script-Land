--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team ; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2011 - 2013. ]]

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