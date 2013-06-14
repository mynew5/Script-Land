--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function WarlordKolkanis_OnCombat(Unit, Event)
	Unit:RegisterEvent("WarlordKolkanis_Pummel", 5000, 0)
	Unit:RegisterEvent("WarlordKolkanis_Thunderclap", 7000, 0)
end

function WarlordKolkanis_Pummel(Unit, Event) 
	Unit:FullCastSpellOnTarget(12555, Unit:GetMainTank()) 
end

function WarlordKolkanis_Thunderclap(Unit, Event) 
	Unit:FullCastSpellOnTarget(8078, Unit:GetMainTank()) 
end

function WarlordKolkanis_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WarlordKolkanis_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5808, 1, "WarlordKolkanis_OnCombat")
RegisterUnitEvent(5808, 2, "WarlordKolkanis_OnLeaveCombat")
RegisterUnitEvent(5808, 4, "WarlordKolkanis_OnDied")