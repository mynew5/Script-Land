--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: AscendScripting; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DenVermin_OnCombat(Unit, Event)
	Unit:RegisterEvent("DenVermin_Thrash", 6000, 0)
end

function DenVermin_Thrash(Unit, Event) 
	Unit:FullCastSpellOnTarget(3391, Unit:GetMainTank()) 
end

function DenVermin_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DenVermin_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(24567, 1, "DenVermin_OnCombat")
RegisterUnitEvent(24567, 2, "DenVermin_OnLeaveCombat")
RegisterUnitEvent(24567, 4, "DenVermin_OnDied")