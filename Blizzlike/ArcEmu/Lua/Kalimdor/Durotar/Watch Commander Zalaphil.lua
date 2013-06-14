--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function WatchCommanderZalaphil_OnCombat(Unit, Event)
	Unit:RegisterEvent("WatchCommanderZalaphil_DefensiveStance", 1000, 1)
	Unit:RegisterEvent("WatchCommanderZalaphil_ShieldBash", 8000, 0)
end

function WatchCommanderZalaphil_DefensiveStance(Unit, Event) 
	Unit:CastSpell(7164) 
end

function WatchCommanderZalaphil_ShieldBash(Unit, Event) 
	Unit:FullCastSpellOnTarget(72, Unit:GetMainTank()) 
end

function WatchCommanderZalaphil_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WatchCommanderZalaphil_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3192, 1, "WatchCommanderZalaphil_OnCombat")
RegisterUnitEvent(3192, 2, "WatchCommanderZalaphil_OnLeaveCombat")
RegisterUnitEvent(3192, 4, "WatchCommanderZalaphil_OnDied")