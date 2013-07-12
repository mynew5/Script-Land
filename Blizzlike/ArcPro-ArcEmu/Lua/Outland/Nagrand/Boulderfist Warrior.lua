--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Succy; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function BoulderfistWarrior_Charge(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(31994, Unit:MainTank())
end

function BoulderfistWarrior(Unit, Event, MiscUnit, Misc)
	Unit:RegisterEvent("BoulderfistWarrior_Charge", 10000, 0)
end

function BoulderfistWarrior_Death(Unit)
	Unit:RemoveEvents()
end

function BoulderfistWarrior_OnLeaveCombat(Unit)
	Unit:RemoveEvents()
end

RegisterUnitEvent(17136, 1,"BoulderfistWarrior")
RegisterUnitEvent(17136, 2, "BoulderfistWarrior_OnLeaveCombat")
RegisterUnitEvent(17136, 4, "BoulderfistWarrior_Death")