--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Dmine_OnEnterCombat(Unit,Event)
	Unit:GetMainTank()
	Unit:CastSpell(5)
end

function Dmine_LeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function Dmine_OnDied(Unit,Event)
	Unit:FullCastSpellOnTarget(38108, Unit:GetMainTank())
end

RegisterUnitEvent(22315, 2, "Dmine_OnEnterCombat")
RegisterUnitEvent(22315, 2, "Dmine_LeaveCombat")
RegisterUnitEvent(22315, 4, "Dmine_OnDied")