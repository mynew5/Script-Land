--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function WarlordKrellian_OnCombat(Unit, Event)
	Unit:RegisterEvent("WarlordKrellian_DemoralizingRoar", 8000, 0)
	Unit:RegisterEvent("WarlordKrellian_Strike", 6000, 0)
end

function WarlordKrellian_DemoralizingRoar(pUnit, Event) 
	pUnit:CastSpell(10968) 
end

function WarlordKrellian_Strike(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11976, 	pUnit:GetMainTank()) 
end

function WarlordKrellian_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WarlordKrellian_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(8408, 1, "WarlordKrellian_OnCombat")
RegisterUnitEvent(8408, 2, "WarlordKrellian_OnLeaveCombat")
RegisterUnitEvent(8408, 4, "WarlordKrellian_OnDied")