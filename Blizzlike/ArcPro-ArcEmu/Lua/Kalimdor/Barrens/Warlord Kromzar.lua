--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function WarlordKromzar_OnCombat(Unit, Event)
	Unit:RegisterEvent("WarlordKromzar_CreateKromzarsBanner", 2000, 1)
	Unit:RegisterEvent("WarlordKromzar_Strike", 5000, 0)
end

function WarlordKromzar_CreateKromzarsBanner(Unit, Event) 
	Unit:CastSpell(13965) 
end

function WarlordKromzar_Strike(Unit, Event) 
	Unit:FullCastSpellOnTarget(11976, Unit:GetMainTank()) 
end

function WarlordKromzar_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WarlordKromzar_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(9456, 1, "WarlordKromzar_OnCombat")
RegisterUnitEvent(9456, 2, "WarlordKromzar_OnLeaveCombat")
RegisterUnitEvent(9456, 4, "WarlordKromzar_OnDied")