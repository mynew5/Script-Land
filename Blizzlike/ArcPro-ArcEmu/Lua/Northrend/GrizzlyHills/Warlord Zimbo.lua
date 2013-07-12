--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]


function WarlordZimbo_OnCombat(Unit, Event)
	Unit:RegisterEvent("WarlordZimbo_SkullCrack", 8000, 0)
	Unit:RegisterEvent("WarlordZimbo_WarlordRoar", 2000, 1)
end

function WarlordZimbo_SkullCrack(Unit, Event) 
	Unit:FullCastSpellOnTarget(3551, Unit:GetMainTank()) 
end

function WarlordZimbo_WarlordRoar(Unit, Event) 
	Unit:CastSpell(52283) 
end

function WarlordZimbo_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WarlordZimbo_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26544, 1, "WarlordZimbo_OnCombat")
RegisterUnitEvent(26544, 2, "WarlordZimbo_OnLeaveCombat")
RegisterUnitEvent(26544, 4, "WarlordZimbo_OnDied")