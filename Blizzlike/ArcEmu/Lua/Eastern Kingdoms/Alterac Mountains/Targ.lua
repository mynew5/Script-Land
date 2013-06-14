--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function targ_cleave(pUnit, Event)
	if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:FullCastSpellOnTarget(15496, pUnit:GetClosestPlayer())
	end
end

function targ_thunderclap(pUnit, Event)
	pUnit:CastSpell(8147)
end

function targ_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("targ_cleave", 25000, 0)
	pUnit:RegisterEvent("targ_thunderclap", 10000, 0)
end

function targ_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(2420, 1, "targ_OnCombat")
RegisterUnitEvent(2420, 2, "targ_OnLeaveCombat")