--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Ascendscripting; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SyndicateConjuror_OnSpawn(Unit, Event)
	Unit:FullCastSpell(43896)
	Unit:FullCastSpell(25085)
end

function SyndicateConjuror_OnEnterCombat(Unit, Event)
local VoidWalker = Unit:GetCreatureNearestCoords(Unit:GetX(), Unit:GetY(), Unit:GetZ(), 24476)
	VoidWalker:MoveTo(plr:GetX(), plr:GetY(), plr:GetZ())
	Unit:RegsiterEvent("ShadowBolt", 4000, 0)
	Unit:RegsiterEvent("Sleep", 23000, 0)
end

function ShadowBolt(Unit,Event)
	Unit:FullCastSpellOnTarget(9613, Unit:GetMainTank())
end

function Sleep(Unit,Event)
	Unit:FullCastSpellOnTarget(15970, Unit:GetMainTank())
end

function SyndicateConjuror_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function SyndicateConjuror_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2590, 18, "SyndicateConjuror_OnSpawn")
RegisterUnitEvent(2590, 1, "SyndicateConjuror_OnEnterCombat")
RegisterUnitEvent(2590, 2, "SyndicateConjuror_OnLeaveCombat")
RegisterUnitEvent(2590, 4, "SyndicateConjuror_OnDied")