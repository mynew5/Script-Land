--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function SisterRiven_OnCombat(Unit, Event)
	UnitRegisterEvent("SisterRiven_FireShieldII", 1000, 1)
	UnitRegisterEvent("SisterRiven_FlameLash", 4000, 1)
	UnitRegisterEvent("SisterRiven_FlameSpike", 6000, 1)
end

function SisterRiven_FireShieldII(Unit, Event) 
	UnitCastSpell(184) 
end

function SisterRiven_FlameLash(Unit, Event) 
	UnitFullCastSpellOnTarget(3356, UnitGetMainTank()) 
end

function SisterRiven_FlameSpike(Unit, Event) 
	UnitCastSpell(6725) 
end

function SisterRiven_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function SisterRiven_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(5930, 1, "SisterRiven_OnCombat")
RegisterUnitEvent(5930, 2, "SisterRiven_OnLeaveCombat")
RegisterUnitEvent(5930, 4, "SisterRiven_OnDied")