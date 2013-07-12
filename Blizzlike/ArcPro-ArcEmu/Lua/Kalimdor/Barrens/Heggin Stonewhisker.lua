--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function HegginStonewhisker_OnCombat(Unit, Event)
	Unit:RegisterEvent("HegginStonewhisker_FireShot", 9000, 0)
	Unit:RegisterEvent("HegginStonewhisker_Shoot", 6000, 0)
end

function HegginStonewhisker_FireShot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6979, Unit:GetMainTank()) 
end

function HegginStonewhisker_Shoot(Unit, Event) 
	Unit:FullCastSpellOnTarget(6660, Unit:GetMainTank()) 
end

function HegginStonewhisker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HegginStonewhisker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5847, 1, "HegginStonewhisker_OnCombat")
RegisterUnitEvent(5847, 2, "HegginStonewhisker_OnLeaveCombat")
RegisterUnitEvent(5847, 4, "HegginStonewhisker_OnDied")