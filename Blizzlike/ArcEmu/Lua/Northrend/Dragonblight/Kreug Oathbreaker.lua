--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function KreugOathbreaker_OnCombat(Unit, Event)
	Unit:RegisterEvent("KreugOathbreaker_Backbreaker", 12000, 0)
	Unit:RegisterEvent("KreugOathbreaker_BrokenOath", 13000, 0)
	Unit:RegisterEvent("KreugOathbreaker_InciteHorror", 14000, 0)
end

function KreugOathbreaker_Backbreaker(Unit, Event) 
	Unit:FullCastSpellOnTarget(53437, Unit:GetMainTank()) 
end

function KreugOathbreaker_BrokenOath(Unit, Event) 
	Unit:FullCastSpellOnTarget(56310) 
end

function KreugOathbreaker_InciteHorror(Unit, Event) 
	Unit:FullCastSpellOnTarget(53438, Unit:GetMainTank()) 
end

function KreugOathbreaker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function KreugOathbreaker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27105, 1, "KreugOathbreaker_OnCombat")
RegisterUnitEvent(27105, 2, "KreugOathbreaker_OnLeaveCombat")
RegisterUnitEvent(27105, 4, "KreugOathbreaker_OnDied")