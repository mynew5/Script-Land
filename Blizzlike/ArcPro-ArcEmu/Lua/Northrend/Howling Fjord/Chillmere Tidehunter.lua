--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ChillmereTidehunter_OnCombat(Unit, Event)
	Unit:RegisterEvent("ChillmereTidehunter_Net", 8000, 0)
	Unit:RegisterEvent("ChillmereTidehunter_Throw", 6000, 0)
end

function ChillmereTidehunter_Net(Unit, Event) 
	Unit:FullCastSpellOnTarget(6533, Unit:GetMainTank()) 
end

function ChillmereTidehunter_Throw(Unit, Event) 
	Unit:FullCastSpellOnTarget(38556, Unit:GetMainTank()) 
end

function ChillmereTidehunter_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ChillmereTidehunter_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(24460, 1, "ChillmereTidehunter_OnCombat")
RegisterUnitEvent(24460, 2, "ChillmereTidehunter_OnLeaveCombat")
RegisterUnitEvent(24460, 4, "ChillmereTidehunter_OnDied")