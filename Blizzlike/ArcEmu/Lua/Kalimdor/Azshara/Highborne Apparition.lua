--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function HighborneApparition_OnCombat(Unit, Event)
	Unit:RegisterEvent("HighborneApparition_Fear", 12000, 0)
end

function HighborneApparition_Fear(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12542, 	pUnit:GetMainTank()) 
end

function HighborneApparition_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HighborneApparition_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6116, 1, "HighborneApparition_OnCombat")
RegisterUnitEvent(6116, 2, "HighborneApparition_OnLeaveCombat")
RegisterUnitEvent(6116, 4, "HighborneApparition_OnDied")