--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Hellgawd; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function UmbOrcale_OnKill(pUnit,Event)
	pUnit:RemoveEvents();
end

function UmbOrcale_EnterCombat(pUnit,Event)
	pUnit:RegisterEvent("hittest_1",1000, 0)
	pUnit:CastSpell(12550)
end

function hittest_1(pUnit, Event)
	if(pUnit:GetHealthPct() < 15) then
		pUnit:RemoveEvents();
		pUnit:CastSpell(26097)
	end
end

function UmbOrcale_Start(pUnit, Event)
	pUnit:RegisterEvent("hittest_1",1000, 0)
end

RegisterUnitEvent(18077, 1, "UmbOrcale_Start")
RegisterUnitEvent(18077, 3, "UmbOrcale_OnKill")
RegisterUnitEvent(18077, 1, "UmbOrcale_EnterCombat")