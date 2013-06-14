--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Hellgawd; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function bloodthirstymarsh_OnKill(pUnit, Event)
	pUnit:RemoveEvents();
end

function bloodthirstymarsh_EnterCombat(pUnit, Event)
	pUnit:RegisterEvent("hittest_1",1000, 0)
end

function hittest_1(pUnit, Event)
	if(pUnit:GetManaPct() < 30) then
		pUnit:RemoveEvents();
		pUnit:FullCastSpellOnTarget(17008, pUnit:GetClosestPlayer())
		pUnit:RegisterEvent("hittest_2",1000, 0)
	end
end

function hittest_2(pUnit, Event)
	if(pUnit:GetHealthPct() < 65) then
		pUnit:RemoveEvents();
		pUnit:FullCastSpellOnTarget(17008, pUnit:GetClosestPlayer())
		pUnit:RegisterEvent("hittest_3",1000, 0)
	end
end

function hittest_3(pUnit, Event)
	if(pUnit:GetHealthPct() < 45) then
		pUnit:RemoveEvents();
		pUnit:FullCastSpellOnTarget(17008, pUnit:GetClosestPlayer())
		pUnit:RegisterEvent("hittest_4",1000, 0)
	end
end

function hittest_4(pUnit, Event)
	if(pUnit:GetHealthPct() < 10) then
		pUnit:RemoveEvents();
		pUnit:FullCastSpellOnTarget(35333, pUnit:GetClosestPlayer())
	end
end

function bloodthirstymarsh_Start(pUnit, Event)
	pUnit:RegisterEvent("hittest_1", 1000, 0)
end

RegisterUnitEvent(20196, 1, "bloodthirstymarsh_Start")
RegisterUnitEvent(20196, 3, "bloodthirstymarsh_OnKill")
RegisterUnitEvent(20196, 1, "bloodthirstymarsh_EnterCombat")