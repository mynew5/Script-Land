--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function glommus_knockdown(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(11428, pUnit:GetClosestPlayer())
	end
end

function glommus_battle(pUnit, Event)
	pUnit:CastSpell(9128)
end

function glommus_demoralizing(pUnit, Event)
	pUnit:CastSpell(13730)
end

function glommus_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("glommus_battle", 2000, 1)
	pUnit:RegisterEvent("glommus_demoralizing", 3500, 1)
	pUnit:RegisterEvent("glommus_knockdown", 15000, 0)
end

function glommus_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2422, 1, "glommus_OnCombat")
RegisterUnitEvent(2422, 2, "glommus_OnLeaveCombat")