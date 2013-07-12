--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ECenturion_OnEnterCombat(Unit,Event)
	Unit:RegisterEvent("ECenturion_SpellBreaker", 18000, 0)
	Unit:RegisterEvent("ECenturion_Bloodheal", 1000, 0)
end

function ECenturion_SpellBreaker(Unit,Event)
	Unit:FullCastSpellOnTarget(35871, Unit:GetClosestPlayer())
end

function ECenturion_Bloodheal(Unit,Event)
	if(Unit:GetHealthPct() == 2) then
		Unit:CastSpell(36476)
	end
end

function ECenturion_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function ECenturion_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19792, 1, "ECenturion_OnEnterCombat")
RegisterUnitEvent(19792, 2, "ECenturion_OnLeaveCombat")
RegisterUnitEvent(19792, 4, "ECenturion_OnDied")