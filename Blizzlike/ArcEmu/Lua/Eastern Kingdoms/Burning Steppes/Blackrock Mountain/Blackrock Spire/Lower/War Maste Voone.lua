--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function WMV_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Cleave", 7000, 0)
	pUnit:RegisterEvent("MortalStrike", 14000, 0)
	pUnit:RegisterEvent("Pummel", 21000, 0)
	pUnit:RegisterEvent("SnapKick", 28000, 0)
	pUnit:RegisterEvent("Thrash", 35000, 0)
	pUnit:RegisterEvent("ThrowAxe", 42000, 0)
	pUnit:RegisterEvent("Uppercut", 49000, 0)
end

function Uppercut(pUnit, Event)
	pUnit:CastSpellOnTarget(10966)
end

function ThrowAxe(pUnit, Event)
	pUnit:FullCastSpellOnTarget(16075)
end

function Trash(pUnit, Event)
	pUnit:CastSpell(3391)
end
function SnapKick(pUnit, Event)
	pUnit:CastSpellOnTarget(15618)
end

function Pummel(pUnit, Event)
	pUnit:CastSpellOnTarget(15615)
end

function MortalStrike(pUnit, Event)
	pUnit:CastSpellOnTarget(16856)
end

function Cleave(pUnit, Event)
	pUnit:CastSpellOnTarget(15284)
end

function WMV_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function WMV_OnDeath(pUnit, Event)
	pUnit:removeEvents()
end

RegisterUnitEvent(9237, 1, "WMV_OnCombat")
RegisterUnitEvent(9237, 2, "WMV_OnLeaveCombat")
RegisterUnitEvent(9237, 4, "WMV_OnDeath")