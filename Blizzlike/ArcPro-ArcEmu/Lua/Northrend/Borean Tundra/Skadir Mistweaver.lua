--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SkadirMistweaver_OnCombat(Unit, Event)
	Unit:RegisterEvent("SkadirMistweaver_MistofStrangulation", 8000, 0)
end

function SkadirMistweaver_MistofStrangulation(Unit, Event) 
	Unit:FullCastSpellOnTarget(49816, Unit:GetMainTank()) 
end

function SkadirMistweaver_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SkadirMistweaver_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25613, 1, "SkadirMistweaver_OnCombat")
RegisterUnitEvent(25613, 2, "SkadirMistweaver_OnLeaveCombat")
RegisterUnitEvent(25613, 4, "SkadirMistweaver_OnDied")