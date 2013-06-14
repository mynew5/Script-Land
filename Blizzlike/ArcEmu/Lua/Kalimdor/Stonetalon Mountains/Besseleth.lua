--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Besseleth_OnCombat(Unit, Event)
	UnitRegisterEvent("Besseleth_VenomSting", 10000, 0)
	UnitRegisterEvent("Besseleth_Web", 12000, 0)
end

function Besseleth_VenomSting(Unit, Event) 
	UnitFullCastSpellOnTarget(5416, UnitGetMainTank()) 
end

function Besseleth_Web(Unit, Event) 
	UnitFullCastSpellOnTarget(745, UnitGetMainTank()) 
end

function Besseleth_OnLeaveCombat(Unit, Event) 
	UnitRemoveEvents() 
end

function Besseleth_OnDied(Unit, Event) 
	UnitRemoveEvents()
end

RegisterUnitEvent(11921, 1, "Besseleth_OnCombat")
RegisterUnitEvent(11921, 2, "Besseleth_OnLeaveCombat")
RegisterUnitEvent(11921, 4, "Besseleth_OnDied")