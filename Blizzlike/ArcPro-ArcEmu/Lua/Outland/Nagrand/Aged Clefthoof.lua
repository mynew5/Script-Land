--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Performer/Performa; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function AgedClefthoof_Charge(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(32021, Unit:MainTank())
end

function AgedClefthoof(Unit, Event, MiscUnit, Misc)
	Unit:RegisterEvent("AgedClefthoof_Charge",10000,0)
end

function AgedClefthoof_Death(Unit)
    Unit:RemoveEvents()
end

function AgedClefthoof_OnLeaveCombat(Unit)
    Unit:RemoveEvents()
end

RegisterUnitEvent(17133, 1, "AgedClefthoof")	
RegisterUnitEvent(17133, 2, "AgedClefthoof_OnLeaveCombat")
RegisterUnitEvent(17133, 4, "AgedClefthoof_Death")