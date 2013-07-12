--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Agathelos_OnCombat(pUnit, event)
	pUnit:RegisterEvent("Frenzy", 7000, 0)
	pUnit:RegisterEvent("Rushing", 14000, 0)
	pUnit:RegisterEvent("Rampage", 21000, 0)
	pUnit:RegisterEvent("Left", 28000, 0)
end

function Frenzy(pUnit, Event)
	pUnit:CastSpell(8269)
	pUnit:RegisterEvent("Frenzy", 7000, 0)
end

function Rushing(pUnit, Event)
	pUnit:CastSpell(8260)
	pUnit:RegisterEvent("Rushing", 14000, 0)
end

function Rampage(pUnit, Event)
	pUnit:CastSpellOnTarget(8285)
	pUnit:RegisterEvent("Rampage", 21000, 0)
end

function Left(pUnit, Event)
	pUnit:CastSpellOnTarget(8555)
	pUnit:RegisterEvent("Left", 28000, 0)
end

function Agathelos_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end

function Agathelos_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(4422, 1, "Agathelos_OnCombat")
RegisterUnitEvent(4422, 2, "Agathelos_OnLeaveCombat")
RegisterUnitEvent(4422, 4, "Agathelos_OnDeath")