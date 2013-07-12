--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Cyrukh_OnEnterCombat(Unit,Event)
	 Unit:GetMainTank()
	 Unit:GetAddTank()
	Unit:RegisterEvent("Cyrukh_Final", 0001, 0)
	Unit:RegisterEvent("Cyrukh_Trample", 10000, 0)
	Unit:RegisterEvent("Cyrukh_KnockAway", 22000, 0)
end

function Cyrukh_Final(Unit,Event)
	if(Unit:GetHealthPct() == 10) then
		Unit:RegisterEvent("Cyrukh_FinalSpell",  20000, 0)
	end
end

function Cyrukh_FinalSpell(Unit,Event)
	Unit:FullCastSpellOnTarget(39429, Unit:GetMainTank())
end

function Cyrukh_Trample(Unit,Event)
	Unit:FullCastSpellOnTarget(39425, Unit:GetMainTank())
end

function Cyrukh_KnockAway(Unit,Event)
	Unit:FullCastSpellOnTarget(18945, Unit:GetMainTank())
end

function Cyrukh_Death(Unit,Event)
	Unit:RemoveEvents()
end

function Cyrukh_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(21181, 1, "Cyrukh_OnEnterCombat")
RegisterUnitEvent(21181, 4, "Cyrukh_Death")
RegisterUnitEvent(21181, 2, "Cyrukh_OnLeaveCombat")