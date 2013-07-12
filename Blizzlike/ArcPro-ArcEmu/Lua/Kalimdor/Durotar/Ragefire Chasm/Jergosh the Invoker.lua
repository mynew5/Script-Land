--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function JergoshOnCombat(Unit, Event, Attacker)
	Unit:RegisterEvent(JergoshSpell1, 15000, 0)
	Unit:RegisterEvent(JergoshSpell2, 10000, 0)
end

function JergoshSpell1(Unit, Event, Attacker)
	Unit:FullCastSpellOnTarget(20800, Unit:GetMainTank())
end

function JergoshSpell2(Unit, Event, Attacker)
	Unit:FullCastSpellOnTarget(18267, Unit:GetMainTank())
end

RegisterUnitEvent(11518, 1, "JergoshOnCombat")