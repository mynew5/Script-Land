--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function WitherbarkBerserker_OnEnterCombat(Unit,Event)
local choice = math.random(1,2)
	if(choice == 1) then
		Unit:FullCastSpellOnTarget(4974, Unit:GetMainTank())
		Unit:RegisterEvent("Frenzy", 1000, 1)
	elseif(choice == 2) then
		Unit:RegisterEvent("Frenzy", 1000, 1)
	end
end

function Frenzy(Unit,Event)
	if(Unit:GetHealthPct() <= 290) then
		Unit:CastSpell(3019)
	end
end

function WitherbarkBerserker_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function WitherbarkBerserker_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2558, 1, "WitherbarkBerserker_OnEnterCombat")
RegisterUnitEvent(2558, 2, "WitherbarkBerserker_OnEnterCombat")
RegisterUnitEvent(2558, 4, "WitherbarkBerserker_OnDied")