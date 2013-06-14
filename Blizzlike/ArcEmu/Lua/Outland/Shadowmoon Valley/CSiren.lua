--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function CSiren_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("CSiren_Spell1", 20000, 0)
	Unit:RegisterEvent("CSiren_Spell2", 6000, 0)
end

function CSiren_Spell1(Unit,Event)
	Unit:FullCastSpellOnTarget(38026, Unit:GetClosestPlayer())
end

function CSiren_Spell2(Unit,Event)
	Unit:FullCastSpellOnTarget(32011, Unit:GetClosestPlayer())
end

function CSiren_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function CSiren_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19768,1,"CSiren_OnEnterCombat")
RegisterUnitEvent(19768,2,"CSiren_OnLeaveCombat")
RegisterUnitEvent(19768,4,"CSiren_OnDied")