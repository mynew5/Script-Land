--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function TivaxtheBreaker_OnCombat(Unit, Event)
	Unit:RegisterEvent("TivaxtheBreaker_FireBlast", 5000, 0)
	Unit:RegisterEvent("TivaxtheBreaker_Scorch", 6000, 0)
end

function TivaxtheBreaker_FireBlast(Unit, Event) 
	Unit:FullCastSpellOnTarget(20795, Unit:GetMainTank()) 
end

function TivaxtheBreaker_Scorch(Unit, Event) 
	Unit:FullCastSpellOnTarget(13878, Unit:GetMainTank()) 
end

function TivaxtheBreaker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TivaxtheBreaker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26770, 1, "TivaxtheBreaker_OnCombat")
RegisterUnitEvent(26770, 2, "TivaxtheBreaker_OnLeaveCombat")
RegisterUnitEvent(26770, 4, "TivaxtheBreaker_OnDied")