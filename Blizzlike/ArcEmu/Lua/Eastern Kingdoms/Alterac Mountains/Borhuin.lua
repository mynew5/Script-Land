--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function borhuin_disarm(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(8379, pUnit:GetClosestPlayer())
	end
end

function borhuin_net(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(6533, pUnit:GetClosestPlayer())
	end
end

function borhuin_pummel(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(12555, pUnit:GetClosestPlayer())
	end
end

function borhuin_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("borhuin_disarm", 20000, 0)
	pUnit:RegisterEvent("borhuin_net", 38000, 0)
	pUnit:RegisterEvent("borhuin_pummel", 25000, 2)
end

function borhuin_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2431, 1, "borhuin_OnCombat")
RegisterUnitEvent(2431, 2, "borhuin_OnLeaveCombat")