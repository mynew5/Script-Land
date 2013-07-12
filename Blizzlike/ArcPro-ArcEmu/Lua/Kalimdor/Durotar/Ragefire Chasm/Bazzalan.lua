--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--TODO: Poison - 744

function BazzalanOnCombat(Unit, Event, Attacker)
	Unit:RegisterEvent(BazzalanSpell1, 15000, 0)
	Unit:RegisterEvent(BazzalanSpell2, 5000, 0)
end

function BazzalanSpell1(Unit, Event, Attacker)
	Unit:FullCastSpellOnTarget(14873, Unit:GetMainTank())
end

function BazzalanSpell2(Unit, Event, Attacker)
	local maintank = Unit:GetMainTank()
	maintank:AddAura(2818, 12000)
end

RegisterUnitEvent(11519, 1, "BazzalanOnCombat")