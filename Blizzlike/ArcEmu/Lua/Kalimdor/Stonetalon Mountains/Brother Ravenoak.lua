--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function BrotherRavenoak_OnCombat(Unit, Event)
	UnitRegisterEvent("BrotherRavenoak_LowSwipe", 10000, 0)
	UnitRegisterEvent("BrotherRavenoak_Maul", 6000, 0)
end

function BrotherRavenoak_LowSwipe(Unit, Event) 
	UnitFullCastSpellOnTarget(8716, UnitGetMainTank()) 
end

function BrotherRavenoak_Maul(Unit, Event) 
	UnitFullCastSpellOnTarget(12161, UnitGetMainTank()) 
end

function BrotherRavenoak_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function BrotherRavenoak_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(5915, 1, "BrotherRavenoak_OnCombat")
RegisterUnitEvent(5915, 2, "BrotherRavenoak_OnLeaveCombat")
RegisterUnitEvent(5915, 4, "BrotherRavenoak_OnDied")