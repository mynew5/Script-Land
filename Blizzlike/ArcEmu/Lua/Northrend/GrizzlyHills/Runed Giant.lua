--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function RunedGiant_OnCombat(Unit, Event)
	Unit:RegisterEvent("RunedGiant_RuneFist", 3000, 1)
	Unit:RegisterEvent("RunedGiant_Stomp", 11000, 0)
end

function RunedGiant_RuneFist(Unit, Event) 
	Unit:CastSpell(49717) 
end

function RunedGiant_Stomp(Unit, Event) 
	Unit:CastSpell(55196) 
end

function RunedGiant_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RunedGiant_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26417, 1, "RunedGiant_OnCombat")
RegisterUnitEvent(26417, 2, "RunedGiant_OnLeaveCombat")
RegisterUnitEvent(26417, 4, "RunedGiant_OnDied")