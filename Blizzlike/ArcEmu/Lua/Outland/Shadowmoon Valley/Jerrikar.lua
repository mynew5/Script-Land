--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Jerrikar_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("Jerrikar_DarkStrike", 4000, 0)
	Unit:RegisterEvent("Jerrikar_DiplomaticImmunity", 40000, 0)
	Unit:RegisterEvent("Jerrikar_Silence", 30000, 0)
end

function Jerrikar_Silence(Unit,Event)
	Unit:FullCastSpellOnTarget(38913,GetClosestPlayer())
end

function Jerrikar_DarkStrike(Unit,Event)
	Unit:FullCastSpellOnTarget(38926,GetClosestPlayer())
end

function Jerrikar_DiplomaticImmunity(Unit,Event)
	Unit:FullCastSpellOnTarget(38916,GetClosestPlayer())
end

function Jerrikar_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function Jerrikar_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(18695, 1, "Jerrikar_OnEnterCombat")
RegisterUnitEvent(18695, 2, "Jerrikar_OnLeaveCombat")
RegisterUnitEvent(18695, 4, "Jerrikar_OnDied")