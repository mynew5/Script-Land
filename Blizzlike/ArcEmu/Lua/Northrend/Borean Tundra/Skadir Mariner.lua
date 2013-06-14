--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SkadirMariner_OnCombat(Unit, Event)
	Unit:RegisterEvent("SkadirMariner_DemoralizingShout", 2000, 2)
	Unit:RegisterEvent("SkadirMariner_Uppercut", 8000, 0)
end

function SkadirMariner_DemoralizingShout(Unit, Event) 
	Unit:CastSpell(13730) 
end

function SkadirMariner_Uppercut(Unit, Event)
	Unit:FullCastSpellOnTarget(10966, Unit:GetMainTank())
end

function SkadirMariner_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SkadirMariner_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25523, 1, "SkadirMariner_OnCombat")
RegisterUnitEvent(25523, 2, "SkadirMariner_OnLeaveCombat")
RegisterUnitEvent(25523, 4, "SkadirMariner_OnDied")