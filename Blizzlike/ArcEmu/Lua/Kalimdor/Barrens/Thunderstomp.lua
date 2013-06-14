--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Thunderstomp_OnCombat(Unit, Event)
	Unit:RegisterEvent("Thunderstomp_ChainedBolt", 6000, 0)
end

function Thunderstomp_ChainedBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(6254, Unit:GetMainTank()) 
end

function Thunderstomp_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Thunderstomp_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5832, 1, "Thunderstomp_OnCombat")
RegisterUnitEvent(5832, 2, "Thunderstomp_OnLeaveCombat")
RegisterUnitEvent(5832, 4, "Thunderstomp_OnDied")