--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SilverbrookDefender_OnCombat(Unit, Event)
	Unit:RegisterEvent("SilverbrookDefender_LumberjackSlam", 8000, 0)
	Unit:RegisterEvent("SilverbrookDefender_Rend", 10000, 0)
end

function SilverbrookDefender_LumberjackSlam(Unit, Event) 
	Unit:FullCastSpellOnTarget(52318, Unit:GetMainTank()) 
end

function SilverbrookDefender_Rend(Unit, Event) 
	Unit:FullCastSpellOnTarget(12054, Unit:GetMainTank()) 
end

function SilverbrookDefender_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SilverbrookDefender_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(27676, 1, "SilverbrookDefender_OnCombat")
RegisterUnitEvent(27676, 2, "SilverbrookDefender_OnLeaveCombat")
RegisterUnitEvent(27676, 4, "SilverbrookDefender_OnDied")