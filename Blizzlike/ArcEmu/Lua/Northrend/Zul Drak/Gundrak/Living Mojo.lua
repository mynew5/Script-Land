--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: ArcEmu, n4xD; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Living_Mojo_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Living_Mojo_Mojo_Puddle", math.random(20000,23000), 0)
	pUnit:RegisterEvent("Living_Mojo_Mojo_Wave", math.random(27000,29000), 0)
end

function Living_Mojo_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Living_Mojo_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

function Living_Mojo_Mojo_Puddle(pUnit, Event)
	pUnit:FullCastSpell(55627)
end

function Living_Mojo_Mojo_Wave(pUnit, Event)
	pUnit:FullCastSpellOnTarget(55626, pUnit:GetRandomPlayer(0))
end

RegisterUnitEvent(29830, 1, "Living_Mojo_OnCombat")
RegisterUnitEvent(29830, 2, "Living_Mojo_OnLeaveCombat")
RegisterUnitEvent(29830, 4, "Living_Mojo_OnDeath")