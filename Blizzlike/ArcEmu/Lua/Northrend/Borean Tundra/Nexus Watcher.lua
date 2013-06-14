--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function NexusWatcher_OnCombat(Unit, Event)
	Unit:RegisterEvent("NexusWatcher_IntangiblePresence", 10000, 0)
	Unit:RegisterEvent("NexusWatcher_Netherbreath", 7500, 0)
end

function NexusWatcher_IntangiblePresence(Unit, Event) 
	Unit:CastSpell(36513) 
end

function NexusWatcher_Netherbreath(Unit, Event) 
	Unit:CastSpell(36631) 
end

function NexusWatcher_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function NexusWatcher_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(24770, 1, "NexusWatcher_OnCombat")
RegisterUnitEvent(24770, 2, "NexusWatcher_OnLeaveCombat")
RegisterUnitEvent(24770, 4, "NexusWatcher_OnDied")