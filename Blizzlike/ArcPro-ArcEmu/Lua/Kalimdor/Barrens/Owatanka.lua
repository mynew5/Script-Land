--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Owatanka_OnCombat(Unit, Event)
	Unit:RegisterEvent("Owatanka_ChainedBolt", 6000, 0)
end

function Owatanka_ChainedBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(6254, Unit:GetMainTank()) 
end

function Owatanka_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Owatanka_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3473, 1, "Owatanka_OnCombat")
RegisterUnitEvent(3473, 2, "Owatanka_OnLeaveCombat")
RegisterUnitEvent(3473, 4, "Owatanka_OnDied")