--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function StarsRestSentinel_OnCombat(Unit, Event)
	Unit:RegisterEvent("StarsRestSentinel_FrostArrow", 8000, 0)
	Unit:RegisterEvent("StarsRestSentinel_Shoot", 6000, 0)
end

function StarsRestSentinel_FrostArrow(Unit, Event) 
	Unit:FullCastSpellOnTarget(47059, Unit:GetMainTank()) 
end

function StarsRestSentinel_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(23337, Unit:GetMainTank()) 
end

function StarsRestSentinel_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function StarsRestSentinel_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26448, 1, "StarsRestSentinel_OnCombat")
RegisterUnitEvent(26448, 2, "StarsRestSentinel_OnLeaveCombat")
RegisterUnitEvent(26448, 4, "StarsRestSentinel_OnDied")