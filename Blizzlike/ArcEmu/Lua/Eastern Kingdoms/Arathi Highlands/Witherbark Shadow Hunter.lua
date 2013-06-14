--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function WitherbarkShadowHunter_OnEnterCombat(Unit,Event)
local choice = math.random(1,2)
	if(choice == 1) then
		Unit:FullCastSpellOnTarget(7646, Unit:GetMainTank())
		Unit:RegisterEvent("Pain", 1000, 1)
		Unit:RegisterEvent("Silence", 15000, 4)
	elseif(choice == 2) then
		Unit:RegisterEvent("Pain", 1000, 1)
		Unit:RegisterEvent("Silence", 15000, 4)
	end
end

function Pain(Unit,Event)
	if(Unit:GetHealthPct() <= 29) then
		Unit:FullCastSpellOnTarget(992, Unit:GetMainTank())
	end
end

function Silence(Unit,Event)
	Unit:FullCastSpellOnTarget(6726, Unit:GetMainTank())
end

function WitherbarkShadowHunter_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function WitherbarkShadowHunter_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(2557, 1, "WitherbarkShadowHunter_OnEnterCombat")
RegisterUnitEvent(2557, 2, "WitherbarkShadowHunter_OnLeaveCombat")
RegisterUnitEvent(2557, 4, "WitherbarkShadowHunter_OnDied")