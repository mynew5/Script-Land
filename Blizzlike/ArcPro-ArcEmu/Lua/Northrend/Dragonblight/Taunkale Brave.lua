--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function TaunkaleBrave_OnCombat(Unit, Event)
	Unit:RegisterEvent("TaunkaleBrave_GroundSlam", 7000, 0)
end

function TaunkaleBrave_GroundSlam(Unit, Event) 
	Unit:CastSpell(52058) 
end

function TaunkaleBrave_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TaunkaleBrave_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26157, 1, "TaunkaleBrave_OnCombat")
RegisterUnitEvent(26157, 2, "TaunkaleBrave_OnLeaveCombat")
RegisterUnitEvent(26157, 4, "TaunkaleBrave_OnDied")