--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DukeVallenhal_OnCombat(Unit, Event)
	Unit:RegisterEvent("DukeVallenhal_BloodPresence", 1000, 1)
	Unit:RegisterEvent("DukeVallenhal_Bloodworm", 4000, 1)
end

function DukeVallenhal_BloodPresence(Unit, Event) 
	Unit:CastSpell(50689) 
end

function DukeVallenhal_Bloodworm(Unit, Event) 
	Unit:CastSpell(51879) 
end

function DukeVallenhal_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DukeVallenhal_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(26926, 1, "DukeVallenhal_OnCombat")
RegisterUnitEvent(26926, 2, "DukeVallenhal_OnLeaveCombat")
RegisterUnitEvent(26926, 4, "DukeVallenhal_OnDied")