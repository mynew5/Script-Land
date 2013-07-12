--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Succy; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Bouldertfistmage_Frostbolt(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(9672, Unit:MainTank())
end

function Bouldertfistmage_Fireblast(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpell(20795)
end

function Bouldertfistmage_Bloodlust(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpell(6742)
end

function Bouldertfistmage(Unit, Event, MiscUnit, Misc)
	Unit:RegisterEvent("Bouldertfistmage_Frostbolt", 15000, 0)
	Unit:RegisterEvent("Bouldertfistmage_Fireblast", 50000, 0)
	Unit:RegisterEvent("Bouldertfistmage_Bloodlust", 20000, 0)
end

function Bouldertfistmage_Death(Unit)
	Unit:RemoveEvents()
end

function Bouldertfistmage_OnLeaveCombat(Unit)
	Unit:RemoveEvents()
end

RegisterUnitEvent(17137, 2, "Bouldertfistmage_OnLeaveCombat")
RegisterUnitEvent(17137, 4, "Bouldertfistmage_Death")
RegisterUnitEvent(17137, 1, "Bouldertfistmage")