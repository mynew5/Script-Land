--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function AtophtheBloodcursed_OnCombat(Unit, Event)
	Unit:RegisterEvent("AtophtheBloodcursed_Rend", 10000, 0)
	Unit:RegisterEvent("AtophtheBloodcursed_Strike", 6000, 0)
end

function AtophtheBloodcursed_Rend(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11977, 	pUnit:GetMainTank()) 
end

function AtophtheBloodcursed_Strike(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11976, 	pUnit:GetClosestPlayer()) 
end

function AtophtheBloodcursed_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function AtophtheBloodcursed_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17715, 1, "AtophtheBloodcursed_OnCombat")
RegisterUnitEvent(17715, 2, "AtophtheBloodcursed_OnLeaveCombat")
RegisterUnitEvent(17715, 4, "AtophtheBloodcursed_OnDied")