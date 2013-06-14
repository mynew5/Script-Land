--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function UnboundTrickster_OnCombat(Unit, Event)
	Unit:RegisterEvent("UnboundTrickster_FireBlast", 6000, 0)
	Unit:RegisterEvent("UnboundTrickster_Ignite", 8000, 0)
end

function UnboundTrickster_FireBlast(Unit, Event) 
	Unit:FullCastSpellOnTarget(13341, Unit:GetMainTank()) 
end

function UnboundTrickster_Ignite(Unit, Event) 
	Unit:FullCastSpellOnTarget(58438, Unit:GetMainTank()) 
end

function UnboundTrickster_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function UnboundTrickster_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(30856, 1, "UnboundTrickster_OnCombat")
RegisterUnitEvent(30856, 2, "UnboundTrickster_OnLeaveCombat")
RegisterUnitEvent(30856, 4, "UnboundTrickster_OnDied")