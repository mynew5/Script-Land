--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function OldCrystalbark_OnCombat(Unit, Event)
	Unit:RegisterEvent("OldCrystalbark_ArcaneBreath", 8000, 0)
	Unit:RegisterEvent("OldCrystalbark_MarkofDetonation", 6000, 0)
end

function OldCrystalbark_ArcaneBreath(Unit, Event) 
	Unit:CastSpell(60903) 
end

function OldCrystalbark_MarkofDetonation(Unit, Event) 
	Unit:CastSpell(50506) 
end

function OldCrystalbark_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function OldCrystalbark_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(32357, 1, "OldCrystalbark_OnCombat")
RegisterUnitEvent(32357, 2, "OldCrystalbark_OnLeaveCombat")
RegisterUnitEvent(32357, 4, "OldCrystalbark_OnDied")