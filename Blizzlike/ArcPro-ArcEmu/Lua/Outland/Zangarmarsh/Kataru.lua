--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Hellgawd; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Kataru_EnterCombat(pUnit, Event)
	pUnit:RegisterEvent("hittest_1", 1000, 0)
end

function hittest_1(pUnit, Event)
	if(pUnit:GetHealthPct() < 90) then
		pUnit:RemoveEvents()
		pUnit:FullCastSpellOnTarget(12058, pUnit:GetClosestPlayer())
		pUnit:RegisterEvent("hittest_2", 1000, 0)
	end
end

function hittest_2(pUnit, Event)
	if(pUnit:GetHealthPct() < 70) then
		pUnit:RemoveEvents()
		pUnit:CastSpell(32734)
		pUnit:RegisterEvent("hittest_3", 1000, 0)
	end
end

function hittest_3(pUnit, Event)
	if(pUnit:GetHealthPct() < 45) then
		pUnit:RemoveEvents()
		pUnit:FullCastSpell(15869)
		pUnit:RegisterEvent("hittest_4", 1000, 0)
	end
end

function hittest_4(pUnit, Event)
	if(pUnit:GetHealthPct() < 25) then
		pUnit:RemoveEvents()
		pUnit:FullCastSpellOnTarget(12058, pUnit:GetClosestPlayer())
	end
end

function Kataru_Start(pUnit, Event)
	pUnit:RegisterEvent("hittest_1", 1000, 0)
end

RegisterUnitEvent(18080, 1, "Kataru_Start")
RegisterUnitEvent(18080, 1, "Kataru_EnterCombat")