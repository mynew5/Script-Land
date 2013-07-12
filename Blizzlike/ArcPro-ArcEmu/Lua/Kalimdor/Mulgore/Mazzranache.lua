--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Mazzranache_OnCombat(Unit, Event)
	Unit:RegisterEvent("Mazzranache_DeadlyPoison", 10000, 0)
	Unit:RegisterEvent("Mazzranache_RushingCharge", 8000, 0)
end

function Mazzranache_DeadlyPoison(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(3538, pUnit:GetMainTank()) 
end

function Mazzranache_RushingCharge(pUnit, Event) 
	pUnit:CastSpell(6268) 
end

function Mazzranache_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Mazzranache_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3068, 1, "Mazzranache_OnCombat")
RegisterUnitEvent(3068, 2, "Mazzranache_OnLeaveCombat")
RegisterUnitEvent(3068, 4, "Mazzranache_OnDied")