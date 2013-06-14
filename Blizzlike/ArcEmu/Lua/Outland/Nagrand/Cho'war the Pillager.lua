--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Performer; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ChoWar_OnEnterCombat(Unit, Event)
    Unit:RegisterUnitEvent("ChoWar_BattleShout", 200000, 0)
	Unit:RegisterUnitEvent("ChoWar_Charge", 40000, 0)
	Unit:RegisterUnitEvent("ChoWar_MortalStrike", 7000, 0)
	Unit:RegisterUnitEvent("ChoWar_SunderingCleave", 4000, 0)
end

function ChoWar_BattleShout(Unit, Event)
    Unit:FullCastSpell(31403)
end

function ChoWar_Charge(Unit, Event)
    Unit:FullCastSpellOnTarget(32323, Unit:GetClosestPlayer())
end

function ChoWar_MortalStrike(Unit, Event)
    Unit:FullCastSpell(15708)
end

function ChoWar_SunderingCleave(Unit, Event)
    Unit:FullCastSpell(17963)
end

function ChoWar_OnLeaveCombat(Unit, Event)
    Unit:RemoveEvents()
end

function ChoWar_OnDied(Unit, Event)
    Unit:RemoveEvents()
end

RegisterUnitEvent(18423, 1, "ChoWar_OnEnterCombat")
RegisterUnitEvent(18423, 2, "ChoWar_OnLeaveCombat")
RegisterUnitEvent(18423, 3, "ChoWar_OnDied")